Return-Path: <jailhouse-dev+bncBCJI7SMNV4NBB7XZW75QKGQEDUEUVWI@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-wm1-x33b.google.com (mail-wm1-x33b.google.com [IPv6:2a00:1450:4864:20::33b])
	by mail.lfdr.de (Postfix) with ESMTPS id 18DA8278ACA
	for <lists+jailhouse-dev@lfdr.de>; Fri, 25 Sep 2020 16:21:51 +0200 (CEST)
Received: by mail-wm1-x33b.google.com with SMTP id t8sf891251wmj.6
        for <lists+jailhouse-dev@lfdr.de>; Fri, 25 Sep 2020 07:21:51 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1601043710; cv=pass;
        d=google.com; s=arc-20160816;
        b=vVOfzus0yGNPRNtkD6Jw6ncxiLNNz9WhixtoKvnk3ohvISHTELcLEiGNmCvWMYMEVl
         3SkxhZKYB7qzkg1yl7BqOx9vEFHzKPKoxMH18IvVlRqDoB+tylwEj8RECATkkemCchhC
         VCMdMoFnUZoUGHQyZxms5zAZhzZW5ZF/C2wEfNQTmfXn1tBESb+0oOnydFy75SYmNGPf
         80Zdd8oFQnnbBSt7UrOR9ZldCgEfLdU47dtL5VKfzivDT5Nu59xOGgZseoMM6zTrkkpA
         te/wtR99pVk/2KmREFEjj/7nh9sCYUrsGWt1PRf/MU3ani6/LFmaWijO4UXgT/QP/rNY
         zFUQ==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:cc:to:subject:sender:dkim-signature;
        bh=jScgkKMprddnoYW7as7SL4V/L03PzFFqZRxPGJXspDs=;
        b=j9roPWlGcsODVIQw37ug6+UIwcDM8FImT/38vK+1P/2YLACwuJhtezLeoAsQsmnOzp
         T6qvwO47Q3Nytfm+dZc9u2GK7mhcFja+80OmQr5Lf5OB/jsHgVSWzyB9UBbSClILuP8c
         II0Da9+obggLl8eK1P4wZLze8ZJ4oY9X3wZ1fBBxl+Pg5tD850RlbBKzP4ZDI2d8ru+c
         3XqEHDI/xI8689HbKoTe/gOzghiXUBggHmT/ycgnMPd70/RzXyMFEdZLDLWljXqdgFts
         McTb8hrriS/CUNKO1THWYlWF5WUwq5qFle7is/SXzqiKs5oewSm+0p98+mi7wsgevEC5
         nIGA==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.14 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding
         :x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=jScgkKMprddnoYW7as7SL4V/L03PzFFqZRxPGJXspDs=;
        b=pxv08y9esIcLLnxi1iuV1UOw+Qp7c80n0WgfFybC2OzR33XmM/aaO3qATXgDZUSUQy
         uvy+tQhxyEDFjsTDMiYiJLHcL3tKtWf/NSL4bE7Q+1zhs3/Uh32SfnFwoC/2uoAzbrSF
         Ugkw1yY9Q6OZvrqVAsNiHjuELepErucBX2mhBc+Kpug/oFspzPdYnvRe0y7W18/E15Qe
         WKF5P5xqRjGFri0CnEjRjo01X24pA14uDPlJ+1rgo6LRrI23QLGsVV0jq7lAdpfF+7Sq
         sJ8+nrySmv2ptdgeCsWF6bHcnGYvjssw/YEmyy26WD6jqPjRN0PpbDpIT6trIn7KKvef
         +Ekg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:subject:to:cc:references:from:message-id
         :date:user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :x-spam-checked-in-group:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=jScgkKMprddnoYW7as7SL4V/L03PzFFqZRxPGJXspDs=;
        b=UjBJs98vInXyGISLV2kZYy85M2SfbAM5V/Ar7ZM8gd9R3Q9xFhVQsUC2mZUcaRjKZD
         hfLeb6KULrj/4XoYVvo3IEuUofVxfAJBmx6o98RBU4yV3GJMrIJvGOAN2wHbjJW9iiHL
         CcoCyoRhsVlJgixnrMwbvc4Zt0swUy+imoE+CfcB38stCJyGnWo6cBMaDWD92CHvk3X6
         kMSTgEcKxCTg+h2IshUddmPCfKvtFsDAGU6zU4lE3rkN4u1VwnHHZ0R4SIgW1RMihnVT
         voGN4Lo2TpJpyoirYwfk3/FIocMvGj4p7N+wK2tifPvf1+c9cJWiazo7IKzBhvsPsvo3
         6LcA==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AOAM53372eYr6VKicG6ZHySQegVfmUwGmwTy9U8/3JBFkXDb06aO4tUe
	Qs94unLLhMw5HjUrDEqtf3A=
