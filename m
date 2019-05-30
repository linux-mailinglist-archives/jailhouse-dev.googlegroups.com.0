Return-Path: <jailhouse-dev+bncBDDNLV6S7AOBBHX7XXTQKGQENSBQ4JY@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-ed1-x539.google.com (mail-ed1-x539.google.com [IPv6:2a00:1450:4864:20::539])
	by mail.lfdr.de (Postfix) with ESMTPS id 732FE2F7AA
	for <lists+jailhouse-dev@lfdr.de>; Thu, 30 May 2019 09:00:46 +0200 (CEST)
Received: by mail-ed1-x539.google.com with SMTP id n23sf7247643edv.9
        for <lists+jailhouse-dev@lfdr.de>; Thu, 30 May 2019 00:00:46 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1559199646; cv=pass;
        d=google.com; s=arc-20160816;
        b=ycr8SKwKz5bnvU5qlW2GNiMKq38K7I+5ZJ32IFbPhgzjfOArRGp6xVktGRSQy+19pU
         l1hpagsYdSiZsT+nSrLkXRO4pGYp7dHHWOalf6WvA4febHIc9+J9s7bPmorO16nO6hCW
         vjp9suRaiqbuxm9yetyIGPLvsZjclA2kbtQjY/p2bUsezwhN9BhoqxGINLMAM0VTONZN
         JEpRxFvzSclyAxUIvlVcRoGCrILqR1ZojfBIzyRN+C1mVCMNcHC02GOMoDhjsZdUpM0w
         8oEC2j6n2zUCT8HDDHXeHvOCGyBS8/q/qMt0aL/8lc/VQhnpkawb4/pXC1qTj5Lf4lwo
         c73Q==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:content-language:in-reply-to
         :mime-version:user-agent:date:message-id:from:references:to:subject
         :sender:dkim-signature;
        bh=yvDfCNbUpqpWabd1nfkOksb92fe4yB+ozpsWFHc0HRE=;
        b=oVryoP5hXYcVyVX4ei5YqbbRZwYxPL4IZQaQRzOHrhO/hMKtad0Qz21GD+nQmwogPp
         FF3J9XyymMiS01qGk5zyEwYSj1I0ReCwt2dRQSSrzcsVB5g9dRVGU87A34jrJT+BBM+q
         W2SLdNUGUcvxne1AcyBbQHkGD/3rXzN/dV5f2IpStvMGAx0o/uhCgjtjnUdEu8Z0HKAP
         E+kndFBShfgrkZD4BzEX5+5BdYqqRfz30fLGt3rLEQPyWLbhmJyc3kfQk9pK7ZQ3NF20
         Y0jHVJtMSngf1BdKkZKczNnWGpU5xq84E8Iu6CwmIcDBV0H7wGzFUOuBU764u0ujgRG/
         s28A==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass header.i=@web.de header.s=dbaedf251592 header.b=AoDMT7VM;
       spf=pass (google.com: domain of jan.kiszka@web.de designates 212.227.17.11 as permitted sender) smtp.mailfrom=jan.kiszka@web.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:subject:to:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :list-post:list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=yvDfCNbUpqpWabd1nfkOksb92fe4yB+ozpsWFHc0HRE=;
        b=onlidnrBDwXyHYbgK9F96B+7q4zjRd0LArtoKM/4Cf0xe8TC00OxOfwRpFy0tN3NQa
         WvnVGWwGmVydIoFKo6gU5RVWzT57bq+TQ0IJXTwo1AQm0tnZ86db0bc1Xi8N8IWFDG4l
         FLZvCU77ZfaEszQDS+K7KETS4dtLF5Os97ZkuS4nRLO6YkMjTLlr/PqgE/XbsG2Q/qxJ
         7c6N+8RyXj7yaV7j8frV4HnNIJSJAgnZZRKNcDLdLYc2BWbHzglY3HIYCspFoA09iSbD
         g4LOxLm+0IvEUNsmO3zYdVOValp0IZkETNiBC4QFc1pDAN8yXPr1BbHOAdenTgx/DP1r
         5OCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:subject:to:references:from:message-id
         :date:user-agent:mime-version:in-reply-to:content-language
         :x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:x-spam-checked-in-group:list-post:list-help
         :list-archive:list-subscribe:list-unsubscribe;
        bh=yvDfCNbUpqpWabd1nfkOksb92fe4yB+ozpsWFHc0HRE=;
        b=MjTwo0XwGof8N5zbwj4aPWE8znZULjWy6AfEUJq+84950HW/7WBn/wUdcPRa5XTyVM
         IB/n25rW3/02kG0+rTfpJWMivc379VZc/rKjDl6+RtcetJa8QTn29J6iOdOd+K8WO2eh
         hj5hJAo9akxDUNUsN1AATAipF02SqW3v9spu5090HZMAIMLhZnvwQzur6m1USstLE03w
         HaE7cA2jEXWkisWyZoE6zboPxZdTp6kaXbON62u318ahucQZ0LTSdO8FmYiONDXueSKL
         ZWTsQCGiR1yMpSrp1G8dDSsKiWscoocuoRaJD3lsnDIM85HhGHYzdEyrJAZbeGZnCBD9
         tPxQ==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: APjAAAX+QzaLHCiuAMPAuZIZUeIcsdf55jFLeAOMvfIwrycJ5Gqv4Ycp
	aal5pGIQtWc1IZ+5jBKfass=
