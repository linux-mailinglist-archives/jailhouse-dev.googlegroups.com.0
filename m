Return-Path: <jailhouse-dev+bncBCJI7SMNV4NBBPMQ5LTQKGQEFKB27RA@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-lf1-x139.google.com (mail-lf1-x139.google.com [IPv6:2a00:1450:4864:20::139])
	by mail.lfdr.de (Postfix) with ESMTPS id 552E33907C
	for <lists+jailhouse-dev@lfdr.de>; Fri,  7 Jun 2019 17:52:30 +0200 (CEST)
Received: by mail-lf1-x139.google.com with SMTP id 22sf614791lft.2
        for <lists+jailhouse-dev@lfdr.de>; Fri, 07 Jun 2019 08:52:30 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1559922749; cv=pass;
        d=google.com; s=arc-20160816;
        b=ZkM75Nn/zy4GqCpptqaMkH6ylDjdYzPc8jzuUO4JiET2+H/wh1CLnSUwdkUVdoL1/R
         xWfifLWnr74WhOVPDxOdBuF1K/ce8eCYa5hrY1ru0dN2njskQN/F2+wl9p6a2me54vPV
         s5GnvcEK3EbtUn1WVZ4YHq/oigLoaEuytf4+etwVY7GvNvWRSJDLJgLQkrsYTEyn+VMV
         VTH6ZevFXUk5Afd3IQZn6CVs+1HRPGFRPEJ7KrkCxnqC4GLKwTlo0Wrn7Kh4ikCHAAHa
         jIVBMwiY6+S44vKSzA54jB8WtaYbXwCEYYQXsMzXIxgnODIuBtbgqgexPMlNFciAJv14
         Bhxg==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject:sender:dkim-signature;
        bh=mq+7b7WF/xepTg4QizO7JmoVoLIf57KnvPpWObLPLFw=;
        b=BqRAGpi6R26ymRQdLVqOrizAjfjiBqxqNAgXXSbIlK6y95edZerNgOn+pS1cy58R4s
         TiOQr2wNf0gv+rgEM9Pl6I1/X+8jDTRXjBH0/kRcV15lDFTS1vTd5n7LeF0QRne8wIpZ
         Z9gw+zdTF4jmnr6sfZ/M9tRtQI7lCGJ2YCBmR8QKwdf5Ni+pict+rsYdAPfxKTD2Cv1N
         F20Y1KjmilZ7J2XTtXv2dWULjjLxP5Cde2T4tISjCWkJawlVuYq5bp5SSgyGFyDY7QmL
         A1UHmZBMt31NVvBd+8gXuUcgN4yed7EZFnNJpLGlqAZ5jQpy8DAHRsxCf6Tq1m0WB6Zr
         JAQw==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 194.138.37.39 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:subject:to:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding
         :x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=mq+7b7WF/xepTg4QizO7JmoVoLIf57KnvPpWObLPLFw=;
        b=qHLB7O4cgofz/7E1cBIKBSNAHVcSgVM76NGWbygVICjY/53nx1jaamr9NoXk0jLFA9
         dh8+3nQWXKsyn/Y8KqRHF/i42rsFDX5xRCRTkYSQmG4ikGddri21vCV/6DZDP4sxgbsS
         p9Dc42mNy/funQ+GmGiJOq95KO1g9q1R/ZY9rzVE6jPKgxa6/dBrQSbi16qlrH8uxZUu
         l/YxwBR5tbVRYuI2q+ue7kze5q05UR075zT+HdY7sT10eGu2iU/+6KPLuYLuLexqRqNF
         KdqIP6ussC9/k5hbtFk19DXrqbtpQEqFS0dU6kUKJAGmEyNWPVZL7aL8Ji3WvopVfteG
         YXew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:subject:to:references:from:message-id
         :date:user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :x-spam-checked-in-group:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=mq+7b7WF/xepTg4QizO7JmoVoLIf57KnvPpWObLPLFw=;
        b=jhCUNYnkspKCX9PCV/wYHsy3KDW1dH4fdqYlany2x/qMCNYJTtTgwbdloN+Y7YDW+V
         gvByP1n+PtuRfRD+ayHX7zsfvuW9pISvpUGv7tgefy0NbHp28Gnxd1dO7z8i0qG9mfA6
         h7cfooIWmxKyV4PYG3DDLVTfuK+AeQ+YVKa03CdaN35rxB6qZ3wzmk0TJJJb0KOeDm+x
         2HNbAkBp8235ZCG/c6zSiwLKVW4MauI9vsWgkYgFU0XBT6c0gSHnwYpBVl3vRgmMgyVt
         3RC1bbKxqRcM4GvqXSU/0vZBrbZUmrRC7iH00senDII3detvYmYGHTxUrW/u0i0oDtzy
         Uqeg==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: APjAAAWy0VECA3eNyTrEy7NenEhhNt5JXUM+yCkk/cBlPFkxzlncmspj
	VARyaiR29Wlshav75OyBRsM=
