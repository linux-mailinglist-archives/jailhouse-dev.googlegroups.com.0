Return-Path: <jailhouse-dev+bncBCJI7SMNV4NBBT5BRT5QKGQE33Y7I7A@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-wm1-x340.google.com (mail-wm1-x340.google.com [IPv6:2a00:1450:4864:20::340])
	by mail.lfdr.de (Postfix) with ESMTPS id BB2E026D4C0
	for <lists+jailhouse-dev@lfdr.de>; Thu, 17 Sep 2020 09:31:27 +0200 (CEST)
Received: by mail-wm1-x340.google.com with SMTP id x6sf427820wmi.1
        for <lists+jailhouse-dev@lfdr.de>; Thu, 17 Sep 2020 00:31:27 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1600327887; cv=pass;
        d=google.com; s=arc-20160816;
        b=B1e+Yoo6mf8GdECxu+LvlyI0da0hF8rlJUB1QSSwE6zIsuNp0Ym/A/ZHeaKSEcLDR6
         yogMuhJpRHkZpKTY/Jlwlwvh7UYFm20cOMLFYwMsQZM+ik4uOZSCHG0E9w1orLmxKM8u
         O6FrHr/gvYn8iLv8/qa9W7fAXA1VJKur9ZKOSrTyCSbgJ7xumNrXf9pWmKYrScgkbnjo
         x5DdctWswQz71sshLUfEIzMkMtyfDlbsCY4bf3rc6vAZy/8gN2NCEtX7AvDqnrbhyNrh
         WV/Btz8qWN0/ZqaFWv74VPusuE6BJjrl8uvAuuqvy7rvTzyuRILIY+fK9pwrbcOLe8dn
         4kDQ==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:cc:to:subject:sender:dkim-signature;
        bh=lQjUoHLUBroki4ohB+S1hcyrDFKZQ+T77CAeBDxz6GE=;
        b=CESKo/MRGP4rGmII/ZaUWHmKJvmaBnHtNN1JC1IMC5ldYsfISH+SlKwYsrs/BI6MUH
         pf3f5VTj+h9EFqdSHe4LJMOoyANlT8ihqYgQFPjHey+mzmU3ulHtcbfZ5lOhxj6VP2zk
         b+KAqohNuUBqHkiS1UJxLEcyh735A554GMnpMzFF0pB6o0zOZDSHTYh2GckJ0TTgjHJN
         lJhccRQUxEP9agt3GqcdGFRuAGYYcEWI3L1W1Lbn5cNng5efhz1M4itXUe4La15tsQ5u
         7RgLIrGZkYiyJ+ztd0KmDuKVwhxxn+Z4NmXe97JsiRwZLY5ITT29XthUnejsCusoisy+
         GxzA==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.2 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding
         :x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=lQjUoHLUBroki4ohB+S1hcyrDFKZQ+T77CAeBDxz6GE=;
        b=hIrWrxGj5Eai1b5DDZALKgMoJO+MRZb+GtkZtxXB3EcJPJ+mWOn1A8OR/4P7hICNoY
         AhxEZSR1w/VnyZEYInp7dtYV3LIU/N2wIjDsuWJwZ5NQj05nqxjVQSk/bgMhFRl9n9cp
         sd5eSqRaChmjPQOqIHyXZ52kcWY35psvdVLFEPPhkr67FsOLmktcnfik7CIspbRTjODs
         LC0ol1QE5jsa4JQlbsZI/Bho9ROjOYIHkYSnK847VJsJvKZdT+pT2E3kJfePNGpRmXga
         JkMvfRooXu0TON6haorpcfgQ4fHUohS6EsrmMg6iIhoPpWx3IBsTnC9hionVPJ6l0ShI
         UtQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:subject:to:cc:references:from:message-id
         :date:user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :x-spam-checked-in-group:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=lQjUoHLUBroki4ohB+S1hcyrDFKZQ+T77CAeBDxz6GE=;
        b=WhUhVHIJVJrseAsOWNfpttpcLOZaVWsGGX6GNN6wH1F3A7wgLEyZHttxLiraJfX0jj
         mh2XUJOMhIQAPkbXT1J6uiqMsiHlBvR9EFx4gF7Q1qxuBbTaFn7gPzPi/DrPXeBoH2rW
         M4vdaTdXcfUmFX9lb+/Rm4VIaD+IPQRxzpNvk5PjImKtTEvS52X7HKz2Okuxevl5kMra
         hGUmG4FbLgg26m61qVN2ZDeBZyL1umUTOBukjjXrxM5gjCHc4ypI81xv2I9Z62QyAOOG
         nAlZW1xTihStlOLcKkbt63xX4Bq3E179z5YUidjRcf8yQtLWW3AgDm3GFx5SWPHQTLrn
         0BtQ==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AOAM530e4FfqRIy6fuxxxGVlwRVVHhG+1FWtUqK8mbu8UmeGWEjZpuXw
	vwlvuH24+kDtyTPzUGm1fwA=
