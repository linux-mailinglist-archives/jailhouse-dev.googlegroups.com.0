Return-Path: <jailhouse-dev+bncBCJI7SMNV4NBBIH7Q7UAKGQEXGBVPMY@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-ed1-x53d.google.com (mail-ed1-x53d.google.com [IPv6:2a00:1450:4864:20::53d])
	by mail.lfdr.de (Postfix) with ESMTPS id D6B9E433D8
	for <lists+jailhouse-dev@lfdr.de>; Thu, 13 Jun 2019 09:47:44 +0200 (CEST)
Received: by mail-ed1-x53d.google.com with SMTP id f19sf24713939edv.16
        for <lists+jailhouse-dev@lfdr.de>; Thu, 13 Jun 2019 00:47:44 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1560412064; cv=pass;
        d=google.com; s=arc-20160816;
        b=xxgReWJbGeiYnDICYpUYloaXc/YdGyp9vam4xskqK5mhslug2+1OOPUzAG2Rkc1wQr
         6y42DHxr43QnQtmA4lWLM5UAlSFQ534rgD4kUhOW04cHUExn1R+hvVBrIEIbJJLVQQky
         8ATEerr7ijV/WtGAJJO+ayBTb48nHuwSdrA0Aqf4NxEEC6YrPHIECPxXBY+G6vney0LA
         jxPaRT3mCOTCogwDp/1U4jBEHy7drp0/dbmYnQ+cEyP2bMWMcxZ3r9frzqpbAAtAxX2V
         gA3Hwlw+4F+Lr3ixHP0JwBuW13IBFrIWwBHIP4Qt8QBMmeEzAIKIxviWsKvcPm8RXvwq
         VANA==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:content-language:in-reply-to
         :mime-version:user-agent:date:message-id:from:references:to:subject
         :sender:dkim-signature;
        bh=c89fClorpbTHV6RPlWbk7vyKWd9sN8kym1n7brpkWYw=;
        b=Sh9uetU/Fk9awKeSlqlx4egjbHHeVPTZqOMkYdyJTWqUDUvp3feVr+MOK/mImpEXN5
         789ZavhMPCoVY72mTHExI5Nzf/bgFyyZwq/1qhlBbzEqMbI2QGBIa2egrwDMxwT7+tHR
         ZIuAv1LRqAm2iauaBL5PvjZIgtN/8KhKN/eQ+OXpp+YBnWynrTags3QI9TpXRQZ7Cc9D
         UJHZD6kx79K57sZKZNn6JIYRjdEQJH3kZ6I1Mmv6stwI5A/1atEEPbZeJvApa35Jqw81
         qpiE3+HydFWozqzybC+ZxP8gNCgaQuBoIKxOhB7ZpKQ7Y+EbMVyo5rTt7nnJFxLLwoWq
         q1Ow==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.28 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:subject:to:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :list-post:list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=c89fClorpbTHV6RPlWbk7vyKWd9sN8kym1n7brpkWYw=;
        b=V4jsLx0G3MiKHVWI73l31KxxsQgJDi4LS8bItH3e4kHDK2Vt3H2ROgz0m33epyhyGR
         bv8N2YbKUT5DcpXdoAiq7KPte8szmew0jSFwArlOnZHkJADZuaaS87mKlSLa7Z12k1PU
         Q3/k0YBpfLmkEbWBrg7SKtkCsZUn3fBdWFEc2oUTBR3gI0bxcntBFMFOxk3l6yTLAQI5
         MwOO4/0P5PwF7NRI1yH1LkX1Hi3KGerMw1fzCFtP7jmno5T5Tsv1hFFvx4H83fCZvWfE
         /Z7XeKWmUmZeseJB8m+1ABQmWLtyzf4/vPOlSmx8ANLRtK4z41BWPziB/lGDmAu88O5l
         BA3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:subject:to:references:from:message-id
         :date:user-agent:mime-version:in-reply-to:content-language
         :x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:x-spam-checked-in-group:list-post:list-help
         :list-archive:list-subscribe:list-unsubscribe;
        bh=c89fClorpbTHV6RPlWbk7vyKWd9sN8kym1n7brpkWYw=;
        b=gv8w8gP/+Oa+8DyrVlVdsxAdA9BMr57E+vfEz52MH1hlawZO3VcrIu6V9900n0S8Kz
         1Wo6U5M86FkpSVehoZ/G1KGNrfhq4hz1oao/ixco8RjVi0OTvrtvUDQY7pxqs6sifqNY
         YASVeFkPMfhQ4F0pXuJLAPZjlSUrH69iGydm44rWktb5x96F2d4FBGjq7DKhMAR07spo
         GwBiJTyzo3IZsUSU7ENqEboUsf2HWeFSGJeZIpCJOGcTHCFUd7DT5XVX3JXohUTPvlLd
         sf0UItH/A+2pBfC7La3zKec6yrCr0eZQwAFSMz5S+HLBVTbFIyTCJoAR3v+bg17SNo1D
         /Aug==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: APjAAAXEIlhJRVTiI14YkRbixCj5usIsTTAqnNVfF8Ou/XdAl81t1jQW
	gpXvmhqIjvgT5yRRAPl0DXI=
