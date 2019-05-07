Return-Path: <jailhouse-dev+bncBD4JZQXE5UFRBZUFY3TAKGQE3YCLCDI@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-lf1-x13a.google.com (mail-lf1-x13a.google.com [IPv6:2a00:1450:4864:20::13a])
	by mail.lfdr.de (Postfix) with ESMTPS id 07F5716434
	for <lists+jailhouse-dev@lfdr.de>; Tue,  7 May 2019 15:06:47 +0200 (CEST)
Received: by mail-lf1-x13a.google.com with SMTP id d24sf2586162lfm.17
        for <lists+jailhouse-dev@lfdr.de>; Tue, 07 May 2019 06:06:47 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1557234406; cv=pass;
        d=google.com; s=arc-20160816;
        b=oPk8o2hhslnIL0L2j+j5djUk/ktXv72CDciXbBerw9yo81fvkjiiDaa3Xh2NhwARwl
         zFYQO6RQ8by0Nd5vOiWldNibWP9xwnMWvmTWNBdJ7pkMznHxHcLF02Qowq+ROrBEGuy2
         H/O/Ymk55+8kyP2xg8HDXEp4i0CoKSvT1+MzLbqwQ7CrujQt3VR9aQy58/rth0Z3xgoZ
         GngDwhlI8/xXCkSGQMnkRvPRQFeELRNFrPAh4N207X+vvW5NqKVxCUmMUN0KQ6UyG4v0
         kFt8dkrgHqP8ug/3L4/4zBTJKxokTPx75Mkhm6FuTGB/Xagr5067hrVW2Am5mgsUXfHh
         AEtA==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:content-language:in-reply-to
         :mime-version:user-agent:date:message-id:openpgp:from:references:to
         :subject:sender:dkim-signature;
        bh=dU1DRt/OqpbMfOSpSLchuKsc3f4Csq0CHc+ErJ49TlQ=;
        b=0qZ9Qr73fuLrt0F2kEn1UdUXCOQgNQEbMLwH9RWdCNVxMG+f32Fxvvjn9Bi0eEyVRA
         tkJFJHATiT0CuaP9+9vMYzVTCOKduht+sM2D/xpp88K1NepOkP3VE78x2XgBbWypkCXl
         rlgt0kArD1NUNBKpJWROEKD/iVunjYPGZ+Xv0jV7KHAl1BKWMJolUluPqGC4eUd+LpKr
         TaPWLZcYrfz36/MS7sS1bEWpJ2mvoNMR6Qc1BYDssTFI99IZXEi7m3mlOws8SfbwQ3eP
         M6zSiFWe1FbNTqAJbL/Mna73QpIddaqoyJwfdh7CP4PMl0vASqZ3PP7n0Q2askcebgIs
         s7Yg==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass header.i=@oth-regensburg.de header.s=mta01-20160622 header.b=OV6lyTuG;
       spf=pass (google.com: domain of ralf.ramsauer@oth-regensburg.de designates 194.95.104.12 as permitted sender) smtp.mailfrom=ralf.ramsauer@oth-regensburg.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=oth-regensburg.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:subject:to:references:from:openpgp:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=dU1DRt/OqpbMfOSpSLchuKsc3f4Csq0CHc+ErJ49TlQ=;
        b=g5IbIj19v6y+H7z0pQYB3iksL3tBn0mZ8DV/9Z7RI9LkNIo/AmdWSacWOsoNkQxoNW
         ij0VQ4FhGokhDu7kGlzyY8F6pjR55wqKX6xOfWrxKSeZCSxu7VWZJZZA+Zu1yJZe4/+E
         DbQ37uiYbOsHIKUPDUZ+xbVn5AFz62rcHlc06B4rcctHSB+UNL+Jwxc+TxFVrTvIgWZX
         JXNGwNPljM8Rzrc1o+Xr35ROwE2YXx2O15A3pgisOpQS0hTbnzc6pchlNoqoSZboJ39p
         IaRSsz61Y/2fcrgkzXFt3HZwNzP3CfevR118n1lDuMJCpJzKwKrXe1D+iPiiKCqBV8jA
         wJaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:subject:to:references:from:openpgp
         :message-id:date:user-agent:mime-version:in-reply-to
         :content-language:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :x-spam-checked-in-group:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=dU1DRt/OqpbMfOSpSLchuKsc3f4Csq0CHc+ErJ49TlQ=;
        b=loqZi7tD0N4qBJQzrytF8Ua7L0etm+5S/uf04VflwiLScPyQKhFHOO+ypi9luQfTIF
         WnEeuaehXFuke1L2M+oA4pEC4D51VY1khLCnqo8s8noIYHAo09mzHDxB1VvjDtS6K+Zq
         bfc2vExRCp2TkcCYWxulEAXU8DglAv/iGmyr0U/+d8aH9b6zYVbgm6jaiFswU1MSbhO3
         wqqTLObxPG8Btc3DmTx4a5XwuMaEiQ/kXiPxJeULtk5PYnMLTSqpD3Rgl9ePge1QMaSN
         Hp/4h2Tl3/oeFugEFV2WJXurr2sSCSGMxiWb4Yf8u0pl1duoQN2VQ3iFaLokL98mJeJf
         WPAQ==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: APjAAAWXIJ91rgrY2Pz/eOU1UcOGp2lsDlbWADJE99ulxLpHZqQSpsdM
	RRgv1l9YdoVyQep/Dz1yxxc=
