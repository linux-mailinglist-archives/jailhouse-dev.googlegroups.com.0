Return-Path: <jailhouse-dev+bncBCJI7SMNV4NBBINBYXTQKGQE4CWSO5A@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-wm1-x340.google.com (mail-wm1-x340.google.com [IPv6:2a00:1450:4864:20::340])
	by mail.lfdr.de (Postfix) with ESMTPS id A0050311EC
	for <lists+jailhouse-dev@lfdr.de>; Fri, 31 May 2019 18:04:50 +0200 (CEST)
Received: by mail-wm1-x340.google.com with SMTP id 20sf3722448wma.2
        for <lists+jailhouse-dev@lfdr.de>; Fri, 31 May 2019 09:04:50 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1559318690; cv=pass;
        d=google.com; s=arc-20160816;
        b=gUulzbuM4LSKTLBfEOgqAxYAO/7+B3Z9u14sFmV7WRpRvlOItDpWyeWRQmL5k84r+B
         d123kxGEGKpTeZVCkag8k+G3wuG00X9FrZorGcYnDfQBBLWHalh7InN49ZrHvAaXqB/d
         G1WP3XAdgevALPad20znYKRWSubxSka47SA/5f6+oBrJ7UaK4W0BqidOEAwtZfwoY+md
         SrEN9RuIqyfzOSwwCSeENF9foDMM9jTrQUKepXFu/hDBpDjk6vTesXfUuvj4thMq+ENs
         Eezh+sXcMuUWDVId16OAbieZqy0+kjUm4cDzQ6NLOgHxEZMh5+4hpElUg471NqGIMrta
         wgow==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject:sender:dkim-signature;
        bh=YjDRjOMfVyAnyALF/hlntqcaq5Q8PRh8YGO5VTjAooQ=;
        b=QA9y8RaYD10rlNCiteZ6N017fuSUbP0Q+wKc4IJARBOd29I/qo4lZjnP1t9xubDL5q
         Pb5LPMUVFloCoCpy/U8+ksm95H80NVs/1o8n8DX1ipuiNTVaPAw7Bv7Zz05lcg1joJqA
         Bj26sP7ibib8EikYmr8eTwThdQrv+vLCgkHuXuajDFqjhNRdiRW58E4PKrUSlTw9714g
         Cu1VcGz0vngisVCLA2/KYJI2zuxdAdNv/3z69955HYZulPSPQbWMsfxMMxPbdTkBXl8K
         OZtUxHwfA3rYaqiYnPmeEybJ/rxt1g/hpyBIOeNi1QsR5SCYwUcnJf2aFwtU85HgIVx6
         wVNQ==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 194.138.37.40 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:subject:to:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding
         :x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=YjDRjOMfVyAnyALF/hlntqcaq5Q8PRh8YGO5VTjAooQ=;
        b=lqsEUUaM3wbXW569ylrgELFw4PLwJezvhPPrmp16Lghq3Uih01WRRakgNjZBbXiz3O
         f1StpgCv+vClVDMumNdAIB9TtLOkBUe7xj/EWtWkBrJlyK4o5ToGtSx9xyUN86HhiG/M
         wc5cOvTtFKbQvDoVw+jJTHzZyjA6Jbr2P+nX6wNaa11SkV6rJsVc3wWcKpFMsygj4njq
         P70gKgprGnEDiJHFCMDttWJQfuz8sgaWoexN/WuCzUxgoYEQhZDLUGad7G1s1RYK01e5
         szuIFQllPcHrbdVHT/14tx41KuVHK+qiy6j3EJdQ5450tH0NbI58kJoR83rTRj5pFyk3
         ZfQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:subject:to:references:from:message-id
         :date:user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :x-spam-checked-in-group:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=YjDRjOMfVyAnyALF/hlntqcaq5Q8PRh8YGO5VTjAooQ=;
        b=MVh5Ov/6pI+Nmh0CxCRYLSxeNGjkA2tmNkNS9wrw7J9jed2sW10GaAkB+cw7wo0UeC
         2Dl1sPjvJpDzTP9ITcQbl7axCsVHTBvxlIcQDvjX3qX+ZscgimZO6mF1b2VqoKIcaGJ9
         A0Ebxz5oPy4xZfKfHi5VS2/+YHTfwTb2Pt6C8FAQVgdvUxpnDIz2nxuyVWe+OV8WmsbC
         E3PAQ1HF4x492M3GLBqZsknP+y/2ZW1jegLhn9rwzaS757/JH+2CxOto4Co1k5g35pcL
         HCCKW5H0QVnOJlwu4NAScJPAx62Xk5tfC64VebeeTLZCc+Nvo67ozUGQIFmu3Yq4fBnQ
         Rwug==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: APjAAAX44YcweXOHn9a17JqDTlyA0c65aOTlpXQPPW3zVnDU8CqzcGF+
	4g8JCwNTyv8XK6seU9kszpA=
