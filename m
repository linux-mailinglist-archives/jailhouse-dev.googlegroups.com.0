Return-Path: <jailhouse-dev+bncBDKIHPWY7EBBBX5F42OAMGQEOS4OJKY@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-yb1-xb3e.google.com (mail-yb1-xb3e.google.com [IPv6:2607:f8b0:4864:20::b3e])
	by mail.lfdr.de (Postfix) with ESMTPS id 6214D64C590
	for <lists+jailhouse-dev@lfdr.de>; Wed, 14 Dec 2022 10:09:53 +0100 (CET)
Received: by mail-yb1-xb3e.google.com with SMTP id f11-20020a5b01cb000000b0070374b66537sf20002108ybp.14
        for <lists+jailhouse-dev@lfdr.de>; Wed, 14 Dec 2022 01:09:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20210112;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:x-original-sender:mime-version
         :subject:references:in-reply-to:message-id:to:from:date:sender:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Aj+f8gl77vC3b5oeHZqRDWdkTRM0v542UmGMXIHdzYk=;
        b=QgY2NYPPOkISvz2p4+XLAcsneffQrTmdqjK5AntB9cZD2lMjuaKVxfCcrzQxjUrC7Y
         u/XW6y2qmymwBKWWpthikAPzY71VebEZGos2c8Uk+A/Q8ylK26K5FR90OjqgrUjsZsIk
         n5OOfY/G7IOXPx74H6vNSm7fLV++RgGM9sVwrgpK1HahuzVvUtF0nTbOSe472B7DCumH
         UUeFDf+rfJuMMaLj2ujmwwOfRnLeReLDBSilPxPYBNFpTGev78TNjVsUjp8uoFgeNX/V
         xGUVlaDspb5qlgvO3Ls2hwfoZPafoXgDAtZFqjm3+qlkVU+HznkUoua8Kwy/3brTzpt2
         c3Gg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:x-original-sender:mime-version
         :subject:references:in-reply-to:message-id:to:from:date:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Aj+f8gl77vC3b5oeHZqRDWdkTRM0v542UmGMXIHdzYk=;
        b=K268qxBbKf1mlKKWPGRMNnW+sx39vNMla6nY+cW7CNT1IXXUM5gqJzCX8d+wnTwbUW
         28y3/wjj6+rH6R3q9mDZ4BmynmcuGtgxJDS6rQxeIeH6kDX/qI7BkKxzXRfovuV40Ij9
         egqekUufMeauaslF4eLWUu4FlsuV9vDWfS8hMHgnDEot3ORMxfzrqtPobJ1MF/qcuWlV
         0GcktddTSluAjYd1+CmUGdk179R/tS8kdGc14LA9KeOdUr0awdvIxFW+oQRDeWcB9G4R
         JbB9GEPFPYYkQQtECfa0qwlJhwfVO6e782YrJCVrFI84XLgubn5zjDc6gdLY7GSqdu8X
         KETg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :x-spam-checked-in-group:list-id:mailing-list:precedence
         :x-original-sender:mime-version:subject:references:in-reply-to
         :message-id:to:from:date:x-gm-message-state:sender:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Aj+f8gl77vC3b5oeHZqRDWdkTRM0v542UmGMXIHdzYk=;
        b=yoh8d3AgOlsfwZ7piGXkMJr94ml94viLSHfLQsT/6g7ZDMOoZWQxoC5yGmqFHng8CG
         /R18Di4q4dAhjdrj9ZscOb8sFMcLolckN7MMe5//n+M5or1uLD6prTmBpQNIBj74fWEL
         LhWRY0E/RkqVaP4EtCbw5vgFdFDzvWt8fvxRgoY67R+Jvk1BOurlf5MDPDLk8CZz0cGv
         4Qd20Y1DKSMklpxtb2RGAOjGBtI4CRSfq5Lq91GKcDntdGySpRo7qJmtMzkrpjxgZSaA
         ZdctROsrXRCWPYucfTZ32mzgRx97B0M78NEiOrB+BYv06RXZr1HKQfWHwe8CTTRIscUT
         yMkQ==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: ANoB5pmnFnv8OawZErK16MCPvxpbWwZBPr+DeXWfX+RyqjM0GL2KjBA2
	55Ivm1RnAhLdC2XETSCXfVY=
X-Google-Smtp-Source: AA0mqf5flOeKLl73Cl/jkrxDcuejfJtQOemdiu5nfS/VbcK2+krSDa59itHFwZaSENP0oBG1ZS0Ktw==
X-Received: by 2002:a81:174a:0:b0:36b:999a:da62 with SMTP id 71-20020a81174a000000b0036b999ada62mr27785196ywx.249.1671008991996;
        Wed, 14 Dec 2022 01:09:51 -0800 (PST)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a0d:d6d1:0:b0:393:f144:5d4d with SMTP id y200-20020a0dd6d1000000b00393f1445d4dls11562740ywd.5.-pod-prod-gmail;
 Wed, 14 Dec 2022 01:09:50 -0800 (PST)
X-Received: by 2002:a81:d8f:0:b0:3cc:5892:fd07 with SMTP id 137-20020a810d8f000000b003cc5892fd07mr517065ywn.420.1671008990691;
        Wed, 14 Dec 2022 01:09:50 -0800 (PST)
Date: Wed, 14 Dec 2022 01:09:49 -0800 (PST)
From: Rasty Slutsker <rslutsker@gmail.com>
To: Jailhouse <jailhouse-dev@googlegroups.com>
Message-Id: <7da1588b-2a97-4b23-924b-6d1ebb75e42cn@googlegroups.com>
In-Reply-To: <918e2011-a51d-d1d6-9028-13e64bd7466c@oth-regensburg.de>
References: <fde55f66-2e83-4df2-8f5e-44b0fb831acbn@googlegroups.com>
 <34d2d078-1282-c240-9a65-301469b0bbe2@oth-regensburg.de>
 <9f1616c7-ac5f-49de-bc24-8bd8520f4c07n@googlegroups.com>
 <b538dfcd-0431-58d7-dd05-60205acc2c06@oth-regensburg.de>
 <01dfb141-0e4f-4adc-939f-c7a0c145c055n@googlegroups.com>
 <8bf22a0b-ec26-5974-e942-c5a0ebc9a028@oth-regensburg.de>
 <ed14da45-f14b-48d3-a38d-071c55354ef0n@googlegroups.com>
 <918e2011-a51d-d1d6-9028-13e64bd7466c@oth-regensburg.de>
Subject: Re: RTOS inmate misses interrupts
MIME-Version: 1.0
Content-Type: multipart/mixed; 
	boundary="----=_Part_338_1774679128.1671008989857"
X-Original-Sender: rslutsker@gmail.com
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

------=_Part_338_1774679128.1671008989857
Content-Type: multipart/alternative; 
	boundary="----=_Part_339_418016255.1671008989857"

------=_Part_339_418016255.1671008989857
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi,
Exactly I reference to  'jailhouse cell stats'
We enabled TSC in Hypervisor init, and printed value to dmsg.
But *after* start of Linux it gets disabled again.
*** Is there a place in hypervisor that runs at kernel space after start of=
=20
linux where we can put re-enabling of TSC?

We would like to measure duration of Hypervisor ISR  with TSC and look for=
=20
anomalies.
Anomalies like unusual duration of ISR processing and Irregularities in ISR=
=20
entry for particular request number.

Other suggestions would be highly appreciated.

Thanks
Rasty

On Tuesday, December 13, 2022 at 11:27:50 PM UTC+2 Ralf Ramsauer wrote:

