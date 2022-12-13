Return-Path: <jailhouse-dev+bncBDKIHPWY7EBBB4EJ4OOAMGQEW7U4LTQ@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-yb1-xb3d.google.com (mail-yb1-xb3d.google.com [IPv6:2607:f8b0:4864:20::b3d])
	by mail.lfdr.de (Postfix) with ESMTPS id D808564BBFF
	for <lists+jailhouse-dev@lfdr.de>; Tue, 13 Dec 2022 19:31:13 +0100 (CET)
Received: by mail-yb1-xb3d.google.com with SMTP id a5-20020a25af05000000b006e450a5e507sf17980308ybh.22
        for <lists+jailhouse-dev@lfdr.de>; Tue, 13 Dec 2022 10:31:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20210112;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:x-original-sender:mime-version
         :subject:references:in-reply-to:message-id:to:from:date:sender:from
         :to:cc:subject:date:message-id:reply-to;
        bh=0DpYC3Ar6CS0MUakV2LbduKFC2atm9wRsufha6N5zqY=;
        b=Pay1I49j1Qdc+W1qiFFEQKa/bNwkvBLKNtCffKdbLREvsikr2c87VqpXUVtPtHwjUy
         H1f+szqKPPxz9fu1t9bMBl1gJWGVpijF6oPMoGP/cWueYtkoE0FSMI+Y0PgpoUGksJYm
         GGLgdMFBg8C7fQali3N9tNj6htGQOb6UM73zGWpF3sP1jQ9kD0wtM4k29OGIr4N1/xSD
         DUHWVdPRuVlwK/MKGqYxmyojxGW5XdpKwnD1NlUVhjMwXEz0bEct4NYNbBoTzPobQWh2
         R7RACnSiMrGlPB6+HPmY0Nljqamb/c7BH+kx7sptYwOHEafYWUV37NYc+9I6TqseogMJ
         SmRQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:x-original-sender:mime-version
         :subject:references:in-reply-to:message-id:to:from:date:from:to:cc
         :subject:date:message-id:reply-to;
        bh=0DpYC3Ar6CS0MUakV2LbduKFC2atm9wRsufha6N5zqY=;
        b=cZW3C/jn3eL5tNTOcCeBDE5SkRtt/fyjN9lHE2yWg0vI1iXxarEQoyubhZigSnBLGc
         tCzvoRT9PuR0SWgK+fNRFC3RRFcGhGSDltyI1Ykn+DBplRIjBc849MhwaYsRV8emu/f2
         dg5C083uNUyvdJ2VKMZspGKqW1hXEArxpOMdxeoghpTXR9nFSZdCgjY/T13xwGmMQlV4
         oeRJtEaplPIcWJWi+9xhaQ/htaiusSkWchuAa8FmfJT7hIcksubk/GfnXVnbXCwye4IS
         ryfclP7rCy4tCV0MYp7cJ4v3xcG+XqDZQZ6wWGDCintCLHweu3vVrV1YorHU8YoTElFy
         UYrw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :x-spam-checked-in-group:list-id:mailing-list:precedence
         :x-original-sender:mime-version:subject:references:in-reply-to
         :message-id:to:from:date:x-gm-message-state:sender:from:to:cc
         :subject:date:message-id:reply-to;
        bh=0DpYC3Ar6CS0MUakV2LbduKFC2atm9wRsufha6N5zqY=;
        b=j6kydOuDzjGgLb7qzdwY/M7ek2ly/406328xY8pkPCcG6NAp4zk4auL5X2qhGxlwtI
         SxHSMu9UeWEto28O8NEwFPq9j8zIxUiHAz6poWnz68caehVW8ZRne9bn0/OLn/skNF4q
         fUdbl5rL5tdIcckvRDB8iSXy/rJhuAEHpHFfV+2NcKnu81gW8mVd5YHePSNi9SdKG+QW
         c89lU0N8s/l7p6hhlgi12e2zeWHm6skX8p0jKFSaSncfHw+5pVs/RwU2A5jpVh6RFUAl
         yTlOGWwFDmEaysEg545vEOJm2HaUJ3VFpXqLfL4i95dBi9I0on0Dq2imr+5DffNtLSxg
         bIGA==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: ANoB5pn1DLbhsr/ezsW+h1frqw3oWuabwBHfApSS3bNLyWqU4ZlIjqu2
	wdI53Saw5Z2tV9UNv3geDKU=
X-Google-Smtp-Source: AA0mqf5owqmGPa9BPGBYmgL0oSKZhQoEXuTE2Q+TL5/v/KI2jJJTxHJ3XeDFLnqcPDWXIDGrqLywBA==
X-Received: by 2002:a25:9f85:0:b0:700:f93d:c7cd with SMTP id u5-20020a259f85000000b00700f93dc7cdmr18946739ybq.166.1670956272533;
        Tue, 13 Dec 2022 10:31:12 -0800 (PST)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a81:8350:0:b0:3da:3e43:9e3c with SMTP id t77-20020a818350000000b003da3e439e3cls10727618ywf.9.-pod-prod-gmail;
 Tue, 13 Dec 2022 10:31:11 -0800 (PST)
X-Received: by 2002:a81:88c1:0:b0:399:36f1:d851 with SMTP id y184-20020a8188c1000000b0039936f1d851mr8019863ywf.369.1670956271304;
        Tue, 13 Dec 2022 10:31:11 -0800 (PST)