X-Google-Smtp-Source: APXvYqxdqP6tNlGZxgXs9jHj/hWFcbvY567qxIRfmErkYHf2thmAvsLTOjsDTnfPtxQQQxgEAWxrJQ==
X-Received: by 2002:a17:906:2a98:: with SMTP id l24mr32145084eje.150.1560412064580;
        Thu, 13 Jun 2019 00:47:44 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a17:906:7084:: with SMTP id b4ls1119531ejk.6.gmail; Thu, 13
 Jun 2019 00:47:43 -0700 (PDT)
X-Received: by 2002:a17:906:ccc7:: with SMTP id ot7mr29181872ejb.198.1560412063973;
        Thu, 13 Jun 2019 00:47:43 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1560412063; cv=none;
        d=google.com; s=arc-20160816;
        b=iMn9K7jeqQu/i+UQ/ARIRud4r8su8CXmDsE7CMqmuTfgGmt6aklzI3tshxeaKEDYNv
         nU8VamfVXKJsdHBFBAelaQKgrdGNzlt6CjhykhN4HIrkJ2EyEVAXbSzMA5mTg/0YFetn
         JziYdLgYByWf3QItByahfC+4OtOjclYgs/fvhFysbu3asuT/d+3JOh/IQKx7Mp8V1GGI
         iND6XTdgQZ4xkmjOYvEELXdLD3y7G4HnRgs6swZ11wqfb/CHrn+nrnGXvmRcygccM6sv
         wicva889NWhAjN8COSBtob8lnIyURiJw2tfg02pQjGftEtu8yWvzSauvS+kKRJF8e7ZC
         /zNw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:to:subject;
        bh=ksB7f1MvJuEsjRnX4nKnaBco+vOkFxy4g34wM7hcJQg=;
        b=mnYW3GvR4+CxXgqkS3ehr0fF1kx7oMHka8TyNTKfTropgg4Oz5pYw8GjvWM3vmUbXX
         tuWKLVWs9pfX5TG1vtyjY8ql0YWYguyjaU/O8eZKY5MAjPVyU0vyiYhcXJkoJXjJq+Qs
         te3bF9zik5RMC1klgZuDQehMFl17Y0+LcChLd6NdFAcDcNBBoF0u5L1f0iVRZ6o+XO8w
         zj779n7U5qMRBlTdyMBHQ3s3c7dW771cR838ISBS3n8QUvkjzyvCQ2CczS53INXF0wWf
         SzIyhWRhEbndvFEj6kFSzIukSAjeC7UIvkpLuqemRwuPZYYv7vJefX5iwexi3tEMJaSi
         XwZg==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.28 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
