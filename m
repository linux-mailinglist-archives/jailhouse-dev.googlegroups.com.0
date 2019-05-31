Return-Path: <jailhouse-dev+bncBD4JZQXE5UFRBAXKYXTQKGQETWB5GLQ@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-wr1-x438.google.com (mail-wr1-x438.google.com [IPv6:2a00:1450:4864:20::438])
	by mail.lfdr.de (Postfix) with ESMTPS id E2D74314D7
	for <lists+jailhouse-dev@lfdr.de>; Fri, 31 May 2019 20:40:02 +0200 (CEST)
Received: by mail-wr1-x438.google.com with SMTP id b19sf4390667wrh.17
        for <lists+jailhouse-dev@lfdr.de>; Fri, 31 May 2019 11:40:02 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1559328002; cv=pass;
        d=google.com; s=arc-20160816;
        b=qo6dZXkM60p3e90/fvlal2X5+HifNo1fVkGJhJA3jOZlwZx2IfUMOQn7MA54obkecW
         vQsGyyGNCMZsI/zATCVICd3B3Z/I8kzpQ9hz+/buiC2GLtCIxrgTFktm7H/g0ngaFC7l
         LR8KcbJqO/wQaxA5wRarxl1ahl6TtvF+o2g8sqLx6SHiWzHZL3KLE16x4PTHhL+aQ572
         7Olqcvxh/HAbO1F36h8d2gzj89fy12wfBjwSCkP1sMAVM7OSJh9j32lOb95gwoWxIN7Q
         osgp8wyOxJlpIuxBtUWaot7Z0K1MR4OYviVyUM2uEoVgEQzGgZX0Ni8SNRckZNZCfRoV
         UlBw==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:subject:autocrypt:openpgp:from:references:to:sender
         :dkim-signature;
        bh=K3kvikX9zyVwwKO896ahd1lDUhrfPQa3O3FqoTfhaEg=;
        b=dz6z4TdHTfMQDi5D0BdMEoXK4uu/dXxSNSWuO2T7cdsDaTKcCur/uI5CokS9TUNYIh
         mcYW45pXQGSfPYBqSz/dldEIKT4WaDb/MnDxz8syL4llJJNRxD6DYHihwiNkCcCn2Gqz
         v/Na918kNrHA1XPFEdgdECXzGky5Ep09czISy0/g9TAJgEXFp48cD0ppATDk97Gwn08E
         6dspqVhbLKImPvLOAtFm7J39t9XCuOX1585OTHoc9/z2F2K1pcpjaBxlcaVaDGN//k8Z
         XsqHE++TQ4IgFdvUaRK0J4EkOstwBJvcNkE1oADwj4E/rtIVAUugWAmrm6UDP7sYxCUV
         O2RQ==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass header.i=@oth-regensburg.de header.s=mta01-20160622 header.b="dfPCd7x/";
       spf=pass (google.com: domain of ralf.ramsauer@oth-regensburg.de designates 2001:638:a01:1096::12 as permitted sender) smtp.mailfrom=ralf.ramsauer@oth-regensburg.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=oth-regensburg.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:to:references:from:openpgp:autocrypt:subject:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :list-post:list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=K3kvikX9zyVwwKO896ahd1lDUhrfPQa3O3FqoTfhaEg=;
        b=DcWxnqhrPRyCE3WNvb24Ldm2l0PpZP23bJTZfuw004tnHQaL4Wxm0Sm8DndUPN169e
         dCg1rZz6Pw+eFT9zUPovcKFVaxcJYvbLZdiip9/q0xAR11VdKRV15d0jBJivGTSwHsLH
         zlUjeERtpkNP5yQGR/3WWcqOvM86FWUMl7b7xg+e+KYTgbUPk3zGz4Jv+xWqg7z2mow8
         3Rvr0gZM8JpqwC5lexbGfnWf62x78vmJv5xpDmqkBM5/g85GI091SanI3AREKFfXKVuw
         SAgSOFU1s5LpYq3/lB/yEV27WqNJbyvT5ZrzavmegvXe740KUbMnZC0lo9DdoYSMQufG
         fY9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:to:references:from:openpgp:autocrypt
         :subject:message-id:date:user-agent:mime-version:in-reply-to
         :content-language:content-transfer-encoding:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :x-spam-checked-in-group:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=K3kvikX9zyVwwKO896ahd1lDUhrfPQa3O3FqoTfhaEg=;
        b=f7cffvEKNVa1giC7Wkb248gUq9sDobygeQp/cmgIVpoNQQs/P56HrCggghb/+IcUvP
         O82zSnaR/stmoWnDQcJfExf0dzsOaBrs+SK4GWt0ce2plZMGoW0W3nEfLndySqJTBW7V
         RD9iBCVCEvfvNP743Adxqlb3z6kdv+bUoEyTZbrcoojVNpetSmOMbMeOYUO3huYfGY75
         H/Lz3PD0obosfD29/d+umee+WOYhSGWHfsud7hcQ25UFV9EjTONWm9xTVObe0t/0QbJ+
         CyEEHcYbh5T++VkwkxVlyQmR8wCYQzbLb6HNzySQy0lJUnAxrXVucszmYnyB3kEr8eKN
         7PmQ==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: APjAAAXMDf3AJ3M1CMUEAM4mghVyMjcAlvEy8SF4xVgrhSMdiWON+022
	oUilCPrVYjZgG9hjZkj7R48=