X-Google-Smtp-Source: APXvYqxUgRkhdg7UQEb9LYSLyDK3xxld+24xGHuqYkN+G9NCnxHWkQ3i0n3UFlwJ4IqAJ3X/9RampA==
X-Received: by 2002:a50:91cc:: with SMTP id h12mr2637654eda.3.1559199646137;
        Thu, 30 May 2019 00:00:46 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a50:a58c:: with SMTP id a12ls1401422edc.10.gmail; Thu, 30
 May 2019 00:00:44 -0700 (PDT)
X-Received: by 2002:a50:ca89:: with SMTP id x9mr1052508edh.164.1559199644790;
        Thu, 30 May 2019 00:00:44 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1559199644; cv=none;
        d=google.com; s=arc-20160816;
        b=S3H7XCedjGtj5z1apea+7H3YgiVTvSDKsxUa3s4SHnE0JBH5athftVsSWVbOLWU4UD
         +sAhmofk20dHUnTJ+n3gKqOZilcWzZ8MKTJVHonunGlId4FAVMU/wFgbdJV0TUYXQ0qB
         z7WvDwP3XvteM8xMGQIqT75jU+FmwsxKkuxN8teuZE/DUEjs8hXWiaUiTyrv3ZflT+Tv
         0xBcfrKWraJD6roOjCCMGgB2mDwWdeCApJ2Vz48L0NUyR5gkKWvaQtBzfao01KBBPvOu
         kVDDXE0eAAx6iFRvOz8vanfJoxUXmC3Inbdx1/QsMDQ6G8fnS9NszaXUy4kCh5OlouBc
         ht+Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:to:subject
         :dkim-signature;
        bh=ZuBItMYZeOk8XQgcExXnHVXnTc+eCFE+sJrAfS1FazQ=;
        b=t7w4iS1aLWU6dSn2YwUV1KdxteeMK8WpU9y9IwMPD5wgm3MTi3db+rdDHJBx+kzjFv
         yw9qIxCvooNZQ663QOLq1KZOgD6IFeLyqR7kRprhujcsONpVBCC5Fm5mixAgFcoinojk
         yCrP1OSLLoQ90wDeLqin/5lBiA+XeGzRoOHWXZrDF5Bo+6dkKJsdDCjnWZBWxRv4MmQP
         1JfCeHvs4iCd5jeGSlavDPKOOLzNp2EBq1/CjhorUpwBs/TejIDd3yashj7DN/Si7yZl
         ZpYEeOcn+kSkFXFecqdufLl1rm/rsDgNZszLaj+ps0qK7va4VJx0DgJgdjwWs+pEwYoa
         mJTg==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       dkim=pass header.i=@web.de header.s=dbaedf251592 header.b=AoDMT7VM;
       spf=pass (google.com: domain of jan.kiszka@web.de designates 212.227.17.11 as permitted sender) smtp.mailfrom=jan.kiszka@web.de
