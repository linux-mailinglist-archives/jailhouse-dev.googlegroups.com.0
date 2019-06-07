Return-Path: <jailhouse-dev+bncBD4JZQXE5UFRB2MZ5LTQKGQE4UTM3QI@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-lf1-x13e.google.com (mail-lf1-x13e.google.com [IPv6:2a00:1450:4864:20::13e])
	by mail.lfdr.de (Postfix) with ESMTPS id 88301391AF
	for <lists+jailhouse-dev@lfdr.de>; Fri,  7 Jun 2019 18:12:27 +0200 (CEST)
Received: by mail-lf1-x13e.google.com with SMTP id a25sf624681lfl.0
        for <lists+jailhouse-dev@lfdr.de>; Fri, 07 Jun 2019 09:12:27 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1559923947; cv=pass;
        d=google.com; s=arc-20160816;
        b=nqFtnDcEQtNrmSgYnPwncF8FE9YYl989Jk5uLOyHZoUatoAePidLPtRkYpG6pXbwAI
         3QOkfb7Sf3ABoApA3F5RDwELFtK9uvvzDNJInW0ov++DS3bAXd5CocSABEA3tCrh1it9
         SPZUMQkMNt33Vcb2mBCPO7debW/GIiRP8KH0Mx0vkjX4arPi5Xlf+o3NK5xHADU8HCsY
         PVHCQEqgvu3GwYE+3KXqzYAIdazNfnqALyJ6wI8fSGqBzzladnNhO1wgqAyTJdWQ2hou
         ASydXubB8Ku7863MxKXgAggWcjzdCx+RbDvw/MZvObB8spwQVPLye/VFc4niqV446Vpg
         iFbA==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:autocrypt:openpgp:from:references:to:subject:sender
         :dkim-signature;
        bh=oN90JsV9F/g1J6m/ljXzf/kbNS772s4A0G6hmWNcCS4=;
        b=IRsB3KfBOFe1QVSPq02ofMtMy7NUcdNYI0KhafnHnxSIdBe/EAFcmGkL5lqm0L3qhR
         pkwEDt2ipwsLVXatTTHTijLv58vzPGkKn6JROGvJjaXQDL/9ik8ya29/3urZoB9DA+Z/
         BodEKaq9lrHh8CrXPW/EI0YDoFzMtxqqa7F1u8jsCBWuHUMZrIm8Q9og5P+JBq7v7kfW
         bQZvfy5kT2twRYeTd3/IcGfqp3HVySZannQPddFmEFgeetiLCFYalLIvqvQ+NdolCuOM
         eVSgPhr/tI5dzTpUbCDafB5j2q3HqvMk5w8ui7pU05+TurOw/KeYp8oUphbYVyIU++7d
         qmQw==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass header.i=@oth-regensburg.de header.s=mta01-20160622 header.b=rPxKBN9U;
       spf=pass (google.com: domain of ralf.ramsauer@oth-regensburg.de designates 194.95.104.12 as permitted sender) smtp.mailfrom=ralf.ramsauer@oth-regensburg.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=oth-regensburg.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:subject:to:references:from:openpgp:autocrypt:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :list-post:list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=oN90JsV9F/g1J6m/ljXzf/kbNS772s4A0G6hmWNcCS4=;
        b=MQnGvVMO/SnxlmNTbxJBatu9OhxWlbMueiwyg7n/j8mmSEXiuHi9SHg5tdVx99BIjV
         qIvtuPTLzpF9n3BE3t+Ox/exl2v/aYA0itBb9N4Qa5oJFAqaofWUzcjuRrgs0WvEC65g
         P9ATbtLGFU4RVh2Vq+MUPQsX63LozXBNbwi41z1JV3pA0FUV/astwxvaXbAY3kQInMDC
         x5vJUMBi9Z1U6Db6HDulVyWQEzblkAq/EW2SRVeArJEleIqHihparCGTRs78DUjD22Cv
         kkY7uAPIbJRg2wvrJC2Iziw4o1t2fLNR/oDschYFIeV0ch0M2fbXSDawhRSTM6x6fwKK
         dUAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:subject:to:references:from:openpgp
         :autocrypt:message-id:date:user-agent:mime-version:in-reply-to
         :content-language:content-transfer-encoding:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :x-spam-checked-in-group:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=oN90JsV9F/g1J6m/ljXzf/kbNS772s4A0G6hmWNcCS4=;
        b=QqD5kXr6NVN3LplR5b1JYTyrbie349M4lyA+rjMG1dLwOZoGp8ge/LcN2uoNUTWfVg
         tx8XhNhnojAuS4uUH+zwNvUtitdKyn2I7Jdb+eEyqI5xFyam8jJdSkDphXjMtlDQxUdX
         HB8YYRkmqZ3nhgtjy3SMp3xP6CWJfGFI5T5N7hfGrx0hTasXa67a4Q0Rd6cLcqAs1L7S
         u1DfblTdr/FhQyJW/i7iNAf/OrpK2WFbmsylUd6hVAV5MXXjOzbWaejO8i5Bc72DsLgq
         VRKqgIa8KUwkxS0tMQyDXM6Jir4hRg2hIIPwbNsOedbf+UrSepiqhaIh3pUIx7bBlOEy
         hINg==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: APjAAAVdErbQCsb7yRpG4dGY1ZFnBDg2tk7noBlhF2ByRc4Cm7Ayt1bs
	1fUndtHttWj0Za07PP1oB1A=