Date: Tue, 13 Dec 2022 10:31:10 -0800 (PST)
From: Rasty Slutsker <rslutsker@gmail.com>
To: Jailhouse <jailhouse-dev@googlegroups.com>
Message-Id: <ed14da45-f14b-48d3-a38d-071c55354ef0n@googlegroups.com>
In-Reply-To: <8bf22a0b-ec26-5974-e942-c5a0ebc9a028@oth-regensburg.de>
References: <fde55f66-2e83-4df2-8f5e-44b0fb831acbn@googlegroups.com>
 <34d2d078-1282-c240-9a65-301469b0bbe2@oth-regensburg.de>
 <9f1616c7-ac5f-49de-bc24-8bd8520f4c07n@googlegroups.com>
 <b538dfcd-0431-58d7-dd05-60205acc2c06@oth-regensburg.de>
 <01dfb141-0e4f-4adc-939f-c7a0c145c055n@googlegroups.com>
 <8bf22a0b-ec26-5974-e942-c5a0ebc9a028@oth-regensburg.de>
Subject: Re: RTOS inmate misses interrupts
MIME-Version: 1.0
Content-Type: multipart/mixed; 
	boundary="----=_Part_664_2011168884.1670956270552"
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

------=_Part_664_2011168884.1670956270552
Content-Type: multipart/alternative; 
	boundary="----=_Part_665_1423739866.1670956270553"

------=_Part_665_1423739866.1670956270553
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

We learned how you export some statistics from Jailhouse as you guys do and=
=20
added 3 variables
1. At the entry  Jailhouse IRQ (if irq=3D=3Dxxx counter ++)
2. At injection point of the same IRQ to inmate, still in Jailhouse=20
3. At the beginning of ISR in inmate (RTOS).

We let system run, introduce some load to linux. We see physical effects=20
that suggest that we lose interrupts.=20
We confirm it with difference in performance counters (gaps in quanta of 30=
=20
uSecs) that we sample in inmate ISR.
Than we kill interrupt.
All 3 counters are the same. Amount matches interrupt rate.
My conclusion that Interrupt request is lost.

Another question.
We try to read CPU time stamp counter from Jailhouse ISR . We get 0.
mrc     p15, #0, r0, c9, c13, #0

Any idea why? Do you have some code for that?

Best regards
Rasty



On Tuesday, December 13, 2022 at 3:47:25 PM UTC+2 Ralf Ramsauer wrote:

> Hi Rasty,
>
> Please reply-to-all, then your reply will also pop up in my Inbox.
>
> On 10/12/2022 08:52, Rasty Slutsker wrote:
> > Hi,
> > We did some performance measurements.
> > Added counters in 3 places (per Irq source)
> > 1. entry to jailhouse ISR
> > 2. dispatch of interrupt to particular vector to particular core
> > 3. in RTOS isr.
>
> Okay. How do you read and dump them? I hope after everything is done.
>
> Take care that if you dump them immediately to the uart, this will=20
> consume a lot of time and cause significant delay. ('heavy' printk logic=
=20
> + busy waiting for the uart)
>
> >=20
> > *We see that all 3 counters have the same value*, but we measure time=
=20
>
> huh? What counters do you access? There's something odd if they hold the=
=20
> same value at different places.
>
> > gaps in RTOS in ISR invocation times, sometimes upto 60 uSec.
> >=20
> > It means that either
> > a) interrupt request is lost. But, according to setup it is=20
> > edge-triggered, it cannot be lost, just delayed.
> > b) there is a delay of more than 60 usec in jailhouse ISR.
> >=20
> > questions:
> > 1. Is it possible that jailhouse interrupt dispatching routine enters=
=20
> > some loop that takes considerable amount of time?
>
> If you use printk during dispatching for debugging - yes. Otherwise, I=20
> guess no. Not 60=C2=B5s.
>
> > 2. What would be explanation of interrupt latency of 60 Secs? Even if w=
e=20
> > take into account cache line refill we get much lower number, which do=
=20
> > not reach tens uSecs.
>
> Ack, I would definitely not expect 60=C2=B5s delay for IRQ reinjection.
>
> Thanks
> Ralf
>
> >=20
> > Best regards
> > Rasty
> >=20
> >=20
> >=20
> >=20
> >=20
> > On Tuesday, December 6, 2022 at 6:01:20 PM UTC+2 Ralf Ramsauer wrote:
> >=20
> > Hi,
> >=20
> > On 05/12/2022 17:30, Rasty Slutsker wrote:
> > > Hi Ralf,
> > > Thank you for the answer.
> > > We have periodic interrupt each 30 u(!)Sec. Linux cannot deal
> > with such
> > > rate, so we need hypervisor/RTOS.
> >=20
> > I understand.
> >=20
> > > We managed to read a code of hypervisor. It appears that all
> > interrupts
> > > to all cores are intercepted by hypervisor and then forwarded to
> > guests
> > > (per core).
> >=20
> > Yes, exactly, that's the case if you don't have SDEI. If you have a
> > platform that would come with SDEI, then you have of course less
> > overhead.
> >=20
> > > If we reduce interrupt priority of mentioned interrupt (as you
> > suggest)
> > > we lose even more interrupts, even without stress.
> > > Interrupt is defined as edge triggered, I assumed that it is
> > memorized
> > > by gic until serviced.
> > > Is it possible that Hypervisor acknowledges pending interrupt while
> > > servicing interrupt from another source ? Kind of race - 2
> > interrupts
> > > for 2 cores arrive nearly simultaneously. One is lost.
> >=20
> > The EOIR and IAR registers of the GIC are core-local registers of the
> > GIC CPU interface (GICC), so I wonder how this should cause a race,
> > unless there isn't a hard logical mistake in the code, which I doubt.
> >=20
> >=20
> > What you could try to do for debugging purposes:
> >=20
> > 1. Slow down from 30=C2=B5s to something sloooower, which you can handl=
e
> > even under load. Say 100=C2=B5s, 500=C2=B5s, something like that.
> >=20
> > 2. Measure the jitter x between arrival of the interrupt, and final
> > acknowledgement in your RTOS. You can use performance monitoring
> > registers, or watch CPU cycle counters, whatever. Repeat the
> > measurement, w/ load and w/o load on Linux-side.
> >=20
> > 3. If max(x) >=3D 30=C2=B5s, then you know where your IRQs go in case o=
f a
> > periodic cycle of 30=C2=B5s.
> >=20
> >=20
> > Reason: What I did some while ago, is measuring the Jitter of
> > Linux+Jailhouse on ARM systems with cyclictest. On a Jetson TX1
> > platform, for example, we saw Jitter up 50=C2=B5s. So there's IRQ
> > reinjection, a full Linux stack and some userspace application
> > involved,
> > so three context switches and lots of code. You have probably two
> > context switches and less code, as you use a RTOS, but I think
> > there's a
> > certain chance to exceed 30=C2=B5s.
> >=20
> > What my gut feeling tells me is that you manage to hold those 30=C2=B5s=
 if
