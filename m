Return-Path: <jailhouse-dev+bncBD4JZQXE5UFRBPP6TDTQKGQECTIZEYI@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-wr1-x439.google.com (mail-wr1-x439.google.com [IPv6:2a00:1450:4864:20::439])
	by mail.lfdr.de (Postfix) with ESMTPS id E1DAD2760B
	for <lists+jailhouse-dev@lfdr.de>; Thu, 23 May 2019 08:35:41 +0200 (CEST)
Received: by mail-wr1-x439.google.com with SMTP id x15sf2367392wrn.11
        for <lists+jailhouse-dev@lfdr.de>; Wed, 22 May 2019 23:35:41 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1558593341; cv=pass;
        d=google.com; s=arc-20160816;
        b=B4dQwK5bUoN/6h3WuAsik3jROBUzHiVSpCbi5mzBVNuH2yDfBvIIqIUMLQWWPAk1Iu
         xIPfAygkPlJdPgD0vo4Q8yH1myMEQSkvMiwZ8qUrCFdrBWFru88QTKHX0uDuxMEBWXqO
         krA+Ztxrwdafvo6Nl8GfA1P+hNduMtIrF08qncQF0F5BBOu4l9JLDlWcaAMEfozI58G/
         LE47IiPP3ry96VENn9jVAqorX/pN4F/5kQg/wnX9s54LaJbVET2sjBLgHbMY+20DUiz5
         mYNbFqQJYeBmSY1GuzG3bYNnZN6g1iTiPpyucoNlztPa40DaaBUhGKpn7CioBjAVQ2Wc
         G4OQ==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:content-language:in-reply-to
         :mime-version:user-agent:date:message-id:autocrypt:openpgp:from
         :references:to:subject:sender:dkim-signature;
        bh=WuqG3ZrF9RdCYEalnNWFHODxnBFUqU1HzGKZuaFXUFU=;
        b=I6SbRUIh3nJjzJN0grX4oSa2pstzYV9256LM4avbMbjhLl7rW3ZUWcqzRQmebmoVA+
         0LhmKbqaWtDMM2a2fAYW/j+7/DVtMR2LwOt1q5CxJ9fIOk6VqCecRb4PXBYzn3etGAy/
         q7m7Hc4N/7+Rm9WYvaLjliqD0SP155UpCtVXEAwYnswcwf1Fli8Q01v4yk/+K3jOv+OH
         Vvscq2Kh3jWRf9Sfhs3SqgiqddC2yWCxw9Kn0V201dxtDRYYw+EpV0jQxpaXFjOOMT8A
         +ov0D8/TK256hEVAOjSTL9NXmlJpaNLDoxSkvjUU9G9blTXMv8WN2jsltoQ/zPDf23+i
         Wo+Q==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass header.i=@oth-regensburg.de header.s=mta01-20160622 header.b=B1Yx2TsR;
       spf=pass (google.com: domain of ralf.ramsauer@oth-regensburg.de designates 2001:638:a01:1096::11 as permitted sender) smtp.mailfrom=ralf.ramsauer@oth-regensburg.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=oth-regensburg.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:subject:to:references:from:openpgp:autocrypt:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=WuqG3ZrF9RdCYEalnNWFHODxnBFUqU1HzGKZuaFXUFU=;
        b=WxWRlYmgrlbbL6WC+wCSSeEjntOeqn0EgS84/t2HCL3cOr8AsTj3lHmIeAJwhJNthp
         5AenuXotz8gj7YO8N4gLh74VJg9wx/glBFi+Z97AcR44NIOmEuqoR8xOF7lcqgNyk31i
         nGcQ71RqlttVr6vyuF28NLZhZhDWOiAEoQ3PCZN/2SEt96ppWmn33BwKo9Gc1KazMAuj
         b9km9ujHZOb+XC/KbjxqM3T6Ayj3rj6RYHOo9WLb5UvYrR/XqK5+DRQ73vjmWBtpRi0T
         LXvB4Jo6PICakSPE4Flv9uuSKBgI0AobE8iAvub6AZXmyNQi7wmD0iVX+GU/9RcgYIUf
         w3sg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:subject:to:references:from:openpgp
         :autocrypt:message-id:date:user-agent:mime-version:in-reply-to
         :content-language:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :x-spam-checked-in-group:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=WuqG3ZrF9RdCYEalnNWFHODxnBFUqU1HzGKZuaFXUFU=;
        b=ZeL3ejL4ZMBf1sGfQ91WfdW181yEsEMsjeWxztr/G3nvNeJatzit2RRPlNRQyerdL9
         2drm7wFKKiXDiOStE7j+kjQPq2dKGfO9r7o7iLL6IXS4Zrq0lfj9a2npbST4GIMYHXOA
         kGLjru+oPRc+Nz50eWOLrsyMOfAdIMw6ee6mmZb02/TkOGilAj5q+2bapnKb5DNwZ866
         VB2FtdxXfN07daHYh5tMiCRcv5Q9h0fUMEZI7wN5fstNZdCjg/m+P692HkUA7O7VC0zW
         1yH+Woop+E3Pna0yRcg8q0SqEjUIfkrwN5acnltuAZ7B9VDdCWn5v66ToY0kyi+cij5w
         e7Lw==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: APjAAAV+4uDOnNDqZqsPX5lysD69poLXQa8VKtSgLGeIh3pTr6zGxK8Z
	zNV9VkllAtZrOn/wFuaidZo=
