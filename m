Return-Path: <jailhouse-dev+bncBD4JZQXE5UFRBW573PTQKGQEH57F6WI@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-wm1-x338.google.com (mail-wm1-x338.google.com [IPv6:2a00:1450:4864:20::338])
	by mail.lfdr.de (Postfix) with ESMTPS id B0A90351BC
	for <lists+jailhouse-dev@lfdr.de>; Tue,  4 Jun 2019 23:17:15 +0200 (CEST)
Received: by mail-wm1-x338.google.com with SMTP id t76sf50867wmt.9
        for <lists+jailhouse-dev@lfdr.de>; Tue, 04 Jun 2019 14:17:15 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1559683035; cv=pass;
        d=google.com; s=arc-20160816;
        b=vf4weCSUfVziNZy4ABWLyt8/YIBR5Xe2RxDEbXNZolYifW+gYhTtCDcrxh1jZGzPfU
         NrUY8HwfJLXBVmFi0xNAo8BEQjg92naVB1Q9MiicT9g316AR1sa6M/AFNJgrwtNewvZ8
         f8ak1UTIWW5J3ZZHWc49RYSG6NrPxsAIzRLBrcxMNXqWJ76TH27xzZ5M4v99to7u6N34
         dPM034vZNps7R5eI4HZYPHdUtzV/sbcO9LgOrG5KTOtgzWR6jzD4/iHXFzNmSmB4jw9j
         kRtXmpCqIQDbOWZW5sBLm/wEFak6YaCJSvguSEtrzbrjD22RSiDRR+kHUfKEmGnGw2lA
         0D3g==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:content-language:in-reply-to
         :mime-version:user-agent:date:message-id:subject:autocrypt:openpgp
         :from:references:cc:to:sender:dkim-signature;
        bh=vp3QUwAxeE4zDAaDQ9OU4K65L5XPlpxAMmqI6VskyS0=;
        b=KK7P1bcbiU5SLrUSHjTdblkLIga5pgoGWi3UeETEc1DWXZndlSofZtVdAWt9nRnG3O
         FUAIKkxu/e4zWuBXG5gk54KH7grZsZTc0wk+m/zHS1TZt+vQ1Z8drFEtXEDZKr/mNKw+
         jj27G93J35IqY/ZsO9PVO6YAXZHHHwphAuaf6ma+2e0l2cehewG1hzR/YAXleD87KYPg
         nGrlgfwBFirrjdvXsK/n/tyC1LG4QmI1xakeBanR/h7UWHKerkPrjdKFXcKQUK84P3H7
         zCBrf/x95nd1/ghzdoP+dy0+5W79qnM/a1tYgCPu1nIjLMbU1uBR3apF136YfVQixlE5
         qrVA==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass header.i=@oth-regensburg.de header.s=mta01-20160622 header.b=vtz3xsAj;
       spf=pass (google.com: domain of ralf.ramsauer@oth-regensburg.de designates 194.95.104.11 as permitted sender) smtp.mailfrom=ralf.ramsauer@oth-regensburg.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=oth-regensburg.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:to:cc:references:from:openpgp:autocrypt:subject:message-id
         :date:user-agent:mime-version:in-reply-to:content-language
         :x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=vp3QUwAxeE4zDAaDQ9OU4K65L5XPlpxAMmqI6VskyS0=;
        b=euE7umojksaW9L5LDipSZkbEzdzszOzlcoQwC28xYyiTnFG04SoFb+gJFZTUxbZpit
         8q2kHcQHyDjW07DU6fR/TwMqNICX4W6oB027118sBFN2MpqmYYptim8Xabwah/9HMDna
         9kgvM3JpmVWGrG9SM0cE9TlbWuPj/Axc3ZzEZwul/pkC5QAWJMLbtiNWg1/UxmLCQ28u
         6FEvA59GSoQeeJeE+Hnb3qYs6WBskAvMHU4yDJZOjS9VZGBIGc5MVPW5pglm2S8eaVNY
         /pRGjggyJFPNB9khRbJsSldoYhDabk9h3iQrPvw0UpA53b+BbfF0JKANwn0U646w/cHE
         lFkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:to:cc:references:from:openpgp:autocrypt
         :subject:message-id:date:user-agent:mime-version:in-reply-to
         :content-language:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :x-spam-checked-in-group:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=vp3QUwAxeE4zDAaDQ9OU4K65L5XPlpxAMmqI6VskyS0=;
        b=azSgRDN51jUj60qiQ148fmdumUm1YtkSUJDvKFzRLNApD1wBKv+5TyGsYI6QPUnmFc
         sBDRSvuHXZaI4s9gdaC1CHNTBcuVLoMT4Gojpn6DN9EKw5pOY7QxmFH/7zspfAlv6HCP
         l7lL3yrgELIFL/30/PpuswuTSdFbOzsuSmndeh656QyeCg7tgvbv3c24MF5AhwpL3ice
         cYfCWLvUdnXFJmjLqQtLx7pu024+OyfbN6OjdqHOHXoqSzUP3rOUaPPTt2NT9rBDuWQ2
         7Rfw4uzxylIZ3pliDdZJHBCHL0uJxnNn3G8goz5IJ5Ua6BzB38tULHjOw+rHIPfmmi/5
         Gm2w==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: APjAAAUu/R84yrVQE7pwm+gVMB4ECfYiQYvGi1MNGaKt5FpC+92xcqbK
	YrQBGz2b8Q0pbhY5yPh75aE=
