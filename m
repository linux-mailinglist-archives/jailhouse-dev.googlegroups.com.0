Return-Path: <jailhouse-dev+bncBDDNLV6S7AOBB6GH77TQKGQEQ4R77CI@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-ed1-x538.google.com (mail-ed1-x538.google.com [IPv6:2a00:1450:4864:20::538])
	by mail.lfdr.de (Postfix) with ESMTPS id E2AFE3D3FA
	for <lists+jailhouse-dev@lfdr.de>; Tue, 11 Jun 2019 19:25:12 +0200 (CEST)
Received: by mail-ed1-x538.google.com with SMTP id d27sf21676741eda.9
        for <lists+jailhouse-dev@lfdr.de>; Tue, 11 Jun 2019 10:25:12 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1560273912; cv=pass;
        d=google.com; s=arc-20160816;
        b=cDl2vMZr57dLXXlGsqnd5CjSftgYR1xcQ64TX15lcBGD9jY29J0PnuF9PmG91X7hKl
         r2WI00p3FYsOnLnWkBuVP4QI3fAB8h1x/yqj5qWNWcmvH7KMmJqTjtdet1WN0AICjQOX
         EzWGPBwFFLY6abXX6yZjdFZojQ1rg2XeFQ0rkNKEVOnelQu0dbJSg9S6zW0yuuPFgqab
         p7KdhKjjjoBD5+nLYLedgcXXjzwxdWOwbgFC2v0ga9/PFiqXtkfBPVXfAesr/fQ0939W
         TLdGwGL4tqchlooG01nyQvxDi8grG0uHJh34weB/n11XT4TnxtPGKjtZQTUZAdtPVJ8I
         9vyg==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:content-language:in-reply-to
         :mime-version:user-agent:date:message-id:from:references:to:subject
         :sender:dkim-signature;
        bh=nqu5RF8lB/bRWSc4g9wnbhm9c7mhGfJOp7/egyN5GT4=;
        b=QXSvlV4XqYn+0Jz7opPTp5pKXPnBkF+JL0Lmz0Fh2jPK89hSL4kb+oiUQKJy3O61lA
         tKYGlbi5Qtz4LhY+8Ze3xbSLftM+DHaroXYmDapoEZE3KMx2+v8HtUJuD7j/Pi21viap
         Y1s32EY+DHZMDTrAvUUDrTiNpET0Jdoyxm7ri3pssB/4Q1xY7aoIJFJ2CMlUoFi0jkM4
         twxOGclJy+DzeLqoBgWnYfOy82qJR3PtqTEc07SAyREYmOjfHlfM/pzn0btdHj3dnSi1
         6Yu57jkHKejt9XkrwbnLIyJde0r8Tns9WgQNwJRD/DeVIpla9A9Kfs0FiLfhYbbF2Z7Y
         pdaQ==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass header.i=@web.de header.s=dbaedf251592 header.b=qIq17ae6;
       spf=pass (google.com: domain of jan.kiszka@web.de designates 212.227.15.3 as permitted sender) smtp.mailfrom=jan.kiszka@web.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:subject:to:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :list-post:list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=nqu5RF8lB/bRWSc4g9wnbhm9c7mhGfJOp7/egyN5GT4=;
        b=ZI1HKDySS9HcJKLXs6y5Vt12mScME/58g8tQrX7MrfAfJR4kTrfM6GJyABFFrllaVA
         8xaF0apMlJF5R8m6rL/ottpvP6ioTvlexzR9LKJjfiq46z9DB76nHtesq4Iw4adTTNku
         /18t23XWJYsrP3+JBtr1/izoGyMG8T2NwN0+weJpyAedx9vKePrfpu88ysntFOkm8HGF
         O4NauqDHtM1kg7RXKqyqa6IAFvMy0BTJLWLQPEWbCgIljqA8OzAdyoy/LBh9obM98LOx
         /WoAP8601F4il1tvqLT9LUuQttcGFyF4ji/HO4uuxPytIuJpjYoTvjoTGerPABcKrYAo
         72lw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:subject:to:references:from:message-id
         :date:user-agent:mime-version:in-reply-to:content-language
         :x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:x-spam-checked-in-group:list-post:list-help
         :list-archive:list-subscribe:list-unsubscribe;
        bh=nqu5RF8lB/bRWSc4g9wnbhm9c7mhGfJOp7/egyN5GT4=;
        b=QHT6AqDamyco1xrN+5kEjY9K7O778ke4IUBIshDPMKjZgPd3zelk7p3r4MZzPSnch0
         V/RqT7hprcTnJj4AWVc33N1qsSLJrq2/GLKY3ypCGJNVMLxrUlqGYMD7GUdIke279NsV
         t2YtAHAphgCN7cWX9wR6crrWpivdY57mnNhzdsilEw/u230ffSNpfvcw5wv8A0FqkGof
         dP1/eaHGwzIFkilq1uWEc+ANpxXXKW+fgpszJ0iT2XNIkcqhb5iL9if00wNjxybAWscC
         OeV2owSn4GruT4noGRwQw1LC2vIHcdsqSYcMmWecVn9XrH7Zbmmzm/7tz9stAPefTgwp
         7eXA==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: APjAAAXlQjOTC7vCrxgaI4Ns2pTQ0Y/sAWdcM2giYZHfqtzXwCVRkvo6
	RF7gw5/yUYu5MxbHuAcwhWg=