Received: from mout.web.de (mout.web.de. [212.227.17.11])
        by gmr-mx.google.com with ESMTPS id t36si61638edb.0.2019.05.30.00.00.44
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 30 May 2019 00:00:44 -0700 (PDT)
Received-SPF: pass (google.com: domain of jan.kiszka@web.de designates 212.227.17.11 as permitted sender) client-ip=212.227.17.11;
X-UI-Sender-Class: c548c8c5-30a9-4db5-a2e7-cb6cb037b8f9
Received: from [192.168.1.10] ([95.157.54.22]) by smtp.web.de (mrweb103
 [213.165.67.124]) with ESMTPSA (Nemesis) id 0LmuAa-1gyFbk0YGq-00h3us; Thu, 30
 May 2019 09:00:44 +0200
Subject: Re: [PATCH v2 4/6] inmates: x86: discover and activate SSE/AVX
To: Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>,
 jailhouse-dev@googlegroups.com
References: <20190521143423.17734-1-ralf.ramsauer@oth-regensburg.de>
 <20190521143423.17734-5-ralf.ramsauer@oth-regensburg.de>
From: Jan Kiszka <jan.kiszka@web.de>
Message-ID: <eca382c5-96bb-352f-d06a-6f92f25088d0@web.de>
Date: Thu, 30 May 2019 09:00:43 +0200
User-Agent: Mozilla/5.0 (X11; U; Linux i686 (x86_64); de; rv:1.8.1.12)
 Gecko/20080226 SUSE/2.0.0.12-1.1 Thunderbird/2.0.0.12 Mnenhy/0.7.5.666
MIME-Version: 1.0
In-Reply-To: <20190521143423.17734-5-ralf.ramsauer@oth-regensburg.de>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Language: en-US
X-Provags-ID: V03:K1:j+8Jvauu9WkTw4vifwSx1QwnRSn4IcpUvQc742sAC97QcBGVK9V
 1J1FV3yTjrYQNMplhUQnVVUiXT1mrtG2pJYlMA7Cd2sehz/ObxXsDtBcUuapJLCf99GgLCo
 VzXO6k6HwF0yFWTZJwMtNlvooxKqoyMY0dxhgbCz8N0RS87XzdXoJa96Yv5s5aZFM+RV+Uj
 Bje6Fm6dAieaf65pCKkpA==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:3rDurK7AVJs=:xgDwpFSWROJ3gTEpTjTZpl
 lbwIXsVvj1d4t+8CQBTjHIlvvbuWUQjQMctWmPNGvHWhU1xg+b1DzVe64XkO7lEWU0ziZFL+W
 zCwSq2DKsTG2KGu8uI9ie5Sn+RULwNeydKaqN8RmDFcQ/oEqf0Jl0tVRI+F9iA0+dCCgTus4V
 d5XEmoHa1v5u3j1gneeOoQ/3L0hEkXjIHQb8onAkwKlnI0Jn+JNpYihxT1NjNA1EtMOBk2w+h
 aYqx64Qp/Qj0I5DTuw9OLf1A7HdO3jCP0ohej6DvgNq/ejixSqy9lRp4uug3tj2xmc646Mg4p
 BgV4btpHPvrTUOKI5crul6s8LvcHGjjTlTIGAgNpPk9aKJos9YBidiBLSyB4lVKPy5XEAjnDH
 NrIR8EWpQ0NEPu/A45mULQcIO2EjwzsE0mP8/PeCxqrwE32/CA3DdzOVPLMgYUbdiC6Lyk8bX
 NQVw3sHFaz4uF2rfY6Ib2GvKONMD6ACJU2WO6EOWDyCOrdw28bdOSs3NFaXCuQ4vy4rKp4sM/
 FaP6ip3pMB3/p7DxWNxB3hAD9Qpx2vasxwwIqKgAuP7jgGhqfbRcPb+MwCHBZ+uOlQZJqtgRn
 LTtCMcm3n6E8mLsU0cuNq8TUF8owxJhJPSNAWdnl5IqJWuFYpm4hJLZkw9FDtKCKQ7Ika+/hr
 CWXtFNaozvjEqify6NMGwzRAT5SzTNR/rHd/IQYtPsyqoVwErKLWPzzZXX/xDw/0I8P7ihaAp
 ET0sAHxqYv8Ux3Vtbrb20PF4frCCppX9fAo7f32q0WjwR9Lea1OPzh5fqcnVCpnRB4jJAGn/i
 klBYKyH7qtU/hjUbTQeKLQSRvpFqmfc2E7MkuHmYY/RNo5QzcAXDXZfeACRBMYQsBWQ+ZFpMh
 IpewSqC5Cjlz4zGxeVvT0UaH9MwJ8iJfgSLoWsPTfR+df6pBIuoyQhWB4uYUUxwpApZjc/Pzi
 2m8r40Nd52Zw1PnHfxsEGju8NMSDyaJ574ohlN906cmPKbmkLJf67
