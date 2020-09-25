Return-Path: <jailhouse-dev+bncBCJI7SMNV4NBBOEEXD5QKGQEUN3DPRA@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-lf1-x13c.google.com (mail-lf1-x13c.google.com [IPv6:2a00:1450:4864:20::13c])
	by mail.lfdr.de (Postfix) with ESMTPS id 1CCD7278B1E
	for <lists+jailhouse-dev@lfdr.de>; Fri, 25 Sep 2020 16:44:09 +0200 (CEST)
Received: by mail-lf1-x13c.google.com with SMTP id m9sf501450lfr.11
        for <lists+jailhouse-dev@lfdr.de>; Fri, 25 Sep 2020 07:44:09 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1601045048; cv=pass;
        d=google.com; s=arc-20160816;
        b=cUN7qalCS3X/J0WmSQ9NwDcV75J3ZjDnrTUdP7tVzoKDiPd2avsRseDvsLGPFYkeUS
         LIfcGDRgYH8+jBMPW3UDKIjWrpbGnjue8kdpuhvBvl3kMbGYYsjLqm0QfZ+KXtiANm0i
         F0lQa+zJgqIl8sBg5t6ObjzIyYElT7wQCH5oA6lgbuU8jI2O0/1v3yIKX/Gcg5E0Ja5p
         3HXa1cnumTPnvJKShXWWsKAxXSYTuLeWDg4Fe51ozu8zCVJGrLXGsCqDvMn0pNdRaPSz
         Su/9EhhBjTdGhf09sHUliv5HwnBCaMxiIRbSpzvq252jyTgeOyDVaYqbPHL+BfBg+M2W
         ahOQ==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:references:cc:to:from:subject:sender:dkim-signature;
        bh=g+DvscScc3U5PjKCVn3qoTetqwJeTV6kZjfp74XXKfY=;
        b=HxW0if0rUXVfWnunSenj5ctRwb38866JecYxtdFINtU3GL7FYFK6Tux8bbEhvekvH6
         vifA3hCl9IVA08ROySM/nuKEaEGqwZrwU/atGDfFZoselURET2gd6qMKtWswo6btBsYn
         Hs/NAPnxSr/ESPSgNoP9eTN6jfvNdpvRNP6VnlY5s1YYTEiyXUrfjYYTNTLbe0PfSFfI
         f5IWe1W3I9WpOpLdFNRXMlqBWcJzAHs3QbOqfjStm+/gcXIj693o0x6IuqaNLOO9t2If
         1XEUai68FHmnzY1uP9kXUY0BXePHgtPd/sbS7DI6U1Hu3E+Z7Eo5IHOCU7iYPiDGYdPd
         leTg==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.28 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:subject:from:to:cc:references:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding
         :x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=g+DvscScc3U5PjKCVn3qoTetqwJeTV6kZjfp74XXKfY=;
        b=igIw+Pgu6yQmYgd4xKkl+M9SuWp54wa2TI4g+vA8RvFjB5TXJSBl/qp1bHVw9XKqa7
         gDpHGZTRKRG/80Zjq0leYnHALMVXV/TMZen5nsxCG2+F9L/wztJBV+sMA3DN5Tuk006m
         lLy6LC4qqQ44FOfFuDXFWX+D9RaNoVw8YDo8629CSbcKS5GXHfjA4f56vOSYnwTqk4/D
         RVhpvDCJ9I/14JqkG7QU3i+dp8zCqSeqsgJMm/AD/DTrgb0fS+RFPLk9TWinGsX/LRpW
         Lu2nVf4++p2lPrcH1m2Iqh3HdV6MP6cNeeWEQ9/3XMFzXPuCqGn4J/4GgDuCYjtXQRNC
         ewOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:subject:from:to:cc:references:message-id
         :date:user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :x-spam-checked-in-group:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=g+DvscScc3U5PjKCVn3qoTetqwJeTV6kZjfp74XXKfY=;
        b=EIiBvSHCkKHrab/zdwy0yleWue/tJ038kvchD7aLNgNdwKJCADINAHsIIk/DQ952De
         QUnf58IrvresuvieQKVFoD/zwMb5kFFMlgKn7RETZCzVkhbPpFbqEUH+4R74gQDc5i3c
         e0QMuNqBSYGozvhrmvgVkDGcqubq6L1L6fltjdzr2k8LVP1VfmlGYm5Hv4AiF6Nwod8X
         hLE38tWuZmUnb6ly16t4LTQUrkX4kzEJVcN6CQJsvTJPX4/x/X5+lNnusyPss6fBfm4z
         +r80jlm1rEy+lDDXAvu/PE/XN/NcG+cYQRwttt5qvvud3DOG7uLI+1b710EYd5LWYxyu
         aN4g==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AOAM5306V2K3Jbgfd8AQFTL5FEpCr+0rhSDFlkYUJKJyVa3800WdKbKP
	xTIliqYnmLuLpYPPs+G+xw4=
