Return-Path: <jailhouse-dev+bncBCJI7SMNV4NBB2OW3PTQKGQEKSTSEBQ@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-ed1-x53c.google.com (mail-ed1-x53c.google.com [IPv6:2a00:1450:4864:20::53c])
	by mail.lfdr.de (Postfix) with ESMTPS id D14E935285
	for <lists+jailhouse-dev@lfdr.de>; Wed,  5 Jun 2019 00:06:33 +0200 (CEST)
Received: by mail-ed1-x53c.google.com with SMTP id r5sf2428952edd.21
        for <lists+jailhouse-dev@lfdr.de>; Tue, 04 Jun 2019 15:06:33 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1559685993; cv=pass;
        d=google.com; s=arc-20160816;
        b=NZN9L9qUw93XFkjhFgwuifeJkJBew3zttR16Hw56YRVLBSqPmb3Lt1RTV60r+CG3BA
         4ZKXTJAMmjlr/nRhX8+AnkbUKtSDFzU2YYEDClK3DO3tMj3BXLEAG9TwE7gLjlYwYRk7
         gc6zjeO2i/nMiZHgID4gHmZpW/e82dzszqBfBPywTmmSzWNN6MzPVAm4QzipS/lUXYIb
         mbVPbv8pOmiYSA+T7Sm2F446vSJsYUUnWkIFDLrZHWIPm82bAO0wn3Qqw16kt7yg1f7h
         cX1oyDfaCNzQxQyujTLM9UR6rasKlkxvlEBp24l1Y8B0wUkz3ILkF0oLGGUukZfgT85M
         n2ow==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:content-language:in-reply-to
         :mime-version:user-agent:date:message-id:from:references:cc:to
         :subject:sender:dkim-signature;
        bh=jGBpfcK8+YSpS7Mtyo2bVqas79RK6ndF4XSZf2iydzg=;
        b=q1RO46T0C8PkrjnrnXqO3ZKlCm7IJwzYZ5ay/sYjp3GfOluPGfUySZjyo16ExEmwzT
         /WBD7H6A6Gl3vADT95pQgOJBbHkfCCudL471enogzh35zEJU6F0vr9WkiF0o6uHVGZnl
         RE/f+Fot6cDU7CFpTENmAMpNuFpfLqNXZVLq+cXX8UYZ91FFTOTra6ZUqtd02WpnFevY
         wiCF5DC7DjFRSzJdXQmnihhq5g3hbd09CqO/nkuTosMPA1l3zpj+RifRU+CFsJpf/3tq
         IoW6B9DaUT/VnoO6N3ZEpn84cddCpPcmR/e80wTrbUeVVO1pz0OFSBthel6pes31Lx2m
         9tCA==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.2 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :list-post:list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=jGBpfcK8+YSpS7Mtyo2bVqas79RK6ndF4XSZf2iydzg=;
        b=EBLZCR1qd436uSzEMy3HmjLSB0I1FTMhFw8HFHxxCAZWzAP3jciOQSweSmYszQGiyV
         UONk7o7Mmne/xuaBz7gzdxv8stBhG+3EkW+YmmFLhL5iYlgbgbOxLkF5H+8CDO+kGaJU
         4eAUPaGAZxNV/j/LUZO3HAFQTJgOjMGAgt5nLVKwDCOHALeg4juVOtidhjQYFC69rek3
         JCqyWXRbBZvEOl+hKjIZZ6A9lR2o4+6ATE5EAe7ziDtDjp9URjeHG4J9AdkrH1n117DF
         42D27eVJgXrvpuUpCi4n6BOJ6l1SeVuv5j3CzeIoBRQ7LwElvd4g7xqvwNuHRWUzMHFX
         SH0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:subject:to:cc:references:from:message-id
         :date:user-agent:mime-version:in-reply-to:content-language
         :x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:x-spam-checked-in-group:list-post:list-help
         :list-archive:list-subscribe:list-unsubscribe;
        bh=jGBpfcK8+YSpS7Mtyo2bVqas79RK6ndF4XSZf2iydzg=;
        b=Yog4iuFow41yNwYlny4sMngMJQb9MpYQZZam10g4Q6jg/g8eMFVdJ4YNs26CHtFhbz
         343mNZArycJ2g0uPKuvOgX7QFNAWQ8ayh0hi0f/xV0qtxJvrcRNPl75h026TM8gNENi0
         LJ+M6NCNSY0P9TAF97HQisiiuNB+WIn/vLFMlYyCMovzbxv1iK/k3xLDc3zGzbgA9jEU
         RD/YKMpV4Kqk8eZ1oDzLN9d+waRXh3+lRPbzP1ioTTgAeIhWop1dgj8F3MzZL/d3AHH8
         eY22JDgnHNg2ik2WV6/F63d2uFQDMekOztiYaDraTHyDoZdryNlZQ1z3XeV+nHdbDZCW
         9Zkw==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: APjAAAXimjz7fMNZqZud2tAvJWJ0oXhr8MpUNW+5PHAFF1Iu8NK1FuoY
	u+rs/RDryM/axrq/9BKtNrs=
