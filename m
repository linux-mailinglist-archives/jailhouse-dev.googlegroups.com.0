Return-Path: <jailhouse-dev+bncBCJI7SMNV4NBBRWD5DTQKGQET2U6RRA@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-ed1-x539.google.com (mail-ed1-x539.google.com [IPv6:2a00:1450:4864:20::539])
	by mail.lfdr.de (Postfix) with ESMTPS id 9640938662
	for <lists+jailhouse-dev@lfdr.de>; Fri,  7 Jun 2019 10:35:18 +0200 (CEST)
Received: by mail-ed1-x539.google.com with SMTP id b33sf2041098edc.17
        for <lists+jailhouse-dev@lfdr.de>; Fri, 07 Jun 2019 01:35:18 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1559896518; cv=pass;
        d=google.com; s=arc-20160816;
        b=Y/AYqtr+cxQPGmp4V4wM7kc0AqMqpxdbSzEbmrzcUAqDoaJ1pRrEX+W6cPyJBwGWY6
         rtNV/ZPadXkqIeC/ot1vR7cxlsDl/HmW+WP/L1NI4i9b6YHHHdRUWI8MzfKxCb+dIpfb
         Nj7XHt+7Jg3AlHOabqlDRNoh/uRdUHzNsrzBUA28dn7mhApActaguNRGMcTHIhCLVHFa
         oPUNvCsssazzR1G+wyfqY1ly0lgvq4bbVgSVGitaQWcerVlxrfbvc27S3fZCS8BdWaYW
         T5Mye3BjdvoSj86GdDgb3ZzL4fzf517D30jFSCRShCFCdt4KT0Z+fofLgNpXWbQBGWC3
         OYLQ==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:content-language:in-reply-to
         :mime-version:user-agent:date:message-id:from:references:to:subject
         :sender:dkim-signature;
        bh=Mv7bgFs1UVF0gv/VAvhxFDYwae0aYlEIMcUOeij8D70=;
        b=GSBMyzAOn00z4j8yyG9XF087xNMaiQCIBlFTKAuyJWwLq0+aetYH6VQ3Lgpzgh8lEW
         UPlm1k1RFgTdsjujCkzj4B4OUw8XxMcQg7X3ZsSw5dUdPPpJqjhf5k/mx8ldRum4nkZW
         LRNT1uS7x53nNDXPFCh9glO0vvdDZ0BAkbJNuY35IuH0iFXqcm3P1BnTfu15+sqd3hc1
         84Nd9ulWMSHmLRQrWblnWifjR4JHHLjIn8Oubx/aDmXn4uwxtxT5JdyDsdGiZKsTtF/f
         q3lM9oTlFcy5dV43BOv2t+OQTZ+DDhMt4SWHMDg5sTLeveyP3XOtRQawhMDvWYGfyOH/
         fzKw==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 194.138.37.39 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:subject:to:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :list-post:list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=Mv7bgFs1UVF0gv/VAvhxFDYwae0aYlEIMcUOeij8D70=;
        b=rcHyw5cRpO4DnABYcN/h3nvEWowH1cxG3cbAQW86iqVoOZh+6rUYomg3Yj2rBxeCLw
         qVJO/mLeErKSgcZ5u3U9H9TjSahK5xIJeAI6JVrVeHAlBPbxRkunJU3m3GE03hjpkovI
         tkstI/1T36BdTmCM0ZNa7b0eZW5AELNX7pzB4UNP6THkOE0GwZyTipByeq4TPBX5i3a3
         kPRr7RlDfOjjjx76dGZHkd+qF+tdKk8bAFYgOR0Txotzr04sJSrzuHKoBoDLbKXtTb/q
         hxUayr/N34sb66qI3ZEX07UFhH7iqyn/GhELG5k0YAQ2NgSZprR6WQyP1sz1mvnEbNeb
         O/aw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:subject:to:references:from:message-id
         :date:user-agent:mime-version:in-reply-to:content-language
         :x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:x-spam-checked-in-group:list-post:list-help
         :list-archive:list-subscribe:list-unsubscribe;
        bh=Mv7bgFs1UVF0gv/VAvhxFDYwae0aYlEIMcUOeij8D70=;
        b=t6PXEzZl/kNSEnMaRE3HKLb21Zmkrk1JjAn1kF3G9xWus2WgtL/P5usW2NFieQsJUS
         HLGddQHKzhS2IX6Mi+CH/fEfM989/6vjuDbCs+/CYCmH8XpifRCt5GNdtyzwEDJx6oPo
         KUAMQZ9u3QONYAvKzagycWuOBIMppW3S3KCfFRuxbpVib3EN/CKou9VWDsGget/2S8vL
         QX12WCG5o6nUsiCMicgKh4DS2I4KRxwozk39/7xarzJamNLxo0ot/7joDTc7T3OAtzsv
         5gCeqVfMHn8Cx+iK83RolO4to5M8VzjUXTrT9w1NMwWzlX3j55aNjPlPHmMPW4OTyMyo
         ipTA==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: APjAAAWyzzIQM6Q6ZVzN8AmpCnzkrvu9Kp4ewBOMrnTm10rlHxaoXS/0
	YMQbmecU+6LSVsUOrel8HoA=
