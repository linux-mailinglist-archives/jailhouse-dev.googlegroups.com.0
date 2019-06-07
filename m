Return-Path: <jailhouse-dev+bncBCJI7SMNV4NBBSEJ5HTQKGQEKKOW6MI@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-lf1-x13f.google.com (mail-lf1-x13f.google.com [IPv6:2a00:1450:4864:20::13f])
	by mail.lfdr.de (Postfix) with ESMTPS id 13FEF38874
	for <lists+jailhouse-dev@lfdr.de>; Fri,  7 Jun 2019 13:04:41 +0200 (CEST)
Received: by mail-lf1-x13f.google.com with SMTP id v188sf463850lfa.20
        for <lists+jailhouse-dev@lfdr.de>; Fri, 07 Jun 2019 04:04:41 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1559905480; cv=pass;
        d=google.com; s=arc-20160816;
        b=FxGrPm+KsTtTTIVk5trilCJl72C7aN/ugaHyuUmL6kDKujYO1RAArgKf3AOY4HsQtl
         wKMyL3lNLTIxrfsgyz0ypbPDcUFOrH1IyPCaJPAcYcGKlUiwkmjQ45AYQfGo3epqvb0F
         EI2f7imF2LMssiCdhiXBPEczXgd273mZxdnnmemeAeixNS269pfjohtufAnh8S7rupvo
         RR8byVqA51cvooeP5vkbSC6r3JKUKXftocQhUgsRzMyplYf05KGBawmb3x67oF7BNaLB
         pzXLxQa6HcDz9A6QVMfi73xb/ju7lb1wImxE2pKw8sJCgi4w2zSmyOdAiUZrxQsC3UFn
         u4rA==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:content-language:in-reply-to
         :mime-version:user-agent:date:message-id:from:references:to:subject
         :sender:dkim-signature;
        bh=1/sJh8a2AuC24OzO4EmVdBPW5mYNaYxT7HWpD5yYRLc=;
        b=d8zyYgPWM57rn11EeND/NMAC4Zq6kjrRORT1g6iQbJC2/SMcYNyRSmfC+q4jHp1qsJ
         Bbr/TMnZQ5Ram3u5rlJjVwjFZpgzoMg0Z0j1rPNWPVn9GXbmqzPbSiw+C9KT7an5tidR
         OHyvZDJ7702AzGosVHnVjHsyGl2K5/QQiavzWS8gIIvu1MyklvN4ySxCIIcUVuIdCjc1
         BpplQQSw3rKC0CoREQYor0Fe+Stky3obPxiJObm4c9ywVwS3rzC/OYhjrsZ7Lcz8Dw5Z
         HnyA9t3RAlGtUJCxosk73MfWii41dFTR7wxpiLbMOnZcgshcwW4lcCC1NUr1dxW0ELlH
         O00g==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 194.138.37.39 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:subject:to:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :list-post:list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=1/sJh8a2AuC24OzO4EmVdBPW5mYNaYxT7HWpD5yYRLc=;
        b=gVKylnHT7rumlbn0m4I3P9Au8PlG9dWu0LpX/H5+X0kjc/8UmK+ogFP96z9VTvoc28
         X0Jr1R27twO4SNL3EdXWSafGgisiUgk2Utk4QgG1aSXwZFd16TtC15g66V842i7D4c/7
         Ww1sn4TDikIo/4HsQd5+Va7W7JHqfm7Y1kxrXY66snUiBl/KFyjFHR3cN/Wl4Ur5IqXx
         YG4nOAaLvJORgfd4vFIIujsCjkQy2CDtzZQQnle7qf9/XWBRdrd+kTMB1hmrOPiYEoFO
         fLa/R8qrO0SUF21L8vB03z4Lcg40Lp1KFuvflZLwdk9FLxxDqyft3OJa2S36uM10FhV1
         SQyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:subject:to:references:from:message-id
         :date:user-agent:mime-version:in-reply-to:content-language
         :x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:x-spam-checked-in-group:list-post:list-help
         :list-archive:list-subscribe:list-unsubscribe;
        bh=1/sJh8a2AuC24OzO4EmVdBPW5mYNaYxT7HWpD5yYRLc=;
        b=W3CqVbm5DJO9fBJTk+kaiQtwxAAdt2Bz6EPkdhQPmmX0s3+4tjS6qRrhHX/TxIazdR
         WecXHia4yjKq4mpRNtBtyMnREbp51nofHm9Bx9p4c+/V2oiEcrKxJF7en92NYV1NZD5I
         6k2d2wimn5wAdCAeNM36QOLcpAna+uGbfabusr0+qS+HiHBH33qYfd78tYDLbScCfX7a
         65NmPNQ8wsiMwJE/h5y+BR0tbRa4OOOWhjiMITNkEv6V4wcEBKl2JLnKq+WVZMHDunBf
         gKJXdMkbIz7N3jX+/gjD2PzpWxQH7m1Lpl2acsUIviZ06hbm7q+LcvGDL/6zJlZZI0Tk
         cS6w==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: APjAAAU52eaneO5bwO+07FiQBeBCIlnsaw/zB00aKdNgtZwDjLenLxsa
	ytZ26k2kTrm+OKhEbZQAL28=