X-Original-Sender: jan.kiszka@web.de
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass
 header.i=@web.de header.s=dbaedf251592 header.b=AoDMT7VM;       spf=pass
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
> Recent gcc versions emit SSE instructions for 32-bit inmates (e.g., in
> hex2str or cmdline_parse routines). Inmates aren't able to execute those
> instructions as SSE is not enabled and will crash.
>
> Enabling SSE is the same code for 32 and 64 bit x86 and straight
> forward: Lookup SSE availability via cpuid and enable OSFXSR in cr4. If
> SSE is not available, stop the inmate.
>
> If AVX is available, activate it (XCR0).
>
> Lookup features that need no explicit activation.
>
> Signed-off-by: Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>
> ---
>   inmates/lib/x86/Makefile           |   6 +-
>   inmates/lib/x86/cpu-features.c     | 103 +++++++++++++++++++++++++++++
>   inmates/lib/x86/header-32.S        |   9 ++-
>   inmates/lib/x86/header-64.S        |   9 ++-
>   inmates/lib/x86/include/asm/regs.h |  36 ++++++++++
>   5 files changed, 158 insertions(+), 5 deletions(-)
>   create mode 100644 inmates/lib/x86/cpu-features.c
>
> diff --git a/inmates/lib/x86/Makefile b/inmates/lib/x86/Makefile
> index e474ffd0..ed3b04d5 100644
> --- a/inmates/lib/x86/Makefile
> +++ b/inmates/lib/x86/Makefile
> @@ -40,7 +40,7 @@ include $(INMATES_LIB)/Makefile.lib
>
>   always := lib.a lib32.a
>
> -TARGETS := header-common.o ioapic.o printk.o setup.o smp.o uart.o
> +TARGETS := cpu-features.o header-common.o ioapic.o printk.o setup.o smp.o uart.o
>   TARGETS += ../alloc.o ../pci.o ../string.o ../cmdline.o ../setup.o
>   TARGETS += ../uart-8250.o ../printk.o
>   TARGETS_32_ONLY := header-32.o
> @@ -57,6 +57,10 @@ $(obj)/lib32.a: $(addprefix $(obj)/,$(lib32-y))
>
>   targets += header-32.o
>
> +# Code of this object is called before SSE/AVX is available. Ensure that the
> +# compiler won't generate unsupported instructions for this file.
> +CFLAGS_cpu-features.o += -mno-sse
> +
>   $(obj)/%-32.o: c_flags += -m32
>   $(obj)/%-32.o: $(src)/%.c
>   	$(call if_changed_rule,cc_o_c)
> diff --git a/inmates/lib/x86/cpu-features.c b/inmates/lib/x86/cpu-features.c
> new file mode 100644
> index 00000000..9cf98543
> --- /dev/null
> +++ b/inmates/lib/x86/cpu-features.c
> @@ -0,0 +1,103 @@
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
> +/* Must only be called from assembler via jmp */
> +void arch_init_features(void);
> +
> +struct x86_cpu_features x86_cpu_features __attribute__((section(".data")));
> +
> +/*
> + * We arrive here very early, and we don't have a stack. Take care.
> + *
> + * Every booting CPU will call this function. We make the assumption that all
> + * CPUs have the same feature set. So we don't need any locks when writing to
> + * x86_cpu_features.
> + */
> +void __attribute__((naked, noreturn, section(".boot")))