X-Google-Smtp-Source: APXvYqzqQ0eGvr/SoPTDLRCzHhROtkogoewFLX1KzPe4jrvFVXGQ2Mk+Q9OvJ0IdgniW/IEFBuNunQ==
X-Received: by 2002:a05:600c:228c:: with SMTP id 12mr6524992wmf.20.1559328002584;
        Fri, 31 May 2019 11:40:02 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a05:6000:104b:: with SMTP id c11ls2103783wrx.9.gmail; Fri,
 31 May 2019 11:40:01 -0700 (PDT)
X-Received: by 2002:adf:e544:: with SMTP id z4mr7871783wrm.295.1559328001749;
        Fri, 31 May 2019 11:40:01 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1559328001; cv=none;
        d=google.com; s=arc-20160816;
        b=r1koVZfyhRzGANNFwl4FWE+kbFcr633K+kEQJ7Ghp/IFp8VytIXI2zx7EVFMXDn0p7
         pGLyN80YwfoNJhdDlsbWNw/qhwWzw8KzXTmJOTZIpd7lZuZSkGDCMzZdKqakvvqJkISH
         Ku9cFRR4KsEMKI7rnCCWXdPLHVWTkIiNpDEKRYalMIz/SxJ+bSH+P6jjaAADAVp5CGnD
         XvfMWcAXICSP2ApWRBd/8tV/6UICuJCpzoPfZxLSdRJ5iqfp0Ee4MTO27f9ZjOHMCHOw
         tsFHtgpbVU3UOqOdiO9U/yNrtoLSEm7YIqCbfaSfRWgoc0XoFXr9i0q7jU9KEnmmFql7
         Mq2g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:subject:autocrypt:openpgp:from
         :references:to:dkim-signature;
        bh=h6ho42ev2GENhQPd7717LmBmq+b05Bowx/9fEFVLlWQ=;
        b=NWkNYXv4TyoMuwFTNkuw2BXuaOuziPrNduaJzYrYk3kI0JhY/QWzzZlEIgbZImfmLh
         nMZfSK4/m4BI0cnGZ0qg2Mg50XgfpKvD85sNJXFx0lf0PjfPFeIFVz3ufYtcaKYSoQ00
         dLEJSp7zqNCcmWYNuh4L1qUyfHTu03wdLGM5xe7RH6YBBQM5OiaZaRc9mdkmaX2to3FZ
         ruXlWPsB/QCnsmadZalBa/V++nOShdo3Qhvl0lF+GZhAvYJhH8n7WX85hNMS5tJlFdqr
         JJq5t34jfg3X/SulE76IF7NGfljtN0OmG2QCZw+I014leghw8A8T/KRq1dArjmyi5+am
         e1hQ==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       dkim=pass header.i=@oth-regensburg.de header.s=mta01-20160622 header.b="dfPCd7x/";
       spf=pass (google.com: domain of ralf.ramsauer@oth-regensburg.de designates 2001:638:a01:1096::12 as permitted sender) smtp.mailfrom=ralf.ramsauer@oth-regensburg.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=oth-regensburg.de