X-Google-Smtp-Source: APXvYqzBXllfcp8dPHpH5xc0/qoK3afaPdHxl197R4MORDxlQmL1xfUltEhqpdYlOS79PEi8BgUWfA==
X-Received: by 2002:a17:906:4694:: with SMTP id a20mr17757687ejr.67.1559685993576;
        Tue, 04 Jun 2019 15:06:33 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a17:906:7ad8:: with SMTP id k24ls84829ejo.12.gmail; Tue, 04
 Jun 2019 15:06:32 -0700 (PDT)
X-Received: by 2002:a17:906:2594:: with SMTP id m20mr32471149ejb.217.1559685992954;
        Tue, 04 Jun 2019 15:06:32 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1559685992; cv=none;
        d=google.com; s=arc-20160816;
        b=fKd3VQBRchz0IE73FIp/EgZYp6TAepsdXWADHjrg6GmZWZrS+hJfxItAS9c+7GCLC9
         A3x+6oa1ZlwwXMr/Wvmv44HnReABaMrmms+rxi4txm1Ad0TNto1oixA5qXkfq/wvvCtP
         99uV76zXxM53b68A/NmN01MAxZKP//hGWFQF95BmFuXq/k6lFWVDRj+XuzV/MHkDNEbw
         fhpicdeiVwLWib/18A/Ki6bzaER1q6QeOZ2fiFKYkBSd8WDDmYgyIPkGkJb+Gqz9aJtN
         zYjhuI9maZXFvMPMc6g8wHSdgNzOyBAh+kTGvpV2qTPd8IYo+dhbOAmV2zOOcubtxoKW
         2cbQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:cc:to:subject;
        bh=BipxLengZQF7cGykAX4xgv1HlHwoq1BMHcWYpBsJaqw=;
        b=jrG5enof8Mo8DMpENCh7KIancZEcA4EOpugwR9A89eMV+R7+ohguirHIEQMNlUb1Yj
         5YLzg3xq2bj2g0rvMvWhktQxS3rPjQAKsungQcideuV7S+QutRKMUkWlQ1rb6m3DeWrF
         wBgGfc/5yc4XJnZ761Q1ZT1kcvBZfTkF2afPaB11RP9Lq5vDXuN+7jFWQPuL0nDfC6w7
         Z9Zhm0HobouPN9j8pgSGtBrnAsyJKnM0QGvB2cscG8Ez8Do6TOrMhhlEJh9PyrnKQ1QV
         5USch7x2I+RmqJsYwPHC4Zw7wdToBQcgUNJ50o62c3inB2fr5MKiBm5B4LSTT1MvMRR1
         I5SA==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.2 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
Received: from thoth.sbs.de (thoth.sbs.de. [192.35.17.2])
        by gmr-mx.google.com with ESMTPS id o1si446991edc.2.2019.06.04.15.06.32
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 04 Jun 2019 15:06:32 -0700 (PDT)
Received-SPF: pass (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.2 as permitted sender) client-ip=192.35.17.2;
Received: from mail2.sbs.de (mail2.sbs.de [192.129.41.66])
	by thoth.sbs.de (8.15.2/8.15.2) with ESMTPS id x54M6Wge028362
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 5 Jun 2019 00:06:32 +0200
Received: from [167.87.33.4] ([167.87.33.4])
	by mail2.sbs.de (8.15.2/8.15.2) with ESMTP id x54M6V2d003739;
	Wed, 5 Jun 2019 00:06:31 +0200
