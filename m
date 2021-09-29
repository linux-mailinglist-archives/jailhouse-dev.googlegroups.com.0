Return-Path: <jailhouse-dev+bncBDNPJEGU2MKBB2HR2GFAMGQEWRORKEA@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-wm1-x340.google.com (mail-wm1-x340.google.com [IPv6:2a00:1450:4864:20::340])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F42C41C6BB
	for <lists+jailhouse-dev@lfdr.de>; Wed, 29 Sep 2021 16:32:10 +0200 (CEST)
Received: by mail-wm1-x340.google.com with SMTP id z194-20020a1c7ecb000000b0030b7ccea080sf2786807wmc.8
        for <lists+jailhouse-dev@lfdr.de>; Wed, 29 Sep 2021 07:32:10 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1632925929; cv=pass;
        d=google.com; s=arc-20160816;
        b=RGRGXe+KELCDHsKo47/menXZCBbI29Grn5cGKNTboi8AV0GiWEXySam+7fTUsnCifA
         Nyj51Y+j6lH558bLJbpNHl9SRRkapGZ8z3iw9Kwq8z35ZvW6zz/hvP7aniC6qylXNpCW
         fqXtxYxy59L82dYYvrC/2EPsbHRbFcHv5XF4v6aA6ACHMkldSopmHd+f7oJNMIkiXVCd
         v0gkb/MjfS4264tK6rUIXlx1zz+qDnrYfzWnKmYhOwbg1ipbfyO2VXD2lcKM9ycFHL1d
         LpEbLPAjQ44UN2EtOikbXIozPX03dYk4IYc4Yv6JvupHM3vhFSV5VtCs7M/bdGJYWncT
         3C8Q==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:date:message-id:from
         :references:to:subject:sender:dkim-signature;
        bh=sB5ZFzlHmeBTxdTpLw5ntKokClFDla1i9Oh5wS8B95s=;
        b=a5z80Qc5RluSf01Uop3OlOqumOeuDQwGoCiyfrxVH961GShq5B3zb/gdb8TtPafx4F
         5yDYIZVE8CEtIxhaIslY7q1at0t4T7IOeZR4B4sGz2A2uCP04/WJ+qjfx4ZbSgKYmTui
         KWMKDrofOyRprkkUQ21v0D4exLmkeu6JJJvHYEuWopRiEqmgNsvEuCSsAnEqQ/kPx2D/
         +6CmBV9fTcUcBdgVKG5oejIN1SR3yz4Cu2paI4zbliCdWqpibapIIw9XEwHxxUEfxmZy
         kNsjK05zQ09kbezh810Wl/BJByj1UqHWSJ2wKaJabUpBN0vTgOp1zLSgvHyZtJkpGXcU
         QAzg==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass header.i=@linutronix.de header.s=2020 header.b=jC+Lpu3T;
       dkim=neutral (no key) header.i=@linutronix.de header.s=2020e header.b=odMdlDki;
       spf=pass (google.com: domain of martin.kaistra@linutronix.de designates 2a0a:51c0:0:12e:550::1 as permitted sender) smtp.mailfrom=martin.kaistra@linutronix.de;
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=linutronix.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20210112;
        h=sender:subject:to:references:from:message-id:date:mime-version
         :in-reply-to:content-language:content-transfer-encoding
         :x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=sB5ZFzlHmeBTxdTpLw5ntKokClFDla1i9Oh5wS8B95s=;
        b=Mfrzmvuy3V8sjGvnqudsTxUAx5p6hvzdg1oUDNCscdYCaMhBz7FFkdxEyiJJTUs/nU
         azQBp32GavAuJrTzj1nCF3Td/wBDTnHVWelYmhNrbh9jRsfsOpwXWxPORWj9IGd/Hmz3
         r3lDjMoy/ruWr2w9l1vZERS/PrxsDYIYrlglF8onTIlwN6WyDlTDn4vMfJpIM5d7tnMb
         B5jnD1QybcNblD4vJxXrnS7UHy+bOyigS3aHLEydsIgjaVVa2VqRbqnOP7E3KSv0V5xU
         /SfsW649Omo4/IMuRktjbOieWKxfR15U6ik2gkg/MnYLOQbbyZ+UM0Q+vorBTVk/UZvc
         CcmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=sender:x-gm-message-state:subject:to:references:from:message-id
         :date:mime-version:in-reply-to:content-language
         :content-transfer-encoding:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :x-spam-checked-in-group:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=sB5ZFzlHmeBTxdTpLw5ntKokClFDla1i9Oh5wS8B95s=;
        b=2h7irBKQUfh5uVipPpdXFedkGa6opNeay5dxuEHd7PyqcG4VFziP9YCxyRtiZFDFoG
         zKmF1oawZBi9kfWgGD+XqtP1ULR7pnZuaijynDFqP0Vxw9TVT7SG+p1zxIcvBtzqDOD0
         XHrpSaqeUEtAbQoaCDekBMIYDYIdBUq30BrEdC/AmNLlYIfDxRLMViOIlX7wTCu5d/SR
         APntMl1p0woEWlyL58PwYWYhL0XzJ0QGeF9CpuRKa+ySSbzbhEOx/9wVTwbv6KFY+BWa
         AHyJd78vlqgL6yt3eg202iGWy4vlYIBxNaz/JfQWgjd4O7DzWbFVI6NFMuj5W5tzXKTv
         uWag==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AOAM530opFwa1a5rAfULiRnG8cJt6ZlrUIn489jSkOLD69mOsmTNPchi
	Z8IhtyT6rNt4cPN5RhT+E+Y=