X-Google-Smtp-Source: APXvYqy8sOxtecBeZYaII8vgKvy4BzxkyqUIp/Da199IKz4FoepaPDuNT0VgN6ZcYaXsHboFM9ysmA==
X-Received: by 2002:a17:906:3455:: with SMTP id d21mr45889579ejb.66.1559896518363;
        Fri, 07 Jun 2019 01:35:18 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a50:9728:: with SMTP id c37ls608992edb.12.gmail; Fri, 07 Jun
 2019 01:35:17 -0700 (PDT)
X-Received: by 2002:aa7:c810:: with SMTP id a16mr12297033edt.188.1559896517513;
        Fri, 07 Jun 2019 01:35:17 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1559896517; cv=none;
        d=google.com; s=arc-20160816;
        b=SVBzAg4iQMiNkCBm8c/YDMQl+lcUtQn/qzMNDfG/9X2rYpKz/+ebUl3Oc9UHfKwgqc
         R1PLj4P3j590GUQkEGYgJSrqcryumAHGt8ecNQhRTtHVGlRlNhbO/wawd3AB3biW49d3
         EJKTbv1dvRxFg5duDVFmB/VZnxOfgjeXh+J5HTnpt8ZRraZ2v5xehRREtD/n6Yhr1+ZA
         pkyajFBpmfQ42vSaDIkAmz1BFIXp956uGX+Q+NXj9VM+28gKrrZzr9MbWfeOQsH3Ymsf
         t95tibeMyw2twMIo8t+3U53qNvY28GcVoOeMEUWp9E444w433ikSnh28iTNbYUrGzkoF
         YXYg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:to:subject;
        bh=4GdU67VEm5P5M8Ir4qrg+9kJ27rxnMYzOhy0y8xnGJk=;
        b=VnQNFiWThy2xF6U1ln7tHKCThFGl+ul7r4DceAn6iz9Kg6uPmek9jpk4BDDNLQyp2y
         0/EHDrZEOU/YMXyCEn/5AuEtK6TB7Lojy4SY0T88QrHglB5jckM0W/wdDGC0S3c0gPJ5
         hJ7Y6WNeIUp09PwZRR2HbSZT7b53u01jUHvlevb14c3dockSv225vfRxLCqgtnh9BYCC
         Hap0eLEy86XC8aDfLICaFKmHQNR/r4qkK/2dY9P33q3ihhsjCdNFDXrxMfnIy1YsTXgG
         9mVGHhPMRLmfJliSiDhm8+98Db2ewJTV14ehS7CNIsoB4RGzBXb7sRq2nFTeUEj6p9Ta
         mcYA==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 194.138.37.39 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
Received: from lizzard.sbs.de (lizzard.sbs.de. [194.138.37.39])
        by gmr-mx.google.com with ESMTPS id t36si45151edb.0.2019.06.07.01.35.17
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 07 Jun 2019 01:35:17 -0700 (PDT)
Received-SPF: pass (google.com: domain of jan.kiszka@siemens.com designates 194.138.37.39 as permitted sender) client-ip=194.138.37.39;
Received: from mail2.sbs.de (mail2.sbs.de [192.129.41.66])
	by lizzard.sbs.de (8.15.2/8.15.2) with ESMTPS id x578ZHFY022482
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 7 Jun 2019 10:35:17 +0200
Received: from [167.87.58.12] ([167.87.58.12])
	by mail2.sbs.de (8.15.2/8.15.2) with ESMTP id x578ZGss006697;
	Fri, 7 Jun 2019 10:35:16 +0200
