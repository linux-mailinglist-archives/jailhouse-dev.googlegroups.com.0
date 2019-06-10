Return-Path: <jailhouse-dev+bncBDDNLV6S7AOBB35L7DTQKGQE75AQJFQ@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-wr1-x43e.google.com (mail-wr1-x43e.google.com [IPv6:2a00:1450:4864:20::43e])
	by mail.lfdr.de (Postfix) with ESMTPS id E1F523B0C5
	for <lists+jailhouse-dev@lfdr.de>; Mon, 10 Jun 2019 10:33:51 +0200 (CEST)
Received: by mail-wr1-x43e.google.com with SMTP id u2sf4230276wrr.3
        for <lists+jailhouse-dev@lfdr.de>; Mon, 10 Jun 2019 01:33:51 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1560155631; cv=pass;
        d=google.com; s=arc-20160816;
        b=RgeNUca2noXcuonqwjBJHpYlEcJE+rU2EoRiaLOdKR1lgckkCK01lD6ZnFnB1JS2Bd
         e5SzPw4BDKzxkh063DMtcLItqrBnJntv9RbVs0/SSdnM7s9othoGYxCH2NCKnOZlgjBf
         ai+xyxcTW91jSsfBEdCBoA1a5d2bmqJ/F++uXOvkCDwrlGJa7yMHGpaep1mLLYhI7fg8
         cP3zzSeMxWrlIs3KGeTT+vXbfMs7TYuhLE2wa0Tp6+CVUa5Yu9J5JiwbmZooBsFHQ5bs
         4c+se0Hd4yYst1Fx3smncH9Pti/hqg2LCWsu6sO+IjR07KbhfpMEpbXahv7bzlWHHZcZ
         egKA==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject:sender:dkim-signature;
        bh=S7o9L92FQ6K57pgqWwFwgeAF1S6qkEw7a/0poWgzGwk=;
        b=UAFCJ457JISurZDos5dS4eGkHH9LAc7Li4mv01tO3nm7DZJD2uVi8LcTflce3fGwWE
         eUwTMhiEMIx4YoQRONdZKPSCNIhQCcEBEJFZQuhocSXQWYk5InwLyuRHUBU7Wd+HBu4V
         jT0jKZiUYyxewlTGNQox30UyYeJQNBywd0+BbZ1S4DeTFx0fi/ZjqXYroabqp0anzLZ5
         Kssb0fpF/zB+niT3GSR3tGu9JRvCPA40npMAG8xWn8yXud9vMZeQCsMLvAzgjTUd//YO
         alrcIHTiufsyCpF9L2v4TtPNZ9XSExFbV5VWbVTYtFTr9YRIP/cbJLVzeVmQkJETRn9s
         UPDA==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass header.i=@web.de header.s=dbaedf251592 header.b=Yk+9Hxio;
       spf=pass (google.com: domain of jan.kiszka@web.de designates 212.227.17.11 as permitted sender) smtp.mailfrom=jan.kiszka@web.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:subject:to:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding
         :x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=S7o9L92FQ6K57pgqWwFwgeAF1S6qkEw7a/0poWgzGwk=;
        b=T9INeJrG9dahyawteEwcyY7+4FTJVTGNTm1hukR2G+KYNrtM5SDND891Jep3TaPZ7F
         roEAHekmuElYVGaKoiesuUXQJdPXNy2zToUqC5xU2uTWPzSOTFVzN4DJWDGeJpz8Y53J
         sKgX/lN1/DtxsAdV/0aqAaGNQiaJjI4Xjh4uK422X7ytIZ+vNeGrW0HBfujJ5JDbubNx
         fd3MLQkAqAnpdeqncENtfj4fGvR+WJYNQS3vnLqCuM71UaFKDn4nJOgST0UJBc0UooPp
         RyF8cD5cpvUDds1ez8CvWyj3gD8+elHcdNCWmc1TkN1Qi0ZCVNPmHw3jQNtshLDKPVcV
         C39w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:subject:to:references:from:message-id
         :date:user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :x-spam-checked-in-group:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=S7o9L92FQ6K57pgqWwFwgeAF1S6qkEw7a/0poWgzGwk=;
        b=bJqyN4WfThgXZz1jGK9dBOtdM2RtI+T5TllMLgoafM7QAroj+n6t0JeoAFsCY5KL4N
         Sgj8/AkkjK4GMfnZKAonfaufn9QOzLLgH7UJpYQ7OKLH/TGxMZUwG0LgXWlSnKWa/0Ot
         7lT75M/yiOAO7Zc72Cu+LUpVxIh3Vlt9OGeS9+4xxthrIkr0SciISR8Ia+5P0uFQxk6h
         doJ/U0hN7iFsV0IoVoc2xvPkX7HwByXvyIlNnEnQi1IEXQrDpVB0o9LvBA9qVih73mrL
         zCcF5NhvArB0Jsq7vULh0NTpHQEB03JMRjkud+OmknWuTIsZhSf3uA1Z+YpVqdtClgd1
         Gg+w==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: APjAAAV0bN9vzBJfWl38BQ+v7HBhc/rEZ5Ojej5lrTo+e4+r3UWdJHsF
	A/2mlqCRiXRwpUrjFO9X8XA=
