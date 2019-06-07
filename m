Return-Path: <jailhouse-dev+bncBD4JZQXE5UFRBHEE5LTQKGQEROHGR2A@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-wr1-x43c.google.com (mail-wr1-x43c.google.com [IPv6:2a00:1450:4864:20::43c])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F2F438EFC
	for <lists+jailhouse-dev@lfdr.de>; Fri,  7 Jun 2019 17:26:21 +0200 (CEST)
Received: by mail-wr1-x43c.google.com with SMTP id q14sf1006315wrm.23
        for <lists+jailhouse-dev@lfdr.de>; Fri, 07 Jun 2019 08:26:21 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1559921180; cv=pass;
        d=google.com; s=arc-20160816;
        b=ekteVOoh87csDnXPQxwWUaIkRiSI2yNKApUXGIlm6MQQVhSaP0vTlwZY4nmJXdMECE
         rVZcRdp6Z86x30BKht/pmuOWTbXARIBsAF/Ve/vL225Ua3xAn7oglRIttm1ofMc7Hssv
         Hd+OLJqSm51UNtVfIGYQqDCZZejxS9lVRKD70l5S0U5CQbK3Uqmg+1R9iHrRimwA6KiT
         uUCkMLkAgG7KeybtnpqMh/iAGdAtA9i0zQNKibkt7jhWFOhxSJbVmrCGYOD9wH2P+7zZ
         O5wTWgdBG5eKq1ZGW7MjHjjYw65UZnZ1CMVZAnSa1DQJtcyIy4rfvsccyRUhf8RccjNA
         HUDw==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:openpgp:from:references:to:subject:sender:dkim-signature;
        bh=A0VR7GzWIiB7LnC3uukcj2Vk18F6rW26slivuS6mJGk=;
        b=sMjTljk7lklagzAuEhL//Bf2Y0uKFb88zcN9HFcGRNqVE3bLIxgp9zZghyJJ7k4jS7
         IuhyR63MGKS7o9b8haPheQvUrO/nq/PlWnwpVWms1rapHVRCRX9dBLlppXGd+HufsJrU
         Ceono/DET8RP1bDon6bMej89JuxUfHPcGbaaX/ErOx0uFZAwLzDMI5RNln7aTnbE8CbQ
         NIQerUqGH/UOO36Gmdnwns0f2HVBc5YrZDO/VL8URukAtN5zu74ede1qnlzj9KFRzaS5
         hC186VCkN/FVj3MGybyj4hgsD9vwomIsn3JC0WpjpmTWJijF+yhfn5Cz4Yc+XY6y3O+G
         FC3Q==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass header.i=@oth-regensburg.de header.s=mta01-20160622 header.b=pWCWWuAI;
       spf=pass (google.com: domain of ralf.ramsauer@oth-regensburg.de designates 2001:638:a01:1096::12 as permitted sender) smtp.mailfrom=ralf.ramsauer@oth-regensburg.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=oth-regensburg.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:subject:to:references:from:openpgp:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :list-post:list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=A0VR7GzWIiB7LnC3uukcj2Vk18F6rW26slivuS6mJGk=;
        b=SeNXvHeVaFZ2cIkX7rkrkewPiFo78RkktR7STNlQ85vm2Ej+UjXZsUqApbALWdtKvw
         MuK+jJtEiJeSAoPpNeJn+5GK8JiS+Av+F0DjvKDss29fO9yq0TqUoApU5cWIMF+yXUuy
         Lr2444qSXUvov5WvTgL5ekWAvz+uu35Fg1ROv4Tu5n/oqmYYY2f6g1ofbmkq0K0Hlrgn
         tq2U4u9Q8GwA7/ROUPXnKxGzHRBhtKh8kB0Kqk4EJY8cOKRD69B/oZNYTV1G/jesxRRH
         0j8eEhdIKFh0Wo4gveLSMJH8Ba8rVKKy0Rg1M/ot8yqAqSU0HKHXNL4TgXTLuqB/5gCf
         w/Xg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:subject:to:references:from:openpgp
         :message-id:date:user-agent:mime-version:in-reply-to
         :content-language:content-transfer-encoding:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :x-spam-checked-in-group:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=A0VR7GzWIiB7LnC3uukcj2Vk18F6rW26slivuS6mJGk=;
        b=f1UFb2uC3Wd9rBt7LuXoK071G0HHcOiEI43u+CyNOnflGWw5Mm4STAeGUuJgV6t8vo
         Gf90szZmmXQJ2AkNX2Qz2RKwd38jyCRNT7fPP4fEgWype9bNrTLnSFrBGN0dlvBlZSzT
         zDf9dQHC8v4v5QSGKdNxtTb/LIS3CaYfYZiO5XiQWGnNUWVjQvtCGauKfeqmpA/WK47y
         lK77/Or2kM8X75YWlVMPf5JyxhRBBpmn+Z6mghNv5VeBnyJuDXz/wRR6ZMVr7NngfZQ6
         9ymTZxc7CC2bjteSiWchKVSb+yKiQH/i0U4m/YpsuKjK2tNXrp7RUO4434Me3uAGVRXf
         HplA==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: APjAAAXcTMLmZi7vI4XgdNMsijhypOdMyVEXuE5KzlA9lDwP8gDVTBpv
	3xGGbmWCVnGLnU/jK4Z88EQ=