X-Google-Smtp-Source: ABdhPJzw8MbdohOrmlEhvaXkXLiKpyaqArUO0RKmiH27mYvmbJi62qCqUQukhYzaCyENIUtoQY430A==
X-Received: by 2002:a1c:f20b:: with SMTP id s11mr3559981wmc.144.1601043710802;
        Fri, 25 Sep 2020 07:21:50 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a05:6000:8:: with SMTP id h8ls3761106wrx.3.gmail; Fri, 25
 Sep 2020 07:21:49 -0700 (PDT)
X-Received: by 2002:adf:c5c3:: with SMTP id v3mr4917366wrg.205.1601043709693;
        Fri, 25 Sep 2020 07:21:49 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1601043709; cv=none;
        d=google.com; s=arc-20160816;
        b=EX5GV9aCS82/bScnruBbJqPAIgExoFcDg8buxmCdVL0PVJuiEuJQSamF2HuNf6pOmR
         W0vJmFVtd5Lkpdx/EwcY7MvkxPvLsOFfjxKdDGmFVIgYMboKtdgwWjOppWw1ze+u7gm6
         E21SABVi6lmBfNO0nMLFAaXzr0Gdb/JNa8bs0EVktFkP6BtDYEJ2d0y5/aJeXcU/WYP7
         OvsuJejTiken2wB/9/jHMmOWuOOQry/uxRB8uknRdrAoL5yXlYX7Ghoaay33z6Rxh/uV
         IIJWQBKwdSN2dLql0kk67kBYvJ+QOVgoUdc9qruvfb7oYnf1eCGRpEfHLQrqgD71nGbL
         AcMA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:cc:to:subject;
        bh=ZthQZq8yI/NV6VP3cHgZ4T62wgh2M82yZFQy5rf4oow=;
        b=xuMAJWEYUHOj/KxHSsk5HWVjnTPwKD6TWO/4481soh9AyC0MRiPLTtvw1n/c7iXmyS
         rzpoRNF1waFPWgG7yuob0Nj86AGCo+lDcVC4vLG+bmL5d8EYA6XgWjDcwpM5aCivFJlg
         pcim1V18gPYsUZ7Urh8bDxgddVJgENW6mxjUQoiiNscoJ42PUV5mITF++upX6eh4V8no
         b0J0X7D92wL2YckGKKcqRgdzGIiHOeyTTfz3WaDZ5T7T0vitMTsIWiuI3sd+xHhFkYPt
         EqXzrxixQ6wmCkq19nQ9+Ea0XeOUzk3ViLMDC8/oq6enVp3vfy/xhPL9fHMFLd3zz8Cx
         Es3A==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.14 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
Received: from david.siemens.de (david.siemens.de. [192.35.17.14])
        by gmr-mx.google.com with ESMTPS id h2si94764wml.4.2020.09.25.07.21.49
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 25 Sep 2020 07:21:49 -0700 (PDT)
Received-SPF: pass (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.14 as permitted sender) client-ip=192.35.17.14;
Received: from mail2.sbs.de (mail2.sbs.de [192.129.41.66])
	by david.siemens.de (8.15.2/8.15.2) with ESMTPS id 08PELlo1023630
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 25 Sep 2020 16:21:47 +0200
Received: from [167.87.31.138] ([167.87.31.138])
	by mail2.sbs.de (8.15.2/8.15.2) with ESMTP id 08PELkVJ031214;
	Fri, 25 Sep 2020 16:21:47 +0200