X-Google-Smtp-Source: APXvYqw0AOZxU3OawuLcuHfiRxnicxldaojly0URDw75kzVu+YkHmNeP0Ai6zKK2uG4nY6rKoml83w==
X-Received: by 2002:a1c:cc0d:: with SMTP id h13mr9858372wmb.119.1559683035409;
        Tue, 04 Jun 2019 14:17:15 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:adf:ec02:: with SMTP id x2ls1625572wrn.6.gmail; Tue, 04 Jun
 2019 14:17:14 -0700 (PDT)
X-Received: by 2002:adf:c5c1:: with SMTP id v1mr4678252wrg.129.1559683034878;
        Tue, 04 Jun 2019 14:17:14 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1559683034; cv=none;
        d=google.com; s=arc-20160816;
        b=crVE2qhrekK0Uq6JZKH8l8jDJs79aUfwZfM1kORd/EYRo1X04azhWHR2VRKwCEbkhv
         rSZapg1Dflz/EBjHgQuPoyvXIs90Mpsmi5OTnb0IT7euiczDmY4GPvj7lQwki+Q5d9sF
         iw7TXGPlpA7JT+Lp/oflV7E5StASzLJRG8bDPV7DvVsz2kvZy2EnSpZ13v+uqm4FOubA
         EvsmEeaEIDbNnjvIAF6Qtr5DsAx4Rwj13+gp8ocwFdDsAWfyxJsvL8ymWHxUmA4sj82K
         oEyrhqKXWpHmZDsvgqx895CSpJ8pFamcrOBTHEISkxaiJ0ShW/FweWa0SfVZN2IVpCAC
         6vgg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:subject:autocrypt:openpgp:from
         :references:cc:to:dkim-signature;
        bh=Y2NcUn2QJr+5gZVqTBYBj3mZzdov36k3ykBZ90iEyUY=;
        b=JYPdsSKRBLhFtSCRKfgmFtyhkd0mwpSXFgFgFy6u4/BtQRiz0/QJulHq9ye1rqNxAG
         fUb9u7e0GZckyWOoheRO53OHeTtPE3TIW3InKAJxmdcTuyxUOshPYrDR1JHkPB/1IU3j
         BiROEcEkyPXkqEu+zDK/W/FZxI2+WbaL2AEzbDeirodH9olnF5AyC6rJliJIeg3IhQil
         3+AYQHigaZPhsNc6tVWUxpjff2vGyEs7qhRgFRVC62L/U7tRMrYNosXtKxBQX62URV/o
         Klg6O+OWj6MbevFS8UCW+H39JO+nmpMSDzfBJF0Q/jXhEm9euoQ0Yn+ED7fukpIjstcd
         4FBQ==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       dkim=pass header.i=@oth-regensburg.de header.s=mta01-20160622 header.b=vtz3xsAj;
       spf=pass (google.com: domain of ralf.ramsauer@oth-regensburg.de designates 194.95.104.11 as permitted sender) smtp.mailfrom=ralf.ramsauer@oth-regensburg.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=oth-regensburg.de
