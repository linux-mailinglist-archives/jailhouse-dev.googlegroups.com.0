Return-Path: <jailhouse-dev+bncBD4JZQXE5UFRBT43YXTQKGQEJXBLTNQ@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-wr1-x43a.google.com (mail-wr1-x43a.google.com [IPv6:2a00:1450:4864:20::43a])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C5CE3119E
	for <lists+jailhouse-dev@lfdr.de>; Fri, 31 May 2019 17:52:48 +0200 (CEST)
Received: by mail-wr1-x43a.google.com with SMTP id e6sf917241wrv.20
        for <lists+jailhouse-dev@lfdr.de>; Fri, 31 May 2019 08:52:48 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1559317968; cv=pass;
        d=google.com; s=arc-20160816;
        b=A7Q83CiOSB/O3ajDBfOopbfhSU0+pIL0kwLJzFhfzFSl64VXSRoP//McTRBLyyDJ1C
         m1gnzcoSFIBQwAsnJ/fdoYNN8CwWtrKcb+h+7IYuSNjDtkVr2BCQpUlPG+Z0ZJep8pKo
         Sd955mfMV+rjnJxinKn426r/D5BcygLTOYjUrpEN+3Xwn/4mC1qLtxBtukK1PY3i5vIQ
         L94liynVqGzmOBB5hx9PC4+Nn4BsOTpvBUGXCebl0/F7alVzK08Z/esuZLDwe74JZZrh
         EgB6M1V5wsvprMAwcdCOKLq90gI3xsu8oR3KdR3AZ3OrdXDms0aeZv6DJqYgRYU7oxjm
         FRYg==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:autocrypt:openpgp:from:references:to:subject:sender
         :dkim-signature;
        bh=cwCyHewjCDrznIa2efK8Y1LEgsV4wYI8lP3V48AuQkc=;
        b=clSfxVIe2wE4UY48uJB4t7JDXR1WmRO1nfnybkS9rbhzZHyuVALUalAMcK353TT4FH
         2kK+v6xoA4mQdmo/VoauoLxjBpJJ1QugDZsArCTxtzDdmL+wA0PdUqRiOyDplmFoJv9F
         jNx4j+D/7LKkJciSYiCpIMEoYCZYI8vx1FwMfKAosu/UliffuNSwxaLdpUeibFg265Yr
         n0U2FVkgRe5b5505K3prFcJqp5cdlmgp3WKTcXw9vw/2PGGlk7cwasxaYSOFyWIPjXPw
         qfnc9XMRlNd/x9/ffI11cOxuvvqPLy/ox+qTQ7GLAnY93uvF3oztvK5Y68GbwRpIkR4g
         IxrQ==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass header.i=@oth-regensburg.de header.s=mta01-20160622 header.b=PRjEN9aj;
       spf=pass (google.com: domain of ralf.ramsauer@oth-regensburg.de designates 194.95.104.11 as permitted sender) smtp.mailfrom=ralf.ramsauer@oth-regensburg.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=oth-regensburg.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:subject:to:references:from:openpgp:autocrypt:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :list-post:list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=cwCyHewjCDrznIa2efK8Y1LEgsV4wYI8lP3V48AuQkc=;
        b=QXgV8yjvJOV4JPLShIgS+QdSGNoalzWK84lxsBY0+vbcfY646CShxHApSVmW/tAHyy
         VyC4qdzKJxCLmaV+tTAonHtZOU4gzIkNfJGpb2Y1XDFAaD7pgMW/i0E1bsMjQvbpR0y/
         hoIZUAiknRbyf+g6AtV7Z9Huwow4FdY8EwpELOedeM7avYz4zTqpepiypPdLmeQepLOQ
         COqnQJaB/jD1nKeYuYZbs6NHL08HqHvzlN3cLrrhe5UH1EVj7dxuM2h5TmdGtqv5Bpmp
         oCk9KiWx4ROXHeYp91Ku9n5FMiS8qHnpcCqfA0IwiX+M5ud2YeZt42oTHULuZ9YQarb8
         H9Xw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:subject:to:references:from:openpgp
         :autocrypt:message-id:date:user-agent:mime-version:in-reply-to
         :content-language:content-transfer-encoding:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :x-spam-checked-in-group:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=cwCyHewjCDrznIa2efK8Y1LEgsV4wYI8lP3V48AuQkc=;
        b=pN3zaQJYfA5QUZp/v+BJWpswu+teH5TJh54iqi4R1FieosvCY+h04GFUt7Eu1tSCU2
         vasMo70/0FOMvtg23WRf179kgOkptgxEVVKDW4vKD6eFWh2fE/rF0t0dunMR61TXaiY4
         mHTFm2OUGkom85+Pn0meWm6StPyhVasn5eAUYAPDYlnjuMsk+WMv3fTCyV02IWWtsSvK
         7H+rCCHFsDJg+7I5Hgi5TsZiej5Q0msF4nuIKXWj96LUaar/PshemG7UqiJsX2t4paMN
         3bm3wp+fK8NUdXj5jbSsCAeg+LvYjDIh5gisRugPpobaZrEHpwz1CZgllzggZ2o9mdpu
         eGUA==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: APjAAAV/rvElRlsYx+hT1t9G/iNndz/NlKo37PdcpQyRNgCSlc8ZMnHU
	V9fSGf3CKCzQ1Ms2H6g9qos=
