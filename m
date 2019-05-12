Return-Path: <jailhouse-dev+bncBDDNLV6S7AOBBH6U37TAKGQEHEXSZ5Y@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-ed1-x53c.google.com (mail-ed1-x53c.google.com [IPv6:2a00:1450:4864:20::53c])
	by mail.lfdr.de (Postfix) with ESMTPS id E79111AB7D
	for <lists+jailhouse-dev@lfdr.de>; Sun, 12 May 2019 11:40:47 +0200 (CEST)
Received: by mail-ed1-x53c.google.com with SMTP id t58sf12407347edb.22
        for <lists+jailhouse-dev@lfdr.de>; Sun, 12 May 2019 02:40:47 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1557654047; cv=pass;
        d=google.com; s=arc-20160816;
        b=uWvxeYyzeQI5NfjQei7FVJfzS7AMN1KQRK+6FxVfh2o7vVN6U5b6hd9/vN+t+0Caex
         V/1d2FTFXhWW5ww+huc3aUyFwuKSH+NEJCpoYFcuS7RKvjnLEMm8e1+ePr4jLNIxfu9M
         iXw5NEEcoeTPQtDz5jYWQnbLehhEA6Fu4QzzH7d2J6SvKFRtqXqcnB1/8Br8RG9UuLlA
         6Nc0YGTCkEEkoyu7Xi+8TWGiy9DL29aZI4Sejm6+U2920TbIjhNzIBdOdswzTlwqQBIz
         Yj6htkCLhKKFO29b/JpFlGMJZ58Ubi8RNYmywgtEPRg7ZicHHgV2kMQp5whJlqoFVtCf
         834Q==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:content-language:in-reply-to
         :mime-version:user-agent:date:message-id:from:references:to:subject
         :sender:dkim-signature;
        bh=DSqF5AWYu8thUM9DkvmCBsUG1fq8qSnfRWLSlZE5ZXc=;
        b=rvQWmiFdZb2sIicU8B0iPbKJJPIE833JoM61E3c64JTCPg6nV9ag0dHr0HoiH+ZiwY
         QHnw43iZA5yrzSuQSs1uGIn27VyvpTbn+yP5EHnERSBJaIIxCDf9Ngv+iXFk1DJvtLlD
         yAd9TV53FOfLAZolTdrnzHhGSpo5wdPKz5uo44siD3TCAeKWc3iqtx8vd2ksGosS1dTv
         fPl6ExlavtNkwnX5N604qC0s097QZTukZ2pjGICs/rna+F6vIwexLfZAg7HiHVKCdVoE
         plZH1MCEPOBmk9Q6TOqitkoVV6RRiRW0WTvFDkYoT4oGROJH1mUwpM9NGCOIdfEGcoGO
         OosQ==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass header.i=@web.de header.s=dbaedf251592 header.b=a2IoI+q5;
       spf=pass (google.com: domain of jan.kiszka@web.de designates 212.227.15.14 as permitted sender) smtp.mailfrom=jan.kiszka@web.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:subject:to:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :list-post:list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=DSqF5AWYu8thUM9DkvmCBsUG1fq8qSnfRWLSlZE5ZXc=;
        b=aLIZC/bEyCfEtSCZ59xAa3GB6bCCcyKvrRxg+syh0nIxMK0B0PchwwhSBDnMGiy+EE
         inmCFkYTEYhCe7quAzHemVpuEfzNndeqUD1q9fqejkQAcY7N/Ic90ArAPEy1Mjs1w0Y9
         8XBj7QVLgYM2LBMnCbc3lfH7teQSmbmAXUkW51EcZD0NKXc1ZDxRgWzUeyLhGOqTcMZE
         TBXIVSeJCZWwl6O8LTje0kv2vfrMORaWGGuOSRWuhLyWyCXzUdJkAxJindUWHj+T5uDE
         HMQ/dA/1DdhqehpYGbgWNWa2VeIM9q9VvpKKHRvuJyc7Fs1NvhBPzJibls5qhO/IrDIV
         et8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:subject:to:references:from:message-id
         :date:user-agent:mime-version:in-reply-to:content-language
         :x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:x-spam-checked-in-group:list-post:list-help
         :list-archive:list-subscribe:list-unsubscribe;
        bh=DSqF5AWYu8thUM9DkvmCBsUG1fq8qSnfRWLSlZE5ZXc=;
        b=GFCoJCSZN6moqRxV/qqd6ARSujtwt9o5AE4/xyfDXyceJlno9CVM1Jt/BzG3+g2as7
         TkjwJ9JuRi5v4ig0+TfWuegB8JWUBfP5fTfL2jICvUs8aEL0SF2Q4PjawVUe5zPplqPf
         jOqlBPckkaZqMio/NHb6bbYcyK0KenwrEgfKgt4NXtCIYuLvffYAKV77/kF79A99VNWB
         uKy1gWIS9yLSOewNdiXE++1DKmAGMjSroHa/fGJTvd3HBvuKhs3u3uQGYbZgeeg3SYvK
         mFc6uQvBXWPV1nc7f5sjz/5VX71fS4rstnoRBfklXpSeTUIVJdgYGvUi634FocMN0vd6
         WZxw==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: APjAAAUWGDZXf7hnhdOZKRRl+BT0ffb4Q+R+SOikw/cq+/qYt4QCNXLj
	8aM19WnqZfLa7IPQk1pXxPE=
