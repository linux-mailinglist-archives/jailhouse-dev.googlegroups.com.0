Return-Path: <jailhouse-dev+bncBDDNLV6S7AOBBENEZP5QKGQEBGNZGXQ@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-lf1-x13b.google.com (mail-lf1-x13b.google.com [IPv6:2a00:1450:4864:20::13b])
	by mail.lfdr.de (Postfix) with ESMTPS id AE33927BCFA
	for <lists+jailhouse-dev@lfdr.de>; Tue, 29 Sep 2020 08:20:02 +0200 (CEST)
Received: by mail-lf1-x13b.google.com with SMTP id 134sf2821043lfm.6
        for <lists+jailhouse-dev@lfdr.de>; Mon, 28 Sep 2020 23:20:02 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1601360402; cv=pass;
        d=google.com; s=arc-20160816;
        b=ykvKpAwmFm8NCTPKX1hWIRQwu3y3aaiTrxhi8kpFl0MqCmx7QCXAY/elXtAFdmUdq0
         6jA4knUrkuVV/9ZEr1iyV+zY2Ra4x9qmxrvYno7nrEnbKX71FiTL6PX9m9iP1PsKlvTK
         6mzXHcUw+9t6JHMSi7HbnfvEZaUJ8IwVbk1zqm6CoPlNKL+2sjQQOrTH7zuPk+QRq8hF
         Ij5TtdA+4YMUYYAjLt46F6Xuvus0KyLiVNt628niBvZXQv9ECjTzkBTc5/rrNnrVrZ01
         bb6OVyTYjjS/qtDogNYpktQu5Tq5kmzUdj6LhIPa9qNXRaKLWkD9h1fOu4OuD2xIhNHQ
         7n6Q==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:cc:to:subject:sender:dkim-signature;
        bh=JQ5b9qcXmB0FpBbOvSTD3pystVVd5avwl/bPw1OMFk8=;
        b=RVHCGCOhyGcMwleBP5acIvtg5LtVFGajApQ8GjEJtvTK0N8D37UgacMKdkb6rQa6gq
         SfsUWwjmSerVqaWybkmRbGMJWBTEfoA1bJfeJBJ02GyncL8IUJH4jjMTnQRfVBgZEucQ
         iUjyvPcDJgG1M6m/aGl5WWKcVdz9nkwZHbWPeDYcR7fZpdMInXghIlrUCxiU0Mr9ca4M
         vbgx6cuU3BfQpgVFXRRDEv8qqR89/S6wPe6CpYac13EMe4bjXymwRqi1bM+mH8okWXiS
         4h2zKuYFHkkJihuf2ldP6e19dROZ6ClxM0vYp0sJB2f0/uhhV6NS4xn8zmZCH4DNb8xF
         6Qww==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass header.i=@web.de header.s=dbaedf251592 header.b=ZLNOceRq;
       spf=pass (google.com: domain of jan.kiszka@web.de designates 212.227.15.14 as permitted sender) smtp.mailfrom=jan.kiszka@web.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding
         :x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=JQ5b9qcXmB0FpBbOvSTD3pystVVd5avwl/bPw1OMFk8=;
        b=jdGty9WREXyKy2XKrCAp6LexecjiKxazKLEMxk93pzC6XkSwwYWPnZiREkWKf0ByBt
         06ZgM5/K2+bCkDq9eSnwCpCEqsQRSJQGIfcldVBkvEDH8Ne9Hdd5kQPVJmlnVtneWemX
         aC0qs3XYHp28utJlyiKssobS/KzRn+UNUu0L6ebbYzvInruRGDmsW/9DDT3mMvTepqhP
         nouIyMP39IDmWbTkhhNm2UNfjXzGHpprSlrivAUysnuYpDMk8gS4s5RrHR2FuQcSSZJu
         jRdVtQzR0kphM9FxmTzhOFfdsWNbBRsE0iMA8wPEzgyyi4TrauJIaRka7SOirRecKDSV
         ++EA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:subject:to:cc:references:from:message-id
         :date:user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :x-spam-checked-in-group:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=JQ5b9qcXmB0FpBbOvSTD3pystVVd5avwl/bPw1OMFk8=;
        b=Lxdj86X61wUVSMOaXIZWR5CrbdU1g1WBaVQ2tFh6bc+8CkgGOvtMNmsp6drhJTGj+P
         F6TKSGoZKN12yVa2JSCQooGWpDs17NwCBj+y1mILwG+IwLeAtPXG3JrGPkLaQLLW8u0V
         X8LY7Zoa462a8I0unyop2jr+tdHVznW1MrNRoZYOOrrFiPNQ9H65lqEaDjyeVPXENECx
         /MhuJJMYW0de24U4sl09Xft8Ql3iDKXLyeKM7teOXZhIYvFDNx0QjgJxWbJ+BJETF29B
         kSq8tTYz2xG1fCnqZLLODF8/1PGTuro1A9ECvQM8aV0Ow/s4iqaSJb0Daq9HzunPCIEN
         WRqw==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AOAM532/20mrpX0IfOe018RQaTcZ3sAhcuCLyNnraQ4yYpjgIS343E9g
	n1CblL01uM/f4v9Fm6aya5Y=