X-Google-Smtp-Source: APXvYqyJi3XLPcbp6JUXFP4BUWlHbFUOe0d2wAhIBLJcw4+NkYtkb6TY75xpCo2PqRGPHsZ+FMESUA==
X-Received: by 2002:adf:f78d:: with SMTP id q13mr7296734wrp.220.1559317968133;
        Fri, 31 May 2019 08:52:48 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:adf:edce:: with SMTP id v14ls2019981wro.4.gmail; Fri, 31 May
 2019 08:52:47 -0700 (PDT)
X-Received: by 2002:a5d:6849:: with SMTP id o9mr7144330wrw.196.1559317967291;
        Fri, 31 May 2019 08:52:47 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1559317967; cv=none;
        d=google.com; s=arc-20160816;
        b=xPOLuc4PuRzo2FajIVub9GJrs3tPzcjj6byCtXjwmYoly0TQEi5NPGapmPi7grapm4
         K9iK4kPz4/cxtCsVoIdqQdutVER7RQ0u4jjj5OaryY+RUQ3d/qyEq7FSlQaulVn823is
         noVvnINxIMnbZbF+ILhRy7sJZxnpjEDN8YyKvsm7Pmzzrq0Ziyen3tthp3qQ7ORTz5Mz
         Ocrd+vZdmWuNX11pFVFTyIU5/u8tqckanFNyZBYpCSXtE7A59fA1/xjAGDnSj9ImAYgf
         Orm1rx/Q6b3SShnOpmYhpDHcK1R+WZN7Q/DR/qNuo+NoC7/fWYd4wY78Iv0jkzgNT9kH
         mdjQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:autocrypt:openpgp:from:references:to
         :subject:dkim-signature;
        bh=FaInkGyEJMZPq6YYaCfg0jdIQt+XJflCdomKPUNrlkI=;
        b=yAkkvQV04qVxcqm3NwpBT1Jz+1cmdrViUsV1WayYhWx/PL5ls5fMxqkfUBCTmjhpcN
         GNAKx5KuNHqDKVkbB8mfxS76Lo9mFPCgXFkQIhIFpBZXA/AOEcQyX0sW/jJAZhvd0dea
         N8XOlJrq8Zlz2EckgQtAE+mixuV0j4h5DF8vr7tr6tP806LvfaR60xZfe5nrd5RxRdAm
         mWEL1ZPspHHQIYTBSyO7ttrNi88U6B8YTvqa4YpuRKrEgFeHo3d85QBJ3Xkc997LW6wA
         i+WT/7ng0XuspcU5R44SmXiKrjKHi5oVOL2rXF1/ea1H3XEt8ciZ4dJEKg7tNHbpkunG
         9dBQ==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       dkim=pass header.i=@oth-regensburg.de header.s=mta01-20160622 header.b=PRjEN9aj;
       spf=pass (google.com: domain of ralf.ramsauer@oth-regensburg.de designates 194.95.104.11 as permitted sender) smtp.mailfrom=ralf.ramsauer@oth-regensburg.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=oth-regensburg.de