Subject: Re: [PATCH v2 1/3] x86: mmio: fix accidental clears of bits in
 registers
To: Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>,
        jailhouse-dev@googlegroups.com
References: <20190606224457.1053-1-ralf.ramsauer@oth-regensburg.de>
 <20190606224457.1053-2-ralf.ramsauer@oth-regensburg.de>
From: Jan Kiszka <jan.kiszka@siemens.com>
Message-ID: <d9071e5a-ae9c-5915-b81d-eafb57d27789@siemens.com>
Date: Fri, 7 Jun 2019 10:35:16 +0200
User-Agent: Mozilla/5.0 (X11; U; Linux i686 (x86_64); de; rv:1.8.1.12)
 Gecko/20080226 SUSE/2.0.0.12-1.1 Thunderbird/2.0.0.12 Mnenhy/0.7.5.666
MIME-Version: 1.0
In-Reply-To: <20190606224457.1053-2-ralf.ramsauer@oth-regensburg.de>
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
>   hypervisor/arch/x86/include/asm/mmio.h |  5 +++++
>   hypervisor/arch/x86/mmio.c             |  5 ++++-
>   hypervisor/arch/x86/vcpu.c             |  7 +++++--
>   inmates/tests/x86/mmio-access-32.c     | 10 +++++++---
>   inmates/tests/x86/mmio-access.c        | 10 +++++++---
>   5 files changed, 28 insertions(+), 9 deletions(-)
> 
> diff --git a/hypervisor/arch/x86/include/asm/mmio.h b/hypervisor/arch/x86/include/asm/mmio.h
> index 756c84a8..4b3b2ea8 100644
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
> +	unsigned long reg_preserve_mask;
>   };
>   
>   /**
> diff --git a/hypervisor/arch/x86/mmio.c b/hypervisor/arch/x86/mmio.c
> index b234bd79..c04cf449 100644
> --- a/hypervisor/arch/x86/mmio.c
> +++ b/hypervisor/arch/x86/mmio.c
> @@ -85,7 +85,7 @@ x86_mmio_parse(const struct guest_paging_structures *pg_structs, bool is_write)
>   	struct parse_context ctx = { .remaining = X86_MAX_INST_LEN,
>   				     .count = 1 };
>   	union registers *guest_regs = &this_cpu_data()->guest_regs;
> -	struct mmio_instruction inst = { .inst_len = 0 };
> +	struct mmio_instruction inst = { 0 };
>   	u64 pc = vcpu_vendor_get_rip();
>   	unsigned int n, skip_len = 0;
>   	bool has_immediate = false;
> @@ -168,6 +168,9 @@ restart:
>   
>   	op[2].raw = *ctx.inst;
>   
> +	if (!does_write && inst.access_size < 4)
> +		inst.reg_preserve_mask = ~BYTE_MASK(inst.access_size);
> +
>   	/* ensure that we are actually talking about mov imm,<mem> */
>   	if (op[0].raw == X86_OP_MOV_IMMEDIATE_TO_MEM && op[2].modrm.reg != 0)
>   		goto error_unsupported;
> diff --git a/hypervisor/arch/x86/vcpu.c b/hypervisor/arch/x86/vcpu.c
> index 5a557d0b..a1fb8660 100644
> --- a/hypervisor/arch/x86/vcpu.c
> +++ b/hypervisor/arch/x86/vcpu.c
> @@ -231,6 +231,7 @@ bool vcpu_handle_mmio_access(void)
>   	struct mmio_access mmio = {.size = 0};
>   	struct vcpu_mmio_intercept intercept;
>   	struct mmio_instruction inst;
> +	unsigned long *reg;
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
> +			reg= &guest_regs->by_index[inst.in_reg_num];
> +			*reg = (*reg & inst.reg_preserve_mask) | mmio.value;
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

Hmm, that test looks redundant to the following one. Same for other 
double-checks in this patch and patch 3. Or am I missing something?

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

Jan

-- 
Siemens AG, Corporate Technology, CT RDA IOT SES-DE
Corporate Competence Center Embedded Linux

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/d9071e5a-ae9c-5915-b81d-eafb57d27789%40siemens.com.
For more options, visit https://groups.google.com/d/optout.