X-Google-Smtp-Source: ABdhPJwGorbQQKq52s1hDuKjTgg6sMyVHDTDqM8WaA5OU/AEO+SoJJhuUiZ17EzjaGwYEnJbg/c9tw==
X-Received: by 2002:a05:600c:3585:: with SMTP id p5mr10928662wmq.110.1632925928866;
        Wed, 29 Sep 2021 07:32:08 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:adf:8b92:: with SMTP id o18ls3524201wra.0.gmail; Wed, 29 Sep
 2021 07:32:07 -0700 (PDT)
X-Received: by 2002:adf:8919:: with SMTP id s25mr129503wrs.185.1632925927895;
        Wed, 29 Sep 2021 07:32:07 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1632925927; cv=none;
        d=google.com; s=arc-20160816;
        b=Re3y4TPoJfYBfUtAGQz0nRMM6NasOFzKQ7+VqeL5HxRDaaoAWIitpXk1N/pSGJzhcv
         CkQCRWNtD1dqfEN+Wx+5iTp8HvNMMBXXciyknu1rPJVkbrvxIqNgix9AxJ1o5M4yFawS
         1OAOsn1VE2CryY/s6yaTJPjCjEXNO5aeU1/XzE+yksds3WBkeYGiOscCT0/AcKQ9HT1m
         AKObUhQpz352Wh0G3HZbznjhdlOYhPKDe9eKir1qlK/kUfexKTO5Qnx0jqEEqgfDN1kB
         mP9x1/YeRQGQEaHjkl1PzS+8eAqApRndVnQYKIxGVfdqoH13hjI0JLLkTLt4MBYlQLRn
         7Bvg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :date:message-id:from:references:to:dkim-signature:dkim-signature
         :subject;
        bh=a8tvzhtaqNJLoDhZF/YPmNMSLY/CMww9XFYuRe2JZ50=;
        b=wFQ2leQI/XmPNLh+EL/vwyza4qNVWMdGx46GvQTQWgrqMyIJPn2/tyuiWB1Ydi/lue
         qOBQGf6+3jSalSnkYaJNo4nII5jRf15VcGwen6wlUDqiQAETO+GBBE+uol9GZ6jn7QQV
         +5XvLPUxycVS9wpwryf6ETybR6OJvD4q53WmGPYv+XiCfqaDjkKrXvh/JBMSIyIXNaXn
         aTNvIu3YLfnqxGTCHWp1cYsqS0zO6Ul+GCrT6fWGxYWDrOEoD0Cba53WyP9mlwb0prTg
         5hNCbBQ5mdvo5Vd7wDQxf2MF4WKY27FNEdarK33GJ/az6IRQ8s7mMxKmrOJ0vYZ+h83X
         BwdA==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       dkim=pass header.i=@linutronix.de header.s=2020 header.b=jC+Lpu3T;
       dkim=neutral (no key) header.i=@linutronix.de header.s=2020e header.b=odMdlDki;
       spf=pass (google.com: domain of martin.kaistra@linutronix.de designates 2a0a:51c0:0:12e:550::1 as permitted sender) smtp.mailfrom=martin.kaistra@linutronix.de;
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=linutronix.de
Received: from galois.linutronix.de (Galois.linutronix.de. [2a0a:51c0:0:12e:550::1])
        by gmr-mx.google.com with ESMTPS id q21si177140wme.0.2021.09.29.07.32.07
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 Sep 2021 07:32:07 -0700 (PDT)
Received-SPF: pass (google.com: domain of martin.kaistra@linutronix.de designates 2a0a:51c0:0:12e:550::1 as permitted sender) client-ip=2a0a:51c0:0:12e:550::1;
Subject: Re: cell create gets stuck on zynqmp
To: Jan Kiszka <jan.kiszka@web.de>, jailhouse-dev@googlegroups.com
References: <2ee07d25-ca98-8cc0-3299-3a393aa99fd8@linutronix.de>
 <8092b487-f19d-dc89-98e0-cb68077792f9@web.de>
 <5066f207-29e7-4576-5b06-c8f260c4d10a@linutronix.de>
 <8ae7d02a-325c-1be6-fc2c-8654b5e8bd4b@web.de>
 <b5c06e03-9bb3-6703-aa3a-91479cb123ae@linutronix.de>
 <167c22e4-d59e-1560-c9d5-58dd3d3c1433@web.de>
 <31bc8f60-9f99-79c5-77ae-59482f7bd92a@linutronix.de>
 <f987bee6-cb32-efd1-9baa-541185f20479@web.de>
