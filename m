Return-Path: <jailhouse-dev+bncBDDNLV6S7AOBBP73XXTQKGQEYY3KNII@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-lf1-x137.google.com (mail-lf1-x137.google.com [IPv6:2a00:1450:4864:20::137])
	by mail.lfdr.de (Postfix) with ESMTPS id 703152F797
	for <lists+jailhouse-dev@lfdr.de>; Thu, 30 May 2019 08:52:49 +0200 (CEST)
Received: by mail-lf1-x137.google.com with SMTP id u26sf337444lfq.8
        for <lists+jailhouse-dev@lfdr.de>; Wed, 29 May 2019 23:52:49 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1559199169; cv=pass;
        d=google.com; s=arc-20160816;
        b=LQKCP3+zGdN0Qw9DEmTF8SxSptw/E+lTC2AICdkyCJVPJ5Db7ObObKH3sMtTZ3oY1S
         bTV9tKrpWB2wTtYF7GnB+QUQ8/8abrx8tzCnHZ/FRjC/EWchAK79cTO/tYIIp/Xux5J8
         NhOA9h7zopzkzihUg0+r6ZzkiYa5/x1z1uS+L9QHThUZ98W6/o+Z5hpPf1QE8N9z/f1T
         Et2qiEpCeb+TiWo0RwX4NSKGnxL0WJ18HmXXUYmOE+9Lce6jK420l4dkQVVUVXL6Ep9C
         QGArEht4eSpXn4yqrtGScjlOvt+u7jxDk5nQcBJKcdbfcagMp0Al0sUUe3Ngs7p5eKC+
         iHrQ==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:content-language:in-reply-to
         :mime-version:user-agent:date:message-id:from:references:to:subject
         :sender:dkim-signature;
        bh=1QhaWlmXs0H+IINtJ15k17ANAIYGym6wCVUojryczJc=;
        b=a1iQ5FR7Bm5LJzRefkGYBPYxopm805hj2O6S607fjUbAM3rpdmvmHEPuBVMaE7Pj9k
         ZU93BhjTgkACyyCDGjhH8eDtECZvZCrWTRvvwtghP/wgOwSwgg2F1TXVtzc5Lm4h2bjN
         wXt+Wm3NqiNRM1v/yGuOGfd5gEK5kXnd6n+wLab2EWpc2nKeLmGlsK2+mKULUfjowFxo
         VyOxGWzALbkUwYTxk1Byq8zmpvWTNR1/V7Sh2F96I77ZLNnDCVFifz+semQtiZHuALh7
         afiw8Ll6tfsJ1WxALkUU8931Fg3NXZ3NivUABx5TI+sEClClw4NBm08cliqfdLi2JRRv
         4eFQ==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass header.i=@web.de header.s=dbaedf251592 header.b=snGrHHNo;
       spf=pass (google.com: domain of jan.kiszka@web.de designates 212.227.17.11 as permitted sender) smtp.mailfrom=jan.kiszka@web.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:subject:to:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :list-post:list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=1QhaWlmXs0H+IINtJ15k17ANAIYGym6wCVUojryczJc=;
        b=H1HjAWHIxsAWXVAez5PL3N/E1UzpHWgH59UKc1n+r8mlN2J1AdM5S52R0730dNpVBW
         jlyfDaDHy27E0UD2gY/0bAFQ4PBnzpDv8JMR801/9cFi/7zFtOjN2O7vhW0cXxYIQGy7
         K6XiL9GoxyJ+ppeMS1kxyBT/MAUSmSpwHmueiChzq6qLkr/m2BXfb97ysIbxqZGYrlhP
         m41s1Qb8Pru1rUt/WR2PAjXaBbYMRDSXSSnzuO9Gmf85iDkTpPuJhnq4Vj0x1k4dv/Vf
         DNan8yorJ2Z4NhBBIxcgqtOs5SwFHYHcFTJStLSdAY+qDWR/P7KgvRKp0Ys4Lq8gV6Sl
         /qFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:subject:to:references:from:message-id
         :date:user-agent:mime-version:in-reply-to:content-language
         :x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:x-spam-checked-in-group:list-post:list-help
         :list-archive:list-subscribe:list-unsubscribe;
        bh=1QhaWlmXs0H+IINtJ15k17ANAIYGym6wCVUojryczJc=;
        b=B7I/f4b843cg2XROndZz5HD7ijWZEf+pATwD74zrHX++NxD+cS8/SSS9vXWZ7zYWJC
         z5foziyVDZLSSh+SaocPkzwtFm5+x4DTp3YAqrILn+QW9oncjKh/b9Wocf0JgSu5TzGR
         7W1eGopmUnUhjK4/X0PbISIcotJdjOPj9iCRJD+qPhKTO0MOPk6ttejfh1AptEuoupag
         ZJO9mm1ISx3a+6T3EsIUE7mrVYqWcgrTgjhKitmERSBtWLFZXVuUexwicpmaUCp0mEKR
         Pfw+mrBaO3GoKHdp8N+aSXd7lN5oXgwIOwh0fFeoHb4w2U13g4u5jRWxG2Im1SXTukpa
         Sl2Q==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: APjAAAWmyzc7Sej0I775LFSFLmQ/iX+w0/IFmhxHxqfil0ZcGUgtaJQL
	36wYjmjA1X5+fL+dRBFfJaM=