What's "naked" supposed to do here? The compilers says it will ignore it.

> +arch_init_features(void)
> +{
> +	register u64 features;
> +
> +	features = cpuid_edx(X86_CPUID_FEATURES, 0);
> +	/* Check availability of FPU */
> +	x86_cpu_features.fpu = !!(features & X86_FEATURE_FPU);
> +
> +	/* Discover and enable FXSR */
> +	if (features & X86_FEATURE_FXSR) {
> +		write_cr4(read_cr4() | X86_CR4_OSFXSR);
> +		x86_cpu_features.fxsr = true;
> +	}
> +
> +	/* Check availability of SSE */
> +	x86_cpu_features.sse = !!(features & X86_FEATURE_SSE);
> +	x86_cpu_features.sse2 = !!(features & X86_FEATURE_SSE2);
> +
> +	/* ECX hides the rest */
> +	features = cpuid_ecx(X86_CPUID_FEATURES, 0);
> +	x86_cpu_features.sse3 = !!(features & X86_FEATURE_SSE3);
> +	x86_cpu_features.sse4_1 = !!(features & X86_FEATURE_SSE4_1);
> +	x86_cpu_features.sse4_2 = !!(features & X86_FEATURE_SSE4_2);
> +	x86_cpu_features.pclmulqdq = !!(features & X86_FEATURE_PCLMULQDQ);
> +
> +	if (features & X86_FEATURE_XSAVE) {
> +		/* Enable XSAVE related instructions */
> +		write_cr4(read_cr4() | X86_CR4_OSXSAVE);
> +		x86_cpu_features.xsave = true;
> +
> +		/*
> +		 * Intel SDM 13.2: A bit can be set in XCR0 if and only if the
> +		 * corresponding bit is set in this bitmap.  Every processor
> +		 * that supports the XSAVE feature set will set EAX[0] (x87
> +		 * state) and EAX[1] (SSE state).
> +		 *
> +		 * We can always safely write SSE + FP, but only set AVX if
> +		 * available.
> +		 */
> +
> +		features = cpuid_edax(X86_CPUID_XSTATE, 0);
> +		write_xcr0(read_xcr0() | (features & X86_XCR0_AVX) | \
> +			   X86_XCR0_SSE | X86_XCR0_X87);
> +		x86_cpu_features.avx = !!(features & X86_XCR0_AVX);
> +	}
> +
> +	/* hand control back to assembler */
> +	asm volatile("jmp x86_start\t\n");

Hacky... Is there no stack yet to do proper call/ret?

But if you want to / have to use a jmp here, you need to tell the compiler that
this will never "return" (__builtin_unreachable).

Jan

> +}
> diff --git a/inmates/lib/x86/header-32.S b/inmates/lib/x86/header-32.S
> index 30b3f5e3..ca9f77f9 100644
> --- a/inmates/lib/x86/header-32.S
> +++ b/inmates/lib/x86/header-32.S
> @@ -63,6 +63,13 @@ start32:
>   	mov %eax,%es
>   	mov %eax,%ss
>
> +	/* Temporarily hand over to C. Note that we don't have a valid stack. */
> +	jmp arch_init_features
> +
> +	/* C will jmp back to x86_start */
> +	.globl x86_start
> +x86_start:
> +
>   	xor %ebx,%ebx
>   	xchg ap_entry,%ebx
>   	or %ebx,%ebx
> @@ -74,7 +81,7 @@ start32:
>   	cmp $SMP_MAX_CPUS,%edi
>   	jae stop
>
> -	mov $0x01,%eax
> +	mov $X86_CPUID_FEATURES, %eax
>   	cpuid
>   	shr $24,%ebx
>   	mov %bl,smp_cpu_ids(%edi)
> diff --git a/inmates/lib/x86/header-64.S b/inmates/lib/x86/header-64.S
> index 2c4caace..53b13173 100644
> --- a/inmates/lib/x86/header-64.S
> +++ b/inmates/lib/x86/header-64.S
> @@ -63,10 +63,13 @@ start32:
>   	mov $(X86_CR0_PG | X86_CR0_WP | X86_CR0_PE),%eax
>   	mov %eax,%cr0
>
> -	ljmpl $INMATE_CS64,$start64
> +	/* Temporarily hand over to C. Note that we don't have a valid stack. */
> +	ljmpl $INMATE_CS64, $arch_init_features
>
> +	/* C will jmp back to x86_start. We're now in 64-bit mode. */
>   	.code64
> -start64:
> +	.globl x86_start
> +x86_start:
>   	xor %rbx,%rbx
>   	xchg ap_entry,%rbx
>   	or %rbx,%rbx
> @@ -78,7 +81,7 @@ start64:
>   	cmp $SMP_MAX_CPUS,%edi
>   	jae stop
>
> -	mov $0x01,%eax
> +	mov $X86_CPUID_FEATURES, %eax
>   	cpuid
>   	shr $24,%ebx
>   	mov %bl,smp_cpu_ids(%edi)
> diff --git a/inmates/lib/x86/include/asm/regs.h b/inmates/lib/x86/include/asm/regs.h
> index 85da043b..905d03ee 100644
> --- a/inmates/lib/x86/include/asm/regs.h
> +++ b/inmates/lib/x86/include/asm/regs.h
> @@ -42,15 +42,51 @@
>
>   #define X86_CR4_PAE		0x00000020
>   #define X86_CR4_PSE		0x00000010
> +#define X86_CR4_OSFXSR		0x00000200
> +#define X86_CR4_OSXSAVE		0x00040000
> +
> +#define X86_XCR0_X87		(1 << 0)
> +#define X86_XCR0_SSE		(1 << 1)
> +#define X86_XCR0_AVX		(1 << 2)
>
>   #define MSR_EFER		0xc0000080
>   #define EFER_LME		0x00000100
>
> +#define X86_CPUID_FEATURES	0x00000001 /* Processor Info and Feature Bits */
> +/* Feature bits in EDX */
> +# define X86_FEATURE_FPU	(1 << 0)  /* The processor contains an x87 FPU. */
> +# define X86_FEATURE_FXSR       (1 << 24) /* FXSAVE/FXRSTOR, CR4.OSFXSR */
> +# define X86_FEATURE_SSE	(1 << 25) /* The processor supports SSE */
> +# define X86_FEATURE_SSE2	(1 << 26) /* The processor supports SSE2 */
> +/* Feature bits in ECX */
> +# define X86_FEATURE_SSE3	(1 << 0)  /* The processor supports SSE3 */
> +# define X86_FEATURE_PCLMULQDQ	(1 << 1)  /* The processor supports PCLMULQDQ */
> +# define X86_FEATURE_SSE4_1	(1 << 19) /* The processor supports SSE4.1 */
> +# define X86_FEATURE_SSE4_2	(1 << 20) /* The processor supports SSE4.2 */
> +# define X86_FEATURE_XSAVE	(1 << 26) /* XSAVE/..., CR4.OSXSAVE */
> +
> +#define X86_CPUID_XSTATE	0x0000000d /* Extended state features */
> +
>   #define MSR_MTRR_DEF_TYPE	0x000002ff
>   #define MTRR_ENABLE		0x00000800
>
>   #ifndef __ASSEMBLY__
>
> +struct x86_cpu_features {
> +	bool avx:1;
> +	bool sse:1;
> +	bool sse2:1;
> +	bool sse3:1;
> +	bool sse4_1:1;
> +	bool sse4_2:1;
> +	bool fpu:1;
> +	bool xsave:1;
> +	bool fxsr:1;
> +	bool pclmulqdq:1;
> +};
> +
> +extern struct x86_cpu_features x86_cpu_features;
> +
>   static unsigned long __force_order;
>
>   static inline unsigned long read_cr4(void)
>

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/eca382c5-96bb-352f-d06a-6f92f25088d0%40web.de.
For more options, visit https://groups.google.com/d/optout.