X-Google-Smtp-Source: ABdhPJwBurysRLOwFvzERMqxNxhyQ2WhrNp+rFb0YLvKMa5qoaxZMMufnJMlrtZxITfNtjNca9K5uw==
X-Received: by 2002:a5d:6404:: with SMTP id z4mr32154257wru.423.1600327887478;
        Thu, 17 Sep 2020 00:31:27 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a1c:4154:: with SMTP id o81ls570276wma.0.gmail; Thu, 17 Sep
 2020 00:31:26 -0700 (PDT)
X-Received: by 2002:a1c:678a:: with SMTP id b132mr8938636wmc.10.1600327886260;
        Thu, 17 Sep 2020 00:31:26 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1600327886; cv=none;
        d=google.com; s=arc-20160816;
        b=Pg7q2D/scUJOnIrqT8SCF6DNJYVa8FlN4DE+N6NqOayZhVu7xyq6/1xTBVYWB739LE
         D4qI9qEEc+P2IJlSGmIuZmdD73JrTT1vUKFrFi+kPgnSfXIfiTYuRxqYq9hv3uQ2D8RK
         mJmhLANqt54lEA4Rn6WjjM6Dv4ekCRbdAHCjwx3nZLYVu1zPXGFviwUtwj5QOJryCvvF
         7X2Tz5YzqeU4kFE7o+ak24Yl3hT3DEcnM8ylQnPv9K+k15vfaFvX1xCvjd6CdPTts+36
         eTK62iUpa2mqdpEl6bqRasCx8WnYx99r8v5Sr7wFOA/rkTzdB6L6Wwmux+yivM6dzPK9
         Hzdg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:cc:to:subject;
        bh=8PrpnVPAvLOPWolcmYa4CO89lFXtNz0RfwwHeF+qJ4E=;
        b=Gg2gLseo9/wDRzEHV0+Ne3nU1qoCXRHK/9WfO4ui8VM+9h3VeXaNznLdACLZFw1dG0
         QJhFuJHIAper0HyeqrjDmo8520LdjVsskm8uC2wxc+2tc+0AC+OZ0YhBs9gN6AuAdm1d
         28kkIVvoVfGJQXE4cBAzTMZA69Yli98x0iOqcgGKmXbCXNJl7RTWovknXFd1DqgK564y
         RDbWYwz9IXywUML2/ArR3o6VVPX6s/XbQqrv7la37/xnf9v554vSrxj60in4KkhqfkMr
         FzT1aE00BV9y78egAUteYr0jGo7AInrbOWL3w+MSBK5HxUiN34iMXihvcrAEjqF095V4
         O9wg==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.2 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
Received: from thoth.sbs.de (thoth.sbs.de. [192.35.17.2])
        by gmr-mx.google.com with ESMTPS id z17si496055wrm.2.2020.09.17.00.31.26
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 17 Sep 2020 00:31:26 -0700 (PDT)
Received-SPF: pass (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.2 as permitted sender) client-ip=192.35.17.2;
Received: from mail2.sbs.de (mail2.sbs.de [192.129.41.66])
	by thoth.sbs.de (8.15.2/8.15.2) with ESMTPS id 08H7VP3L027692
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 17 Sep 2020 09:31:25 +0200
Received: from [167.87.40.222] ([167.87.40.222])
	by mail2.sbs.de (8.15.2/8.15.2) with ESMTP id 08H7VMA9015667;
	Thu, 17 Sep 2020 09:31:25 +0200
Subject: Re: arm64-zero-exits trouble
To: Oliver Schwartz <Oliver.Schwartz@gmx.de>
Cc: Jailhouse <jailhouse-dev@googlegroups.com>
References: <91E9F831-4F9A-4444-AD9A-3E5C56D3CA70@gmx.de>
 <e0d4c689-8cc3-afb0-5a75-b57229feba1f@siemens.com>
 <0F31A760-66D4-4430-BE71-6126FCF5AD60@gmx.de>
From: Jan Kiszka <jan.kiszka@siemens.com>
Message-ID: <64bb13f6-6ae2-09ce-4c61-4c406a360c05@siemens.com>
Date: Thu, 17 Sep 2020 09:31:22 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.0
MIME-Version: 1.0
In-Reply-To: <0F31A760-66D4-4430-BE71-6126FCF5AD60@gmx.de>
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