X-Google-Smtp-Source: APXvYqz63jRW9agwhOSUwtvp/IHEk9dstK5XHeWvuTqfV3Nc3nwWPpw32263bTjWY3ZF90pDmbgbTA==
X-Received: by 2002:a2e:380c:: with SMTP id f12mr1073670lja.53.1559199167950;
        Wed, 29 May 2019 23:52:47 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a2e:5d92:: with SMTP id v18ls558055lje.2.gmail; Wed, 29 May
 2019 23:52:47 -0700 (PDT)
X-Received: by 2002:a2e:b0da:: with SMTP id g26mr1102414ljl.161.1559199167375;
        Wed, 29 May 2019 23:52:47 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1559199167; cv=none;
        d=google.com; s=arc-20160816;
        b=mUAdjeQQkTHVXHgXX2abMN9ktOJ3HQqTz+oZULVkHxIFif/KKiB3xKOBu54iEnhhNt
         C9YQbIJhq5NMAcRuD94AABpwgQqho5jC3M/RJqbByIOAkEAg4m1C7Ca1o0tD3sF5uWR8
         iI5iQWZLM/kj6Orh4tpeHPZTmQYFxHDI9HyGA+wMWSDP2pe/9wdZZGv+sAMqFJA6ubu/
         TBITb8WXbKUQaZ35RAamc/91t8h8ElPgRKjvMTZACqe/DSpSWl2Fb8flNiRmraLUwl0I
         wCCIlYCtW6uG17mhG5uKIvnjGNBzrJ4poNBSi0guKUWVOc9jMIs+lKSvaZFDVLEmSRbt
         1qiA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:to:subject
         :dkim-signature;
        bh=pTyzyHaVP9Ym0PipuHegf358UfusPrhZd8Tygnrrxtw=;
        b=KiQNUPjcvhITWNKhUWY5YgEYD4JmINi0GzlarJm3PAWiuSchYXSw2MGYimRXm2mhoB
         6aUazRu6/XWHXzYnSFqcngJgnIUm1930vaEOiz2g3xF10zbYhkcqGtC+f+bKSD91L5pU
         Z/z983/k0A/Sx80FEGTTI4A+WSQbeCIGQeyWdWtFpEoU2kmwe0D4fze3S8MavMOIiCbN
         JMvfdspwdNJ37aIbWQgsOS5pPPGRQ5k/LukrY3EkLLg6R7xfI9bRZ66NYcIB+A/4aEJt
         +r3q5jQtIHzG6iiyf2R8NdV73+YUgP9BxuoE++QKvpdSV1J4Q8/XnaxkMdzKoo2YKy4Z
         bJIQ==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       dkim=pass header.i=@web.de header.s=dbaedf251592 header.b=snGrHHNo;
       spf=pass (google.com: domain of jan.kiszka@web.de designates 212.227.17.11 as permitted sender) smtp.mailfrom=jan.kiszka@web.de