X-Google-Smtp-Source: APXvYqyxk+Wm7bT5QWDhKBz7pWEn7XNXV2YQK2KGb+YrDdbZfDvOt0/dPWtLuwHIyLROTAOSUJTsIA==
X-Received: by 2002:a5d:494d:: with SMTP id r13mr7409154wrs.152.1559921180828;
        Fri, 07 Jun 2019 08:26:20 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a1c:9d45:: with SMTP id g66ls2877155wme.1.gmail; Fri, 07 Jun
 2019 08:26:20 -0700 (PDT)
X-Received: by 2002:a1c:3:: with SMTP id 3mr4327065wma.44.1559921180226;
        Fri, 07 Jun 2019 08:26:20 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1559921180; cv=none;
        d=google.com; s=arc-20160816;
        b=oPurHwf50/JeHWa+r7G0LU24SbCFR5Ilpud//7r5V6KmQK91XQQcFKUox3+a/PC3fW
         spTn6GYJi31lmCZPDoPaXOaeAyzQSiScwWdII7CcyuQQtfn8ieP4KyHErnsT6ADxs5Mt
         ftueAUzMuNRZCQvH5X0mDf5AguWExq7E5Ljwm6TnRohW1oqbVviXgloe49ypGnh2KLmF
         nU4WxC2no7tVMPflgpfmls1VfqmxXhueopypZIBhaUqao7OgFk+F4pUdxJyMJTxbhw3J
         0TfGyV+ey/u1oUKl+cNE1pkOHNdAyA+yX0qzJT8x26wdRCciXDN7AnSnYmbX0c9569u3
         Cqng==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:openpgp:from:references:to:subject
         :dkim-signature;
        bh=9wdx679DiGe/o1rqalDdCqY9R4s8Ka+HQD0tf3h0+rw=;
        b=aE3Iou6nv4h14FdOvES6AWzfbisHliQA7eCAmLaHkV0aSbS0U6Kxln4LmDvk1qqnSd
         mKSVzGoA+Z/WDJdwS3l9hYgiHgcY/jbh9RiAAaPCbDjVkkXzprJBelKOHgo0/d14wjIg
         wjdeGacp0uvn41hoPaFsDeyToRV6fdWanpkovjq+NX+SHiPj6+9qOos0cJ48aluFs1SW
         oL2QSVOEL51FZ2JVuSHFUOuTEufsx4G+AZuhTAmFlG6XDdLbfPfv6OV+cp7Pa2Isvv4l
         BCUFewZvHBusZaUAeN+nJrwxHLeV9yF4yS8UUY9vGJYfIrQZuJrxgAtrmtkq8rj1xMqI
         OtQw==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       dkim=pass header.i=@oth-regensburg.de header.s=mta01-20160622 header.b=pWCWWuAI;
       spf=pass (google.com: domain of ralf.ramsauer@oth-regensburg.de designates 2001:638:a01:1096::12 as permitted sender) smtp.mailfrom=ralf.ramsauer@oth-regensburg.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=oth-regensburg.de
