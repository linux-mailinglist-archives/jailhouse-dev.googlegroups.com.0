Return-Path: <jailhouse-dev+bncBCJI7SMNV4NBBX4IXD5QKGQEQQPZC3Q@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-lf1-x13d.google.com (mail-lf1-x13d.google.com [IPv6:2a00:1450:4864:20::13d])
	by mail.lfdr.de (Postfix) with ESMTPS id 8688C278B47
	for <lists+jailhouse-dev@lfdr.de>; Fri, 25 Sep 2020 16:53:20 +0200 (CEST)
Received: by mail-lf1-x13d.google.com with SMTP id n133sf508304lfd.8
        for <lists+jailhouse-dev@lfdr.de>; Fri, 25 Sep 2020 07:53:20 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1601045600; cv=pass;
        d=google.com; s=arc-20160816;
        b=YUgI7TKTZs6XEDnauhBuSJ+/7HA7czGc8Ug77n4gpX7GP+FXDZLGsYVtakfqujzH3z
         Y1E9DSUuZJuaTTpSpyYIUubTmXHQo0/LzWDNBF6+87X5k9MjYKmJazPM/ju4z92PNCp1
         IPRgfLsxWzH5Q2JB59JX/m8Im8rjofeqTExqhDDDPaocobD/rJM4SZT7DilspisjFmqa
         AENxnZd0+eAk/GZoQGfYVvJoOyU/85XpOVorrJcoCEn+M733FZw8oODIm+u0g2ndk9UR
         RV78UNKlhxk9gN4LBhd8TJsyLgAy02n1TL07LKkTb0gC0ElIkhu2ltu7qVfBKD9Cb2iw
         9r7A==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:references:cc:to:from:subject:sender:dkim-signature;
        bh=eDajNxrwxl7+U02FrmJdK9OkA/sEVWgdWv84aouEVOo=;
        b=FnJNhwFuHh6jKH8Wt3yCH513x+Xl40g46qH1Wgfc4s0XqmH/yubYTHoCePFtRU0W3s
         InkdEr92iddf+St5FeUp6HV0Z5Rq/lqjaP+Cj/yGrNdxdgUu0ntZE3GITbxEt2Uz8QvM
         YbBAOt2qgXLy5Jt70URuED8c81FJKpDGV37h8gINYVmJirdVGdcBpYSkx5+Pnsn59lmV
         E1+yXhsRUd9J8H7IH1wZkZqU9xwId0bzEG+cOpXn09RrFC5pSGQBtZmw/v7e164PMwqs
         C29ZMeJyyeSTIMsoVdPDGWhirg2qXlspEyc77Apbgm8R1+0fFBAB93dCSHxDWd7XBvMH
         xDsQ==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 194.138.37.40 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:subject:from:to:cc:references:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding
         :x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=eDajNxrwxl7+U02FrmJdK9OkA/sEVWgdWv84aouEVOo=;
        b=XH1Eio1MuqGqUWunMQn5P2u/UxIJpZrU6I7rmyM8cbMUO6ELpsJTWbH1V+7TnE4wlU
         /IAMRd4R2PIUUjSBjGQvfvczQ4gUcBDFFN7dgB/eypnhJcAG4yBMKygHHOUiGjCzB1tU
         yKwdlA5nhp6Z3wcaPj14clJhsxt8DFJ+9dE4AYvmSvj9FxQCHW1DzfyXq45SPaC317JA
         IKTpZmb8h0P/gYlvB/JNuO2+7mDOSEW4a4VgCwPFzR5A9oPOZxlqskNRKn2+5sr6ACfM
         7xE03nHnvDKn/uJPBfLd664LKXZ3zkKI4u78gBaDwPrJlp83Y8yOtLNX6xPqVG/IPi2q
         WfJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:subject:from:to:cc:references:message-id
         :date:user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :x-spam-checked-in-group:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=eDajNxrwxl7+U02FrmJdK9OkA/sEVWgdWv84aouEVOo=;
        b=ENn2qVlIEJUfa+PQsDruPSMpllLv82L4qwH3T2HD8uve4uYYmvPulkGxuS8FnCO9ig
         OJ0zS9VKmMrp15588NgIdBTgmgSecGrxOWn235gQviYAtOAVBhWQyn6W3XHWo9ZL1obI
         SxA055hcovhawh+oC0XSS23OYUvCyxzUIudG+iAFd4C0xOfVZcBi8AaQE2Upw80AXTjy
         VUqrRHnYuS2R7OecxV5+hNb4Yg/TtiR6vB777yTLkg+mWm7ThtvKoMOx7gm8AbtgNU6t
         Thu6gUTq8Jj46JFPp0y+y+Z8LDmOqysBIsLMVLVGjjQ2jR3ghMai7YLuB9OY+zlDRUev
         QDLA==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AOAM531qqt+s8kBatqMxphYoiT/ZQ2cb3jpSFIdP2HADLGoyjZk8wMbT
	SmJcHOU4gLRH9WHDVvtopj4=