Subject: Re: [PATCH] x86: mmio: add support for 0x66 operand prefix
To: Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>,
        jailhouse-dev@googlegroups.com
Cc: Mario Mintel <mario.mintel@st.oth-regensburg.de>
References: <20190604210229.23554-1-ralf.ramsauer@oth-regensburg.de>
From: Jan Kiszka <jan.kiszka@siemens.com>
Message-ID: <f7338cdd-3f1b-3b1c-d56c-6d783688348f@siemens.com>
Date: Wed, 5 Jun 2019 00:06:30 +0200
User-Agent: Mozilla/5.0 (X11; U; Linux i686 (x86_64); de; rv:1.8.1.12)
 Gecko/20080226 SUSE/2.0.0.12-1.1 Thunderbird/2.0.0.12 Mnenhy/0.7.5.666
MIME-Version: 1.0
In-Reply-To: <20190604210229.23554-1-ralf.ramsauer@oth-regensburg.de>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Language: en-US
X-Original-Sender: jan.kiszka@siemens.com
X-Original-Authentication-Results: gmr-mx.google.com;       spf=pass
 (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.2 as
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

On 04.06.19 23:02, Ralf Ramsauer wrote:
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
>   hypervisor/arch/x86/mmio.c                  | 37 +++++++++++++++++----
>   inmates/tests/x86/mmio-access-32.c          |  4 +++
>   inmates/tests/x86/mmio-access.c             |  4 +++
>   4 files changed, 40 insertions(+), 6 deletions(-)
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
> index b234bd79..6d9ad1c5 100644
> --- a/hypervisor/arch/x86/mmio.c
> +++ b/hypervisor/arch/x86/mmio.c
> @@ -79,6 +79,26 @@ static unsigned int get_address_width(bool has_addrsz_prefix)
>   		(!!(cs_attr & VCPU_CS_DB) ^ has_addrsz_prefix) ? 4 : 2;
>   }
>   
> +static unsigned int get_op_width(bool has_rex_w, bool has_opsz_prefix)

We should move all the flags into parse_context so that we can pass them around 
more easily.

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

This may mean accessing the same VMCS regs multiple times. I vaguely recall from 
KVM that it pays off to avoid that and keep the results cached (per vmexit).

> +
> +	if (long_mode)
> +		/* CS.d is ignored in long mode */
> +		return has_opsz_prefix ? 2 : 4;
> +
> +	return (!!(cs_attr & VCPU_CS_DB) ^ has_opsz_prefix) ? 4 : 2;

This does the same as get_address_width (minus different output values), but its 
code format is different. Should be aligned.

In fact, I could imagine a combined helper:

void parse_widths(struct parse_context *ctx,
                   struct mmio_instruction *inst,
                   bool parse_addr_width)

That one would obtain cs_attr and long_mode only once, would do the address 
width thing only if parse_addr_width is true, and would push its results 
directly into *inst.