Received: from mta02.hs-regensburg.de (mta02.hs-regensburg.de. [2001:638:a01:1096::12])
        by gmr-mx.google.com with ESMTPS id f83si81383wme.2.2019.06.07.08.26.20
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 07 Jun 2019 08:26:20 -0700 (PDT)
Received-SPF: pass (google.com: domain of ralf.ramsauer@oth-regensburg.de designates 2001:638:a01:1096::12 as permitted sender) client-ip=2001:638:a01:1096::12;
Received: from E16S02.hs-regensburg.de (e16s02.hs-regensburg.de [IPv6:2001:638:a01:8013::92])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(Client CN "E16S02", Issuer "E16S02" (not verified))
	by mta02.hs-regensburg.de (Postfix) with ESMTPS id 45L5wC5vmYzyMZ;
	Fri,  7 Jun 2019 17:26:19 +0200 (CEST)
Received: from [IPv6:2001:638:a01:8061:aefd:ceff:fef3:ba65]
 (2001:638:a01:8013::138) by E16S02.hs-regensburg.de (2001:638:a01:8013::92)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1713.5; Fri, 7 Jun 2019
 17:26:19 +0200
Subject: Re: [PATCH v2 4/6] inmates: x86: discover and activate SSE/AVX
To: Jan Kiszka <jan.kiszka@siemens.com>, <jailhouse-dev@googlegroups.com>
References: <20190521143423.17734-1-ralf.ramsauer@oth-regensburg.de>
 <20190521143423.17734-5-ralf.ramsauer@oth-regensburg.de>
 <eca382c5-96bb-352f-d06a-6f92f25088d0@web.de>
 <c6d1eef6-0730-68b2-8fc2-5fd2b3c5b81e@oth-regensburg.de>
 <fdb84e17-c70f-9818-a3b3-2bf5a4f18ed3@siemens.com>
 <de841457-a95f-6ddb-6c53-09c14f64403d@oth-regensburg.de>
From: Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>
Openpgp: preference=signencrypt
Message-ID: <eb711300-b19c-053e-21c7-721bab566b07@oth-regensburg.de>
Date: Fri, 7 Jun 2019 17:26:19 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.0
MIME-Version: 1.0
In-Reply-To: <de841457-a95f-6ddb-6c53-09c14f64403d@oth-regensburg.de>
Content-Type: text/plain; charset="UTF-8"
Content-Language: de-DE
Content-Transfer-Encoding: quoted-printable
X-Originating-IP: [2001:638:a01:8013::138]
X-ClientProxiedBy: E16S01.hs-regensburg.de (2001:638:a01:8013::91) To
 E16S02.hs-regensburg.de (2001:638:a01:8013::92)
X-Original-Sender: ralf.ramsauer@oth-regensburg.de
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass
 header.i=@oth-regensburg.de header.s=mta01-20160622 header.b=pWCWWuAI;
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



On 5/31/19 8:39 PM, Ralf Ramsauer wrote:
>=20
>=20
> On 5/31/19 12:04 PM, Jan Kiszka wrote:
>> On 31.05.19 17:52, Ralf Ramsauer wrote:
>>> On 5/30/19 3:00 AM, Jan Kiszka wrote:
>>>> On 21.05.19 16:34, Ralf Ramsauer wrote:
>>>>> Recent gcc versions emit SSE instructions for 32-bit inmates (e.g., i=
n
>>>>> hex2str or cmdline_parse routines). Inmates aren't able to execute
>>>>> those
>>>>> instructions as SSE is not enabled and will crash.
>>>>>
>>>>> Enabling SSE is the same code for 32 and 64 bit x86 and straight
>>>>> forward: Lookup SSE availability via cpuid and enable OSFXSR in cr4. =
If
>>>>> SSE is not available, stop the inmate.
>>>>>
>>>>> If AVX is available, activate it (XCR0).
>>>>>
>>>>> Lookup features that need no explicit activation.
>>>>>
>>>>> Signed-off-by: Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>
>>>>> ---
>>>>> =C2=A0=C2=A0 inmates/lib/x86/Makefile=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0=C2=A0 6 +-
>>>>> =C2=A0=C2=A0 inmates/lib/x86/cpu-features.c=C2=A0=C2=A0=C2=A0=C2=A0 |=
 103