X-Google-Smtp-Source: APXvYqy6xlEPqC+PrQrnS/hKsjqhEANlAN5I/y4NXmdEZV9pc8beW0yJ3e1Sle9SZbVHUC8rMU/oSw==
X-Received: by 2002:a5d:4692:: with SMTP id u18mr45958973wrq.285.1558593341610;
        Wed, 22 May 2019 23:35:41 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:adf:97ca:: with SMTP id t10ls1215318wrb.10.gmail; Wed, 22
 May 2019 23:35:41 -0700 (PDT)
X-Received: by 2002:a5d:4647:: with SMTP id j7mr23070975wrs.280.1558593341150;
        Wed, 22 May 2019 23:35:41 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1558593341; cv=none;
        d=google.com; s=arc-20160816;
        b=AZG6fZeWEEHgNqBM+nm1lwVxTLKunsa3/9/xulBy1ih9DNZL8MS+PLMqSljOAq9SrR
         VvQ11Tp+NkLMIBLu61pBfdClmnqGCECAOO/Dt4w9YBzuSmRZbFqU5h0oLFGd35JJC+AO
         wYMNex2uWD/IVEqdro1FtP7QoH7A2KPh0JzUDBvpRacBEnVRbONAqw4A6UKMzBfaLC0R
         wKFJzwEA1qugW+C3UVRpzD+c2JmSaP0T9AXGSokIlcMkWAiOWi7YyCRsxdHHlnNRHwKn
         ZRZOGNKFSanKCN/hcz4BAC2ySpCLVqj/beNBdXV+2rmnP7HBsBZ4DdY9b3vcxcogJ+W/
         lI2A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:autocrypt:openpgp:from:references:to
         :subject:dkim-signature;
        bh=idbVulwaFHaKLtCVHcEmT9w6N6MiJU/95yjNRUF1Guk=;
        b=xc4vNTir/ekO8XSzBI1sRSstPgBcD5S7jlnTx24wtNEXY3OoscVer5tmDvxXGSxqCH
         RRqnSuOSFoMbLImyuafRUsvTgxk1xPJjXmLSF5Yi2eSHlJexzOS3XOOwXR1NRalpqgiM
         EZmL5guGEi/NR3pYPB+lUfT9Wx3s3j89tljHNKDCQeLwB3+Be7vPBXUs7RRHiGDQS35o
         a4YXVv5wS2yxRUczsaa0Rv1K5fAhuei3iw7x4Q4/mpCmWeSL5rssPpSd5kqgbfDUhyM3
         UT7wKyosa2a4EDa16xqcWKVcZz3qYCLIXCOVQHsnlUtt5EBZxIQgDXIKnjo/dV5ncAsH
         vRCw==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       dkim=pass header.i=@oth-regensburg.de header.s=mta01-20160622 header.b=B1Yx2TsR;
       spf=pass (google.com: domain of ralf.ramsauer@oth-regensburg.de designates 2001:638:a01:1096::11 as permitted sender) smtp.mailfrom=ralf.ramsauer@oth-regensburg.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=oth-regensburg.de