X-Google-Smtp-Source: APXvYqwZU8iaFkBZ1OlB355IpUR/zKrG3Euziu3va1NqOrcaYnSjaA9VNk5wgYf1GfJtZ2TMqku8OA==
X-Received: by 2002:a2e:2b81:: with SMTP id r1mr2701872ljr.138.1557234406509;
        Tue, 07 May 2019 06:06:46 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a2e:974e:: with SMTP id f14ls1689616ljj.15.gmail; Tue, 07
 May 2019 06:06:46 -0700 (PDT)
X-Received: by 2002:a2e:498:: with SMTP id a24mr17282093ljf.34.1557234405763;
        Tue, 07 May 2019 06:06:45 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1557234405; cv=none;
        d=google.com; s=arc-20160816;
        b=IgTeadNqyYsPszHe1Wzf2knsjwobmXItOEJwsZ2rwGOJNzb2jnV8N1IaH/QmpdOf6e
         r3kxQmgb8nXkngtGbg9vAn/FRuPkBr97spn7mfHxMvRZ47GzazwU/RCSwa9C+ZycNOQI
         EVJVauZiAzIpk6/mvVF6te5XiSpoS7xN1Dc5lF0f5POYldmtx81kvVltlDLIStO+aZ7A
         eDgRUGOotrQMdx9gebCILA1IEVmV1dS2jsPunSWHiJMfLZCogPp/yPUxMbsB+3Hv2Qq4
         08fpzTLoE8c71rrq/jZftxnWGWDRPYkQh1EEcbpDrUoAcKq3F+GfJlW1+sdKuDFzdg87
         J5aA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:openpgp:from:references:to:subject
         :dkim-signature;
        bh=orw14ADd+uvbAHz+CifCXubR9/+f9tReTD/3TUc4kF0=;
        b=ksgX37opjelGFdb64+D6UXAHntfL6HcrjU8aenIGMjLMSwUbF+TEB9rNvsH6vwJ7Um
         tiPFysjEQbE+gX6j/aoDIcUgFZIKL+2eSbGU8Ds/gwC3KFt+WBPPK5N0hzdxzmvRmHpw
         YBqIrPlO+46HffHVSKMMiy9gCvW0Eyxi62xBnQzAuPNzGCl4RO2rwndiX0ZdAjzKUdys
         HminUSK+DAcaS0syDigfddZhnxEszUMSmMHcTZC8AOpqRWgdxWc1d7xlu0oM6DKSD4M2
         t4kDsqLkmKrIce/EPQSu+HzGrQKFzZbg9haK3j6ujUFReC8+k9BttGBWmc8yEt3g3Znr
         y34A==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       dkim=pass header.i=@oth-regensburg.de header.s=mta01-20160622 header.b=OV6lyTuG;
       spf=pass (google.com: domain of ralf.ramsauer@oth-regensburg.de designates 194.95.104.12 as permitted sender) smtp.mailfrom=ralf.ramsauer@oth-regensburg.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=oth-regensburg.de
Received: from mta02.hs-regensburg.de (mta02.hs-regensburg.de. [194.95.104.12])
        by gmr-mx.google.com with ESMTPS id x14si599643ljh.1.2019.05.07.06.06.45
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 07 May 2019 06:06:45 -0700 (PDT)
Received-SPF: pass (google.com: domain of ralf.ramsauer@oth-regensburg.de designates 194.95.104.12 as permitted sender) client-ip=194.95.104.12;
Received: from E16S02.hs-regensburg.de (e16s02.hs-regensburg.de [IPv6:2001:638:a01:8013::92])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(Client CN "E16S02", Issuer "E16S02" (not verified))
	by mta02.hs-regensburg.de (Postfix) with ESMTPS id 44z0HS5pwdzyJ9
	for <jailhouse-dev@googlegroups.com>; Tue,  7 May 2019 15:06:44 +0200 (CEST)