X-Google-Smtp-Source: APXvYqxbpRAKKYH434nGiKCLybebUYdwLpxrSw7rGz5TWITlJzvmY9eF1ZDd3fQ7xxg8b3kGkkqm/A==
X-Received: by 2002:ac2:5595:: with SMTP id v21mr12544840lfg.54.1559922749809;
        Fri, 07 Jun 2019 08:52:29 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a2e:6556:: with SMTP id z83ls1078686ljb.11.gmail; Fri, 07
 Jun 2019 08:52:28 -0700 (PDT)
X-Received: by 2002:a2e:85d1:: with SMTP id h17mr10600118ljj.1.1559922748816;
        Fri, 07 Jun 2019 08:52:28 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1559922748; cv=none;
        d=google.com; s=arc-20160816;
        b=AqLCu6TbLGaUUNKmANJ2YnsNj8eU4xT5GRgYLNGm94cSjugJG50uoiyGNmevGB8/1W
         3YTVAKqISjcmmN3fv4CHcuBrDXuJV2AeKa2yS1rHrxkJVA+6/OBoloG3xfxpB7CjgSlI
         wWHWEQYRHWkY6YkXeuxnNuEcR6aKxcbpVo9tMSHkkM14UOhcM3gxZcIn+eweUJl839t+
         Xcj98lPO6cG9/Dfi9CdZv7mNSde2wQ8ptbenT4hCGw3fvSDIJDrV9wil6ey6LmnQoYoa
         /3DrWHM1TwtMP1AOQCayavV6E7IWCp9bcuUqYFzK4ilHdWQn0d4oG9TeiGkBNigp5m4W
         FK7A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:to:subject;
        bh=hvhflhhcA5SL1aXZeZ195JRDTujXmLLOsHL5NuN15OI=;
        b=qRTkmbCY8TQZ6umdUmM//ZUhHTZ0JatcGd1Pdtuab9RrZrljY/WVsNwqugF3avLvUo
         cUycCpz3DAOTnodeykPClGoVsQ8HvrLz0ryj6TH/t+13mYy4EpH2K5IrEEAQPX5RaDK0
         M1uszRy4fGn/1++/2x4iyEShmuBsgYZVJOFnR6bwSNaYG5sozb0mGNt+Ydx6lP7VIBWv
         tiCPmqu2kW2bPsVvhhRdbiQey9FuQIS2VsCQ5w8w/nL1e6BRMSNlZxr7n9sSiGYCMScN
         WB9y452qs4MZ10qOzOwyqXaXWdbipslMR5z2WCz6f+G99RG5kSkDaiPr38KndlFAypqX
         rVaQ==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 194.138.37.39 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
Received: from lizzard.sbs.de (lizzard.sbs.de. [194.138.37.39])
        by gmr-mx.google.com with ESMTPS id c15si110608lfi.5.2019.06.07.08.52.28
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 07 Jun 2019 08:52:28 -0700 (PDT)
Received-SPF: pass (google.com: domain of jan.kiszka@siemens.com designates 194.138.37.39 as permitted sender) client-ip=194.138.37.39;
Received: from mail1.sbs.de (mail1.sbs.de [192.129.41.35])
	by lizzard.sbs.de (8.15.2/8.15.2) with ESMTPS id x57FqSHn019689
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 7 Jun 2019 17:52:28 +0200
Received: from [167.87.4.234] ([167.87.4.234])
	by mail1.sbs.de (8.15.2/8.15.2) with ESMTP id x57FqQst032603;
	Fri, 7 Jun 2019 17:52:27 +0200
Subject: Re: [PATCH v2 4/6] inmates: x86: discover and activate SSE/AVX
To: Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>,
        jailhouse-dev@googlegroups.com
References: <20190521143423.17734-1-ralf.ramsauer@oth-regensburg.de>
 <20190521143423.17734-5-ralf.ramsauer@oth-regensburg.de>
 <eca382c5-96bb-352f-d06a-6f92f25088d0@web.de>
 <c6d1eef6-0730-68b2-8fc2-5fd2b3c5b81e@oth-regensburg.de>
 <fdb84e17-c70f-9818-a3b3-2bf5a4f18ed3@siemens.com>
 <de841457-a95f-6ddb-6c53-09c14f64403d@oth-regensburg.de>
 <eb711300-b19c-053e-21c7-721bab566b07@oth-regensburg.de>
