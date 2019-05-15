Return-Path: <jailhouse-dev+bncBD4JZQXE5UFRBHEV6DTAKGQE7SQP6LY@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-ed1-x53c.google.com (mail-ed1-x53c.google.com [IPv6:2a00:1450:4864:20::53c])
	by mail.lfdr.de (Postfix) with ESMTPS id 620061F4C9
	for <lists+jailhouse-dev@lfdr.de>; Wed, 15 May 2019 14:48:29 +0200 (CEST)
Received: by mail-ed1-x53c.google.com with SMTP id t58sf3649162edb.22
        for <lists+jailhouse-dev@lfdr.de>; Wed, 15 May 2019 05:48:29 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1557924509; cv=pass;
        d=google.com; s=arc-20160816;
        b=AG0o2dPNptKNn0B/k+4onUUGLN3cuD4QWvvrtMzTNqL69sAer6jYLbrBjieavBKSyP
         FmYgxLTjwxZHj7waZmI3G8notHRGSOlB8LLY2DM4u6bdz3xr5NxlKqZTsjFRf5p8ZSXO
         aNnGOV3acvB6nmtg+6BDSI81EMhxUSptqiABX5CaGk8FKUo2WDomDPLuUXN3pZ3jdDpz
         IecAKRGfLrwwyWpzROFfhRfYujvQoSb6Ru83Nqb+jFv3ZXSTgdVWcClPo+dwDzT80FWb
         4joseQhGYIJ1Un4ohDIqp97XarGGHtwJ0TMqy56UwA/ocPL4Tt9Mdk0Ubi6NgbIwVXIk
         JiuQ==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:content-language:in-reply-to
         :mime-version:user-agent:date:message-id:openpgp:from:references:to
         :subject:sender:dkim-signature;
        bh=Ee34IAC6IgljBOW/Myu5uEjCsPNcj4+Q6OrLkoPxTiE=;
        b=i6BCC4nQk84zoIyOlkZjPbgyYnC4q8eKV2j1aPVYGfEbN/Qotm5d11lQouvt6dwo1x
         6VuZVcbcX0m7aqm6DcSTzdU6Sw4hdSgfPrvjn+x4A5eBWZMMciDBq92DK7dg2ySs6GHl
         xGYHpLnHIc4y2KynXvJJGlNvKQMLndTnmHPDprHcVHui6CqQdTyX7pEMxFTEfepE+ZWW
         FMvILtfh8VNkPyqqyOLKf3cZEFbCW0xj+30zN7nCvdnmrzNysV0IJwjmpg+JyCsYe7R1
         ixirV5/sJYSEeGizhsswY3Vbn1hpAILALoH68rpUu2ra8lleIk2GPF+RRphCE48/gExC
         Qp9g==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass header.i=@oth-regensburg.de header.s=mta01-20160622 header.b=YEbpd8l3;
       spf=pass (google.com: domain of ralf.ramsauer@oth-regensburg.de designates 2001:638:a01:1096::12 as permitted sender) smtp.mailfrom=ralf.ramsauer@oth-regensburg.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=oth-regensburg.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:subject:to:references:from:openpgp:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=Ee34IAC6IgljBOW/Myu5uEjCsPNcj4+Q6OrLkoPxTiE=;
        b=p83skiaziqlv/dpHhVujJ2ReRjX1tGYaC56t8m9gNcdXYWm5DQEgpI/PfwhifBamF/
         aG4vTWaiWWCp6WkoIcyXhBaIxjegURqf/JHheUgJfYOoOCZM0vEUr4SwIV2Qcv0/gDxl
         JiQIYp21pikWcGXkwsisX0UyJb81xN8pbMsM/82nXzqCKfva2NGvM8nocG7PWAdKasTG
         MkOiUMNJbbnAcZS4mVAQ1LIpzzvf8unx8vDzJwISSkCkmftp3DHdAd8pmqbG4fKJgSfT
         mY05QMyzjVoetUNhJITr3N3nRmYqr0P0KHWDB3773lZyes/fiIhybK8JS+uMYjZBOQQU
         Mnqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:subject:to:references:from:openpgp
         :message-id:date:user-agent:mime-version:in-reply-to
         :content-language:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :x-spam-checked-in-group:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=Ee34IAC6IgljBOW/Myu5uEjCsPNcj4+Q6OrLkoPxTiE=;
        b=pZtiE7dTxW8/R0ZVTKIpy1xxD5Od529B8Mw1dmaAl8CG0ZepKUsb3ffhj2AeDz3k/S
         fK+cMm9X8nFCzauaHO8L1H4wcnLC+h3p5PcoQYBsdxlajhCT3EcXM1Dl9shWZ9BfUe3V
         pcj6TtIKtntoyvr1bcBhWwsSBkZPBtALqpHFnPUm8iDViqgkLWn2FRnmm0TvjIDT/6Ie
         3/TLWVA/gNXFnbQ2BX3Ra5m/QKqPOQ4iJwlJjYrhEpXC+OSGFwiH6E57EoyxGch57ifM
         zo6729lD3fZwu2ZEnh08IYjlCnkdub6dCmf/SinCjgQphyNaIucqV9xSu8fPFWLr0e//
         jpYw==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: APjAAAWASJllKuKqpUApddp9y6O9+Gr0Pp365wcbVvPeLU5DTF5aRwFp
	SJPi9ALguksiMHsY7G5hSfk=