X-Google-Smtp-Source: APXvYqxlTckxB0rWOuWMTogShEJ1CCQl1UuKX6og24WQXf6d9PDjQsIFchygZnq/FQry0J+urAby4w==
X-Received: by 2002:a7b:cc72:: with SMTP id n18mr6352441wmj.129.1559318690356;
        Fri, 31 May 2019 09:04:50 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a1c:9d45:: with SMTP id g66ls2527286wme.1.gmail; Fri, 31 May
 2019 09:04:49 -0700 (PDT)
X-Received: by 2002:a05:600c:228b:: with SMTP id 11mr6263563wmf.26.1559318689358;
        Fri, 31 May 2019 09:04:49 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1559318689; cv=none;
        d=google.com; s=arc-20160816;
        b=iqwRKPB/wXAl8vrgdu+fewitUksXtroKNzDbRuLkI0/WkwFVcv448Fpw0hhY2UiA4S
         7oqhkw4yZ98kOKM3RBGmFwJVbpSbG8lKwq2hQcQ53zYw7LtMbGkZ8aqCJ7+gkLesyiiL
         iJEWXHZqATIv9MV14GMVXVr44C0LH2SBYLR96QtOex+8VNvO7AG6d/M7CRwqAxrERcCC
         1qIBEj6x02sY4YVTp6nESBu4CnoCWCssWlcK624Rd/vr5VeBpWTNCuaKyJpIDNb9O1f+
         1fHcf0Pe4IvmyuUGB/OIy9cgDJyja+gI/01q+Oe7vozcUvh4h4qPM8oPLDMGnXkw4TWy
         1IwA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:to:subject;
        bh=dJw47G26CDxZs2NGq25pI102/6AqUBiOiEE4Y8ft6g8=;
        b=c2uAFem+OFuJDEz7ReL8Uh/LtgY77azG2NHUVwXLygboiAFPjZi4/lNFFyL9+3axUj
         CiQP7+ZhmxfcdAxHN5T7t+k10BN97Rh5g/fnGB2pQ07bMFDKjs7anZsGDKVuZ16Il2sg
         EXzSMivPPqp3zD1/n+82ZWQ7QPpEPNezzY1+Ryp+UJbRk3xvmjPxy2E/G3Mo3nhH8owX
         6wL/o600jITKeUA8HTmu1VwN2cw2qtt676Nm28O+BYYc+RmRNikCEVQh9gLnOzwELBd1
         RNAc9at4J11U/sQzG6PzXJUOcg1w5fSCDMnZiCbZdtaFQ4QMIPLe9M7h6B5UEYzuyrH2
         474Q==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 194.138.37.40 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
Received: from gecko.sbs.de (gecko.sbs.de. [194.138.37.40])
        by gmr-mx.google.com with ESMTPS id b9si149407wrj.2.2019.05.31.09.04.49
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 31 May 2019 09:04:49 -0700 (PDT)
Received-SPF: pass (google.com: domain of jan.kiszka@siemens.com designates 194.138.37.40 as permitted sender) client-ip=194.138.37.40;
Received: from mail2.sbs.de (mail2.sbs.de [192.129.41.66])
	by gecko.sbs.de (8.15.2/8.15.2) with ESMTPS id x4VG4nUl018974
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 31 May 2019 18:04:49 +0200
Received: from [139.25.68.37] (md1q0hnc.ad001.siemens.net [139.25.68.37] (may be forged))
	by mail2.sbs.de (8.15.2/8.15.2) with ESMTP id x4VG4mj1004917;
	Fri, 31 May 2019 18:04:48 +0200
Subject: Re: [PATCH v2 4/6] inmates: x86: discover and activate SSE/AVX
To: Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>,
        jailhouse-dev@googlegroups.com
References: <20190521143423.17734-1-ralf.ramsauer@oth-regensburg.de>
 <20190521143423.17734-5-ralf.ramsauer@oth-regensburg.de>
 <eca382c5-96bb-352f-d06a-6f92f25088d0@web.de>
 <c6d1eef6-0730-68b2-8fc2-5fd2b3c5b81e@oth-regensburg.de>