On 17.09.20 09:16, Oliver Schwartz wrote:
>=20
>=20
>> On 15 Sep 2020, at 11:00, Jan Kiszka <jan.kiszka@siemens.com=20
>> <mailto:jan.kiszka@siemens.com>> wrote:
>>
>> On 15.09.20 09:07, Oliver Schwartz wrote:
>>> I=E2=80=99m currently trying out the arm64-zero-exits branch and got st=
uck.
>>> System is a Xilinx ZU9EG on a custom board, similar to zcu102. I=E2=80=
=99ve=20
>>> brought ATF up to date and patched it with Jans patch to enable SDEI.=
=20
>>> If I don=E2=80=99t enable SDEI in ATF everything works as expected (wit=
h VM=20
>>> exits for interrupts, of course). Jailhouse source is the tip of=20
>>> branch arm64-zero-exits.
>>> If I enable SDEI in ATF, jailhouse works most of the time, except for=
=20
>>> when it doesn=E2=80=99t. Sometimes, =E2=80=98jailhouse enable=E2=80=99 =
results in:
>>>> Initializing processors:
>>>> =C2=A0CPU 1... OK
>>>> =C2=A0CPU 0...=20
>>>> /home/oliver/0.12-gitAUTOINC+98061469d0-r0/git/hypervisor/arch/arm64/s=
etup.c:73:=20
>>>> returning error -EIO
>>
>> Weird - that the SDEI event enable call.
>>
>>>> FAILED
>>>> JAILHOUSE_ENABLE: Input/output error
>>> I=E2=80=99ve seen this error only when I enable jailhouse through some =
init=20
>>> script during the boot process, when the system is also busy=20
>>> otherwise. When starting jailhouse on an idle system I haven=E2=80=99t =
seen this.
>>
>> Possibly a regression of my recent refactoring which I didn't manage=20
>> to test yet. Could you try if
>>
>> https://github.com/siemens/jailhouse/commits/e0ef829c85895dc6387d5ea11b0=
8aa65a456255f
>>
>> was any better?
>>
>>> Sometimes it may hang later during =E2=80=98jailhouse enable=E2=80=99:
>>>> Initializing processors:
>>>> =C2=A0CPU 1... OK
>>>> =C2=A0CPU 0... OK
>>>> =C2=A0CPU 2... OK
>>>> =C2=A0CPU 3... OK
>>>> Initializing unit: irqchip
>>>> Using SDEI-based management interrupt
>>>> Initializing unit: ARM SMMU v3
>>>> Initializing unit: PVU IOMMU
>>>> Initializing unit: PCI
>>>> Adding virtual PCI device 00:00.0 to cell "root"
>>>> Page pool usage after late setup: mem 67/992, remap 5/131072
>>>> Activating hypervisor
>>>> [ =C2=A0=C2=A0=C2=A05.847540] The Jailhouse is opening.
>>> Using a JTAG debugger I see that one or more cores are stuck in=20
>>> hypervisor/arch/arm-common/psci.c, line 105.
>>> It may also succeed in stopping one or more CPUs and then hang (again=
=20
>>> with one or more cores stuck in psci.c, line 105):
>>>> [ =C2=A0=C2=A0=C2=A05.810220] The Jailhouse is opening.
>>>> [ =C2=A0=C2=A0=C2=A05.860054] CPU1: shutdown
>>>> [ =C2=A0=C2=A0=C2=A05.862677] psci: CPU1 killed.
>=20
> Now, with the first problem solved I=E2=80=99ve digged into the second on=
e. It=E2=80=99s=20
> actually a bit worse than in my initial description: If I just do=20
> =E2=80=98jailhouse enable=E2=80=99 the system will always hang a few mill=
iseconds after=20
> the command completes - the only exception is when =E2=80=98jailhouse cre=
ate=E2=80=99 is=20
> executed immediately afterwards (which creates an inmate that uses 3 of=
=20
> 4 CPU cores, leaving just one for Linux), which succeeds roughly on=20
> every second try. I didn=E2=80=99t notice this initially because I usuall=
y start=20
> jailhouse with a script that does =E2=80=98enable=E2=80=99 and =E2=80=98c=
reate=E2=80=99.
>=20
> The reason for the hangs seems to be the psci emulation in Jailhouse, in=
=20
> particular the CPU_SUSPEND calls. These are issued from my (Xilinx-)=20
> kernel frequently if Linux has more than one core available. With SDEI=20
> disabled the core can be woken up again by some interrupt. With SDEI=20
> enabled, the core waits forever on the wfi intstruction. Because a=20
> suspended core never wakes up again the whole system hangs at some point.
>=20
> Any ideas why no interrupts are seen anymore in psci? My guess is that=20
> it=E2=80=99s because the inmate (Linux) now has full control over the GIC=
, so it=20
> may disable any interrupts before suspending a core, without Jailhouse=20
> noticing. If this is the case, it may be necessary to re-enable the IRQs=
=20
> before executing wfi. But I=E2=80=99m missing the big picture here - what=
=20
> interrupt is the core waiting for in the first place? Any other thoughts?

You likely found a bug in the SDEI feature of Jailhouse. The CPU_SUSPEND=20
emulation assumes non-SDEI operation, i.e. interception of interrupts by=20
the hypervisor, but that is not true in this mode.

We need a way to wait for interrupts without actually receiving them=20
when they arrive, but rather return to EL1 then. Maybe re-enabling=20
interception, waiting, and then disabling it again before returning=20
would do the trick. But then I also do not understand yet why=20
https://github.com/bao-project/bao-hypervisor/blob/master/src/arch/armv8/ps=
ci.c=20
gets away with wfi. Possibly, they run with interrupts on through the=20
hypervisor, though that would not be straightforward either.

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
jailhouse-dev/64bb13f6-6ae2-09ce-4c61-4c406a360c05%40siemens.com.