X-Google-Smtp-Source: APXvYqyuWLDVvclIn/XNJPZzOjC/SJ+j04sH9dGzCRnfkCazC1R6OOC1r6EFC3O9tM1HN2XJ+KJ9cg==
X-Received: by 2002:a17:906:2e58:: with SMTP id r24mr9177790eji.184.1557924509114;
        Wed, 15 May 2019 05:48:29 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a50:a58c:: with SMTP id a12ls710971edc.10.gmail; Wed, 15 May
 2019 05:48:28 -0700 (PDT)
X-Received: by 2002:a50:a3b5:: with SMTP id s50mr43169183edb.149.1557924508594;
        Wed, 15 May 2019 05:48:28 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1557924508; cv=none;
        d=google.com; s=arc-20160816;
        b=k81jcwst8ndrExD/K9bq7DNqxRR4KNFzRhm6qVMoewr3RU/gpvwQuFDjSTrA9XSLym
         ThW5kXv86jB2hNN4iyXMvyaXGtuLGvaoCR8ZKI/M3+bKeVZf5lamrda3rSuTHjoyW98l
         xscGu2RsNb6z1q0oRP6VwQFbx1PlSN4iNMkDdzi115kl5R21rhFbECTd8TLQ9eY7kCKk
         2PlUhitYZEscZI40ccRDXtLtWSVeMUzo7uGEGWkhq0LtVyEE/QytCtj6ZfLClbxyVVJi
         i00s7wydsahh4aPLG5psN5Emiw1rE3Fy8v7d971wCFvG3P4mm+s2q+b2DtnOzpEwAcUd
         K/lA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:openpgp:from:references:to:subject
         :dkim-signature;
        bh=aN26Uq7Ysvh3mZdWeIdOINdNIIujwd64VZENb34SPIY=;
        b=DgMPMUGCqpY/kKmVse5bnmPAS55wi+kPNlJxzOJtKW2KCJgtJqH77L2t7B/yqnl0Iz
         JbP6+h85awBt2dFAbdDKtwbNy2EUJN/tCJxTjox4g8csmiAnxfx2ui8YSdTFsdGJwokg
         j1zzc+BmNDlZibGWd/3AORW0TrGlcWQFdW4ccwdZUbBZkyZijXZR4A7YFdXVsT9NBYbe
         49F6qO5s7F1uBwRwNBqihTG/jkGv3NLtgFmSZ0T+DUF0m3nCnihOu55oHNkbb4MzRZoi
         v6cCJIh6A4cifWqk6E0MC6+zuGCZDMSnrsJbYQqATwFtpmIPj5URZPasZDvMmK2B9Tr6
         bebQ==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       dkim=pass header.i=@oth-regensburg.de header.s=mta01-20160622 header.b=YEbpd8l3;
       spf=pass (google.com: domain of ralf.ramsauer@oth-regensburg.de designates 2001:638:a01:1096::12 as permitted sender) smtp.mailfrom=ralf.ramsauer@oth-regensburg.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=oth-regensburg.de