X-Google-Smtp-Source: APXvYqzk3cguC0I1T5mklERctxjfqF1GniskhqlX7C9aMhcIye8bUgHsZUyknINqf0TKvQP9GXC2tg==
X-Received: by 2002:ac2:52ac:: with SMTP id r12mr4762473lfm.126.1559923945591;
        Fri, 07 Jun 2019 09:12:25 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a2e:8998:: with SMTP id c24ls1084600lji.15.gmail; Fri, 07
 Jun 2019 09:12:24 -0700 (PDT)
X-Received: by 2002:a2e:2b19:: with SMTP id q25mr9118295lje.127.1559923944856;
        Fri, 07 Jun 2019 09:12:24 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1559923944; cv=none;
        d=google.com; s=arc-20160816;
        b=wcQkcFfd1BGsOpxktNAoesWh3a4PlPH7N0X4Z6yjY75yW//Hp51tznoUvKQhILPpjb
         hrT+sy0BcIEMBjX24L2qqCPmVMfDSiuv77CKyMNXZWAoBgPVPqgNruTS5yunqTXhZeQa
         g1yZE4xH0ROw4jpehCvhRtr8c4MQ2dsQsdmJaEgErpAnY2s0IOPjjz5zhMrk52pEPHwH
         gh5poe4332nLbOAya9yMIld5wXXDcPYRPCxm2E7MD3Gudm7lC34D6zAG2eUXT7USjaPk
         Ytar+0Vfpofd1B/9kpbcBaRlzbg12WPrRztHZaMToNRb41DiIKjRE1/rRMy5hZQ9oOMl
         wgRg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:autocrypt:openpgp:from:references:to
         :subject:dkim-signature;
        bh=ka0QFi32ZjsatE9Rm7yjvlpGSkN/O/9asQwF0aZ74FQ=;
        b=FVJ48vDYv8nBZUEiQE+MCMl3NfG1+Z+A2u+rLMjBlhtfNspOCoSAw+sZMJmratlg2V
         ILYzTkRP2RXNA7zXDtjmBajZgZFHpO9abFUi4UYSYI9YeFZUeW/k97ptKpOvSn3kMTgc
         ROCUH4vaOjGDCXQjeBYVWIbOOX96Q045340pokNTeYUCoRiWcorDKS/kZpF2fQIsU+ac
         6xcIf9BkZOfc/xdHrInpyk6BFQ4Ug2kTYcopd2hlCW+gFaPJCjPpWw01mfkeqzju5eiY
         5BAAbbw60t60mf8YtHFqUtLzg3tw/02RV4VPfQFur6DWrzn2icnYa/xb01A0ifYfFps3
         SFoQ==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       dkim=pass header.i=@oth-regensburg.de header.s=mta01-20160622 header.b=rPxKBN9U;
       spf=pass (google.com: domain of ralf.ramsauer@oth-regensburg.de designates 194.95.104.12 as permitted sender) smtp.mailfrom=ralf.ramsauer@oth-regensburg.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=oth-regensburg.de