Received: from goliath.siemens.de (goliath.siemens.de. [192.35.17.28])
        by gmr-mx.google.com with ESMTPS id r27si60969edd.4.2019.06.13.00.47.43
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 13 Jun 2019 00:47:43 -0700 (PDT)
Received-SPF: pass (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.28 as permitted sender) client-ip=192.35.17.28;
Received: from mail2.sbs.de (mail2.sbs.de [192.129.41.66])
	by goliath.siemens.de (8.15.2/8.15.2) with ESMTPS id x5D7lhBx012039
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 13 Jun 2019 09:47:43 +0200
Received: from [139.22.42.197] ([139.22.42.197])
	by mail2.sbs.de (8.15.2/8.15.2) with ESMTP id x5D7leru005971;
	Thu, 13 Jun 2019 09:47:43 +0200
Subject: Re: [PATCH] x86: mmio: fix preserve mask for instructions with
 zero-extend
To: Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>,
        jailhouse-dev@googlegroups.com
References: <20190612190035.16171-1-ralf.ramsauer@oth-regensburg.de>
From: Jan Kiszka <jan.kiszka@siemens.com>
Message-ID: <00af9701-f68f-a27f-2646-ca1f0eb9b187@siemens.com>
Date: Thu, 13 Jun 2019 09:47:41 +0200
User-Agent: Mozilla/5.0 (X11; U; Linux i686 (x86_64); de; rv:1.8.1.12)
 Gecko/20080226 SUSE/2.0.0.12-1.1 Thunderbird/2.0.0.12 Mnenhy/0.7.5.666
MIME-Version: 1.0
In-Reply-To: <20190612190035.16171-1-ralf.ramsauer@oth-regensburg.de>
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

On 12.06.19 21:00, Ralf Ramsauer wrote:
> movzx is a move with zero-extend. This means, it will either move 1 or 2 byte,
> and zeroes the rest of the register. The definition of the rest of the
> register depends on the operand size override prefix:
> 
>    - If OP SZ is not set, always zero the whole register, independent of rex_w.
>      This mean all bits can be zeroed if the destination is eax or rax. No need
>      to set the preserve mask
> 
>    - OP SZ is only set if ax is used. This is the only remaining case.
> 
>      The preserve mask then depends on the width of the access. In case of B,
>      zero bits 8-15, and preserve 16-63. In case of W, zero nothing, but
>      preserve 16-63.

I'm not sure how this explanation correlates with the test cases, nor to speak 
of the implementation. I feel like some bit is missing in comment or commit log.

> 
> Once this pattern is clear, the fix in the hypervisor is straight forward.
> 
> Amend existing and add new test cases that test correct behaviour.
> 
> Signed-off-by: Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>
> ---
> 
> I'm starting to get frustrated with x86. I thought I catched all
> relevant cases, but x86 provides enough complexity for a bunch of corner
> cases...
> 
>   hypervisor/arch/x86/mmio.c         | 11 ++++-
>   inmates/tests/x86/mmio-access-32.c | 24 +++++++----
>   inmates/tests/x86/mmio-access.c    | 67 ++++++++++++++++++++++++------
>   3 files changed, 80 insertions(+), 22 deletions(-)
> 
> diff --git a/hypervisor/arch/x86/mmio.c b/hypervisor/arch/x86/mmio.c
> index 124f9966..76d70053 100644
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
> @@ -191,8 +193,13 @@ restart:
>   
>   	op[2].raw = *ctx.inst;
>   
> -	if (!ctx.does_write && inst.access_size < 4)
> -		inst.reg_preserve_mask = ~BYTE_MASK(inst.access_size);
> +	if (!ctx.does_write) {
> +		if(!ctx.zero_extend && inst.access_size < 4)
> +			inst.reg_preserve_mask = ~BYTE_MASK(inst.access_size);
> +		else if (ctx.zero_extend && ctx.has_opsz_prefix)
> +			inst.reg_preserve_mask =
> +				~BYTE_MASK(inst.access_size ^ 0x3);

This logic deserves some comment, and I'm not sure if it is correct already:

Access size = 1 -> BYTE_MASK(2) -> preserve bits 16-63
Access size = 2 -> BYTE_MASK(1) -> preserve bits  8-63???

Access sizes 4 or 8 are not possible?

> +	}
>   
>   	/* ensure that we are actually talking about mov imm,<mem> */
>   	if (op[0].raw == X86_OP_MOV_IMMEDIATE_TO_MEM && op[2].modrm.reg != 0)
> diff --git a/inmates/tests/x86/mmio-access-32.c b/inmates/tests/x86/mmio-access-32.c
> index db743410..756d3947 100644
> --- a/inmates/tests/x86/mmio-access-32.c
> +++ b/inmates/tests/x86/mmio-access-32.c
> @@ -64,15 +64,23 @@ void inmate_main(void)
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