> Hi Rasty,
>
> (reply-to-all :) )
>
> On 13/12/2022 19:31, Rasty Slutsker wrote:
> > We learned how you export some statistics from Jailhouse as you guys do=
=20
> > and added 3 variables
>
> You reference to 'jailhouse cell stats'?
>
> > 1. At the entry  Jailhouse IRQ (if irq=3D=3Dxxx counter ++)
> > 2. At injection point of the same IRQ to inmate, still in Jailhouse
> > 3. At the beginning of ISR in inmate (RTOS).
>
> Ok, but that just counts the interrupts, and not the occuring delays,=20
> right?
>
> >=20
> > We let system run, introduce some load to linux. We see physical effect=
s=20
> > that suggest that we lose interrupts.
> > We confirm it with difference in performance counters (gaps in quanta o=
f=20
> > 30 uSecs) that we sample in inmate ISR.
> > Than we kill interrupt.
> > All 3 counters are the same. Amount matches interrupt rate.
> > My conclusion that Interrupt request is lost.
>
> Could be the case. I don't know what happens if the jitter gets too long=
=20
> between interrupts.
>
> >=20
> > Another question.
> > We try to read CPU time stamp counter from Jailhouse ISR . We get 0.
> > mrc     p15, #0, r0, c9, c13, #0
>
> That's the PMCNTR, right?
>
> >=20
> > Any idea why? Do you have some code for that?
>
> Uhm, I would have to read the reference manual as well. Does reading the=
=20
> TSC work in Linux? Maybe it has to be activated or enabled for the=20
> hypervisor?
>
>
> https://developer.arm.com/documentation/ddi0406/b/Debug-Architecture/Debu=
g-Registers-Reference/Performance-monitor-registers/c9--Count-Enable-Set-Re=
gister--PMCNTENSET-?lang=3Den
>
> Thanks,
> Ralf
>
> >=20
> > Best regards
> > Rasty
> >=20
> >=20
> >=20
> > On Tuesday, December 13, 2022 at 3:47:25 PM UTC+2 Ralf Ramsauer wrote:
> >=20
> > Hi Rasty,
> >=20
> > Please reply-to-all, then your reply will also pop up in my Inbox.
> >=20
> > On 10/12/2022 08:52, Rasty Slutsker wrote:
> > > Hi,
> > > We did some performance measurements.
> > > Added counters in 3 places (per Irq source)
> > > 1. entry to jailhouse ISR
> > > 2. dispatch of interrupt to particular vector to particular core
> > > 3. in RTOS isr.
> >=20
> > Okay. How do you read and dump them? I hope after everything is done.
> >=20
> > Take care that if you dump them immediately to the uart, this will
> > consume a lot of time and cause significant delay. ('heavy' printk
> > logic
> > + busy waiting for the uart)
> >=20
> > >
> > > *We see that all 3 counters have the same value*, but we measure
> > time
> >=20
> > huh? What counters do you access? There's something odd if they hold
> > the
> > same value at different places.
> >=20
> > > gaps in RTOS in ISR invocation times, sometimes upto 60 uSec.
> > >
> > > It means that either
> > > a) interrupt request is lost. But, according to setup it is
> > > edge-triggered, it cannot be lost, just delayed.
> > > b) there is a delay of more than 60 usec in jailhouse ISR.
> > >
> > > questions:
> > > 1. Is it possible that jailhouse interrupt dispatching routine
> > enters
> > > some loop that takes considerable amount of time?
> >=20
> > If you use printk during dispatching for debugging - yes. Otherwise, I
> > guess no. Not 60=C2=B5s.
> >=20
> > > 2. What would be explanation of interrupt latency of 60 Secs?
> > Even if we
> > > take into account cache line refill we get much lower number,
> > which do
> > > not reach tens uSecs.
> >=20
> > Ack, I would definitely not expect 60=C2=B5s delay for IRQ reinjection.
> >=20
> > Thanks
> > Ralf
> >=20
> > >
> > > Best regards
> > > Rasty
> > >
> > >
> > >
> > >
> > >
> > > On Tuesday, December 6, 2022 at 6:01:20 PM UTC+2 Ralf Ramsauer
> > wrote:
> > >
> > > Hi,
> > >
> > > On 05/12/2022 17:30, Rasty Slutsker wrote:
> > > > Hi Ralf,
> > > > Thank you for the answer.
> > > > We have periodic interrupt each 30 u(!)Sec. Linux cannot deal
> > > with such
> > > > rate, so we need hypervisor/RTOS.
> > >
> > > I understand.
> > >
> > > > We managed to read a code of hypervisor. It appears that all
> > > interrupts
> > > > to all cores are intercepted by hypervisor and then forwarded to
> > > guests
> > > > (per core).
> > >
> > > Yes, exactly, that's the case if you don't have SDEI. If you have a
> > > platform that would come with SDEI, then you have of course less
> > > overhead.
> > >
> > > > If we reduce interrupt priority of mentioned interrupt (as you
> > > suggest)
> > > > we lose even more interrupts, even without stress.
> > > > Interrupt is defined as edge triggered, I assumed that it is
> > > memorized
> > > > by gic until serviced.
> > > > Is it possible that Hypervisor acknowledges pending interrupt
> > while
> > > > servicing interrupt from another source ? Kind of race - 2
> > > interrupts
> > > > for 2 cores arrive nearly simultaneously. One is lost.
> > >
> > > The EOIR and IAR registers of the GIC are core-local registers of
> > the
> > > GIC CPU interface (GICC), so I wonder how this should cause a race,
> > > unless there isn't a hard logical mistake in the code, which I
> > doubt.
> > >
> > >
> > > What you could try to do for debugging purposes:
> > >
> > > 1. Slow down from 30=C2=B5s to something sloooower, which you can han=
dle
> > > even under load. Say 100=C2=B5s, 500=C2=B5s, something like that.
> > >
> > > 2. Measure the jitter x between arrival of the interrupt, and final
> > > acknowledgement in your RTOS. You can use performance monitoring
> > > registers, or watch CPU cycle counters, whatever. Repeat the
> > > measurement, w/ load and w/o load on Linux-side.
> > >
> > > 3. If max(x) >=3D 30=C2=B5s, then you know where your IRQs go in case=
 of a