Received: from mta02.hs-regensburg.de (mta02.hs-regensburg.de. [2001:638:a01:1096::12])
        by gmr-mx.google.com with ESMTPS id r19si245353edy.5.2019.05.15.05.48.28
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 15 May 2019 05:48:28 -0700 (PDT)
Received-SPF: pass (google.com: domain of ralf.ramsauer@oth-regensburg.de designates 2001:638:a01:1096::12 as permitted sender) client-ip=2001:638:a01:1096::12;
Received: from E16S02.hs-regensburg.de (e16s02.hs-regensburg.de [IPv6:2001:638:a01:8013::92])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(Client CN "E16S02", Issuer "E16S02" (not verified))
	by mta02.hs-regensburg.de (Postfix) with ESMTPS id 453vVh1hV5zyMc;
	Wed, 15 May 2019 14:48:28 +0200 (CEST)
Received: from [192.168.178.10] (194.95.106.138) by E16S02.hs-regensburg.de
 (2001:638:a01:8013::92) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1713.5; Wed, 15 May
 2019 14:48:28 +0200
Subject: Re: [PATCH 5/5] inmates: x86: Catch and report exceptions
To: Jan Kiszka <jan.kiszka@web.de>, <jailhouse-dev@googlegroups.com>
References: <cover.1557914551.git.jan.kiszka@web.de>
 <69941a22af559b8e3afc7cf078cf774e4593f79e.1557914551.git.jan.kiszka@web.de>
From: Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>
Openpgp: preference=signencrypt
Message-ID: <71db9659-843c-2e6d-93a8-09eea149b8b7@oth-regensburg.de>
Date: Wed, 15 May 2019 14:48:27 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <69941a22af559b8e3afc7cf078cf774e4593f79e.1557914551.git.jan.kiszka@web.de>
Content-Type: text/plain; charset="UTF-8"
Content-Language: de-DE
X-Originating-IP: [194.95.106.138]
X-ClientProxiedBy: E16S02.hs-regensburg.de (2001:638:a01:8013::92) To
 E16S02.hs-regensburg.de (2001:638:a01:8013::92)
X-Original-Sender: ralf.ramsauer@oth-regensburg.de
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass
 header.i=@oth-regensburg.de header.s=mta01-20160622 header.b=YEbpd8l3;
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

Hi Jan,

On 5/15/19 12:02 PM, Jan Kiszka wrote:
> From: Jan Kiszka <jan.kiszka@siemens.com>
> 
> Add basic reporting of exceptions that are triggered by an inmate so
> that we stop translating all of them into hypervisor-caught triple
> faults. Reporting is optional and need to be enabled explicitly by an
> inmate via excp_reporting_init().
> 
> Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>
> ---
>  inmates/lib/x86/Makefile         |   2 +-
>  inmates/lib/x86/excp.c           | 165 +++++++++++++++++++++++++++++++++++++++
>  inmates/lib/x86/include/inmate.h |   2 +
>  3 files changed, 168 insertions(+), 1 deletion(-)
>  create mode 100644 inmates/lib/x86/excp.c
> 
> diff --git a/inmates/lib/x86/Makefile b/inmates/lib/x86/Makefile
> index dc017b90..258eed18 100644
> --- a/inmates/lib/x86/Makefile
> +++ b/inmates/lib/x86/Makefile
> @@ -40,7 +40,7 @@ include $(INMATES_LIB)/Makefile.lib
> 
>  always := lib.a lib32.a
> 
> -TARGETS := header.o ioapic.o printk.o setup.o smp.o uart.o int.o
> +TARGETS := header.o ioapic.o printk.o setup.o smp.o uart.o int.o excp.o

