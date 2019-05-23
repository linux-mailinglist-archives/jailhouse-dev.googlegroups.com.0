Return-Path: <jailhouse-dev+bncBCJI7SMNV4NBB3FFTLTQKGQE2NIMLCQ@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-lj1-x239.google.com (mail-lj1-x239.google.com [IPv6:2a00:1450:4864:20::239])
	by mail.lfdr.de (Postfix) with ESMTPS id 89AB927CE7
	for <lists+jailhouse-dev@lfdr.de>; Thu, 23 May 2019 14:32:45 +0200 (CEST)
Received: by mail-lj1-x239.google.com with SMTP id 7sf1228385ljr.23
        for <lists+jailhouse-dev@lfdr.de>; Thu, 23 May 2019 05:32:45 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1558614765; cv=pass;
        d=google.com; s=arc-20160816;
        b=EylpvO3pC2/A2IZPNciv0JBLDtH8EjVwX7JcJo8ImLIHzPdMzzlPW7lK97qkfMqD7s
         Iv9xii8vH1V/KfebQM6x7c+/JFgTZ/txWirk396KaZN682OK5NpfbmPJlONKJz1IgrxU
         uQ6rvz5gB2B+hnXILUBdWyDnvFS9qSlUoqdGo5pG7TfblL7TcJDHo7SszKKmqboLsePk
         HZlDFOSSdRf7VBW9wXy4xq60n0KJ0YKtmeA/tMLM7GMYqQrWpv7S1pvt+9OGlOieSKW9
         MHhQngGgkSYLoPYKgaLQp+lYdypSYZIwa2hvhpfUUE+/RlgvQNgsYl2LxO0VsxZliCav
         JqWA==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:content-language:in-reply-to
         :mime-version:user-agent:date:message-id:from:references:to:subject
         :sender:dkim-signature;
        bh=396QkHYPw25MOShZ13kkUIsJm6YUyDQOE3tHoLuGW0s=;
        b=wdmksK8NZxhrSQ/601skHV1GJJ5BC+o0FI92OXaRQbItaUQlgJU3EPb2qdDI086w1q
         u8L9n+WQ2wKPzuDHTi7/oieS/R9TLOvn2Lj/NiRP2nnptV46VL6PQds6jhsNoWtHmWNH
         h3Qxv3PBWb7UiwzRxgEmKDcek6KXdryuVUTvlumdWQY626b/mHeH5An3o+btj6xTy2Vy
         77z8DiPRL7zr13oRKEBmDlFr5nRWTdvLba0iYiILeKGlmKQW78sMAznGY5fTYRfPKFSA
         GVZ0zH4qeJnwnMn5G35Q2GzgrJWY5ZKORN3+nrppYgGkLuNZ+IZyzvdc46WOSZjSRKVB
         TFXg==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.14 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:subject:to:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :list-post:list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=396QkHYPw25MOShZ13kkUIsJm6YUyDQOE3tHoLuGW0s=;
        b=TsQpHcEDDpnExHaCfC40il/hXINns306TX5eFg7XKYM3EODbtxQTrRDbVNBYpDPKbQ
         O1A5D3mHOf80TF3205V7EwuPoxryFgdbIOiCwvuKGO8zeRPhoO4nydKL4myoYY1PT4aQ
         uSNxiVf7r7E0vLmllMOgd5eGAlHymsFEweS8mvg+ar6HBvLkvJ1M3MCpLggrC+1xItOV
         povdbHdYxP0xFBiLf43+mKpwRtxLvTajPyHvoZ1I+IRZDA6UjhW2P7t4xt9AH2/3a0br
         Tf+4Ej/lVGwomeqPGBkkejfwHjYzCC9qTYYjJs1f+VJrzF/RDFnqnmxDXYKQGTuYQzmE
         nN8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:subject:to:references:from:message-id
         :date:user-agent:mime-version:in-reply-to:content-language
         :x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:x-spam-checked-in-group:list-post:list-help
         :list-archive:list-subscribe:list-unsubscribe;
        bh=396QkHYPw25MOShZ13kkUIsJm6YUyDQOE3tHoLuGW0s=;
        b=ljSZDQ6SoCp76ubsB35ubGKoquNW8KRwfgtIdKY6TxFM+AxubHXNKYekX86DIFN9Ia
         3g5+jyZT91CyxKoRFUOeZ8Wahp9g6NdtDE6HzQu8Sc7odus8HbGxGL6DIClNNSvHJZ6F
         rBu8uP/Qood0uO0d1Ca2DXpynghjMpmGjD9Enzs+XdlII4GC82+jLUbVZ6GDyXl7jlxx
         7V+DcH34EEQKQP0fA52uOtkiArl1fbaXNzILqsVtC7wXYCBNtzjQbwCCJPSB0gbLnkEV
         zXxReKWxWjJkpUhCBFtsxqjwrnXaa+JuY18pJKrBJzxNLB8ShUYW4NkiQPLn8PkIzy6k
         xBfQ==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: APjAAAW5/jO3IZYBzPynsJ5r2MnqKdlRKQtishB9/xybDzP8k+/h/LYk
	s9PunTksADeZvuvfi52uynY=