>>>>> +++++++++++++++++++++++++++++
>>>>> =C2=A0=C2=A0 inmates/lib/x86/header-32.S=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 |=C2=A0=C2=A0 9 ++-
>>>>> =C2=A0=C2=A0 inmates/lib/x86/header-64.S=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 |=C2=A0=C2=A0 9 ++-
>>>>> =C2=A0=C2=A0 inmates/lib/x86/include/asm/regs.h |=C2=A0 36 ++++++++++
>>>>> =C2=A0=C2=A0 5 files changed, 158 insertions(+), 5 deletions(-)
>>>>> =C2=A0=C2=A0 create mode 100644 inmates/lib/x86/cpu-features.c
>>>>>
>>>>> diff --git a/inmates/lib/x86/Makefile b/inmates/lib/x86/Makefile
>>>>> index e474ffd0..ed3b04d5 100644
>>>>> --- a/inmates/lib/x86/Makefile
>>>>> +++ b/inmates/lib/x86/Makefile
>>>>> @@ -40,7 +40,7 @@ include $(INMATES_LIB)/Makefile.lib
>>>>>
>>>>> =C2=A0=C2=A0 always :=3D lib.a lib32.a
>>>>>
>>>>> -TARGETS :=3D header-common.o ioapic.o printk.o setup.o smp.o uart.o
>>>>> +TARGETS :=3D cpu-features.o header-common.o ioapic.o printk.o setup.=
o
>>>>> smp.o uart.o
>>>>> =C2=A0=C2=A0 TARGETS +=3D ../alloc.o ../pci.o ../string.o ../cmdline.=
o ../setup.o
>>>>> =C2=A0=C2=A0 TARGETS +=3D ../uart-8250.o ../printk.o
>>>>> =C2=A0=C2=A0 TARGETS_32_ONLY :=3D header-32.o
>>>>> @@ -57,6 +57,10 @@ $(obj)/lib32.a: $(addprefix $(obj)/,$(lib32-y))
>>>>>
>>>>> =C2=A0=C2=A0 targets +=3D header-32.o
>>>>>
>>>>> +# Code of this object is called before SSE/AVX is available. Ensure
>>>>> that the
>>>>> +# compiler won't generate unsupported instructions for this file.
>>>>> +CFLAGS_cpu-features.o +=3D -mno-sse
>>>>> +
>>>>> =C2=A0=C2=A0 $(obj)/%-32.o: c_flags +=3D -m32
>>>>> =C2=A0=C2=A0 $(obj)/%-32.o: $(src)/%.c
>>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 $(call if_changed_rule,cc_o_c)
>>>>> diff --git a/inmates/lib/x86/cpu-features.c
>>>>> b/inmates/lib/x86/cpu-features.c
>>>>> new file mode 100644
>>>>> index 00000000..9cf98543
>>>>> --- /dev/null
>>>>> +++ b/inmates/lib/x86/cpu-features.c
>>>>> @@ -0,0 +1,103 @@
>>>>> +/*
>>>>> + * Jailhouse, a Linux-based partitioning hypervisor
>>>>> + *
>>>>> + * Copyright (c) OTH Regensburg, 2019
>>>>> + *
>>>>> + * Authors:
>>>>> + *=C2=A0 Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>
>>>>> + *
>>>>> + * This work is licensed under the terms of the GNU GPL, version
>>>>> 2.=C2=A0 See
>>>>> + * the COPYING file in the top-level directory.
>>>>> + *
>>>>> + * Alternatively, you can use or redistribute this file under the
>>>>> following
>>>>> + * BSD license:
>>>>> + *
>>>>> + * Redistribution and use in source and binary forms, with or withou=
t
>>>>> + * modification, are permitted provided that the following condition=
s
>>>>> + * are met:
>>>>> + *
>>>>> + * 1. Redistributions of source code must retain the above copyright
>>>>> + *=C2=A0=C2=A0=C2=A0 notice, this list of conditions and the followi=
ng disclaimer.
>>>>> + *
>>>>> + * 2. Redistributions in binary form must reproduce the above
>>>>> copyright
>>>>> + *=C2=A0=C2=A0=C2=A0 notice, this list of conditions and the followi=
ng disclaimer in
>>>>> the
>>>>> + *=C2=A0=C2=A0=C2=A0 documentation and/or other materials provided w=
ith the
>>>>> distribution.
>>>>> + *
>>>>> + * THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND
>>>>> CONTRIBUTORS "AS IS"
>>>>> + * AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED
>>>>> TO, THE
>>>>> + * IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULA=
R
>>>>> PURPOSE
>>>>> + * ARE DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT HOLDER OR
>>>>> CONTRIBUTORS BE
>>>>> + * LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, =
OR
>>>>> + * CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT LIMITED TO,
>>>>> PROCUREMENT OF
>>>>> + * SUBSTITUTE GOODS OR SERVICES; LOSS OF USE, DATA, OR PROFITS; OR
>>>>> BUSINESS
>>>>> + * INTERRUPTION) HOWEVER CAUSED AND ON ANY THEORY OF LIABILITY,
>>>>> WHETHER IN
>>>>> + * CONTRACT, STRICT LIABILITY, OR TORT (INCLUDING NEGLIGENCE OR
>>>>> OTHERWISE)
>>>>> + * ARISING IN ANY WAY OUT OF THE USE OF THIS SOFTWARE, EVEN IF
>>>>> ADVISED OF
>>>>> + * THE POSSIBILITY OF SUCH DAMAGE.
>>>>> + */
>>>>> +
>>>>> +#include <inmate.h>
>>>>> +#include <asm/regs.h>
>>>>> +
>>>>> +/* Must only be called from assembler via jmp */
>>>>> +void arch_init_features(void);
>>>>> +
>>>>> +struct x86_cpu_features x86_cpu_features
>>>>> __attribute__((section(".data")));
>>>>> +
>>>>> +/*
>>>>> + * We arrive here very early, and we don't have a stack. Take care.
>>>>> + *
>>>>> + * Every booting CPU will call this function. We make the assumption
>>>>> that all
>>>>> + * CPUs have the same feature set. So we don't need any locks when
>>>>> writing to
>>>>> + * x86_cpu_features.
>>>
>>> Any comments on this? Is it okay that this code will run on each CPU,
>>> even if only required on the primary CPU?
>>>
>>
>> Running once on all CPUs is harmless - we are not in a hurry.
>>
>> Running without stack is a problem, see below.
>=20
> Depends. It's perfectly fine to have no stack if we don't use it (even
> if we had an corrupt stack=E2=80=A6).
>=20
>>
>>>>> + */
>>>>> +void __attribute__((naked, noreturn, section(".boot")))
>>>>
>>>> What's "naked" supposed to do here? The compilers says it will ignore
>>>> it.
>>>
>>> Huh? Does it produce a warning?
>>
>> Yes, gcc 7.4 said so.
>>
>>>
>>> naked ensures that there's no pro- and epilogue sequences. And as the
>>> comment states: We won't have a stack that early.
>>>
>>> BTW: That raises a question: Where do we set the stack for secondary
>>> CPUs on x86?
>>
>> In header.S, always to stack_top... Looks like the ARM issue is still
>> present here.
>=20
> I remember that I once fixed some corrupted stack things for ARM
> inmates, but it was a bit different there.
>=20
> Trying to interpret your words: We're currently running on an
> overlapping stack for secondary (all) CPUs, right? Should probably be
> fixed first.
>=20
> Hmm. On x86 we're hlting all secondary CPUs very early and wait for a
> SIPI. Besides setting ap_entry, we could allocate a valid stack on the
> primary CPU inside smp_start_cpu() and pass it.