Subject: Re: arm64-zero-exits trouble
To: Oliver Schwartz <Oliver.Schwartz@gmx.de>
Cc: Jailhouse <jailhouse-dev@googlegroups.com>
References: <91E9F831-4F9A-4444-AD9A-3E5C56D3CA70@gmx.de>
 <e0d4c689-8cc3-afb0-5a75-b57229feba1f@siemens.com>
 <0F31A760-66D4-4430-BE71-6126FCF5AD60@gmx.de>
 <64bb13f6-6ae2-09ce-4c61-4c406a360c05@siemens.com>
 <F1455873-4D81-412E-AE3F-B584773FBB29@gmx.de>
From: Jan Kiszka <jan.kiszka@siemens.com>
Message-ID: <ac29332c-0c28-2f3f-2ec2-5b0642fff951@siemens.com>
Date: Fri, 25 Sep 2020 16:21:46 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.0
MIME-Version: 1.0
In-Reply-To: <F1455873-4D81-412E-AE3F-B584773FBB29@gmx.de>
Content-Type: text/plain; charset="UTF-8"
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable
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

On 17.09.20 10:36, Oliver Schwartz wrote:
>=20
>=20
>> On 17 Sep 2020, at 09:31, Jan Kiszka <jan.kiszka@siemens.com> wrote:
>>
>> On 17.09.20 09:16, Oliver Schwartz wrote:
>>>> On 15 Sep 2020, at 11:00, Jan Kiszka <jan.kiszka@siemens.com <mailto:j=
an.kiszka@siemens.com>> wrote:
>>>>
>>>> On 15.09.20 09:07, Oliver Schwartz wrote:
>>>>> I=E2=80=99m currently trying out the arm64-zero-exits branch and got =
stuck.
>>>>> System is a Xilinx ZU9EG on a custom board, similar to zcu102. I=E2=
=80=99ve brought ATF up to date and patched it with Jans patch to enable SD=
EI. If I don=E2=80=99t enable SDEI in ATF everything works as expected (wit=
h VM exits for interrupts, of course). Jailhouse source is the tip of branc=
h arm64-zero-exits.
>>>>> If I enable SDEI in ATF, jailhouse works most of the time, except for=
 when it doesn=E2=80=99t. Sometimes, =E2=80=98jailhouse enable=E2=80=99 res=
ults in:
>>>>>> Initializing processors:
>>>>>>  CPU 1... OK
>>>>>>  CPU 0... /home/oliver/0.12-gitAUTOINC+98061469d0-r0/git/hypervisor/=
arch/arm64/setup.c:73: returning error -EIO
>>>>
>>>> Weird - that the SDEI event enable call.
>>>>
>>>>>> FAILED
>>>>>> JAILHOUSE_ENABLE: Input/output error
>>>>> I=E2=80=99ve seen this error only when I enable jailhouse through som=
e init script during the boot process, when the system is also busy otherwi=
se. When starting jailhouse on an idle system I haven=E2=80=99t seen this.
>>>>
>>>> Possibly a regression of my recent refactoring which I didn't manage t=
o test yet. Could you try if
>>>>
>>>> https://github.com/siemens/jailhouse/commits/e0ef829c85895dc6387d5ea11=
b08aa65a456255f
>>>>
>>>> was any better?
>>>>
>>>>> Sometimes it may hang later during =E2=80=98jailhouse enable=E2=80=99=
:
>>>>>> Initializing processors:
>>>>>>  CPU 1... OK
>>>>>>  CPU 0... OK
>>>>>>  CPU 2... OK
>>>>>>  CPU 3... OK
>>>>>> Initializing unit: irqchip
>>>>>> Using SDEI-based management interrupt
>>>>>> Initializing unit: ARM SMMU v3
>>>>>> Initializing unit: PVU IOMMU
>>>>>> Initializing unit: PCI
>>>>>> Adding virtual PCI device 00:00.0 to cell "root"
>>>>>> Page pool usage after late setup: mem 67/992, remap 5/131072
>>>>>> Activating hypervisor
>>>>>> [    5.847540] The Jailhouse is opening.
>>>>> Using a JTAG debugger I see that one or more cores are stuck in hyper=
visor/arch/arm-common/psci.c, line 105.
>>>>> It may also succeed in stopping one or more CPUs and then hang (again=
 with one or more cores stuck in psci.c, line 105):