> > > periodic cycle of 30=C2=B5s.
> > >
> > >
> > > Reason: What I did some while ago, is measuring the Jitter of
> > > Linux+Jailhouse on ARM systems with cyclictest. On a Jetson TX1
> > > platform, for example, we saw Jitter up 50=C2=B5s. So there's IRQ
> > > reinjection, a full Linux stack and some userspace application
> > > involved,
> > > so three context switches and lots of code. You have probably two
> > > context switches and less code, as you use a RTOS, but I think
> > > there's a
> > > certain chance to exceed 30=C2=B5s.
> > >
> > > What my gut feeling tells me is that you manage to hold those
> > 30=C2=B5s if
> > > Linux is quiet. As soon as there's some stress on the system bus,
> > and
> > > even on shared caches, you exceed you deadline.
> > >
> > > Thanks
> > > Ralf
> > >
> > > >
> > > > Best regards
> > > > Rasty
> > > >
> > > > On Monday, December 5, 2022 at 5:14:37 PM UTC+2 Ralf Ramsauer
> > wrote:
> > > >
> > > > Hi Nir,
> > > >
> > > > On 29/11/2022 14:21, nirge...@gmail.com wrote:
> > > > > Hi there,
> > > > >
> > > > > Our target is Sitara AM5726 , CortexA15 dual core on which we
> > are
> > > > > running Linux on A15 core0 and RTOS on core1.
> > > > >
> > > > > __
> > > > >
> > > > > RTOS gets periodic interrupt from external hardware via nirq1
> > pin
> > > > > (dedicated input into ARM gic).____
> > > > >
> > > > > Under heavy load in Linux (core 0!), RTOS, which runs on core1
> > > > misses
> > > > > interrupts.____
> > > >
> > > > Uhm. Can you reconstruct that issue w/o Jailhouse under Linux?
> > > >
> > > > I mean, can you set the SMP affinity of that IRQ to core 1 under
> > > Linux,
> > > > and then write some test application running on core 1 that just
> > > > receives the IRQ. If that issue happens under Linux as well, then
> > > you
> > > > know that the issue has probably nothing to do with Jailhouse.
> > > >
> > > >
> > > > What also might happen: If there's enough pressure on the shared
> > > system
> > > > bus when Linux is under load, then you simply loose those IRQs as
> > > the
> > > > RTOS doesn't have enough time to handle it. You can test this
> > > > hypothesis
> > > > if you lower the frequency of the the periodic interrupt. If you
> > > still
> > > > loose IRQs, then this should not be the case.
> > > >
> > > > >
> > > > > Questions____
> > > > >
> > > > > 1. Does linux/hypervisor participate in interrupt
> > > > scheduling/forwarding
> > > > > to cell on Core1____
> > > >
> > > > Linux: No, Linux does not participate in anything that is going
> > > on on
> > > > CPU 1. That's the idea behind Jailhouse.
> > > >
> > > > Jailhouse: Maybe. On ARM platforms, Jailhouse needs to reinject
> > the
> > > > Interrupt from the hypervisor to the guest, if SDEI is not
> > > available.
> > > > Does the Sitara come with support for SDEI support?
> > > >
> > > > (You can btw monitor the exits of the hypervisor with 'jailhouse
> > > cell
> > > > stats')
> > > >
> > > > Ralf
> > > >
> > > > > 2. Is there a description of interrupt forwarding/virtualization
> > > > scheme
> > > > > to cores (if exists)? Any pointer to document/source code
> > would be
> > > > > appreciated.
> > > > >
> > > > > Thanks a lot,
> > > > >
> > > > > Nir.
> > > > >
> > > > > --
> > > > > You received this message because you are subscribed to the
> > Google
> > > > > Groups "Jailhouse" group.
> > > > > To unsubscribe from this group and stop receiving emails from
> > it,
> > > > send
> > > > > an email to jailhouse-de...@googlegroups.com
> > > > > <mailto:jailhouse-de...@googlegroups.com>.
> > > > > To view this discussion on the web visit
> > > > >
> > > >
> > >
> >=20
> https://groups.google.com/d/msgid/jailhouse-dev/fde55f66-2e83-4df2-8f5e-4=
4b0fb831acbn%40googlegroups.com=20
> <
> https://groups.google.com/d/msgid/jailhouse-dev/fde55f66-2e83-4df2-8f5e-4=
4b0fb831acbn%40googlegroups.com>=20
> <
> https://groups.google.com/d/msgid/jailhouse-dev/fde55f66-2e83-4df2-8f5e-4=
4b0fb831acbn%40googlegroups.com=20
> <
> https://groups.google.com/d/msgid/jailhouse-dev/fde55f66-2e83-4df2-8f5e-4=
4b0fb831acbn%40googlegroups.com>>=20
> <
> https://groups.google.com/d/msgid/jailhouse-dev/fde55f66-2e83-4df2-8f5e-4=
4b0fb831acbn%40googlegroups.com=20
> <
> https://groups.google.com/d/msgid/jailhouse-dev/fde55f66-2e83-4df2-8f5e-4=
4b0fb831acbn%40googlegroups.com>=20
> <
> https://groups.google.com/d/msgid/jailhouse-dev/fde55f66-2e83-4df2-8f5e-4=
4b0fb831acbn%40googlegroups.com=20
> <
> https://groups.google.com/d/msgid/jailhouse-dev/fde55f66-2e83-4df2-8f5e-4=
4b0fb831acbn%40googlegroups.com>>>=20
> <
> https://groups.google.com/d/msgid/jailhouse-dev/fde55f66-2e83-4df2-8f5e-4=
4b0fb831acbn%40googlegroups.com?utm_medium=3Demail&utm_source=3Dfooter=20
> <
> https://groups.google.com/d/msgid/jailhouse-dev/fde55f66-2e83-4df2-8f5e-4=
4b0fb831acbn%40googlegroups.com?utm_medium=3Demail&utm_source=3Dfooter>=20
> <
> https://groups.google.com/d/msgid/jailhouse-dev/fde55f66-2e83-4df2-8f5e-4=
4b0fb831acbn%40googlegroups.com?utm_medium=3Demail&utm_source=3Dfooter=20
> <
> https://groups.google.com/d/msgid/jailhouse-dev/fde55f66-2e83-4df2-8f5e-4=
4b0fb831acbn%40googlegroups.com?utm_medium=3Demail&utm_source=3Dfooter>>=20
> <
> https://groups.google.com/d/msgid/jailhouse-dev/fde55f66-2e83-4df2-8f5e-4=
4b0fb831acbn%40googlegroups.com?utm_medium=3Demail&utm_source=3Dfooter=20
> <
> https://groups.google.com/d/msgid/jailhouse-dev/fde55f66-2e83-4df2-8f5e-4=
4b0fb831acbn%40googlegroups.com?utm_medium=3Demail&utm_source=3Dfooter>=20
> <
> https://groups.google.com/d/msgid/jailhouse-dev/fde55f66-2e83-4df2-8f5e-4=
4b0fb831acbn%40googlegroups.com?utm_medium=3Demail&utm_source=3Dfooter=20
> <
> https://groups.google.com/d/msgid/jailhouse-dev/fde55f66-2e83-4df2-8f5e-4=
4b0fb831acbn%40googlegroups.com?utm_medium=3Demail&utm_source=3Dfooter
> >>>>.
> > > >
> > > > --
> > > > You received this message because you are subscribed to the Google
> > > > Groups "Jailhouse" group.
> > > > To unsubscribe from this group and stop receiving emails from it,
> > > send
> > > > an email to jailhouse-de...@googlegroups.com
> > > > <mailto:jailhouse-de...@googlegroups.com>.
> > > > To view this discussion on the web visit
> > > >
> > >
> >=20
> https://groups.google.com/d/msgid/jailhouse-dev/9f1616c7-ac5f-49de-bc24-8=
bd8520f4c07n%40googlegroups.com=20
> <
> https://groups.google.com/d/msgid/jailhouse-dev/9f1616c7-ac5f-49de-bc24-8=
bd8520f4c07n%40googlegroups.com>=20
> <
> https://groups.google.com/d/msgid/jailhouse-dev/9f1616c7-ac5f-49de-bc24-8=
bd8520f4c07n%40googlegroups.com=20
> <
> https://groups.google.com/d/msgid/jailhouse-dev/9f1616c7-ac5f-49de-bc24-8=
bd8520f4c07n%40googlegroups.com>>=20
> <
> https://groups.google.com/d/msgid/jailhouse-dev/9f1616c7-ac5f-49de-bc24-8=
bd8520f4c07n%40googlegroups.com?utm_medium=3Demail&utm_source=3Dfooter=20
> <
> https://groups.google.com/d/msgid/jailhouse-dev/9f1616c7-ac5f-49de-bc24-8=
bd8520f4c07n%40googlegroups.com?utm_medium=3Demail&utm_source=3Dfooter>=20
> <
> https://groups.google.com/d/msgid/jailhouse-dev/9f1616c7-ac5f-49de-bc24-8=
bd8520f4c07n%40googlegroups.com?utm_medium=3Demail&utm_source=3Dfooter=20
> <
> https://groups.google.com/d/msgid/jailhouse-dev/9f1616c7-ac5f-49de-bc24-8=
bd8520f4c07n%40googlegroups.com?utm_medium=3Demail&utm_source=3Dfooter
> >>>.
> > >
> > > --
> > > You received this message because you are subscribed to the Google
> > > Groups "Jailhouse" group.
> > > To unsubscribe from this group and stop receiving emails from it,
> > send
> > > an email to jailhouse-de...@googlegroups.com
> > > <mailto:jailhouse-de...@googlegroups.com>.
> > > To view this discussion on the web visit
> > >
> >=20
> https://groups.google.com/d/msgid/jailhouse-dev/01dfb141-0e4f-4adc-939f-c=
7a0c145c055n%40googlegroups.com=20
> <
> https://groups.google.com/d/msgid/jailhouse-dev/01dfb141-0e4f-4adc-939f-c=
7a0c145c055n%40googlegroups.com>=20
> <
> https://groups.google.com/d/msgid/jailhouse-dev/01dfb141-0e4f-4adc-939f-c=
7a0c145c055n%40googlegroups.com?utm_medium=3Demail&utm_source=3Dfooter=20
> <
> https://groups.google.com/d/msgid/jailhouse-dev/01dfb141-0e4f-4adc-939f-c=
7a0c145c055n%40googlegroups.com?utm_medium=3Demail&utm_source=3Dfooter
> >>.
> >=20
> > --=20
> > You received this message because you are subscribed to the Google=20
> > Groups "Jailhouse" group.
> > To unsubscribe from this group and stop receiving emails from it, send=
=20
> > an email to jailhouse-de...@googlegroups.com=20
> > <mailto:jailhouse-de...@googlegroups.com>.
> > To view this discussion on the web visit=20
> >=20
> https://groups.google.com/d/msgid/jailhouse-dev/ed14da45-f14b-48d3-a38d-0=
71c55354ef0n%40googlegroups.com=20
> <
> https://groups.google.com/d/msgid/jailhouse-dev/ed14da45-f14b-48d3-a38d-0=
71c55354ef0n%40googlegroups.com?utm_medium=3Demail&utm_source=3Dfooter
> >.
>

--=20
You received this message because you are subscribed to the Google Groups "=
Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/=
jailhouse-dev/7da1588b-2a97-4b23-924b-6d1ebb75e42cn%40googlegroups.com.

------=_Part_339_418016255.1671008989857
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi,<div>Exactly I reference to&nbsp;
'jailhouse cell stats'<br><div>We enabled TSC in Hypervisor init, and print=
ed value to dmsg.</div><div>But *after* start of Linux it gets disabled aga=
in.</div><div>*** Is there a place in hypervisor that runs at kernel space =
after start of linux where we can put re-enabling of TSC?</div><div><br></d=
iv><div>We would like to measure duration of Hypervisor ISR&nbsp; with TSC =
and look for anomalies.</div><div>Anomalies like unusual duration of ISR pr=
ocessing and Irregularities in ISR entry for particular request number.</di=
v><div><br></div><div>Other suggestions would be highly appreciated.</div><=
div><br></div><div>Thanks</div><div>Rasty<br><br></div></div><div class=3D"=
gmail_quote"><div dir=3D"auto" class=3D"gmail_attr">On Tuesday, December 13=
, 2022 at 11:27:50 PM UTC+2 Ralf Ramsauer wrote:<br/></div><blockquote clas=
s=3D"gmail_quote" style=3D"margin: 0 0 0 0.8ex; border-left: 1px solid rgb(=
204, 204, 204); padding-left: 1ex;">Hi Rasty,
<br>
<br>(reply-to-all :) )
<br>
<br>On 13/12/2022 19:31, Rasty Slutsker wrote:
<br>&gt; We learned how you export some statistics from Jailhouse as you gu=
ys do=20
<br>&gt; and added 3 variables
<br>
<br>You reference to &#39;jailhouse cell stats&#39;?
<br>
<br>&gt; 1. At the entry=C2=A0 Jailhouse IRQ (if irq=3D=3Dxxx counter ++)
<br>&gt; 2. At injection point of the same IRQ to inmate, still in Jailhous=
e
<br>&gt; 3. At the beginning of ISR in inmate (RTOS).
<br>
<br>Ok, but that just counts the interrupts, and not the occuring delays, r=
ight?
<br>
<br>&gt;=20
<br>&gt; We let system run, introduce some load to linux. We see physical e=
ffects=20
<br>&gt; that suggest that we lose interrupts.
<br>&gt; We confirm it with difference in performance counters (gaps in qua=
nta of=20
<br>&gt; 30 uSecs) that we sample in inmate ISR.
<br>&gt; Than we kill interrupt.
<br>&gt; All 3 counters are the same. Amount matches interrupt rate.
<br>&gt; My conclusion that Interrupt request is lost.
<br>
<br>Could be the case. I don&#39;t know what happens if the jitter gets too=
 long=20