Received: from mta01.hs-regensburg.de (mta01.hs-regensburg.de. [194.95.104.11])
        by gmr-mx.google.com with ESMTPS id x8si211477wrt.3.2019.05.31.08.52.47
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 31 May 2019 08:52:47 -0700 (PDT)
Received-SPF: pass (google.com: domain of ralf.ramsauer@oth-regensburg.de designates 194.95.104.11 as permitted sender) client-ip=194.95.104.11;
Received: from E16S02.hs-regensburg.de (e16s02.hs-regensburg.de [IPv6:2001:638:a01:8013::92])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(Client CN "E16S02", Issuer "E16S02" (not verified))
	by mta01.hs-regensburg.de (Postfix) with ESMTPS id 45Fpqy6LgFzyQ7;
	Fri, 31 May 2019 17:52:46 +0200 (CEST)
Received: from [172.16.87.255] (194.95.106.138) by E16S02.hs-regensburg.de
 (2001:638:a01:8013::92) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1713.5; Fri, 31 May
 2019 17:52:45 +0200
Subject: Re: [PATCH v2 4/6] inmates: x86: discover and activate SSE/AVX
To: Jan Kiszka <jan.kiszka@web.de>, <jailhouse-dev@googlegroups.com>
References: <20190521143423.17734-1-ralf.ramsauer@oth-regensburg.de>
 <20190521143423.17734-5-ralf.ramsauer@oth-regensburg.de>
 <eca382c5-96bb-352f-d06a-6f92f25088d0@web.de>
From: Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>
Openpgp: preference=signencrypt
Autocrypt: addr=ralf.ramsauer@oth-regensburg.de; keydata=
 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
 RncIIYr0LjXAAzY=
Message-ID: <c6d1eef6-0730-68b2-8fc2-5fd2b3c5b81e@oth-regensburg.de>
Date: Fri, 31 May 2019 11:52:43 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.0
MIME-Version: 1.0
In-Reply-To: <eca382c5-96bb-352f-d06a-6f92f25088d0@web.de>
Content-Type: text/plain; charset="UTF-8"
Content-Language: en-PH
Content-Transfer-Encoding: quoted-printable
X-Originating-IP: [194.95.106.138]
X-ClientProxiedBy: E16S03.hs-regensburg.de (2001:638:a01:8013::93) To
 E16S02.hs-regensburg.de (2001:638:a01:8013::92)
X-Original-Sender: ralf.ramsauer@oth-regensburg.de
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass
 header.i=@oth-regensburg.de header.s=mta01-20160622 header.b=PRjEN9aj;
       spf=pass (google.com: domain of ralf.ramsauer@oth-regensburg.de
 designates 194.95.104.11 as permitted sender) smtp.mailfrom=ralf.ramsauer@oth-regensburg.de;
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