X-Google-Smtp-Source: APXvYqy+jOoC1SPca9MtOZnBcENUbStukFCSBEEmlMXW3Nagmzn5lDBv61tssAi+0ZJ5dDqUeMpO3w==
X-Received: by 2002:a19:521a:: with SMTP id m26mr337246lfb.134.1558614765020;
        Thu, 23 May 2019 05:32:45 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a19:a416:: with SMTP id q22ls555976lfc.2.gmail; Thu, 23 May
 2019 05:32:44 -0700 (PDT)
X-Received: by 2002:ac2:47e7:: with SMTP id b7mr1177842lfp.53.1558614764308;
        Thu, 23 May 2019 05:32:44 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1558614764; cv=none;
        d=google.com; s=arc-20160816;
        b=RsC5AF45adUbk1LaZWuS1KM5ue74maktnu44Rq27mtO4bsHvwm5GTbZS5GQ2TTKQxF
         +OyfYSlCOH7VlK3LajU4ToLH/PGl1aor02m43LZWezqnTc2n5lvSoNRXtEClQLU6ShVo
         +l70Nt9pKwYmzVyC4lOTW705dO+uaO9hQRwNfvV8xoOENNFYuRC4OewnyUvW+LEEIcdw
         xZi3U6DA3VmvhaxVwNqgtlEAusD/R3a1mt7d6GyZ9zyDFuLaxzXzTJ1ayRcA4oAl7iPQ
         cot8tlSFa5BZhCNWooARqctfQ9a3aMtwh+81HK573fyA09SCdZsL73pEh8kQ59/AcsWJ
         KIyw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:to:subject;
        bh=vjjOlV319dMrkMwsbFacfQejUcUtxSn6CuwCIZv1K1s=;
        b=jWQlD928KPIO20hDNybxq2Y1uHuElzd9EHWX0HxrhXm/H08OZ3NzzXge3hG3qCUpvB
         WSCGm4IXifWAbK24R7/wSTNk13iuXOexXgs3cECmn0iD0v1zZZLbM6taFRWtDgOBuoSa
         5K1Q1iWoLKkAFGrsD1cRO/ELEBTpjOOOncD1wkEPx0voyQsV1yeUDAaV3XtFOproj1O5
         SBYxKdNnSlQcR0rFiEPMzQf+BsF97jOUlPYWp3zgLT8ePffx1dxhWhg7PIO+RZzHI/lx
         aJPjPZyay5DdaIOh3na+QWyPIeUKxySqBpPIHgUyTA0fFb287WH2ZmmGLFUP4gHMpKGW
         AdBg==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.14 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
Received: from david.siemens.de (david.siemens.de. [192.35.17.14])
        by gmr-mx.google.com with ESMTPS id q87si65107lje.0.2019.05.23.05.32.44
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 23 May 2019 05:32:44 -0700 (PDT)
Received-SPF: pass (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.14 as permitted sender) client-ip=192.35.17.14;
Received: from mail2.sbs.de (mail2.sbs.de [192.129.41.66])
	by david.siemens.de (8.15.2/8.15.2) with ESMTPS id x4NCWhMc027401
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 23 May 2019 14:32:43 +0200
Received: from [139.25.68.37] (md1q0hnc.ad001.siemens.net [139.25.68.37] (may be forged))
	by mail2.sbs.de (8.15.2/8.15.2) with ESMTP id x4NCWhqY004429;
	Thu, 23 May 2019 14:32:43 +0200