Received: from [IPv6:2001:638:a01:8061:aefd:ceff:fef3:ba65]
 (2001:638:a01:8013::138) by E16S02.hs-regensburg.de (2001:638:a01:8013::92)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1713.5; Tue, 7 May 2019
 15:06:44 +0200
Subject: Re: [PATCH] inmates: x86: AMD: use the correct vmmcall instruction
To: Jailhouse <jailhouse-dev@googlegroups.com>
References: <20190507125229.29432-1-ralf.ramsauer@oth-regensburg.de>
From: Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>
Openpgp: preference=signencrypt
Message-ID: <356bd7bb-6784-820a-fe77-f7ef1584d6fa@oth-regensburg.de>
Date: Tue, 7 May 2019 15:06:44 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <20190507125229.29432-1-ralf.ramsauer@oth-regensburg.de>
Content-Type: text/plain; charset="UTF-8"
Content-Language: de-DE
X-Originating-IP: [2001:638:a01:8013::138]
X-ClientProxiedBy: E16S01.hs-regensburg.de (2001:638:a01:8013::91) To
 E16S02.hs-regensburg.de (2001:638:a01:8013::92)
X-Original-Sender: ralf.ramsauer@oth-regensburg.de
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass
 header.i=@oth-regensburg.de header.s=mta01-20160622 header.b=OV6lyTuG;
       spf=pass (google.com: domain of ralf.ramsauer@oth-regensburg.de
 designates 194.95.104.12 as permitted sender) smtp.mailfrom=ralf.ramsauer@oth-regensburg.de;
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