On 5/30/19 3:00 AM, Jan Kiszka wrote:
> On 21.05.19 16:34, Ralf Ramsauer wrote:
>> Recent gcc versions emit SSE instructions for 32-bit inmates (e.g., in
>> hex2str or cmdline_parse routines). Inmates aren't able to execute those
>> instructions as SSE is not enabled and will crash.
>>
>> Enabling SSE is the same code for 32 and 64 bit x86 and straight
>> forward: Lookup SSE availability via cpuid and enable OSFXSR in cr4. If
>> SSE is not available, stop the inmate.
>>
>> If AVX is available, activate it (XCR0).
>>
>> Lookup features that need no explicit activation.
>>
>> Signed-off-by: Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>
>> ---
>> =C2=A0 inmates/lib/x86/Makefile=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0 |=C2=A0=C2=A0 6 +-
>> =C2=A0 inmates/lib/x86/cpu-features.c=C2=A0=C2=A0=C2=A0=C2=A0 | 103 ++++=
+++++++++++++++++++++++++
>> =C2=A0 inmates/lib/x86/header-32.S=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0 |=C2=A0=C2=A0 9 ++-
>> =C2=A0 inmates/lib/x86/header-64.S=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0 |=C2=A0=C2=A0 9 ++-
>> =C2=A0 inmates/lib/x86/include/asm/regs.h |=C2=A0 36 ++++++++++
>> =C2=A0 5 files changed, 158 insertions(+), 5 deletions(-)
>> =C2=A0 create mode 100644 inmates/lib/x86/cpu-features.c
>>
>> diff --git a/inmates/lib/x86/Makefile b/inmates/lib/x86/Makefile
>> index e474ffd0..ed3b04d5 100644
>> --- a/inmates/lib/x86/Makefile
>> +++ b/inmates/lib/x86/Makefile
>> @@ -40,7 +40,7 @@ include $(INMATES_LIB)/Makefile.lib
>>
>> =C2=A0 always :=3D lib.a lib32.a
>>
>> -TARGETS :=3D header-common.o ioapic.o printk.o setup.o smp.o uart.o
>> +TARGETS :=3D cpu-features.o header-common.o ioapic.o printk.o setup.o
>> smp.o uart.o
>> =C2=A0 TARGETS +=3D ../alloc.o ../pci.o ../string.o ../cmdline.o ../setu=
p.o
>> =C2=A0 TARGETS +=3D ../uart-8250.o ../printk.o
>> =C2=A0 TARGETS_32_ONLY :=3D header-32.o
>> @@ -57,6 +57,10 @@ $(obj)/lib32.a: $(addprefix $(obj)/,$(lib32-y))
>>
>> =C2=A0 targets +=3D header-32.o
>>
>> +# Code of this object is called before SSE/AVX is available. Ensure
>> that the
>> +# compiler won't generate unsupported instructions for this file.
>> +CFLAGS_cpu-features.o +=3D -mno-sse
>> +
>> =C2=A0 $(obj)/%-32.o: c_flags +=3D -m32
>> =C2=A0 $(obj)/%-32.o: $(src)/%.c
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 $(call if_changed_rule,cc_o_c)
>> diff --git a/inmates/lib/x86/cpu-features.c
>> b/inmates/lib/x86/cpu-features.c
>> new file mode 100644
>> index 00000000..9cf98543
>> --- /dev/null
>> +++ b/inmates/lib/x86/cpu-features.c
>> @@ -0,0 +1,103 @@
>> +/*
>> + * Jailhouse, a Linux-based partitioning hypervisor
>> + *
>> + * Copyright (c) OTH Regensburg, 2019
>> + *
>> + * Authors:
>> + *=C2=A0 Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>
>> + *
>> + * This work is licensed under the terms of the GNU GPL, version 2.=C2=
=A0 See
>> + * the COPYING file in the top-level directory.
>> + *
>> + * Alternatively, you can use or redistribute this file under the
>> following
>> + * BSD license:
>> + *
>> + * Redistribution and use in source and binary forms, with or without
>> + * modification, are permitted provided that the following conditions
>> + * are met:
>> + *
>> + * 1. Redistributions of source code must retain the above copyright
>> + *=C2=A0=C2=A0=C2=A0 notice, this list of conditions and the following =
disclaimer.
>> + *
>> + * 2. Redistributions in binary form must reproduce the above copyright
>> + *=C2=A0=C2=A0=C2=A0 notice, this list of conditions and the following =
disclaimer in
>> the
>> + *=C2=A0=C2=A0=C2=A0 documentation and/or other materials provided with=
 the
>> distribution.
>> + *
>> + * THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND
>> CONTRIBUTORS "AS IS"
>> + * AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED
>> TO, THE
>> + * IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR
>> PURPOSE
>> + * ARE DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT HOLDER OR
>> CONTRIBUTORS BE
>> + * LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR
>> + * CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF
>> + * SUBSTITUTE GOODS OR SERVICES; LOSS OF USE, DATA, OR PROFITS; OR
>> BUSINESS
>> + * INTERRUPTION) HOWEVER CAUSED AND ON ANY THEORY OF LIABILITY,
>> WHETHER IN
>> + * CONTRACT, STRICT LIABILITY, OR TORT (INCLUDING NEGLIGENCE OR
>> OTHERWISE)
>> + * ARISING IN ANY WAY OUT OF THE USE OF THIS SOFTWARE, EVEN IF
>> ADVISED OF
>> + * THE POSSIBILITY OF SUCH DAMAGE.
>> + */
>> +
>> +#include <inmate.h>
>> +#include <asm/regs.h>
>> +
>> +/* Must only be called from assembler via jmp */
>> +void arch_init_features(void);
>> +
>> +struct x86_cpu_features x86_cpu_features
>> __attribute__((section(".data")));
>> +
>> +/*
>> + * We arrive here very early, and we don't have a stack. Take care.
>> + *
>> + * Every booting CPU will call this function. We make the assumption
>> that all
>> + * CPUs have the same feature set. So we don't need any locks when
>> writing to
>> + * x86_cpu_features.

Any comments on this? Is it okay that this code will run on each CPU,
even if only required on the primary CPU?

>> + */
>> +void __attribute__((naked, noreturn, section(".boot")))
>=20
> What's "naked" supposed to do here? The compilers says it will ignore it.

