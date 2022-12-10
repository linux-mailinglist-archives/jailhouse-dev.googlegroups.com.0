Return-Path: <jailhouse-dev+bncBDKIHPWY7EBBBRPV2COAMGQEDVXM2II@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-yw1-x113a.google.com (mail-yw1-x113a.google.com [IPv6:2607:f8b0:4864:20::113a])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B5C4648D85
	for <lists+jailhouse-dev@lfdr.de>; Sat, 10 Dec 2022 08:52:39 +0100 (CET)
Received: by mail-yw1-x113a.google.com with SMTP id 00721157ae682-39afd53dcdbsf75007627b3.8
        for <lists+jailhouse-dev@lfdr.de>; Fri, 09 Dec 2022 23:52:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20210112;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:x-original-sender:mime-version
         :subject:references:in-reply-to:message-id:to:from:date:sender:from
         :to:cc:subject:date:message-id:reply-to;
        bh=bgQfxTN+W99Y3nxAO0u4OGH3ZMXETdnkV++YBTzIViI=;
        b=UuL9ondRVcLsNzy0tuReYPZDDd1AwNprnXJUSQZMwRQqOJ/nc/EckyCol0rZ6k3kow
         YI7Kj/G83zzSWN43L/J+eXta08j3SpD8GeFX1yoWr/9Zaz7vZ3oVtBuM3ikXWTWrUnC1
         xEGQIqfWtn4xT1tx+Ci2bLSvrY7DVOyWH63kBE7rRFqpgGxtsvbEGp+hu3RQfPPHm19+
         w8lqCw7D+w2exgEwTClE/t7qd5pu0cRASsMUn941GWINqxmdZjB9q8Lxgb4blq7UN5ib
         2YpDPxWL/IkX+LaTOfaoSWLMLC0g2R2KrPo2GRJ3GRdq4peLjsS+G9zLaW5GDSZxN8Ot
         kldw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:x-original-sender:mime-version
         :subject:references:in-reply-to:message-id:to:from:date:from:to:cc
         :subject:date:message-id:reply-to;
        bh=bgQfxTN+W99Y3nxAO0u4OGH3ZMXETdnkV++YBTzIViI=;
        b=HF8NWf1uDmYEQV29QkWlD8QhSFUjIwcszNycyBYHmxYu6FgPLcKK/lfCNxSd6Y4we5
         HLpLgktFd1WYhh8OzwnViOQbZ6ebg1J1V/HKH+mACrJUE9dVA6dn0FTvxTV2ChphVIfs
         ZQDbKcDx/DkljY62Le8qYIJVOt3OMkLxpxrUgEkZ48Sl2eCxU6O7quw+4xAgNQbrqLlr
         CoDLoBV2uS4UAX7LzcALaQDl3XiqZgbCZmGC/L22Uqq3b3TBvYO4fPrGxHsBKuqX8isi
         FwRmTo5Cef6atCYfAzgZGUMDibDfoK8GO7EPXQIyliEmUlbX0lKpsfzrhYh4OinD49oK
         4YtQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :x-spam-checked-in-group:list-id:mailing-list:precedence
         :x-original-sender:mime-version:subject:references:in-reply-to
         :message-id:to:from:date:x-gm-message-state:sender:from:to:cc
         :subject:date:message-id:reply-to;
        bh=bgQfxTN+W99Y3nxAO0u4OGH3ZMXETdnkV++YBTzIViI=;
        b=f4Lp35yTTlib7b22svtjvMGXgtolOnuU2P67Q1R5E+wmHwTbQr79SNsdhSxxw1WkSY
         fHIjIBQ9MiSHr9MAw8uAqNHn7ldtdiYGu+bkgNmJQzv/PA6OCm+RXGlTj2Z0aOqjUX4Z
         ZYRlzI+m/dUxotRKnlJ7nptVNlyJMRVOc5CNZIV60Ec1UxdWOnOfDLKmwfpvrxoWjLQF
         bg8yPsS1HTQUPIFxaU+cMO/arVDu/lJzZKBZ7YpzaGNHDuvLEh8R2vOJs/UuKlOkBbPQ
         ZkECBi3vHZNTXlp8MxsVC/E8MN9+ejTYde/lcV9VK0pkRVJd3OQZlssp4wDUw2IrdeoP
         3vPQ==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: ANoB5plI3K2oCK0rQhUD03x2jz8ENp7ZhhnhHnu4b1THkfIXUvE3GnAE
	/geoaOpbdNe1nm7o5cSpkI0=