From: Martin Kaistra <martin.kaistra@linutronix.de>
Message-ID: <4bfde340-1027-0d58-d7e3-775b434f0d58@linutronix.de>
Date: Wed, 29 Sep 2021 16:32:07 +0200
MIME-Version: 1.0
In-Reply-To: <f987bee6-cb32-efd1-9baa-541185f20479@web.de>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Language: de-DE
Content-Transfer-Encoding: quoted-printable
X-Original-Sender: martin.kaistra@linutronix.de
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass
 header.i=@linutronix.de header.s=2020 header.b=jC+Lpu3T;       dkim=neutral
 (no key) header.i=@linutronix.de header.s=2020e header.b=odMdlDki;
       spf=pass (google.com: domain of martin.kaistra@linutronix.de designates
 2a0a:51c0:0:12e:550::1 as permitted sender) smtp.mailfrom=martin.kaistra@linutronix.de;
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=linutronix.de
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

Am 29.09.21 um 12:40 schrieb Jan Kiszka:
> On 29.09.21 11:48, Martin Kaistra wrote:
>> Am 29.09.21 um 11:12 schrieb Jan Kiszka:
>>> On 29.09.21 09:50, Martin Kaistra wrote:
>>>> Am 28.09.21 um 11:28 schrieb Jan Kiszka:
>>>>> On 27.09.21 10:30, Martin Kaistra wrote:
>>>>>> Am 24.09.21 um 17:46 schrieb Jan Kiszka:
>>>>>>>
>>>>>>> If suspend_cpu() does not progress, the target CPU is not reacting
>>>>>>> properly on the request to leave the guest and service the Jailhous=
e
>>>>>>> commands. Could be that you interrupts are not handles properly. Ru=
n
>>>>>>> "jailhouse config check" on your setup, maybe you are passing the
>>>>>>> interrupt controller through.
>>>>>>>
>>>>>>> Or are you using SDEI-based management interrupts? Would require a
>>>>>>> special TF-A version, so likely does not happen "by chance".
>>>>>>>
>>>>>>> Jan
>>>>>>>
>>>>>>
>>>>>> Hi Jan,
>>>>>>
>>>>>> "jailhouse config check" finds no problems with the root cell and
>>>>>> inmate
>>>>>> configs.
>>>>>> Also, SDEI is not active. gicv2_send_sgi() is being used.
>>>>>>
>>>>>
>>>>> Then it would be good to continue debugging, now trying to understand
>>>>> what the target CPU is doing.
>>>>>
>>>>> The CPU that requests the suspend sets suspend_cpu in the target data
>>>>> structure, then sends an IPI to that CPU and wait for the other side =
to
>>>>> confirm this via setting cpu_suspended. Check if the target CPU
>>>>> received
>>>>> the IPI, left the guest mode or what else it does by instrumenting th=
e
>>>>> related code paths (check_events on arm64).
>>>>>
>>>>> Jan
>>>>>
>>>>
>>>> The times, when there is no freeze, I can see after cpu0 calls
>>>> arch_send_event() -> gicv2_send_sgi() from suspend_cpu(), on cpu1 ther=
e
>>>> is irqchip_handle_irq() -> arch_handle_sgi() -> check_events().
>>>>
>>>> However in the not working case, after going into suspend_cpu() on cpu=
0,
>>>> there seem to be no interrupts landing on cpu1, I get no debug prints
>>>> from irqchip_handle_irq or check_events.
>>>
>>> But there also arch_send_event() called in the broken case?
>>>
>>> And in both cases cpu1 is inside the guest when the suspension request
>>> is started?
>>
>> Yes, arch_send_event() is also called in the broken case. These are the
>> logs with my added annotations:
>>
>> broken case:
>>
>>
>>
>> ....
>>
>> Activating hypervisor
>>
>> psci_dispatch: 0xc4000001
>>
>> [=C2=A0=C2=A0 18.583357] The Jailhouse is opening.
>>
>> gicv2_send_sgi: cpu 0
>>
>> irqchip_handle_irq (sgi, cpu 1)
>>
>> gicv2_send_sgi: cpu 0
>>
>> gicv2_send_sgi: cpu 1
>>
>> gicv2_send_sgi: cpu 0
>>
>> irqchip_handle_irq (sgi, cpu 1)
>>
>> irqchip_handle_irq (sgi, cpu 0)
>>
>> irqchip_handle_irq (sgi, cpu 1)
>>
>> gicv2_send_sgi: cpu 0
>>
>> irqchip_handle_irq (sgi, cpu 1)
>>
>> ....
>>
>> [=C2=A0=C2=A0 18.681300] CPU1: shutdown
>>
>> psci_dispatch: 0x84000002
>>
>> psci_dispatch: 0xc4000004
>>
>> [=C2=A0=C2=A0 18.688683] psci: CPU1 killed (polled 4 ms)
>>
>> [=C2=A0=C2=A0 18.693551] All CPUs removed!
>>
>> cell_suspend: Running on cpu #0
>>
>> About to suspend cpu #1
>>
>> suspend_cpu()
>>
>> arch_send_event
>>
>> gicv2_send_sgi: cpu 0
>>
>> suspend_cpu() loop
>>
>>
>>
>> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D
>>
>> working case:
>>
>>
>>
>> ....
>>
>> Activating hypervisor
>>
>> gicv2_send_sgi: cpu 1
>>
>> irqchip_handle_irq (sgi, cpu 0)
>>
>> gicv2_send_sgi: cpu 1
>>
>> irqchip_handle_irq (sgi, cpu 0)
>>
>> [=C2=A0=C2=A0 17.908806] The Jailhouse is opening.
>>
>> gicv2_send_sgi: cpu 1
>>
>> gicv2_send_sgi: cpu 0
>>
>> irqchip_handle_irq (sgi, cpu 1)
>>
>> irqchip_handle_irq (sgi, cpu 0)
>>
>> gicv2_send_sgi: cpu 1
>>
>> gicv2_send_sgi: cpu 0
>>
>> irqchip_handle_irq (sgi, cpu 1)
>>
>> irqchip_handle_irq (sgi, cpu 0)
>>
>> ....
>>
>> psci_dispatch: 0x84000002
>>
>> [=C2=A0=C2=A0 18.008498] CPU1: shutdown
>>
>> psci_dispatch: 0xc4000004
>>
>> [=C2=A0=C2=A0 18.014133] psci: CPU1 killed (polled 4 ms)
>>
>> [=C2=A0=C2=A0 18.019385] All CPUs removed!
>>
>> cell_suspend: Running on cpu #0
>>
>> About to suspend cpu #1
>>
>> suspend_cpu()
>>
>> arch_send_event
>>
>> gicv2_send_sgi: cpu 0
>=20
> I assume, "cpu 0" means the sending CPU, not the target. Let's also dump
> the value that gicv2_send_sgi writes to GICD_SGIR, to check if it's the
> same in both cases.
>=20
> Furthermore, it would be good to instrument vm-entry/exit to identify if
> the CPU 1 is in guest or host mode.
>=20
> Jan

Yes, this is the value of this_cpu_id(). The value in gicv2_send_sgi is=20
both times 0x20001.
Also CPU 1 seems to be in "guest mode" when the interrupt is being sent.=20
I don't see a difference in vm exit/enter until it stops working.


Martin

>=20
>>
>> suspend_cpu() loop
>>
>> irqchip_handle_irq (sgi, cpu 1)
>>
>> check_events: running on cpu #1
>>
>> Created cell "inmate-demo"
>>
>> Page pool usage after cell creation: mem 62/992, remap 37/131072
>>
>> [=C2=A0=C2=A0 18.055831] Created Jailhouse cell "inmate-demo"
>>
>>>
>>>>
>>>> Maybe there is a HW problem? But why does it seem to work sometimes..
>>>>
>>>
>>> I would call for a HW problem only after truly excluding all software
>>> issues.
>>>
>>> Jan
>>>
>>

--=20
You received this message because you are subscribed to the Google Groups "=
Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/=
jailhouse-dev/4bfde340-1027-0d58-d7e3-775b434f0d58%40linutronix.de.