Huh? Does it produce a warning?

naked ensures that there's no pro- and epilogue sequences. And as the
comment states: We won't have a stack that early.

BTW: That raises a question: Where do we set the stack for secondary
CPUs on x86?

>=20
>> +arch_init_features(void)
>> +{
>> +=C2=A0=C2=A0=C2=A0 register u64 features;
>> +
>> +=C2=A0=C2=A0=C2=A0 features =3D cpuid_edx(X86_CPUID_FEATURES, 0);
>> +=C2=A0=C2=A0=C2=A0 /* Check availability of FPU */
>> +=C2=A0=C2=A0=C2=A0 x86_cpu_features.fpu =3D !!(features & X86_FEATURE_F=
PU);
>> +
>> +=C2=A0=C2=A0=C2=A0 /* Discover and enable FXSR */
>> +=C2=A0=C2=A0=C2=A0 if (features & X86_FEATURE_FXSR) {
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 write_cr4(read_cr4() | X86_C=
R4_OSFXSR);
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 x86_cpu_features.fxsr =3D tr=
ue;
>> +=C2=A0=C2=A0=C2=A0 }

BTW: Another point that I realised in the meanwhile: AFAICT, the
hypervisor will very likely hand over with OSFXSR enabled as it is set
by the cr4_required1 mask.

Nevertheless, it should be properly set.

>> +
>> +=C2=A0=C2=A0=C2=A0 /* Check availability of SSE */
>> +=C2=A0=C2=A0=C2=A0 x86_cpu_features.sse =3D !!(features & X86_FEATURE_S=
SE);
>> +=C2=A0=C2=A0=C2=A0 x86_cpu_features.sse2 =3D !!(features & X86_FEATURE_=
SSE2);
>> +
>> +=C2=A0=C2=A0=C2=A0 /* ECX hides the rest */
>> +=C2=A0=C2=A0=C2=A0 features =3D cpuid_ecx(X86_CPUID_FEATURES, 0);
>> +=C2=A0=C2=A0=C2=A0 x86_cpu_features.sse3 =3D !!(features & X86_FEATURE_=
SSE3);
>> +=C2=A0=C2=A0=C2=A0 x86_cpu_features.sse4_1 =3D !!(features & X86_FEATUR=
E_SSE4_1);
>> +=C2=A0=C2=A0=C2=A0 x86_cpu_features.sse4_2 =3D !!(features & X86_FEATUR=
E_SSE4_2);
>> +=C2=A0=C2=A0=C2=A0 x86_cpu_features.pclmulqdq =3D !!(features & X86_FEA=
TURE_PCLMULQDQ);
>> +
>> +=C2=A0=C2=A0=C2=A0 if (features & X86_FEATURE_XSAVE) {
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 /* Enable XSAVE related inst=
ructions */
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 write_cr4(read_cr4() | X86_C=
R4_OSXSAVE);
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 x86_cpu_features.xsave =3D t=
rue;
>> +
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 /*
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 * Intel SDM 13.2: A bi=
t can be set in XCR0 if and only if the
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 * corresponding bit is=
 set in this bitmap.=C2=A0 Every processor
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 * that supports the XS=
AVE feature set will set EAX[0] (x87
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 * state) and EAX[1] (S=
SE state).
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 *
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 * We can always safely=
 write SSE + FP, but only set AVX if
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 * available.
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 */
>> +
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 features =3D cpuid_edax(X86_=
CPUID_XSTATE, 0);
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 write_xcr0(read_xcr0() | (fe=
atures & X86_XCR0_AVX) | \
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 X86_XCR0_SSE | X86_XCR0_X87);
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 x86_cpu_features.avx =3D !!(=
features & X86_XCR0_AVX);
>> +=C2=A0=C2=A0=C2=A0 }
>> +
>> +=C2=A0=C2=A0=C2=A0 /* hand control back to assembler */
>> +=C2=A0=C2=A0=C2=A0 asm volatile("jmp x86_start\t\n");
>=20
> Hacky... Is there no stack yet to do proper call/ret?

See above, no stack. But I agree on hacky. :-)

