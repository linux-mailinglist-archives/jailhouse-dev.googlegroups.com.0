Return-Path: <jailhouse-dev+bncBCJI7SMNV4NBBSNYRLUAKGQE277ICBA@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-wr1-x440.google.com (mail-wr1-x440.google.com [IPv6:2a00:1450:4864:20::440])
	by mail.lfdr.de (Postfix) with ESMTPS id 01AC944B69
	for <lists+jailhouse-dev@lfdr.de>; Thu, 13 Jun 2019 20:56:10 +0200 (CEST)
Received: by mail-wr1-x440.google.com with SMTP id w11sf10649wrl.7
        for <lists+jailhouse-dev@lfdr.de>; Thu, 13 Jun 2019 11:56:09 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1560452169; cv=pass;
        d=google.com; s=arc-20160816;
        b=XKeN2nExsqdHmAZTiflmE0haq/8f2EVPFL0MUAfT9hy5JbhdqtwL+iVI1zaTQC+JDa
         LlQYh4Hi7xKoog9zM5N20Ydx42a9zcy9cb+MqucXvk45UIOkBIBrQ6rXY/cpH/XF1f6F
         dyugCmijUjFoIYJ8un9OGBwkwfOHRQEEG7IJc9NCGlFMd5duUDdfcrv/y/F6QILQp3xJ
         87cZOFnEgAveeIEJ5v4ltD6DtlVvfaCO04lcecP/ukRoNOnkF+/jb7lxxz/VvHDh6cZ1
         Ip0H0dEaJx70NCkSTbFGgQdRDw+z9z5P7LK+d9WqobKwPadwMEqkVdY1MplZ0EKeOibe
         nJ4w==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:content-language:in-reply-to
         :mime-version:user-agent:date:message-id:from:references:to:subject
         :sender:dkim-signature;
        bh=kesyWaXDJscrNyRbBAuuGjHTy2WnSXLgufiydstCijI=;
        b=jn3jO47y9ry2PsbggJX18FM2kU2iAOjfnjVg+5riaNzP/SoaGd9qbniZOzuHOg0dsR
         lU35tEbjKL6wtB2vpg0wpUKqg4jFcXAPtTJd1cq1wdnHiEWxZvZ6usDnwYYU+iAk4i9B
         KGwloDSGuJ+11kEAORruOKipkPAJhpIUEtH8s1dyskqAFymdLKzyYi9H0XGne/6UBqCe
         V2jUlKm4chzBvCNKyyDb9LByRPjbTLZnnN0efeLBUndkDkP09o2FfEANacW0Aad6Cien
         nNuHtP2cmGMb7lhu+XafqPY9b7n3IaFG1r8uyEC8gFQBJz+X6qXube6G4FLbK71niVhB
         kbvA==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.28 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:subject:to:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :list-post:list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=kesyWaXDJscrNyRbBAuuGjHTy2WnSXLgufiydstCijI=;
        b=MBd1LqFsulZZ+z7D993UiSKwmNbfYlB6F7O7dO/Fc5GZSRjUI6vsFsmtEF+6p4/PgZ
         NanhPo8Q0FNPevI15VfUxjDqEX9BlatT0o5zLNxP5HkfYMoJ0seHX2nMKnTyZPR1LxdS
         MFhdVEA8SixnZ4I0Bml4BI9fM9Xk5VysfqhzUFkVxcEXzfBpQgEc00h2yWwJpb6IYyWz
         AMTowt2nCm2zXS4UKBu97pim/sCADziruLbxcPg80HfyPq/NMdvSMZqBBAItC2JSTCJv
         V2l7RUGHwz3N4IBEJGiFIArCUnKg6Cm76TfITwJxuP43J5bpIr2Gc2R3dmku5jw2HBq0
         do4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:subject:to:references:from:message-id
         :date:user-agent:mime-version:in-reply-to:content-language
         :x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:x-spam-checked-in-group:list-post:list-help
         :list-archive:list-subscribe:list-unsubscribe;
        bh=kesyWaXDJscrNyRbBAuuGjHTy2WnSXLgufiydstCijI=;
        b=B3mXU6lnRICQYY232koRqoLElvv6ve/S3AHViUUEYjy00r8r8sQJa9xN1kX0jUGzDd
         vHUp7xvwgzLm2Bq0t2xtjfNvUekLDNkRSRYajEWR+4ziCRLlaGv5JEawN69CyFVoEFDy
         Slf0SHmLaM2tWRxT7nNr7EjnXJXqM5+461dDPNqahVZeboKibBxpM/uL6bTp155YauSl
         AS/Kd1S6Doooeq34Tbkijsf6bIfg8L7hrgfHClUKx3TwAYq0oHb2Y66WkUkI99Arq8QL
         pFJDnznIToAGLIDr/38EfAhefDzXBxIitYLei4vgnSCuQDmtlCbPJV0HRFCfRNfjGLpY
         gF1Q==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: APjAAAVeICWuIJjfBhXQllbC/K0fxB0YBPk3O/o8awWE3Ld26wqPG2kj
	jmCjOABY/khSlStiJLSW8jM=