X-Google-Smtp-Source: APXvYqzlJ8cvwvL2w7VAd8M1bSHLMhT1qwf0C8Mak1qhxJdx17GTL1icO/bMkeIatDE7UUW+9asVnQ==
X-Received: by 2002:a2e:8e90:: with SMTP id z16mr2036854ljk.4.1559905480664;
        Fri, 07 Jun 2019 04:04:40 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:ac2:4316:: with SMTP id l22ls785090lfh.14.gmail; Fri, 07 Jun
 2019 04:04:40 -0700 (PDT)
X-Received: by 2002:ac2:5b0c:: with SMTP id v12mr12485626lfn.184.1559905480013;
        Fri, 07 Jun 2019 04:04:40 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1559905480; cv=none;
        d=google.com; s=arc-20160816;
        b=xmfXXDcrRJHy8d73TRvGShCc6lmrgeahvnbUxDuH25SJAtgoW/6BOzPt7ZjyldO/Wt
         2Zj0Jd8sVgZ9p3hGtXi0dTM98NqAbj5MEd19UyeEbJICyfiOo6hKWhrxu43FHnemptUP
         1/wES4lLaKDVIEqcsXASHWKynSUfkArShnxPnWDy6FcVY9FP2jUmEKcmmxeoYlW678iD
         FhS59vQR2w6Z8b9lMHzeK4fT1Z/v+nlD2Cwmh4FuZZ6cyFQgkPQkdJ5l0auTluRTt1f4
         3uANJfHO9TZrA3q+F13IBO5nAXAzwwwuO2QUT+JJAvY4qM+4df/IHp56NVLlY8MmHYhc
         Z7hg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:to:subject;
        bh=A681scm0rqlclk6P/jjJsPIISi7mcMhuth3rsbMM3qw=;
        b=a/4U4C99yXYonEMlaBc0yrQ65ErcpeUDRrxcyCzzcieoDOmQ5v69kVHVjkQq4yFWAH
         rv0wp4nrQZ8ZM6nVouxCY0nHrXmm5DicjIgOVNjfNbzin5bAbkJ2jkXpCRhHGuH8dETi
         iAA3Pa/z52BnKeZ0mPD42I2hh4PdaCFZ2IOGrjaY8VVFQw7vRRPWsGKLoGtw0TVIdoFE
         Kco3KZk+9NaGMI563yrxYZZWgf+fkg75PwDs4tzBRzHJMIlWrTqHZbBps77l7XKnTOja
         fBGhcka1l4kBRbV/w+hIxETYhfTHGqQ8yBH9+EYagALTB3/tzojM3RiUD48dqxj4l68n
         9Mvw==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 194.138.37.39 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
Received: from lizzard.sbs.de (lizzard.sbs.de. [194.138.37.39])
        by gmr-mx.google.com with ESMTPS id l4si87794lfh.0.2019.06.07.04.04.39
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 07 Jun 2019 04:04:40 -0700 (PDT)
Received-SPF: pass (google.com: domain of jan.kiszka@siemens.com designates 194.138.37.39 as permitted sender) client-ip=194.138.37.39;
Received: from mail1.sbs.de (mail1.sbs.de [192.129.41.35])
	by lizzard.sbs.de (8.15.2/8.15.2) with ESMTPS id x57B4dbZ008316
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 7 Jun 2019 13:04:39 +0200
Received: from [139.22.33.212] ([139.22.33.212])
	by mail1.sbs.de (8.15.2/8.15.2) with ESMTP id x57B4bvF022234;
	Fri, 7 Jun 2019 13:04:37 +0200
Subject: Re: [PATCH v2 3/3] x86: mmio: add support for 0x66 operand prefix
To: Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>,
        jailhouse-dev@googlegroups.com
References: <20190606224457.1053-1-ralf.ramsauer@oth-regensburg.de>
 <20190606224457.1053-4-ralf.ramsauer@oth-regensburg.de>