Received: from mta02.hs-regensburg.de (mta02.hs-regensburg.de. [194.95.104.12])
        by gmr-mx.google.com with ESMTPS id v29si176346lfq.2.2019.06.07.09.12.24
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 07 Jun 2019 09:12:24 -0700 (PDT)
Received-SPF: pass (google.com: domain of ralf.ramsauer@oth-regensburg.de designates 194.95.104.12 as permitted sender) client-ip=194.95.104.12;
Received: from E16S02.hs-regensburg.de (e16s02.hs-regensburg.de [IPv6:2001:638:a01:8013::92])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(Client CN "E16S02", Issuer "E16S02" (not verified))
	by mta02.hs-regensburg.de (Postfix) with ESMTPS id 45L6xL4NklzyJs;
	Fri,  7 Jun 2019 18:12:22 +0200 (CEST)
Received: from [172.16.2.24] (194.95.106.138) by E16S02.hs-regensburg.de
 (2001:638:a01:8013::92) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1713.5; Fri, 7 Jun 2019
 18:12:22 +0200
Subject: Re: [PATCH v2 4/6] inmates: x86: discover and activate SSE/AVX
To: Jan Kiszka <jan.kiszka@siemens.com>, <jailhouse-dev@googlegroups.com>
References: <20190521143423.17734-1-ralf.ramsauer@oth-regensburg.de>
 <20190521143423.17734-5-ralf.ramsauer@oth-regensburg.de>
 <eca382c5-96bb-352f-d06a-6f92f25088d0@web.de>
 <c6d1eef6-0730-68b2-8fc2-5fd2b3c5b81e@oth-regensburg.de>
 <fdb84e17-c70f-9818-a3b3-2bf5a4f18ed3@siemens.com>
 <de841457-a95f-6ddb-6c53-09c14f64403d@oth-regensburg.de>
 <eb711300-b19c-053e-21c7-721bab566b07@oth-regensburg.de>
 <af3e89c4-5d33-e6c8-3ba4-6b6ca6d4a409@siemens.com>
From: Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>
Openpgp: preference=signencrypt
Autocrypt: addr=ralf.ramsauer@oth-regensburg.de; keydata=
 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
 RncIIYr0LjXAAzY=
Message-ID: <ce3aaf2a-e8a1-9e07-ea14-0ee9360271b4@oth-regensburg.de>
Date: Fri, 7 Jun 2019 18:12:21 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.0
MIME-Version: 1.0
In-Reply-To: <af3e89c4-5d33-e6c8-3ba4-6b6ca6d4a409@siemens.com>
Content-Type: text/plain; charset="UTF-8"
Content-Language: en-PH
Content-Transfer-Encoding: quoted-printable
X-Originating-IP: [194.95.106.138]
X-ClientProxiedBy: E16S01.hs-regensburg.de (2001:638:a01:8013::91) To
 E16S02.hs-regensburg.de (2001:638:a01:8013::92)
X-Original-Sender: ralf.ramsauer@oth-regensburg.de
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass
 header.i=@oth-regensburg.de header.s=mta01-20160622 header.b=rPxKBN9U;
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