X-Google-Smtp-Source: ABdhPJy3EIHebfB7y22zN5dAdAvLjkRBgPrLKxz1LDTBQJpqvGDbgclOBQcxXIv33zuOfuGxD2xVTw==
X-Received: by 2002:a2e:505b:: with SMTP id v27mr1637747ljd.224.1601045048549;
        Fri, 25 Sep 2020 07:44:08 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a19:c7c8:: with SMTP id x191ls787010lff.0.gmail; Fri, 25 Sep
 2020 07:44:07 -0700 (PDT)
X-Received: by 2002:a19:520b:: with SMTP id m11mr1371888lfb.498.1601045047206;
        Fri, 25 Sep 2020 07:44:07 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1601045047; cv=none;
        d=google.com; s=arc-20160816;
        b=PZEDUrLfu85w5vwn4wHZwBLibNoj+N7MtnUf1jc0AHEPrmfOw0RDjUM8Pnbwql8+OE
         6Sie/IAXwApvdQgAVII5Ei02jQ5MWBedjPpvUw3b+QoKxzdLY1SdAZ+oV3zJlSJHiFAy
         mvdM6Brpu14s+Nx55eEwcP8ByjMb4lBeuUwRQmRjW465Jekrm+DjFUy/F9BsjO4V42xm
         HXC/S5NlrwEdKvw5mgZePXS3DLoKg+tZrqNC2uxK4w3Gy9QOwLRjcnhzk7OyA4SNJTzR
         YkNTzIBk8DXSP0wKBu8nDYlQOoz0wXYdCYKReNFlXH+QYATL9XjxjONd6oP01S7T38Kw
         nDfw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:references:cc:to:from:subject;
        bh=50qKMC91oWA/dUDnrGWnRvl+o70QosW1HtSS5UM7Mis=;
        b=hKcoQo9ONFAIhsnaJaRfCQxHYw19TxZo1gPcZevjWFc55LY4wS6D1WXVFzUuHbbbb0
         HDoXrZtoH3jYVpWVxLOIeF6CrDZn5WH5Jgb981O5l/5zhc6K7X+NyG4LDzDEl1WRaHCn
         SboSoWEMBlRkgO2IQdYt/YrZe9x5/sHoCMfKAFBbmb15GJSx/aC0q5k29HrGxwqmq7Uc
         vp7PeGNXB+DkGGz2SsTrEiSzY0HRhUQKAXivouZaeoOMN+DIF+qipqMLWK8fCOtNTL8c
         krCDfY4d7b4mDSO65nrzvB/sjAJ6srCI6H9MH8Tkvsw7XgOo1HYD9xWxoVTjdDL4qpt3
         L0mA==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.28 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