>=20
> But if you want to / have to use a jmp here, you need to tell the
> compiler that
> this will never "return" (__builtin_unreachable).

What's the difference between noreturn and builtin_unreachable?

The noreturn attribute makes sure that - besides the epilogue, we won't
have a ret.

Thanks
  Ralf

>=20
> Jan
>=20
>> +}
>> diff --git a/inmates/lib/x86/header-32.S b/inmates/lib/x86/header-32.S
>> index 30b3f5e3..ca9f77f9 100644
>> --- a/inmates/lib/x86/header-32.S
>> +++ b/inmates/lib/x86/header-32.S
>> @@ -63,6 +63,13 @@ start32:
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 mov %eax,%es
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 mov %eax,%ss
>>
>> +=C2=A0=C2=A0=C2=A0 /* Temporarily hand over to C. Note that we don't ha=
ve a valid
>> stack. */
>> +=C2=A0=C2=A0=C2=A0 jmp arch_init_features
>> +
>> +=C2=A0=C2=A0=C2=A0 /* C will jmp back to x86_start */
>> +=C2=A0=C2=A0=C2=A0 .globl x86_start
>> +x86_start:
>> +
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 xor %ebx,%ebx
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 xchg ap_entry,%ebx
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 or %ebx,%ebx
>> @@ -74,7 +81,7 @@ start32:
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 cmp $SMP_MAX_CPUS,%edi
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 jae stop
>>
>> -=C2=A0=C2=A0=C2=A0 mov $0x01,%eax
>> +=C2=A0=C2=A0=C2=A0 mov $X86_CPUID_FEATURES, %eax
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 cpuid
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 shr $24,%ebx
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 mov %bl,smp_cpu_ids(%edi)
>> diff --git a/inmates/lib/x86/header-64.S b/inmates/lib/x86/header-64.S
>> index 2c4caace..53b13173 100644
>> --- a/inmates/lib/x86/header-64.S
>> +++ b/inmates/lib/x86/header-64.S
>> @@ -63,10 +63,13 @@ start32:
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 mov $(X86_CR0_PG | X86_CR0_WP | X86_CR0_P=
E),%eax
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 mov %eax,%cr0
>>
>> -=C2=A0=C2=A0=C2=A0 ljmpl $INMATE_CS64,$start64
>> +=C2=A0=C2=A0=C2=A0 /* Temporarily hand over to C. Note that we don't ha=
ve a valid
>> stack. */
>> +=C2=A0=C2=A0=C2=A0 ljmpl $INMATE_CS64, $arch_init_features
>>
>> +=C2=A0=C2=A0=C2=A0 /* C will jmp back to x86_start. We're now in 64-bit=
 mode. */
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 .code64
>> -start64:
>> +=C2=A0=C2=A0=C2=A0 .globl x86_start
>> +x86_start:
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 xor %rbx,%rbx
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 xchg ap_entry,%rbx
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 or %rbx,%rbx
>> @@ -78,7 +81,7 @@ start64:
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 cmp $SMP_MAX_CPUS,%edi
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 jae stop
>>
>> -=C2=A0=C2=A0=C2=A0 mov $0x01,%eax
>> +=C2=A0=C2=A0=C2=A0 mov $X86_CPUID_FEATURES, %eax
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 cpuid
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 shr $24,%ebx
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 mov %bl,smp_cpu_ids(%edi)
>> diff --git a/inmates/lib/x86/include/asm/regs.h
>> b/inmates/lib/x86/include/asm/regs.h
>> index 85da043b..905d03ee 100644
>> --- a/inmates/lib/x86/include/asm/regs.h
>> +++ b/inmates/lib/x86/include/asm/regs.h
>> @@ -42,15 +42,51 @@
>>
>> =C2=A0 #define X86_CR4_PAE=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0x0=
0000020
>> =C2=A0 #define X86_CR4_PSE=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0x0=
0000010
>> +#define X86_CR4_OSFXSR=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0x0000=
0200
>> +#define X86_CR4_OSXSAVE=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0x000=
40000
>> +
>> +#define X86_XCR0_X87=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 (1 << 0)
>> +#define X86_XCR0_SSE=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 (1 << 1)
>> +#define X86_XCR0_AVX=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 (1 << 2)
>>
>> =C2=A0 #define MSR_EFER=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0xc000=
0080
>> =C2=A0 #define EFER_LME=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0x0000=
0100
>>
>> +#define X86_CPUID_FEATURES=C2=A0=C2=A0=C2=A0 0x00000001 /* Processor In=
fo and
>> Feature Bits */
>> +/* Feature bits in EDX */
>> +# define X86_FEATURE_FPU=C2=A0=C2=A0=C2=A0 (1 << 0)=C2=A0 /* The proces=
sor contains an
>> x87 FPU. */
>> +# define X86_FEATURE_FXSR=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 (1 << 24)=
 /* FXSAVE/FXRSTOR,
>> CR4.OSFXSR */
>> +# define X86_FEATURE_SSE=C2=A0=C2=A0=C2=A0 (1 << 25) /* The processor s=
upports SSE */
>> +# define X86_FEATURE_SSE2=C2=A0=C2=A0=C2=A0 (1 << 26) /* The processor =
supports SSE2 */
>> +/* Feature bits in ECX */
>> +# define X86_FEATURE_SSE3=C2=A0=C2=A0=C2=A0 (1 << 0)=C2=A0 /* The proce=
ssor supports SSE3 */
>> +# define X86_FEATURE_PCLMULQDQ=C2=A0=C2=A0=C2=A0 (1 << 1)=C2=A0 /* The =
processor supports
>> PCLMULQDQ */
>> +# define X86_FEATURE_SSE4_1=C2=A0=C2=A0=C2=A0 (1 << 19) /* The processo=
r supports
>> SSE4.1 */
>> +# define X86_FEATURE_SSE4_2=C2=A0=C2=A0=C2=A0 (1 << 20) /* The processo=
r supports
>> SSE4.2 */
>> +# define X86_FEATURE_XSAVE=C2=A0=C2=A0=C2=A0 (1 << 26) /* XSAVE/..., CR=
4.OSXSAVE */
>> +
>> +#define X86_CPUID_XSTATE=C2=A0=C2=A0=C2=A0 0x0000000d /* Extended state=
 features */