X-Google-Smtp-Source: AA0mqf6xYkMRoEJ1t82lGrnCSHYlde8cG8BQ5KPSfoqEfo41lAIWp+WsLmF5FLUm2HnHMajexz3wbQ==
X-Received: by 2002:a81:b408:0:b0:3c2:ecb0:8c3b with SMTP id h8-20020a81b408000000b003c2ecb08c3bmr53222435ywi.291.1670658758041;
        Fri, 09 Dec 2022 23:52:38 -0800 (PST)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a25:b0a6:0:b0:70b:ecd8:a6b3 with SMTP id f38-20020a25b0a6000000b0070becd8a6b3ls5420406ybj.8.-pod-prod-gmail;
 Fri, 09 Dec 2022 23:52:37 -0800 (PST)
X-Received: by 2002:a25:8c02:0:b0:6e2:9b6e:7571 with SMTP id k2-20020a258c02000000b006e29b6e7571mr72150500ybl.27.1670658756910;
        Fri, 09 Dec 2022 23:52:36 -0800 (PST)
Date: Fri, 9 Dec 2022 23:52:36 -0800 (PST)
From: Rasty Slutsker <rslutsker@gmail.com>
To: Jailhouse <jailhouse-dev@googlegroups.com>
Message-Id: <01dfb141-0e4f-4adc-939f-c7a0c145c055n@googlegroups.com>
In-Reply-To: <b538dfcd-0431-58d7-dd05-60205acc2c06@oth-regensburg.de>
References: <fde55f66-2e83-4df2-8f5e-44b0fb831acbn@googlegroups.com>
 <34d2d078-1282-c240-9a65-301469b0bbe2@oth-regensburg.de>
 <9f1616c7-ac5f-49de-bc24-8bd8520f4c07n@googlegroups.com>
 <b538dfcd-0431-58d7-dd05-60205acc2c06@oth-regensburg.de>
Subject: Re: RTOS inmate misses interrupts
MIME-Version: 1.0
Content-Type: multipart/mixed; 
	boundary="----=_Part_2060_441593185.1670658756042"
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

------=_Part_2060_441593185.1670658756042
Content-Type: multipart/alternative; 
	boundary="----=_Part_2061_1956709310.1670658756042"

------=_Part_2061_1956709310.1670658756042
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi,
We did some performance measurements.
Added counters in 3 places (per Irq source)
1. entry to jailhouse ISR
2. dispatch of interrupt to particular vector to particular core
3. in RTOS isr.

*We see that all 3 counters have the same value*, but we measure time gaps=
=20
in RTOS in ISR invocation times, sometimes upto 60 uSec.

It means that either
a) interrupt request is lost. But, according to setup it is edge-triggered,=
=20
it cannot be lost, just delayed.
b) there is a delay of more than 60 usec in jailhouse ISR.

questions:
1. Is it possible that jailhouse interrupt dispatching routine enters some=
=20
loop that takes considerable amount of time?
2. What would be explanation of interrupt latency of 60 Secs? Even if we=20
take into account cache line refill we get much lower number, which do not=
=20
reach tens uSecs.=20

Best regards
Rasty



=20

On Tuesday, December 6, 2022 at 6:01:20 PM UTC+2 Ralf Ramsauer wrote:

> Hi,
>
> On 05/12/2022 17:30, Rasty Slutsker wrote:
> > Hi Ralf,
> > Thank you for the answer.
> > We have periodic interrupt each 30 u(!)Sec. Linux cannot deal with such=
=20
> > rate, so we need hypervisor/RTOS.
>
> I understand.
>
> > We managed to read a code of hypervisor. It appears that all interrupts=
=20
> > to all cores are intercepted by hypervisor and then forwarded to guests=
=20
> > (per core).
>
> Yes, exactly, that's the case if you don't have SDEI. If you have a=20
> platform that would come with SDEI, then you have of course less overhead=
.
>
> > If we reduce interrupt priority of mentioned interrupt (as you suggest)=
=20
> > we lose even more interrupts, even without stress.
> > Interrupt is defined as edge triggered, I assumed that it is memorized=
=20
> > by gic until serviced.
> > Is it possible that Hypervisor acknowledges pending interrupt while=20
> > servicing interrupt from another source ? Kind of race - 2 interrupts=
=20
> > for 2 cores arrive nearly simultaneously. One is lost.
>
> The EOIR and IAR registers of the GIC are core-local registers of the=20
> GIC CPU interface (GICC), so I wonder how this should cause a race,=20
> unless there isn't a hard logical mistake in the code, which I doubt.
>
>
> What you could try to do for debugging purposes:
>
> 1. Slow down from 30=C2=B5s to something sloooower, which you can handle
> even under load. Say 100=C2=B5s, 500=C2=B5s, something like that.
>
> 2. Measure the jitter x between arrival of the interrupt, and final
> acknowledgement in your RTOS. You can use performance monitoring
> registers, or watch CPU cycle counters, whatever. Repeat the
> measurement, w/ load and w/o load on Linux-side.
>
> 3. If max(x) >=3D 30=C2=B5s, then you know where your IRQs go in case of =
a
> periodic cycle of 30=C2=B5s.
>
>
> Reason: What I did some while ago, is measuring the Jitter of=20
> Linux+Jailhouse on ARM systems with cyclictest. On a Jetson TX1=20
> platform, for example, we saw Jitter up 50=C2=B5s. So there's IRQ=20
> reinjection, a full Linux stack and some userspace application involved,=
=20
> so three context switches and lots of code. You have probably two=20
> context switches and less code, as you use a RTOS, but I think there's a=
=20
> certain chance to exceed 30=C2=B5s.
>
> What my gut feeling tells me is that you manage to hold those 30=C2=B5s i=
f=20
> Linux is quiet. As soon as there's some stress on the system bus, and=20
> even on shared caches, you exceed you deadline.
>
> Thanks
> Ralf
>
> >=20
> > Best regards
> > Rasty
> >=20
> > On Monday, December 5, 2022 at 5:14:37 PM UTC+2 Ralf Ramsauer wrote:
> >=20
> > Hi Nir,
> >=20
> > On 29/11/2022 14:21, nirge...@gmail.com wrote:
> > > Hi there,
> > >
> > > Our target is Sitara AM5726 , CortexA15 dual core on which we are
> > > running Linux on A15 core0 and RTOS on core1.
> > >
> > > __
> > >
> > > RTOS gets periodic interrupt from external hardware via nirq1 pin
> > > (dedicated input into ARM gic).____
> > >
> > > Under heavy load in Linux (core 0!), RTOS, which runs on core1
> > misses
> > > interrupts.____
> >=20
> > Uhm. Can you reconstruct that issue w/o Jailhouse under Linux?
> >=20
> > I mean, can you set the SMP affinity of that IRQ to core 1 under Linux,
> > and then write some test application running on core 1 that just
> > receives the IRQ. If that issue happens under Linux as well, then you
> > know that the issue has probably nothing to do with Jailhouse.
> >=20
> >=20
> > What also might happen: If there's enough pressure on the shared system
> > bus when Linux is under load, then you simply loose those IRQs as the
> > RTOS doesn't have enough time to handle it. You can test this
> > hypothesis
> > if you lower the frequency of the the periodic interrupt. If you still
> > loose IRQs, then this should not be the case.
> >=20
> > >
> > > Questions____
> > >
> > > 1. Does linux/hypervisor participate in interrupt
> > scheduling/forwarding
> > > to cell on Core1____
> >=20
> > Linux: No, Linux does not participate in anything that is going on on
> > CPU 1. That's the idea behind Jailhouse.
> >=20
> > Jailhouse: Maybe. On ARM platforms, Jailhouse needs to reinject the
> > Interrupt from the hypervisor to the guest, if SDEI is not available.
> > Does the Sitara come with support for SDEI support?
> >=20
> > (You can btw monitor the exits of the hypervisor with 'jailhouse cell
> > stats')
> >=20
> > Ralf
> >=20
> > > 2. Is there a description of interrupt forwarding/virtualization
> > scheme
> > > to cores (if exists)? Any pointer to document/source code would be
> > > appreciated.
> > >
> > > Thanks a lot,
> > >
> > > Nir.
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
> https://groups.google.com/d/msgid/jailhouse-dev/fde55f66-2e83-4df2-8f5e-4=
4b0fb831acbn%40googlegroups.com=20
> <
> https://groups.google.com/d/msgid/jailhouse-dev/fde55f66-2e83-4df2-8f5e-4=
4b0fb831acbn%40googlegroups.com>=20
> <
> https://groups.google.com/d/msgid/jailhouse-dev/fde55f66-2e83-4df2-8f5e-4=
4b0fb831acbn%40googlegroups.com?utm_medium=3Demail&utm_source=3Dfooter=20
> <
> https://groups.google.com/d/msgid/jailhouse-dev/fde55f66-2e83-4df2-8f5e-4=
4b0fb831acbn%40googlegroups.com?utm_medium=3Demail&utm_source=3Dfooter
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
> https://groups.google.com/d/msgid/jailhouse-dev/9f1616c7-ac5f-49de-bc24-8=
bd8520f4c07n%40googlegroups.com=20
> <
> https://groups.google.com/d/msgid/jailhouse-dev/9f1616c7-ac5f-49de-bc24-8=
bd8520f4c07n%40googlegroups.com?utm_medium=3Demail&utm_source=3Dfooter
> >.
>

--=20
You received this message because you are subscribed to the Google Groups "=
Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/=
jailhouse-dev/01dfb141-0e4f-4adc-939f-c7a0c145c055n%40googlegroups.com.

------=_Part_2061_1956709310.1670658756042
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi,<div>We did some performance measurements.</div><div>Added counters in 3=
 places (per Irq source)</div><div>1. entry to jailhouse ISR</div><div>2. d=
ispatch of interrupt to particular vector to particular core</div><div>3. i=
n RTOS isr.</div><div><br></div><div><b>We see that all 3 counters have the=
 same value</b>, but we measure time gaps in RTOS in ISR invocation times, =
sometimes upto 60 uSec.</div><div><br></div><div>It means that either</div>=
<div>a) interrupt request is lost. But, according to setup it is edge-trigg=
ered, it cannot be lost, just delayed.</div><div>b) there is a delay of mor=
e than 60 usec in jailhouse ISR.</div><div><br></div><div>questions:</div><=
div>1. Is it possible that jailhouse interrupt dispatching routine enters s=
ome loop that takes considerable amount of time?</div><div>2. What would be=
 explanation of interrupt latency of 60 Secs? Even if we take into account =