From: Jan Kiszka <jan.kiszka@siemens.com>
Message-ID: <fdb84e17-c70f-9818-a3b3-2bf5a4f18ed3@siemens.com>
Date: Fri, 31 May 2019 18:04:48 +0200
User-Agent: Mozilla/5.0 (X11; U; Linux i686 (x86_64); de; rv:1.8.1.12)
 Gecko/20080226 SUSE/2.0.0.12-1.1 Thunderbird/2.0.0.12 Mnenhy/0.7.5.666
MIME-Version: 1.0
In-Reply-To: <c6d1eef6-0730-68b2-8fc2-5fd2b3c5b81e@oth-regensburg.de>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable
X-Original-Sender: jan.kiszka@siemens.com
X-Original-Authentication-Results: gmr-mx.google.com;       spf=pass
 (google.com: domain of jan.kiszka@siemens.com designates 194.138.37.40 as
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

On 31.05.19 17:52, Ralf Ramsauer wrote:
> On 5/30/19 3:00 AM, Jan Kiszka wrote:
>> On 21.05.19 16:34, Ralf Ramsauer wrote:
>>> Recent gcc versions emit SSE instructions for 32-bit inmates (e.g., in
>>> hex2str or cmdline_parse routines). Inmates aren't able to execute thos=
e
>>> instructions as SSE is not enabled and will crash.
>>>
>>> Enabling SSE is the same code for 32 and 64 bit x86 and straight
>>> forward: Lookup SSE availability via cpuid and enable OSFXSR in cr4. If
>>> SSE is not available, stop the inmate.
>>>
>>> If AVX is available, activate it (XCR0).
>>>
>>> Lookup features that need no explicit activation.
>>>
>>> Signed-off-by: Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>
>>> ---
>>>  =C2=A0 inmates/lib/x86/Makefile=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0 |=C2=A0=C2=A0 6 +-
>>>  =C2=A0 inmates/lib/x86/cpu-features.c=C2=A0=C2=A0=C2=A0=C2=A0 | 103 ++=
+++++++++++++++++++++++++++
>>>  =C2=A0 inmates/lib/x86/header-32.S=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0 |=C2=A0=C2=A0 9 ++-
>>>  =C2=A0 inmates/lib/x86/header-64.S=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0 |=C2=A0=C2=A0 9 ++-
>>>  =C2=A0 inmates/lib/x86/include/asm/regs.h |=C2=A0 36 ++++++++++
>>>  =C2=A0 5 files changed, 158 insertions(+), 5 deletions(-)
>>>  =C2=A0 create mode 100644 inmates/lib/x86/cpu-features.c
>>>
>>> diff --git a/inmates/lib/x86/Makefile b/inmates/lib/x86/Makefile
>>> index e474ffd0..ed3b04d5 100644
>>> --- a/inmates/lib/x86/Makefile
>>> +++ b/inmates/lib/x86/Makefile
>>> @@ -40,7 +40,7 @@ include $(INMATES_LIB)/Makefile.lib
>>>
>>>  =C2=A0 always :=3D lib.a lib32.a
>>>
>>> -TARGETS :=3D header-common.o ioapic.o printk.o setup.o smp.o uart.o
>>> +TARGETS :=3D cpu-features.o header-common.o ioapic.o printk.o setup.o
>>> smp.o uart.o
>>>  =C2=A0 TARGETS +=3D ../alloc.o ../pci.o ../string.o ../cmdline.o ../se=
tup.o
>>>  =C2=A0 TARGETS +=3D ../uart-8250.o ../printk.o
>>>  =C2=A0 TARGETS_32_ONLY :=3D header-32.o
>>> @@ -57,6 +57,10 @@ $(obj)/lib32.a: $(addprefix $(obj)/,$(lib32-y))
>>>
>>>  =C2=A0 targets +=3D header-32.o
>>>
>>> +# Code of this object is called before SSE/AVX is available. Ensure
>>> that the
>>> +# compiler won't generate unsupported instructions for this file.
>>> +CFLAGS_cpu-features.o +=3D -mno-sse
>>> +
>>>  =C2=A0 $(obj)/%-32.o: c_flags +=3D -m32
>>>  =C2=A0 $(obj)/%-32.o: $(src)/%.c
>>>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 $(call if_changed_rule,cc_o_c)
>>> diff --git a/inmates/lib/x86/cpu-features.c
>>> b/inmates/lib/x86/cpu-features.c
>>> new file mode 100644
>>> index 00000000..9cf98543
>>> --- /dev/null
>>> +++ b/inmates/lib/x86/cpu-features.c
>>> @@ -0,0 +1,103 @@
>>> +/*
>>> + * Jailhouse, a Linux-based partitioning hypervisor
>>> + *
>>> + * Copyright (c) OTH Regensburg, 2019
>>> + *
>>> + * Authors:
>>> + *=C2=A0 Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>
>>> + *
>>> + * This work is licensed under the terms of the GNU GPL, version 2.=C2=
=A0 See
>>> + * the COPYING file in the top-level directory.
>>> + *
>>> + * Alternatively, you can use or redistribute this file under the
>>> following
>>> + * BSD license:
>>> + *
>>> + * Redistribution and use in source and binary forms, with or without
>>> + * modification, are permitted provided that the following conditions
>>> + * are met:
>>> + *
>>> + * 1. Redistributions of source code must retain the above copyright
>>> + *=C2=A0=C2=A0=C2=A0 notice, this list of conditions and the following=
 disclaimer.
>>> + *
>>> + * 2. Redistributions in binary form must reproduce the above copyrigh=
t
>>> + *=C2=A0=C2=A0=C2=A0 notice, this list of conditions and the following=
 disclaimer in
>>> the
>>> + *=C2=A0=C2=A0=C2=A0 documentation and/or other materials provided wit=
h the
>>> distribution.
>>> + *
>>> + * THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND
>>> CONTRIBUTORS "AS IS"
>>> + * AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED
>>> TO, THE
>>> + * IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR
>>> PURPOSE
>>> + * ARE DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT HOLDER OR
>>> CONTRIBUTORS BE
>>> + * LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR
>>> + * CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT O=
F
>>> + * SUBSTITUTE GOODS OR SERVICES; LOSS OF USE, DATA, OR PROFITS; OR
>>> BUSINESS
>>> + * INTERRUPTION) HOWEVER CAUSED AND ON ANY THEORY OF LIABILITY,
>>> WHETHER IN
>>> + * CONTRACT, STRICT LIABILITY, OR TORT (INCLUDING NEGLIGENCE OR
>>> OTHERWISE)
>>> + * ARISING IN ANY WAY OUT OF THE USE OF THIS SOFTWARE, EVEN IF
>>> ADVISED OF
>>> + * THE POSSIBILITY OF SUCH DAMAGE.
>>> + */
>>> +
>>> +#include <inmate.h>
>>> +#include <asm/regs.h>
>>> +
>>> +/* Must only be called from assembler via jmp */
>>> +void arch_init_features(void);
>>> +
>>> +struct x86_cpu_features x86_cpu_features
>>> __attribute__((section(".data")));
>>> +
>>> +/*
>>> + * We arrive here very early, and we don't have a stack. Take care.
>>> + *
>>> + * Every booting CPU will call this function. We make the assumption
>>> that all
>>> + * CPUs have the same feature set. So we don't need any locks when
>>> writing to
>>> + * x86_cpu_features.
>=20
> Any comments on this? Is it okay that this code will run on each CPU,
> even if only required on the primary CPU?
>=20

Running once on all CPUs is harmless - we are not in a hurry.

Running without stack is a problem, see below.

>>> + */
>>> +void __attribute__((naked, noreturn, section(".boot")))
>>
>> What's "naked" supposed to do here? The compilers says it will ignore it=
.
>=20
> Huh? Does it produce a warning?

Yes, gcc 7.4 said so.

>=20
> naked ensures that there's no pro- and epilogue sequences. And as the
> comment states: We won't have a stack that early.
>=20
> BTW: That raises a question: Where do we set the stack for secondary
> CPUs on x86?

In header.S, always to stack_top... Looks like the ARM issue is still prese=
nt here.

>=20
>>
>>> +arch_init_features(void)
>>> +{
>>> +=C2=A0=C2=A0=C2=A0 register u64 features;
>>> +
>>> +=C2=A0=C2=A0=C2=A0 features =3D cpuid_edx(X86_CPUID_FEATURES, 0);
>>> +=C2=A0=C2=A0=C2=A0 /* Check availability of FPU */
>>> +=C2=A0=C2=A0=C2=A0 x86_cpu_features.fpu =3D !!(features & X86_FEATURE_=
FPU);
>>> +
>>> +=C2=A0=C2=A0=C2=A0 /* Discover and enable FXSR */
>>> +=C2=A0=C2=A0=C2=A0 if (features & X86_FEATURE_FXSR) {
>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 write_cr4(read_cr4() | X86_=
CR4_OSFXSR);
>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 x86_cpu_features.fxsr =3D t=
rue;
>>> +=C2=A0=C2=A0=C2=A0 }
>=20
> BTW: Another point that I realised in the meanwhile: AFAICT, the
> hypervisor will very likely hand over with OSFXSR enabled as it is set
> by the cr4_required1 mask.

The hypervisor hands over in reset state, and there these features are off.

>=20
> Nevertheless, it should be properly set.
>=20
>>> +
>>> +=C2=A0=C2=A0=C2=A0 /* Check availability of SSE */
>>> +=C2=A0=C2=A0=C2=A0 x86_cpu_features.sse =3D !!(features & X86_FEATURE_=
SSE);
>>> +=C2=A0=C2=A0=C2=A0 x86_cpu_features.sse2 =3D !!(features & X86_FEATURE=
_SSE2);
>>> +
>>> +=C2=A0=C2=A0=C2=A0 /* ECX hides the rest */
>>> +=C2=A0=C2=A0=C2=A0 features =3D cpuid_ecx(X86_CPUID_FEATURES, 0);
>>> +=C2=A0=C2=A0=C2=A0 x86_cpu_features.sse3 =3D !!(features & X86_FEATURE=
_SSE3);
>>> +=C2=A0=C2=A0=C2=A0 x86_cpu_features.sse4_1 =3D !!(features & X86_FEATU=
RE_SSE4_1);
>>> +=C2=A0=C2=A0=C2=A0 x86_cpu_features.sse4_2 =3D !!(features & X86_FEATU=
RE_SSE4_2);
>>> +=C2=A0=C2=A0=C2=A0 x86_cpu_features.pclmulqdq =3D !!(features & X86_FE=
ATURE_PCLMULQDQ);
>>> +
>>> +=C2=A0=C2=A0=C2=A0 if (features & X86_FEATURE_XSAVE) {
>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 /* Enable XSAVE related ins=
tructions */
>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 write_cr4(read_cr4() | X86_=
CR4_OSXSAVE);
>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 x86_cpu_features.xsave =3D =
true;
>>> +
>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 /*
>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 * Intel SDM 13.2: A b=
it can be set in XCR0 if and only if the
>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 * corresponding bit i=
s set in this bitmap.=C2=A0 Every processor
>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 * that supports the X=
SAVE feature set will set EAX[0] (x87
>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 * state) and EAX[1] (=
SSE state).
>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 *
>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 * We can always safel=
y write SSE + FP, but only set AVX if
>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 * available.
>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 */
>>> +
>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 features =3D cpuid_edax(X86=
_CPUID_XSTATE, 0);
>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 write_xcr0(read_xcr0() | (f=
eatures & X86_XCR0_AVX) | \
>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 X86_XCR0_SSE | X86_XCR0_X87);
>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 x86_cpu_features.avx =3D !!=
(features & X86_XCR0_AVX);
>>> +=C2=A0=C2=A0=C2=A0 }
>>> +
>>> +=C2=A0=C2=A0=C2=A0 /* hand control back to assembler */
>>> +=C2=A0=C2=A0=C2=A0 asm volatile("jmp x86_start\t\n");
>>
>> Hacky... Is there no stack yet to do proper call/ret?
>=20
> See above, no stack. But I agree on hacky. :-)
>=20
>>
>> But if you want to / have to use a jmp here, you need to tell the
>> compiler that
>> this will never "return" (__builtin_unreachable).
>=20
> What's the difference between noreturn and builtin_unreachable?

The former declares it for the function and, thus, also informs its callers=
, the=20
latter marks that some line is never reached. That is needed when you call=
=20
something that is noreturn but does not declare it (like your inline assemb=
ly).

>=20
> The noreturn attribute makes sure that - besides the epilogue, we won't
> have a ret.

The compiler should have barked at you that your noreturn function seems to=
=20
return (the compiler has no idea about the semantic of the inline assembly)=
.

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
jailhouse-dev/fdb84e17-c70f-9818-a3b3-2bf5a4f18ed3%40siemens.com.
For more options, visit https://groups.google.com/d/optout.