> > Linux is quiet. As soon as there's some stress on the system bus, and
> > even on shared caches, you exceed you deadline.
> >=20
> > Thanks
> > Ralf
> >=20
> > >
> > > Best regards
> > > Rasty
> > >
> > > On Monday, December 5, 2022 at 5:14:37 PM UTC+2 Ralf Ramsauer wrote:
> > >
> > > Hi Nir,
> > >
> > > On 29/11/2022 14:21, nirge...@gmail.com wrote:
> > > > Hi there,
> > > >
> > > > Our target is Sitara AM5726 , CortexA15 dual core on which we are
> > > > running Linux on A15 core0 and RTOS on core1.
> > > >
> > > > __
> > > >
> > > > RTOS gets periodic interrupt from external hardware via nirq1 pin
> > > > (dedicated input into ARM gic).____
> > > >
> > > > Under heavy load in Linux (core 0!), RTOS, which runs on core1
> > > misses
> > > > interrupts.____
> > >
> > > Uhm. Can you reconstruct that issue w/o Jailhouse under Linux?
> > >
> > > I mean, can you set the SMP affinity of that IRQ to core 1 under
> > Linux,
> > > and then write some test application running on core 1 that just
> > > receives the IRQ. If that issue happens under Linux as well, then
> > you
> > > know that the issue has probably nothing to do with Jailhouse.
> > >
> > >
> > > What also might happen: If there's enough pressure on the shared
> > system
> > > bus when Linux is under load, then you simply loose those IRQs as
> > the
> > > RTOS doesn't have enough time to handle it. You can test this
> > > hypothesis
> > > if you lower the frequency of the the periodic interrupt. If you
> > still
> > > loose IRQs, then this should not be the case.
> > >
> > > >
> > > > Questions____
> > > >
> > > > 1. Does linux/hypervisor participate in interrupt
> > > scheduling/forwarding
> > > > to cell on Core1____
> > >
> > > Linux: No, Linux does not participate in anything that is going
> > on on
> > > CPU 1. That's the idea behind Jailhouse.
> > >
> > > Jailhouse: Maybe. On ARM platforms, Jailhouse needs to reinject the
> > > Interrupt from the hypervisor to the guest, if SDEI is not
> > available.
> > > Does the Sitara come with support for SDEI support?
> > >
> > > (You can btw monitor the exits of the hypervisor with 'jailhouse
> > cell
> > > stats')
> > >
> > > Ralf
> > >
> > > > 2. Is there a description of interrupt forwarding/virtualization
> > > scheme
> > > > to cores (if exists)? Any pointer to document/source code would be
> > > > appreciated.
> > > >
> > > > Thanks a lot,
> > > >
> > > > Nir.
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
> https://groups.google.com/d/msgid/jailhouse-dev/9f1616c7-ac5f-49de-bc24-8=
bd8520f4c07n%40googlegroups.com=20
> <
> https://groups.google.com/d/msgid/jailhouse-dev/9f1616c7-ac5f-49de-bc24-8=
bd8520f4c07n%40googlegroups.com>=20
> <
> https://groups.google.com/d/msgid/jailhouse-dev/9f1616c7-ac5f-49de-bc24-8=
bd8520f4c07n%40googlegroups.com?utm_medium=3Demail&utm_source=3Dfooter=20
> <
> https://groups.google.com/d/msgid/jailhouse-dev/9f1616c7-ac5f-49de-bc24-8=
bd8520f4c07n%40googlegroups.com?utm_medium=3Demail&utm_source=3Dfooter
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
> https://groups.google.com/d/msgid/jailhouse-dev/01dfb141-0e4f-4adc-939f-c=
7a0c145c055n%40googlegroups.com=20
> <
> https://groups.google.com/d/msgid/jailhouse-dev/01dfb141-0e4f-4adc-939f-c=
7a0c145c055n%40googlegroups.com?utm_medium=3Demail&utm_source=3Dfooter
> >.
>

--=20
You received this message because you are subscribed to the Google Groups "=
Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/=
jailhouse-dev/ed14da45-f14b-48d3-a38d-071c55354ef0n%40googlegroups.com.

------=_Part_665_1423739866.1670956270553
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

We learned how you export some statistics from Jailhouse as you guys do and=
 added 3 variables<div>1. At the entry&nbsp; Jailhouse IRQ (if irq=3D=3Dxxx=
 counter ++)</div><div>2. At injection point of the same IRQ to inmate, sti=
ll in Jailhouse&nbsp;</div><div>3. At the beginning of ISR in inmate (RTOS)=
.</div><div><br></div><div>We let system run, introduce some load to linux.=
 We see physical effects that suggest that we lose interrupts.&nbsp;</div><=
div>We confirm it with difference in performance counters (gaps in quanta o=
f 30 uSecs) that we sample in inmate ISR.</div><div>Than we kill interrupt.=
</div><div>All 3 counters are the same. Amount matches interrupt rate.</div=
><div>My conclusion that Interrupt request is lost.</div><div><br></div><di=
v>Another question.</div><div>We try to read CPU time stamp counter from Ja=
ilhouse ISR . We get 0.</div><div>mrc &nbsp; &nbsp; p15, #0, r0, c9, c13, #=
0<br></div><div><br></div><div>Any idea why? Do you have some code for that=
?</div><div><br></div><div>Best regards</div><div>Rasty</div><div><br></div=
><div><br><div><br></div></div><div class=3D"gmail_quote"><div dir=3D"auto"=
 class=3D"gmail_attr">On Tuesday, December 13, 2022 at 3:47:25 PM UTC+2 Ral=
f Ramsauer wrote:<br/></div><blockquote class=3D"gmail_quote" style=3D"marg=
in: 0 0 0 0.8ex; border-left: 1px solid rgb(204, 204, 204); padding-left: 1=
ex;">Hi Rasty,
<br>
<br>Please reply-to-all, then your reply will also pop up in my Inbox.
<br>
<br>On 10/12/2022 08:52, Rasty Slutsker wrote:
<br>&gt; Hi,
<br>&gt; We did some performance measurements.
<br>&gt; Added counters in 3 places (per Irq source)
<br>&gt; 1. entry to jailhouse ISR
<br>&gt; 2. dispatch of interrupt to particular vector to particular core
<br>&gt; 3. in RTOS isr.
<br>
<br>Okay. How do you read and dump them? I hope after everything is done.
<br>
<br>Take care that if you dump them immediately to the uart, this will=20
<br>consume a lot of time and cause significant delay. (&#39;heavy&#39; pri=
ntk logic=20
<br>+ busy waiting for the uart)
<br>
<br>&gt;=20
<br>&gt; *We see that all 3 counters have the same value*, but we measure t=
ime=20
<br>
<br>huh? What counters do you access? There&#39;s something odd if they hol=
d the=20
<br>same value at different places.
<br>
<br>&gt; gaps in RTOS in ISR invocation times, sometimes upto 60 uSec.
<br>&gt;=20
<br>&gt; It means that either
<br>&gt; a) interrupt request is lost. But, according to setup it is=20
<br>&gt; edge-triggered, it cannot be lost, just delayed.
<br>&gt; b) there is a delay of more than 60 usec in jailhouse ISR.
<br>&gt;=20
<br>&gt; questions:
<br>&gt; 1. Is it possible that jailhouse interrupt dispatching routine ent=
ers=20
<br>&gt; some loop that takes considerable amount of time?
<br>
<br>If you use printk during dispatching for debugging - yes. Otherwise, I=
=20
<br>guess no. Not 60=C2=B5s.
<br>
<br>&gt; 2. What would be explanation of interrupt latency of 60 Secs? Even=
 if we=20