cache line refill we get much lower number, which do not reach tens uSecs.&=
nbsp;</div><div><br></div><div>Best regards</div><div>Rasty</div><div><br><=
/div><div><br></div><div><br></div><div>&nbsp;<br><br></div><div class=3D"g=
mail_quote"><div dir=3D"auto" class=3D"gmail_attr">On Tuesday, December 6, =
2022 at 6:01:20 PM UTC+2 Ralf Ramsauer wrote:<br/></div><blockquote class=
=3D"gmail_quote" style=3D"margin: 0 0 0 0.8ex; border-left: 1px solid rgb(2=
04, 204, 204); padding-left: 1ex;">Hi,
<br>
<br>On 05/12/2022 17:30, Rasty Slutsker wrote:
<br>&gt; Hi Ralf,
<br>&gt; Thank you for the answer.
<br>&gt; We have periodic interrupt each 30 u(!)Sec. Linux cannot deal with=
 such=20
<br>&gt; rate, so we need hypervisor/RTOS.
<br>
<br>I understand.
<br>
<br>&gt; We managed to read a code of hypervisor. It appears that all inter=
rupts=20
<br>&gt; to all cores are intercepted by hypervisor and then forwarded to g=
uests=20
<br>&gt; (per core).
<br>
<br>Yes, exactly, that&#39;s the case if you don&#39;t have SDEI. If you ha=
ve a=20
<br>platform that would come with SDEI, then you have of course less overhe=
ad.
<br>
<br>&gt; If we reduce interrupt priority of mentioned interrupt (as you sug=
gest)=20
<br>&gt; we lose even more interrupts, even without stress.
<br>&gt; Interrupt is defined as edge triggered, I assumed that it is memor=
ized=20
<br>&gt; by gic until serviced.
<br>&gt; Is it possible that Hypervisor acknowledges pending interrupt whil=
e=20
<br>&gt; servicing interrupt from another source ? Kind of race - 2 interru=
pts=20
<br>&gt; for 2 cores arrive nearly simultaneously. One is lost.
<br>
<br>The EOIR and IAR registers of the GIC are core-local registers of the=
=20
<br>GIC CPU interface (GICC), so I wonder how this should cause a race,=20
<br>unless there isn&#39;t a hard logical mistake in the code, which I doub=
t.
<br>
<br>
<br>What you could try to do for debugging purposes:
<br>
<br>1. Slow down from 30=C2=B5s to something sloooower, which you can handl=
e
<br>    even under load. Say 100=C2=B5s, 500=C2=B5s, something like that.
<br>
<br>2. Measure the jitter x between arrival of the interrupt, and final
<br>    acknowledgement in your RTOS. You can use performance monitoring
<br>    registers, or watch CPU cycle counters, whatever. Repeat the
<br>    measurement, w/ load and w/o load on Linux-side.
<br>
<br>3. If max(x) &gt;=3D 30=C2=B5s, then you know where your IRQs go in cas=
e of a
<br>    periodic cycle of 30=C2=B5s.
<br>
<br>
<br>Reason: What I did some while ago, is measuring the Jitter of=20
<br>Linux+Jailhouse on ARM systems with cyclictest. On a Jetson TX1=20
<br>platform, for example, we saw Jitter up 50=C2=B5s. So there&#39;s IRQ=
=20
<br>reinjection, a full Linux stack and some userspace application involved=
,=20
<br>so three context switches and lots of code. You have probably two=20
<br>context switches and less code, as you use a RTOS, but I think there&#3=
9;s a=20
<br>certain chance to exceed 30=C2=B5s.
<br>
<br>What my gut feeling tells me is that you manage to hold those 30=C2=B5s=
 if=20
