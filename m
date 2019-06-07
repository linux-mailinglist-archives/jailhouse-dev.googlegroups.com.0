Return-Path: <jailhouse-dev+bncBCJI7SMNV4NBBANC5LTQKGQEI4E54IY@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-wm1-x33d.google.com (mail-wm1-x33d.google.com [IPv6:2a00:1450:4864:20::33d])
	by mail.lfdr.de (Postfix) with ESMTPS id 52A4539216
	for <lists+jailhouse-dev@lfdr.de>; Fri,  7 Jun 2019 18:29:54 +0200 (CEST)
Received: by mail-wm1-x33d.google.com with SMTP id w126sf573590wmb.0
        for <lists+jailhouse-dev@lfdr.de>; Fri, 07 Jun 2019 09:29:54 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1559924994; cv=pass;
        d=google.com; s=arc-20160816;
        b=cihXf4FR943u2JaIZHTADXo8r+oqL891IYlJ4+DCme+kL2lpRKWk6FhGDKU/Vbk4Te
         F4WWIKEVe/nVGbrVoGHhA2ppSHOchtRGlmkBquC1ka39WJ2occ6UfvDRu/j7XQjuqnkm
         WgJ2fRSz0q+xTp32EaMNwHEKZXHfDZx9S9cFxSYInS5UeJmxnmEpqPI33m+OKp541OTP
         WHNUZpzY3BjWyDKI27n5yZPT10eMCFiUs392VyXZeJfnaPyuFFUz0Be2cJlsszqydB+x
         3dwhoxv1d8zYXNhDENDzz6sMq91VH675BfXMkAFTvVlGi0BpAlBe3FBCTXBJXGfAFajI
         KNtA==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject:sender:dkim-signature;
        bh=tcYnmr01TLrqFoCC1/L0ZnznuzkE1ad/tN6R+XggZkA=;
        b=xfsprB4F3tnV6t0e3KxNBi40acovfGAf90uFcjXFY6xEu2JhTE+IrLDLd6irY2iaxi
         LDlkHG633njWmm6TrFVDzuffH9njefUbdaYecLbbK2Ke0L0FXSwKkDe++XkQtKLOYMHo
         vkJb70NqqhWrnjHHoFsF5BtaS/ROz2hiVx4+uaS9HTY64Hd0QVoOy/epYyo0sUMTgw/C
         3MylFWmqoXoEW3aJsKryUxqAVdI/9cebG8GCMTQc1WiD8HUeIrFJoxx1QkdM0MC2Hnpg
         +xv7+Jzcijyp9cNgu9tgbl4Z9lZJ1qwD3vp0jVgtq5okEdMR+FH8agX1Z2KcgI7pKC4K
         SBAg==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.2 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:subject:to:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding
         :x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=tcYnmr01TLrqFoCC1/L0ZnznuzkE1ad/tN6R+XggZkA=;
        b=CPMSKznmCQtdmlXx7XaVXJqYxpg15htrR6cNbkqccIeymCqzzwMB77OiUzI/XyRW7H
         5wO7oxy7g3tjdlI75Z0008BLP85ku9RcfO5hR3jZxjfIDh6z5QfCzFSMk3GrMmjqzOHV
         0Y3wTvYRNIaUPTgauKBKO9W+eDM2WSkyV0fCS067Uvjw9YHW9vxpSgvgOb5LWWR34IEn
         3So28Zr6WfmOeq6IcdWDMKcQgVHwvojXZy2sNFVVW3sXsRjOKBsry4BH4R+fx4QcRIHQ
         Zv+sE/PWCmwAj7OoSaxUV/U58ElHVv0CjFiQqotMJwdo2312702O/zx60FUbriBy/dvX
         ovow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:subject:to:references:from:message-id
         :date:user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :x-spam-checked-in-group:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=tcYnmr01TLrqFoCC1/L0ZnznuzkE1ad/tN6R+XggZkA=;
        b=nyT6xjLZWmtZsKE5f4V2/Gn52Atrys5OTNix538rSL4GEzRQjOz+ZSDXNXPwlBeLfl
         DNktiW3nh2Ah22ZtkDFFsevalLqzDWm9hnavnxp5gVhrl5wNgwkjKvlqMP8lUCeeqD/k
         EUg55/rQqMHMOlTC5AjjcOEYBCjdRiSgjGNkto9/ZZdQr3eYE5Ecxf31FzSFw8aMP3p2
         2GvkFMaU1xiqJcBM1gqYQgIq2FufxDUSWPgth5Cvam6hWm0Zz3mEiqHiKxSvMuNYTxrh
         roXfWRycfcd3uQcdUig0PqazkzjNaHBfr/UXPSvy3fwIoMZ3I0piaBoWpE61jzRnjjwl
         2D4Q==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: APjAAAX4apXGpqf1COsUa+NIIKttV1E6VsGYI1UgxBqoORPAOdrKxaro
	JXECtQ2NqqDgaKr/oUQCpe4=