Received: from mta01.hs-regensburg.de (mta01.hs-regensburg.de. [194.95.104.11])
        by gmr-mx.google.com with ESMTPS id u18si134209wrn.5.2019.06.04.14.17.14
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 04 Jun 2019 14:17:14 -0700 (PDT)
Received-SPF: pass (google.com: domain of ralf.ramsauer@oth-regensburg.de designates 194.95.104.11 as permitted sender) client-ip=194.95.104.11;
Received: from E16S02.hs-regensburg.de (e16s02.hs-regensburg.de [IPv6:2001:638:a01:8013::92])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(Client CN "E16S02", Issuer "E16S02" (not verified))
	by mta01.hs-regensburg.de (Postfix) with ESMTPS id 45JPrV2mGvzyYc;
	Tue,  4 Jun 2019 23:17:14 +0200 (CEST)
Received: from [172.23.3.82] (194.95.106.138) by E16S02.hs-regensburg.de
 (2001:638:a01:8013::92) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1713.5; Tue, 4 Jun 2019
 23:17:14 +0200
To: Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>,
	<jailhouse-dev@googlegroups.com>, Jan Kiszka <jan.kiszka@siemens.com>
CC: Mario Mintel <mario.mintel@st.oth-regensburg.de>
References: <20190604210229.23554-1-ralf.ramsauer@oth-regensburg.de>
From: Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>
Openpgp: preference=signencrypt
Autocrypt: addr=ralf.ramsauer@oth-regensburg.de; keydata=
 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
 RncIIYr0LjXAAzY=
Subject: Re: [PATCH] x86: mmio: add support for 0x66 operand prefix
Message-ID: <813d52b7-789f-acea-98a3-ed71e36a6022@oth-regensburg.de>
Date: Tue, 4 Jun 2019 23:17:13 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.0
MIME-Version: 1.0
In-Reply-To: <20190604210229.23554-1-ralf.ramsauer@oth-regensburg.de>
Content-Type: text/plain; charset="UTF-8"
Content-Language: en-PH
X-Originating-IP: [194.95.106.138]
X-ClientProxiedBy: E16S02.hs-regensburg.de (2001:638:a01:8013::92) To
 E16S02.hs-regensburg.de (2001:638:a01:8013::92)
X-Original-Sender: ralf.ramsauer@oth-regensburg.de
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass
 header.i=@oth-regensburg.de header.s=mta01-20160622 header.b=vtz3xsAj;
       spf=pass (google.com: domain of ralf.ramsauer@oth-regensburg.de
 designates 194.95.104.11 as permitted sender) smtp.mailfrom=ralf.ramsauer@oth-regensburg.de;
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

just a short side note:

x86 opcode parsing is really a hell, by the way...

All existing tests in mmio-access tests (of course) still pass. [1] This
doesn't necessarily mean that my patch is absolutely correct. Please
review carefully.

get_op_width() returns the width according to this (really helpful) table:

https://wiki.osdev.org/X86-64_Instruction_Encoding#Operand-size_and_address-size_override_prefix


I make the assumption that if rex.w is set, we can always return 8 for
performance reasons (we can save other useless checks in this case).