X-Google-Smtp-Source: ABdhPJxqzJ6vHpNRrW5BkkER+m1/0I3dto9C2O2UG6iVjuUMwE6SmrnEtnkjT+a5+4nfDVPhDYnk+Q==
X-Received: by 2002:a2e:8e61:: with SMTP id t1mr1605598ljk.175.1601045600030;
        Fri, 25 Sep 2020 07:53:20 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:ac2:544e:: with SMTP id d14ls810742lfn.2.gmail; Fri, 25 Sep
 2020 07:53:18 -0700 (PDT)
X-Received: by 2002:ac2:51c4:: with SMTP id u4mr21174lfm.557.1601045598701;
        Fri, 25 Sep 2020 07:53:18 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1601045598; cv=none;
        d=google.com; s=arc-20160816;
        b=b6AN61pT4wtCstlnBd+KNrskv7z8N8dPTRmvSYMLX3W51KQJZ2Sag/WAXz4eOPj1N7
         uBXvZzYw2Y3fMOybSlF2vGNtzVgIwVBSh9eQili+7C6Xk1eaKCpjcRHWnQf9EcLeI/5e
         NfDVcGZ6XVZK3lI/AU4blGDzYvps6jtYlMdRu9Ili8AdhtFhnNOZJ5Mw4GJJbLDNiWXv
         0RHTXkH+3N0nfD6X+T8oX9sQ8xv+U+TMTPX0csVbURm8vAeGOkcP5rLcIggvUJA05tkV
         FRQ+SVKqUxGG2bWtqtJRj7/q0zZVBeR/9aJIOYxo+5ZOfxyCzF3tZ+6A79z7XmVf/5oF
         u21Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:references:cc:to:from:subject;
        bh=ZBaa7wI01BgOhEzKyZFWLKAY3+9d1poaR0y8diV1kTg=;
        b=cqmr831RCNMht/+eSBuD/xSFR3QJuxUr0ImkLG6hYaEGvXX+1As0+ryudLlbut7IW/
         64dB4OL0CYjHIYpBXxGKshx4IlYyd3qNLo6ala5VXwjDvfDnmYy2v40SFF6YnxBxb/MV
         dqfQ5lg0J+dpZlvCQ15evPOLIupKzdhLpqRzOfI8rVs932vQzmvsCUvV3+ucc92itMgf
         aNsPdiKlRYImXY4nq6g4JyG52X3y2YQ9vcKRUPgiD0rJMNSYW/3iPPaN/EWJ05eUK/hQ
         OjuPoNmtBttBrwRCgRGphhR1IS6NI2Vk5BSFsNdGdMIHrolqcpJ6NDMzwTstBbL9oob3
         0/4A==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 194.138.37.40 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
Received: from gecko.sbs.de (gecko.sbs.de. [194.138.37.40])
        by gmr-mx.google.com with ESMTPS id l82si57495lfd.13.2020.09.25.07.53.18
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 25 Sep 2020 07:53:18 -0700 (PDT)
Received-SPF: pass (google.com: domain of jan.kiszka@siemens.com designates 194.138.37.40 as permitted sender) client-ip=194.138.37.40;
Received: from mail2.sbs.de (mail2.sbs.de [192.129.41.66])
	by gecko.sbs.de (8.15.2/8.15.2) with ESMTPS id 08PErGxg004551
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 25 Sep 2020 16:53:16 +0200
Received: from [167.87.31.138] ([167.87.31.138])
	by mail2.sbs.de (8.15.2/8.15.2) with ESMTP id 08PErGDW001035;
	Fri, 25 Sep 2020 16:53:16 +0200
Subject: Re: arm64-zero-exits trouble
From: Jan Kiszka <jan.kiszka@siemens.com>
To: Oliver Schwartz <Oliver.Schwartz@gmx.de>
Cc: Jailhouse <jailhouse-dev@googlegroups.com>,
        Chase Conklin <chase.conklin@arm.com>,
        Mark Rutland <mark.rutland@arm.com>,
        Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>