Subject: Re: [PATCH 5/5] inmates: x86: Catch and report exceptions
To: Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>,
        jailhouse-dev@googlegroups.com
References: <cover.1557914551.git.jan.kiszka@web.de>
 <69941a22af559b8e3afc7cf078cf774e4593f79e.1557914551.git.jan.kiszka@web.de>
 <2c0d76b2-4085-e87b-624e-485000ed0224@oth-regensburg.de>
From: Jan Kiszka <jan.kiszka@siemens.com>
Message-ID: <bd05b0a7-1832-a9e9-fc7f-df02cda3b353@siemens.com>
Date: Thu, 23 May 2019 14:32:43 +0200
User-Agent: Mozilla/5.0 (X11; U; Linux i686 (x86_64); de; rv:1.8.1.12)
 Gecko/20080226 SUSE/2.0.0.12-1.1 Thunderbird/2.0.0.12 Mnenhy/0.7.5.666
MIME-Version: 1.0
In-Reply-To: <2c0d76b2-4085-e87b-624e-485000ed0224@oth-regensburg.de>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Language: en-US
X-Original-Sender: jan.kiszka@siemens.com
X-Original-Authentication-Results: gmr-mx.google.com;       spf=pass
 (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.14 as
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

On 23.05.19 08:35, Ralf Ramsauer wrote:
> On 5/15/19 12:02 PM, Jan Kiszka wrote:
>> From: Jan Kiszka <jan.kiszka@siemens.com>
>>
>> Add basic reporting of exceptions that are triggered by an inmate so
>> that we stop translating all of them into hypervisor-caught triple
>> faults. Reporting is optional and need to be enabled explicitly by an
>> inmate via excp_reporting_init().
>>
>> Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>
>> ---
>>   inmates/lib/x86/Makefile         |   2 +-
>>   inmates/lib/x86/excp.c           | 165 +++++++++++++++++++++++++++++++++++++++
>>   inmates/lib/x86/include/inmate.h |   2 +
>>   3 files changed, 168 insertions(+), 1 deletion(-)
>>   create mode 100644 inmates/lib/x86/excp.c
>>
>> diff --git a/inmates/lib/x86/Makefile b/inmates/lib/x86/Makefile
>> index dc017b90..258eed18 100644
>> --- a/inmates/lib/x86/Makefile
>> +++ b/inmates/lib/x86/Makefile
>> @@ -40,7 +40,7 @@ include $(INMATES_LIB)/Makefile.lib
>>
>>   always := lib.a lib32.a
>>
>> -TARGETS := header.o ioapic.o printk.o setup.o smp.o uart.o int.o
>> +TARGETS := header.o ioapic.o printk.o setup.o smp.o uart.o int.o excp.o
>>   TARGETS += ../alloc.o ../pci.o ../string.o ../cmdline.o ../setup.o
>>   TARGETS += ../uart-8250.o ../printk.o
>>   TARGETS_64_ONLY := mem.o pci.o timing.o
>> diff --git a/inmates/lib/x86/excp.c b/inmates/lib/x86/excp.c
>> new file mode 100644
>> index 00000000..d26300a4
>> --- /dev/null
>> +++ b/inmates/lib/x86/excp.c
>> @@ -0,0 +1,165 @@
>> +/*
>> + * Jailhouse, a Linux-based partitioning hypervisor
>> + *
>> + * Copyright (c) Siemens AG, 2019
>> + *
>> + * Authors:
>> + *  Jan Kiszka <jan.kiszka@siemens.com>
>> + *
>> + * This work is licensed under the terms of the GNU GPL, version 2.  See
>> + * the COPYING file in the top-level directory.
>> + *
>> + * Alternatively, you can use or redistribute this file under the following
>> + * BSD license:
>> + *
>> + * Redistribution and use in source and binary forms, with or without
>> + * modification, are permitted provided that the following conditions
>> + * are met:
>> + *
>> + * 1. Redistributions of source code must retain the above copyright
>> + *    notice, this list of conditions and the following disclaimer.
>> + *
>> + * 2. Redistributions in binary form must reproduce the above copyright
>> + *    notice, this list of conditions and the following disclaimer in the
>> + *    documentation and/or other materials provided with the distribution.
>> + *
>> + * THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS"
>> + * AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE
>> + * IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE
>> + * ARE DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT HOLDER OR CONTRIBUTORS BE
>> + * LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR
>> + * CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF
>> + * SUBSTITUTE GOODS OR SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESS
>> + * INTERRUPTION) HOWEVER CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN
>> + * CONTRACT, STRICT LIABILITY, OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE)
>> + * ARISING IN ANY WAY OUT OF THE USE OF THIS SOFTWARE, EVEN IF ADVISED OF
>> + * THE POSSIBILITY OF SUCH DAMAGE.
>> + */
>> +
>> +#include <inmate.h>
>> +
>> +struct stack_frame {
>> +	unsigned long bp, si, dx, bx, ax;
>> +#ifdef __x86_64__
>> +	unsigned long r8, r9, r10, r11, r12, r13, r14, r15;
>> +	unsigned long cx, di;
>> +#else
>> +	unsigned long di, cx;
>> +#endif
>> +	unsigned long error_code, ip, cs, flags;
>> +#ifdef __x86_64__
>> +	unsigned long sp, ss;
>> +#endif
>> +};
>> +
>> +extern u8 excp_entry[];
>> +
>> +void excp_reporting_init(void)
>> +{
>> +	unsigned int vector;
>> +	u64 entry;
>> +
>> +	for (vector = 0; vector < 21; vector++) {
>> +		entry = (unsigned long)excp_entry + vector * 16;
>> +
>> +		idt[vector * 2] = (entry & 0xffff) | (INMATE_CS64 << 16) |
>> +			((0x8e00 | (entry & 0xffff0000)) << 32);
>> +		idt[vector * 2 + 1] = entry >> 32;
>> +	}
>> +}
>> +
>> +static void __attribute__((used))
>> +exception_handler(unsigned int vector, struct stack_frame *frame)
>> +{
>> +	printk("--- EXCEPTION %d ---\n", vector);
>> +	if (vector >= 10 && vector <= 14)
>> +		printk(" Error code: 0x%08lx\n", frame->error_code);
>> +	printk(" CS:  0x%04lx IP: %p flags: 0x%08lx\n",
>> +	       frame->cs, (void *)frame->ip, frame->flags);
>> +	printk(" SP:  %p BP:  %p\n", frame + 1, (void *)frame->bp);
>> +	printk(" AX:  %p BX:  %p CX:  %p\n",
>> +	       (void *)frame->ax, (void *)frame->bx, (void *)frame->bx);
>> +	printk(" DX:  %p SI:  %p DI:  %p\n",
>> +	       (void *)frame->dx, (void *)frame->si, (void *)frame->di);
>> +#ifdef __x86_64__
>> +	printk(" R8:  %p R9:  %p R10: %p\n",
>> +	       (void *)frame->r8, (void *)frame->r9, (void *)frame->r10);
>> +	printk(" R11: %p R12: %p R13: %p\n",
>> +	       (void *)frame->r11, (void *)frame->r12, (void *)frame->r13);
>> +	printk(" R14: %p R15: %p\n",
>> +	       (void *)frame->r14, (void *)frame->r15);
>> +#endif
>> +
>> +	comm_region->cell_state = JAILHOUSE_CELL_FAILED;
> 
> Maybe we should set the failed state at the beginning of this routine.
> We won't be able to enter fail state if any other errors occur during
> printk.
> 
> 

Valid point, will reorder this.

Jan

-- 
Siemens AG, Corporate Technology, CT RDA IOT SES-DE
Corporate Competence Center Embedded Linux

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/bd05b0a7-1832-a9e9-fc7f-df02cda3b353%40siemens.com.
For more options, visit https://groups.google.com/d/optout.