X-Google-Smtp-Source: APXvYqwzvUVR+87IAAsdDNcrWaWu/DW3KE7vWHIcoKN0bk9RERKoFV3av5edXAPRf1zGEmeLwXXwOw==
X-Received: by 2002:adf:b605:: with SMTP id f5mr1447183wre.305.1560452169718;
        Thu, 13 Jun 2019 11:56:09 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:adf:dfc1:: with SMTP id q1ls1612504wrn.16.gmail; Thu, 13 Jun
 2019 11:56:09 -0700 (PDT)
X-Received: by 2002:adf:deca:: with SMTP id i10mr6124394wrn.313.1560452169093;
        Thu, 13 Jun 2019 11:56:09 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1560452169; cv=none;
        d=google.com; s=arc-20160816;
        b=gMiMkif8FUQ2eIEoNIpjTBV4kgJaNvrLYjcXEWMxj9kI5ysFvf89C64a+5HXVzMuZR
         9lfYBUWiSCg7n6kpZ0k4BovTwjSa6aAaV+O3zJHAe7dnTzG4K6QKeTL4vsETIQfo8L7Q
         84zvuJG2f2s44OUmHerkCTQuFETYiBZCZ4+nP62wakTh4Aib7YHUuVT0I/yr4/o4em5b
         xuz/gLy7zi9VQA7/AgqTAE6pxT56Et+q5srCG5OqPoPaDjjI39E69pQ4kOeY89PU1x0i
         IpFRviQWDHBZ5f/EJ3S6zAVq1p4nItSis/HAebLyklkr/59TdY7pvOzCrf+V0QJBOxh5
         5dEA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:to:subject;
        bh=qyp/8oBVUVzLVXJytPURLHs4/jYCFu4Yjksm2xwbq8c=;
        b=0aj6cAGTmXw6kHRx1J/xbgAi7+U+KmhIwlBVMDkkATOOXnp7bgz2jcmqT++yhCU3Te
         fAQRqBijJsRmQTV1X0+J2N95a4aPuzJ1jwCMkGLf6HLRFOy+P+2yOGdooZWeqAYSvKWk
         ufLJc03RaZ5LcnXU7SkVKpDqXwGRlHeYvzv03Fw7nzIlFTpWdzCa3ByG/bU+hcmmhhUr
         usRh6CwyNsaxLlsR/TrDu/5y+xZ9Z0N3gTzZ3bbcOX+HfqeWKJV1Lq7GRGA+F/B8Z6rw
         czTa50LVIbrSIv2fkEfMmhHGWW2CWPIFYsnCXLu9RbjHuMtr/RvQOXlUAl5GaNT7Y3v5
         JCqA==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.28 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
Received: from goliath.siemens.de (goliath.siemens.de. [192.35.17.28])
        by gmr-mx.google.com with ESMTPS id h10si49452wrv.3.2019.06.13.11.56.09
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 13 Jun 2019 11:56:09 -0700 (PDT)
Received-SPF: pass (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.28 as permitted sender) client-ip=192.35.17.28;
Received: from mail2.sbs.de (mail2.sbs.de [192.129.41.66])
	by goliath.siemens.de (8.15.2/8.15.2) with ESMTPS id x5DIu8rF009710
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 13 Jun 2019 20:56:08 +0200
Received: from [139.25.68.37] (md1q0hnc.ad001.siemens.net [139.25.68.37] (may be forged))
	by mail2.sbs.de (8.15.2/8.15.2) with ESMTP id x5DIu7mP021813;
	Thu, 13 Jun 2019 20:56:07 +0200