<br>&gt; take into account cache line refill we get much lower number, whic=
h do=20
<br>&gt; not reach tens uSecs.
<br>
<br>Ack, I would definitely not expect 60=C2=B5s delay for IRQ reinjection.
<br>
<br>Thanks
<br>   Ralf
<br>
<br>&gt;=20
<br>&gt; Best regards
<br>&gt; Rasty
<br>&gt;=20
<br>&gt;=20
<br>&gt;=20
<br>&gt;=20
<br>&gt;=20
<br>&gt; On Tuesday, December 6, 2022 at 6:01:20 PM UTC+2 Ralf Ramsauer wro=
te:
<br>&gt;=20
<br>&gt;     Hi,
<br>&gt;=20
<br>&gt;     On 05/12/2022 17:30, Rasty Slutsker wrote:
<br>&gt;      &gt; Hi Ralf,
<br>&gt;      &gt; Thank you for the answer.
<br>&gt;      &gt; We have periodic interrupt each 30 u(!)Sec. Linux cannot=
 deal
<br>&gt;     with such
<br>&gt;      &gt; rate, so we need hypervisor/RTOS.
<br>&gt;=20
<br>&gt;     I understand.
<br>&gt;=20
<br>&gt;      &gt; We managed to read a code of hypervisor. It appears that=
 all