X-Google-Smtp-Source: ABdhPJzmoUKNhbg6Oo0x6SC6z+8TztM8TGBNVbubWQtJn2oX6l0lN+qDRQ6q+0zhotcKSZwUTIrm0w==
X-Received: by 2002:a19:a45:: with SMTP id 66mr631507lfk.479.1601360402008;
        Mon, 28 Sep 2020 23:20:02 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a2e:9a93:: with SMTP id p19ls570617lji.7.gmail; Mon, 28 Sep
 2020 23:20:00 -0700 (PDT)
X-Received: by 2002:a2e:3809:: with SMTP id f9mr696107lja.5.1601360400382;
        Mon, 28 Sep 2020 23:20:00 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1601360400; cv=none;
        d=google.com; s=arc-20160816;
        b=S25RmaHTlE6bWDm7R4MfafwDVGPaOwMqjG/AEeJdzutKXq/xeanWk5sEWwVy5WNAyn
         DAZ8Yu2FnW3aq9n4zRVjCB884CmCQjrJG00ZZ1SuirW3Sfw03wnROSWSZPo8J97zdfTj
         Bu0/Q2b9Mi4L4UThY3ZcmYmQ9lEkIdkd/lPMG9tY1SRdXajVeRV5VEsmoPdHTUdnPeTd
         xGJ3dBDsGbYBv6ZcRQDSgcZ/Drpz6uJC3HlIX9AnbaY7Fl0wIDRX9QeKcQvmxF/fnfol
         7tde1db4gr6gNsO/o9yB0TFr6ho3e5ORiuWB/sQYcbei8/CUckuFJBXRXZHg9KdGCZ/c
         zy2A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:cc:to:subject
         :dkim-signature;
        bh=uy3bx9Z3r3kW+fEe4eMyll4Soy4rCwUJdGnlOi0oZv4=;
        b=Nq3G9NRiIAymxtFSYRe6DMruZglu7xAJ/zsTBZ/+Dp6E9IvxwHkhUezc4bLeeWKNKb
         j8HAzjRXS9c3EX5MkK/lOqcaZI8lDiBfKYBCE511rqo65DsMeQlHbAWxaAOaGf4Ws325
         whb5j72Qh2J03Q9jJLEHE0npfQn2SJVjWHx1oN1sba6AMOLwsQJhXfXHPa+z7spEf/6F
         GuVAEinBNme4hKlc5Up5ogyMVtYurL0L+Gdkf8SSOtPVSnfJGv1UwYl64qQRQuFa6drs
         Gr4zi+kcots77PIyj0NGxJyf6D90Rk/78r8f+boFbFX30OKb6ZOL0WqOzbL+PXLSK8jr
         mewQ==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       dkim=pass header.i=@web.de header.s=dbaedf251592 header.b=ZLNOceRq;
       spf=pass (google.com: domain of jan.kiszka@web.de designates 212.227.15.14 as permitted sender) smtp.mailfrom=jan.kiszka@web.de