<br>between interrupts.
<br>
<br>&gt;=20
<br>&gt; Another question.
<br>&gt; We try to read CPU time stamp counter from Jailhouse ISR . We get =
0.
<br>&gt; mrc =C2=A0 =C2=A0 p15, #0, r0, c9, c13, #0
<br>
<br>That&#39;s the PMCNTR, right?
<br>
<br>&gt;=20
<br>&gt; Any idea why? Do you have some code for that?
<br>
<br>Uhm, I would have to read the reference manual as well. Does reading th=
e=20
<br>TSC work in Linux? Maybe it has to be activated or enabled for the=20
<br>hypervisor?
<br>
<br><a href=3D"https://developer.arm.com/documentation/ddi0406/b/Debug-Arch=
itecture/Debug-Registers-Reference/Performance-monitor-registers/c9--Count-=
Enable-Set-Register--PMCNTENSET-?lang=3Den" target=3D"_blank" rel=3D"nofoll=
ow" data-saferedirecturl=3D"https://www.google.com/url?hl=3Den&amp;q=3Dhttp=
s://developer.arm.com/documentation/ddi0406/b/Debug-Architecture/Debug-Regi=
sters-Reference/Performance-monitor-registers/c9--Count-Enable-Set-Register=
--PMCNTENSET-?lang%3Den&amp;source=3Dgmail&amp;ust=3D1671094932679000&amp;u=
sg=3DAOvVaw3yLFdCFtADr5otMPrRf47P">https://developer.arm.com/documentation/=
ddi0406/b/Debug-Architecture/Debug-Registers-Reference/Performance-monitor-=
registers/c9--Count-Enable-Set-Register--PMCNTENSET-?lang=3Den</a>
<br>
<br>Thanks,
<br>   Ralf
<br>
<br>&gt;=20
<br>&gt; Best regards
<br>&gt; Rasty
<br>&gt;=20
<br>&gt;=20
<br>&gt;=20
<br>&gt; On Tuesday, December 13, 2022 at 3:47:25 PM UTC+2 Ralf Ramsauer wr=
ote:
<br>&gt;=20
<br>&gt;     Hi Rasty,
<br>&gt;=20
<br>&gt;     Please reply-to-all, then your reply will also pop up in my In=
box.
<br>&gt;=20
<br>&gt;     On 10/12/2022 08:52, Rasty Slutsker wrote:
<br>&gt;      &gt; Hi,
<br>&gt;      &gt; We did some performance measurements.
<br>&gt;      &gt; Added counters in 3 places (per Irq source)
<br>&gt;      &gt; 1. entry to jailhouse ISR
<br>&gt;      &gt; 2. dispatch of interrupt to particular vector to particu=
lar core
<br>&gt;      &gt; 3. in RTOS isr.
<br>&gt;=20
<br>&gt;     Okay. How do you read and dump them? I hope after everything i=
s done.
<br>&gt;=20
<br>&gt;     Take care that if you dump them immediately to the uart, this =
will
<br>&gt;     consume a lot of time and cause significant delay. (&#39;heavy=
&#39; printk
<br>&gt;     logic
<br>&gt;     + busy waiting for the uart)
<br>&gt;=20
<br>&gt;      &gt;
<br>&gt;      &gt; *We see that all 3 counters have the same value*, but we=
 measure
<br>&gt;     time
<br>&gt;=20
<br>&gt;     huh? What counters do you access? There&#39;s something odd if=
 they hold
<br>&gt;     the
<br>&gt;     same value at different places.
<br>&gt;=20
<br>&gt;      &gt; gaps in RTOS in ISR invocation times, sometimes upto 60 =
uSec.
<br>&gt;      &gt;
<br>&gt;      &gt; It means that either
<br>&gt;      &gt; a) interrupt request is lost. But, according to setup it=
 is
<br>&gt;      &gt; edge-triggered, it cannot be lost, just delayed.
<br>&gt;      &gt; b) there is a delay of more than 60 usec in jailhouse IS=
R.
<br>&gt;      &gt;
<br>&gt;      &gt; questions:
<br>&gt;      &gt; 1. Is it possible that jailhouse interrupt dispatching r=
outine
<br>&gt;     enters
<br>&gt;      &gt; some loop that takes considerable amount of time?
<br>&gt;=20
<br>&gt;     If you use printk during dispatching for debugging - yes. Othe=
rwise, I
<br>&gt;     guess no. Not 60=C2=B5s.
<br>&gt;=20
<br>&gt;      &gt; 2. What would be explanation of interrupt latency of 60 =
Secs?
<br>&gt;     Even if we
<br>&gt;      &gt; take into account cache line refill we get much lower nu=
mber,
<br>&gt;     which do
<br>&gt;      &gt; not reach tens uSecs.
<br>&gt;=20
<br>&gt;     Ack, I would definitely not expect 60=C2=B5s delay for IRQ rei=
njection.
<br>&gt;=20
<br>&gt;     Thanks
<br>&gt;     Ralf
<br>&gt;=20
<br>&gt;      &gt;
<br>&gt;      &gt; Best regards
<br>&gt;      &gt; Rasty
<br>&gt;      &gt;
<br>&gt;      &gt;
<br>&gt;      &gt;
<br>&gt;      &gt;
<br>&gt;      &gt;
<br>&gt;      &gt; On Tuesday, December 6, 2022 at 6:01:20 PM UTC+2 Ralf Ra=
msauer
<br>&gt;     wrote:
<br>&gt;      &gt;
<br>&gt;      &gt; Hi,
<br>&gt;      &gt;
<br>&gt;      &gt; On 05/12/2022 17:30, Rasty Slutsker wrote:
<br>&gt;      &gt; &gt; Hi Ralf,
<br>&gt;      &gt; &gt; Thank you for the answer.
<br>&gt;      &gt; &gt; We have periodic interrupt each 30 u(!)Sec. Linux c=
annot deal
<br>&gt;      &gt; with such
<br>&gt;      &gt; &gt; rate, so we need hypervisor/RTOS.
<br>&gt;      &gt;
<br>&gt;      &gt; I understand.
<br>&gt;      &gt;
<br>&gt;      &gt; &gt; We managed to read a code of hypervisor. It appears=
 that all
<br>&gt;      &gt; interrupts
<br>&gt;      &gt; &gt; to all cores are intercepted by hypervisor and then=
 forwarded to
<br>&gt;      &gt; guests
<br>&gt;      &gt; &gt; (per core).
<br>&gt;      &gt;
<br>&gt;      &gt; Yes, exactly, that&#39;s the case if you don&#39;t have =
SDEI. If you have a
<br>&gt;      &gt; platform that would come with SDEI, then you have of cou=
rse less
<br>&gt;      &gt; overhead.
<br>&gt;      &gt;
<br>&gt;      &gt; &gt; If we reduce interrupt priority of mentioned interr=
upt (as you
<br>&gt;      &gt; suggest)
<br>&gt;      &gt; &gt; we lose even more interrupts, even without stress.
<br>&gt;      &gt; &gt; Interrupt is defined as edge triggered, I assumed t=
hat it is
<br>&gt;      &gt; memorized
<br>&gt;      &gt; &gt; by gic until serviced.
<br>&gt;      &gt; &gt; Is it possible that Hypervisor acknowledges pending=
 interrupt
<br>&gt;     while
<br>&gt;      &gt; &gt; servicing interrupt from another source ? Kind of r=
ace - 2
<br>&gt;      &gt; interrupts
<br>&gt;      &gt; &gt; for 2 cores arrive nearly simultaneously. One is lo=
st.
<br>&gt;      &gt;
<br>&gt;      &gt; The EOIR and IAR registers of the GIC are core-local reg=
isters of
<br>&gt;     the
<br>&gt;      &gt; GIC CPU interface (GICC), so I wonder how this should ca=
use a race,
<br>&gt;      &gt; unless there isn&#39;t a hard logical mistake in the cod=
e, which I
<br>&gt;     doubt.
<br>&gt;      &gt;
<br>&gt;      &gt;
<br>&gt;      &gt; What you could try to do for debugging purposes:
<br>&gt;      &gt;
<br>&gt;      &gt; 1. Slow down from 30=C2=B5s to something sloooower, whic=
h you can handle
<br>&gt;      &gt; even under load. Say 100=C2=B5s, 500=C2=B5s, something l=
ike that.
<br>&gt;      &gt;
<br>&gt;      &gt; 2. Measure the jitter x between arrival of the interrupt=
, and final
<br>&gt;      &gt; acknowledgement in your RTOS. You can use performance mo=
nitoring
<br>&gt;      &gt; registers, or watch CPU cycle counters, whatever. Repeat=
 the
<br>&gt;      &gt; measurement, w/ load and w/o load on Linux-side.
<br>&gt;      &gt;
<br>&gt;      &gt; 3. If max(x) &gt;=3D 30=C2=B5s, then you know where your=
 IRQs go in case of a
<br>&gt;      &gt; periodic cycle of 30=C2=B5s.
<br>&gt;      &gt;
<br>&gt;      &gt;
<br>&gt;      &gt; Reason: What I did some while ago, is measuring the Jitt=
er of
<br>&gt;      &gt; Linux+Jailhouse on ARM systems with cyclictest. On a Jet=
son TX1
<br>&gt;      &gt; platform, for example, we saw Jitter up 50=C2=B5s. So th=
ere&#39;s IRQ
<br>&gt;      &gt; reinjection, a full Linux stack and some userspace appli=
cation
<br>&gt;      &gt; involved,
<br>&gt;      &gt; so three context switches and lots of code. You have pro=
bably two
<br>&gt;      &gt; context switches and less code, as you use a RTOS, but I=
 think