References: <91E9F831-4F9A-4444-AD9A-3E5C56D3CA70@gmx.de>
 <e0d4c689-8cc3-afb0-5a75-b57229feba1f@siemens.com>
 <0F31A760-66D4-4430-BE71-6126FCF5AD60@gmx.de>
 <64bb13f6-6ae2-09ce-4c61-4c406a360c05@siemens.com>
 <F1455873-4D81-412E-AE3F-B584773FBB29@gmx.de>
 <ac29332c-0c28-2f3f-2ec2-5b0642fff951@siemens.com>
 <f3ca2e5c-b843-db9a-aa8c-864abd2c54e1@siemens.com>
Message-ID: <2a039ddc-bd8f-eaf9-2494-7f62efb9aa80@siemens.com>
Date: Fri, 25 Sep 2020 16:53:16 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.0
MIME-Version: 1.0
In-Reply-To: <f3ca2e5c-b843-db9a-aa8c-864abd2c54e1@siemens.com>
Content-Type: text/plain; charset="UTF-8"
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

On 25.09.20 16:44, Jan Kiszka wrote:
> On 25.09.20 16:21, Jan Kiszka wrote:
>> On 17.09.20 10:36, Oliver Schwartz wrote:
>>>
>>>
>>>> On 17 Sep 2020, at 09:31, Jan Kiszka <jan.kiszka@siemens.com> wrote:
>>>>
>>>> On 17.09.20 09:16, Oliver Schwartz wrote:
>>>>>> On 15 Sep 2020, at 11:00, Jan Kiszka <jan.kiszka@siemens.com <mailto=
:jan.kiszka@siemens.com>> wrote:
>>>>>>
>>>>>> On 15.09.20 09:07, Oliver Schwartz wrote:
>>>>>>> I=E2=80=99m currently trying out the arm64-zero-exits branch and go=
t stuck.
>>>>>>> System is a Xilinx ZU9EG on a custom board, similar to zcu102. I=E2=
=80=99ve brought ATF up to date and patched it with Jans patch to enable SD=
EI. If I don=E2=80=99t enable SDEI in ATF everything works as expected (wit=
h VM exits for interrupts, of course). Jailhouse source is the tip of branc=
h arm64-zero-exits.
>>>>>>> If I enable SDEI in ATF, jailhouse works most of the time, except f=
or when it doesn=E2=80=99t. Sometimes, =E2=80=98jailhouse enable=E2=80=99 r=
esults in:
>>>>>>>> Initializing processors:
>>>>>>>>  CPU 1... OK
>>>>>>>>  CPU 0... /home/oliver/0.12-gitAUTOINC+98061469d0-r0/git/hyperviso=
r/arch/arm64/setup.c:73: returning error -EIO
>>>>>>
>>>>>> Weird - that the SDEI event enable call.
>>>>>>
>>>>>>>> FAILED
>>>>>>>> JAILHOUSE_ENABLE: Input/output error
>>>>>>> I=E2=80=99ve seen this error only when I enable jailhouse through s=
ome init script during the boot process, when the system is also busy other=
wise. When starting jailhouse on an idle system I haven=E2=80=99t seen this=
.
>>>>>>
>>>>>> Possibly a regression of my recent refactoring which I didn't manage=
 to test yet. Could you try if
>>>>>>
>>>>>> https://github.com/siemens/jailhouse/commits/e0ef829c85895dc6387d5ea=
11b08aa65a456255f
>>>>>>
>>>>>> was any better?
>>>>>>
>>>>>>> Sometimes it may hang later during =E2=80=98jailhouse enable=E2=80=
=99:
>>>>>>>> Initializing processors:
>>>>>>>>  CPU 1... OK
>>>>>>>>  CPU 0... OK
>>>>>>>>  CPU 2... OK
>>>>>>>>  CPU 3... OK
>>>>>>>> Initializing unit: irqchip
>>>>>>>> Using SDEI-based management interrupt
>>>>>>>> Initializing unit: ARM SMMU v3
>>>>>>>> Initializing unit: PVU IOMMU
>>>>>>>> Initializing unit: PCI
>>>>>>>> Adding virtual PCI device 00:00.0 to cell "root"
>>>>>>>> Page pool usage after late setup: mem 67/992, remap 5/131072
>>>>>>>> Activating hypervisor
>>>>>>>> [    5.847540] The Jailhouse is opening.
>>>>>>> Using a JTAG debugger I see that one or more cores are stuck in hyp=
ervisor/arch/arm-common/psci.c, line 105.
>>>>>>> It may also succeed in stopping one or more CPUs and then hang (aga=
in with one or more cores stuck in psci.c, line 105):
>>>>>>>> [    5.810220] The Jailhouse is opening.
>>>>>>>> [    5.860054] CPU1: shutdown
>>>>>>>> [    5.862677] psci: CPU1 killed.
>>>>> Now, with the first problem solved I=E2=80=99ve digged into the secon=
d one. It=E2=80=99s actually a bit worse than in my initial description: If=
 I just do =E2=80=98jailhouse enable=E2=80=99 the system will always hang a=
 few milliseconds after the command completes - the only exception is when =