Subject: Re: [PATCH v2] x86: mmio: fix preserve mask for instructions with
 zero-extend
To: Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>,
        jailhouse-dev@googlegroups.com
References: <20190613133052.8347-1-ralf.ramsauer@oth-regensburg.de>
From: Jan Kiszka <jan.kiszka@siemens.com>
Message-ID: <f5fd700b-abcf-7d6e-0f58-39c5ec506935@siemens.com>
Date: Thu, 13 Jun 2019 20:56:07 +0200
User-Agent: Mozilla/5.0 (X11; U; Linux i686 (x86_64); de; rv:1.8.1.12)
 Gecko/20080226 SUSE/2.0.0.12-1.1 Thunderbird/2.0.0.12 Mnenhy/0.7.5.666
MIME-Version: 1.0
In-Reply-To: <20190613133052.8347-1-ralf.ramsauer@oth-regensburg.de>
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

On 13.06.19 15:30, Ralf Ramsauer wrote:
> movzx is a move with zero-extend. It will either move 1 byte (0f b6) or
> 2 bytes (0f b7). The destination are lower 8 or 16 bits. Zero-extend
> means that upper bits need to be cleared. The definition of upper bits
> depends on the destination register.
> 
> We already have a preserve mask that allows us for to clear or preserve
> bits when emulating the instruction. In case of movzx, the preserve mask
> only depends on the width of the destination register. For the
> destination register, we have the following cases:
> 
>    - rax -- instruction has REX prefix 0x48 (rex_w set)
>    - eax -- default case, no prefix, nothing
>    -  ax -- instruction has OP SZ override prefix 0x66
>    -  al -- not possible, and doesn't make sense for movzx
> 
> Now, rax and eax have the same effect: Always clear all upper bits (IOW,
> bits 8-63 if access_size is 1 or bits 16-63 if access_size is 2).
> Solution for rax and eax is easy: Simply don't set the preserve mask at
> all.
> 
> The fun part is if we have the 0x66 operand override size prefix. This
> means that the 'visibility' of the destination register is narrowed to
> 16 bit.
> 
> In case of a 1 byte move (0f b6), copy the source to bits 0-7, clear
> bits 8-15 and preserve bits 16-63. access_width ensures that we only
> copy 8 bit to bits 0-7, and the preserve_mask 0xffff.ffff.ffff.0000 does
> the rest: preserve bits 16-63 and implicitely clear bits 8-15.
> 
> In case of a 2 byte move (0f b7), copy the source to bits 0-15, clear
> nothing and preserve bits 16-63. access_width ensures that we only copy
> 16 bit to bits 0-15, and the preserve_mask 0xffff.ffff.ffff.0000 does
> the rest: preserve bits 16-63.
> 
> Once this pattern is clear, the fix in the hypervisor is straight forward.
> 
> Amend existing and add new test cases that test correct behaviour.
> 
> Signed-off-by: Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>
> ---
> 
> Since v1:
>    - Rewrite commit message
>    - Set the correct preserve_mask
>    - Systematically, add tests for all possible combinations
>    - Adress Jan's comments
> 
>   hypervisor/arch/x86/mmio.c         |  36 +++++++++-
>   inmates/tests/x86/mmio-access-32.c |  30 +++++---
>   inmates/tests/x86/mmio-access.c    | 108 +++++++++++++++++++++++++----
>   3 files changed, 152 insertions(+), 22 deletions(-)
> 
> diff --git a/hypervisor/arch/x86/mmio.c b/hypervisor/arch/x86/mmio.c
> index 124f9966..1fcd810a 100644
> --- a/hypervisor/arch/x86/mmio.c
> +++ b/hypervisor/arch/x86/mmio.c
> @@ -55,6 +55,7 @@ struct parse_context {
>   	bool has_rex_r;
>   	bool has_addrsz_prefix;
>   	bool has_opsz_prefix;
> +	bool zero_extend;
>   };
>   
>   static bool ctx_update(struct parse_context *ctx, u64 *pc, unsigned int advance,
> @@ -144,6 +145,7 @@ restart:
>   		ctx.has_opsz_prefix = true;
>   		goto restart;
>   	case X86_OP_MOVZX_OPC1:
> +		ctx.zero_extend = true;
>   		if (!ctx_update(&ctx, &pc, 1, pg_structs))
>   			goto error_noinst;
>   		op[1].raw = *ctx.inst;
> @@ -191,8 +193,38 @@ restart:
>   
>   	op[2].raw = *ctx.inst;
>   
> -	if (!ctx.does_write && inst.access_size < 4)
> -		inst.reg_preserve_mask = ~BYTE_MASK(inst.access_size);
> +	/*
> +	 * reg_preserve_mask defaults to 0, and only needs to be set in case of
> +	 * reads
> +	 */
> +	if (!ctx.does_write) {
> +		/*
> +		 * MOVs on 32 or 64 bit destination registers need no
> +		 * adjustment of the reg_preserve_mask, all upper bits will
> +		 * always be cleared.
> +		 *
> +		 * In case of 16 or 8 bit registers, the instruction must only
> +		 * modify bits within that width. Therefore, reg_preserve_mask
> +		 * may be set to preserve upper bits.
> +		 *
> +		 * For regular instructions, this is the case if access_size < 4.
> +		 *
> +		 * For zero-extend instructions, this is the case if the
> +		 * operand size override prefix is set.
> +		 */
> +		if(!ctx.zero_extend && inst.access_size < 4)

"if (!..."

And I'm also going to add { } to those blocks as they became multi-line with the 
comments.

> +			/*
> +			 * Restrict access to the width of the access_size, and
> +			 * preserve all other bits
> +			 */
> +			inst.reg_preserve_mask = ~BYTE_MASK(inst.access_size);
> +		else if (ctx.zero_extend && ctx.has_opsz_prefix)
> +			/*
> +			 * Always preserve bits 16-63. Potential zero-extend of
> +			 * bits 8-15 is ensured by access_size
> +			 */
> +			inst.reg_preserve_mask = ~BYTE_MASK(2);
> +	}
>   
>   	/* ensure that we are actually talking about mov imm,<mem> */
>   	if (op[0].raw == X86_OP_MOV_IMMEDIATE_TO_MEM && op[2].modrm.reg != 0)
> diff --git a/inmates/tests/x86/mmio-access-32.c b/inmates/tests/x86/mmio-access-32.c
> index db743410..566f8eaa 100644
> --- a/inmates/tests/x86/mmio-access-32.c
> +++ b/inmates/tests/x86/mmio-access-32.c
> @@ -64,15 +64,29 @@ void inmate_main(void)
>   	EXPECT_EQUAL(reg32,
>   		     ((unsigned long)mmio_reg & ~0xffUL) | (pattern & 0xff));
>   
> -	/* MOVZXB (0f b6), 32-bit data, 32-bit address */
> -	asm volatile("movzxb (%%ebx), %%eax"
> -		: "=a" (reg32) : "a" (0), "b" (mmio_reg));
> -	EXPECT_EQUAL(reg32, (u8)pattern);
> +	/* MOVZXB (0f b6), 8-bit data, 32-bit address, zero extend bits 8-31 */
> +	asm volatile("movzxb (%%eax), %%eax"
> +		: "=a" (reg32) : "a" (mmio_reg));
> +	EXPECT_EQUAL(reg32, pattern & 0xff);
>   
> -	/* MOVZXW (0f b7) */
> -	asm volatile("movzxw (%%ebx), %%eax"
> -		: "=a" (reg32) : "a" (0), "b" (mmio_reg));
> -	EXPECT_EQUAL(reg32, (u16)pattern);
> +	/* MOVZXB (66 0f b6), 8-bit data, 32-bit address, zero extend bits 8-15,
> +	 * operand size prefix */
> +	asm volatile("movzxb (%%eax), %%ax"
> +		: "=a" (reg32) : "a" (mmio_reg));
> +	EXPECT_EQUAL(reg32,
> +		     ((unsigned long)mmio_reg & ~0xffff) | (pattern & 0xff));
> +
> +	/* MOVZXW (0f b7), 16-bit data, 32-bit address, zero extend bits
> +	 * 16-31 */
> +	asm volatile("movzxw (%%eax), %%eax"
> +		: "=a" (reg32) : "a" (mmio_reg));
> +	EXPECT_EQUAL(reg32, pattern & 0xffff);
> +
> +	/* MOVZXW (66 0f b7), 16-bit data, 32-bit address, preserve bits 16-31 */
> +	asm volatile(".byte 0x66, 0x0f, 0xb7, 0x00"
> +		: "=a" (reg32) : "a" (mmio_reg));
> +	EXPECT_EQUAL(reg32, ((unsigned long)mmio_reg & ~0xffff) |
> +			     (pattern & 0xffff));
>   
>   	/* MEM_TO_AX (a1), 32-bit data, 32-bit address */
>   	asm volatile("mov (0x101ff8), %%eax"
> diff --git a/inmates/tests/x86/mmio-access.c b/inmates/tests/x86/mmio-access.c
> index a17455b0..328d19f0 100644
> --- a/inmates/tests/x86/mmio-access.c
> +++ b/inmates/tests/x86/mmio-access.c
> @@ -84,20 +84,104 @@ void inmate_main(void)
>   	EXPECT_EQUAL(reg64,
>   		     ((unsigned long)mmio_reg & ~0xffUL) | (pattern & 0xff));
>   
> -	/* MOVZXB (0f b6), to 64-bit, mod=0, reg=0, rm=3 */
> -	asm volatile("movzxb (%%rbx), %%rax"
> -		: "=a" (reg64) : "a" (0), "b" (mmio_reg));
> -	EXPECT_EQUAL(reg64, (u8)pattern);
> +	/* MOVZX test cases */
>   
> -	/* MOVZXB (0f b6), 32-bit data, 32-bit address */
> -	asm volatile("movzxb (%%ebx), %%eax"
> -		: "=a" (reg64) : "a" (0), "b" (mmio_reg));
> -	EXPECT_EQUAL(reg64, (u8)pattern);
> +	/*
> +	 * First three tests: MOVZXB (0f b6) with 64-bit address, varying
> +	 * register width (rax, eax, ax)
> +	 */
>   
> -	/* MOVZXW (0f b7) */
> -	asm volatile("movzxw (%%rbx), %%rax"
> -		: "=a" (reg64) : "a" (0), "b" (mmio_reg));
> -	EXPECT_EQUAL(reg64, (u16)pattern);
> +	/* MOVZXB (48 0f b6), 8-bit data, 64-bit address, clear bits 8-63 */
> +	asm volatile("movzxb (%%rax), %%rax"
> +		: "=a" (reg64) : "a" (mmio_reg));
> +	EXPECT_EQUAL(reg64, pattern & 0xff);
> +
> +	/* MOVZXB (0f b6), 8-bit data, 64-bit address, clear bits 8-63
> +	 * Exposes the same behaviour as 48 0f b6. */
> +	asm volatile("movzxb (%%rax), %%eax"
> +		: "=a" (reg64) : "a" (mmio_reg));
> +	EXPECT_EQUAL(reg64, pattern & 0xff);
> +
> +	/* MOVZXB (66 0f b6), 8-bit data, clear bits 8-15, preserve 16-63,
> +	 * operand size prefix */
> +	asm volatile("movzxb (%%rax), %%ax"
> +		: "=a" (reg64) : "a" (mmio_reg));
> +	EXPECT_EQUAL(reg64,
> +		     ((unsigned long)mmio_reg & ~0xffffUL) | (pattern & 0xff));
> +
> +	/*
> +	 * Second three tests: MOVZXB (0f b6) with 32-bit address, varying
> +	 * register width (rax, eax, ax).
> +	 *
> +	 * These pattern will cover cases, where we have, e.g., both operand
> +	 * prefixes (address size override prefix and operand size override
> +	 * prefix), and a REX + adress size override prefix.
> +	 */
> +
> +	/* MOVZXB (67 48 0f b6), 8-bit data, clear bits 8-63, 32-bit address,
> +	 * REX_W, AD SZ override prefix */
> +	asm volatile("movzxb (%%eax), %%rax"
> +		: "=a" (reg64) : "a" (mmio_reg));
> +	EXPECT_EQUAL(reg64, pattern & 0xff);
> +
> +	/* MOVZXB (67 0f b6), 8-bit data, clear bits 8-63, 32-bit address,
> +	 * AD SZ override prefix. Exposes the same behaviour as 67 48 0f b6. */
> +	asm volatile("movzxb (%%eax), %%eax"
> +		: "=a" (reg64) : "a" (mmio_reg));
> +	EXPECT_EQUAL(reg64, pattern & 0xff);
> +
> +	/* MOVZXB (67 66 0f b6), 8-bit data, clear bits 8-15, preserve 16-63,
> +	 * 32-bit address, AD SZ override prefix, OP SZ override prefix */
> +	asm volatile("movzxb (%%eax), %%ax"
> +		: "=a" (reg64) : "a" (mmio_reg));
> +	EXPECT_EQUAL(reg64,
> +		     ((unsigned long)mmio_reg & ~0xffffUL) | (pattern & 0xff));
> +
> +	/*
> +	 * Three tests for: MOVZXW (0f b7) with 64-bit address, varying
> +	 * register width (rax, eax, ax).
> +	 */
> +
> +	/* MOVZXW (48 0f b7), 16-bit data, clear bits 16-63, 64-bit address */
> +	asm volatile("movzxw (%%rax), %%rax"
> +		: "=a" (reg64) : "a" (mmio_reg));
> +	EXPECT_EQUAL(reg64, pattern & 0xffff);
> +
> +	/* MOVZXW (0f b7), 16-bit data, clear bits 16-63, 64-bit address.
> +	 * Exposes the same behaviour as 48 0f b7. */
> +	asm volatile("movzxw (%%rax), %%eax"
> +		: "=a" (reg64) : "a" (mmio_reg));
> +	EXPECT_EQUAL(reg64, pattern & 0xffff);
> +
> +	/* MOVZWW (66 0f b7), 16-bit data, preserve bits 16-63, OP SZ prefix */
> +	asm volatile(".byte 0x66, 0x0f, 0xb7, 0x00"

Just checked why we cannot encode that in assembly: There is no
"MOVZX r16, r/m16" specified - likely because it's pointless (it's a plain mov). 
But the disassembler understands it nevertheless.

I'm adding a comment that this is a possible but unspecified instruction.

BTW, "MOVXZW".

> +		: "=a" (reg64) : "a" (mmio_reg));
> +	EXPECT_EQUAL(reg64, ((unsigned long)mmio_reg & ~0xffffUL) |
> +			     (pattern & 0xffff));
> +
> +	/*
> +	 * Last but not least: MOVZXW (0f b7) with 32-bit address, varying
> +	 * register width (rax, eax, ax).
> +	 */
> +
> +	/* MOVZXW (67 48 0f b7), 16-bit data, clear bits 16-63, 32-bit address,
> +	 * AD SZ prefix, REX_W */
> +	asm volatile("movzxw (%%eax), %%rax"
> +		: "=a" (reg64) : "a" (mmio_reg));
> +	EXPECT_EQUAL(reg64, pattern & 0xffff);
> +
> +	/* MOVZXW (67 0f b7), 16-bit data, clear bits 16-63, 32-bit address,
> +	 * AD SZ prefix. Exposes same behaviour as 67 48 0f b7. */
> +	asm volatile("movzxw (%%eax), %%eax"
> +		: "=a" (reg64) : "a" (mmio_reg));
> +	EXPECT_EQUAL(reg64, pattern & 0xffff);
> +
> +	/* MOVZXW (67 66 0f b7), 16-bit data, preserve bits 16-63, 32-bit address,
> +	 * AD SZ prefix, OP SZ prefix */
> +	asm volatile(".byte 0x67, 0x66, 0x0f, 0xb7, 0x00"

Same here.

> +		: "=a" (reg64) : "a" (mmio_reg));
> +	EXPECT_EQUAL(reg64, ((unsigned long)mmio_reg & ~0xffffUL) |
> +			     (pattern & 0xffff));
>   
>   	/* MEM_TO_AX (a1), 64-bit data, 64-bit address */
>   	asm volatile("movabs (0x101ff8), %%rax"
> 

Merged to next.

Thanks,
Jan

-- 
Siemens AG, Corporate Technology, CT RDA IOT SES-DE
Corporate Competence Center Embedded Linux

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/f5fd700b-abcf-7d6e-0f58-39c5ec506935%40siemens.com.
For more options, visit https://groups.google.com/d/optout.