Received: from mta02.hs-regensburg.de (mta02.hs-regensburg.de. [2001:638:a01:1096::12])
        by gmr-mx.google.com with ESMTPS id b9si164893wrj.2.2019.05.31.11.40.01
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 31 May 2019 11:40:01 -0700 (PDT)
Received-SPF: pass (google.com: domain of ralf.ramsauer@oth-regensburg.de designates 2001:638:a01:1096::12 as permitted sender) client-ip=2001:638:a01:1096::12;
Received: from E16S02.hs-regensburg.de (e16s02.hs-regensburg.de [IPv6:2001:638:a01:8013::92])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(Client CN "E16S02", Issuer "E16S02" (not verified))
	by mta02.hs-regensburg.de (Postfix) with ESMTPS id 45FtXx2SDzzy31;
	Fri, 31 May 2019 20:40:01 +0200 (CEST)
Received: from [172.16.87.255] (194.95.106.138) by E16S02.hs-regensburg.de
 (2001:638:a01:8013::92) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1713.5; Fri, 31 May
 2019 20:40:00 +0200
To: Jan Kiszka <jan.kiszka@siemens.com>, <jailhouse-dev@googlegroups.com>
References: <20190521143423.17734-1-ralf.ramsauer@oth-regensburg.de>
 <20190521143423.17734-5-ralf.ramsauer@oth-regensburg.de>
 <eca382c5-96bb-352f-d06a-6f92f25088d0@web.de>
 <c6d1eef6-0730-68b2-8fc2-5fd2b3c5b81e@oth-regensburg.de>
 <fdb84e17-c70f-9818-a3b3-2bf5a4f18ed3@siemens.com>
From: Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>
Openpgp: preference=signencrypt
Autocrypt: addr=ralf.ramsauer@oth-regensburg.de; keydata=
 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
 RncIIYr0LjXAAzY=
Subject: Re: [PATCH v2 4/6] inmates: x86: discover and activate SSE/AVX
Message-ID: <de841457-a95f-6ddb-6c53-09c14f64403d@oth-regensburg.de>
Date: Fri, 31 May 2019 14:39:57 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.0
MIME-Version: 1.0
In-Reply-To: <fdb84e17-c70f-9818-a3b3-2bf5a4f18ed3@siemens.com>
Content-Type: text/plain; charset="UTF-8"
Content-Language: en-PH
Content-Transfer-Encoding: quoted-printable
X-Originating-IP: [194.95.106.138]
X-ClientProxiedBy: E16S04.hs-regensburg.de (2001:638:a01:8013::94) To
 E16S02.hs-regensburg.de (2001:638:a01:8013::92)
X-Original-Sender: ralf.ramsauer@oth-regensburg.de
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass
 header.i=@oth-regensburg.de header.s=mta01-20160622 header.b="dfPCd7x/";
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



On 5/31/19 12:04 PM, Jan Kiszka wrote:
> On 31.05.19 17:52, Ralf Ramsauer wrote:
>> On 5/30/19 3:00 AM, Jan Kiszka wrote:
>>> On 21.05.19 16:34, Ralf Ramsauer wrote:
>>>> Recent gcc versions emit SSE instructions for 32-bit inmates (e.g., in
>>>> hex2str or cmdline_parse routines). Inmates aren't able to execute
>>>> those
>>>> instructions as SSE is not enabled and will crash.
>>>>
>>>> Enabling SSE is the same code for 32 and 64 bit x86 and straight
>>>> forward: Lookup SSE availability via cpuid and enable OSFXSR in cr4. I=
f
>>>> SSE is not available, stop the inmate.
>>>>
>>>> If AVX is available, activate it (XCR0).
>>>>
>>>> Lookup features that need no explicit activation.
>>>>
>>>> Signed-off-by: Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>
>>>> ---
>>>> =C2=A0=C2=A0 inmates/lib/x86/Makefile=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0=C2=A0 6 +-
>>>> =C2=A0=C2=A0 inmates/lib/x86/cpu-features.c=C2=A0=C2=A0=C2=A0=C2=A0 | =
103
>>>> +++++++++++++++++++++++++++++
>>>> =C2=A0=C2=A0 inmates/lib/x86/header-32.S=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 |=C2=A0=C2=A0 9 ++-
>>>> =C2=A0=C2=A0 inmates/lib/x86/header-64.S=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 |=C2=A0=C2=A0 9 ++-
>>>> =C2=A0=C2=A0 inmates/lib/x86/include/asm/regs.h |=C2=A0 36 ++++++++++
>>>> =C2=A0=C2=A0 5 files changed, 158 insertions(+), 5 deletions(-)
>>>> =C2=A0=C2=A0 create mode 100644 inmates/lib/x86/cpu-features.c
>>>>
>>>> diff --git a/inmates/lib/x86/Makefile b/inmates/lib/x86/Makefile
>>>> index e474ffd0..ed3b04d5 100644
>>>> --- a/inmates/lib/x86/Makefile
>>>> +++ b/inmates/lib/x86/Makefile
>>>> @@ -40,7 +40,7 @@ include $(INMATES_LIB)/Makefile.lib
>>>>
>>>> =C2=A0=C2=A0 always :=3D lib.a lib32.a
>>>>
>>>> -TARGETS :=3D header-common.o ioapic.o printk.o setup.o smp.o uart.o
>>>> +TARGETS :=3D cpu-features.o header-common.o ioapic.o printk.o setup.o
>>>> smp.o uart.o
>>>> =C2=A0=C2=A0 TARGETS +=3D ../alloc.o ../pci.o ../string.o ../cmdline.o=
 ../setup.o