X-Google-Smtp-Source: APXvYqwkCheUz7KNMLg5kZpPYozBPn7ctmU/bUnKHGC2cipyeqKg9NrX7GLCEaExsWDQ64gVj1SkRg==
X-Received: by 2002:a1c:a483:: with SMTP id n125mr12180087wme.3.1560155631524;
        Mon, 10 Jun 2019 01:33:51 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a5d:4d05:: with SMTP id z5ls3451175wrt.15.gmail; Mon, 10 Jun
 2019 01:33:51 -0700 (PDT)
X-Received: by 2002:a5d:6205:: with SMTP id y5mr12477381wru.340.1560155631019;
        Mon, 10 Jun 2019 01:33:51 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1560155631; cv=none;
        d=google.com; s=arc-20160816;
        b=f6w9VzaB7I8iAuR3mnXfp6YIkznqOCHMjrbnIN5+8+IWCQHYj05YYgaMqNN6wRSCyH
         V1wzANjeHAcZlitqdlcK2++Kv2z3lMAaxafmqS+AmFbY7HscqFOFvAZfvJ3giSU4djwC
         mTLSMjGzB0L8DZKpoE1LYiVIWPdrmAM395t9xSX0LpmD2P88+8egZ2wmGv/q+CVBanFq
         lCjpyG2Yw7fE8bZ56OumlSwroK1KnpyI85SaIyxRAAzFtjzqqzWO8u2RTwdlpXLoy23I
         mF8daJoOQtEFoeYxmfcx8y+ak6Cky5oOA9sZykoArb0B/zi6o6dcRnUFCuUNbxp/nlmx
         P+jQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:to:subject
         :dkim-signature;
        bh=NZtJB5qQ4gFuC4gwNxoOwWp+0cUnvg7Op0Wa/L06qyg=;
        b=i+tWLd5t8jgml1kqHn0QQYVO4G+K+/AsIHeFGhC7ECEhmtbPMgnBAd1taZT8Kk2ziN
         i0BNAx2fplTcMUT3BlD+SjFCfJzw9DPdXOKxoW5PmUOBfhYKoMaAtvYglWB5IJc8Phn3
         2x/xfxipmk9Fw0e+pLRSmPHU/1x/QDHJmHNO21HoKgwm9NgSTGUYJk6CnptlJb5dEvgR
         wGYUvMwe3r4KEFPj9+PrlxzCPr57+rc6kEIhUOnMVgGyzq5tY+ISbEEr3xystWvOQjpy
         yfc6ISBZotlYkHFDsKj1urh3472kpE+QbQHWAQtK9d2D0awcrFt2jtmZVl+BkrDK+b8v
         9TlQ==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       dkim=pass header.i=@web.de header.s=dbaedf251592 header.b=Yk+9Hxio;
       spf=pass (google.com: domain of jan.kiszka@web.de designates 212.227.17.11 as permitted sender) smtp.mailfrom=jan.kiszka@web.de