<br>Linux is quiet. As soon as there&#39;s some stress on the system bus, a=
nd=20
<br>even on shared caches, you exceed you deadline.
<br>
<br>Thanks
<br>   Ralf
<br>
<br>&gt;=20
<br>&gt; Best regards
<br>&gt; Rasty
<br>&gt;=20
<br>&gt; On Monday, December 5, 2022 at 5:14:37 PM UTC+2 Ralf Ramsauer wrot=
e:
<br>&gt;=20
<br>&gt;     Hi Nir,
<br>&gt;=20
<br>&gt;     On 29/11/2022 14:21, <a href data-email-masked rel=3D"nofollow=
">nirge...@gmail.com</a> wrote:
<br>&gt;      &gt; Hi there,
<br>&gt;      &gt;
<br>&gt;      &gt; Our target is Sitara AM5726 , CortexA15 dual core on whi=
ch we are
<br>&gt;      &gt; running Linux on A15 core0 and RTOS on core1.
<br>&gt;      &gt;
<br>&gt;      &gt; __
<br>&gt;      &gt;
<br>&gt;      &gt; RTOS gets periodic interrupt from external hardware via =
nirq1 pin
<br>&gt;      &gt; (dedicated input into ARM gic).____
<br>&gt;      &gt;
<br>&gt;      &gt; Under heavy load in Linux (core 0!), RTOS, which runs on=
 core1
<br>&gt;     misses
<br>&gt;      &gt; interrupts.____
<br>&gt;=20
<br>&gt;     Uhm. Can you reconstruct that issue w/o Jailhouse under Linux?
<br>&gt;=20
<br>&gt;     I mean, can you set the SMP affinity of that IRQ to core 1 und=
er Linux,
<br>&gt;     and then write some test application running on core 1 that ju=
st
<br>&gt;     receives the IRQ. If that issue happens under Linux as well, t=
hen you
<br>&gt;     know that the issue has probably nothing to do with Jailhouse.
<br>&gt;=20
<br>&gt;=20
<br>&gt;     What also might happen: If there&#39;s enough pressure on the =
shared system
<br>&gt;     bus when Linux is under load, then you simply loose those IRQs=
 as the