>> +
>> =C2=A0 #define MSR_MTRR_DEF_TYPE=C2=A0=C2=A0=C2=A0 0x000002ff
>> =C2=A0 #define MTRR_ENABLE=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0x0=
0000800
>>
>> =C2=A0 #ifndef __ASSEMBLY__
>>
>> +struct x86_cpu_features {
>> +=C2=A0=C2=A0=C2=A0 bool avx:1;
>> +=C2=A0=C2=A0=C2=A0 bool sse:1;
>> +=C2=A0=C2=A0=C2=A0 bool sse2:1;
>> +=C2=A0=C2=A0=C2=A0 bool sse3:1;
>> +=C2=A0=C2=A0=C2=A0 bool sse4_1:1;
>> +=C2=A0=C2=A0=C2=A0 bool sse4_2:1;
>> +=C2=A0=C2=A0=C2=A0 bool fpu:1;
>> +=C2=A0=C2=A0=C2=A0 bool xsave:1;
>> +=C2=A0=C2=A0=C2=A0 bool fxsr:1;
>> +=C2=A0=C2=A0=C2=A0 bool pclmulqdq:1;
>> +};
>> +
>> +extern struct x86_cpu_features x86_cpu_features;
>> +
>> =C2=A0 static unsigned long __force_order;
>>
>> =C2=A0 static inline unsigned long read_cr4(void)
>>
>=20

--=20
You received this message because you are subscribed to the Google Groups "=
Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/=
jailhouse-dev/c6d1eef6-0730-68b2-8fc2-5fd2b3c5b81e%40oth-regensburg.de.
For more options, visit https://groups.google.com/d/optout.