X-Google-Smtp-Source: APXvYqwRWAfS108zht2oCDbHbgbbwYswa3TwM2gwl33s1kRNPytSx6ENKwdhpVcu/miIcQjFcBkhZw==
X-Received: by 2002:a50:b797:: with SMTP id h23mr14050144ede.197.1557654047648;
        Sun, 12 May 2019 02:40:47 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a50:92d5:: with SMTP id l21ls1042279eda.6.gmail; Sun, 12 May
 2019 02:40:47 -0700 (PDT)
X-Received: by 2002:a50:b7f8:: with SMTP id i53mr22109154ede.196.1557654047172;
        Sun, 12 May 2019 02:40:47 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1557654047; cv=none;
        d=google.com; s=arc-20160816;
        b=M39KiTOc52NIs5ksZM5+9Yxxn33KZj7pkVcLsqp4KAyDj6VEfuQwJ0e4UQhoZuzN30
         F6hlQ86SbNSfyuDvvp3O6QyQCFSU5XleqOTiBe5eZmhwQ5QKHqx9agpM20GsK9xhzm5J
         2w2uDWAfs8+brd997y/vRMQMycN/kDCGPL/fL5OYW1CCOav0lpArn8tbCxu762vt3tmc
         pthUkteriNduh+Kvx+PIVPRXqnhbH+gFSi3oDAkxFaQhYw4R9yZAScUwq8zANrlGaDrb
         wptDecb5FH3PamIyVosTGoG3MFB1vjOeO+qgvUwVXYdwdaBFEKO4hQ8ON9iArRpLByc6
         GQAQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:to:subject
         :dkim-signature;
        bh=3EHAGmX5dZKyehjyE96ai/0cp7EWgBvq8EypvB0ktkU=;
        b=yEObUTYPIRuO5vE0ahZ8y1N0ZmqocsfEOlED10DcYCpLR/oY5FscxD5262WSNJBqZc
         baiWiw2CKkY9N3cJX/xeQYR27j+1ZMkm8/Yqsb+nY5as+ry0xPhel/FFCgh/oeiM1R70
         dgd8dbK+Oq16HlODyUsg9QvivmsoJCvc0bTjwNy+m34pnOjehYyU1Z3rsbKKzuujZeoP
         XYvCTI+nBxPGY93fCMK9ZwywRrntw7plUiKdi5TVxPz1ScClTIZuT1Qlgvji4j1A2P1V
         2ntrf2CLVJkimnYNKMnGtSodQ18uV3ZuHtjlHzKQM0i2YHY/D7uN1WwD/t0Psxjkg1vD
         61HA==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       dkim=pass header.i=@web.de header.s=dbaedf251592 header.b=a2IoI+q5;
       spf=pass (google.com: domain of jan.kiszka@web.de designates 212.227.15.14 as permitted sender) smtp.mailfrom=jan.kiszka@web.de