<br>&gt;      &gt; there&#39;s a
<br>&gt;      &gt; certain chance to exceed 30=C2=B5s.
<br>&gt;      &gt;
<br>&gt;      &gt; What my gut feeling tells me is that you manage to hold =
those
<br>&gt;     30=C2=B5s if
<br>&gt;      &gt; Linux is quiet. As soon as there&#39;s some stress on th=
e system bus,
<br>&gt;     and
<br>&gt;      &gt; even on shared caches, you exceed you deadline.
<br>&gt;      &gt;
<br>&gt;      &gt; Thanks
<br>&gt;      &gt; Ralf
<br>&gt;      &gt;
<br>&gt;      &gt; &gt;
<br>&gt;      &gt; &gt; Best regards
<br>&gt;      &gt; &gt; Rasty
<br>&gt;      &gt; &gt;
<br>&gt;      &gt; &gt; On Monday, December 5, 2022 at 5:14:37 PM UTC+2 Ral=
f Ramsauer
<br>&gt;     wrote:
<br>&gt;      &gt; &gt;
<br>&gt;      &gt; &gt; Hi Nir,
<br>&gt;      &gt; &gt;
<br>&gt;      &gt; &gt; On 29/11/2022 14:21, <a href data-email-masked rel=
=3D"nofollow">nirge...@gmail.com</a> wrote:
<br>&gt;      &gt; &gt; &gt; Hi there,
<br>&gt;      &gt; &gt; &gt;
<br>&gt;      &gt; &gt; &gt; Our target is Sitara AM5726 , CortexA15 dual c=
ore on which we
<br>&gt;     are
<br>&gt;      &gt; &gt; &gt; running Linux on A15 core0 and RTOS on core1.
<br>&gt;      &gt; &gt; &gt;
<br>&gt;      &gt; &gt; &gt; __
<br>&gt;      &gt; &gt; &gt;
<br>&gt;      &gt; &gt; &gt; RTOS gets periodic interrupt from external har=
dware via nirq1
<br>&gt;     pin
<br>&gt;      &gt; &gt; &gt; (dedicated input into ARM gic).____
<br>&gt;      &gt; &gt; &gt;
<br>&gt;      &gt; &gt; &gt; Under heavy load in Linux (core 0!), RTOS, whi=
ch runs on core1
<br>&gt;      &gt; &gt; misses
<br>&gt;      &gt; &gt; &gt; interrupts.____
<br>&gt;      &gt; &gt;
<br>&gt;      &gt; &gt; Uhm. Can you reconstruct that issue w/o Jailhouse u=
nder Linux?
<br>&gt;      &gt; &gt;
<br>&gt;      &gt; &gt; I mean, can you set the SMP affinity of that IRQ to=
 core 1 under
<br>&gt;      &gt; Linux,
<br>&gt;      &gt; &gt; and then write some test application running on cor=
e 1 that just
<br>&gt;      &gt; &gt; receives the IRQ. If that issue happens under Linux=
 as well, then
<br>&gt;      &gt; you
<br>&gt;      &gt; &gt; know that the issue has probably nothing to do with=
 Jailhouse.
<br>&gt;      &gt; &gt;
<br>&gt;      &gt; &gt;
<br>&gt;      &gt; &gt; What also might happen: If there&#39;s enough press=
ure on the shared
<br>&gt;      &gt; system
<br>&gt;      &gt; &gt; bus when Linux is under load, then you simply loose=
 those IRQs as
<br>&gt;      &gt; the
<br>&gt;      &gt; &gt; RTOS doesn&#39;t have enough time to handle it. You=
 can test this
<br>&gt;      &gt; &gt; hypothesis
<br>&gt;      &gt; &gt; if you lower the frequency of the the periodic inte=
rrupt. If you
<br>&gt;      &gt; still
<br>&gt;      &gt; &gt; loose IRQs, then this should not be the case.
<br>&gt;      &gt; &gt;
<br>&gt;      &gt; &gt; &gt;
<br>&gt;      &gt; &gt; &gt; Questions____
<br>&gt;      &gt; &gt; &gt;
<br>&gt;      &gt; &gt; &gt; 1. Does linux/hypervisor participate in interr=
upt
<br>&gt;      &gt; &gt; scheduling/forwarding
<br>&gt;      &gt; &gt; &gt; to cell on Core1____
<br>&gt;      &gt; &gt;
<br>&gt;      &gt; &gt; Linux: No, Linux does not participate in anything t=
hat is going
<br>&gt;      &gt; on on
<br>&gt;      &gt; &gt; CPU 1. That&#39;s the idea behind Jailhouse.
<br>&gt;      &gt; &gt;
<br>&gt;      &gt; &gt; Jailhouse: Maybe. On ARM platforms, Jailhouse needs=
 to reinject
<br>&gt;     the
<br>&gt;      &gt; &gt; Interrupt from the hypervisor to the guest, if SDEI=
 is not