On 6/7/19 5:52 PM, Jan Kiszka wrote:
> On 07.06.19 17:26, Ralf Ramsauer wrote:
>>
>>
>> On 5/31/19 8:39 PM, Ralf Ramsauer wrote:
>>>
>>>
>>> On 5/31/19 12:04 PM, Jan Kiszka wrote:
>>>> On 31.05.19 17:52, Ralf Ramsauer wrote:
>>>>> On 5/30/19 3:00 AM, Jan Kiszka wrote:
>>>>>> On 21.05.19 16:34, Ralf Ramsauer wrote:
>>>>>>> Recent gcc versions emit SSE instructions for 32-bit inmates
>>>>>>> (e.g., in
>>>>>>> hex2str or cmdline_parse routines). Inmates aren't able to execute
>>>>>>> those
>>>>>>> instructions as SSE is not enabled and will crash.
>>>>>>>
>>>>>>> Enabling SSE is the same code for 32 and 64 bit x86 and straight
>>>>>>> forward: Lookup SSE availability via cpuid and enable OSFXSR in
>>>>>>> cr4. If
>>>>>>> SSE is not available, stop the inmate.
>>>>>>>
>>>>>>> If AVX is available, activate it (XCR0).
>>>>>>>
>>>>>>> Lookup features that need no explicit activation.
>>>>>>>
>>>>>>> Signed-off-by: Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>
>>>>>>> ---
>>>>>>> =C2=A0=C2=A0=C2=A0 inmates/lib/x86/Makefile=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0=C2=A0 6 +-
>>>>>>> =C2=A0=C2=A0=C2=A0 inmates/lib/x86/cpu-features.c=C2=A0=C2=A0=C2=A0=
=C2=A0 | 103
>>>>>>> +++++++++++++++++++++++++++++
>>>>>>> =C2=A0=C2=A0=C2=A0 inmates/lib/x86/header-32.S=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0 |=C2=A0=C2=A0 9 ++-
>>>>>>> =C2=A0=C2=A0=C2=A0 inmates/lib/x86/header-64.S=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0 |=C2=A0=C2=A0 9 ++-
>>>>>>> =C2=A0=C2=A0=C2=A0 inmates/lib/x86/include/asm/regs.h |=C2=A0 36 ++=
++++++++
>>>>>>> =C2=A0=C2=A0=C2=A0 5 files changed, 158 insertions(+), 5 deletions(=
-)
>>>>>>> =C2=A0=C2=A0=C2=A0 create mode 100644 inmates/lib/x86/cpu-features.=
c
>>>>>>>
>>>>>>> diff --git a/inmates/lib/x86/Makefile b/inmates/lib/x86/Makefile
>>>>>>> index e474ffd0..ed3b04d5 100644
>>>>>>> --- a/inmates/lib/x86/Makefile
>>>>>>> +++ b/inmates/lib/x86/Makefile
>>>>>>> @@ -40,7 +40,7 @@ include $(INMATES_LIB)/Makefile.lib
>>>>>>>
>>>>>>> =C2=A0=C2=A0=C2=A0 always :=3D lib.a lib32.a
>>>>>>>
>>>>>>> -TARGETS :=3D header-common.o ioapic.o printk.o setup.o smp.o uart.=
o
>>>>>>> +TARGETS :=3D cpu-features.o header-common.o ioapic.o printk.o setu=
p.o
>>>>>>> smp.o uart.o
>>>>>>> =C2=A0=C2=A0=C2=A0 TARGETS +=3D ../alloc.o ../pci.o ../string.o ../=
cmdline.o
>>>>>>> ../setup.o
>>>>>>> =C2=A0=C2=A0=C2=A0 TARGETS +=3D ../uart-8250.o ../printk.o
>>>>>>> =C2=A0=C2=A0=C2=A0 TARGETS_32_ONLY :=3D header-32.o
>>>>>>> @@ -57,6 +57,10 @@ $(obj)/lib32.a: $(addprefix $(obj)/,$(lib32-y))
>>>>>>>
>>>>>>> =C2=A0=C2=A0=C2=A0 targets +=3D header-32.o
>>>>>>>
>>>>>>> +# Code of this object is called before SSE/AVX is available. Ensur=
e
>>>>>>> that the
>>>>>>> +# compiler won't generate unsupported instructions for this file.
>>>>>>> +CFLAGS_cpu-features.o +=3D -mno-sse
>>>>>>> +
>>>>>>> =C2=A0=C2=A0=C2=A0 $(obj)/%-32.o: c_flags +=3D -m32
>>>>>>> =C2=A0=C2=A0=C2=A0 $(obj)/%-32.o: $(src)/%.c
>>>>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 $(call if_changed_rule,c=
c_o_c)
>>>>>>> diff --git a/inmates/lib/x86/cpu-features.c
>>>>>>> b/inmates/lib/x86/cpu-features.c
>>>>>>> new file mode 100644
>>>>>>> index 00000000..9cf98543
>>>>>>> --- /dev/null
>>>>>>> +++ b/inmates/lib/x86/cpu-features.c
>>>>>>> @@ -0,0 +1,103 @@
>>>>>>> +/*
>>>>>>> + * Jailhouse, a Linux-based partitioning hypervisor
>>>>>>> + *
>>>>>>> + * Copyright (c) OTH Regensburg, 2019
>>>>>>> + *
>>>>>>> + * Authors:
>>>>>>> + *=C2=A0 Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>
>>>>>>> + *
>>>>>>> + * This work is licensed under the terms of the GNU GPL, version
>>>>>>> 2.=C2=A0 See
>>>>>>> + * the COPYING file in the top-level directory.
>>>>>>> + *
>>>>>>> + * Alternatively, you can use or redistribute this file under the
>>>>>>> following
>>>>>>> + * BSD license:
>>>>>>> + *
>>>>>>> + * Redistribution and use in source and binary forms, with or
>>>>>>> without
>>>>>>> + * modification, are permitted provided that the following
>>>>>>> conditions
>>>>>>> + * are met:
>>>>>>> + *
>>>>>>> + * 1. Redistributions of source code must retain the above
>>>>>>> copyright
>>>>>>> + *=C2=A0=C2=A0=C2=A0 notice, this list of conditions and the follo=
wing disclaimer.
>>>>>>> + *
>>>>>>> + * 2. Redistributions in binary form must reproduce the above
>>>>>>> copyright
>>>>>>> + *=C2=A0=C2=A0=C2=A0 notice, this list of conditions and the follo=
wing
>>>>>>> disclaimer in
>>>>>>> the
>>>>>>> + *=C2=A0=C2=A0=C2=A0 documentation and/or other materials provided=
 with the
>>>>>>> distribution.
>>>>>>> + *
>>>>>>> + * THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND
>>>>>>> CONTRIBUTORS "AS IS"
>>>>>>> + * AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT
>>>>>>> LIMITED
>>>>>>> TO, THE
>>>>>>> + * IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A
>>>>>>> PARTICULAR
>>>>>>> PURPOSE
>>>>>>> + * ARE DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT HOLDER OR
>>>>>>> CONTRIBUTORS BE
>>>>>>> + * LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL,
>>>>>>> EXEMPLARY, OR
>>>>>>> + * CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT LIMITED TO,
>>>>>>> PROCUREMENT OF
>>>>>>> + * SUBSTITUTE GOODS OR SERVICES; LOSS OF USE, DATA, OR PROFITS; OR
>>>>>>> BUSINESS
>>>>>>> + * INTERRUPTION) HOWEVER CAUSED AND ON ANY THEORY OF LIABILITY,
>>>>>>> WHETHER IN
>>>>>>> + * CONTRACT, STRICT LIABILITY, OR TORT (INCLUDING NEGLIGENCE OR
>>>>>>> OTHERWISE)
>>>>>>> + * ARISING IN ANY WAY OUT OF THE USE OF THIS SOFTWARE, EVEN IF
>>>>>>> ADVISED OF
>>>>>>> + * THE POSSIBILITY OF SUCH DAMAGE.
>>>>>>> + */
>>>>>>> +
>>>>>>> +#include <inmate.h>
>>>>>>> +#include <asm/regs.h>
>>>>>>> +
>>>>>>> +/* Must only be called from assembler via jmp */
>>>>>>> +void arch_init_features(void);
>>>>>>> +
>>>>>>> +struct x86_cpu_features x86_cpu_features
>>>>>>> __attribute__((section(".data")));
>>>>>>> +
>>>>>>> +/*
>>>>>>> + * We arrive here very early, and we don't have a stack. Take care=
.
>>>>>>> + *
>>>>>>> + * Every booting CPU will call this function. We make the
>>>>>>> assumption
>>>>>>> that all
>>>>>>> + * CPUs have the same feature set. So we don't need any locks when
>>>>>>> writing to
>>>>>>> + * x86_cpu_features.
>>>>>
>>>>> Any comments on this? Is it okay that this code will run on each CPU,
>>>>> even if only required on the primary CPU?
>>>>>
>>>>
>>>> Running once on all CPUs is harmless - we are not in a hurry.
>>>>
>>>> Running without stack is a problem, see below.
>>>
>>> Depends. It's perfectly fine to have no stack if we don't use it (even
>>> if we had an corrupt stack=E2=80=A6).
>>>
>>>>
>>>>>>> + */
>>>>>>> +void __attribute__((naked, noreturn, section(".boot")))
>>>>>>
>>>>>> What's "naked" supposed to do here? The compilers says it will ignor=
e
>>>>>> it.
>>>>>
>>>>> Huh? Does it produce a warning?
>>>>
>>>> Yes, gcc 7.4 said so.
>>>>
>>>>>
>>>>> naked ensures that there's no pro- and epilogue sequences. And as the
>>>>> comment states: We won't have a stack that early.
>>>>>
>>>>> BTW: That raises a question: Where do we set the stack for secondary
>>>>> CPUs on x86?
>>>>
>>>> In header.S, always to stack_top... Looks like the ARM issue is still
>>>> present here.
>>>
>>> I remember that I once fixed some corrupted stack things for ARM
>>> inmates, but it was a bit different there.
>>>
>>> Trying to interpret your words: We're currently running on an
>>> overlapping stack for secondary (all) CPUs, right? Should probably be
>>> fixed first.
>>>
>>> Hmm. On x86 we're hlting all secondary CPUs very early and wait for a
>>> SIPI. Besides setting ap_entry, we could allocate a valid stack on the
>>> primary CPU inside smp_start_cpu() and pass it.
>>
>> MMIO stuff is done, let's get back to this topic. :-)
>=20
> Yeah, right... I was close to pushing "--no-sse" today when I recalled
> that you are on this ;)
>=20
>>
>> The problem that I initially wanted to solve was missing SSE support,
>> turns out secondary CPUs in x86 have a broken stack.
>>
>> There might be a clean solution to solve all issues, including the dirty
>> "naked jmp around"-hack:
>>
>> Let's reconsider the early boot phase of x86 inmates. In comparison to
>> ARM, for example, we start all CPUs but halt secondary CPUs and wait for
>> SIPIs.
>>
>> Now, we could provide a stack symbol that points to a free, valid stack
>> that a CPU can grab. Initially, (by compile time) the symbol holds the
>> address of the stack for the primary CPU. It's yet unclear who will win
>> the race to be the primary CPU.
>>
>> We could cmpxchg the content of this symbol *very* early. Whoever wins
>> is the primary CPU, everyone else will read zero and simply put the CPU
>> in hlt state.
>=20
> That's what we do today already: Only the first CPU gets the static
> stack, the rest enter a hlt loop until their inmate-triggered wakeup
> without touching that stack. No problem here.