Received: from mout.web.de (mout.web.de. [212.227.17.11])
        by gmr-mx.google.com with ESMTPS id c9si104283lff.2.2019.05.29.23.52.47
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 29 May 2019 23:52:47 -0700 (PDT)
Received-SPF: pass (google.com: domain of jan.kiszka@web.de designates 212.227.17.11 as permitted sender) client-ip=212.227.17.11;
X-UI-Sender-Class: c548c8c5-30a9-4db5-a2e7-cb6cb037b8f9
Received: from [192.168.1.10] ([95.157.54.22]) by smtp.web.de (mrweb102
 [213.165.67.124]) with ESMTPSA (Nemesis) id 0MJkxE-1hV8Sw2EvE-001BBf; Thu, 30
 May 2019 08:52:46 +0200
Subject: Re: [PATCH v2 2/6] inmates: x86: introduce a common assembler entry
 point
To: Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>,
 jailhouse-dev@googlegroups.com
References: <20190521143423.17734-1-ralf.ramsauer@oth-regensburg.de>
 <20190521143423.17734-3-ralf.ramsauer@oth-regensburg.de>
From: Jan Kiszka <jan.kiszka@web.de>
Message-ID: <507e40c8-75c7-9ebb-745e-1ccdc4d30d72@web.de>
Date: Thu, 30 May 2019 08:52:46 +0200
User-Agent: Mozilla/5.0 (X11; U; Linux i686 (x86_64); de; rv:1.8.1.12)
 Gecko/20080226 SUSE/2.0.0.12-1.1 Thunderbird/2.0.0.12 Mnenhy/0.7.5.666
MIME-Version: 1.0
In-Reply-To: <20190521143423.17734-3-ralf.ramsauer@oth-regensburg.de>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Language: en-US
X-Provags-ID: V03:K1:efqxZFBfQ2e4isjRegG+2TnIP/XeaxLy5g1imAoDYbS+E1c9NPG
 fhfQq8nwQWcEkGCuvl2OJtddTZVQQhMfeMVfBNNhybwfwJKbcMwnuUMqyKyMyIFAfIfE1R+
 MBhcsclptvB5mheYNIYDYlUNzz5RIbZriKjymmtCPpSzW7gJvatPQpLubWXmLv1CKg6ZAOA
 xG60ryd9gnqg2+OJ9Tb4A==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:kHKQRz4E6oY=:DVgFcroFgDvouYNK8ImqBT
 +vsPiisNNo3RhXnlAjNKIEUQX0jKPnEocSHX6lSdpEzfR0MiZaVQ/9QJYSXsGjvflE3yqcDsh
 uzUrrTbQmj238f5LmqyxOAzlveM6BrDgoZ+Nfo1XWEeAqtXK4sLBl7VHHCYnpgFzlHHkPZ2Js
 RfuB4+GrfRr6+BEzTCw18FCI13/0N3Xd1l2f6BtpB6LLGVHTAmHSeBIY/9evWABdqRQTrQ8Av
 Hi5gLIHYG4IJ3UOgbD2kUcXM9qgH2zpPWjODYif1kqy/QFynVCbN8cPfDXtWM0RQW/3g49yug
 pIkaBiubbftk4rtqUAYlg/aHbzM0uijIvEehLn8F5qbCOtN1Tgl2sejaLTOS/uWZH8076MU/F
 UJMpM3reSRlZWSajvx8k//RIJRQRZ29juaFvtZBW7J4CYoAUBcY3F9BxLC5ulXccYWSngeTtz
 sIngw9N0AZMBfJRMAQlDAegEY1iO0hq/FmvTpsPYQmgO67pyqG3jo9bXPtuTVk5aHuLuy+So/
 MXimP5Y30Ec6L/31btDBoH8tPFno3cy/D3i/q1QaNfvVPeBaoPbAbUDPsm8Lz+b2HHcGg0sGx
 26AGtgekU1GU01EEZxKfslbGWBFu2R5pz9xeM0KlbmhVA0aCvA7eN2gb1vtNGf3BvM+nk7cVZ
 PtBAH6LcIfO/shA0ooN9cayL/R6Mc7zRGtawUtFyc70Hg36Ya1oMe2ZTRD8nlvU/Br8UgkzO2
 i/Rn10aecKmIbZ0hs7QTp58IcNYn87VqfoGfDYYGDN2rMN5s1pT5/WSMUgnJ7DfNT4kvxpb9C
 EQ+MbMHVOcjoBCjXCPI0l5VAe4k9U5cM0e7wM10w6T8500tTWbd287ydg0+kbKK08rDqv1ezD
 c7DWXrK24hlDIOskDW5RB3NK2d+kSh0bFCiC63g9/UqaOoaSnmZ6fwpKaWig1uUyRGhpV8zRs
 Rog4JtLUjlrzP/dUqE0XsSfr91ul1u8VlYSQz70x7PkCfdAQyMD5s