<br>&gt;      &gt; available.
<br>&gt;      &gt; &gt; Does the Sitara come with support for SDEI support?
<br>&gt;      &gt; &gt;
<br>&gt;      &gt; &gt; (You can btw monitor the exits of the hypervisor wi=
th &#39;jailhouse
<br>&gt;      &gt; cell
<br>&gt;      &gt; &gt; stats&#39;)
<br>&gt;      &gt; &gt;
<br>&gt;      &gt; &gt; Ralf
<br>&gt;      &gt; &gt;
<br>&gt;      &gt; &gt; &gt; 2. Is there a description of interrupt forward=
ing/virtualization
<br>&gt;      &gt; &gt; scheme
<br>&gt;      &gt; &gt; &gt; to cores (if exists)? Any pointer to document/=
source code
<br>&gt;     would be
<br>&gt;      &gt; &gt; &gt; appreciated.
<br>&gt;      &gt; &gt; &gt;
<br>&gt;      &gt; &gt; &gt; Thanks a lot,
<br>&gt;      &gt; &gt; &gt;
<br>&gt;      &gt; &gt; &gt; Nir.
<br>&gt;      &gt; &gt; &gt;
<br>&gt;      &gt; &gt; &gt; --
<br>&gt;      &gt; &gt; &gt; You received this message because you are subs=
cribed to the
<br>&gt;     Google
<br>&gt;      &gt; &gt; &gt; Groups &quot;Jailhouse&quot; group.
<br>&gt;      &gt; &gt; &gt; To unsubscribe from this group and stop receiv=
ing emails from
<br>&gt;     it,
<br>&gt;      &gt; &gt; send
<br>&gt;      &gt; &gt; &gt; an email to <a href data-email-masked rel=3D"n=
ofollow">jailhouse-de...@googlegroups.com</a>
<br>&gt;      &gt; &gt; &gt; &lt;mailto:<a href data-email-masked rel=3D"no=
follow">jailhouse-de...@googlegroups.com</a>&gt;.
<br>&gt;      &gt; &gt; &gt; To view this discussion on the web visit
<br>&gt;      &gt; &gt; &gt;
<br>&gt;      &gt; &gt;
<br>&gt;      &gt;
<br>&gt;     <a href=3D"https://groups.google.com/d/msgid/jailhouse-dev/fde=
55f66-2e83-4df2-8f5e-44b0fb831acbn%40googlegroups.com" target=3D"_blank" re=
l=3D"nofollow" data-saferedirecturl=3D"https://www.google.com/url?hl=3Den&a=
mp;q=3Dhttps://groups.google.com/d/msgid/jailhouse-dev/fde55f66-2e83-4df2-8=
f5e-44b0fb831acbn%2540googlegroups.com&amp;source=3Dgmail&amp;ust=3D1671094=
932680000&amp;usg=3DAOvVaw3QzUlQT2DRCfBoDv3-U7qc">https://groups.google.com=
/d/msgid/jailhouse-dev/fde55f66-2e83-4df2-8f5e-44b0fb831acbn%40googlegroups=
.com</a> &lt;<a href=3D"https://groups.google.com/d/msgid/jailhouse-dev/fde=
55f66-2e83-4df2-8f5e-44b0fb831acbn%40googlegroups.com" target=3D"_blank" re=
l=3D"nofollow" data-saferedirecturl=3D"https://www.google.com/url?hl=3Den&a=
mp;q=3Dhttps://groups.google.com/d/msgid/jailhouse-dev/fde55f66-2e83-4df2-8=
f5e-44b0fb831acbn%2540googlegroups.com&amp;source=3Dgmail&amp;ust=3D1671094=
932680000&amp;usg=3DAOvVaw3QzUlQT2DRCfBoDv3-U7qc">https://groups.google.com=
/d/msgid/jailhouse-dev/fde55f66-2e83-4df2-8f5e-44b0fb831acbn%40googlegroups=
.com</a>&gt; &lt;<a href=3D"https://groups.google.com/d/msgid/jailhouse-dev=
/fde55f66-2e83-4df2-8f5e-44b0fb831acbn%40googlegroups.com" target=3D"_blank=
" rel=3D"nofollow" data-saferedirecturl=3D"https://www.google.com/url?hl=3D=
en&amp;q=3Dhttps://groups.google.com/d/msgid/jailhouse-dev/fde55f66-2e83-4d=
f2-8f5e-44b0fb831acbn%2540googlegroups.com&amp;source=3Dgmail&amp;ust=3D167=
1094932680000&amp;usg=3DAOvVaw3QzUlQT2DRCfBoDv3-U7qc">https://groups.google=
.com/d/msgid/jailhouse-dev/fde55f66-2e83-4df2-8f5e-44b0fb831acbn%40googlegr=
oups.com</a> &lt;<a href=3D"https://groups.google.com/d/msgid/jailhouse-dev=
/fde55f66-2e83-4df2-8f5e-44b0fb831acbn%40googlegroups.com" target=3D"_blank=
" rel=3D"nofollow" data-saferedirecturl=3D"https://www.google.com/url?hl=3D=
en&amp;q=3Dhttps://groups.google.com/d/msgid/jailhouse-dev/fde55f66-2e83-4d=
f2-8f5e-44b0fb831acbn%2540googlegroups.com&amp;source=3Dgmail&amp;ust=3D167=
1094932680000&amp;usg=3DAOvVaw3QzUlQT2DRCfBoDv3-U7qc">https://groups.google=
.com/d/msgid/jailhouse-dev/fde55f66-2e83-4df2-8f5e-44b0fb831acbn%40googlegr=
oups.com</a>&gt;&gt; &lt;<a href=3D"https://groups.google.com/d/msgid/jailh=
ouse-dev/fde55f66-2e83-4df2-8f5e-44b0fb831acbn%40googlegroups.com" target=
=3D"_blank" rel=3D"nofollow" data-saferedirecturl=3D"https://www.google.com=
/url?hl=3Den&amp;q=3Dhttps://groups.google.com/d/msgid/jailhouse-dev/fde55f=
66-2e83-4df2-8f5e-44b0fb831acbn%2540googlegroups.com&amp;source=3Dgmail&amp=
;ust=3D1671094932680000&amp;usg=3DAOvVaw3QzUlQT2DRCfBoDv3-U7qc">https://gro=
ups.google.com/d/msgid/jailhouse-dev/fde55f66-2e83-4df2-8f5e-44b0fb831acbn%=
40googlegroups.com</a> &lt;<a href=3D"https://groups.google.com/d/msgid/jai=
lhouse-dev/fde55f66-2e83-4df2-8f5e-44b0fb831acbn%40googlegroups.com" target=
=3D"_blank" rel=3D"nofollow" data-saferedirecturl=3D"https://www.google.com=
/url?hl=3Den&amp;q=3Dhttps://groups.google.com/d/msgid/jailhouse-dev/fde55f=
66-2e83-4df2-8f5e-44b0fb831acbn%2540googlegroups.com&amp;source=3Dgmail&amp=
;ust=3D1671094932680000&amp;usg=3DAOvVaw3QzUlQT2DRCfBoDv3-U7qc">https://gro=
ups.google.com/d/msgid/jailhouse-dev/fde55f66-2e83-4df2-8f5e-44b0fb831acbn%=
40googlegroups.com</a>&gt; &lt;<a href=3D"https://groups.google.com/d/msgid=
/jailhouse-dev/fde55f66-2e83-4df2-8f5e-44b0fb831acbn%40googlegroups.com" ta=
rget=3D"_blank" rel=3D"nofollow" data-saferedirecturl=3D"https://www.google=
.com/url?hl=3Den&amp;q=3Dhttps://groups.google.com/d/msgid/jailhouse-dev/fd=
e55f66-2e83-4df2-8f5e-44b0fb831acbn%2540googlegroups.com&amp;source=3Dgmail=
&amp;ust=3D1671094932680000&amp;usg=3DAOvVaw3QzUlQT2DRCfBoDv3-U7qc">https:/=
/groups.google.com/d/msgid/jailhouse-dev/fde55f66-2e83-4df2-8f5e-44b0fb831a=
cbn%40googlegroups.com</a> &lt;<a href=3D"https://groups.google.com/d/msgid=
/jailhouse-dev/fde55f66-2e83-4df2-8f5e-44b0fb831acbn%40googlegroups.com" ta=
rget=3D"_blank" rel=3D"nofollow" data-saferedirecturl=3D"https://www.google=
.com/url?hl=3Den&amp;q=3Dhttps://groups.google.com/d/msgid/jailhouse-dev/fd=
e55f66-2e83-4df2-8f5e-44b0fb831acbn%2540googlegroups.com&amp;source=3Dgmail=
&amp;ust=3D1671094932680000&amp;usg=3DAOvVaw3QzUlQT2DRCfBoDv3-U7qc">https:/=
/groups.google.com/d/msgid/jailhouse-dev/fde55f66-2e83-4df2-8f5e-44b0fb831a=
cbn%40googlegroups.com</a>&gt;&gt;&gt; &lt;<a href=3D"https://groups.google=
.com/d/msgid/jailhouse-dev/fde55f66-2e83-4df2-8f5e-44b0fb831acbn%40googlegr=
oups.com?utm_medium=3Demail&amp;utm_source=3Dfooter" target=3D"_blank" rel=
=3D"nofollow" data-saferedirecturl=3D"https://www.google.com/url?hl=3Den&am=
p;q=3Dhttps://groups.google.com/d/msgid/jailhouse-dev/fde55f66-2e83-4df2-8f=
5e-44b0fb831acbn%2540googlegroups.com?utm_medium%3Demail%26utm_source%3Dfoo=
ter&amp;source=3Dgmail&amp;ust=3D1671094932680000&amp;usg=3DAOvVaw01nhO4JBP=
TS3zeV1qrXY9w">https://groups.google.com/d/msgid/jailhouse-dev/fde55f66-2e8=
3-4df2-8f5e-44b0fb831acbn%40googlegroups.com?utm_medium=3Demail&amp;utm_sou=
rce=3Dfooter</a> &lt;<a href=3D"https://groups.google.com/d/msgid/jailhouse=
-dev/fde55f66-2e83-4df2-8f5e-44b0fb831acbn%40googlegroups.com?utm_medium=3D=
email&amp;utm_source=3Dfooter" target=3D"_blank" rel=3D"nofollow" data-safe=
redirecturl=3D"https://www.google.com/url?hl=3Den&amp;q=3Dhttps://groups.go=
ogle.com/d/msgid/jailhouse-dev/fde55f66-2e83-4df2-8f5e-44b0fb831acbn%2540go=
oglegroups.com?utm_medium%3Demail%26utm_source%3Dfooter&amp;source=3Dgmail&=
amp;ust=3D1671094932680000&amp;usg=3DAOvVaw01nhO4JBPTS3zeV1qrXY9w">https://=
groups.google.com/d/msgid/jailhouse-dev/fde55f66-2e83-4df2-8f5e-44b0fb831ac=
bn%40googlegroups.com?utm_medium=3Demail&amp;utm_source=3Dfooter</a>&gt; &l=
t;<a href=3D"https://groups.google.com/d/msgid/jailhouse-dev/fde55f66-2e83-=
4df2-8f5e-44b0fb831acbn%40googlegroups.com?utm_medium=3Demail&amp;utm_sourc=
e=3Dfooter" target=3D"_blank" rel=3D"nofollow" data-saferedirecturl=3D"http=
s://www.google.com/url?hl=3Den&amp;q=3Dhttps://groups.google.com/d/msgid/ja=
ilhouse-dev/fde55f66-2e83-4df2-8f5e-44b0fb831acbn%2540googlegroups.com?utm_=
medium%3Demail%26utm_source%3Dfooter&amp;source=3Dgmail&amp;ust=3D167109493=
2680000&amp;usg=3DAOvVaw01nhO4JBPTS3zeV1qrXY9w">https://groups.google.com/d=
/msgid/jailhouse-dev/fde55f66-2e83-4df2-8f5e-44b0fb831acbn%40googlegroups.c=
om?utm_medium=3Demail&amp;utm_source=3Dfooter</a> &lt;<a href=3D"https://gr=
oups.google.com/d/msgid/jailhouse-dev/fde55f66-2e83-4df2-8f5e-44b0fb831acbn=
%40googlegroups.com?utm_medium=3Demail&amp;utm_source=3Dfooter" target=3D"_=
blank" rel=3D"nofollow" data-saferedirecturl=3D"https://www.google.com/url?=
hl=3Den&amp;q=3Dhttps://groups.google.com/d/msgid/jailhouse-dev/fde55f66-2e=
83-4df2-8f5e-44b0fb831acbn%2540googlegroups.com?utm_medium%3Demail%26utm_so=
urce%3Dfooter&amp;source=3Dgmail&amp;ust=3D1671094932680000&amp;usg=3DAOvVa=
w01nhO4JBPTS3zeV1qrXY9w">https://groups.google.com/d/msgid/jailhouse-dev/fd=
e55f66-2e83-4df2-8f5e-44b0fb831acbn%40googlegroups.com?utm_medium=3Demail&a=
mp;utm_source=3Dfooter</a>&gt;&gt; &lt;<a href=3D"https://groups.google.com=
/d/msgid/jailhouse-dev/fde55f66-2e83-4df2-8f5e-44b0fb831acbn%40googlegroups=
.com?utm_medium=3Demail&amp;utm_source=3Dfooter" target=3D"_blank" rel=3D"n=
ofollow" data-saferedirecturl=3D"https://www.google.com/url?hl=3Den&amp;q=
=3Dhttps://groups.google.com/d/msgid/jailhouse-dev/fde55f66-2e83-4df2-8f5e-=
44b0fb831acbn%2540googlegroups.com?utm_medium%3Demail%26utm_source%3Dfooter=
&amp;source=3Dgmail&amp;ust=3D1671094932680000&amp;usg=3DAOvVaw01nhO4JBPTS3=
zeV1qrXY9w">https://groups.google.com/d/msgid/jailhouse-dev/fde55f66-2e83-4=
df2-8f5e-44b0fb831acbn%40googlegroups.com?utm_medium=3Demail&amp;utm_source=
=3Dfooter</a> &lt;<a href=3D"https://groups.google.com/d/msgid/jailhouse-de=
v/fde55f66-2e83-4df2-8f5e-44b0fb831acbn%40googlegroups.com?utm_medium=3Dema=
il&amp;utm_source=3Dfooter" target=3D"_blank" rel=3D"nofollow" data-safered=
irecturl=3D"https://www.google.com/url?hl=3Den&amp;q=3Dhttps://groups.googl=
e.com/d/msgid/jailhouse-dev/fde55f66-2e83-4df2-8f5e-44b0fb831acbn%2540googl=
egroups.com?utm_medium%3Demail%26utm_source%3Dfooter&amp;source=3Dgmail&amp=
;ust=3D1671094932680000&amp;usg=3DAOvVaw01nhO4JBPTS3zeV1qrXY9w">https://gro=
ups.google.com/d/msgid/jailhouse-dev/fde55f66-2e83-4df2-8f5e-44b0fb831acbn%=
40googlegroups.com?utm_medium=3Demail&amp;utm_source=3Dfooter</a>&gt; &lt;<=
a href=3D"https://groups.google.com/d/msgid/jailhouse-dev/fde55f66-2e83-4df=
2-8f5e-44b0fb831acbn%40googlegroups.com?utm_medium=3Demail&amp;utm_source=
=3Dfooter" target=3D"_blank" rel=3D"nofollow" data-saferedirecturl=3D"https=
://www.google.com/url?hl=3Den&amp;q=3Dhttps://groups.google.com/d/msgid/jai=
lhouse-dev/fde55f66-2e83-4df2-8f5e-44b0fb831acbn%2540googlegroups.com?utm_m=
edium%3Demail%26utm_source%3Dfooter&amp;source=3Dgmail&amp;ust=3D1671094932=
680000&amp;usg=3DAOvVaw01nhO4JBPTS3zeV1qrXY9w">https://groups.google.com/d/=
msgid/jailhouse-dev/fde55f66-2e83-4df2-8f5e-44b0fb831acbn%40googlegroups.co=
m?utm_medium=3Demail&amp;utm_source=3Dfooter</a> &lt;<a href=3D"https://gro=
ups.google.com/d/msgid/jailhouse-dev/fde55f66-2e83-4df2-8f5e-44b0fb831acbn%=
40googlegroups.com?utm_medium=3Demail&amp;utm_source=3Dfooter" target=3D"_b=
lank" rel=3D"nofollow" data-saferedirecturl=3D"https://www.google.com/url?h=
l=3Den&amp;q=3Dhttps://groups.google.com/d/msgid/jailhouse-dev/fde55f66-2e8=
3-4df2-8f5e-44b0fb831acbn%2540googlegroups.com?utm_medium%3Demail%26utm_sou=
rce%3Dfooter&amp;source=3Dgmail&amp;ust=3D1671094932681000&amp;usg=3DAOvVaw=
2-mpzp6AEH75xXD0s-b-Ys">https://groups.google.com/d/msgid/jailhouse-dev/fde=
55f66-2e83-4df2-8f5e-44b0fb831acbn%40googlegroups.com?utm_medium=3Demail&am=
p;utm_source=3Dfooter</a>&gt;&gt;&gt;&gt;.
<br>&gt;      &gt; &gt;
<br>&gt;      &gt; &gt; --
<br>&gt;      &gt; &gt; You received this message because you are subscribe=
d to the Google
<br>&gt;      &gt; &gt; Groups &quot;Jailhouse&quot; group.
<br>&gt;      &gt; &gt; To unsubscribe from this group and stop receiving e=
mails from it,
<br>&gt;      &gt; send
<br>&gt;      &gt; &gt; an email to <a href data-email-masked rel=3D"nofoll=
ow">jailhouse-de...@googlegroups.com</a>
<br>&gt;      &gt; &gt; &lt;mailto:<a href data-email-masked rel=3D"nofollo=
w">jailhouse-de...@googlegroups.com</a>&gt;.
<br>&gt;      &gt; &gt; To view this discussion on the web visit
<br>&gt;      &gt; &gt;
<br>&gt;      &gt;
<br>&gt;     <a href=3D"https://groups.google.com/d/msgid/jailhouse-dev/9f1=
616c7-ac5f-49de-bc24-8bd8520f4c07n%40googlegroups.com" target=3D"_blank" re=
l=3D"nofollow" data-saferedirecturl=3D"https://www.google.com/url?hl=3Den&a=
mp;q=3Dhttps://groups.google.com/d/msgid/jailhouse-dev/9f1616c7-ac5f-49de-b=
c24-8bd8520f4c07n%2540googlegroups.com&amp;source=3Dgmail&amp;ust=3D1671094=
932681000&amp;usg=3DAOvVaw1TsW2Kjc60nfAwUaVhze47">https://groups.google.com=
/d/msgid/jailhouse-dev/9f1616c7-ac5f-49de-bc24-8bd8520f4c07n%40googlegroups=
.com</a> &lt;<a href=3D"https://groups.google.com/d/msgid/jailhouse-dev/9f1=
616c7-ac5f-49de-bc24-8bd8520f4c07n%40googlegroups.com" target=3D"_blank" re=
l=3D"nofollow" data-saferedirecturl=3D"https://www.google.com/url?hl=3Den&a=
mp;q=3Dhttps://groups.google.com/d/msgid/jailhouse-dev/9f1616c7-ac5f-49de-b=
c24-8bd8520f4c07n%2540googlegroups.com&amp;source=3Dgmail&amp;ust=3D1671094=
932681000&amp;usg=3DAOvVaw1TsW2Kjc60nfAwUaVhze47">https://groups.google.com=
/d/msgid/jailhouse-dev/9f1616c7-ac5f-49de-bc24-8bd8520f4c07n%40googlegroups=
.com</a>&gt; &lt;<a href=3D"https://groups.google.com/d/msgid/jailhouse-dev=
/9f1616c7-ac5f-49de-bc24-8bd8520f4c07n%40googlegroups.com" target=3D"_blank=
" rel=3D"nofollow" data-saferedirecturl=3D"https://www.google.com/url?hl=3D=
en&amp;q=3Dhttps://groups.google.com/d/msgid/jailhouse-dev/9f1616c7-ac5f-49=
de-bc24-8bd8520f4c07n%2540googlegroups.com&amp;source=3Dgmail&amp;ust=3D167=
1094932681000&amp;usg=3DAOvVaw1TsW2Kjc60nfAwUaVhze47">https://groups.google=
.com/d/msgid/jailhouse-dev/9f1616c7-ac5f-49de-bc24-8bd8520f4c07n%40googlegr=
oups.com</a> &lt;<a href=3D"https://groups.google.com/d/msgid/jailhouse-dev=
/9f1616c7-ac5f-49de-bc24-8bd8520f4c07n%40googlegroups.com" target=3D"_blank=
" rel=3D"nofollow" data-saferedirecturl=3D"https://www.google.com/url?hl=3D=
en&amp;q=3Dhttps://groups.google.com/d/msgid/jailhouse-dev/9f1616c7-ac5f-49=
de-bc24-8bd8520f4c07n%2540googlegroups.com&amp;source=3Dgmail&amp;ust=3D167=
1094932681000&amp;usg=3DAOvVaw1TsW2Kjc60nfAwUaVhze47">https://groups.google=
.com/d/msgid/jailhouse-dev/9f1616c7-ac5f-49de-bc24-8bd8520f4c07n%40googlegr=
oups.com</a>&gt;&gt; &lt;<a href=3D"https://groups.google.com/d/msgid/jailh=
ouse-dev/9f1616c7-ac5f-49de-bc24-8bd8520f4c07n%40googlegroups.com?utm_mediu=
m=3Demail&amp;utm_source=3Dfooter" target=3D"_blank" rel=3D"nofollow" data-=
saferedirecturl=3D"https://www.google.com/url?hl=3Den&amp;q=3Dhttps://group=
s.google.com/d/msgid/jailhouse-dev/9f1616c7-ac5f-49de-bc24-8bd8520f4c07n%25=
40googlegroups.com?utm_medium%3Demail%26utm_source%3Dfooter&amp;source=3Dgm=
ail&amp;ust=3D1671094932681000&amp;usg=3DAOvVaw0qD_WI_veXHsjXQAuRwCHp">http=
s://groups.google.com/d/msgid/jailhouse-dev/9f1616c7-ac5f-49de-bc24-8bd8520=
f4c07n%40googlegroups.com?utm_medium=3Demail&amp;utm_source=3Dfooter</a> &l=
t;<a href=3D"https://groups.google.com/d/msgid/jailhouse-dev/9f1616c7-ac5f-=
49de-bc24-8bd8520f4c07n%40googlegroups.com?utm_medium=3Demail&amp;utm_sourc=
e=3Dfooter" target=3D"_blank" rel=3D"nofollow" data-saferedirecturl=3D"http=
s://www.google.com/url?hl=3Den&amp;q=3Dhttps://groups.google.com/d/msgid/ja=
ilhouse-dev/9f1616c7-ac5f-49de-bc24-8bd8520f4c07n%2540googlegroups.com?utm_=
medium%3Demail%26utm_source%3Dfooter&amp;source=3Dgmail&amp;ust=3D167109493=
2681000&amp;usg=3DAOvVaw0qD_WI_veXHsjXQAuRwCHp">https://groups.google.com/d=
/msgid/jailhouse-dev/9f1616c7-ac5f-49de-bc24-8bd8520f4c07n%40googlegroups.c=
om?utm_medium=3Demail&amp;utm_source=3Dfooter</a>&gt; &lt;<a href=3D"https:=
//groups.google.com/d/msgid/jailhouse-dev/9f1616c7-ac5f-49de-bc24-8bd8520f4=
c07n%40googlegroups.com?utm_medium=3Demail&amp;utm_source=3Dfooter" target=
=3D"_blank" rel=3D"nofollow" data-saferedirecturl=3D"https://www.google.com=
/url?hl=3Den&amp;q=3Dhttps://groups.google.com/d/msgid/jailhouse-dev/9f1616=
c7-ac5f-49de-bc24-8bd8520f4c07n%2540googlegroups.com?utm_medium%3Demail%26u=
tm_source%3Dfooter&amp;source=3Dgmail&amp;ust=3D1671094932681000&amp;usg=3D=
AOvVaw0qD_WI_veXHsjXQAuRwCHp">https://groups.google.com/d/msgid/jailhouse-d=
ev/9f1616c7-ac5f-49de-bc24-8bd8520f4c07n%40googlegroups.com?utm_medium=3Dem=
ail&amp;utm_source=3Dfooter</a> &lt;<a href=3D"https://groups.google.com/d/=
msgid/jailhouse-dev/9f1616c7-ac5f-49de-bc24-8bd8520f4c07n%40googlegroups.co=
m?utm_medium=3Demail&amp;utm_source=3Dfooter" target=3D"_blank" rel=3D"nofo=
llow" data-saferedirecturl=3D"https://www.google.com/url?hl=3Den&amp;q=3Dht=
tps://groups.google.com/d/msgid/jailhouse-dev/9f1616c7-ac5f-49de-bc24-8bd85=
20f4c07n%2540googlegroups.com?utm_medium%3Demail%26utm_source%3Dfooter&amp;=
source=3Dgmail&amp;ust=3D1671094932681000&amp;usg=3DAOvVaw0qD_WI_veXHsjXQAu=
RwCHp">https://groups.google.com/d/msgid/jailhouse-dev/9f1616c7-ac5f-49de-b=
c24-8bd8520f4c07n%40googlegroups.com?utm_medium=3Demail&amp;utm_source=3Dfo=
oter</a>&gt;&gt;&gt;.
<br>&gt;      &gt;
<br>&gt;      &gt; --
<br>&gt;      &gt; You received this message because you are subscribed to =
the Google
<br>&gt;      &gt; Groups &quot;Jailhouse&quot; group.
<br>&gt;      &gt; To unsubscribe from this group and stop receiving emails=
 from it,
<br>&gt;     send
<br>&gt;      &gt; an email to <a href data-email-masked rel=3D"nofollow">j=
ailhouse-de...@googlegroups.com</a>
<br>&gt;      &gt; &lt;mailto:<a href data-email-masked rel=3D"nofollow">ja=
ilhouse-de...@googlegroups.com</a>&gt;.
<br>&gt;      &gt; To view this discussion on the web visit
<br>&gt;      &gt;
<br>&gt;     <a href=3D"https://groups.google.com/d/msgid/jailhouse-dev/01d=
fb141-0e4f-4adc-939f-c7a0c145c055n%40googlegroups.com" target=3D"_blank" re=
l=3D"nofollow" data-saferedirecturl=3D"https://www.google.com/url?hl=3Den&a=
mp;q=3Dhttps://groups.google.com/d/msgid/jailhouse-dev/01dfb141-0e4f-4adc-9=
39f-c7a0c145c055n%2540googlegroups.com&amp;source=3Dgmail&amp;ust=3D1671094=
932681000&amp;usg=3DAOvVaw0br64lYnx8njMAbtrMvOdv">https://groups.google.com=
/d/msgid/jailhouse-dev/01dfb141-0e4f-4adc-939f-c7a0c145c055n%40googlegroups=
.com</a> &lt;<a href=3D"https://groups.google.com/d/msgid/jailhouse-dev/01d=
fb141-0e4f-4adc-939f-c7a0c145c055n%40googlegroups.com" target=3D"_blank" re=
l=3D"nofollow" data-saferedirecturl=3D"https://www.google.com/url?hl=3Den&a=
mp;q=3Dhttps://groups.google.com/d/msgid/jailhouse-dev/01dfb141-0e4f-4adc-9=
39f-c7a0c145c055n%2540googlegroups.com&amp;source=3Dgmail&amp;ust=3D1671094=
932681000&amp;usg=3DAOvVaw0br64lYnx8njMAbtrMvOdv">https://groups.google.com=
/d/msgid/jailhouse-dev/01dfb141-0e4f-4adc-939f-c7a0c145c055n%40googlegroups=
.com</a>&gt; &lt;<a href=3D"https://groups.google.com/d/msgid/jailhouse-dev=
/01dfb141-0e4f-4adc-939f-c7a0c145c055n%40googlegroups.com?utm_medium=3Demai=
l&amp;utm_source=3Dfooter" target=3D"_blank" rel=3D"nofollow" data-saferedi=
recturl=3D"https://www.google.com/url?hl=3Den&amp;q=3Dhttps://groups.google=
.com/d/msgid/jailhouse-dev/01dfb141-0e4f-4adc-939f-c7a0c145c055n%2540google=
groups.com?utm_medium%3Demail%26utm_source%3Dfooter&amp;source=3Dgmail&amp;=
ust=3D1671094932681000&amp;usg=3DAOvVaw3baEmIRomTP_JlpMrIN6y_">https://grou=
ps.google.com/d/msgid/jailhouse-dev/01dfb141-0e4f-4adc-939f-c7a0c145c055n%4=
0googlegroups.com?utm_medium=3Demail&amp;utm_source=3Dfooter</a> &lt;<a hre=
f=3D"https://groups.google.com/d/msgid/jailhouse-dev/01dfb141-0e4f-4adc-939=
f-c7a0c145c055n%40googlegroups.com?utm_medium=3Demail&amp;utm_source=3Dfoot=
er" target=3D"_blank" rel=3D"nofollow" data-saferedirecturl=3D"https://www.=
google.com/url?hl=3Den&amp;q=3Dhttps://groups.google.com/d/msgid/jailhouse-=
dev/01dfb141-0e4f-4adc-939f-c7a0c145c055n%2540googlegroups.com?utm_medium%3=
Demail%26utm_source%3Dfooter&amp;source=3Dgmail&amp;ust=3D1671094932681000&=
amp;usg=3DAOvVaw3baEmIRomTP_JlpMrIN6y_">https://groups.google.com/d/msgid/j=
ailhouse-dev/01dfb141-0e4f-4adc-939f-c7a0c145c055n%40googlegroups.com?utm_m=
edium=3Demail&amp;utm_source=3Dfooter</a>&gt;&gt;.
<br>&gt;=20
<br>&gt; --=20
<br>&gt; You received this message because you are subscribed to the Google=
=20
<br>&gt; Groups &quot;Jailhouse&quot; group.
<br>&gt; To unsubscribe from this group and stop receiving emails from it, =
send=20
<br>&gt; an email to <a href data-email-masked rel=3D"nofollow">jailhouse-d=
e...@googlegroups.com</a>=20
<br>&gt; &lt;mailto:<a href data-email-masked rel=3D"nofollow">jailhouse-de=
...@googlegroups.com</a>&gt;.
<br>&gt; To view this discussion on the web visit=20
<br>&gt; <a href=3D"https://groups.google.com/d/msgid/jailhouse-dev/ed14da4=
5-f14b-48d3-a38d-071c55354ef0n%40googlegroups.com" target=3D"_blank" rel=3D=
"nofollow" data-saferedirecturl=3D"https://www.google.com/url?hl=3Den&amp;q=
=3Dhttps://groups.google.com/d/msgid/jailhouse-dev/ed14da45-f14b-48d3-a38d-=
071c55354ef0n%2540googlegroups.com&amp;source=3Dgmail&amp;ust=3D16710949326=
81000&amp;usg=3DAOvVaw1N7jR1Fr40UeTTmnqQo-_Q">https://groups.google.com/d/m=
sgid/jailhouse-dev/ed14da45-f14b-48d3-a38d-071c55354ef0n%40googlegroups.com=
</a> &lt;<a href=3D"https://groups.google.com/d/msgid/jailhouse-dev/ed14da4=
5-f14b-48d3-a38d-071c55354ef0n%40googlegroups.com?utm_medium=3Demail&amp;ut=
m_source=3Dfooter" target=3D"_blank" rel=3D"nofollow" data-saferedirecturl=
=3D"https://www.google.com/url?hl=3Den&amp;q=3Dhttps://groups.google.com/d/=
msgid/jailhouse-dev/ed14da45-f14b-48d3-a38d-071c55354ef0n%2540googlegroups.=
com?utm_medium%3Demail%26utm_source%3Dfooter&amp;source=3Dgmail&amp;ust=3D1=
671094932681000&amp;usg=3DAOvVaw3PD7tOJUMwYt-_inUbrLAh">https://groups.goog=
le.com/d/msgid/jailhouse-dev/ed14da45-f14b-48d3-a38d-071c55354ef0n%40google=
groups.com?utm_medium=3Demail&amp;utm_source=3Dfooter</a>&gt;.
<br></blockquote></div>

<p></p>

-- <br />
You received this message because you are subscribed to the Google Groups &=
quot;Jailhouse&quot; group.<br />
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to <a href=3D"mailto:jailhouse-dev+unsubscribe@googlegroups.com">jailh=
ouse-dev+unsubscribe@googlegroups.com</a>.<br />
To view this discussion on the web visit <a href=3D"https://groups.google.c=
om/d/msgid/jailhouse-dev/7da1588b-2a97-4b23-924b-6d1ebb75e42cn%40googlegrou=
ps.com?utm_medium=3Demail&utm_source=3Dfooter">https://groups.google.com/d/=
msgid/jailhouse-dev/7da1588b-2a97-4b23-924b-6d1ebb75e42cn%40googlegroups.co=
m</a>.<br />

------=_Part_339_418016255.1671008989857--

------=_Part_338_1774679128.1671008989857--