> +}
> +
>   struct mmio_instruction
>   x86_mmio_parse(const struct guest_paging_structures *pg_structs, bool is_write)
>   {
> @@ -94,6 +114,7 @@ x86_mmio_parse(const struct guest_paging_structures *pg_structs, bool is_write)
>   	bool has_rex_w = false;
>   	bool has_rex_r = false;
>   	bool has_addrsz_prefix = false;
> +	bool has_opsz_prefix = false;
>   
>   	if (!ctx_update(&ctx, &pc, 0, pg_structs))
>   		goto error_noinst;
> @@ -114,9 +135,13 @@ restart:
>   	}
>   	switch (op[0].raw) {
>   	case X86_PREFIX_ADDR_SZ:
> +	case X86_PREFIX_OP_SZ:
>   		if (!ctx_update(&ctx, &pc, 1, pg_structs))
>   			goto error_noinst;
> -		has_addrsz_prefix = true;
> +		if (op[0].raw == X86_PREFIX_ADDR_SZ)
> +			has_addrsz_prefix = true;
> +		else
> +			has_opsz_prefix = true;

I would avoid the double-dispatching just to save one ctx_update.

>   		goto restart;
>   	case X86_OP_MOVZX_OPC1:
>   		if (!ctx_update(&ctx, &pc, 1, pg_structs))
> @@ -134,28 +159,28 @@ restart:
>   		does_write = true;
>   		break;
>   	case X86_OP_MOV_TO_MEM:
> -		inst.access_size = has_rex_w ? 8 : 4;
> +		inst.access_size = get_op_width(has_rex_w, has_opsz_prefix);
>   		does_write = true;
>   		break;
>   	case X86_OP_MOVB_FROM_MEM:
>   		inst.access_size = 1;
>   		break;
>   	case X86_OP_MOV_FROM_MEM:
> -		inst.access_size = has_rex_w ? 8 : 4;
> +		inst.access_size = get_op_width(has_rex_w, has_opsz_prefix);
>   		break;
>   	case X86_OP_MOV_IMMEDIATE_TO_MEM:
> -		inst.access_size = has_rex_w ? 8 : 4;
> +		inst.access_size = get_op_width(has_rex_w, has_opsz_prefix);
>   		has_immediate = true;
>   		does_write = true;
>   		break;
>   	case X86_OP_MOV_MEM_TO_AX:
>   		inst.inst_len += get_address_width(has_addrsz_prefix);
> -		inst.access_size = has_rex_w ? 8 : 4;
> +		inst.access_size = get_op_width(has_rex_w, has_opsz_prefix);
>   		inst.in_reg_num = 15;
>   		goto final;
>   	case X86_OP_MOV_AX_TO_MEM:
>   		inst.inst_len += get_address_width(has_addrsz_prefix);
> -		inst.access_size = has_rex_w ? 8 : 4;
> +		inst.access_size = get_op_width(has_rex_w, has_opsz_prefix);
>   		inst.out_val = guest_regs->by_index[15];
>   		does_write = true;
>   		goto final;
> diff --git a/inmates/tests/x86/mmio-access-32.c b/inmates/tests/x86/mmio-access-32.c
> index 2f47f211..b4f83850 100644
> --- a/inmates/tests/x86/mmio-access-32.c
> +++ b/inmates/tests/x86/mmio-access-32.c
> @@ -41,6 +41,10 @@ void inmate_main(void)
>   	mmio_write32(mmio_reg, pattern);
>   	EXPECT_EQUAL(*comm_page_reg, pattern);
>   
> +	/* MOV_FROM_MEM (8b), 16-bit data, 32-bit address, OP size prefix */
> +	asm volatile("mov (%%eax), %%ax" : "=a" (reg32) : "a" (mmio_reg));
> +	EXPECT_EQUAL(reg32, (u16)pattern);

We should try to cover all cases of current get_op_width.

> +
>   	/* MOV_FROM_MEM (8b), 32-bit data, 32-bit address */
>   	asm volatile("movl (%%ebx), %%eax"
>   		: "=a" (reg32) : "a" (0), "b" (mmio_reg));
> diff --git a/inmates/tests/x86/mmio-access.c b/inmates/tests/x86/mmio-access.c
> index 0e6a56b1..86694353 100644
> --- a/inmates/tests/x86/mmio-access.c
> +++ b/inmates/tests/x86/mmio-access.c
> @@ -51,6 +51,10 @@ void inmate_main(void)
>   	mmio_write64(mmio_reg, pattern);
>   	EXPECT_EQUAL(*comm_page_reg, pattern);
>   
> +	/* MOV_FROM_MEM (8b), 16-bit data, Ox66 OP size prefix */
> +	asm volatile("mov (%%rax), %%ax" : "=a" (reg64) : "a" (mmio_reg));
> +	EXPECT_EQUAL(reg64, (u16)pattern);
> +
>   	/* MOV_FROM_MEM (8b), 64-bit data, mod=0, reg=0, rm=3 */
>   	asm volatile("movq (%%rbx), %%rax"
>   		: "=a" (reg64) : "a" (0), "b" (mmio_reg));
> 

Thanks for picking this up. I guess we need to complete that aspect of the 
instruction parsing. Eventually, it will be simpler to argue about being 
complete, rather than why not being so.

Jan

-- 
Siemens AG, Corporate Technology, CT RDA IOT SES-DE
Corporate Competence Center Embedded Linux

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/f7338cdd-3f1b-3b1c-d56c-6d783688348f%40siemens.com.
For more options, visit https://groups.google.com/d/optout.