X-Google-Smtp-Source: APXvYqwdnShSOC0i0X+aUerY/OPL6Jjroyd79deNLyWfwJ6ANazRhktSKtlYK1B7x/bZhOut4m1iTw==
X-Received: by 2002:a17:906:3d69:: with SMTP id r9mr24289305ejf.28.1560273912626;
        Tue, 11 Jun 2019 10:25:12 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a17:906:35c5:: with SMTP id p5ls3841934ejb.9.gmail; Tue, 11
 Jun 2019 10:25:12 -0700 (PDT)
X-Received: by 2002:a17:906:4948:: with SMTP id f8mr18562950ejt.79.1560273912080;
        Tue, 11 Jun 2019 10:25:12 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1560273912; cv=none;
        d=google.com; s=arc-20160816;
        b=DWr6YoQiTg8zEdfG7Q8QBxeQ4e/OaMM5qo4wS7B4vOW8wxvFAZ0GjevMTwykjtx5dw
         jB3kRVGJiDtiHkG2EsLdchk4ZEF5WGXV4hoEPZ21fMPNvUUpxAwQySr3IFsrBzFZQGhO
         Epg+Ov0m6CxR9GUwJe6Igi3quqkAMr3nQhiAUKnfAJg6uN3fg+hlUbV5qaxJbxkkPptr
         0itGLjHgXpEiDfuFBy6zyxgB6CC7HBiCCUIOgbuQkmT91mEa0VHAeNA9/hbWtEKDW3Pd
         ebxpQR9cnraII0T46T2dDW5jj54wVXrohyFNb5qTFMFD/XVmD6YbIJxOAwXtxM1AugKO
         79Kw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:to:subject
         :dkim-signature;
        bh=3i3uDWnV59pomlv2BmS9T0dqoM4dzRG64bnEgM2fq/o=;
        b=rl1YRSdh0iNmzH90kn51d+mfFe5ur8JpIz/verkVZe1QAWoiWtDoMigytBxoe8tn4f
         BGS9N635njg0vJl6MsGbi9bqiuGTs+JLpPl6fJgBbvhkI4sfhhVdhi+OrS/V2cLsX99i
         Td+vW6LImJ20i8THP9WurgS/9SrtQt+Pjw2a4gBAAbfLmZWkM0UyX+ZPT9UZHE3kktGS
         scaZ/m0XxVa0FnUDY9BNpdWrVQ12bvML4+exdZkovp3Et0nGQmWYuxyuu3IFHIsFKzC/
         f2Lgt68zjgl3W0bm2DVFJzlAxaay6IsbVfiLbwGTA4PaujOGzvbIwSvAAemUBQgj6hKh
         lEIg==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       dkim=pass header.i=@web.de header.s=dbaedf251592 header.b=qIq17ae6;
       spf=pass (google.com: domain of jan.kiszka@web.de designates 212.227.15.3 as permitted sender) smtp.mailfrom=jan.kiszka@web.de