From: Jan Kiszka <jan.kiszka@siemens.com>
Message-ID: <6294be2a-0ce1-1021-1691-c801456b36a3@siemens.com>
Date: Fri, 7 Jun 2019 13:04:37 +0200
User-Agent: Mozilla/5.0 (X11; U; Linux i686 (x86_64); de; rv:1.8.1.12)
 Gecko/20080226 SUSE/2.0.0.12-1.1 Thunderbird/2.0.0.12 Mnenhy/0.7.5.666
MIME-Version: 1.0
In-Reply-To: <20190606224457.1053-4-ralf.ramsauer@oth-regensburg.de>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Language: en-US
X-Original-Sender: jan.kiszka@siemens.com
X-Original-Authentication-Results: gmr-mx.google.com;       spf=pass
 (google.com: domain of jan.kiszka@siemens.com designates 194.138.37.39 as
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

On 07.06.19 00:44, Ralf Ramsauer wrote:
> mov (%rax), %ax is a 16-bit data MOV_FROM_MEM that will emit
> 0x66 0x8b 0x00.
> 
> 0x66 is the operand-size override prefix which we currently do not support.
> 
> We should support it, as we can find this opcode, for example, for some
> mmconfig space access from Linux (e.g., pci_generic_config_read).
> 
> This also adds appropriate mmio-access tests.
> 
> Tested in QEMU virtual target.
> 
> Signed-off-by: Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>
> ---
>   hypervisor/arch/x86/include/asm/processor.h |  1 +
>   hypervisor/arch/x86/mmio.c                  | 47 +++++++++++++++------
>   inmates/tests/x86/mmio-access-32.c          | 21 ++++++++-
>   inmates/tests/x86/mmio-access.c             | 21 ++++++++-
>   4 files changed, 76 insertions(+), 14 deletions(-)
> 
> diff --git a/hypervisor/arch/x86/include/asm/processor.h b/hypervisor/arch/x86/include/asm/processor.h
> index 70a6c3ff..d8111690 100644
> --- a/hypervisor/arch/x86/include/asm/processor.h
> +++ b/hypervisor/arch/x86/include/asm/processor.h
> @@ -145,6 +145,7 @@
>   
>   #define X86_REX_CODE					4
>   
> +#define X86_PREFIX_OP_SZ				0x66
>   #define X86_PREFIX_ADDR_SZ				0x67
>   
>   #define X86_OP_MOVZX_OPC1				0x0f
> diff --git a/hypervisor/arch/x86/mmio.c b/hypervisor/arch/x86/mmio.c
> index df8c97a1..b836f43c 100644
> --- a/hypervisor/arch/x86/mmio.c
> +++ b/hypervisor/arch/x86/mmio.c
> @@ -54,6 +54,7 @@ struct parse_context {
>   	bool has_rex_w;
>   	bool has_rex_r;
>   	bool has_addrsz_prefix;
> +	bool has_opsz_prefix;
>   };
>   
>   static bool ctx_update(struct parse_context *ctx, u64 *pc, unsigned int advance,
> @@ -74,14 +75,33 @@ static bool ctx_update(struct parse_context *ctx, u64 *pc, unsigned int advance,
>   	return true;
>   }
>   
> -static unsigned int get_address_width(bool has_addrsz_prefix)
> +static void parse_widths(struct parse_context *ctx,
> +		         struct mmio_instruction *inst, bool parse_addr_width)
>   {
>   	u16 cs_attr = vcpu_vendor_get_cs_attr();
> -	bool long_mode = (vcpu_vendor_get_efer() & EFER_LMA) &&
> -		(cs_attr & VCPU_CS_L);
> +	bool cs_db = !!(cs_attr & VCPU_CS_DB);
> +	bool long_mode =
> +		(vcpu_vendor_get_efer() & EFER_LMA) && (cs_attr & VCPU_CS_L);
>   
> -	return long_mode ? (has_addrsz_prefix ? 4 : 8) :
> -		(!!(cs_attr & VCPU_CS_DB) ^ has_addrsz_prefix) ? 4 : 2;
> +	/* Op size prefix is ignored if rex.w = 1 */
> +	if (ctx->has_rex_w) {
> +		inst->access_size = 8;
> +	} else {
> +		if (long_mode)
> +		/* CS.d is ignored in long mode */
> +			inst->access_size = ctx->has_opsz_prefix ? 2 : 4;
> +		else
> +			inst->access_size =
> +				(cs_db ^ ctx->has_opsz_prefix) ? 4 : 2;
> +	}
> +
> +	if (parse_addr_width) {
> +		if (long_mode)
> +			inst->inst_len += ctx->has_addrsz_prefix ? 4 : 8;
> +		else
> +			inst->inst_len +=
> +				(cs_db ^ ctx->has_addrsz_prefix) ? 4 : 2;
> +	}
>   }
>   
>   struct mmio_instruction
> @@ -118,6 +138,11 @@ restart:
>   			goto error_noinst;
>   		ctx.has_addrsz_prefix = true;
>   		goto restart;
> +	case X86_PREFIX_OP_SZ:
> +		if (!ctx_update(&ctx, &pc, 1, pg_structs))
> +			goto error_noinst;
> +		ctx.has_opsz_prefix = true;
> +		goto restart;
>   	case X86_OP_MOVZX_OPC1:
>   		if (!ctx_update(&ctx, &pc, 1, pg_structs))
>   			goto error_noinst;
> @@ -134,28 +159,26 @@ restart:
>   		ctx.does_write = true;
>   		break;
>   	case X86_OP_MOV_TO_MEM:
> -		inst.access_size = ctx.has_rex_w ? 8 : 4;
> +		parse_widths(&ctx, &inst, false);
>   		ctx.does_write = true;
>   		break;
>   	case X86_OP_MOVB_FROM_MEM:
>   		inst.access_size = 1;
>   		break;
>   	case X86_OP_MOV_FROM_MEM:
> -		inst.access_size = ctx.has_rex_w ? 8 : 4;
> +		parse_widths(&ctx, &inst, false);
>   		break;
>   	case X86_OP_MOV_IMMEDIATE_TO_MEM:
> -		inst.access_size = ctx.has_rex_w ? 8 : 4;
> +		parse_widths(&ctx, &inst, false);
>   		ctx.has_immediate = true;
>   		ctx.does_write = true;
>   		break;
>   	case X86_OP_MOV_MEM_TO_AX:
> -		inst.inst_len += get_address_width(ctx.has_addrsz_prefix);
> -		inst.access_size = ctx.has_rex_w ? 8 : 4;
> +		parse_widths(&ctx, &inst, true);
>   		inst.in_reg_num = 15;
>   		goto final;
>   	case X86_OP_MOV_AX_TO_MEM:
> -		inst.inst_len += get_address_width(ctx.has_addrsz_prefix);
> -		inst.access_size = ctx.has_rex_w ? 8 : 4;
> +		parse_widths(&ctx, &inst, true);
>   		inst.out_val = guest_regs->by_index[15];
>   		ctx.does_write = true;
>   		goto final;
> diff --git a/inmates/tests/x86/mmio-access-32.c b/inmates/tests/x86/mmio-access-32.c
> index be1d470f..9c1db1d8 100644
> --- a/inmates/tests/x86/mmio-access-32.c
> +++ b/inmates/tests/x86/mmio-access-32.c
> @@ -41,6 +41,10 @@ void inmate_main(void)
>   	mmio_write32(mmio_reg, pattern);
>   	EXPECT_EQUAL(*comm_page_reg, pattern);
>   
> +	/* MOV_FROM_MEM (8b), 16-bit data, 32-bit address, OP size prefix */
> +	asm volatile("mov (%%eax), %%ax" : "=a" (reg32) : "a" (mmio_reg));
> +	EXPECT_EQUAL((u16)reg32, (u16)pattern);
> +
>   	/* MOV_FROM_MEM (8b), 32-bit data, 32-bit address */
>   	asm volatile("movl (%%ebx), %%eax"
>   		: "=a" (reg32) : "a" (0), "b" (mmio_reg));
> @@ -55,6 +59,13 @@ void inmate_main(void)
>   	EXPECT_EQUAL(reg32,
>   		     ((unsigned long)mmio_reg & ~0xffUL) | (pattern & 0xff));
>   
> +	/* MOV_FROM_MEM (8a), 8-bit data, 32-bit address, OP size prefix */
> +	asm volatile("data16 mov (%%eax), %%al"
> +		: "=a" (reg32) : "a" (mmio_reg));
> +	EXPECT_EQUAL((u8)reg32, (u8)pattern);
> +	EXPECT_EQUAL(reg32,
> +		     ((unsigned long)mmio_reg & ~0xffUL) | (pattern & 0xff));
> +
>   	/* MOVZXB (0f b6), 32-bit data, 32-bit address */
>   	asm volatile("movzxb (%%ebx), %%eax"
>   		: "=a" (reg32) : "a" (0), "b" (mmio_reg));
> @@ -87,7 +98,15 @@ void inmate_main(void)
>   	/* MOV_TO_MEM (88), 8-bit data */
>   	asm volatile("movb %%al, (%%ebx)"
>   		: : "a" (0x42), "b" (mmio_reg));
> -	EXPECT_EQUAL(*comm_page_reg, (pattern & 0xffffff00) | 0x42);
> +	EXPECT_EQUAL(*comm_page_reg, (pattern & ~0xffUL) | 0x42);
> +
> +	/* MOV_TO_MEM (88), 8-bit data, OP size prefix */
> +	asm volatile("data16 mov %%al, (%%ebx)" : : "a" (0x23), "b" (mmio_reg));
> +	EXPECT_EQUAL(*comm_page_reg, (pattern & ~0xffUL) | 0x23);
> +
> +	/* MOV_TO_MEM (89), 16-bit data, OP size prefix */
> +	asm volatile("mov %%ax, (%%ebx)" : : "a" (0x2342), "b" (mmio_reg));
> +	EXPECT_EQUAL(*comm_page_reg, (pattern & ~0xffffUL) | 0x2342);
>   
>   	/* IMMEDIATE_TO_MEM (c7), 32-bit data, mod=0, reg=0, rm=3 */
>   	asm volatile("movl %0, (%%ebx)"
> diff --git a/inmates/tests/x86/mmio-access.c b/inmates/tests/x86/mmio-access.c
> index a9d2fcaf..3794555f 100644
> --- a/inmates/tests/x86/mmio-access.c
> +++ b/inmates/tests/x86/mmio-access.c
> @@ -51,6 +51,10 @@ void inmate_main(void)
>   	mmio_write64(mmio_reg, pattern);
>   	EXPECT_EQUAL(*comm_page_reg, pattern);
>   
> +	/* MOV_FROM_MEM (8b), 16-bit data, Ox66 OP size prefix */
> +	asm volatile("mov (%%rax), %%ax" : "=a" (reg64) : "a" (mmio_reg));
> +	EXPECT_EQUAL((u16)reg64, (u16)pattern);
> +
>   	/* MOV_FROM_MEM (8b), 64-bit data, mod=0, reg=0, rm=3 */
>   	asm volatile("movq (%%rbx), %%rax"
>   		: "=a" (reg64) : "a" (0), "b" (mmio_reg));
> @@ -75,6 +79,13 @@ void inmate_main(void)
>   	EXPECT_EQUAL(reg64,
>   		     ((unsigned long)mmio_reg & ~0xffUL) | (pattern & 0xff));
>   
> +	/* MOV_FROM_MEM (8a), 8-bit data */
> +	asm volatile("data16 mov (%%rax), %%al"

The comment should probably clarify that data16 has to be ignored in 64-bit 
mode, right?

> +		: "=a" (reg64) : "a" (mmio_reg));
> +	EXPECT_EQUAL((u8)reg64, (u8)pattern);
> +	EXPECT_EQUAL(reg64,
> +		     ((unsigned long)mmio_reg & ~0xffUL) | (pattern & 0xff));
> +
>   	/* MOVZXB (0f b6), to 64-bit, mod=0, reg=0, rm=3 */
>   	asm volatile("movzxb (%%rbx), %%rax"
>   		: "=a" (reg64) : "a" (0), "b" (mmio_reg));
> @@ -129,7 +140,15 @@ void inmate_main(void)
>   	/* MOV_TO_MEM (88), 8-bit data */
>   	asm volatile("movb %%al, (%%rbx)"
>   		: : "a" (0x42), "b" (mmio_reg));
> -	EXPECT_EQUAL(*comm_page_reg, (pattern & 0xffffffffffffff00) | 0x42);
> +	EXPECT_EQUAL(*comm_page_reg, (pattern & ~0xffUL) | 0x42);
> +
> +	/* MOV_TO_MEM (88), 8-bit data, OP size prefix */
> +	asm volatile("data16 mov %%al, (%%ebx)" : : "a" (0x23), "b" (mmio_reg));
> +	EXPECT_EQUAL(*comm_page_reg, (pattern & ~0xffUL) | 0x23);
> +
> +	/* MOV_TO_MEM (89), 16-bit data, OP size prefix */
> +	asm volatile("mov %%ax, (%%ebx)" : : "a" (0x2342), "b" (mmio_reg));
> +	EXPECT_EQUAL(*comm_page_reg, (pattern & ~0xffffUL) | 0x2342);
>   
>   	/* IMMEDIATE_TO_MEM (c7), 64-bit data, mod=0, reg=0, rm=3 */
>   	asm volatile("movq %0, (%%rbx)"
> 

Jan

-- 
Siemens AG, Corporate Technology, CT RDA IOT SES-DE
Corporate Competence Center Embedded Linux

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/6294be2a-0ce1-1021-1691-c801456b36a3%40siemens.com.
For more options, visit https://groups.google.com/d/optout.