X-Google-Smtp-Source: APXvYqxno+rUtBXYTwOLgO8WND+p8zgQQyZyqVSvZNm6LH+2ZFC23QED0gMFKtKYnvdUt+06xxQIeg==
X-Received: by 2002:a1c:e702:: with SMTP id e2mr4350365wmh.38.1559924993928;
        Fri, 07 Jun 2019 09:29:53 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:adf:edce:: with SMTP id v14ls2198042wro.4.gmail; Fri, 07 Jun
 2019 09:29:53 -0700 (PDT)
X-Received: by 2002:adf:ebc6:: with SMTP id v6mr5273379wrn.258.1559924993254;
        Fri, 07 Jun 2019 09:29:53 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1559924993; cv=none;
        d=google.com; s=arc-20160816;
        b=g4Qgs9G5swqrqQvGRgB9WmWz4GfEKxK7AmiztrOfFOZwHemRNo3U90Qo7pbjEf0cuu
         TekRxhrXUsw2BdMwPqBTbm1RWgljhyQ/suYieSHlWYxY1nwrO9pBoJ/FPYW0mzr5+qJC
         PfkQBqOD5foV6NHRLeoaKP1qm3Og6QCevLP3uqmR1i8vBNyomwTe6oVMc+MxMiJYWodA
         w4/fDPT039+COcWc8ic/oGneFVzuZdv5FldiqET8bjaDZdFqlEIuo1qgfvVc0GUFW4P0
         F3EKiKmFB94uPqrRjDkXp7n+7EcMTm7M7fVrNC84EOM5jhgzPKzd0Xnf1UoJCDJKtxXa
         WRDA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:to:subject;
        bh=tusxzuhTbrIx6RErK2a9Ny0gNNk/2EgOcn7cjNWw5ZQ=;
        b=KVZfpXZVbqndxuQY8pP4GLnJZPCWlp6aTDGYWO/lOqvcqG7ZIfSNT9eIGxeuxoqx0O
         qZONVwzTn5xqWo93ndENwjgIjKpgTzVJMuFk3J/LqR2L6LYnAcVIdkfEaAdyIl6ZAdAH
         vihy6y2/O4n9TBlj+yaqcsJjO/ju+h60RS/eDRnRlGF9pBX8KCRTiXSwwY9glAXXGD3d
         REdY9VdsCYfRfeRkXQDXJBjAtYv5xuboD1ix/n6btTO7oebJAZMiqth5RehX2gwm6XXF
         zPHdJBIeBkalvVyB1dmBOW+XSkWIxVtpjPdbVbeEXxubeIdBLjBO04iHGaiJwe7/dQnR
         gU6Q==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.2 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