<br>&gt;     RTOS doesn&#39;t have enough time to handle it. You can test t=
his
<br>&gt;     hypothesis
<br>&gt;     if you lower the frequency of the the periodic interrupt. If y=
ou still
<br>&gt;     loose IRQs, then this should not be the case.
<br>&gt;=20
<br>&gt;      &gt;
<br>&gt;      &gt; Questions____
<br>&gt;      &gt;
<br>&gt;      &gt; 1. Does linux/hypervisor participate in interrupt
<br>&gt;     scheduling/forwarding
<br>&gt;      &gt; to cell on Core1____
<br>&gt;=20
<br>&gt;     Linux: No, Linux does not participate in anything that is goin=
g on on
<br>&gt;     CPU 1. That&#39;s the idea behind Jailhouse.
<br>&gt;=20
<br>&gt;     Jailhouse: Maybe. On ARM platforms, Jailhouse needs to reinjec=
t the
<br>&gt;     Interrupt from the hypervisor to the guest, if SDEI is not ava=
ilable.
<br>&gt;     Does the Sitara come with support for SDEI support?
<br>&gt;=20
<br>&gt;     (You can btw monitor the exits of the hypervisor with &#39;jai=
lhouse cell
<br>&gt;     stats&#39;)
<br>&gt;=20
<br>&gt;     Ralf
<br>&gt;=20
<br>&gt;      &gt; 2. Is there a description of interrupt forwarding/virtua=
lization
<br>&gt;     scheme
<br>&gt;      &gt; to cores (if exists)? Any pointer to document/source cod=
e would be
<br>&gt;      &gt; appreciated.
<br>&gt;      &gt;
<br>&gt;      &gt; Thanks a lot,
<br>&gt;      &gt;
<br>&gt;      &gt; Nir.
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
<br>&gt;     <a href=3D"https://groups.google.com/d/msgid/jailhouse-dev/fde=
55f66-2e83-4df2-8f5e-44b0fb831acbn%40googlegroups.com" target=3D"_blank" re=
l=3D"nofollow" data-saferedirecturl=3D"https://www.google.com/url?hl=3Den&a=
mp;q=3Dhttps://groups.google.com/d/msgid/jailhouse-dev/fde55f66-2e83-4df2-8=
f5e-44b0fb831acbn%2540googlegroups.com&amp;source=3Dgmail&amp;ust=3D1670744=
258691000&amp;usg=3DAOvVaw1ADSO-ipVHu577-c9ySvGm">https://groups.google.com=
/d/msgid/jailhouse-dev/fde55f66-2e83-4df2-8f5e-44b0fb831acbn%40googlegroups=
.com</a> &lt;<a href=3D"https://groups.google.com/d/msgid/jailhouse-dev/fde=
55f66-2e83-4df2-8f5e-44b0fb831acbn%40googlegroups.com" target=3D"_blank" re=
l=3D"nofollow" data-saferedirecturl=3D"https://www.google.com/url?hl=3Den&a=
mp;q=3Dhttps://groups.google.com/d/msgid/jailhouse-dev/fde55f66-2e83-4df2-8=
f5e-44b0fb831acbn%2540googlegroups.com&amp;source=3Dgmail&amp;ust=3D1670744=
258691000&amp;usg=3DAOvVaw1ADSO-ipVHu577-c9ySvGm">https://groups.google.com=
/d/msgid/jailhouse-dev/fde55f66-2e83-4df2-8f5e-44b0fb831acbn%40googlegroups=
.com</a>&gt; &lt;<a href=3D"https://groups.google.com/d/msgid/jailhouse-dev=
/fde55f66-2e83-4df2-8f5e-44b0fb831acbn%40googlegroups.com?utm_medium=3Demai=
l&amp;utm_source=3Dfooter" target=3D"_blank" rel=3D"nofollow" data-saferedi=
recturl=3D"https://www.google.com/url?hl=3Den&amp;q=3Dhttps://groups.google=
.com/d/msgid/jailhouse-dev/fde55f66-2e83-4df2-8f5e-44b0fb831acbn%2540google=
groups.com?utm_medium%3Demail%26utm_source%3Dfooter&amp;source=3Dgmail&amp;=
ust=3D1670744258691000&amp;usg=3DAOvVaw0Kgh87jrB19R3S8u0rPoWt">https://grou=
ps.google.com/d/msgid/jailhouse-dev/fde55f66-2e83-4df2-8f5e-44b0fb831acbn%4=
0googlegroups.com?utm_medium=3Demail&amp;utm_source=3Dfooter</a> &lt;<a hre=
f=3D"https://groups.google.com/d/msgid/jailhouse-dev/fde55f66-2e83-4df2-8f5=
e-44b0fb831acbn%40googlegroups.com?utm_medium=3Demail&amp;utm_source=3Dfoot=
er" target=3D"_blank" rel=3D"nofollow" data-saferedirecturl=3D"https://www.=
google.com/url?hl=3Den&amp;q=3Dhttps://groups.google.com/d/msgid/jailhouse-=
dev/fde55f66-2e83-4df2-8f5e-44b0fb831acbn%2540googlegroups.com?utm_medium%3=
Demail%26utm_source%3Dfooter&amp;source=3Dgmail&amp;ust=3D1670744258691000&=
amp;usg=3DAOvVaw0Kgh87jrB19R3S8u0rPoWt">https://groups.google.com/d/msgid/j=
ailhouse-dev/fde55f66-2e83-4df2-8f5e-44b0fb831acbn%40googlegroups.com?utm_m=
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
<br>&gt; <a href=3D"https://groups.google.com/d/msgid/jailhouse-dev/9f1616c=
7-ac5f-49de-bc24-8bd8520f4c07n%40googlegroups.com" target=3D"_blank" rel=3D=
"nofollow" data-saferedirecturl=3D"https://www.google.com/url?hl=3Den&amp;q=
=3Dhttps://groups.google.com/d/msgid/jailhouse-dev/9f1616c7-ac5f-49de-bc24-=
8bd8520f4c07n%2540googlegroups.com&amp;source=3Dgmail&amp;ust=3D16707442586=
91000&amp;usg=3DAOvVaw2aC_nVXCFEZw2Dv6kwCV7l">https://groups.google.com/d/m=
sgid/jailhouse-dev/9f1616c7-ac5f-49de-bc24-8bd8520f4c07n%40googlegroups.com=
</a> &lt;<a href=3D"https://groups.google.com/d/msgid/jailhouse-dev/9f1616c=
7-ac5f-49de-bc24-8bd8520f4c07n%40googlegroups.com?utm_medium=3Demail&amp;ut=
m_source=3Dfooter" target=3D"_blank" rel=3D"nofollow" data-saferedirecturl=
=3D"https://www.google.com/url?hl=3Den&amp;q=3Dhttps://groups.google.com/d/=
msgid/jailhouse-dev/9f1616c7-ac5f-49de-bc24-8bd8520f4c07n%2540googlegroups.=
com?utm_medium%3Demail%26utm_source%3Dfooter&amp;source=3Dgmail&amp;ust=3D1=
670744258691000&amp;usg=3DAOvVaw27AzgPAL5QAlvYuUuheVKR">https://groups.goog=
le.com/d/msgid/jailhouse-dev/9f1616c7-ac5f-49de-bc24-8bd8520f4c07n%40google=
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
om/d/msgid/jailhouse-dev/01dfb141-0e4f-4adc-939f-c7a0c145c055n%40googlegrou=
ps.com?utm_medium=3Demail&utm_source=3Dfooter">https://groups.google.com/d/=
msgid/jailhouse-dev/01dfb141-0e4f-4adc-939f-c7a0c145c055n%40googlegroups.co=
m</a>.<br />

------=_Part_2061_1956709310.1670658756042--

------=_Part_2060_441593185.1670658756042--