rex.w must only be set in long mode, and then we always have 8b width,
so there's no need to check for non-long mode if rex.w is set -- or
should we? Could this maybe be exploited by faulty opcodes by guests
running in non-long mode that inject 0x66 8b 00 e.g.? (e.g., by targeted
access to page boundaries)

  Ralf

[1] Without my SSE series, 32-bit requires -mno-sse to be tested at the
    moment

On 6/4/19 11:02 PM, Ralf Ramsauer wrote:
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
>  hypervisor/arch/x86/include/asm/processor.h |  1 +
>  hypervisor/arch/x86/mmio.c                  | 37 +++++++++++++++++----
>  inmates/tests/x86/mmio-access-32.c          |  4 +++
>  inmates/tests/x86/mmio-access.c             |  4 +++
>  4 files changed, 40 insertions(+), 6 deletions(-)
> 
> diff --git a/hypervisor/arch/x86/include/asm/processor.h b/hypervisor/arch/x86/include/asm/processor.h
> index 70a6c3ff..d8111690 100644
> --- a/hypervisor/arch/x86/include/asm/processor.h
> +++ b/hypervisor/arch/x86/include/asm/processor.h
> @@ -145,6 +145,7 @@
>  
>  #define X86_REX_CODE					4
>  
> +#define X86_PREFIX_OP_SZ				0x66
>  #define X86_PREFIX_ADDR_SZ				0x67
>  
>  #define X86_OP_MOVZX_OPC1				0x0f
> diff --git a/hypervisor/arch/x86/mmio.c b/hypervisor/arch/x86/mmio.c
> index b234bd79..6d9ad1c5 100644
> --- a/hypervisor/arch/x86/mmio.c
> +++ b/hypervisor/arch/x86/mmio.c
> @@ -79,6 +79,26 @@ static unsigned int get_address_width(bool has_addrsz_prefix)
>  		(!!(cs_attr & VCPU_CS_DB) ^ has_addrsz_prefix) ? 4 : 2;
>  }
>  
> +static unsigned int get_op_width(bool has_rex_w, bool has_opsz_prefix)
> +{
> +	u16 cs_attr;
> +	bool long_mode;
> +
> +	/* Op size prefix is ignored if rex.w = 1 */
> +	if (has_rex_w)
> +		return 8;
> +
> +	cs_attr = vcpu_vendor_get_cs_attr();
> +	long_mode = (vcpu_vendor_get_efer() & EFER_LMA) &&
> +		    (cs_attr & VCPU_CS_L);
> +
> +	if (long_mode)
> +		/* CS.d is ignored in long mode */
> +		return has_opsz_prefix ? 2 : 4;
> +
> +	return (!!(cs_attr & VCPU_CS_DB) ^ has_opsz_prefix) ? 4 : 2;
> +}
> +
>  struct mmio_instruction
>  x86_mmio_parse(const struct guest_paging_structures *pg_structs, bool is_write)
>  {
> @@ -94,6 +114,7 @@ x86_mmio_parse(const struct guest_paging_structures *pg_structs, bool is_write)
>  	bool has_rex_w = false;
>  	bool has_rex_r = false;
>  	bool has_addrsz_prefix = false;
> +	bool has_opsz_prefix = false;
>  
>  	if (!ctx_update(&ctx, &pc, 0, pg_structs))
>  		goto error_noinst;
> @@ -114,9 +135,13 @@ restart:
>  	}
>  	switch (op[0].raw) {
>  	case X86_PREFIX_ADDR_SZ:
> +	case X86_PREFIX_OP_SZ:
>  		if (!ctx_update(&ctx, &pc, 1, pg_structs))
>  			goto error_noinst;
> -		has_addrsz_prefix = true;
> +		if (op[0].raw == X86_PREFIX_ADDR_SZ)
> +			has_addrsz_prefix = true;
> +		else
> +			has_opsz_prefix = true;
>  		goto restart;
>  	case X86_OP_MOVZX_OPC1:
>  		if (!ctx_update(&ctx, &pc, 1, pg_structs))
> @@ -134,28 +159,28 @@ restart:
>  		does_write = true;
>  		break;
>  	case X86_OP_MOV_TO_MEM:
> -		inst.access_size = has_rex_w ? 8 : 4;
> +		inst.access_size = get_op_width(has_rex_w, has_opsz_prefix);
>  		does_write = true;
>  		break;
>  	case X86_OP_MOVB_FROM_MEM:
>  		inst.access_size = 1;
>  		break;
>  	case X86_OP_MOV_FROM_MEM:
> -		inst.access_size = has_rex_w ? 8 : 4;
> +		inst.access_size = get_op_width(has_rex_w, has_opsz_prefix);
>  		break;
>  	case X86_OP_MOV_IMMEDIATE_TO_MEM:
> -		inst.access_size = has_rex_w ? 8 : 4;
> +		inst.access_size = get_op_width(has_rex_w, has_opsz_prefix);
>  		has_immediate = true;
>  		does_write = true;
>  		break;
>  	case X86_OP_MOV_MEM_TO_AX:
>  		inst.inst_len += get_address_width(has_addrsz_prefix);
> -		inst.access_size = has_rex_w ? 8 : 4;
> +		inst.access_size = get_op_width(has_rex_w, has_opsz_prefix);
>  		inst.in_reg_num = 15;
>  		goto final;
>  	case X86_OP_MOV_AX_TO_MEM:
>  		inst.inst_len += get_address_width(has_addrsz_prefix);
> -		inst.access_size = has_rex_w ? 8 : 4;
> +		inst.access_size = get_op_width(has_rex_w, has_opsz_prefix);
>  		inst.out_val = guest_regs->by_index[15];
>  		does_write = true;
>  		goto final;
> diff --git a/inmates/tests/x86/mmio-access-32.c b/inmates/tests/x86/mmio-access-32.c
> index 2f47f211..b4f83850 100644
> --- a/inmates/tests/x86/mmio-access-32.c
> +++ b/inmates/tests/x86/mmio-access-32.c
> @@ -41,6 +41,10 @@ void inmate_main(void)
>  	mmio_write32(mmio_reg, pattern);
>  	EXPECT_EQUAL(*comm_page_reg, pattern);
>  
> +	/* MOV_FROM_MEM (8b), 16-bit data, 32-bit address, OP size prefix */
> +	asm volatile("mov (%%eax), %%ax" : "=a" (reg32) : "a" (mmio_reg));
> +	EXPECT_EQUAL(reg32, (u16)pattern);
> +
>  	/* MOV_FROM_MEM (8b), 32-bit data, 32-bit address */
>  	asm volatile("movl (%%ebx), %%eax"
>  		: "=a" (reg32) : "a" (0), "b" (mmio_reg));
> diff --git a/inmates/tests/x86/mmio-access.c b/inmates/tests/x86/mmio-access.c
> index 0e6a56b1..86694353 100644
> --- a/inmates/tests/x86/mmio-access.c
> +++ b/inmates/tests/x86/mmio-access.c
> @@ -51,6 +51,10 @@ void inmate_main(void)
>  	mmio_write64(mmio_reg, pattern);
>  	EXPECT_EQUAL(*comm_page_reg, pattern);
>  
> +	/* MOV_FROM_MEM (8b), 16-bit data, Ox66 OP size prefix */
> +	asm volatile("mov (%%rax), %%ax" : "=a" (reg64) : "a" (mmio_reg));
> +	EXPECT_EQUAL(reg64, (u16)pattern);
> +
>  	/* MOV_FROM_MEM (8b), 64-bit data, mod=0, reg=0, rm=3 */
>  	asm volatile("movq (%%rbx), %%rax"
>  		: "=a" (reg64) : "a" (0), "b" (mmio_reg));
> 

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/813d52b7-789f-acea-98a3-ed71e36a6022%40oth-regensburg.de.
For more options, visit https://groups.google.com/d/optout.