Received: from thoth.sbs.de (thoth.sbs.de. [192.35.17.2])
        by gmr-mx.google.com with ESMTPS id y139si117681wmd.0.2019.06.07.09.29.53
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 07 Jun 2019 09:29:53 -0700 (PDT)
Received-SPF: pass (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.2 as permitted sender) client-ip=192.35.17.2;
Received: from mail1.sbs.de (mail1.sbs.de [192.129.41.35])
	by thoth.sbs.de (8.15.2/8.15.2) with ESMTPS id x57GTqwq020191
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 7 Jun 2019 18:29:53 +0200
Received: from [167.87.4.234] ([167.87.4.234])
	by mail1.sbs.de (8.15.2/8.15.2) with ESMTP id x57GTpBk018166;
	Fri, 7 Jun 2019 18:29:52 +0200
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
 <af3e89c4-5d33-e6c8-3ba4-6b6ca6d4a409@siemens.com>
 <ce3aaf2a-e8a1-9e07-ea14-0ee9360271b4@oth-regensburg.de>
From: Jan Kiszka <jan.kiszka@siemens.com>
Message-ID: <23803b48-aef5-781d-b6de-6fdf0ad17dcf@siemens.com>
Date: Fri, 7 Jun 2019 18:29:51 +0200
User-Agent: Mozilla/5.0 (X11; U; Linux i686 (x86_64); de; rv:1.8.1.12)
 Gecko/20080226 SUSE/2.0.0.12-1.1 Thunderbird/2.0.0.12 Mnenhy/0.7.5.666