Received: from goliath.siemens.de (goliath.siemens.de. [192.35.17.28])
        by gmr-mx.google.com with ESMTPS id 143si63635lff.10.2020.09.25.07.44.07
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 25 Sep 2020 07:44:07 -0700 (PDT)
Received-SPF: pass (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.28 as permitted sender) client-ip=192.35.17.28;
Received: from mail2.sbs.de (mail2.sbs.de [192.129.41.66])
	by goliath.siemens.de (8.15.2/8.15.2) with ESMTPS id 08PEi5pf026088
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 25 Sep 2020 16:44:05 +0200
Received: from [167.87.31.138] ([167.87.31.138])
	by mail2.sbs.de (8.15.2/8.15.2) with ESMTP id 08PEi47d024044;
	Fri, 25 Sep 2020 16:44:04 +0200
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
Message-ID: <f3ca2e5c-b843-db9a-aa8c-864abd2c54e1@siemens.com>
Date: Fri, 25 Sep 2020 16:44:04 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.0
MIME-Version: 1.0
In-Reply-To: <ac29332c-0c28-2f3f-2ec2-5b0642fff951@siemens.com>
Content-Type: text/plain; charset="UTF-8"
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable
X-Original-Sender: jan.kiszka@siemens.com
X-Original-Authentication-Results: gmr-mx.google.com;       spf=pass
 (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.28 as
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

On 25.09.20 16:21, Jan Kiszka wrote:
> On 17.09.20 10:36, Oliver Schwartz wrote:
>>
>>
>>> On 17 Sep 2020, at 09:31, Jan Kiszka <jan.kiszka@siemens.com> wrote:
>>>
>>> On 17.09.20 09:16, Oliver Schwartz wrote:
>>>>> On 15 Sep 2020, at 11:00, Jan Kiszka <jan.kiszka@siemens.com <mailto:=
jan.kiszka@siemens.com>> wrote:
>>>>>
>>>>> On 15.09.20 09:07, Oliver Schwartz wrote:
>>>>>> I=E2=80=99m currently trying out the arm64-zero-exits branch and got=
 stuck.
>>>>>> System is a Xilinx ZU9EG on a custom board, similar to zcu102. I=E2=
=80=99ve brought ATF up to date and patched it with Jans patch to enable SD=
EI. If I don=E2=80=99t enable SDEI in ATF everything works as expected (wit=
h VM exits for interrupts, of course). Jailhouse source is the tip of branc=
h arm64-zero-exits.
>>>>>> If I enable SDEI in ATF, jailhouse works most of the time, except fo=
r when it doesn=E2=80=99t. Sometimes, =E2=80=98jailhouse enable=E2=80=99 re=
sults in:
>>>>>>> Initializing processors:
>>>>>>>  CPU 1... OK
>>>>>>>  CPU 0... /home/oliver/0.12-gitAUTOINC+98061469d0-r0/git/hypervisor=
/arch/arm64/setup.c:73: returning error -EIO
>>>>>
>>>>> Weird - that the SDEI event enable call.
>>>>>
>>>>>>> FAILED
>>>>>>> JAILHOUSE_ENABLE: Input/output error
>>>>>> I=E2=80=99ve seen this error only when I enable jailhouse through so=
me init script during the boot process, when the system is also busy otherw=
ise. When starting jailhouse on an idle system I haven=E2=80=99t seen this.
>>>>>
>>>>> Possibly a regression of my recent refactoring which I didn't manage =
to test yet. Could you try if
>>>>>
>>>>> https://github.com/siemens/jailhouse/commits/e0ef829c85895dc6387d5ea1=
1b08aa65a456255f
>>>>>
>>>>> was any better?
>>>>>
>>>>>> Sometimes it may hang later during =E2=80=98jailhouse enable=E2=80=
=99:
>>>>>>> Initializing processors:
>>>>>>>  CPU 1... OK
>>>>>>>  CPU 0... OK
>>>>>>>  CPU 2... OK
>>>>>>>  CPU 3... OK
>>>>>>> Initializing unit: irqchip
>>>>>>> Using SDEI-based management interrupt
>>>>>>> Initializing unit: ARM SMMU v3
>>>>>>> Initializing unit: PVU IOMMU
>>>>>>> Initializing unit: PCI
>>>>>>> Adding virtual PCI device 00:00.0 to cell "root"
>>>>>>> Page pool usage after late setup: mem 67/992, remap 5/131072
>>>>>>> Activating hypervisor
>>>>>>> [    5.847540] The Jailhouse is opening.
>>>>>> Using a JTAG debugger I see that one or more cores are stuck in hype=
rvisor/arch/arm-common/psci.c, line 105.
>>>>>> It may also succeed in stopping one or more CPUs and then hang (agai=
n with one or more cores stuck in psci.c, line 105):
>>>>>>> [    5.810220] The Jailhouse is opening.
>>>>>>> [    5.860054] CPU1: shutdown
>>>>>>> [    5.862677] psci: CPU1 killed.
>>>> Now, with the first problem solved I=E2=80=99ve digged into the second=
 one. It=E2=80=99s actually a bit worse than in my initial description: If =
I just do =E2=80=98jailhouse enable=E2=80=99 the system will always hang a =
few milliseconds after the command completes - the only exception is when =
=E2=80=98jailhouse create=E2=80=99 is executed immediately afterwards (whic=
h creates an inmate that uses 3 of 4 CPU cores, leaving just one for Linux)=
, which succeeds roughly on every second try. I didn=E2=80=99t notice this =
initially because I usually start jailhouse with a script that does =E2=80=
=98enable=E2=80=99 and =E2=80=98create=E2=80=99.
>>>> The reason for the hangs seems to be the psci emulation in Jailhouse, =
in particular the CPU_SUSPEND calls. These are issued from my (Xilinx-) ker=
nel frequently if Linux has more than one core available. With SDEI disable=
d the core can be woken up again by some interrupt. With SDEI enabled, the =
core waits forever on the wfi intstruction. Because a suspended core never =
wakes up again the whole system hangs at some point.
>>>> Any ideas why no interrupts are seen anymore in psci? My guess is that=
 it=E2=80=99s because the inmate (Linux) now has full control over the GIC,=
 so it may disable any interrupts before suspending a core, without Jailhou=
se noticing. If this is the case, it may be necessary to re-enable the IRQs=
 before executing wfi. But I=E2=80=99m missing the big picture here - what =
interrupt is the core waiting for in the first place? Any other thoughts?
>>>
>>> You likely found a bug in the SDEI feature of Jailhouse. The CPU_SUSPEN=
D emulation assumes non-SDEI operation, i.e. interception of interrupts by =
the hypervisor, but that is not true in this mode.
>>>
>>> We need a way to wait for interrupts without actually receiving them wh=
en they arrive, but rather return to EL1 then. Maybe re-enabling intercepti=
on, waiting, and then disabling it again before returning would do the tric=
k. But then I also do not understand yet why https://github.com/bao-project=
/bao-hypervisor/blob/master/src/arch/armv8/psci.c gets away with wfi. Possi=
bly, they run with interrupts on through the hypervisor, though that would =
not be straightforward either.
>>
>> The good news is that there=E2=80=99s an easy workaround, at least on my=
 system: disabling suspend calls before starting jailhouse=20
>> (echo 1 >  /sys/devices//system/cpu/cpu<n>/cpuidle/state1/disable).
>>
>=20
> Seems the reason I was not seeing this so far is that my config [1] was
> lacking CONFIG_ARM_PSCI_CPUIDLE. Seeing it now as well, let's debug.
>=20

My ideas seems to work (quick hack):

diff --git a/hypervisor/arch/arm-common/psci.c b/hypervisor/arch/arm-common=
/psci.c
index 6a9abf60..3bb3f6a8 100644
--- a/hypervisor/arch/arm-common/psci.c
+++ b/hypervisor/arch/arm-common/psci.c
@@ -101,6 +101,14 @@ long psci_dispatch(struct trap_context *ctx)
=20
 	case PSCI_0_2_FN_CPU_SUSPEND:
 	case PSCI_0_2_FN64_CPU_SUSPEND:
+		if (sdei_available) {
+			unsigned long hcr;
+			arm_read_sysreg(HCR_EL2, hcr);
+			arm_write_sysreg(HCR_EL2,
+					 hcr | HCR_IMO_BIT | HCR_FMO_BIT);
+			asm volatile("wfi" : : : "memory");
+			arm_read_sysreg(HCR_EL2, hcr);
+		} else
 		if (!irqchip_has_pending_irqs()) {
 			asm volatile("wfi" : : : "memory");
 			irqchip_handle_irq();

Now, if someone with more architectural knowledge than I could explain=20
why that's the case and if that will work on all platforms, with both=20
GICv2 and v3 (and maybe even v4), we could convert that into real patch.
Trying my luck on the CC list...

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
jailhouse-dev/f3ca2e5c-b843-db9a-aa8c-864abd2c54e1%40siemens.com.