>>>> =C2=A0=C2=A0 TARGETS +=3D ../uart-8250.o ../printk.o
>>>> =C2=A0=C2=A0 TARGETS_32_ONLY :=3D header-32.o
>>>> @@ -57,6 +57,10 @@ $(obj)/lib32.a: $(addprefix $(obj)/,$(lib32-y))
>>>>
>>>> =C2=A0=C2=A0 targets +=3D header-32.o
>>>>
>>>> +# Code of this object is called before SSE/AVX is available. Ensure
>>>> that the
>>>> +# compiler won't generate unsupported instructions for this file.
>>>> +CFLAGS_cpu-features.o +=3D -mno-sse
>>>> +
>>>> =C2=A0=C2=A0 $(obj)/%-32.o: c_flags +=3D -m32
>>>> =C2=A0=C2=A0 $(obj)/%-32.o: $(src)/%.c
>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 $(call if_changed_rule,cc_o_c)
>>>> diff --git a/inmates/lib/x86/cpu-features.c
>>>> b/inmates/lib/x86/cpu-features.c
>>>> new file mode 100644
>>>> index 00000000..9cf98543
>>>> --- /dev/null
>>>> +++ b/inmates/lib/x86/cpu-features.c
>>>> @@ -0,0 +1,103 @@
>>>> +/*
>>>> + * Jailhouse, a Linux-based partitioning hypervisor
>>>> + *
>>>> + * Copyright (c) OTH Regensburg, 2019
>>>> + *
>>>> + * Authors:
>>>> + *=C2=A0 Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>
>>>> + *
>>>> + * This work is licensed under the terms of the GNU GPL, version
>>>> 2.=C2=A0 See
>>>> + * the COPYING file in the top-level directory.
>>>> + *
>>>> + * Alternatively, you can use or redistribute this file under the
>>>> following
>>>> + * BSD license:
>>>> + *
>>>> + * Redistribution and use in source and binary forms, with or without
>>>> + * modification, are permitted provided that the following conditions
>>>> + * are met:
>>>> + *
>>>> + * 1. Redistributions of source code must retain the above copyright
>>>> + *=C2=A0=C2=A0=C2=A0 notice, this list of conditions and the followin=
g disclaimer.
>>>> + *
>>>> + * 2. Redistributions in binary form must reproduce the above
>>>> copyright
>>>> + *=C2=A0=C2=A0=C2=A0 notice, this list of conditions and the followin=
g disclaimer in
>>>> the
>>>> + *=C2=A0=C2=A0=C2=A0 documentation and/or other materials provided wi=
th the
>>>> distribution.
>>>> + *
>>>> + * THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND
>>>> CONTRIBUTORS "AS IS"
>>>> + * AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED
>>>> TO, THE
>>>> + * IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR
>>>> PURPOSE
>>>> + * ARE DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT HOLDER OR
>>>> CONTRIBUTORS BE
>>>> + * LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, O=
R
>>>> + * CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT LIMITED TO,
>>>> PROCUREMENT OF
>>>> + * SUBSTITUTE GOODS OR SERVICES; LOSS OF USE, DATA, OR PROFITS; OR
>>>> BUSINESS
>>>> + * INTERRUPTION) HOWEVER CAUSED AND ON ANY THEORY OF LIABILITY,
>>>> WHETHER IN
>>>> + * CONTRACT, STRICT LIABILITY, OR TORT (INCLUDING NEGLIGENCE OR
>>>> OTHERWISE)
>>>> + * ARISING IN ANY WAY OUT OF THE USE OF THIS SOFTWARE, EVEN IF
>>>> ADVISED OF
>>>> + * THE POSSIBILITY OF SUCH DAMAGE.
>>>> + */
>>>> +
>>>> +#include <inmate.h>
>>>> +#include <asm/regs.h>
>>>> +
>>>> +/* Must only be called from assembler via jmp */
>>>> +void arch_init_features(void);
>>>> +
>>>> +struct x86_cpu_features x86_cpu_features
>>>> __attribute__((section(".data")));
>>>> +
>>>> +/*
>>>> + * We arrive here very early, and we don't have a stack. Take care.
>>>> + *
>>>> + * Every booting CPU will call this function. We make the assumption
>>>> that all
>>>> + * CPUs have the same feature set. So we don't need any locks when
>>>> writing to
>>>> + * x86_cpu_features.
>>
>> Any comments on this? Is it okay that this code will run on each CPU,
>> even if only required on the primary CPU?
>>
>=20
> Running once on all CPUs is harmless - we are not in a hurry.
>=20
> Running without stack is a problem, see below.

Depends. It's perfectly fine to have no stack if we don't use it (even
if we had an corrupt stack=E2=80=A6).

>=20
>>>> + */
>>>> +void __attribute__((naked, noreturn, section(".boot")))
>>>
>>> What's "naked" supposed to do here? The compilers says it will ignore
>>> it.
>>
>> Huh? Does it produce a warning?
>=20
> Yes, gcc 7.4 said so.
>=20
>>
>> naked ensures that there's no pro- and epilogue sequences. And as the
>> comment states: We won't have a stack that early.
>>
>> BTW: That raises a question: Where do we set the stack for secondary
>> CPUs on x86?
>=20
> In header.S, always to stack_top... Looks like the ARM issue is still
> present here.