MMIO stuff is done, let's get back to this topic. :-)

The problem that I initially wanted to solve was missing SSE support,
turns out secondary CPUs in x86 have a broken stack.

There might be a clean solution to solve all issues, including the dirty
"naked jmp around"-hack:

Let's reconsider the early boot phase of x86 inmates. In comparison to
ARM, for example, we start all CPUs but halt secondary CPUs and wait for
SIPIs.

Now, we could provide a stack symbol that points to a free, valid stack
that a CPU can grab. Initially, (by compile time) the symbol holds the
address of the stack for the primary CPU. It's yet unclear who will win
the race to be the primary CPU.

We could cmpxchg the content of this symbol *very* early. Whoever wins
is the primary CPU, everyone else will read zero and simply put the CPU
in hlt state.

When starting secondary CPUs, smp_start_cpu() alloc()s a new stack from
the heap, sets the stack symbol (and sets ap_entry) and kicks the CPU.
Now the same startup code will run, but the secondary CPU grabs the
stack and boots.

This has some advantages:
  - We have a valid stack very early, and can jump to C back and forth
    with regular calls instead of the hacky hack above.
  - Startup code will only run once when needed, and not multiple times
    as it is the case at the moment
  - Every secondary CPU gets its own clean stack (which is broken atm)
  - Still we maintain shared startup code for primary and secondary
    CPUs.