<br>&gt;     interrupts
<br>&gt;      &gt; to all cores are intercepted by hypervisor and then forw=
arded to
<br>&gt;     guests
<br>&gt;      &gt; (per core).
<br>&gt;=20
<br>&gt;     Yes, exactly, that&#39;s the case if you don&#39;t have SDEI. =
If you have a
<br>&gt;     platform that would come with SDEI, then you have of course le=
ss
<br>&gt;     overhead.
<br>&gt;=20
<br>&gt;      &gt; If we reduce interrupt priority of mentioned interrupt (=
as you
<br>&gt;     suggest)
<br>&gt;      &gt; we lose even more interrupts, even without stress.
<br>&gt;      &gt; Interrupt is defined as edge triggered, I assumed that i=
t is
<br>&gt;     memorized
<br>&gt;      &gt; by gic until serviced.
<br>&gt;      &gt; Is it possible that Hypervisor acknowledges pending inte=
rrupt while
<br>&gt;      &gt; servicing interrupt from another source ? Kind of race -=
 2
<br>&gt;     interrupts
<br>&gt;      &gt; for 2 cores arrive nearly simultaneously. One is lost.
<br>&gt;=20
<br>&gt;     The EOIR and IAR registers of the GIC are core-local registers=
 of the
<br>&gt;     GIC CPU interface (GICC), so I wonder how this should cause a =
race,
<br>&gt;     unless there isn&#39;t a hard logical mistake in the code, whi=
ch I doubt.
<br>&gt;=20
<br>&gt;=20
<br>&gt;     What you could try to do for debugging purposes:
<br>&gt;=20
<br>&gt;     1. Slow down from 30=C2=B5s to something sloooower, which you =
can handle
<br>&gt;     even under load. Say 100=C2=B5s, 500=C2=B5s, something like th=
at.
<br>&gt;=20
<br>&gt;     2. Measure the jitter x between arrival of the interrupt, and =
final
<br>&gt;     acknowledgement in your RTOS. You can use performance monitori=
ng
<br>&gt;     registers, or watch CPU cycle counters, whatever. Repeat the
<br>&gt;     measurement, w/ load and w/o load on Linux-side.
<br>&gt;=20
<br>&gt;     3. If max(x) &gt;=3D 30=C2=B5s, then you know where your IRQs =
go in case of a
<br>&gt;     periodic cycle of 30=C2=B5s.
<br>&gt;=20
<br>&gt;=20
<br>&gt;     Reason: What I did some while ago, is measuring the Jitter of
<br>&gt;     Linux+Jailhouse on ARM systems with cyclictest. On a Jetson TX=
1
<br>&gt;     platform, for example, we saw Jitter up 50=C2=B5s. So there&#3=
9;s IRQ
<br>&gt;     reinjection, a full Linux stack and some userspace application
<br>&gt;     involved,
<br>&gt;     so three context switches and lots of code. You have probably =
two
<br>&gt;     context switches and less code, as you use a RTOS, but I think
<br>&gt;     there&#39;s a
<br>&gt;     certain chance to exceed 30=C2=B5s.
<br>&gt;=20
<br>&gt;     What my gut feeling tells me is that you manage to hold those =
30=C2=B5s if
<br>&gt;     Linux is quiet. As soon as there&#39;s some stress on the syst=
em bus, and
<br>&gt;     even on shared caches, you exceed you deadline.
<br>&gt;=20
<br>&gt;     Thanks
<br>&gt;     Ralf
<br>&gt;=20
<br>&gt;      &gt;
<br>&gt;      &gt; Best regards
<br>&gt;      &gt; Rasty
<br>&gt;      &gt;
<br>&gt;      &gt; On Monday, December 5, 2022 at 5:14:37 PM UTC+2 Ralf Ram=
sauer wrote:
<br>&gt;      &gt;
<br>&gt;      &gt; Hi Nir,
<br>&gt;      &gt;
<br>&gt;      &gt; On 29/11/2022 14:21, <a href data-email-masked rel=3D"no=
follow">nirge...@gmail.com</a> wrote:
<br>&gt;      &gt; &gt; Hi there,
<br>&gt;      &gt; &gt;
<br>&gt;      &gt; &gt; Our target is Sitara AM5726 , CortexA15 dual core o=
n which we are
<br>&gt;      &gt; &gt; running Linux on A15 core0 and RTOS on core1.
<br>&gt;      &gt; &gt;
<br>&gt;      &gt; &gt; __
<br>&gt;      &gt; &gt;
<br>&gt;      &gt; &gt; RTOS gets periodic interrupt from external hardware=
 via nirq1 pin
<br>&gt;      &gt; &gt; (dedicated input into ARM gic).____
<br>&gt;      &gt; &gt;
<br>&gt;      &gt; &gt; Under heavy load in Linux (core 0!), RTOS, which ru=
ns on core1
<br>&gt;      &gt; misses
<br>&gt;      &gt; &gt; interrupts.____
<br>&gt;      &gt;
<br>&gt;      &gt; Uhm. Can you reconstruct that issue w/o Jailhouse under =
Linux?
<br>&gt;      &gt;
<br>&gt;      &gt; I mean, can you set the SMP affinity of that IRQ to core=
 1 under