>>>>>> [    5.810220] The Jailhouse is opening.
>>>>>> [    5.860054] CPU1: shutdown
>>>>>> [    5.862677] psci: CPU1 killed.
>>> Now, with the first problem solved I=E2=80=99ve digged into the second =
one. It=E2=80=99s actually a bit worse than in my initial description: If I=
 just do =E2=80=98jailhouse enable=E2=80=99 the system will always hang a f=
ew milliseconds after the command completes - the only exception is when =
=E2=80=98jailhouse create=E2=80=99 is executed immediately afterwards (whic=
h creates an inmate that uses 3 of 4 CPU cores, leaving just one for Linux)=
, which succeeds roughly on every second try. I didn=E2=80=99t notice this =
initially because I usually start jailhouse with a script that does =E2=80=
=98enable=E2=80=99 and =E2=80=98create=E2=80=99.
>>> The reason for the hangs seems to be the psci emulation in Jailhouse, i=
n particular the CPU_SUSPEND calls. These are issued from my (Xilinx-) kern=
el frequently if Linux has more than one core available. With SDEI disabled=
 the core can be woken up again by some interrupt. With SDEI enabled, the c=
ore waits forever on the wfi intstruction. Because a suspended core never w=
akes up again the whole system hangs at some point.
>>> Any ideas why no interrupts are seen anymore in psci? My guess is that =
it=E2=80=99s because the inmate (Linux) now has full control over the GIC, =
so it may disable any interrupts before suspending a core, without Jailhous=
e noticing. If this is the case, it may be necessary to re-enable the IRQs =
before executing wfi. But I=E2=80=99m missing the big picture here - what i=
nterrupt is the core waiting for in the first place? Any other thoughts?
>>
>> You likely found a bug in the SDEI feature of Jailhouse. The CPU_SUSPEND=
 emulation assumes non-SDEI operation, i.e. interception of interrupts by t=
he hypervisor, but that is not true in this mode.
>>
>> We need a way to wait for interrupts without actually receiving them whe=
n they arrive, but rather return to EL1 then. Maybe re-enabling interceptio=
n, waiting, and then disabling it again before returning would do the trick=
. But then I also do not understand yet why https://github.com/bao-project/=
bao-hypervisor/blob/master/src/arch/armv8/psci.c gets away with wfi. Possib=
ly, they run with interrupts on through the hypervisor, though that would n=
ot be straightforward either.
>=20
> The good news is that there=E2=80=99s an easy workaround, at least on my =
system: disabling suspend calls before starting jailhouse=20
> (echo 1 >  /sys/devices//system/cpu/cpu<n>/cpuidle/state1/disable).
>=20

Seems the reason I was not seeing this so far is that my config [1] was
lacking CONFIG_ARM_PSCI_CPUIDLE. Seeing it now as well, let's debug.

Jan

[1]
https://github.com/siemens/jailhouse-images/blob/master/recipes-kernel/linu=
x/files/arm64_defconfig_5.4

--=20
Siemens AG, Corporate Technology, CT RDA IOT SES-DE
Corporate Competence Center Embedded Linux

--=20
You received this message because you are subscribed to the Google Groups "=
Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/=
jailhouse-dev/ac29332c-0c28-2f3f-2ec2-5b0642fff951%40siemens.com.