From: Jan Kiszka <jan.kiszka@siemens.com>
Message-ID: <af3e89c4-5d33-e6c8-3ba4-6b6ca6d4a409@siemens.com>
Date: Fri, 7 Jun 2019 17:52:25 +0200
User-Agent: Mozilla/5.0 (X11; U; Linux i686 (x86_64); de; rv:1.8.1.12)
 Gecko/20080226 SUSE/2.0.0.12-1.1 Thunderbird/2.0.0.12 Mnenhy/0.7.5.666
MIME-Version: 1.0
In-Reply-To: <eb711300-b19c-053e-21c7-721bab566b07@oth-regensburg.de>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable
X-Original-Sender: jan.kiszka@siemens.com
X-Original-Authentication-Results: gmr-mx.google.com;       spf=pass
 (google.com: domain of jan.kiszka@siemens.com designates 194.138.37.39 as
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

On 07.06.19 17:26, Ralf Ramsauer wrote:
>=20
>=20
> On 5/31/19 8:39 PM, Ralf Ramsauer wrote:
>>
>>
>> On 5/31/19 12:04 PM, Jan Kiszka wrote:
>>> On 31.05.19 17:52, Ralf Ramsauer wrote:
>>>> On 5/30/19 3:00 AM, Jan Kiszka wrote:
>>>>> On 21.05.19 16:34, Ralf Ramsauer wrote:
>>>>>> Recent gcc versions emit SSE instructions for 32-bit inmates (e.g., =
in
>>>>>> hex2str or cmdline_parse routines). Inmates aren't able to execute
>>>>>> those
>>>>>> instructions as SSE is not enabled and will crash.
>>>>>>
>>>>>> Enabling SSE is the same code for 32 and 64 bit x86 and straight
>>>>>> forward: Lookup SSE availability via cpuid and enable OSFXSR in cr4.=
 If
>>>>>> SSE is not available, stop the inmate.
>>>>>>
>>>>>> If AVX is available, activate it (XCR0).
>>>>>>
>>>>>> Lookup features that need no explicit activation.
>>>>>>
>>>>>> Signed-off-by: Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>
>>>>>> ---
>>>>>>  =C2=A0=C2=A0 inmates/lib/x86/Makefile=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0=C2=A0 6 +-
>>>>>>  =C2=A0=C2=A0 inmates/lib/x86/cpu-features.c=C2=A0=C2=A0=C2=A0=C2=A0=
 | 103
>>>>>> +++++++++++++++++++++++++++++
>>>>>>  =C2=A0=C2=A0 inmates/lib/x86/header-32.S=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 |=C2=A0=C2=A0 9 ++-
>>>>>>  =C2=A0=C2=A0 inmates/lib/x86/header-64.S=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 |=C2=A0=C2=A0 9 ++-
>>>>>>  =C2=A0=C2=A0 inmates/lib/x86/include/asm/regs.h |=C2=A0 36 ++++++++=
++
>>>>>>  =C2=A0=C2=A0 5 files changed, 158 insertions(+), 5 deletions(-)
>>>>>>  =C2=A0=C2=A0 create mode 100644 inmates/lib/x86/cpu-features.c
>>>>>>
>>>>>> diff --git a/inmates/lib/x86/Makefile b/inmates/lib/x86/Makefile
>>>>>> index e474ffd0..ed3b04d5 100644
>>>>>> --- a/inmates/lib/x86/Makefile
>>>>>> +++ b/inmates/lib/x86/Makefile
>>>>>> @@ -40,7 +40,7 @@ include $(INMATES_LIB)/Makefile.lib
>>>>>>
>>>>>>  =C2=A0=C2=A0 always :=3D lib.a lib32.a
>>>>>>
>>>>>> -TARGETS :=3D header-common.o ioapic.o printk.o setup.o smp.o uart.o
>>>>>> +TARGETS :=3D cpu-features.o header-common.o ioapic.o printk.o setup=
.o
>>>>>> smp.o uart.o
>>>>>>  =C2=A0=C2=A0 TARGETS +=3D ../alloc.o ../pci.o ../string.o ../cmdlin=
e.o ../setup.o
>>>>>>  =C2=A0=C2=A0 TARGETS +=3D ../uart-8250.o ../printk.o
>>>>>>  =C2=A0=C2=A0 TARGETS_32_ONLY :=3D header-32.o
>>>>>> @@ -57,6 +57,10 @@ $(obj)/lib32.a: $(addprefix $(obj)/,$(lib32-y))
>>>>>>
>>>>>>  =C2=A0=C2=A0 targets +=3D header-32.o
>>>>>>
>>>>>> +# Code of this object is called before SSE/AVX is available. Ensure
>>>>>> that the
>>>>>> +# compiler won't generate unsupported instructions for this file.
>>>>>> +CFLAGS_cpu-features.o +=3D -mno-sse
>>>>>> +
>>>>>>  =C2=A0=C2=A0 $(obj)/%-32.o: c_flags +=3D -m32
>>>>>>  =C2=A0=C2=A0 $(obj)/%-32.o: $(src)/%.c
>>>>>>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 $(call if_changed_rule,cc_o_c)
>>>>>> diff --git a/inmates/lib/x86/cpu-features.c
>>>>>> b/inmates/lib/x86/cpu-features.c
>>>>>> new file mode 100644
>>>>>> index 00000000..9cf98543
>>>>>> --- /dev/null
>>>>>> +++ b/inmates/lib/x86/cpu-features.c
>>>>>> @@ -0,0 +1,103 @@
>>>>>> +/*
>>>>>> + * Jailhouse, a Linux-based partitioning hypervisor
>>>>>> + *
>>>>>> + * Copyright (c) OTH Regensburg, 2019
>>>>>> + *
>>>>>> + * Authors:
>>>>>> + *=C2=A0 Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>
>>>>>> + *
>>>>>> + * This work is licensed under the terms of the GNU GPL, version
>>>>>> 2.=C2=A0 See
>>>>>> + * the COPYING file in the top-level directory.
>>>>>> + *
>>>>>> + * Alternatively, you can use or redistribute this file under the
>>>>>> following
>>>>>> + * BSD license:
>>>>>> + *
>>>>>> + * Redistribution and use in source and binary forms, with or witho=
ut
>>>>>> + * modification, are permitted provided that the following conditio=
ns
>>>>>> + * are met:
>>>>>> + *
>>>>>> + * 1. Redistributions of source code must retain the above copyrigh=
t
>>>>>> + *=C2=A0=C2=A0=C2=A0 notice, this list of conditions and the follow=
ing disclaimer.
>>>>>> + *
>>>>>> + * 2. Redistributions in binary form must reproduce the above
>>>>>> copyright
>>>>>> + *=C2=A0=C2=A0=C2=A0 notice, this list of conditions and the follow=
ing disclaimer in
>>>>>> the
>>>>>> + *=C2=A0=C2=A0=C2=A0 documentation and/or other materials provided =
with the
>>>>>> distribution.
>>>>>> + *
>>>>>> + * THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND
>>>>>> CONTRIBUTORS "AS IS"
>>>>>> + * AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITE=
D
>>>>>> TO, THE
>>>>>> + * IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICUL=
AR
>>>>>> PURPOSE
>>>>>> + * ARE DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT HOLDER OR
>>>>>> CONTRIBUTORS BE
>>>>>> + * LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY,=
 OR
>>>>>> + * CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT LIMITED TO,
>>>>>> PROCUREMENT OF
>>>>>> + * SUBSTITUTE GOODS OR SERVICES; LOSS OF USE, DATA, OR PROFITS; OR
>>>>>> BUSINESS
>>>>>> + * INTERRUPTION) HOWEVER CAUSED AND ON ANY THEORY OF LIABILITY,
>>>>>> WHETHER IN
>>>>>> + * CONTRACT, STRICT LIABILITY, OR TORT (INCLUDING NEGLIGENCE OR
>>>>>> OTHERWISE)
>>>>>> + * ARISING IN ANY WAY OUT OF THE USE OF THIS SOFTWARE, EVEN IF
>>>>>> ADVISED OF
>>>>>> + * THE POSSIBILITY OF SUCH DAMAGE.
>>>>>> + */
>>>>>> +
>>>>>> +#include <inmate.h>
>>>>>> +#include <asm/regs.h>
>>>>>> +
>>>>>> +/* Must only be called from assembler via jmp */
>>>>>> +void arch_init_features(void);
>>>>>> +
>>>>>> +struct x86_cpu_features x86_cpu_features
>>>>>> __attribute__((section(".data")));
>>>>>> +
>>>>>> +/*
>>>>>> + * We arrive here very early, and we don't have a stack. Take care.
>>>>>> + *
>>>>>> + * Every booting CPU will call this function. We make the assumptio=
n
>>>>>> that all
>>>>>> + * CPUs have the same feature set. So we don't need any locks when
>>>>>> writing to
>>>>>> + * x86_cpu_features.
>>>>
>>>> Any comments on this? Is it okay that this code will run on each CPU,
>>>> even if only required on the primary CPU?
>>>>
>>>
>>> Running once on all CPUs is harmless - we are not in a hurry.
>>>
>>> Running without stack is a problem, see below.
>>
>> Depends. It's perfectly fine to have no stack if we don't use it (even
>> if we had an corrupt stack=E2=80=A6).
>>
>>>
>>>>>> + */
>>>>>> +void __attribute__((naked, noreturn, section(".boot")))
>>>>>
>>>>> What's "naked" supposed to do here? The compilers says it will ignore
>>>>> it.
>>>>
>>>> Huh? Does it produce a warning?
>>>
>>> Yes, gcc 7.4 said so.
>>>
>>>>
>>>> naked ensures that there's no pro- and epilogue sequences. And as the
>>>> comment states: We won't have a stack that early.
>>>>
>>>> BTW: That raises a question: Where do we set the stack for secondary
>>>> CPUs on x86?
>>>
>>> In header.S, always to stack_top... Looks like the ARM issue is still
>>> present here.
>>
>> I remember that I once fixed some corrupted stack things for ARM
>> inmates, but it was a bit different there.
>>
>> Trying to interpret your words: We're currently running on an
>> overlapping stack for secondary (all) CPUs, right? Should probably be
>> fixed first.
>>
>> Hmm. On x86 we're hlting all secondary CPUs very early and wait for a
>> SIPI. Besides setting ap_entry, we could allocate a valid stack on the
>> primary CPU inside smp_start_cpu() and pass it.
>=20
> MMIO stuff is done, let's get back to this topic. :-)

Yeah, right... I was close to pushing "--no-sse" today when I recalled that=
 you=20
are on this ;)