Received: from mout.web.de (mout.web.de. [212.227.15.14])
        by gmr-mx.google.com with ESMTPS id y75si90840lfa.3.2020.09.28.23.20.00
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Sep 2020 23:20:00 -0700 (PDT)
Received-SPF: pass (google.com: domain of jan.kiszka@web.de designates 212.227.15.14 as permitted sender) client-ip=212.227.15.14;
X-UI-Sender-Class: c548c8c5-30a9-4db5-a2e7-cb6cb037b8f9
Received: from [192.168.10.10] ([88.215.87.53]) by smtp.web.de (mrweb004
 [213.165.67.108]) with ESMTPSA (Nemesis) id 0M5sDZ-1kcbZu1asz-00xreB; Tue, 29
 Sep 2020 08:19:59 +0200
Subject: Re: arm64-zero-exits trouble
To: Chase Conklin <Chase.Conklin@arm.com>,
 Oliver Schwartz <Oliver.Schwartz@gmx.de>
Cc: Jailhouse <jailhouse-dev@googlegroups.com>,
 Mark Rutland <Mark.Rutland@arm.com>,
 Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>
References: <91E9F831-4F9A-4444-AD9A-3E5C56D3CA70@gmx.de>
 <e0d4c689-8cc3-afb0-5a75-b57229feba1f@siemens.com>
 <0F31A760-66D4-4430-BE71-6126FCF5AD60@gmx.de>
 <64bb13f6-6ae2-09ce-4c61-4c406a360c05@siemens.com>
 <F1455873-4D81-412E-AE3F-B584773FBB29@gmx.de>
 <ac29332c-0c28-2f3f-2ec2-5b0642fff951@siemens.com>
 <f3ca2e5c-b843-db9a-aa8c-864abd2c54e1@siemens.com>
 <2a039ddc-bd8f-eaf9-2494-7f62efb9aa80@siemens.com>
 <1efb0fb2-8acf-0ebc-00bf-ce059c9ae833@web.de>
 <BF1D4C66-E86B-43EB-BCC6-1ED0AECD82AB@arm.com>
From: Jan Kiszka <jan.kiszka@web.de>
Message-ID: <9508729a-1756-e63a-d437-9d491f822f06@web.de>
Date: Tue, 29 Sep 2020 08:19:58 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.0
MIME-Version: 1.0
In-Reply-To: <BF1D4C66-E86B-43EB-BCC6-1ED0AECD82AB@arm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:OROr3dmAvXZvDR9o5AWejWAUfGQ8BCEdmcSbDzdj+/CLFecHAt7
 k2cH7H4N6UeLlhbC0qyKGZkweCsi/FGolLzH0zzHx6u5K0jEtIuuL6GhheumrHPxgbCNnDe
 m09V5HDqL0T3uuZOxlY3NirUnYFhdtReoEHhrQTgnFfQUhapxtxG16PXJY28PgOWD4tTf35
 h9rXe+26zHCklDnxXZvoQ==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:fZckBXUevVY=:GduSRFSZdLBoiGyLQmgLl6
 O0989cU2iaLvAGQKzI1Ug5YAretk84KrJ8tYQ+iT10JnRc5NWHKNe+UsPTMjg6voQzMZrn+eJ
 9xprPRda6llmtymLDo2sF4jv8KVQVbbYWvOh0G0ZiRgv4y+McETZKH4Uugd0NYpQx6YeOXKdd
 1T6h9ChU4oPMRhnTCxX6dsokQ87UgMzueU3v4Jm+OoglVMI5d+MxwAanr6BbV8Sm2rar7wlNy
 MlH1ldkeCDGStGR18lejsNm8Su0ThIqvtW17wKCeI5g/4yV4SBaTtuGE8aIjXTAAK1UzVEbnc
 z6QDieXzo13k0x7Gz33pf+P8EwP7rLaRJ/fI4/wdDnfrv7g9jxoD1eFVOEwyNF0YWnqW+t4wY
 Hg/ikY6qk5kipd1bxN3u7OJl31HJRf8IcEDGzHuyyyzpM7e52PEQNcYQ70xpP8IgwsIhZPbCV
 P9N7ClTcsGXoWMj8a1DAeOCPwWOTt4J1R+Ae/Y/1aHpHq/0o3WgqT3d3lJyF+5D1nRW1wZ+na
 19P1izjMrUKoZLAzxB90APisq2rFYuPKRyXATqmk12fmexgIOYbcowXiQDsG4UuzPliyoxXjS
 o0qQKPwkZtMgPE6/X/iHjWRAYzPZGQBqdACDIBcCV27BcElYVZT3TIY5mAF2yxUmfUweMhm8+
 T4QwTp55TFvDTTILm47RREMgFD/xWlI4G08dyzaq4Wps3UakADxucV7tCeVmr+P9wRfOkcVmG
 ZXMquMF85B/vfZIRkGP5MQx9IEYRhs5W2YhnnC8XVnEfV/txWbiu7A//FhWpIheOtv78tIG+I
 V+fwItBeWwA1OBm0Qu4pJeDZQr14vAQe/Yz9CHu8tItDXlWRcbai3sPSfb9q1VbvkPRrc1trZ
 lHtChrlXJS8BMJGFhDA91tUHy7CHmZBsaxRFhYwLvRaSKyM8QbrjR7ru6o73JZYiUM/JmqTHE
 bDt9C7UxqOsM/FBqq5H1ayCm3pe0OmF7T1ssupESmriXZUwRu8eAlgU3p4M54ZFWsai+5TCFh
 yxIAq3Q+ujzaM5FmVno5H+6rNytt2j2e166QiBb+3wV0RshRUee2GLLN9NNlGko4YLReE9E0U
 3BVGQpAnb9wnDiwaJ8PACfWAGlyh4cbgB3oULlgvy4hUaxOnfM5q8OezPL68gfHiWsaeVgg3f
 mYQ6V1mRPwL1W9WW12pXDK9fOIVqlC1eiCJxxr1Uq8F1cUBaju3S9aKW5bFpyyNFuQj8+eRUb
 j4sLQCfMAASNmIpxTemmTaVZHzFIbtmaugr27Zw==