MIME-Version: 1.0
In-Reply-To: <ce3aaf2a-e8a1-9e07-ea14-0ee9360271b4@oth-regensburg.de>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable
X-Original-Sender: jan.kiszka@siemens.com
X-Original-Authentication-Results: gmr-mx.google.com;       spf=pass
 (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.2 as
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

On 07.06.19 18:12, Ralf Ramsauer wrote:
> On 6/7/19 5:52 PM, Jan Kiszka wrote:
>> On 07.06.19 17:26, Ralf Ramsauer wrote:
>>>
>>>
>>> On 5/31/19 8:39 PM, Ralf Ramsauer wrote:
>>>>
>>>>
>>>> On 5/31/19 12:04 PM, Jan Kiszka wrote:
>>>>> On 31.05.19 17:52, Ralf Ramsauer wrote:
>>>>>> On 5/30/19 3:00 AM, Jan Kiszka wrote:
>>>>>>> On 21.05.19 16:34, Ralf Ramsauer wrote:
>>>>>>>> Recent gcc versions emit SSE instructions for 32-bit inmates
>>>>>>>> (e.g., in
>>>>>>>> hex2str or cmdline_parse routines). Inmates aren't able to execute
>>>>>>>> those
>>>>>>>> instructions as SSE is not enabled and will crash.
>>>>>>>>
>>>>>>>> Enabling SSE is the same code for 32 and 64 bit x86 and straight
>>>>>>>> forward: Lookup SSE availability via cpuid and enable OSFXSR in
>>>>>>>> cr4. If
>>>>>>>> SSE is not available, stop the inmate.
>>>>>>>>
>>>>>>>> If AVX is available, activate it (XCR0).
>>>>>>>>
>>>>>>>> Lookup features that need no explicit activation.
>>>>>>>>
>>>>>>>> Signed-off-by: Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>
>>>>>>>> ---
>>>>>>>>  =C2=A0=C2=A0=C2=A0 inmates/lib/x86/Makefile=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0=C2=A0 6 +-
>>>>>>>>  =C2=A0=C2=A0=C2=A0 inmates/lib/x86/cpu-features.c=C2=A0=C2=A0=C2=
=A0=C2=A0 | 103
>>>>>>>> +++++++++++++++++++++++++++++
>>>>>>>>  =C2=A0=C2=A0=C2=A0 inmates/lib/x86/header-32.S=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0=C2=A0 9 ++-
>>>>>>>>  =C2=A0=C2=A0=C2=A0 inmates/lib/x86/header-64.S=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0=C2=A0 9 ++-
>>>>>>>>  =C2=A0=C2=A0=C2=A0 inmates/lib/x86/include/asm/regs.h |=C2=A0 36 =
++++++++++
>>>>>>>>  =C2=A0=C2=A0=C2=A0 5 files changed, 158 insertions(+), 5 deletion=
s(-)
>>>>>>>>  =C2=A0=C2=A0=C2=A0 create mode 100644 inmates/lib/x86/cpu-feature=
s.c
>>>>>>>>
>>>>>>>> diff --git a/inmates/lib/x86/Makefile b/inmates/lib/x86/Makefile
>>>>>>>> index e474ffd0..ed3b04d5 100644
>>>>>>>> --- a/inmates/lib/x86/Makefile
>>>>>>>> +++ b/inmates/lib/x86/Makefile
>>>>>>>> @@ -40,7 +40,7 @@ include $(INMATES_LIB)/Makefile.lib
>>>>>>>>
>>>>>>>>  =C2=A0=C2=A0=C2=A0 always :=3D lib.a lib32.a
>>>>>>>>
>>>>>>>> -TARGETS :=3D header-common.o ioapic.o printk.o setup.o smp.o uart=
.o
>>>>>>>> +TARGETS :=3D cpu-features.o header-common.o ioapic.o printk.o set=
up.o
>>>>>>>> smp.o uart.o
>>>>>>>>  =C2=A0=C2=A0=C2=A0 TARGETS +=3D ../alloc.o ../pci.o ../string.o .=
./cmdline.o
>>>>>>>> ../setup.o
>>>>>>>>  =C2=A0=C2=A0=C2=A0 TARGETS +=3D ../uart-8250.o ../printk.o
>>>>>>>>  =C2=A0=C2=A0=C2=A0 TARGETS_32_ONLY :=3D header-32.o
>>>>>>>> @@ -57,6 +57,10 @@ $(obj)/lib32.a: $(addprefix $(obj)/,$(lib32-y))
>>>>>>>>
>>>>>>>>  =C2=A0=C2=A0=C2=A0 targets +=3D header-32.o
>>>>>>>>
>>>>>>>> +# Code of this object is called before SSE/AVX is available. Ensu=
re
>>>>>>>> that the
>>>>>>>> +# compiler won't generate unsupported instructions for this file.
>>>>>>>> +CFLAGS_cpu-features.o +=3D -mno-sse
>>>>>>>> +
>>>>>>>>  =C2=A0=C2=A0=C2=A0 $(obj)/%-32.o: c_flags +=3D -m32
>>>>>>>>  =C2=A0=C2=A0=C2=A0 $(obj)/%-32.o: $(src)/%.c
>>>>>>>>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 $(call if_changed_rule=
,cc_o_c)
>>>>>>>> diff --git a/inmates/lib/x86/cpu-features.c
>>>>>>>> b/inmates/lib/x86/cpu-features.c
>>>>>>>> new file mode 100644
>>>>>>>> index 00000000..9cf98543
>>>>>>>> --- /dev/null
>>>>>>>> +++ b/inmates/lib/x86/cpu-features.c
>>>>>>>> @@ -0,0 +1,103 @@
>>>>>>>> +/*
>>>>>>>> + * Jailhouse, a Linux-based partitioning hypervisor
>>>>>>>> + *
>>>>>>>> + * Copyright (c) OTH Regensburg, 2019
>>>>>>>> + *
>>>>>>>> + * Authors:
>>>>>>>> + *=C2=A0 Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>
>>>>>>>> + *
>>>>>>>> + * This work is licensed under the terms of the GNU GPL, version
>>>>>>>> 2.=C2=A0 See
>>>>>>>> + * the COPYING file in the top-level directory.
>>>>>>>> + *
>>>>>>>> + * Alternatively, you can use or redistribute this file under the
>>>>>>>> following
>>>>>>>> + * BSD license:
>>>>>>>> + *
>>>>>>>> + * Redistribution and use in source and binary forms, with or
>>>>>>>> without
>>>>>>>> + * modification, are permitted provided that the following
>>>>>>>> conditions
>>>>>>>> + * are met:
>>>>>>>> + *
>>>>>>>> + * 1. Redistributions of source code must retain the above
>>>>>>>> copyright
>>>>>>>> + *=C2=A0=C2=A0=C2=A0 notice, this list of conditions and the foll=
owing disclaimer.
>>>>>>>> + *
>>>>>>>> + * 2. Redistributions in binary form must reproduce the above
>>>>>>>> copyright
>>>>>>>> + *=C2=A0=C2=A0=C2=A0 notice, this list of conditions and the foll=
owing
>>>>>>>> disclaimer in
>>>>>>>> the
>>>>>>>> + *=C2=A0=C2=A0=C2=A0 documentation and/or other materials provide=
d with the
>>>>>>>> distribution.
>>>>>>>> + *
>>>>>>>> + * THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND
>>>>>>>> CONTRIBUTORS "AS IS"
>>>>>>>> + * AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT
>>>>>>>> LIMITED
>>>>>>>> TO, THE
>>>>>>>> + * IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A
>>>>>>>> PARTICULAR
>>>>>>>> PURPOSE
>>>>>>>> + * ARE DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT HOLDER OR
>>>>>>>> CONTRIBUTORS BE
>>>>>>>> + * LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL,
>>>>>>>> EXEMPLARY, OR
>>>>>>>> + * CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT LIMITED TO,
>>>>>>>> PROCUREMENT OF
>>>>>>>> + * SUBSTITUTE GOODS OR SERVICES; LOSS OF USE, DATA, OR PROFITS; O=
R
>>>>>>>> BUSINESS
>>>>>>>> + * INTERRUPTION) HOWEVER CAUSED AND ON ANY THEORY OF LIABILITY,
>>>>>>>> WHETHER IN
>>>>>>>> + * CONTRACT, STRICT LIABILITY, OR TORT (INCLUDING NEGLIGENCE OR
>>>>>>>> OTHERWISE)
>>>>>>>> + * ARISING IN ANY WAY OUT OF THE USE OF THIS SOFTWARE, EVEN IF
>>>>>>>> ADVISED OF
>>>>>>>> + * THE POSSIBILITY OF SUCH DAMAGE.
>>>>>>>> + */
>>>>>>>> +
>>>>>>>> +#include <inmate.h>
>>>>>>>> +#include <asm/regs.h>
>>>>>>>> +
>>>>>>>> +/* Must only be called from assembler via jmp */
>>>>>>>> +void arch_init_features(void);
>>>>>>>> +
>>>>>>>> +struct x86_cpu_features x86_cpu_features
>>>>>>>> __attribute__((section(".data")));
>>>>>>>> +
>>>>>>>> +/*
>>>>>>>> + * We arrive here very early, and we don't have a stack. Take car=
e.
>>>>>>>> + *
>>>>>>>> + * Every booting CPU will call this function. We make the
>>>>>>>> assumption
>>>>>>>> that all
>>>>>>>> + * CPUs have the same feature set. So we don't need any locks whe=
n
>>>>>>>> writing to
>>>>>>>> + * x86_cpu_features.
>>>>>>
>>>>>> Any comments on this? Is it okay that this code will run on each CPU=
,
>>>>>> even if only required on the primary CPU?
>>>>>>
>>>>>
>>>>> Running once on all CPUs is harmless - we are not in a hurry.
>>>>>
>>>>> Running without stack is a problem, see below.
>>>>
>>>> Depends. It's perfectly fine to have no stack if we don't use it (even
>>>> if we had an corrupt stack=E2=80=A6).
>>>>
>>>>>
>>>>>>>> + */
>>>>>>>> +void __attribute__((naked, noreturn, section(".boot")))
>>>>>>>
>>>>>>> What's "naked" supposed to do here? The compilers says it will igno=
re
>>>>>>> it.
>>>>>>
>>>>>> Huh? Does it produce a warning?
>>>>>
>>>>> Yes, gcc 7.4 said so.
>>>>>
>>>>>>
>>>>>> naked ensures that there's no pro- and epilogue sequences. And as th=
e
>>>>>> comment states: We won't have a stack that early.
>>>>>>
>>>>>> BTW: That raises a question: Where do we set the stack for secondary
>>>>>> CPUs on x86?
>>>>>
>>>>> In header.S, always to stack_top... Looks like the ARM issue is still
>>>>> present here.
>>>>
>>>> I remember that I once fixed some corrupted stack things for ARM
>>>> inmates, but it was a bit different there.
>>>>
>>>> Trying to interpret your words: We're currently running on an
>>>> overlapping stack for secondary (all) CPUs, right? Should probably be
>>>> fixed first.
>>>>
>>>> Hmm. On x86 we're hlting all secondary CPUs very early and wait for a
>>>> SIPI. Besides setting ap_entry, we could allocate a valid stack on the
>>>> primary CPU inside smp_start_cpu() and pass it.
>>>
>>> MMIO stuff is done, let's get back to this topic. :-)
>>
>> Yeah, right... I was close to pushing "--no-sse" today when I recalled
>> that you are on this ;)
>>
>>>
>>> The problem that I initially wanted to solve was missing SSE support,
>>> turns out secondary CPUs in x86 have a broken stack.
>>>
>>> There might be a clean solution to solve all issues, including the dirt=
y
>>> "naked jmp around"-hack:
>>>
>>> Let's reconsider the early boot phase of x86 inmates. In comparison to
>>> ARM, for example, we start all CPUs but halt secondary CPUs and wait fo=
r
>>> SIPIs.
>>>
>>> Now, we could provide a stack symbol that points to a free, valid stack
>>> that a CPU can grab. Initially, (by compile time) the symbol holds the
>>> address of the stack for the primary CPU. It's yet unclear who will win
>>> the race to be the primary CPU.
>>>
>>> We could cmpxchg the content of this symbol *very* early. Whoever wins
>>> is the primary CPU, everyone else will read zero and simply put the CPU
>>> in hlt state.
>>
>> That's what we do today already: Only the first CPU gets the static
>> stack, the rest enter a hlt loop until their inmate-triggered wakeup
>> without touching that stack. No problem here.
>=20
> Hmm. We go through start16 start32 and start64 until we reach the point
> where we check the CPU ID, and setup the stack. And everything we do
> during this path (lgdtl, cr0/4 setup, =E2=80=A6) will be executed twice: =
On the
> initial startup, and on the SIPI.