>=20
> The problem that I initially wanted to solve was missing SSE support,
> turns out secondary CPUs in x86 have a broken stack.
>=20
> There might be a clean solution to solve all issues, including the dirty
> "naked jmp around"-hack:
>=20
> Let's reconsider the early boot phase of x86 inmates. In comparison to
> ARM, for example, we start all CPUs but halt secondary CPUs and wait for
> SIPIs.
>=20
> Now, we could provide a stack symbol that points to a free, valid stack
> that a CPU can grab. Initially, (by compile time) the symbol holds the
> address of the stack for the primary CPU. It's yet unclear who will win
> the race to be the primary CPU.
>=20
> We could cmpxchg the content of this symbol *very* early. Whoever wins
> is the primary CPU, everyone else will read zero and simply put the CPU
> in hlt state.

That's what we do today already: Only the first CPU gets the static stack, =
the=20
rest enter a hlt loop until their inmate-triggered wakeup without touching =
that=20
stack. No problem here.

>=20
> When starting secondary CPUs, smp_start_cpu() alloc()s a new stack from
> the heap, sets the stack symbol (and sets ap_entry) and kicks the CPU.
> Now the same startup code will run, but the secondary CPU grabs the
> stack and boots.

Right, we need to make "mov $stack_top,%rsp" configurable, and the problem=
=20
should be solved. For the first CPU, it can remain that static one.

>=20
> This has some advantages:
>    - We have a valid stack very early, and can jump to C back and forth
>      with regular calls instead of the hacky hack above.
>    - Startup code will only run once when needed, and not multiple times
>      as it is the case at the moment

Startup should happen via INIT/SIPI, so some bits have to be run again.=20
Moreover, we need to let them run in order to fill smp_cpu_ids.

>    - Every secondary CPU gets its own clean stack (which is broken atm)
>    - Still we maintain shared startup code for primary and secondary
>      CPUs.
>=20
> Does that sound reasonable? I'd just like to hear some feedback before I
> start hacking, as this could become a bit more complex, yet another
> time. :-)

Minus that some of the bits you defined are already there - yes. :)

Jan

--=20
Siemens AG, Corporate Technology, CT RDA IOT SES-DE
Corporate Competence Center Embedded Linux

--=20
You received this message because you are subscribed to the Google Groups "=
Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/=
jailhouse-dev/af3e89c4-5d33-e6c8-3ba4-6b6ca6d4a409%40siemens.com.
For more options, visit https://groups.google.com/d/optout.