Received: from mout.web.de (mout.web.de. [212.227.15.14])
        by gmr-mx.google.com with ESMTPS id w5si2863440edw.1.2019.05.12.02.40.47
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Sun, 12 May 2019 02:40:47 -0700 (PDT)
Received-SPF: pass (google.com: domain of jan.kiszka@web.de designates 212.227.15.14 as permitted sender) client-ip=212.227.15.14;
X-UI-Sender-Class: c548c8c5-30a9-4db5-a2e7-cb6cb037b8f9
Received: from [192.168.1.10] ([95.157.54.22]) by smtp.web.de (mrweb002
 [213.165.67.108]) with ESMTPSA (Nemesis) id 0MNc5a-1hN0sO20HC-0079Q9; Sun, 12
 May 2019 11:40:46 +0200
Subject: Re: [RFC PATCH 1/4] inmates: x86: consolidate register definitions
To: Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>,
 Jailhouse <jailhouse-dev@googlegroups.com>
References: <20190509210726.23168-1-ralf.ramsauer@oth-regensburg.de>
 <20190509210726.23168-2-ralf.ramsauer@oth-regensburg.de>
From: Jan Kiszka <jan.kiszka@web.de>
Message-ID: <fc25f4d3-c85b-350c-50a0-f09dcee5828e@web.de>
Date: Sun, 12 May 2019 11:40:45 +0200
User-Agent: Mozilla/5.0 (X11; U; Linux i686 (x86_64); de; rv:1.8.1.12)
 Gecko/20080226 SUSE/2.0.0.12-1.1 Thunderbird/2.0.0.12 Mnenhy/0.7.5.666
MIME-Version: 1.0
In-Reply-To: <20190509210726.23168-2-ralf.ramsauer@oth-regensburg.de>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Language: en-US
X-Provags-ID: V03:K1:Czm61pg33BH0X3gPs7dE+8b74Q36aTnnoJYzVMSCx0beJ7DY4Jg
 E6tt9XqJs/Q7odzt65Zyms7LPie20nCOEuAbdN80/F/Tp9NUYGIFN8sfwjskZKLMzbTQMUG
 X1WLcqvd9A7IJnxuN7Td+yOVBbmHFEZcZaU47Nc5YFwRd+cr+46Yes50z69AAO6cq3Aed+l
 k2uML6Lii8+22eg81GY4w==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:0fvsur7+biE=:K8nYSQxd9r54W6rzCdqBWT
 4r8olI/wr6t0bmLyNFYhaGw+bHiWbHUbI0MQpBoBzY7Y43xyiOA5UJNX163SRkcWhOgb5doFf
 TWh8TH3o8CuqHbD/1Mho/r/fkFDVms2u6ZPu338gE0+ZDqlQTu6EpWXIeShdkWTMZoaX0S6ZP
 SLqFvaZUmU+v8qXmkjoxUFj+un5MH9MAddYnpgF8/sqObpWrkFAXb3kmR8vr0SXoCj4e1mXIV
 2SGHBXr0rfGzqfDg8mh9SV3x4tSC8Y3W+7rWFaPJ9x5MpZNXuEM2a57ZECooz9AFWaJ5ztqvK
 /bbK6Y7Opi5UckcGycyJXPI4odJDKQIXUWyw7prcm9TIeiLvJuSy9Pssu4lo50VyLLbS/Fmie
 2hg3icfrAPxgBUYz/03wOFSP3NUsqBX6CuIUAjU4AGK2Xlnbx0YXCgqjmA8yLo960bAYyjRnh
 RlTJu/789Z9EC2/YUypbh3enm9O0zagg7uZSq0qXKeUyis+jbRp2IM1bxdQJj3JQWQUc2Dp9m
 k5c8e/nxWF4852WooAYN3tzGbwpmQHdqCxQMaP8PwdLj+UsRw2uvIq4nviI4SG/0P3KlL7LhK
 3lj0p55qhTHNtbRRlZCh3FruGfHGpYLimXmImlLb14kwvdqVK8NKtAVyjAwIUGu+dqoNdbonJ
 wC2D91XvkZPRJcVeFT+eHe3+n+cy+cQSmz/DMAmwMVEVU1C671JhbT+XZqOYe1oypLjahmrsT
 YhaVtx+CZlvaLuRL/1DcXsmLR6Xy/up+o96f9pIDsiZyJINv8LtT2lQKsoW8/1L9UvuZPEOXl
 VJvEENtGYiulhpd+eENzhORAF5TBtWWV/PdpTXWigLBl82js35Yy3ZHXChzUD6yZ+mRkPlpcq
 /jhazYnt8ZxdHsu/liafsluxUfS9La2ZrSJimZkfdk8CRPgzP0/kU96d5a8S4hYrqBWoUAtar
 2yF2HVoXl5w==