=E2=80=98jailhouse create=E2=80=99 is executed immediately afterwards (whic=
h creates an inmate that uses 3 of 4 CPU cores, leaving just one for Linux)=
, which succeeds roughly on every second try. I didn=E2=80=99t notice this =
initially because I usually start jailhouse with a script that does =E2=80=
=98enable=E2=80=99 and =E2=80=98create=E2=80=99.
>>>>> The reason for the hangs seems to be the psci emulation in Jailhouse,=
 in particular the CPU_SUSPEND calls. These are issued from my (Xilinx-) ke=
rnel frequently if Linux has more than one core available. With SDEI disabl=
ed the core can be woken up again by some interrupt. With SDEI enabled, the=
 core waits forever on the wfi intstruction. Because a suspended core never=
 wakes up again the whole system hangs at some point.
>>>>> Any ideas why no interrupts are seen anymore in psci? My guess is tha=
t it=E2=80=99s because the inmate (Linux) now has full control over the GIC=
, so it may disable any interrupts before suspending a core, without Jailho=
use noticing. If this is the case, it may be necessary to re-enable the IRQ=
s before executing wfi. But I=E2=80=99m missing the big picture here - what=
 interrupt is the core waiting for in the first place? Any other thoughts?
>>>>
>>>> You likely found a bug in the SDEI feature of Jailhouse. The CPU_SUSPE=
ND emulation assumes non-SDEI operation, i.e. interception of interrupts by=
 the hypervisor, but that is not true in this mode.
>>>>
>>>> We need a way to wait for interrupts without actually receiving them w=
hen they arrive, but rather return to EL1 then. Maybe re-enabling intercept=
ion, waiting, and then disabling it again before returning would do the tri=
ck. But then I also do not understand yet why https://github.com/bao-projec=
t/bao-hypervisor/blob/master/src/arch/armv8/psci.c gets away with wfi. Poss=
ibly, they run with interrupts on through the hypervisor, though that would=
 not be straightforward either.
>>>
>>> The good news is that there=E2=80=99s an easy workaround, at least on m=
y system: disabling suspend calls before starting jailhouse=20
>>> (echo 1 >  /sys/devices//system/cpu/cpu<n>/cpuidle/state1/disable).
>>>
>>
>> Seems the reason I was not seeing this so far is that my config [1] was
>> lacking CONFIG_ARM_PSCI_CPUIDLE. Seeing it now as well, let's debug.
>>
>=20
> My ideas seems to work (quick hack):
>=20
> diff --git a/hypervisor/arch/arm-common/psci.c b/hypervisor/arch/arm-comm=
on/psci.c
> index 6a9abf60..3bb3f6a8 100644
> --- a/hypervisor/arch/arm-common/psci.c
> +++ b/hypervisor/arch/arm-common/psci.c
> @@ -101,6 +101,14 @@ long psci_dispatch(struct trap_context *ctx)
> =20
>  	case PSCI_0_2_FN_CPU_SUSPEND:
>  	case PSCI_0_2_FN64_CPU_SUSPEND:
> +		if (sdei_available) {
> +			unsigned long hcr;
> +			arm_read_sysreg(HCR_EL2, hcr);
> +			arm_write_sysreg(HCR_EL2,
> +					 hcr | HCR_IMO_BIT | HCR_FMO_BIT);
> +			asm volatile("wfi" : : : "memory");
> +			arm_read_sysreg(HCR_EL2, hcr);
> +		} else
>  		if (!irqchip_has_pending_irqs()) {
>  			asm volatile("wfi" : : : "memory");
>  			irqchip_handle_irq();
>=20
> Now, if someone with more architectural knowledge than I could explain=20
> why that's the case and if that will work on all platforms, with both=20
> GICv2 and v3 (and maybe even v4), we could convert that into real patch.
> Trying my luck on the CC list...
>=20

N=C3=A4=C3=A4, I was too quick: wfi works, i.e. the hypervisor is woken up =
on
pending interrupts, but some more bits than simply clearing IMO/FMO in
HCR are needed in order to forward that pending irq event to EL1 when
returning to it.

Jan

PS: I strongly suspect this is just broken under SDEI in bao as well.

--=20
Siemens AG, Corporate Technology, CT RDA IOT SES-DE
Corporate Competence Center Embedded Linux

--=20
You received this message because you are subscribed to the Google Groups "=
Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/=
jailhouse-dev/2a039ddc-bd8f-eaf9-2494-7f62efb9aa80%40siemens.com.