Received: from mout.web.de (mout.web.de. [212.227.17.11])
        by gmr-mx.google.com with ESMTPS id y131si401561wmd.0.2019.06.10.01.33.50
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 10 Jun 2019 01:33:51 -0700 (PDT)
Received-SPF: pass (google.com: domain of jan.kiszka@web.de designates 212.227.17.11 as permitted sender) client-ip=212.227.17.11;
X-UI-Sender-Class: c548c8c5-30a9-4db5-a2e7-cb6cb037b8f9
Received: from [192.168.2.196] ([188.96.0.15]) by smtp.web.de (mrweb101
 [213.165.67.124]) with ESMTPSA (Nemesis) id 0LpwB1-1gvOgr1aCd-00fezv; Mon, 10
 Jun 2019 10:33:50 +0200
Subject: Re: [PATCH v3 08/13] arm64: Initialise SMCCC backend
To: Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>,
 Jailhouse <jailhouse-dev@googlegroups.com>
References: <20190103180651.8171-1-ralf.ramsauer@oth-regensburg.de>
 <20190103180651.8171-9-ralf.ramsauer@oth-regensburg.de>
 <da6e4ea8-5b0f-c3c9-d2fb-3dfed845f158@web.de>
 <d48f69f1-77d0-a76c-6883-52de524a178d@oth-regensburg.de>
From: Jan Kiszka <jan.kiszka@web.de>
Message-ID: <3d00a4a3-aa75-39fd-8f04-1cd728e458b2@web.de>
Date: Mon, 10 Jun 2019 10:33:49 +0200
User-Agent: Mozilla/5.0 (X11; U; Linux i686 (x86_64); de; rv:1.8.1.12)
 Gecko/20080226 SUSE/2.0.0.12-1.1 Thunderbird/2.0.0.12 Mnenhy/0.7.5.666
MIME-Version: 1.0
In-Reply-To: <d48f69f1-77d0-a76c-6883-52de524a178d@oth-regensburg.de>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:wCGxxamEBIzXPfziaKUVvChesdkifhDaK4StY1Zf9gvbB2ZWLMV
 rPFEZigLkYYZoBwc7rOhQwlIFAgRdcvTnjszfR62WoJZgG0pIZgYVi6+dONAZsPhkog5p6A
 L2FkmeCpqx5gyBHEpR6BRmpBN7h0irxSNmP7fwvwcLwQnj1fqlZYWDNou9DvKKrAMVvST0k
 Yb5C5u0VeQWrLwlXMDkVg==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:FigDyIbYV7Q=:B32DIdbDn0n8DR7eiVw2Ao
 ff8N8lTConM+tvpkmrGNFPPU+0WaVZ9Y6gcshXg+lKbLZyz0JSsVSIOD5KizqrukLhiNEwK6T
 7D6AoPeIBcgQ4n61nzT6Trv+8W3Nf4jD/ugiKTWQPsbkMHl3qWNKOntOEZjZtovV6V/1TMXzf
 SWVaI0ua8QN3zqql/ZEs44bCni1+2RhJcTlh8hIVv5tZ9Cq8m9tkFckyQ/hMnwSPLrZV4PUHB
 vE4n5o5D/y4ALjvQ8rC+796a/bq6DSVSlAiSHTMHJAYs47Wedy2tB0cg/lf2DLr224XuTAen4
 qIOd7mJFrdExIx2+FNTcdXcvG+uG8v1I4kLKmQBI2S9smUYSd2dQbiBva0OYnqyc9cvfYofjx
 ilax0PYWx69xHKVitJod5SRGa+vfPgbYeY7aR9CJrUho7hO4YGU+9dZxMdJ1bVABRodOw/Qjq
 JJqcHVlJZqMcCEMCDHzqvEUHrodQNLIv8ca8UGnq8RRHAhOeItNVkH6XqQyXzrzM2OK1nFC7I
 ejc9Yx4KYauTvoMQ61clT4c9FblevQq70kIywMbfsY0aK1aExa/SqPEl9H764nl1YRGHkm/M4
 +5a4tOYjwacZ3O2yyj6zZGGXAErWUWp9weQ2xb1msGQDYotsXFyJMbYdmGFaPgIXjmUWibs39
 YHmu6VEKA2L79Yib4LVlkfhS1l+FEs5xdkNYOFwlJ8enLTJ3p6+JFADXgFhAyyb/qOgiKcKyL
 TJmlCXDqcZ90T/cDMt9fTrjc0R6be9wm+wTjBWG0GGQFrZhp5Jh2tNsCzzYtaA/NtBTnf3+uM
 vlPutebkadtrwxaWK7vmLtXI8mn2fy2jn/+CJfb+K8QYa2TBTXaHWTXV9KK/Cs8yej+hY2Tzt
 pgrw7/1QmYGQJX5Dm6NplZuIx/m6a9nITuGzG1Q9tgpzS57JBYXErFOBMsT8ZLpF8d8XTGViU
 2kLG4GgdW8auZwZ5N7+uuSW1B4EOizKniJSdF9rV2SQ9OyHNLhNSz