X-Original-Sender: jan.kiszka@web.de
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass
 header.i=@web.de header.s=dbaedf251592 header.b=ZLNOceRq;       spf=pass
 (google.com: domain of jan.kiszka@web.de designates 212.227.15.14 as
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

On 28.09.20 19:17, Chase Conklin wrote:
> On 26.09.20 4:06, Jan Kiszka wrote:
>> On 25.09.20 16:53, Jan Kiszka wrote:
>>> On 25.09.20 16:44, Jan Kiszka wrote:
>>>> On 25.09.20 16:21, Jan Kiszka wrote:
>>>>> On 17.09.20 10:36, Oliver Schwartz wrote:
>>>>>>
>>>>>>
>>>>>>> On 17 Sep 2020, at 09:31, Jan Kiszka <jan.kiszka@siemens.com> wrote=
:
>>>>>>>
>>>>>>> On 17.09.20 09:16, Oliver Schwartz wrote:
>>>>>>>>> On 15 Sep 2020, at 11:00, Jan Kiszka <jan.kiszka@siemens.com <mai=
lto:jan.kiszka@siemens.com>> wrote:
>>>>>>>>>
>>>>>>>>> On 15.09.20 09:07, Oliver Schwartz wrote:
>>>>>>>>>> I=E2=80=99m currently trying out the arm64-zero-exits branch and=
 got stuck.
>>>>>>>>>> System is a Xilinx ZU9EG on a custom board, similar to zcu102. I=
=E2=80=99ve brought ATF up to date and patched it with Jans patch to enable=
 SDEI. If I don=E2=80=99t enable SDEI in ATF everything works as expected (=
with VM exits for interrupts, of course). Jailhouse source is the tip of br=
anch arm64-zero-exits.
>>>>>>>>>> If I enable SDEI in ATF, jailhouse works most of the time, excep=
t for when it doesn=E2=80=99t. Sometimes, =E2=80=98jailhouse enable=E2=80=
=99 results in:
>>>>>>>>>>> Initializing processors:
>>>>>>>>>>>  CPU 1... OK
>>>>>>>>>>>  CPU 0... /home/oliver/0.12-gitAUTOINC+98061469d0-r0/git/hyperv=
isor/arch/arm64/setup.c:73: returning error -EIO
>>>>>>>>>
>>>>>>>>> Weird - that the SDEI event enable call.
>>>>>>>>>
>>>>>>>>>>> FAILED
>>>>>>>>>>> JAILHOUSE_ENABLE: Input/output error
>>>>>>>>>> I=E2=80=99ve seen this error only when I enable jailhouse throug=
h some init script during the boot process, when the system is also busy ot=
herwise. When starting jailhouse on an idle system I haven=E2=80=99t seen t=
his.
>>>>>>>>>
>>>>>>>>> Possibly a regression of my recent refactoring which I didn't man=
age to test yet. Could you try if
>>>>>>>>>
>>>>>>>>> https://github.com/siemens/jailhouse/commits/e0ef829c85895dc6387d=
5ea11b08aa65a456255f
>>>>>>>>>
>>>>>>>>> was any better?
>>>>>>>>>
>>>>>>>>>> Sometimes it may hang later during =E2=80=98jailhouse enable=E2=
=80=99:
>>>>>>>>>>> Initializing processors:
>>>>>>>>>>>  CPU 1... OK
>>>>>>>>>>>  CPU 0... OK
>>>>>>>>>>>  CPU 2... OK
>>>>>>>>>>>  CPU 3... OK
>>>>>>>>>>> Initializing unit: irqchip
>>>>>>>>>>> Using SDEI-based management interrupt
>>>>>>>>>>> Initializing unit: ARM SMMU v3
>>>>>>>>>>> Initializing unit: PVU IOMMU
>>>>>>>>>>> Initializing unit: PCI
>>>>>>>>>>> Adding virtual PCI device 00:00.0 to cell "root"
>>>>>>>>>>> Page pool usage after late setup: mem 67/992, remap 5/131072
>>>>>>>>>>> Activating hypervisor
>>>>>>>>>>> [    5.847540] The Jailhouse is opening.
>>>>>>>>>> Using a JTAG debugger I see that one or more cores are stuck in =
hypervisor/arch/arm-common/psci.c, line 105.
>>>>>>>>>> It may also succeed in stopping one or more CPUs and then hang (=
again with one or more cores stuck in psci.c, line 105):
>>>>>>>>>>> [    5.810220] The Jailhouse is opening.
>>>>>>>>>>> [    5.860054] CPU1: shutdown
>>>>>>>>>>> [    5.862677] psci: CPU1 killed.
>>>>>>>> Now, with the first problem solved I=E2=80=99ve digged into the se=
cond one. It=E2=80=99s actually a bit worse than in my initial description:=
 If I just do =E2=80=98jailhouse enable=E2=80=99 the system will always han=
g a few milliseconds after the command completes - the only exception is wh=
en =E2=80=98jailhouse create=E2=80=99 is executed immediately afterwards (w=
hich creates an inmate that uses 3 of 4 CPU cores, leaving just one for Lin=
ux), which succeeds roughly on every second try. I didn=E2=80=99t notice th=
is initially because I usually start jailhouse with a script that does =E2=
=80=98enable=E2=80=99 and =E2=80=98create=E2=80=99.
>>>>>>>> The reason for the hangs seems to be the psci emulation in Jailhou=
se, in particular the CPU_SUSPEND calls. These are issued from my (Xilinx-)=
 kernel frequently if Linux has more than one core available. With SDEI dis=
abled the core can be woken up again by some interrupt. With SDEI enabled, =
the core waits forever on the wfi intstruction. Because a suspended core ne=
ver wakes up again the whole system hangs at some point.
>>>>>>>> Any ideas why no interrupts are seen anymore in psci? My guess is =
that it=E2=80=99s because the inmate (Linux) now has full control over the =
GIC, so it may disable any interrupts before suspending a core, without Jai=
lhouse noticing. If this is the case, it may be necessary to re-enable the =
IRQs before executing wfi. But I=E2=80=99m missing the big picture here - w=
hat interrupt is the core waiting for in the first place? Any other thought=
s?
>>>>>>>
>>>>>>> You likely found a bug in the SDEI feature of Jailhouse. The CPU_SU=
SPEND emulation assumes non-SDEI operation, i.e. interception of interrupts=
 by the hypervisor, but that is not true in this mode.
>>>>>>>
>>>>>>> We need a way to wait for interrupts without actually receiving the=
m when they arrive, but rather return to EL1 then. Maybe re-enabling interc=
eption, waiting, and then disabling it again before returning would do the =
trick. But then I also do not understand yet why https://github.com/bao-pro=
ject/bao-hypervisor/blob/master/src/arch/armv8/psci.c gets away with wfi. P=
ossibly, they run with interrupts on through the hypervisor, though that wo=
uld not be straightforward either.
>>>>>>
>>>>>> The good news is that there=E2=80=99s an easy workaround, at least o=
n my system: disabling suspend calls before starting jailhouse
>>>>>> (echo 1 >  /sys/devices//system/cpu/cpu<n>/cpuidle/state1/disable).
>>>>>>
>>>>>
>>>>> Seems the reason I was not seeing this so far is that my config [1] w=
as
>>>>> lacking CONFIG_ARM_PSCI_CPUIDLE. Seeing it now as well, let's debug.
>>>>>
>>>>
>>>> My ideas seems to work (quick hack):
>>>>
>>>> diff --git a/hypervisor/arch/arm-common/psci.c b/hypervisor/arch/arm-c=
ommon/psci.c
>>>> index 6a9abf60..3bb3f6a8 100644
>>>> --- a/hypervisor/arch/arm-common/psci.c
>>>> +++ b/hypervisor/arch/arm-common/psci.c
>>>> @@ -101,6 +101,14 @@ long psci_dispatch(struct trap_context *ctx)
>>>>
>>>>  case PSCI_0_2_FN_CPU_SUSPEND:
>>>>  case PSCI_0_2_FN64_CPU_SUSPEND:
>>>> +if (sdei_available) {
>>>> +unsigned long hcr;
>>>> +arm_read_sysreg(HCR_EL2, hcr);
>>>> +arm_write_sysreg(HCR_EL2,
>>>> + hcr | HCR_IMO_BIT | HCR_FMO_BIT);
>>>> +asm volatile("wfi" : : : "memory");
>>>> +arm_read_sysreg(HCR_EL2, hcr);
>>                           ^^^^^^
>> Argh...
>>
>>>> +} else
>>>>  if (!irqchip_has_pending_irqs()) {
>>>>  asm volatile("wfi" : : : "memory");
>>>>  irqchip_handle_irq();
>>>>
>>>> Now, if someone with more architectural knowledge than I could explain
>>>> why that's the case and if that will work on all platforms, with both
>>>> GICv2 and v3 (and maybe even v4), we could convert that into real patc=
h.
>>>> Trying my luck on the CC list...
>>>>
>>>
>>> N=C3=A4=C3=A4, I was too quick: wfi works, i.e. the hypervisor is woken=
 up on
>>> pending interrupts, but some more bits than simply clearing IMO/FMO in
>>> HCR are needed in order to forward that pending irq event to EL1 when
>>> returning to it.
>>>
>>
>> With the above fixed to 'write', it now works fine here.
>>
>> While trying to understand what goes wrong, I also read what happens in
>> the IMO/FMO-disabled case when an interrupt arrives while in EL2: It
>> does not count as wakeup event for wfi. Only if IMO/FMO are set (or
>> TGE), we are kicked out of wfi. And that's actually independent of the
>> GIC model.
>
> Hi Jan,
>
> That matches my understanding.
>
>> What's once again unclear to me is if/where I need isb. Before the wfi?
>> Also after restoring HCR_EL2?
>
> Definitely before the wfi. The architecture doesn't guarantee that the
> write to HCR_EL2 takes effect prior to a context synchronization event,
> so it's architecturally permissible (though perhaps unlikely in
> practice) for the wfi to not treat the interrupt as a wfi wake-up event
> without an isb between the HCR_EL2 write and wfi.
>
> As it's currently written, I don't think you'll need an isb after the
> wfi. Jailhouse never unmasks interrupts, so there's no risk of an
> unexpected Current-EL IRQ/FIQ. The return path to the guest doesn't
> include any other manipulation of interrupts. As a result, Jailhouse
> isn't affected by the setting of IMO/FMO prior to returning to the
> guest; the context synchronization event that takes place as part of
> the eret is sufficient to ensure the clearing of IMO/FMO take effect for
> the guest. Be sure to revisit this code if you choose to make use of the
> ExS feature from v8.5.
>

Thanks for looking into this! I already had a isb before the wfi. Will
send out the patches soon then.

Jan

--=20
You received this message because you are subscribed to the Google Groups "=
Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/=
jailhouse-dev/9508729a-1756-e63a-d437-9d491f822f06%40web.de.