We do NOT set up the stack: if the CPU is no the first one, we stop:

         cmp $0,%edi
         jne stop

Yes, we do the initialization twice - but please do not optimize the slow-p=
ath here.

>=20
> When we receive the SIPI, can't we simply assume that everything but the
> stack is already set up and in place? So all we would have to do is
> setup the stack, get the entry point and call it. Or am I missing
> something here?

INIT/SIPI implies CPU reset on x86 -> back to real-mode etc.

>=20
>>
>>>
>>> When starting secondary CPUs, smp_start_cpu() alloc()s a new stack from
>>> the heap, sets the stack symbol (and sets ap_entry) and kicks the CPU.
>>> Now the same startup code will run, but the secondary CPU grabs the
>>> stack and boots.
>>
>> Right, we need to make "mov $stack_top,%rsp" configurable, and the
>> problem should be solved. For the first CPU, it can remain that static o=
ne.
>>
>>>
>>> This has some advantages:
>>>  =C2=A0=C2=A0 - We have a valid stack very early, and can jump to C bac=
k and forth
>>>  =C2=A0=C2=A0=C2=A0=C2=A0 with regular calls instead of the hacky hack =
above.
>>>  =C2=A0=C2=A0 - Startup code will only run once when needed, and not mu=
ltiple times
>>>  =C2=A0=C2=A0=C2=A0=C2=A0 as it is the case at the moment
>>
>> Startup should happen via INIT/SIPI, so some bits have to be run again.
>=20
> Ok, maybe I lack some architectural knowledge: in which state do we
> arrive when we receive the SIPI? And why is it written twice?

INIT does the reset, SIPI defines the startup address and kicks off. Callin=
g it=20
twice is due to some timing things on real HW - IIRC. We just copied the co=
mmon=20
pattern.

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
jailhouse-dev/23803b48-aef5-781d-b6de-6fdf0ad17dcf%40siemens.com.
For more options, visit https://groups.google.com/d/optout.