excp.o is shared across 32 and 64 bit, and uses printk.

  - Compiler might produce unsupported instructions in excp.o (as we had
    before with SSE/AVX). In this case, the handlers won't help.

  - If unsupported, and if we crash early, we also don't know if the
    compiler produces SSE instructions for printk.o. So even if we
    supress SSE for excp.o, it's very likely that there's some SSE stuff
    inside printk.o, which will let us double fail.

  Ralf

>  TARGETS += ../alloc.o ../pci.o ../string.o ../cmdline.o ../setup.o
>  TARGETS += ../uart-8250.o ../printk.o
>  TARGETS_64_ONLY := mem.o pci.o timing.o
> diff --git a/inmates/lib/x86/excp.c b/inmates/lib/x86/excp.c
> new file mode 100644
> index 00000000..d26300a4
> --- /dev/null
> +++ b/inmates/lib/x86/excp.c
> @@ -0,0 +1,165 @@
> +/*
> + * Jailhouse, a Linux-based partitioning hypervisor
> + *
> + * Copyright (c) Siemens AG, 2019
> + *
> + * Authors:
> + *  Jan Kiszka <jan.kiszka@siemens.com>
> + *
> + * This work is licensed under the terms of the GNU GPL, version 2.  See
> + * the COPYING file in the top-level directory.
> + *
> + * Alternatively, you can use or redistribute this file under the following
> + * BSD license:
> + *
> + * Redistribution and use in source and binary forms, with or without
> + * modification, are permitted provided that the following conditions
> + * are met:
> + *
> + * 1. Redistributions of source code must retain the above copyright
> + *    notice, this list of conditions and the following disclaimer.
> + *
> + * 2. Redistributions in binary form must reproduce the above copyright
> + *    notice, this list of conditions and the following disclaimer in the
> + *    documentation and/or other materials provided with the distribution.
> + *
> + * THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS"
> + * AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE
> + * IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE
> + * ARE DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT HOLDER OR CONTRIBUTORS BE
> + * LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR
> + * CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF
> + * SUBSTITUTE GOODS OR SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESS
> + * INTERRUPTION) HOWEVER CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN
> + * CONTRACT, STRICT LIABILITY, OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE)
> + * ARISING IN ANY WAY OUT OF THE USE OF THIS SOFTWARE, EVEN IF ADVISED OF
> + * THE POSSIBILITY OF SUCH DAMAGE.
> + */
> +
> +#include <inmate.h>
> +
> +struct stack_frame {
> +	unsigned long bp, si, dx, bx, ax;
> +#ifdef __x86_64__
> +	unsigned long r8, r9, r10, r11, r12, r13, r14, r15;
> +	unsigned long cx, di;
> +#else
> +	unsigned long di, cx;
> +#endif
> +	unsigned long error_code, ip, cs, flags;
> +#ifdef __x86_64__
> +	unsigned long sp, ss;
> +#endif
> +};
> +
> +extern u8 excp_entry[];
> +
> +void excp_reporting_init(void)
> +{
> +	unsigned int vector;
> +	u64 entry;
> +
> +	for (vector = 0; vector < 21; vector++) {
> +		entry = (unsigned long)excp_entry + vector * 16;
> +
> +		idt[vector * 2] = (entry & 0xffff) | (INMATE_CS64 << 16) |
> +			((0x8e00 | (entry & 0xffff0000)) << 32);
> +		idt[vector * 2 + 1] = entry >> 32;
> +	}
> +}
> +
> +static void __attribute__((used))
> +exception_handler(unsigned int vector, struct stack_frame *frame)
> +{
> +	printk("--- EXCEPTION %d ---\n", vector);
> +	if (vector >= 10 && vector <= 14)
> +		printk(" Error code: 0x%08lx\n", frame->error_code);
> +	printk(" CS:  0x%04lx IP: %p flags: 0x%08lx\n",
> +	       frame->cs, (void *)frame->ip, frame->flags);
> +	printk(" SP:  %p BP:  %p\n", frame + 1, (void *)frame->bp);
> +	printk(" AX:  %p BX:  %p CX:  %p\n",
> +	       (void *)frame->ax, (void *)frame->bx, (void *)frame->bx);
> +	printk(" DX:  %p SI:  %p DI:  %p\n",
> +	       (void *)frame->dx, (void *)frame->si, (void *)frame->di);
> +#ifdef __x86_64__
> +	printk(" R8:  %p R9:  %p R10: %p\n",
> +	       (void *)frame->r8, (void *)frame->r9, (void *)frame->r10);
> +	printk(" R11: %p R12: %p R13: %p\n",
> +	       (void *)frame->r11, (void *)frame->r12, (void *)frame->r13);
> +	printk(" R14: %p R15: %p\n",
> +	       (void *)frame->r14, (void *)frame->r15);
> +#endif
> +
> +	comm_region->cell_state = JAILHOUSE_CELL_FAILED;
> +	stop();
> +}
> +
> +asm(
> +".macro excp_prologue vector\n\t"
> +	"push $0\n\t"
> +	"excp_error_prologue vector\n\t"
> +".endm\n"
> +
> +".macro excp_error_prologue vector\n\t"
> +#ifdef __x86_64__
> +	"push %rdi\n\t"
> +	"mov $vector,%rdi\n\t"
> +#else
> +	"push %ecx\n\t"
> +	"mov $vector,%ecx\n\t"
> +#endif
> +	"jmp excp_common\n"
> +	".balign 16\n\t"
> +".endm\n\t"
> +
> +	".global excp_entry\n\t"
> +	".balign 16\n"
> +"excp_entry:\n"
> +"vector=0\n"
> +".rept 8\n"
> +	"excp_prologue vector\n\t"
> +	"vector=vector+1\n\t"
> +".endr\n"
> +	"excp_error_prologue 8 \n\t"
> +	"excp_prologue 9\n\t"
> +"vector=10\n"
> +".rept 5\n"
> +	"excp_error_prologue vector\n\t"
> +	"vector=vector+1\n\t"
> +".endr\n"
> +	"excp_prologue 15\n\t"
> +	"excp_prologue 16\n\t"
> +	"excp_error_prologue 17\n\t"
> +	"excp_prologue 18\n\t"
> +	"excp_prologue 19\n\t"
> +	"excp_prologue 20\n\t"
> +
> +"excp_common:\n\t"
> +#ifdef __x86_64__
> +	"push %rcx\n\t"
> +	"push %r15\n\t"
> +	"push %r14\n\t"
> +	"push %r13\n\t"
> +	"push %r12\n\t"
> +	"push %r11\n\t"
> +	"push %r10\n\t"
> +	"push %r9\n\t"
> +	"push %r8\n\t"
> +	"push %rax\n\t"
> +	"push %rbx\n\t"
> +	"push %rdx\n\t"
> +	"push %rsi\n\t"
> +	"push %rbp\n\t"
> +	"mov %rsp,%rsi\n\t"
> +#else
> +	"push %edi\n\t"
> +	"push %eax\n\t"
> +	"push %ebx\n\t"
> +	"push %edx\n\t"
> +	"push %esi\n\t"
> +	"push %ebp\n\t"
> +	"mov %esp,%edx\n\t"
> +#endif
> +
> +	"jmp exception_handler\n\t"
> +);
> diff --git a/inmates/lib/x86/include/inmate.h b/inmates/lib/x86/include/inmate.h
> index 07a6275b..7664570d 100644
> --- a/inmates/lib/x86/include/inmate.h
> +++ b/inmates/lib/x86/include/inmate.h
> @@ -222,6 +222,8 @@ static inline unsigned int cpu_id(void)
> 
>  extern unsigned long idt[];
> 
> +void excp_reporting_init(void);
> +
>  typedef void(*int_handler_t)(void);
> 
>  void int_init(void);
> --
> 2.16.4
> 

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/71db9659-843c-2e6d-93a8-09eea149b8b7%40oth-regensburg.de.
For more options, visit https://groups.google.com/d/optout.