X-Original-Sender: jan.kiszka@web.de
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass
 header.i=@web.de header.s=dbaedf251592 header.b=Yk+9Hxio;       spf=pass
 (google.com: domain of jan.kiszka@web.de designates 212.227.17.11 as
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

On 10.06.19 00:06, Ralf Ramsauer wrote:
>
>
> On 6/9/19 3:37 PM, Jan Kiszka wrote:
>> On 03.01.19 19:06, Ralf Ramsauer wrote:
>>> by discovering its features.
>>>
>>> The first step is to check the PSCI version. Don't even try to do any
>>> SMCCC calls without having checked the proper PSCI version (current QEM=
U
>>> horribly crashes).
>>>
>>> Probe if SMCCC_ARCH_FEATURES is available. If so, probe for
>>> SMCCC_ARCH_WORKAROUND_1 and expose its availability by setting a flag
>>> inside the percpu structure.
>>>
>>> The availability is stored per-cpu, as we might have big.LITTLE systems=
,
>>> where only a subset of cores need mitigations.
>>>
>>> Signed-off-by: Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>
>>> ---
>>>  =C2=A0 .../arch/arm-common/include/asm/percpu.h=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 |=C2=A0 3 ++
>>>  =C2=A0 .../arch/arm-common/include/asm/smccc.h=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 |=C2=A0 5 +++
>>>  =C2=A0 hypervisor/arch/arm-common/setup.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0 3 ++
>>>  =C2=A0 hypervisor/arch/arm-common/smccc.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 | 32 +++++++++++++++++++
>>>  =C2=A0 .../arch/arm/include/asm/percpu_fields.h=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 |=C2=A0 1 +
>>>  =C2=A0 .../arch/arm64/include/asm/percpu_fields.h=C2=A0=C2=A0=C2=A0 |=
=C2=A0 1 +
>>>  =C2=A0 6 files changed, 45 insertions(+)
>>>
>>> diff --git a/hypervisor/arch/arm-common/include/asm/percpu.h
>>> b/hypervisor/arch/arm-common/include/asm/percpu.h
>>> index b9278117..4b37e1be 100644
>>> --- a/hypervisor/arch/arm-common/include/asm/percpu.h
>>> +++ b/hypervisor/arch/arm-common/include/asm/percpu.h
>>> @@ -15,6 +15,9 @@
>>>
>>>  =C2=A0 #define STACK_SIZE=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0 PAGE_SIZE
>>>
>>> +#define ARM_PERCPU_FIELDS=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0 \
>>> +=C2=A0=C2=A0=C2=A0 bool smccc_has_workaround_1;
>>> +
>>>  =C2=A0 #define ARCH_PUBLIC_PERCPU_FIELDS=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 \
>>>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 unsigned long mpidr;=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 \
>>>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 \
>>> diff --git a/hypervisor/arch/arm-common/include/asm/smccc.h
>>> b/hypervisor/arch/arm-common/include/asm/smccc.h
>>> index 563ab9ef..6c490fad 100644
>>> --- a/hypervisor/arch/arm-common/include/asm/smccc.h
>>> +++ b/hypervisor/arch/arm-common/include/asm/smccc.h
>>> @@ -12,6 +12,8 @@
>>>
>>>  =C2=A0 #define SMCCC_VERSION=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0 0x80000000
>>>  =C2=A0 #define SMCCC_ARCH_FEATURES=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0 0x80000001
>>> +#define SMCCC_ARCH_WORKAROUND_1=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 0x80008000
>>> +#define SMCCC_ARCH_WORKAROUND_2=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 0x80007fff
>>>
>>>  =C2=A0 #define ARM_SMCCC_OWNER_MASK=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 BIT_MASK(29, 24)
>>>  =C2=A0 #define ARM_SMCCC_OWNER_SHIFT=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 24
>>> @@ -33,4 +35,7 @@
>>>
>>>  =C2=A0 #define SMCCC_IS_CONV_64(function_id)=C2=A0=C2=A0=C2=A0 !!(func=
tion_id & (1 << 30))
>>>
>>> +struct trap_context;
>>> +
>>> +void smccc_discover(void);
>>>  =C2=A0 enum trap_return handle_smc(struct trap_context *ctx);
>>> diff --git a/hypervisor/arch/arm-common/setup.c
>>> b/hypervisor/arch/arm-common/setup.c
>>> index 4cc045ec..2a04cdb7 100644
>>> --- a/hypervisor/arch/arm-common/setup.c
>>> +++ b/hypervisor/arch/arm-common/setup.c
>>> @@ -14,6 +14,7 @@
>>>  =C2=A0 #include <jailhouse/paging.h>
>>>  =C2=A0 #include <jailhouse/processor.h>
>>>  =C2=A0 #include <asm/setup.h>
>>> +#include <asm/smccc.h>
>>>
>>>  =C2=A0 static u32 __attribute__((aligned(PAGE_SIZE)))
>>> parking_code[PAGE_SIZE / 4] =3D {
>>>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ARM_PARKING_CODE
>>> @@ -42,5 +43,7 @@ int arm_cpu_init(struct per_cpu *cpu_data)
>>>
>>>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 arm_paging_vcpu_init(&root_cell.arch.mm=
);
>>>
>>> +=C2=A0=C2=A0=C2=A0 smccc_discover();
>>> +
>>>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 return irqchip_cpu_init(cpu_data);
>>>  =C2=A0 }
>>> diff --git a/hypervisor/arch/arm-common/smccc.c
>>> b/hypervisor/arch/arm-common/smccc.c
>>> index 211d6cd7..37c05b42 100644
>>> --- a/hypervisor/arch/arm-common/smccc.c
>>> +++ b/hypervisor/arch/arm-common/smccc.c
>>> @@ -11,10 +11,42 @@
>>>  =C2=A0=C2=A0 */
>>>
>>>  =C2=A0 #include <jailhouse/control.h>
>>> +#include <jailhouse/printk.h>
>>>  =C2=A0 #include <asm/psci.h>
>>>  =C2=A0 #include <asm/traps.h>
>>> +#include <asm/smc.h>
>>>  =C2=A0 #include <asm/smccc.h>
>>>
>>> +void smccc_discover(void)
>>> +{
>>> +=C2=A0=C2=A0=C2=A0 int ret;
>>> +
>>> +=C2=A0=C2=A0=C2=A0 ret =3D smc(PSCI_0_2_FN_VERSION);
>>> + > +=C2=A0=C2=A0=C2=A0 /* We need >=3DPSCIv1.0 for SMCCC */
>>> +=C2=A0=C2=A0=C2=A0 if (PSCI_VERSION_MAJOR(ret) < 1)
>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 return;
>>> +
>>
>> This breaks on ARMv7, at least on sunxi (Orange Pi Zero). I first
>> thought it was
>> because U-Boot returning -1, instead "0.2". But then it turns out that
>> the smc
>> itself does not return. I'm starting to believe we do not get the call
>> through
>> the hyp stub of the kernel, which is still active during smccc_discover
>> on ARMv7
>> (in contrast to ARMv8, where we take over first).
>>
>> Do we support fixing on ARMv7 at all? Otherwise, the invocation of this
>> should
>> be moved to ARMv8 only.
>
> Not yet. I have to check if mitigations are already supported/available
> on ARMv7. I'll try to find some time to implement mitigations if availabl=
e.
>
>>
>> Jan
>>
>> PS: This change was untested on the Orange Pi until today and my attempt=
 to
>> demonstrate jailhouse next during a live demo at MiniDebConf...
>
> Too bad, I'm sorry. I hope you were able to jump over to a working
> checkout. But you took the risk of an untested next. Which reminds us of
> the lack of continuous testing...

I only thought I tested, but in the middle of finishing slides and creating=
 the
demo playbook, I always only flashed and booted 0.10...

Jan

--=20
You received this message because you are subscribed to the Google Groups "=
Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/=
jailhouse-dev/3d00a4a3-aa75-39fd-8f04-1cd728e458b2%40web.de.
For more options, visit https://groups.google.com/d/optout.