X-Original-Sender: jan.kiszka@web.de
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass
 header.i=@web.de header.s=dbaedf251592 header.b=snGrHHNo;       spf=pass
 (google.com: domain of jan.kiszka@web.de designates 212.227.17.11 as
 permitted sender) smtp.mailfrom=jan.kiszka@web.de
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

On 21.05.19 16:34, Ralf Ramsauer wrote:
> Early startup code is equivalent for both, 32 and 64 bit, so let's
> consolidate them.
>
> This patch introduces an empty start32 hook that is empty at the moment.
> Later, we will use it to enable SSE, which, again, will be the same code
> for 32 and 64 bit.
>
> There's only one drawback: We need __reset_entry at 0x0, but it's now up
> to the linker's mood which files it places there first. Enforce to
> linker to always place __reset_entry to 0x0 by introducing the
> subsection .boot.reset_entry.
>
> Additionally, tweak the Makefile a bit.
>
> Signed-off-by: Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>
> ---
>   inmates/lib/x86/Makefile        |  7 ++--
>   inmates/lib/x86/header-32.S     | 20 ++---------
>   inmates/lib/x86/header-64.S     | 20 ++---------
>   inmates/lib/x86/header-common.S | 62 +++++++++++++++++++++++++++++++++
>   inmates/lib/x86/inmate.lds      |  5 ++-
>   5 files changed, 77 insertions(+), 37 deletions(-)
>   create mode 100644 inmates/lib/x86/header-common.S
>
> diff --git a/inmates/lib/x86/Makefile b/inmates/lib/x86/Makefile
> index bae59025..e474ffd0 100644
> --- a/inmates/lib/x86/Makefile
> +++ b/inmates/lib/x86/Makefile
> @@ -40,7 +40,7 @@ include $(INMATES_LIB)/Makefile.lib
>
>   always := lib.a lib32.a
>
> -TARGETS := ioapic.o printk.o setup.o smp.o uart.o
> +TARGETS := header-common.o ioapic.o printk.o setup.o smp.o uart.o
>   TARGETS += ../alloc.o ../pci.o ../string.o ../cmdline.o ../setup.o
>   TARGETS += ../uart-8250.o ../printk.o
>   TARGETS_32_ONLY := header-32.o
> @@ -57,7 +57,10 @@ $(obj)/lib32.a: $(addprefix $(obj)/,$(lib32-y))
>
>   targets += header-32.o
>
> -$(obj)/%-32.o: a_flags += -m32
>   $(obj)/%-32.o: c_flags += -m32
>   $(obj)/%-32.o: $(src)/%.c
>   	$(call if_changed_rule,cc_o_c)
> +
> +$(obj)/%-32.o: a_flags += -m32
> +$(obj)/%-32.o: $(src)/%.S
> +	$(call if_changed_rule,as_o_S)
> diff --git a/inmates/lib/x86/header-32.S b/inmates/lib/x86/header-32.S
> index 006cce9a..30b3f5e3 100644
> --- a/inmates/lib/x86/header-32.S
> +++ b/inmates/lib/x86/header-32.S
> @@ -39,21 +39,9 @@
>   #include <inmate.h>
>   #include <asm/regs.h>
>
> -	.code16
> -	.section ".boot", "ax"
> -
> -	.globl __reset_entry
> -__reset_entry:
> -	lgdtl %cs:gdt_ptr
> -
> -	mov %cr0,%eax
> -	or $X86_CR0_PE,%al
> -	mov %eax,%cr0
> -
> -	ljmpl $INMATE_CS32,$start32
> -
> -
>   	.code32
> +	.section ".boot", "ax"
> +	.globl start32
>   start32:
>   	mov %cr4,%eax
>   	or $X86_CR4_PSE,%eax
> @@ -107,11 +95,8 @@ call_entry:
>   	mov $stack_top,%esp
>   	call *%ebx
>
> -stop:	cli
> -	hlt
>   	jmp stop
>
> -
>   	.pushsection ".data"
>
>   	.globl ap_entry
> @@ -139,6 +124,7 @@ loader_gdt:
>   	.quad	0x00af9b000000ffff
>   	.quad	0x00cf93000000ffff
>
> +	.globl gdt_ptr
>   gdt_ptr:
>   	.short	gdt_ptr - loader_gdt - 1
>   	.long	loader_gdt
> diff --git a/inmates/lib/x86/header-64.S b/inmates/lib/x86/header-64.S
> index cb886b8e..2c4caace 100644
> --- a/inmates/lib/x86/header-64.S
> +++ b/inmates/lib/x86/header-64.S
> @@ -39,21 +39,9 @@
>   #include <inmate.h>
>   #include <asm/regs.h>
>
> -	.code16
> -	.section ".boot", "ax"
> -
> -	.globl __reset_entry
> -__reset_entry:
> -	lgdtl %cs:gdt_ptr
> -
> -	mov %cr0,%eax
> -	or $X86_CR0_PE,%al
> -	mov %eax,%cr0
> -
> -	ljmpl $INMATE_CS32,$start32
> -
> -
>   	.code32
> +	.section ".boot", "ax"
> +	.globl start32
>   start32:
>   	mov %cr4,%eax
>   	or $X86_CR4_PAE,%eax
> @@ -111,11 +99,8 @@ call_entry:
>   	mov $stack_top,%rsp
>   	callq *%rbx
>
> -stop:	cli
> -	hlt
>   	jmp stop
>
> -
>   	.pushsection ".data"
>
>   	.globl ap_entry
> @@ -141,6 +126,7 @@ gdt:
>   	.quad	0x00c09b000000ffff
>   	.quad	0x00af9b000000ffff
>
> +	.globl gdt_ptr
>   gdt_ptr:
>   	.short	gdt_ptr - gdt - 1
>   	.long	gdt
> diff --git a/inmates/lib/x86/header-common.S b/inmates/lib/x86/header-common.S
> new file mode 100644
> index 00000000..139d4ae2
> --- /dev/null
> +++ b/inmates/lib/x86/header-common.S
> @@ -0,0 +1,62 @@
> +/*
> + * Jailhouse, a Linux-based partitioning hypervisor
> + *
> + * Copyright (c) OTH Regensburg, 2019
> + *
> + * Authors:
> + *  Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>
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
> +#include <asm/regs.h>
> +
> +	.code16
> +	.section ".boot.entry", "ax"
> +
> +	.globl __reset_entry
> +__reset_entry:
> +	lgdtl %cs:gdt_ptr
> +
> +	mov %cr0, %eax
> +	or $X86_CR0_PE, %al
> +	mov %eax, %cr0
> +
> +	ljmpl $INMATE_CS32, $start32
> +
> +	.code32
> +	.section ".boot", "ax"
> +
> +	.globl stop
> +stop:
> +	cli
> +1:	hlt
> +	jmp 1b

This is conceptually risky: If we should ever place some opcodes here that are
not 32/64 invariant, things will subtly break. So better avoid this false sharing.

Jan

> diff --git a/inmates/lib/x86/inmate.lds b/inmates/lib/x86/inmate.lds
> index 95c6ec97..a1ca242f 100644
> --- a/inmates/lib/x86/inmate.lds
> +++ b/inmates/lib/x86/inmate.lds
> @@ -39,7 +39,10 @@
>   SECTIONS
>   {
>   	. = 0;
> -	.boot		: { *(.boot) }
> +	.boot		: {
> +		*(.boot.entry)
> +		*(.boot)
> +	}
>
>   	. = 0x1000;
>   	.cmdline	: {
>

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/507e40c8-75c7-9ebb-745e-1ccdc4d30d72%40web.de.
For more options, visit https://groups.google.com/d/optout.