X-Original-Sender: jan.kiszka@web.de
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass
 header.i=@web.de header.s=dbaedf251592 header.b=a2IoI+q5;       spf=pass
 (google.com: domain of jan.kiszka@web.de designates 212.227.15.14 as
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

On 09.05.19 23:07, Ralf Ramsauer wrote:
> More duplicate register definitions are upcoming, consolidate them
> first.
>
> No functional change.
>
> Signed-off-by: Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>
> ---
>   inmates/lib/x86/header-32.S        | 10 +-----
>   inmates/lib/x86/header.S           | 13 +-------
>   inmates/lib/x86/include/asm/regs.h | 50 ++++++++++++++++++++++++++++++
>   3 files changed, 52 insertions(+), 21 deletions(-)
>   create mode 100644 inmates/lib/x86/include/asm/regs.h
>
> diff --git a/inmates/lib/x86/header-32.S b/inmates/lib/x86/header-32.S
> index 6ea8da38..006cce9a 100644
> --- a/inmates/lib/x86/header-32.S
> +++ b/inmates/lib/x86/header-32.S
> @@ -37,15 +37,7 @@
>    */
>
>   #include <inmate.h>
> -
> -#define X86_CR0_PE		0x00000001
> -#define X86_CR0_WP		0x00010000
> -#define X86_CR0_PG		0x80000000
> -
> -#define X86_CR4_PSE		0x00000010
> -
> -#define MSR_MTRR_DEF_TYPE	0x000002ff
> -#define MTRR_ENABLE		0x00000800
> +#include <asm/regs.h>
>
>   	.code16
>   	.section ".boot", "ax"
> diff --git a/inmates/lib/x86/header.S b/inmates/lib/x86/header.S
> index 1df4345b..cb886b8e 100644
> --- a/inmates/lib/x86/header.S
> +++ b/inmates/lib/x86/header.S
> @@ -37,18 +37,7 @@
>    */
>
>   #include <inmate.h>
> -
> -#define X86_CR0_PE		0x00000001
> -#define X86_CR0_WP		0x00010000
> -#define X86_CR0_PG		0x80000000
> -
> -#define X86_CR4_PAE		0x00000020
> -
> -#define MSR_EFER		0xc0000080
> -#define EFER_LME		0x00000100
> -
> -#define MSR_MTRR_DEF_TYPE	0x000002ff
> -#define MTRR_ENABLE		0x00000800
> +#include <asm/regs.h>
>
>   	.code16
>   	.section ".boot", "ax"
> diff --git a/inmates/lib/x86/include/asm/regs.h b/inmates/lib/x86/include/asm/regs.h
> new file mode 100644
> index 00000000..a004fdd2
> --- /dev/null
> +++ b/inmates/lib/x86/include/asm/regs.h
> @@ -0,0 +1,50 @@
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
> +#define X86_CR0_PE		0x00000001
> +#define X86_CR0_WP		0x00010000
> +#define X86_CR0_PG		0x80000000
> +
> +#define X86_CR4_PAE		0x00000020
> +#define X86_CR4_PSE		0x00000010
> +
> +#define MSR_EFER		0xc0000080
> +#define EFER_LME		0x00000100
> +
> +#define MSR_MTRR_DEF_TYPE	0x000002ff
> +#define MTRR_ENABLE		0x00000800
>

Taken this one to next already.

Thanks,
Jan

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/fc25f4d3-c85b-350c-50a0-f09dcee5828e%40web.de.
For more options, visit https://groups.google.com/d/optout.