Received: from mout.web.de (mout.web.de. [212.227.15.3])
        by gmr-mx.google.com with ESMTPS id x27si836775edd.3.2019.06.11.10.25.12
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 11 Jun 2019 10:25:12 -0700 (PDT)
Received-SPF: pass (google.com: domain of jan.kiszka@web.de designates 212.227.15.3 as permitted sender) client-ip=212.227.15.3;
X-UI-Sender-Class: c548c8c5-30a9-4db5-a2e7-cb6cb037b8f9
Received: from [192.168.43.205] ([109.41.67.205]) by smtp.web.de (mrweb004
 [213.165.67.108]) with ESMTPSA (Nemesis) id 0MJZLX-1hXjJc1TEx-0034aY; Tue, 11
 Jun 2019 19:25:11 +0200
Subject: Re: [PATCH v3 10/10] inmates: x86: Add SSE/AVX test inmate
To: Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>,
 jailhouse-dev@googlegroups.com
References: <20190610230330.21419-1-ralf.ramsauer@oth-regensburg.de>
 <20190610230330.21419-11-ralf.ramsauer@oth-regensburg.de>
From: Jan Kiszka <jan.kiszka@web.de>
Message-ID: <00ddbdcd-b488-80e6-fe47-4d5aa50f038d@web.de>
Date: Tue, 11 Jun 2019 19:25:08 +0200
User-Agent: Mozilla/5.0 (X11; U; Linux i686 (x86_64); de; rv:1.8.1.12)
 Gecko/20080226 SUSE/2.0.0.12-1.1 Thunderbird/2.0.0.12 Mnenhy/0.7.5.666
MIME-Version: 1.0
In-Reply-To: <20190610230330.21419-11-ralf.ramsauer@oth-regensburg.de>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Language: en-US
X-Provags-ID: V03:K1:ldByDnTVqYa18RizPtQ50JIWZnNPl4j+iQBy7b9yTGl9gga43t6
 al6yHwu7vk8v5L1/2KaYYN33TCHmZRh3Be2BpP6qpfU6g0PM2yTH+Te8itYjZTuwFnsDJpK
 1j92BqAS/elU0YWZwtBCMGr8fyWGWU2LewRmySn0E3kebOPl5wJBT3TCuTITpVKlRmYXK7W
 eFcsBccQQPNSFkJtrKhUA==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:4UuRJHxwPr8=:3/KMHDQkEbDgI32mtj9DeZ
 tYHqIpD8CYyDsHoscCKOzPlfwKWXvte82oU7C0Ngya/LA9RIzpW5AtTClQ3HUIR/oBgRDzfaU
 90HYfhpCJjd3fqtzFUNKza94yccUFuJNlGgptqq2x0lupu8E40k0JDG33U/TxgTQdJCxdn0P5
 /xESesGql5TDInfaM2diK61936jG72Bb6qq/Ndnl/nqtmxrGfZ+JiYnyA6cp9MHJq9fMVo5eQ
 423a2yLVvNYMoLmhteTumcAIRTGZ6tcWxXe6z8Q5RIxosNnWDiC3AL+DBMPIqOLqJ+F1Fz0do
 3NZ+ScCOSrJSk02KCluFhBinmo1SYGeunJbHyfist9ywC5Ht4cJ6l4aqD1ws2Jr/3gZmXZVJy
 s8jRMC+qAMTqXtS8NblyAQc06SRscBS0ApBF1JdBpDH2NUQ2pOJzx3kj6dOUDVikTN74wJ5hf
 v0Z0aKJnmnsHpbmnKP65UcNnDmhRR1CCQ1LA1YO2N1+mZvEfv8e6mj35bWkuafZ5Bn11xJPFU
 XQXa3fS5kr3E9ekAlPmZwqbks6M8HusLAbPwhUZC1Qwj2sMqm7PoRTjfXS2677pW5lduuV4fi
 eTsPVKIGaY1q08mppN/iWGtIpgJkfjNwpfGkL/al84x25mGM0NpsGCBzW1nzbieJbKaPcHjcI
 BlopH2Gm/E0W+wn+x4pM4ujU+sl1UskC5VdxYmPIqHnmeBNb0VuUKkmYfv0ueZrawQAKjiyOb
 CDMqVkICiKm1bm9dhtFBHQUPAQMaMw9BlW3daKxhrlqBNeoOIgZKEe+2jO/i36ZHikoa/v0sg
 VDiw7XTB47LOTa3GBiApytbsdIxMaEZD8s+D2Syq84wNvktvWSdkcgMai6oaPA557f/mE8SZk
 vHS0TvhXJiTr5XwuKgl46b1PP30XYmkkczpRkRUjVVlhbpc1NxnRpwK8vOLbjpY7VCcBpnh1N
 5/lFQf2go2Z83HNT+3g8cnJDlfEPzFdK3sTQkInq6sQ2TrHiOYsYq