Hmm. We go through start16 start32 and start64 until we reach the point
where we check the CPU ID, and setup the stack. And everything we do
during this path (lgdtl, cr0/4 setup, =E2=80=A6) will be executed twice: On=
 the
initial startup, and on the SIPI.

When we receive the SIPI, can't we simply assume that everything but the
stack is already set up and in place? So all we would have to do is
setup the stack, get the entry point and call it. Or am I missing
something here?

>=20
>>
>> When starting secondary CPUs, smp_start_cpu() alloc()s a new stack from
>> the heap, sets the stack symbol (and sets ap_entry) and kicks the CPU.
>> Now the same startup code will run, but the secondary CPU grabs the
>> stack and boots.
>=20
> Right, we need to make "mov $stack_top,%rsp" configurable, and the
> problem should be solved. For the first CPU, it can remain that static on=
e.
>=20
>>
>> This has some advantages:
>> =C2=A0=C2=A0 - We have a valid stack very early, and can jump to C back =
and forth
>> =C2=A0=C2=A0=C2=A0=C2=A0 with regular calls instead of the hacky hack ab=
ove.
>> =C2=A0=C2=A0 - Startup code will only run once when needed, and not mult=
iple times
>> =C2=A0=C2=A0=C2=A0=C2=A0 as it is the case at the moment
>=20
> Startup should happen via INIT/SIPI, so some bits have to be run again.

Ok, maybe I lack some architectural knowledge: in which state do we
arrive when we receive the SIPI? And why is it written twice?

> Moreover, we need to let them run in order to fill smp_cpu_ids.
>=20
>> =C2=A0=C2=A0 - Every secondary CPU gets its own clean stack (which is br=
oken atm)
>> =C2=A0=C2=A0 - Still we maintain shared startup code for primary and sec=
ondary
>> =C2=A0=C2=A0=C2=A0=C2=A0 CPUs.
>>
>> Does that sound reasonable? I'd just like to hear some feedback before I
>> start hacking, as this could become a bit more complex, yet another
>> time. :-)
>=20
> Minus that some of the bits you defined are already there - yes. :)

Well, I thought that there could be a shortcut, but seems i'm wrong.

Thanks
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
jailhouse-dev/ce3aaf2a-e8a1-9e07-ea14-0ee9360271b4%40oth-regensburg.de.
For more options, visit https://groups.google.com/d/optout.