I remember that I once fixed some corrupted stack things for ARM
inmates, but it was a bit different there.

Trying to interpret your words: We're currently running on an
overlapping stack for secondary (all) CPUs, right? Should probably be
fixed first.

Hmm. On x86 we're hlting all secondary CPUs very early and wait for a
SIPI. Besides setting ap_entry, we could allocate a valid stack on the
primary CPU inside smp_start_cpu() and pass it.

>=20
>>
>>>
>>>> +arch_init_features(void)
>>>> +{
>>>> +=C2=A0=C2=A0=C2=A0 register u64 features;
>>>> +
>>>> +=C2=A0=C2=A0=C2=A0 features =3D cpuid_edx(X86_CPUID_FEATURES, 0);
>>>> +=C2=A0=C2=A0=C2=A0 /* Check availability of FPU */
>>>> +=C2=A0=C2=A0=C2=A0 x86_cpu_features.fpu =3D !!(features & X86_FEATURE=
_FPU);
>>>> +
>>>> +=C2=A0=C2=A0=C2=A0 /* Discover and enable FXSR */
>>>> +=C2=A0=C2=A0=C2=A0 if (features & X86_FEATURE_FXSR) {
>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 write_cr4(read_cr4() | X86=
_CR4_OSFXSR);
>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 x86_cpu_features.fxsr =3D =
true;
>>>> +=C2=A0=C2=A0=C2=A0 }
>>
>> BTW: Another point that I realised in the meanwhile: AFAICT, the
>> hypervisor will very likely hand over with OSFXSR enabled as it is set
>> by the cr4_required1 mask.
>=20
> The hypervisor hands over in reset state, and there these features are of=
f.

Ahm. No. On a real AMD machine that's true, yes.

But it behaves differently on Qemu x86: CR4 is handed over with 0x2020,
which means OSFXSR | PVI. And even if I try to deactivate, it won't
work. Look at this inmate code:

       printk("CR4 handover: 0x%lx\n", read_cr4());
       write_cr4(read_cr4() & ~0x2000);
       printk("CR4 now: 0x%lx\n", read_cr4());

will output:
CR4 handover: 0x2020
CR4 now: 0x2020

CR4 is write-intercepted, and vmx_set_guest_cr in vmx.c:443 will set it
again on interception.

>=20
>>
>> Nevertheless, it should be properly set.
>>
>>>> +
>>>> +=C2=A0=C2=A0=C2=A0 /* Check availability of SSE */
>>>> +=C2=A0=C2=A0=C2=A0 x86_cpu_features.sse =3D !!(features & X86_FEATURE=
_SSE);
>>>> +=C2=A0=C2=A0=C2=A0 x86_cpu_features.sse2 =3D !!(features & X86_FEATUR=
E_SSE2);
>>>> +
>>>> +=C2=A0=C2=A0=C2=A0 /* ECX hides the rest */
>>>> +=C2=A0=C2=A0=C2=A0 features =3D cpuid_ecx(X86_CPUID_FEATURES, 0);
>>>> +=C2=A0=C2=A0=C2=A0 x86_cpu_features.sse3 =3D !!(features & X86_FEATUR=
E_SSE3);
>>>> +=C2=A0=C2=A0=C2=A0 x86_cpu_features.sse4_1 =3D !!(features & X86_FEAT=
URE_SSE4_1);
>>>> +=C2=A0=C2=A0=C2=A0 x86_cpu_features.sse4_2 =3D !!(features & X86_FEAT=
URE_SSE4_2);
>>>> +=C2=A0=C2=A0=C2=A0 x86_cpu_features.pclmulqdq =3D !!(features & X86_F=
EATURE_PCLMULQDQ);
>>>> +
>>>> +=C2=A0=C2=A0=C2=A0 if (features & X86_FEATURE_XSAVE) {
>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 /* Enable XSAVE related in=
structions */
>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 write_cr4(read_cr4() | X86=
_CR4_OSXSAVE);
>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 x86_cpu_features.xsave =3D=
 true;
>>>> +
>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 /*
>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 * Intel SDM 13.2: A =
bit can be set in XCR0 if and only if the
>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 * corresponding bit =
is set in this bitmap.=C2=A0 Every processor
>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 * that supports the =
XSAVE feature set will set EAX[0] (x87
>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 * state) and EAX[1] =
(SSE state).
>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 *
>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 * We can always safe=
ly write SSE + FP, but only set AVX if
>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 * available.
>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 */
>>>> +
>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 features =3D cpuid_edax(X8=
6_CPUID_XSTATE, 0);
>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 write_xcr0(read_xcr0() | (=
features & X86_XCR0_AVX) | \
>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 X86_XCR0_SSE | X86_XCR0_X87);
>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 x86_cpu_features.avx =3D !=
!(features & X86_XCR0_AVX);
>>>> +=C2=A0=C2=A0=C2=A0 }
>>>> +
>>>> +=C2=A0=C2=A0=C2=A0 /* hand control back to assembler */
>>>> +=C2=A0=C2=A0=C2=A0 asm volatile("jmp x86_start\t\n");
>>>
>>> Hacky... Is there no stack yet to do proper call/ret?
>>
>> See above, no stack. But I agree on hacky. :-)
>>
>>>
>>> But if you want to / have to use a jmp here, you need to tell the
>>> compiler that
>>> this will never "return" (__builtin_unreachable).
>>
>> What's the difference between noreturn and builtin_unreachable?
>=20
> The former declares it for the function and, thus, also informs its
> callers, the latter marks that some line is never reached. That is
> needed when you call something that is noreturn but does not declare it
> (like your inline assembly).
>=20
>>
>> The noreturn attribute makes sure that - besides the epilogue, we won't
>> have a ret.
>=20
> The compiler should have barked at you that your noreturn function seems
> to return (the compiler has no idea about the semantic of the inline
> assembly).

I used gcc 8.3.0. No complaints. Anyway, I get your point.

  Ralf

>=20
> Jan
>=20

--=20
You received this message because you are subscribed to the Google Groups "=
Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/=
jailhouse-dev/de841457-a95f-6ddb-6c53-09c14f64403d%40oth-regensburg.de.
For more options, visit https://groups.google.com/d/optout.