Does that sound reasonable? I'd just like to hear some feedback before I
start hacking, as this could become a bit more complex, yet another
time. :-)

  Ralf


>=20
>>
>>>
>>>>
>>>>> +arch_init_features(void)
>>>>> +{
>>>>> +=C2=A0=C2=A0=C2=A0 register u64 features;
>>>>> +
>>>>> +=C2=A0=C2=A0=C2=A0 features =3D cpuid_edx(X86_CPUID_FEATURES, 0);
>>>>> +=C2=A0=C2=A0=C2=A0 /* Check availability of FPU */
>>>>> +=C2=A0=C2=A0=C2=A0 x86_cpu_features.fpu =3D !!(features & X86_FEATUR=
E_FPU);
>>>>> +
>>>>> +=C2=A0=C2=A0=C2=A0 /* Discover and enable FXSR */
>>>>> +=C2=A0=C2=A0=C2=A0 if (features & X86_FEATURE_FXSR) {
>>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 write_cr4(read_cr4() | X8=
6_CR4_OSFXSR);
>>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 x86_cpu_features.fxsr =3D=
 true;
>>>>> +=C2=A0=C2=A0=C2=A0 }
>>>
>>> BTW: Another point that I realised in the meanwhile: AFAICT, the
>>> hypervisor will very likely hand over with OSFXSR enabled as it is set
>>> by the cr4_required1 mask.
>>
>> The hypervisor hands over in reset state, and there these features are o=
ff.
>=20
> Ahm. No. On a real AMD machine that's true, yes.
>=20
> But it behaves differently on Qemu x86: CR4 is handed over with 0x2020,
> which means OSFXSR | PVI. And even if I try to deactivate, it won't
> work. Look at this inmate code:
>=20
>        printk("CR4 handover: 0x%lx\n", read_cr4());
>        write_cr4(read_cr4() & ~0x2000);
>        printk("CR4 now: 0x%lx\n", read_cr4());
>=20
> will output:
> CR4 handover: 0x2020
> CR4 now: 0x2020
>=20
> CR4 is write-intercepted, and vmx_set_guest_cr in vmx.c:443 will set it
> again on interception.
>=20
>>
>>>
>>> Nevertheless, it should be properly set.
>>>
>>>>> +
>>>>> +=C2=A0=C2=A0=C2=A0 /* Check availability of SSE */
>>>>> +=C2=A0=C2=A0=C2=A0 x86_cpu_features.sse =3D !!(features & X86_FEATUR=
E_SSE);
>>>>> +=C2=A0=C2=A0=C2=A0 x86_cpu_features.sse2 =3D !!(features & X86_FEATU=
RE_SSE2);
>>>>> +
>>>>> +=C2=A0=C2=A0=C2=A0 /* ECX hides the rest */
>>>>> +=C2=A0=C2=A0=C2=A0 features =3D cpuid_ecx(X86_CPUID_FEATURES, 0);
>>>>> +=C2=A0=C2=A0=C2=A0 x86_cpu_features.sse3 =3D !!(features & X86_FEATU=
RE_SSE3);
>>>>> +=C2=A0=C2=A0=C2=A0 x86_cpu_features.sse4_1 =3D !!(features & X86_FEA=
TURE_SSE4_1);
>>>>> +=C2=A0=C2=A0=C2=A0 x86_cpu_features.sse4_2 =3D !!(features & X86_FEA=
TURE_SSE4_2);
>>>>> +=C2=A0=C2=A0=C2=A0 x86_cpu_features.pclmulqdq =3D !!(features & X86_=
FEATURE_PCLMULQDQ);
>>>>> +
>>>>> +=C2=A0=C2=A0=C2=A0 if (features & X86_FEATURE_XSAVE) {
>>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 /* Enable XSAVE related i=
nstructions */
>>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 write_cr4(read_cr4() | X8=
6_CR4_OSXSAVE);
>>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 x86_cpu_features.xsave =
=3D true;
>>>>> +
>>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 /*
>>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 * Intel SDM 13.2: A=
 bit can be set in XCR0 if and only if the
>>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 * corresponding bit=
 is set in this bitmap.=C2=A0 Every processor
>>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 * that supports the=
 XSAVE feature set will set EAX[0] (x87
>>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 * state) and EAX[1]=
 (SSE state).
>>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 *
>>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 * We can always saf=
ely write SSE + FP, but only set AVX if
>>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 * available.
>>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 */
>>>>> +
>>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 features =3D cpuid_edax(X=
86_CPUID_XSTATE, 0);
>>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 write_xcr0(read_xcr0() | =
(features & X86_XCR0_AVX) | \
>>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0 X86_XCR0_SSE | X86_XCR0_X87);
>>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 x86_cpu_features.avx =3D =
!!(features & X86_XCR0_AVX);
>>>>> +=C2=A0=C2=A0=C2=A0 }
>>>>> +
>>>>> +=C2=A0=C2=A0=C2=A0 /* hand control back to assembler */
>>>>> +=C2=A0=C2=A0=C2=A0 asm volatile("jmp x86_start\t\n");
>>>>
>>>> Hacky... Is there no stack yet to do proper call/ret?
>>>
>>> See above, no stack. But I agree on hacky. :-)
>>>
>>>>
>>>> But if you want to / have to use a jmp here, you need to tell the
>>>> compiler that
>>>> this will never "return" (__builtin_unreachable).
>>>
>>> What's the difference between noreturn and builtin_unreachable?
>>
>> The former declares it for the function and, thus, also informs its
>> callers, the latter marks that some line is never reached. That is
>> needed when you call something that is noreturn but does not declare it
>> (like your inline assembly).
>>
>>>
>>> The noreturn attribute makes sure that - besides the epilogue, we won't
>>> have a ret.
>>
>> The compiler should have barked at you that your noreturn function seems
>> to return (the compiler has no idea about the semantic of the inline
>> assembly).
>=20
> I used gcc 8.3.0. No complaints. Anyway, I get your point.
>=20
>   Ralf
>=20
>>
>> Jan
>>
>=20

--=20
You received this message because you are subscribed to the Google Groups "=
Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/=
jailhouse-dev/eb711300-b19c-053e-21c7-721bab566b07%40oth-regensburg.de.
For more options, visit https://groups.google.com/d/optout.