Received: from mta01.hs-regensburg.de (mta01.hs-regensburg.de. [2001:638:a01:1096::11])
        by gmr-mx.google.com with ESMTPS id j20si527651wme.0.2019.05.22.23.35.41
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 22 May 2019 23:35:41 -0700 (PDT)
Received-SPF: pass (google.com: domain of ralf.ramsauer@oth-regensburg.de designates 2001:638:a01:1096::11 as permitted sender) client-ip=2001:638:a01:1096::11;
Received: from E16S02.hs-regensburg.de (e16s02.hs-regensburg.de [IPv6:2001:638:a01:8013::92])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(Client CN "E16S02", Issuer "E16S02" (not verified))
	by mta01.hs-regensburg.de (Postfix) with ESMTPS id 458frr5NRHzy8k;
	Thu, 23 May 2019 08:35:40 +0200 (CEST)
Received: from [IPv6:2a01:598:b00d:bfbe:70ee:7d59:5e80:4afe]
 (2001:638:a01:8013::138) by E16S02.hs-regensburg.de (2001:638:a01:8013::92)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1713.5; Thu, 23 May
 2019 08:35:39 +0200
Subject: Re: [PATCH 5/5] inmates: x86: Catch and report exceptions
To: Jan Kiszka <jan.kiszka@web.de>, <jailhouse-dev@googlegroups.com>, Ralf
 Ramsauer <ralf.ramsauer@oth-regensburg.de>
References: <cover.1557914551.git.jan.kiszka@web.de>
 <69941a22af559b8e3afc7cf078cf774e4593f79e.1557914551.git.jan.kiszka@web.de>
From: Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>
Openpgp: preference=signencrypt
Autocrypt: addr=ralf.ramsauer@oth-regensburg.de; keydata=
 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
 RncIIYr0LjXAAzY=
Message-ID: <2c0d76b2-4085-e87b-624e-485000ed0224@oth-regensburg.de>
Date: Thu, 23 May 2019 08:35:38 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.0
MIME-Version: 1.0
In-Reply-To: <69941a22af559b8e3afc7cf078cf774e4593f79e.1557914551.git.jan.kiszka@web.de>
Content-Type: text/plain; charset="UTF-8"
Content-Language: en-PH
X-Originating-IP: [2001:638:a01:8013::138]
X-ClientProxiedBy: E16S02.hs-regensburg.de (2001:638:a01:8013::92) To
 E16S02.hs-regensburg.de (2001:638:a01:8013::92)
X-Original-Sender: ralf.ramsauer@oth-regensburg.de
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass
 header.i=@oth-regensburg.de header.s=mta01-20160622 header.b=B1Yx2TsR;
       spf=pass (google.com: domain of ralf.ramsauer@oth-regensburg.de
 designates 2001:638:a01:1096::11 as permitted sender) smtp.mailfrom=ralf.ramsauer@oth-regensburg.de;
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

Maybe we should set the failed state at the beginning of this routine.
We won't be able to enter fail state if any other errors occur during
printk.

  Ralf

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
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/2c0d76b2-4085-e87b-624e-485000ed0224%40oth-regensburg.de.
For more options, visit https://groups.google.com/d/optout.