<br>&gt;     Linux,
<br>&gt;      &gt; and then write some test application running on core 1 t=
hat just
<br>&gt;      &gt; receives the IRQ. If that issue happens under Linux as w=
ell, then
<br>&gt;     you
<br>&gt;      &gt; know that the issue has probably nothing to do with Jail=
house.
<br>&gt;      &gt;
<br>&gt;      &gt;
<br>&gt;      &gt; What also might happen: If there&#39;s enough pressure o=
n the shared
<br>&gt;     system
<br>&gt;      &gt; bus when Linux is under load, then you simply loose thos=
e IRQs as
<br>&gt;     the
<br>&gt;      &gt; RTOS doesn&#39;t have enough time to handle it. You can =
test this
<br>&gt;      &gt; hypothesis
<br>&gt;      &gt; if you lower the frequency of the the periodic interrupt=
. If you
<br>&gt;     still
<br>&gt;      &gt; loose IRQs, then this should not be the case.
<br>&gt;      &gt;
<br>&gt;      &gt; &gt;
<br>&gt;      &gt; &gt; Questions____
<br>&gt;      &gt; &gt;
<br>&gt;      &gt; &gt; 1. Does linux/hypervisor participate in interrupt
<br>&gt;      &gt; scheduling/forwarding
<br>&gt;      &gt; &gt; to cell on Core1____
<br>&gt;      &gt;
<br>&gt;      &gt; Linux: No, Linux does not participate in anything that i=
s going
<br>&gt;     on on
<br>&gt;      &gt; CPU 1. That&#39;s the idea behind Jailhouse.
<br>&gt;      &gt;
<br>&gt;      &gt; Jailhouse: Maybe. On ARM platforms, Jailhouse needs to r=
einject the
<br>&gt;      &gt; Interrupt from the hypervisor to the guest, if SDEI is n=
ot
<br>&gt;     available.
<br>&gt;      &gt; Does the Sitara come with support for SDEI support?
<br>&gt;      &gt;
<br>&gt;      &gt; (You can btw monitor the exits of the hypervisor with &#=
39;jailhouse
<br>&gt;     cell
<br>&gt;      &gt; stats&#39;)
<br>&gt;      &gt;
<br>&gt;      &gt; Ralf
<br>&gt;      &gt;
<br>&gt;      &gt; &gt; 2. Is there a description of interrupt forwarding/v=
irtualization
<br>&gt;      &gt; scheme
<br>&gt;      &gt; &gt; to cores (if exists)? Any pointer to document/sourc=
e code would be
<br>&gt;      &gt; &gt; appreciated.
<br>&gt;      &gt; &gt;
<br>&gt;      &gt; &gt; Thanks a lot,
<br>&gt;      &gt; &gt;
<br>&gt;      &gt; &gt; Nir.
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
<br>&gt;     <a href=3D"https://groups.google.com/d/msgid/jailhouse-dev/fde=
55f66-2e83-4df2-8f5e-44b0fb831acbn%40googlegroups.com" target=3D"_blank" re=
l=3D"nofollow" data-saferedirecturl=3D"https://www.google.com/url?hl=3Den&a=
mp;q=3Dhttps://groups.google.com/d/msgid/jailhouse-dev/fde55f66-2e83-4df2-8=
f5e-44b0fb831acbn%2540googlegroups.com&amp;source=3Dgmail&amp;ust=3D1671042=
051892000&amp;usg=3DAOvVaw3t_wjNtA-vysAXEBNMuGHW">https://groups.google.com=
/d/msgid/jailhouse-dev/fde55f66-2e83-4df2-8f5e-44b0fb831acbn%40googlegroups=
.com</a> &lt;<a href=3D"https://groups.google.com/d/msgid/jailhouse-dev/fde=
55f66-2e83-4df2-8f5e-44b0fb831acbn%40googlegroups.com" target=3D"_blank" re=
l=3D"nofollow" data-saferedirecturl=3D"https://www.google.com/url?hl=3Den&a=
mp;q=3Dhttps://groups.google.com/d/msgid/jailhouse-dev/fde55f66-2e83-4df2-8=
f5e-44b0fb831acbn%2540googlegroups.com&amp;source=3Dgmail&amp;ust=3D1671042=
051892000&amp;usg=3DAOvVaw3t_wjNtA-vysAXEBNMuGHW">https://groups.google.com=
/d/msgid/jailhouse-dev/fde55f66-2e83-4df2-8f5e-44b0fb831acbn%40googlegroups=
.com</a>&gt; &lt;<a href=3D"https://groups.google.com/d/msgid/jailhouse-dev=
/fde55f66-2e83-4df2-8f5e-44b0fb831acbn%40googlegroups.com" target=3D"_blank=
" rel=3D"nofollow" data-saferedirecturl=3D"https://www.google.com/url?hl=3D=
en&amp;q=3Dhttps://groups.google.com/d/msgid/jailhouse-dev/fde55f66-2e83-4d=
f2-8f5e-44b0fb831acbn%2540googlegroups.com&amp;source=3Dgmail&amp;ust=3D167=
1042051892000&amp;usg=3DAOvVaw3t_wjNtA-vysAXEBNMuGHW">https://groups.google=
.com/d/msgid/jailhouse-dev/fde55f66-2e83-4df2-8f5e-44b0fb831acbn%40googlegr=
oups.com</a> &lt;<a href=3D"https://groups.google.com/d/msgid/jailhouse-dev=
/fde55f66-2e83-4df2-8f5e-44b0fb831acbn%40googlegroups.com" target=3D"_blank=
" rel=3D"nofollow" data-saferedirecturl=3D"https://www.google.com/url?hl=3D=
en&amp;q=3Dhttps://groups.google.com/d/msgid/jailhouse-dev/fde55f66-2e83-4d=
f2-8f5e-44b0fb831acbn%2540googlegroups.com&amp;source=3Dgmail&amp;ust=3D167=
1042051892000&amp;usg=3DAOvVaw3t_wjNtA-vysAXEBNMuGHW">https://groups.google=
.com/d/msgid/jailhouse-dev/fde55f66-2e83-4df2-8f5e-44b0fb831acbn%40googlegr=
oups.com</a>&gt;&gt; &lt;<a href=3D"https://groups.google.com/d/msgid/jailh=
ouse-dev/fde55f66-2e83-4df2-8f5e-44b0fb831acbn%40googlegroups.com?utm_mediu=
m=3Demail&amp;utm_source=3Dfooter" target=3D"_blank" rel=3D"nofollow" data-=
saferedirecturl=3D"https://www.google.com/url?hl=3Den&amp;q=3Dhttps://group=
s.google.com/d/msgid/jailhouse-dev/fde55f66-2e83-4df2-8f5e-44b0fb831acbn%25=
40googlegroups.com?utm_medium%3Demail%26utm_source%3Dfooter&amp;source=3Dgm=
ail&amp;ust=3D1671042051892000&amp;usg=3DAOvVaw2Q6PvLxrKn02r-HF9M4lIz">http=
s://groups.google.com/d/msgid/jailhouse-dev/fde55f66-2e83-4df2-8f5e-44b0fb8=
31acbn%40googlegroups.com?utm_medium=3Demail&amp;utm_source=3Dfooter</a> &l=
t;<a href=3D"https://groups.google.com/d/msgid/jailhouse-dev/fde55f66-2e83-=
4df2-8f5e-44b0fb831acbn%40googlegroups.com?utm_medium=3Demail&amp;utm_sourc=
e=3Dfooter" target=3D"_blank" rel=3D"nofollow" data-saferedirecturl=3D"http=
s://www.google.com/url?hl=3Den&amp;q=3Dhttps://groups.google.com/d/msgid/ja=
ilhouse-dev/fde55f66-2e83-4df2-8f5e-44b0fb831acbn%2540googlegroups.com?utm_=
medium%3Demail%26utm_source%3Dfooter&amp;source=3Dgmail&amp;ust=3D167104205=
1892000&amp;usg=3DAOvVaw2Q6PvLxrKn02r-HF9M4lIz">https://groups.google.com/d=
/msgid/jailhouse-dev/fde55f66-2e83-4df2-8f5e-44b0fb831acbn%40googlegroups.c=
om?utm_medium=3Demail&amp;utm_source=3Dfooter</a>&gt; &lt;<a href=3D"https:=
//groups.google.com/d/msgid/jailhouse-dev/fde55f66-2e83-4df2-8f5e-44b0fb831=
acbn%40googlegroups.com?utm_medium=3Demail&amp;utm_source=3Dfooter" target=
=3D"_blank" rel=3D"nofollow" data-saferedirecturl=3D"https://www.google.com=
/url?hl=3Den&amp;q=3Dhttps://groups.google.com/d/msgid/jailhouse-dev/fde55f=
66-2e83-4df2-8f5e-44b0fb831acbn%2540googlegroups.com?utm_medium%3Demail%26u=
tm_source%3Dfooter&amp;source=3Dgmail&amp;ust=3D1671042051892000&amp;usg=3D=
AOvVaw2Q6PvLxrKn02r-HF9M4lIz">https://groups.google.com/d/msgid/jailhouse-d=
ev/fde55f66-2e83-4df2-8f5e-44b0fb831acbn%40googlegroups.com?utm_medium=3Dem=
ail&amp;utm_source=3Dfooter</a> &lt;<a href=3D"https://groups.google.com/d/=
msgid/jailhouse-dev/fde55f66-2e83-4df2-8f5e-44b0fb831acbn%40googlegroups.co=
m?utm_medium=3Demail&amp;utm_source=3Dfooter" target=3D"_blank" rel=3D"nofo=
llow" data-saferedirecturl=3D"https://www.google.com/url?hl=3Den&amp;q=3Dht=
tps://groups.google.com/d/msgid/jailhouse-dev/fde55f66-2e83-4df2-8f5e-44b0f=
b831acbn%2540googlegroups.com?utm_medium%3Demail%26utm_source%3Dfooter&amp;=
source=3Dgmail&amp;ust=3D1671042051892000&amp;usg=3DAOvVaw2Q6PvLxrKn02r-HF9=
M4lIz">https://groups.google.com/d/msgid/jailhouse-dev/fde55f66-2e83-4df2-8=
f5e-44b0fb831acbn%40googlegroups.com?utm_medium=3Demail&amp;utm_source=3Dfo=
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
<br>&gt;     <a href=3D"https://groups.google.com/d/msgid/jailhouse-dev/9f1=
616c7-ac5f-49de-bc24-8bd8520f4c07n%40googlegroups.com" target=3D"_blank" re=
l=3D"nofollow" data-saferedirecturl=3D"https://www.google.com/url?hl=3Den&a=
mp;q=3Dhttps://groups.google.com/d/msgid/jailhouse-dev/9f1616c7-ac5f-49de-b=
c24-8bd8520f4c07n%2540googlegroups.com&amp;source=3Dgmail&amp;ust=3D1671042=
051892000&amp;usg=3DAOvVaw2d2PAL7XTaPXGC3d-TPs08">https://groups.google.com=
/d/msgid/jailhouse-dev/9f1616c7-ac5f-49de-bc24-8bd8520f4c07n%40googlegroups=
.com</a> &lt;<a href=3D"https://groups.google.com/d/msgid/jailhouse-dev/9f1=
616c7-ac5f-49de-bc24-8bd8520f4c07n%40googlegroups.com" target=3D"_blank" re=
l=3D"nofollow" data-saferedirecturl=3D"https://www.google.com/url?hl=3Den&a=
mp;q=3Dhttps://groups.google.com/d/msgid/jailhouse-dev/9f1616c7-ac5f-49de-b=
c24-8bd8520f4c07n%2540googlegroups.com&amp;source=3Dgmail&amp;ust=3D1671042=
051892000&amp;usg=3DAOvVaw2d2PAL7XTaPXGC3d-TPs08">https://groups.google.com=
/d/msgid/jailhouse-dev/9f1616c7-ac5f-49de-bc24-8bd8520f4c07n%40googlegroups=
.com</a>&gt; &lt;<a href=3D"https://groups.google.com/d/msgid/jailhouse-dev=
/9f1616c7-ac5f-49de-bc24-8bd8520f4c07n%40googlegroups.com?utm_medium=3Demai=
l&amp;utm_source=3Dfooter" target=3D"_blank" rel=3D"nofollow" data-saferedi=
recturl=3D"https://www.google.com/url?hl=3Den&amp;q=3Dhttps://groups.google=
.com/d/msgid/jailhouse-dev/9f1616c7-ac5f-49de-bc24-8bd8520f4c07n%2540google=
groups.com?utm_medium%3Demail%26utm_source%3Dfooter&amp;source=3Dgmail&amp;=
ust=3D1671042051892000&amp;usg=3DAOvVaw0GTNkC7rAsr9OHxtrnSG4M">https://grou=
ps.google.com/d/msgid/jailhouse-dev/9f1616c7-ac5f-49de-bc24-8bd8520f4c07n%4=
0googlegroups.com?utm_medium=3Demail&amp;utm_source=3Dfooter</a> &lt;<a hre=
f=3D"https://groups.google.com/d/msgid/jailhouse-dev/9f1616c7-ac5f-49de-bc2=
4-8bd8520f4c07n%40googlegroups.com?utm_medium=3Demail&amp;utm_source=3Dfoot=
er" target=3D"_blank" rel=3D"nofollow" data-saferedirecturl=3D"https://www.=
google.com/url?hl=3Den&amp;q=3Dhttps://groups.google.com/d/msgid/jailhouse-=
dev/9f1616c7-ac5f-49de-bc24-8bd8520f4c07n%2540googlegroups.com?utm_medium%3=
Demail%26utm_source%3Dfooter&amp;source=3Dgmail&amp;ust=3D1671042051892000&=
amp;usg=3DAOvVaw0GTNkC7rAsr9OHxtrnSG4M">https://groups.google.com/d/msgid/j=
ailhouse-dev/9f1616c7-ac5f-49de-bc24-8bd8520f4c07n%40googlegroups.com?utm_m=
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
<br>&gt; <a href=3D"https://groups.google.com/d/msgid/jailhouse-dev/01dfb14=
1-0e4f-4adc-939f-c7a0c145c055n%40googlegroups.com" target=3D"_blank" rel=3D=
"nofollow" data-saferedirecturl=3D"https://www.google.com/url?hl=3Den&amp;q=
=3Dhttps://groups.google.com/d/msgid/jailhouse-dev/01dfb141-0e4f-4adc-939f-=
c7a0c145c055n%2540googlegroups.com&amp;source=3Dgmail&amp;ust=3D16710420518=
92000&amp;usg=3DAOvVaw3u__lOaTRJw9zh728hmA26">https://groups.google.com/d/m=
sgid/jailhouse-dev/01dfb141-0e4f-4adc-939f-c7a0c145c055n%40googlegroups.com=
</a> &lt;<a href=3D"https://groups.google.com/d/msgid/jailhouse-dev/01dfb14=
1-0e4f-4adc-939f-c7a0c145c055n%40googlegroups.com?utm_medium=3Demail&amp;ut=
m_source=3Dfooter" target=3D"_blank" rel=3D"nofollow" data-saferedirecturl=
=3D"https://www.google.com/url?hl=3Den&amp;q=3Dhttps://groups.google.com/d/=
msgid/jailhouse-dev/01dfb141-0e4f-4adc-939f-c7a0c145c055n%2540googlegroups.=
com?utm_medium%3Demail%26utm_source%3Dfooter&amp;source=3Dgmail&amp;ust=3D1=
671042051892000&amp;usg=3DAOvVaw2iDt9cF8NyEfVlRYTobLB4">https://groups.goog=
le.com/d/msgid/jailhouse-dev/01dfb141-0e4f-4adc-939f-c7a0c145c055n%40google=
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
om/d/msgid/jailhouse-dev/ed14da45-f14b-48d3-a38d-071c55354ef0n%40googlegrou=
ps.com?utm_medium=3Demail&utm_source=3Dfooter">https://groups.google.com/d/=
msgid/jailhouse-dev/ed14da45-f14b-48d3-a38d-071c55354ef0n%40googlegroups.co=
m</a>.<br />

------=_Part_665_1423739866.1670956270553--

------=_Part_664_2011168884.1670956270552--