Where does this case go? No longer differentiating?

> -	EXPECT_EQUAL(reg32, (u16)pattern);
> +	/* MOVZXB (0f b6), 8-bit data, 32-bit address, zero extend bits 8-16,

8-15

> +	 * operand size prefix */
> +	asm volatile("movzxb (%%eax), %%ax"
> +		: "=a" (reg32) : "a" (mmio_reg));
> +	EXPECT_EQUAL(reg32,
> +		     ((unsigned long)mmio_reg & ~0xffff) | (pattern & 0xff));
> +
> +	/* MOVZXW (67 0f b7), 16-bit data, 32-bit address, zero extend bits 16-31,
> +	 * AD SZ prefix */
> +	asm volatile("movzxw (%%eax), %%eax"
> +		: "=a" (reg32) : "a" (mmio_reg));
> +	EXPECT_EQUAL(reg32, pattern & 0xffff);
>   
>   	/* MEM_TO_AX (a1), 32-bit data, 32-bit address */
>   	asm volatile("mov (0x101ff8), %%eax"
> diff --git a/inmates/tests/x86/mmio-access.c b/inmates/tests/x86/mmio-access.c
> index a17455b0..18eab3a5 100644
> --- a/inmates/tests/x86/mmio-access.c
> +++ b/inmates/tests/x86/mmio-access.c
> @@ -84,20 +84,63 @@ void inmate_main(void)
>   	EXPECT_EQUAL(reg64,
>   		     ((unsigned long)mmio_reg & ~0xffUL) | (pattern & 0xff));
>   
> -	/* MOVZXB (0f b6), to 64-bit, mod=0, reg=0, rm=3 */

Not relevant anymore?

> -	asm volatile("movzxb (%%rbx), %%rax"
> -		: "=a" (reg64) : "a" (0), "b" (mmio_reg));
> -	EXPECT_EQUAL(reg64, (u8)pattern);
> +	/* MOVZXB (48 0f b6), to 64-bit, mod=0, reg=0, rm=3 */
> +	asm volatile("movzxb (%%rax), %%rax"
> +		: "=a" (reg64) : "a" (mmio_reg));
> +	EXPECT_EQUAL(reg64, pattern & 0xff);
>   
> -	/* MOVZXB (0f b6), 32-bit data, 32-bit address */
> -	asm volatile("movzxb (%%ebx), %%eax"
> -		: "=a" (reg64) : "a" (0), "b" (mmio_reg));
> -	EXPECT_EQUAL(reg64, (u8)pattern);
> +	/* MOVZXB (0f b6), to 32-bit, clear bits 31-63 */

32-63

> +	asm volatile("movzxb (%%rax), %%eax"
> +		: "=a" (reg64) : "a" (mmio_reg));
> +	EXPECT_EQUAL(reg64, pattern & 0xff);
>   
> -	/* MOVZXW (0f b7) */
> -	asm volatile("movzxw (%%rbx), %%rax"
> -		: "=a" (reg64) : "a" (0), "b" (mmio_reg));
> -	EXPECT_EQUAL(reg64, (u16)pattern);
> +	/* MOVZXB (66 0f b6), to 32-bit, clear bits 8-16, keep 17-73,

8-15, 16-63

> +	 * operand size prefix */
> +	asm volatile("movzxb (%%rax), %%ax"
> +		: "=a" (reg64) : "a" (mmio_reg));
> +	EXPECT_EQUAL(reg64,
> +		     ((unsigned long)mmio_reg & ~0xffffUL) | (pattern & 0xff));
> +
> +	/* MOVZXB (67 0f b6), 8-bit data, clear bits 8-63, 32-bit address,
> +	 * AD SZ override prefix */
> +	asm volatile("movzxb (%%eax), %%rax"
> +		: "=a" (reg64) : "a" (mmio_reg));
> +	EXPECT_EQUAL(reg64, pattern & 0xff);
> +
> +	/* MOVZXB (67 0f b6), 8-bit data, clear bits 8-63, 32-bit address,
> +	 * AD SZ override prefix */

Same as above? Surely not.

> +	asm volatile("movzxb (%%eax), %%eax"
> +		: "=a" (reg64) : "a" (mmio_reg));
> +	EXPECT_EQUAL(reg64, pattern & 0xff);
> +
> +	/* MOVZXB (67 0f b6), 8-bit data, clear bits 8-16, keep 17-73,

8-15, 16-63

> +	 * 32-bit address, AD SZ override prefix, OP SZ override prefix */
> +	asm volatile("movzxb (%%eax), %%ax"
> +		: "=a" (reg64) : "a" (mmio_reg));
> +	EXPECT_EQUAL(reg64,
> +		     ((unsigned long)mmio_reg & ~0xffffUL) | (pattern & 0xff));
> +
> +	/* MOVZXW (48 0f b7), 16-bit data, clear bits 16-63, 64-bit address */
> +	asm volatile("movzxw (%%rax), %%rax"
> +		: "=a" (reg64) : "a" (mmio_reg));
> +	EXPECT_EQUAL(reg64, pattern & 0xffff);
> +
> +	/* MOVZXW (0f b7), 16-bit data, clear bits 16-63, 64-bit address */

Variation in the target register size missing in description.

> +	asm volatile("movzxw (%%rax), %%eax"
> +		: "=a" (reg64) : "a" (mmio_reg));
> +	EXPECT_EQUAL(reg64, pattern & 0xffff);
> +
> +	/* MOVZXW (67 48 0f b7), 16-bit data, clear bits 16-63, 32-bit address,
> +	 * AD SZ prefix */
> +	asm volatile("movzxw (%%eax), %%rax"
> +		: "=a" (reg64) : "a" (mmio_reg));
> +	EXPECT_EQUAL(reg64, pattern & 0xffff);
> +
> +	/* MOVZXW (67 0f b7), 16-bit data, clear bits 16-63, 32-bit address,
> +	 * AD SZ prefix */

Also here.

> +	asm volatile("movzxw (%%eax), %%eax"
> +		: "=a" (reg64) : "a" (mmio_reg));
> +	EXPECT_EQUAL(reg64, pattern & 0xffff);
>   
>   	/* MEM_TO_AX (a1), 64-bit data, 64-bit address */
>   	asm volatile("movabs (0x101ff8), %%rax"
> 


Horrible, this huge amount of cases.

Jan

-- 
Siemens AG, Corporate Technology, CT RDA IOT SES-DE
Corporate Competence Center Embedded Linux

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/00af9701-f68f-a27f-2646-ca1f0eb9b187%40siemens.com.
For more options, visit https://groups.google.com/d/optout.