X-Original-Sender: jan.kiszka@web.de
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass
 header.i=@web.de header.s=dbaedf251592 header.b=qIq17ae6;       spf=pass
 (google.com: domain of jan.kiszka@web.de designates 212.227.15.3 as permitted
 sender) smtp.mailfrom=jan.kiszka@web.de
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

On 11.06.19 01:03, Ralf Ramsauer wrote:
> Depending on availability, this inmates executes some SSE/AVX
> instructions, compares the result against an expected result and exits.
>
> Signed-off-by: Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>
> ---
>   inmates/tests/x86/Makefile      |  7 ++-
>   inmates/tests/x86/sse-demo-32.c |  1 +
>   inmates/tests/x86/sse-demo.c    | 92 +++++++++++++++++++++++++++++++++
>   3 files changed, 99 insertions(+), 1 deletion(-)
>   create mode 120000 inmates/tests/x86/sse-demo-32.c
>   create mode 100644 inmates/tests/x86/sse-demo.c
>
> diff --git a/inmates/tests/x86/Makefile b/inmates/tests/x86/Makefile
> index 1f30852f..030e20e6 100644
> --- a/inmates/tests/x86/Makefile
> +++ b/inmates/tests/x86/Makefile
> @@ -12,11 +12,16 @@
>
>   include $(INMATES_LIB)/Makefile.lib
>
> -INMATES := mmio-access.bin mmio-access-32.bin
> +INMATES := mmio-access.bin mmio-access-32.bin sse-demo.bin sse-demo-32.bin
>
>   mmio-access-y := mmio-access.o
>
>   $(eval $(call DECLARE_32_BIT,mmio-access-32))
>   mmio-access-32-y := mmio-access-32.o
>
> +sse-demo-y := sse-demo.o
> +
> +$(eval $(call DECLARE_32_BIT,sse-demo-32))
> +sse-demo-32-y := sse-demo-32.o
> +
>   $(eval $(call DECLARE_TARGETS,$(INMATES)))
> diff --git a/inmates/tests/x86/sse-demo-32.c b/inmates/tests/x86/sse-demo-32.c
> new file mode 120000
> index 00000000..1136c98f
> --- /dev/null
> +++ b/inmates/tests/x86/sse-demo-32.c
> @@ -0,0 +1 @@
> +sse-demo.c
> \ No newline at end of file
> diff --git a/inmates/tests/x86/sse-demo.c b/inmates/tests/x86/sse-demo.c
> new file mode 100644
> index 00000000..2d2ff379
> --- /dev/null
> +++ b/inmates/tests/x86/sse-demo.c
> @@ -0,0 +1,92 @@
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
> + */
> +
> +#include <inmate.h>
> +#include <test.h>
> +#include <asm/regs.h>
> +
> +typedef u64 xmm_t __attribute__((vector_size(16)));
> +
> +void inmate_main(void)
> +{
> +	printk("CPU supports\n"
> +	       "    FPU: %u   FXSR: %u XSAVE: %u\n"
> +	       "    SSE: %u   SSE2: %u  SSE3: %u\n"
> +	       " SSE4_1: %u SSE4_2: %u   AVX: %u\n"
> +	       " PCLMULQDQ: %u\n\n",
> +	       x86_cpu_features.fpu, x86_cpu_features.fxsr,
> +	       x86_cpu_features.xsave, x86_cpu_features.sse,
> +	       x86_cpu_features.sse2, x86_cpu_features.sse3,
> +	       x86_cpu_features.sse4_1, x86_cpu_features.sse4_2,
> +	       x86_cpu_features.avx, x86_cpu_features.pclmulqdq);
> +
> +	if (x86_cpu_features.fpu) {
> +		float result, addend;
> +
> +		addend = 123.45;
> +		result = 543.55;
> +
> +		printk("Testing SSE...\n");
> +		asm volatile("addps %1, %0\t\n"
> +			     : "+x"(result) : "x"(addend));
> +		/* Test raw result */
> +		EXPECT_EQUAL_U32(*(unsigned int*)&result, 0x4426c000);

"int *)"

But shouldn't we use u32 as type here, to be cleaner?

> +	}
> +
> +	{

Is there an "if" missing? If not, please format and indent in a normal way.

> +		double a, b, result;
> +
> +		a = 123.45;
> +		b = 543.55;
> +
> +		if (x86_cpu_features.sse2) {
> +			printk("Testing SSE2...\n");
> +			result = b;
> +			asm volatile("addsd %1, %0\t\n"
> +				     : "+x"(result) : "m"(a));
> +			EXPECT_EQUAL_U64((unsigned int)result, 667);

Why "unsigned int" when comparing u64 in the end?

> +		}
> +
> +		if (x86_cpu_features.avx) {
> +			result = 0;
> +			printk("Testing AVX...\n");
> +			asm volatile("vaddsd %2, %1, %0\t\n"
> +				     : "=x"(result) : "x"(a), "m"(b));
> +			EXPECT_EQUAL_U64((unsigned int)result, 667);

Same here.

> +		}
> +	}
> +
> +	if (x86_cpu_features.pclmulqdq) {
> +		xmm_t a = {0x00017004200ab0cd, 0xc000b802f6b31753};
> +		xmm_t b = {0xa0005c0252074a9a, 0x50002e0207b1643c};
> +
> +		printk("Testing PCLMULQDQ...\n");
> +		asm volatile("pclmulqdq %2, %1, %0\t\n"
> +			     : "+x"(a) : "x"(b), "i"(0));
> +
> +		EXPECT_EQUAL_U64(a[0], 0x5ff61cc8b1043fa2);
> +		EXPECT_EQUAL_U64(a[1], 0x00009602d147dc12);
> +	}
> +
> +	if (x86_cpu_features.pclmulqdq && x86_cpu_features.avx) {
> +		xmm_t a = {0x00017004200ab0cd, 0xc000b802f6b31753};
> +		xmm_t b = {0xa0005c0252074a9a, 0x50002e0207b1643c};
> +		xmm_t result;
> +
> +		printk("Testing AVX PCLMULQDQ...\n");
> +		asm volatile("vpclmulqdq %3, %2, %1, %0\t\n"
> +			     : "=x"(result) : "x"(a), "x"(b), "i"(0));
> +
> +		EXPECT_EQUAL_U64(result[0], 0x5ff61cc8b1043fa2);
> +		EXPECT_EQUAL_U64(result[1], 0x00009602d147dc12);
> +	}
> +}
>

Jan

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/00ddbdcd-b488-80e6-fe47-4d5aa50f038d%40web.de.
For more options, visit https://groups.google.com/d/optout.