On 5/7/19 2:52 PM, Ralf Ramsauer wrote:
> I silently broke AMD inmates a while ago.
> 
> In 4d6eb915ca78, I removed the call of hypercall_init() without
> reintroducing it at the right location again. No one noticed so far, as
> the bug (crash of the cell due to a wrong instruction) only happens on
> AMD machines only if they use the virtual debugging console.
> 
> Instead of calling hypercall_init() somewhere inside printk, let's move
> it to setup.c, as we now have a arch_init_early() routine, which is the
> right place for these kind of initialisations.
> 
> Also remove X86_FEATURE_VMX, it was never used.
> 
> Fixes: 4d6eb915ca78e ("inmates: x86: Use virtual console as additional console")
> Signed-off-by: Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>
> ---
>  inmates/lib/x86/Makefile    |  2 +-
>  inmates/lib/x86/hypercall.c | 61 -------------------------------------
>  inmates/lib/x86/setup.c     | 20 +++++++++++-
>  3 files changed, 20 insertions(+), 63 deletions(-)
>  delete mode 100644 inmates/lib/x86/hypercall.c
> 
> diff --git a/inmates/lib/x86/Makefile b/inmates/lib/x86/Makefile
> index 15db65f8..97a37341 100644
> --- a/inmates/lib/x86/Makefile
> +++ b/inmates/lib/x86/Makefile
> @@ -40,7 +40,7 @@ include $(INMATES_LIB)/Makefile.lib
>  
>  always := lib.a lib32.a
>  
> -TARGETS := header.o hypercall.o ioapic.o printk.o setup.o smp.o uart.o
> +TARGETS := header.o ioapic.o printk.o setup.o smp.o uart.o
>  TARGETS += ../alloc.o ../pci.o ../string.o ../cmdline.o ../setup.o
>  TARGETS += ../uart-8250.o ../printk.o
>  TARGETS_64_ONLY := int.o mem.o pci.o timing.o
> diff --git a/inmates/lib/x86/hypercall.c b/inmates/lib/x86/hypercall.c
> deleted file mode 100644
> index fc5cd5ac..00000000
> --- a/inmates/lib/x86/hypercall.c
> +++ /dev/null
> @@ -1,61 +0,0 @@
> -/*
> - * Jailhouse, a Linux-based partitioning hypervisor
> - *
> - * Copyright (c) Valentine Sinitsyn, 2014
> - *
> - * Authors:
> - *  Valentine Sinitsyn <valentine.sinitsyn@gmail.com>
> - *
> - * This work is licensed under the terms of the GNU GPL, version 2.  See
> - * the COPYING file in the top-level directory.
> - *
> - * Alternatively, you can use or redistribute this file under the following
> - * BSD license:
> - *
> - * Redistribution and use in source and binary forms, with or without
> - * modification, are permitted provided that the following conditions
> - * are met:
> - *
> - * 1. Redistributions of source code must retain the above copyright
> - *    notice, this list of conditions and the following disclaimer.
> - *
> - * 2. Redistributions in binary form must reproduce the above copyright
> - *    notice, this list of conditions and the following disclaimer in the
> - *    documentation and/or other materials provided with the distribution.
> - *
> - * THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS"
> - * AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE
> - * IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE
> - * ARE DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT HOLDER OR CONTRIBUTORS BE
> - * LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR
> - * CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF
> - * SUBSTITUTE GOODS OR SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESS
> - * INTERRUPTION) HOWEVER CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN
> - * CONTRACT, STRICT LIABILITY, OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE)
> - * ARISING IN ANY WAY OUT OF THE USE OF THIS SOFTWARE, EVEN IF ADVISED OF
> - * THE POSSIBILITY OF SUCH DAMAGE.
> - */
> -
> -#include <inmate.h>
> -
> -#define X86_FEATURE_VMX		(1 << 5)
> -
> -bool jailhouse_use_vmcall = true;
> -
> -#define AUTHENTIC_AMD(n)	(((const u32 *)"AuthenticAMD")[n])
> -
> -void hypercall_init(void)
> -{
> -	u32 eax, ebx, ecx, edx;
> -
> -	asm volatile("cpuid"
> -		: "=a" (eax), "=b" (ebx), "=c" (ecx), "=d" (edx)
> -		: "a" (0)
> -		: "memory"
> -	);
> -
> -	if (ebx == AUTHENTIC_AMD(0) &&
> -	    edx == AUTHENTIC_AMD(1) &&
> -	    ecx == AUTHENTIC_AMD(2))
> -		jailhouse_use_vmcall = false;
> -}
> diff --git a/inmates/lib/x86/setup.c b/inmates/lib/x86/setup.c
> index f79fd736..869e0962 100644
> --- a/inmates/lib/x86/setup.c
> +++ b/inmates/lib/x86/setup.c
> @@ -1,10 +1,12 @@
>  /*
>   * Jailhouse, a Linux-based partitioning hypervisor
>   *
> - * Copyright (c) OTH Regensburg, 2018
> + * Copyright (c) OTH Regensburg, 2018-2019
> + * Copyright (c) Valentine Sinitsyn, 2014
>   *
>   * Authors:
>   *  Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>
> + *  Valentine Sinitsyn <valentine.sinitsyn@gmail.com>
>   *
>   * This work is licensed under the terms of the GNU GPL, version 2.  See
>   * the COPYING file in the top-level directory.
> @@ -38,6 +40,22 @@
>  
>  #include <inmate.h>
>  
> +#define AUTHENTIC_AMD(n)	(((const u32 *)"AuthenticAMD")[n])
> +
> +bool jailhouse_use_vmcall = true;
> +
>  void arch_init_early(void)
>  {
> +	u32 eax, ebx, ecx, edx;
> +
> +	asm volatile("cpuid"
> +		: "=a" (eax), "=b" (ebx), "=c" (ecx), "=d" (edx)
> +		: "a" (0)
> +		: "memory"
> +	);
> +
> +	if (ebx == AUTHENTIC_AMD(0) &&
> +	    edx == AUTHENTIC_AMD(1) &&
> +	    ecx == AUTHENTIC_AMD(2))
> +		jailhouse_use_vmcall = false;
>  }

Forgot to remove hypercall_init from inmate.h. I can send a v2, if needed.

diff --git a/inmates/lib/x86/include/inmate.h
b/inmates/lib/x86/include/inmate.h

index 5fe4e102..b6bc6145 100644


--- a/inmates/lib/x86/include/inmate.h


+++ b/inmates/lib/x86/include/inmate.h


@@ -235,8 +235,6 @@ void ioapic_pin_set_vector(unsigned int pin,


                           enum ioapic_trigger_mode trigger_mode,
                           unsigned int vector);

-void hypercall_init(void);


-


 unsigned long pm_timer_read(void);

 unsigned long tsc_read_ns(void);

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/356bd7bb-6784-820a-fe77-f7ef1584d6fa%40oth-regensburg.de.
For more options, visit https://groups.google.com/d/optout.
