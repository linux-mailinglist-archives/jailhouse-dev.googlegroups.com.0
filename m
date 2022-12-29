Return-Path: <jailhouse-dev+bncBC5J3D7HTQNBBHHBWWOQMGQEI4UT7HQ@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-yb1-xb3c.google.com (mail-yb1-xb3c.google.com [IPv6:2607:f8b0:4864:20::b3c])
	by mail.lfdr.de (Postfix) with ESMTPS id 00F25658BEE
	for <lists+jailhouse-dev@lfdr.de>; Thu, 29 Dec 2022 11:49:02 +0100 (CET)
Received: by mail-yb1-xb3c.google.com with SMTP id h67-20020a25d046000000b00729876d3b2bsf19518859ybg.17
        for <lists+jailhouse-dev@lfdr.de>; Thu, 29 Dec 2022 02:49:01 -0800 (PST)
ARC-Seal: i=2; a=rsa-sha256; t=1672310941; cv=pass;
        d=google.com; s=arc-20160816;
        b=eZLqOAQed6gxFFI39qfQf0tU+jqL2GG/Dr5HBXLvT4jFCJDtmIxoosLAl4zguMTupw
         6/CEG3kJGjGwJA/2JroyqLVKXIUc3Rn8PLTsqVzi8rM9/MutGIucbFs5DvV5bp1WUtBX
         mVEJ5v2OjA8X2Q0XICvY51ZmIGnygbpeon2G4mzDey/pYxw7VdI50qW4++s4ieHmefjo
         WIPhHX+wjRSgGrXebChAU0vT9C4HaQKRrYMYqTTG4u6b9mF+qA4mnn8hkv6bJhGtxMgQ
         QuHbmqjn1P7Ugz0VmVzT7fe1zpzKzxvfsjax/1nqcNUO+MABH9vpoPH0bJ1QqvBSVxV+
         UX+g==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:sender:dkim-signature
         :dkim-signature;
        bh=qyx9DPKkOoD1gg7saH23r13SpcWoHJz/eCRdzxf9BCE=;
        b=js50P3AHC1pl50JC7oNuhr+26fyRLv6eLrsLBaN2+mlBf5e/g+4PHHS6EgTHvdJhDT
         g8fKzqUw1o1XvYAaiHtIXYcqkqQgQBHqEJPHMFMPKQraC85VoSsvVsc0TlqM3mW7TKlH
         Vvc52PWLCi9d+7nGJ2pmJlyeoP2U1zPY/UzYGEtrDxOD/Mn0NIRYxLD+8imljhNvXicG
         ZX9U1ulDzq7uT6vKwL4bn3FvWzoV4VZNJG12ntObLraZQ4LhziX2OG+iWDQnFkET2lgc
         k954OYHw8y+MaHOeU3aFVojhazxGRyoRSpakdotxMElJLsDdzAHfKMyM7puklWeYT8Td
         08mg==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20210112 header.b=ccCYOeI1;
       spf=pass (google.com: domain of nirgeller18@gmail.com designates 2607:f8b0:4864:20::e2b as permitted sender) smtp.mailfrom=nirgeller18@gmail.com;
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20210112;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:x-original-authentication-results
         :x-original-sender:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:sender:from:to:cc:subject:date:message-id
         :reply-to;
        bh=qyx9DPKkOoD1gg7saH23r13SpcWoHJz/eCRdzxf9BCE=;
        b=YE+13RJxK8qhGbkWlHsZ7gIA8a96+bp6W95Sx9UZq+Fg7DOeV8rWBPM7ileSYZvVJa
         AvzTuMs7jlN2+zJUBVi8/q9tDUpiHuQhH1JjK40yVuxwdi89TnTtmBgDPYiZPRzh07QL
         sUr10AOkcMmJx64H3vdwecbb9R3F5CJoJrcNmYNVMNd1p2wUScK3DhNXG+41dURmOLPk
         MZRwBtrOkt24czjtd4vmzWupNUpIEppvpsnH7LwWODlqNSV50c2n4Y9VIRFA9PXseYv4
         kjcNjc1b4A5vbfuHE1D8bjFLT382RWgD2Xo2BwcdKpd+BSXymcKEjpVpsurXt6ydklb8
         1Y5Q==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:x-original-authentication-results
         :x-original-sender:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=qyx9DPKkOoD1gg7saH23r13SpcWoHJz/eCRdzxf9BCE=;
        b=ptMwmqCLPIy1qKay11M3qOE/ST8hLc5o626bPaa9QmXKk8cdxrl+Bt4/VRWw/10b2A
         tUiaxT3n0DwIAlX2QbnB/aWMF12u3Uv8SEurP2ACfGvVesLe93tWI54hnWboo1XqHBKe
         CySye3GdxYB5KK7ydxU+/kdgy4EHsjURFNn7X/GxCJGFb7kbvy0yJ7p9ChpuLT0ZdjmL
         USHGQ5hNDvd/DhCC7SP75RLhCAeZGx3GQI4kYygOZbUQSY9jPQHDsfivDm4rH0ws3nad
         cxPl82wiqyujoM22Bt+s9gHWbHH4sUsH/gc4ruQgmDtIsWbDbi/CTMg7SMw891REg24K
         V23w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :x-spam-checked-in-group:list-id:mailing-list:precedence
         :x-original-authentication-results:x-original-sender:cc:to:subject
         :message-id:date:from:in-reply-to:references:mime-version
         :x-gm-message-state:sender:from:to:cc:subject:date:message-id
         :reply-to;
        bh=qyx9DPKkOoD1gg7saH23r13SpcWoHJz/eCRdzxf9BCE=;
        b=2WSG6+bc07qtjlrncRiMMp/3icHXB73Qp6sIMaTGfrGfHYorvWQB/Dyr+4qlEK0Ptm
         MtzMCBOCRbvceyxoH0skAkX6lt8giSuHcpNar32Zgn3zwxrTt1Wg8O9MMiGEl+qyMIFZ
         dgEg3XwYAAIWZXyhCTobnPHQN65gKJyU9KDmuOiSAxyQ1u67m+eztX3GjXB/bhfw70NF
         u9XpHV41/+Q5TSb+Cn5VY3JlHwX6/Ryu/FvY/HzyKgVglO/gjWewU/gwqk/7RuVmiWc6
         MJJCiwhR5VnSxIbzBRy0qwyeHTe3IBxsWel1fr3bNwlq2n1eIovHY/tiJw3Rc7O9nnoD
         GQXg==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AFqh2kq9hKtRL1rMw7ctmzXzGkBwb0uXz9vCJSfmXu57vqUIODn/C3d6
	noNaQfR2eZJTT0k1ukgY0tk=
X-Google-Smtp-Source: AMrXdXtKmtCsTRXOONKMDQyrkjCKj8hm4k0g1J6FMq2rv6xUqlDZB01VDgBkCXyZ2wgPM/Kw/GFvsQ==
X-Received: by 2002:a25:c1c5:0:b0:78f:96c8:ebe0 with SMTP id r188-20020a25c1c5000000b0078f96c8ebe0mr283872ybf.437.1672310940747;
        Thu, 29 Dec 2022 02:49:00 -0800 (PST)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a25:690a:0:b0:6ca:10dd:4459 with SMTP id e10-20020a25690a000000b006ca10dd4459ls9856263ybc.2.-pod-prod-gmail;
 Thu, 29 Dec 2022 02:48:59 -0800 (PST)
X-Received: by 2002:a25:ba05:0:b0:6fe:77a1:46cf with SMTP id t5-20020a25ba05000000b006fe77a146cfmr30227962ybg.32.1672310939669;
        Thu, 29 Dec 2022 02:48:59 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1672310939; cv=none;
        d=google.com; s=arc-20160816;
        b=yJi3Oaj9xFL+0tu96FC64z0TSiqnOCJLM9gpCq5ivhFCq+ptTbXZbOrv91aIwJlyV7
         O6bFjtLraTg81cyOb2HTo8OIMBpe0ve5AqDT2A0WTGiFFvfOu6S5rHasN3naKt5O64aa
         8dLG/5jFATuJNfnQbQAiuqgih7g44bVIAEIx1wnuBsd7WPIDXuDGr/EKui5iNFFeS+pX
         faR5DJ0CKOaAZ05Fmn0BhxVa0WP5IiQ3DszxsBnMCdHk/KJpP4LULvXQujloPV3LHu0T
         e98R5AeVcJcD2rB2hJVYfKa+Pf1UwWPB6DsT9F/lZorm4JzaumWsS2d6KXlBLxqdtQyD
         jK7Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=LMmQTDfYgtQPLaLoYsDv4XmtwT8a1wZIbZHsYQ0I/kk=;
        b=uVcNvYydUdY6OQo5R7q0QuTFFU5hOky56dRgHjWkg/f5/Kf9k0YACIMGIg73Ga8ROv
         YDsEWI1S/OfsqvVjYxq73jIEFO0BFpS3YbRw/uW4zqwtRAzhcCHYHTBaP405jrTX9sPd
         tMplsrNcZhZeiEq1cQEg7y4tGXrb8QBVdK93gcPHk94dKXoARW61751jca0dKTi2z2qz
         FVAMHiBrQYJPYmJ62uxb+9s7DAJO4MAXsHN57wq0Abc/QOS8oIJ2GeEcueAmSSHTTixi
         xWKPsdGbgdnqNK9XEEGur7jUDxChZPz8aFKoz3UtSu2kYyVh0UEmcMBA/gBU4iwETs2i
         hdAw==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20210112 header.b=ccCYOeI1;
       spf=pass (google.com: domain of nirgeller18@gmail.com designates 2607:f8b0:4864:20::e2b as permitted sender) smtp.mailfrom=nirgeller18@gmail.com;
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Received: from mail-vs1-xe2b.google.com (mail-vs1-xe2b.google.com. [2607:f8b0:4864:20::e2b])
        by gmr-mx.google.com with ESMTPS id r15-20020a25760f000000b0075bc695d66bsi1622109ybc.3.2022.12.29.02.48.59
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 29 Dec 2022 02:48:59 -0800 (PST)
Received-SPF: pass (google.com: domain of nirgeller18@gmail.com designates 2607:f8b0:4864:20::e2b as permitted sender) client-ip=2607:f8b0:4864:20::e2b;
Received: by mail-vs1-xe2b.google.com with SMTP id h27so4353385vsq.3
        for <jailhouse-dev@googlegroups.com>; Thu, 29 Dec 2022 02:48:59 -0800 (PST)
X-Received: by 2002:a67:bb19:0:b0:3c6:3c75:54b1 with SMTP id
 m25-20020a67bb19000000b003c63c7554b1mr2333725vsn.13.1672310939239; Thu, 29
 Dec 2022 02:48:59 -0800 (PST)
MIME-Version: 1.0
References: <fde55f66-2e83-4df2-8f5e-44b0fb831acbn@googlegroups.com>
 <34d2d078-1282-c240-9a65-301469b0bbe2@oth-regensburg.de> <9f1616c7-ac5f-49de-bc24-8bd8520f4c07n@googlegroups.com>
 <b538dfcd-0431-58d7-dd05-60205acc2c06@oth-regensburg.de> <01dfb141-0e4f-4adc-939f-c7a0c145c055n@googlegroups.com>
 <8bf22a0b-ec26-5974-e942-c5a0ebc9a028@oth-regensburg.de> <ed14da45-f14b-48d3-a38d-071c55354ef0n@googlegroups.com>
 <918e2011-a51d-d1d6-9028-13e64bd7466c@oth-regensburg.de> <7da1588b-2a97-4b23-924b-6d1ebb75e42cn@googlegroups.com>
In-Reply-To: <7da1588b-2a97-4b23-924b-6d1ebb75e42cn@googlegroups.com>
From: Nir Geller <nirgeller18@gmail.com>
Date: Thu, 29 Dec 2022 12:48:48 +0200
Message-ID: <CAKBX2QLbjz0kYBZbfQhE6yH8BhEgL9C8K79=T51GQVRW2-2YRw@mail.gmail.com>
Subject: Re: RTOS inmate misses interrupts
To: Rasty Slutsker <rslutsker@gmail.com>
Cc: Jailhouse <jailhouse-dev@googlegroups.com>
Content-Type: multipart/alternative; boundary="0000000000007cc8d405f0f53b26"
X-Original-Sender: nirgeller18@gmail.com
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass
 header.i=@gmail.com header.s=20210112 header.b=ccCYOeI1;       spf=pass
 (google.com: domain of nirgeller18@gmail.com designates 2607:f8b0:4864:20::e2b
 as permitted sender) smtp.mailfrom=nirgeller18@gmail.com;       dmarc=pass
 (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
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

--0000000000007cc8d405f0f53b26
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Ralf,

Do you know of a difference in the way SPI and PPI are treated by the
hypervisor?
A timer that is specific for a certain core is wired to GIC by PPI. Would
its processing be influenced by heavy load running on another core?

The GIC is facing the same load, but handles PPI instead of SPI. What would
be the implications on performance?

Thanks a lot,

Nir.

On Wed, Dec 14, 2022 at 11:09 AM Rasty Slutsker <rslutsker@gmail.com> wrote=
:

> Hi,
> Exactly I reference to  'jailhouse cell stats'
> We enabled TSC in Hypervisor init, and printed value to dmsg.
> But *after* start of Linux it gets disabled again.
> *** Is there a place in hypervisor that runs at kernel space after start
> of linux where we can put re-enabling of TSC?
>
> We would like to measure duration of Hypervisor ISR  with TSC and look fo=
r
> anomalies.
> Anomalies like unusual duration of ISR processing and Irregularities in
> ISR entry for particular request number.
>
> Other suggestions would be highly appreciated.
>
> Thanks
> Rasty
>
> On Tuesday, December 13, 2022 at 11:27:50 PM UTC+2 Ralf Ramsauer wrote:
>
>> Hi Rasty,
>>
>> (reply-to-all :) )
>>
>> On 13/12/2022 19:31, Rasty Slutsker wrote:
>> > We learned how you export some statistics from Jailhouse as you guys d=
o
>> > and added 3 variables
>>
>> You reference to 'jailhouse cell stats'?
>>
>> > 1. At the entry  Jailhouse IRQ (if irq=3D=3Dxxx counter ++)
>> > 2. At injection point of the same IRQ to inmate, still in Jailhouse
>> > 3. At the beginning of ISR in inmate (RTOS).
>>
>> Ok, but that just counts the interrupts, and not the occuring delays,
>> right?
>>
>> >
>> > We let system run, introduce some load to linux. We see physical
>> effects
>> > that suggest that we lose interrupts.
>> > We confirm it with difference in performance counters (gaps in quanta
>> of
>> > 30 uSecs) that we sample in inmate ISR.
>> > Than we kill interrupt.
>> > All 3 counters are the same. Amount matches interrupt rate.
>> > My conclusion that Interrupt request is lost.
>>
>> Could be the case. I don't know what happens if the jitter gets too long
>> between interrupts.
>>
>> >
>> > Another question.
>> > We try to read CPU time stamp counter from Jailhouse ISR . We get 0.
>> > mrc     p15, #0, r0, c9, c13, #0
>>
>> That's the PMCNTR, right?
>>
>> >
>> > Any idea why? Do you have some code for that?
>>
>> Uhm, I would have to read the reference manual as well. Does reading the
>> TSC work in Linux? Maybe it has to be activated or enabled for the
>> hypervisor?
>>
>>
>> https://developer.arm.com/documentation/ddi0406/b/Debug-Architecture/Deb=
ug-Registers-Reference/Performance-monitor-registers/c9--Count-Enable-Set-R=
egister--PMCNTENSET-?lang=3Den
>>
>> Thanks,
>> Ralf
>>
>> >
>> > Best regards
>> > Rasty
>> >
>> >
>> >
>> > On Tuesday, December 13, 2022 at 3:47:25 PM UTC+2 Ralf Ramsauer wrote:
>> >
>> > Hi Rasty,
>> >
>> > Please reply-to-all, then your reply will also pop up in my Inbox.
>> >
>> > On 10/12/2022 08:52, Rasty Slutsker wrote:
>> > > Hi,
>> > > We did some performance measurements.
>> > > Added counters in 3 places (per Irq source)
>> > > 1. entry to jailhouse ISR
>> > > 2. dispatch of interrupt to particular vector to particular core
>> > > 3. in RTOS isr.
>> >
>> > Okay. How do you read and dump them? I hope after everything is done.
>> >
>> > Take care that if you dump them immediately to the uart, this will
>> > consume a lot of time and cause significant delay. ('heavy' printk
>> > logic
>> > + busy waiting for the uart)
>> >
>> > >
>> > > *We see that all 3 counters have the same value*, but we measure
>> > time
>> >
>> > huh? What counters do you access? There's something odd if they hold
>> > the
>> > same value at different places.
>> >
>> > > gaps in RTOS in ISR invocation times, sometimes upto 60 uSec.
>> > >
>> > > It means that either
>> > > a) interrupt request is lost. But, according to setup it is
>> > > edge-triggered, it cannot be lost, just delayed.
>> > > b) there is a delay of more than 60 usec in jailhouse ISR.
>> > >
>> > > questions:
>> > > 1. Is it possible that jailhouse interrupt dispatching routine
>> > enters
>> > > some loop that takes considerable amount of time?
>> >
>> > If you use printk during dispatching for debugging - yes. Otherwise, I
>> > guess no. Not 60=C2=B5s.
>> >
>> > > 2. What would be explanation of interrupt latency of 60 Secs?
>> > Even if we
>> > > take into account cache line refill we get much lower number,
>> > which do
>> > > not reach tens uSecs.
>> >
>> > Ack, I would definitely not expect 60=C2=B5s delay for IRQ reinjection=
.
>> >
>> > Thanks
>> > Ralf
>> >
>> > >
>> > > Best regards
>> > > Rasty
>> > >
>> > >
>> > >
>> > >
>> > >
>> > > On Tuesday, December 6, 2022 at 6:01:20 PM UTC+2 Ralf Ramsauer
>> > wrote:
>> > >
>> > > Hi,
>> > >
>> > > On 05/12/2022 17:30, Rasty Slutsker wrote:
>> > > > Hi Ralf,
>> > > > Thank you for the answer.
>> > > > We have periodic interrupt each 30 u(!)Sec. Linux cannot deal
>> > > with such
>> > > > rate, so we need hypervisor/RTOS.
>> > >
>> > > I understand.
>> > >
>> > > > We managed to read a code of hypervisor. It appears that all
>> > > interrupts
>> > > > to all cores are intercepted by hypervisor and then forwarded to
>> > > guests
>> > > > (per core).
>> > >
>> > > Yes, exactly, that's the case if you don't have SDEI. If you have a
>> > > platform that would come with SDEI, then you have of course less
>> > > overhead.
>> > >
>> > > > If we reduce interrupt priority of mentioned interrupt (as you
>> > > suggest)
>> > > > we lose even more interrupts, even without stress.
>> > > > Interrupt is defined as edge triggered, I assumed that it is
>> > > memorized
>> > > > by gic until serviced.
>> > > > Is it possible that Hypervisor acknowledges pending interrupt
>> > while
>> > > > servicing interrupt from another source ? Kind of race - 2
>> > > interrupts
>> > > > for 2 cores arrive nearly simultaneously. One is lost.
>> > >
>> > > The EOIR and IAR registers of the GIC are core-local registers of
>> > the
>> > > GIC CPU interface (GICC), so I wonder how this should cause a race,
>> > > unless there isn't a hard logical mistake in the code, which I
>> > doubt.
>> > >
>> > >
>> > > What you could try to do for debugging purposes:
>> > >
>> > > 1. Slow down from 30=C2=B5s to something sloooower, which you can ha=
ndle
>> > > even under load. Say 100=C2=B5s, 500=C2=B5s, something like that.
>> > >
>> > > 2. Measure the jitter x between arrival of the interrupt, and final
>> > > acknowledgement in your RTOS. You can use performance monitoring
>> > > registers, or watch CPU cycle counters, whatever. Repeat the
>> > > measurement, w/ load and w/o load on Linux-side.
>> > >
>> > > 3. If max(x) >=3D 30=C2=B5s, then you know where your IRQs go in cas=
e of a
>> > > periodic cycle of 30=C2=B5s.
>> > >
>> > >
>> > > Reason: What I did some while ago, is measuring the Jitter of
>> > > Linux+Jailhouse on ARM systems with cyclictest. On a Jetson TX1
>> > > platform, for example, we saw Jitter up 50=C2=B5s. So there's IRQ
>> > > reinjection, a full Linux stack and some userspace application
>> > > involved,
>> > > so three context switches and lots of code. You have probably two
>> > > context switches and less code, as you use a RTOS, but I think
>> > > there's a
>> > > certain chance to exceed 30=C2=B5s.
>> > >
>> > > What my gut feeling tells me is that you manage to hold those
>> > 30=C2=B5s if
>> > > Linux is quiet. As soon as there's some stress on the system bus,
>> > and
>> > > even on shared caches, you exceed you deadline.
>> > >
>> > > Thanks
>> > > Ralf
>> > >
>> > > >
>> > > > Best regards
>> > > > Rasty
>> > > >
>> > > > On Monday, December 5, 2022 at 5:14:37 PM UTC+2 Ralf Ramsauer
>> > wrote:
>> > > >
>> > > > Hi Nir,
>> > > >
>> > > > On 29/11/2022 14:21, nirge...@gmail.com wrote:
>> > > > > Hi there,
>> > > > >
>> > > > > Our target is Sitara AM5726 , CortexA15 dual core on which we
>> > are
>> > > > > running Linux on A15 core0 and RTOS on core1.
>> > > > >
>> > > > > __
>> > > > >
>> > > > > RTOS gets periodic interrupt from external hardware via nirq1
>> > pin
>> > > > > (dedicated input into ARM gic).____
>> > > > >
>> > > > > Under heavy load in Linux (core 0!), RTOS, which runs on core1
>> > > > misses
>> > > > > interrupts.____
>> > > >
>> > > > Uhm. Can you reconstruct that issue w/o Jailhouse under Linux?
>> > > >
>> > > > I mean, can you set the SMP affinity of that IRQ to core 1 under
>> > > Linux,
>> > > > and then write some test application running on core 1 that just
>> > > > receives the IRQ. If that issue happens under Linux as well, then
>> > > you
>> > > > know that the issue has probably nothing to do with Jailhouse.
>> > > >
>> > > >
>> > > > What also might happen: If there's enough pressure on the shared
>> > > system
>> > > > bus when Linux is under load, then you simply loose those IRQs as
>> > > the
>> > > > RTOS doesn't have enough time to handle it. You can test this
>> > > > hypothesis
>> > > > if you lower the frequency of the the periodic interrupt. If you
>> > > still
>> > > > loose IRQs, then this should not be the case.
>> > > >
>> > > > >
>> > > > > Questions____
>> > > > >
>> > > > > 1. Does linux/hypervisor participate in interrupt
>> > > > scheduling/forwarding
>> > > > > to cell on Core1____
>> > > >
>> > > > Linux: No, Linux does not participate in anything that is going
>> > > on on
>> > > > CPU 1. That's the idea behind Jailhouse.
>> > > >
>> > > > Jailhouse: Maybe. On ARM platforms, Jailhouse needs to reinject
>> > the
>> > > > Interrupt from the hypervisor to the guest, if SDEI is not
>> > > available.
>> > > > Does the Sitara come with support for SDEI support?
>> > > >
>> > > > (You can btw monitor the exits of the hypervisor with 'jailhouse
>> > > cell
>> > > > stats')
>> > > >
>> > > > Ralf
>> > > >
>> > > > > 2. Is there a description of interrupt forwarding/virtualization
>> > > > scheme
>> > > > > to cores (if exists)? Any pointer to document/source code
>> > would be
>> > > > > appreciated.
>> > > > >
>> > > > > Thanks a lot,
>> > > > >
>> > > > > Nir.
>> > > > >
>> > > > > --
>> > > > > You received this message because you are subscribed to the
>> > Google
>> > > > > Groups "Jailhouse" group.
>> > > > > To unsubscribe from this group and stop receiving emails from
>> > it,
>> > > > send
>> > > > > an email to jailhouse-de...@googlegroups.com
>> > > > > <mailto:jailhouse-de...@googlegroups.com>.
>> > > > > To view this discussion on the web visit
>> > > > >
>> > > >
>> > >
>> >
>> https://groups.google.com/d/msgid/jailhouse-dev/fde55f66-2e83-4df2-8f5e-=
44b0fb831acbn%40googlegroups.com
>> <
>> https://groups.google.com/d/msgid/jailhouse-dev/fde55f66-2e83-4df2-8f5e-=
44b0fb831acbn%40googlegroups.com>
>> <
>> https://groups.google.com/d/msgid/jailhouse-dev/fde55f66-2e83-4df2-8f5e-=
44b0fb831acbn%40googlegroups.com
>> <
>> https://groups.google.com/d/msgid/jailhouse-dev/fde55f66-2e83-4df2-8f5e-=
44b0fb831acbn%40googlegroups.com>>
>> <
>> https://groups.google.com/d/msgid/jailhouse-dev/fde55f66-2e83-4df2-8f5e-=
44b0fb831acbn%40googlegroups.com
>> <
>> https://groups.google.com/d/msgid/jailhouse-dev/fde55f66-2e83-4df2-8f5e-=
44b0fb831acbn%40googlegroups.com>
>> <
>> https://groups.google.com/d/msgid/jailhouse-dev/fde55f66-2e83-4df2-8f5e-=
44b0fb831acbn%40googlegroups.com
>> <
>> https://groups.google.com/d/msgid/jailhouse-dev/fde55f66-2e83-4df2-8f5e-=
44b0fb831acbn%40googlegroups.com>>>
>> <
>> https://groups.google.com/d/msgid/jailhouse-dev/fde55f66-2e83-4df2-8f5e-=
44b0fb831acbn%40googlegroups.com?utm_medium=3Demail&utm_source=3Dfooter
>> <
>> https://groups.google.com/d/msgid/jailhouse-dev/fde55f66-2e83-4df2-8f5e-=
44b0fb831acbn%40googlegroups.com?utm_medium=3Demail&utm_source=3Dfooter>
>> <
>> https://groups.google.com/d/msgid/jailhouse-dev/fde55f66-2e83-4df2-8f5e-=
44b0fb831acbn%40googlegroups.com?utm_medium=3Demail&utm_source=3Dfooter
>> <
>> https://groups.google.com/d/msgid/jailhouse-dev/fde55f66-2e83-4df2-8f5e-=
44b0fb831acbn%40googlegroups.com?utm_medium=3Demail&utm_source=3Dfooter>>
>> <
>> https://groups.google.com/d/msgid/jailhouse-dev/fde55f66-2e83-4df2-8f5e-=
44b0fb831acbn%40googlegroups.com?utm_medium=3Demail&utm_source=3Dfooter
>> <
>> https://groups.google.com/d/msgid/jailhouse-dev/fde55f66-2e83-4df2-8f5e-=
44b0fb831acbn%40googlegroups.com?utm_medium=3Demail&utm_source=3Dfooter>
>> <
>> https://groups.google.com/d/msgid/jailhouse-dev/fde55f66-2e83-4df2-8f5e-=
44b0fb831acbn%40googlegroups.com?utm_medium=3Demail&utm_source=3Dfooter
>> <
>> https://groups.google.com/d/msgid/jailhouse-dev/fde55f66-2e83-4df2-8f5e-=
44b0fb831acbn%40googlegroups.com?utm_medium=3Demail&utm_source=3Dfooter>>>>=
.
>>
>> > > >
>> > > > --
>> > > > You received this message because you are subscribed to the Google
>> > > > Groups "Jailhouse" group.
>> > > > To unsubscribe from this group and stop receiving emails from it,
>> > > send
>> > > > an email to jailhouse-de...@googlegroups.com
>> > > > <mailto:jailhouse-de...@googlegroups.com>.
>> > > > To view this discussion on the web visit
>> > > >
>> > >
>> >
>> https://groups.google.com/d/msgid/jailhouse-dev/9f1616c7-ac5f-49de-bc24-=
8bd8520f4c07n%40googlegroups.com
>> <
>> https://groups.google.com/d/msgid/jailhouse-dev/9f1616c7-ac5f-49de-bc24-=
8bd8520f4c07n%40googlegroups.com>
>> <
>> https://groups.google.com/d/msgid/jailhouse-dev/9f1616c7-ac5f-49de-bc24-=
8bd8520f4c07n%40googlegroups.com
>> <
>> https://groups.google.com/d/msgid/jailhouse-dev/9f1616c7-ac5f-49de-bc24-=
8bd8520f4c07n%40googlegroups.com>>
>> <
>> https://groups.google.com/d/msgid/jailhouse-dev/9f1616c7-ac5f-49de-bc24-=
8bd8520f4c07n%40googlegroups.com?utm_medium=3Demail&utm_source=3Dfooter
>> <
>> https://groups.google.com/d/msgid/jailhouse-dev/9f1616c7-ac5f-49de-bc24-=
8bd8520f4c07n%40googlegroups.com?utm_medium=3Demail&utm_source=3Dfooter>
>> <
>> https://groups.google.com/d/msgid/jailhouse-dev/9f1616c7-ac5f-49de-bc24-=
8bd8520f4c07n%40googlegroups.com?utm_medium=3Demail&utm_source=3Dfooter
>> <
>> https://groups.google.com/d/msgid/jailhouse-dev/9f1616c7-ac5f-49de-bc24-=
8bd8520f4c07n%40googlegroups.com?utm_medium=3Demail&utm_source=3Dfooter>>>.
>>
>> > >
>> > > --
>> > > You received this message because you are subscribed to the Google
>> > > Groups "Jailhouse" group.
>> > > To unsubscribe from this group and stop receiving emails from it,
>> > send
>> > > an email to jailhouse-de...@googlegroups.com
>> > > <mailto:jailhouse-de...@googlegroups.com>.
>> > > To view this discussion on the web visit
>> > >
>> >
>> https://groups.google.com/d/msgid/jailhouse-dev/01dfb141-0e4f-4adc-939f-=
c7a0c145c055n%40googlegroups.com
>> <
>> https://groups.google.com/d/msgid/jailhouse-dev/01dfb141-0e4f-4adc-939f-=
c7a0c145c055n%40googlegroups.com>
>> <
>> https://groups.google.com/d/msgid/jailhouse-dev/01dfb141-0e4f-4adc-939f-=
c7a0c145c055n%40googlegroups.com?utm_medium=3Demail&utm_source=3Dfooter
>> <
>> https://groups.google.com/d/msgid/jailhouse-dev/01dfb141-0e4f-4adc-939f-=
c7a0c145c055n%40googlegroups.com?utm_medium=3Demail&utm_source=3Dfooter>>.
>>
>> >
>> > --
>> > You received this message because you are subscribed to the Google
>> > Groups "Jailhouse" group.
>> > To unsubscribe from this group and stop receiving emails from it, send
>> > an email to jailhouse-de...@googlegroups.com
>> > <mailto:jailhouse-de...@googlegroups.com>.
>> > To view this discussion on the web visit
>> >
>> https://groups.google.com/d/msgid/jailhouse-dev/ed14da45-f14b-48d3-a38d-=
071c55354ef0n%40googlegroups.com
>> <
>> https://groups.google.com/d/msgid/jailhouse-dev/ed14da45-f14b-48d3-a38d-=
071c55354ef0n%40googlegroups.com?utm_medium=3Demail&utm_source=3Dfooter>.
>>
>>
> --
> You received this message because you are subscribed to a topic in the
> Google Groups "Jailhouse" group.
> To unsubscribe from this topic, visit
> https://groups.google.com/d/topic/jailhouse-dev/xrHHVosH75k/unsubscribe.
> To unsubscribe from this group and all its topics, send an email to
> jailhouse-dev+unsubscribe@googlegroups.com.
> To view this discussion on the web visit
> https://groups.google.com/d/msgid/jailhouse-dev/7da1588b-2a97-4b23-924b-6=
d1ebb75e42cn%40googlegroups.com
> <https://groups.google.com/d/msgid/jailhouse-dev/7da1588b-2a97-4b23-924b-=
6d1ebb75e42cn%40googlegroups.com?utm_medium=3Demail&utm_source=3Dfooter>
> .
>

--=20
You received this message because you are subscribed to the Google Groups "=
Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/=
jailhouse-dev/CAKBX2QLbjz0kYBZbfQhE6yH8BhEgL9C8K79%3DT51GQVRW2-2YRw%40mail.=
gmail.com.

--0000000000007cc8d405f0f53b26
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Hi Ralf,<div><br></div><div>Do you=C2=A0know of a differen=
ce in the way SPI and PPI are treated by the hypervisor?</div><div>A timer =
that is specific for a certain core is wired to GIC by PPI. Would its proce=
ssing be influenced by heavy load running on another core?</div><div><br></=
div><div>The GIC is facing the same load, but handles PPI instead of SPI. W=
hat would be the implications on performance?</div><div><br></div><div>Than=
ks a lot,</div><div><br></div><div>Nir.</div></div><br><div class=3D"gmail_=
quote"><div dir=3D"ltr" class=3D"gmail_attr">On Wed, Dec 14, 2022 at 11:09 =
AM Rasty Slutsker &lt;<a href=3D"mailto:rslutsker@gmail.com">rslutsker@gmai=
l.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"ma=
rgin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:=
1ex">Hi,<div>Exactly I reference to=C2=A0
&#39;jailhouse cell stats&#39;<br><div>We enabled TSC in Hypervisor init, a=
nd printed value to dmsg.</div><div>But *after* start of Linux it gets disa=
bled again.</div><div>*** Is there a place in hypervisor that runs at kerne=
l space after start of linux where we can put re-enabling of TSC?</div><div=
><br></div><div>We would like to measure duration of Hypervisor ISR=C2=A0 w=
ith TSC and look for anomalies.</div><div>Anomalies like unusual duration o=
f ISR processing and Irregularities in ISR entry for particular request num=
ber.</div><div><br></div><div>Other suggestions would be highly appreciated=
.</div><div><br></div><div>Thanks</div><div>Rasty<br><br></div></div><div c=
lass=3D"gmail_quote"><div dir=3D"auto" class=3D"gmail_attr">On Tuesday, Dec=
ember 13, 2022 at 11:27:50 PM UTC+2 Ralf Ramsauer wrote:<br></div><blockquo=
te class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px =
solid rgb(204,204,204);padding-left:1ex">Hi Rasty,
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
Enable-Set-Register--PMCNTENSET-?lang=3Den" rel=3D"nofollow" target=3D"_bla=
nk">https://developer.arm.com/documentation/ddi0406/b/Debug-Architecture/De=
bug-Registers-Reference/Performance-monitor-registers/c9--Count-Enable-Set-=
Register--PMCNTENSET-?lang=3Den</a>
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
<br>&gt;      &gt; &gt; On 29/11/2022 14:21, <a rel=3D"nofollow">nirge...@g=
mail.com</a> wrote:
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
<br>&gt;      &gt; &gt; &gt; an email to <a rel=3D"nofollow">jailhouse-de..=
.@googlegroups.com</a>
<br>&gt;      &gt; &gt; &gt; &lt;mailto:<a rel=3D"nofollow">jailhouse-de...=
@googlegroups.com</a>&gt;.
<br>&gt;      &gt; &gt; &gt; To view this discussion on the web visit
<br>&gt;      &gt; &gt; &gt;
<br>&gt;      &gt; &gt;
<br>&gt;      &gt;
<br>&gt;     <a href=3D"https://groups.google.com/d/msgid/jailhouse-dev/fde=
55f66-2e83-4df2-8f5e-44b0fb831acbn%40googlegroups.com" rel=3D"nofollow" tar=
get=3D"_blank">https://groups.google.com/d/msgid/jailhouse-dev/fde55f66-2e8=
3-4df2-8f5e-44b0fb831acbn%40googlegroups.com</a> &lt;<a href=3D"https://gro=
ups.google.com/d/msgid/jailhouse-dev/fde55f66-2e83-4df2-8f5e-44b0fb831acbn%=
40googlegroups.com" rel=3D"nofollow" target=3D"_blank">https://groups.googl=
e.com/d/msgid/jailhouse-dev/fde55f66-2e83-4df2-8f5e-44b0fb831acbn%40googleg=
roups.com</a>&gt; &lt;<a href=3D"https://groups.google.com/d/msgid/jailhous=
e-dev/fde55f66-2e83-4df2-8f5e-44b0fb831acbn%40googlegroups.com" rel=3D"nofo=
llow" target=3D"_blank">https://groups.google.com/d/msgid/jailhouse-dev/fde=
55f66-2e83-4df2-8f5e-44b0fb831acbn%40googlegroups.com</a> &lt;<a href=3D"ht=
tps://groups.google.com/d/msgid/jailhouse-dev/fde55f66-2e83-4df2-8f5e-44b0f=
b831acbn%40googlegroups.com" rel=3D"nofollow" target=3D"_blank">https://gro=
ups.google.com/d/msgid/jailhouse-dev/fde55f66-2e83-4df2-8f5e-44b0fb831acbn%=
40googlegroups.com</a>&gt;&gt; &lt;<a href=3D"https://groups.google.com/d/m=
sgid/jailhouse-dev/fde55f66-2e83-4df2-8f5e-44b0fb831acbn%40googlegroups.com=
" rel=3D"nofollow" target=3D"_blank">https://groups.google.com/d/msgid/jail=
house-dev/fde55f66-2e83-4df2-8f5e-44b0fb831acbn%40googlegroups.com</a> &lt;=
<a href=3D"https://groups.google.com/d/msgid/jailhouse-dev/fde55f66-2e83-4d=
f2-8f5e-44b0fb831acbn%40googlegroups.com" rel=3D"nofollow" target=3D"_blank=
">https://groups.google.com/d/msgid/jailhouse-dev/fde55f66-2e83-4df2-8f5e-4=
4b0fb831acbn%40googlegroups.com</a>&gt; &lt;<a href=3D"https://groups.googl=
e.com/d/msgid/jailhouse-dev/fde55f66-2e83-4df2-8f5e-44b0fb831acbn%40googleg=
roups.com" rel=3D"nofollow" target=3D"_blank">https://groups.google.com/d/m=
sgid/jailhouse-dev/fde55f66-2e83-4df2-8f5e-44b0fb831acbn%40googlegroups.com=
</a> &lt;<a href=3D"https://groups.google.com/d/msgid/jailhouse-dev/fde55f6=
6-2e83-4df2-8f5e-44b0fb831acbn%40googlegroups.com" rel=3D"nofollow" target=
=3D"_blank">https://groups.google.com/d/msgid/jailhouse-dev/fde55f66-2e83-4=
df2-8f5e-44b0fb831acbn%40googlegroups.com</a>&gt;&gt;&gt; &lt;<a href=3D"ht=
tps://groups.google.com/d/msgid/jailhouse-dev/fde55f66-2e83-4df2-8f5e-44b0f=
b831acbn%40googlegroups.com?utm_medium=3Demail&amp;utm_source=3Dfooter" rel=
=3D"nofollow" target=3D"_blank">https://groups.google.com/d/msgid/jailhouse=
-dev/fde55f66-2e83-4df2-8f5e-44b0fb831acbn%40googlegroups.com?utm_medium=3D=
email&amp;utm_source=3Dfooter</a> &lt;<a href=3D"https://groups.google.com/=
d/msgid/jailhouse-dev/fde55f66-2e83-4df2-8f5e-44b0fb831acbn%40googlegroups.=
com?utm_medium=3Demail&amp;utm_source=3Dfooter" rel=3D"nofollow" target=3D"=
_blank">https://groups.google.com/d/msgid/jailhouse-dev/fde55f66-2e83-4df2-=
8f5e-44b0fb831acbn%40googlegroups.com?utm_medium=3Demail&amp;utm_source=3Df=
ooter</a>&gt; &lt;<a href=3D"https://groups.google.com/d/msgid/jailhouse-de=
v/fde55f66-2e83-4df2-8f5e-44b0fb831acbn%40googlegroups.com?utm_medium=3Dema=
il&amp;utm_source=3Dfooter" rel=3D"nofollow" target=3D"_blank">https://grou=
ps.google.com/d/msgid/jailhouse-dev/fde55f66-2e83-4df2-8f5e-44b0fb831acbn%4=
0googlegroups.com?utm_medium=3Demail&amp;utm_source=3Dfooter</a> &lt;<a hre=
f=3D"https://groups.google.com/d/msgid/jailhouse-dev/fde55f66-2e83-4df2-8f5=
e-44b0fb831acbn%40googlegroups.com?utm_medium=3Demail&amp;utm_source=3Dfoot=
er" rel=3D"nofollow" target=3D"_blank">https://groups.google.com/d/msgid/ja=
ilhouse-dev/fde55f66-2e83-4df2-8f5e-44b0fb831acbn%40googlegroups.com?utm_me=
dium=3Demail&amp;utm_source=3Dfooter</a>&gt;&gt; &lt;<a href=3D"https://gro=
ups.google.com/d/msgid/jailhouse-dev/fde55f66-2e83-4df2-8f5e-44b0fb831acbn%=
40googlegroups.com?utm_medium=3Demail&amp;utm_source=3Dfooter" rel=3D"nofol=
low" target=3D"_blank">https://groups.google.com/d/msgid/jailhouse-dev/fde5=
5f66-2e83-4df2-8f5e-44b0fb831acbn%40googlegroups.com?utm_medium=3Demail&amp=
;utm_source=3Dfooter</a> &lt;<a href=3D"https://groups.google.com/d/msgid/j=
ailhouse-dev/fde55f66-2e83-4df2-8f5e-44b0fb831acbn%40googlegroups.com?utm_m=
edium=3Demail&amp;utm_source=3Dfooter" rel=3D"nofollow" target=3D"_blank">h=
ttps://groups.google.com/d/msgid/jailhouse-dev/fde55f66-2e83-4df2-8f5e-44b0=
fb831acbn%40googlegroups.com?utm_medium=3Demail&amp;utm_source=3Dfooter</a>=
&gt; &lt;<a href=3D"https://groups.google.com/d/msgid/jailhouse-dev/fde55f6=
6-2e83-4df2-8f5e-44b0fb831acbn%40googlegroups.com?utm_medium=3Demail&amp;ut=
m_source=3Dfooter" rel=3D"nofollow" target=3D"_blank">https://groups.google=
.com/d/msgid/jailhouse-dev/fde55f66-2e83-4df2-8f5e-44b0fb831acbn%40googlegr=
oups.com?utm_medium=3Demail&amp;utm_source=3Dfooter</a> &lt;<a href=3D"http=
s://groups.google.com/d/msgid/jailhouse-dev/fde55f66-2e83-4df2-8f5e-44b0fb8=
31acbn%40googlegroups.com?utm_medium=3Demail&amp;utm_source=3Dfooter" rel=
=3D"nofollow" target=3D"_blank">https://groups.google.com/d/msgid/jailhouse=
-dev/fde55f66-2e83-4df2-8f5e-44b0fb831acbn%40googlegroups.com?utm_medium=3D=
email&amp;utm_source=3Dfooter</a>&gt;&gt;&gt;&gt;.
<br>&gt;      &gt; &gt;
<br>&gt;      &gt; &gt; --
<br>&gt;      &gt; &gt; You received this message because you are subscribe=
d to the Google
<br>&gt;      &gt; &gt; Groups &quot;Jailhouse&quot; group.
<br>&gt;      &gt; &gt; To unsubscribe from this group and stop receiving e=
mails from it,
<br>&gt;      &gt; send
<br>&gt;      &gt; &gt; an email to <a rel=3D"nofollow">jailhouse-de...@goo=
glegroups.com</a>
<br>&gt;      &gt; &gt; &lt;mailto:<a rel=3D"nofollow">jailhouse-de...@goog=
legroups.com</a>&gt;.
<br>&gt;      &gt; &gt; To view this discussion on the web visit
<br>&gt;      &gt; &gt;
<br>&gt;      &gt;
<br>&gt;     <a href=3D"https://groups.google.com/d/msgid/jailhouse-dev/9f1=
616c7-ac5f-49de-bc24-8bd8520f4c07n%40googlegroups.com" rel=3D"nofollow" tar=
get=3D"_blank">https://groups.google.com/d/msgid/jailhouse-dev/9f1616c7-ac5=
f-49de-bc24-8bd8520f4c07n%40googlegroups.com</a> &lt;<a href=3D"https://gro=
ups.google.com/d/msgid/jailhouse-dev/9f1616c7-ac5f-49de-bc24-8bd8520f4c07n%=
40googlegroups.com" rel=3D"nofollow" target=3D"_blank">https://groups.googl=
e.com/d/msgid/jailhouse-dev/9f1616c7-ac5f-49de-bc24-8bd8520f4c07n%40googleg=
roups.com</a>&gt; &lt;<a href=3D"https://groups.google.com/d/msgid/jailhous=
e-dev/9f1616c7-ac5f-49de-bc24-8bd8520f4c07n%40googlegroups.com" rel=3D"nofo=
llow" target=3D"_blank">https://groups.google.com/d/msgid/jailhouse-dev/9f1=
616c7-ac5f-49de-bc24-8bd8520f4c07n%40googlegroups.com</a> &lt;<a href=3D"ht=
tps://groups.google.com/d/msgid/jailhouse-dev/9f1616c7-ac5f-49de-bc24-8bd85=
20f4c07n%40googlegroups.com" rel=3D"nofollow" target=3D"_blank">https://gro=
ups.google.com/d/msgid/jailhouse-dev/9f1616c7-ac5f-49de-bc24-8bd8520f4c07n%=
40googlegroups.com</a>&gt;&gt; &lt;<a href=3D"https://groups.google.com/d/m=
sgid/jailhouse-dev/9f1616c7-ac5f-49de-bc24-8bd8520f4c07n%40googlegroups.com=
?utm_medium=3Demail&amp;utm_source=3Dfooter" rel=3D"nofollow" target=3D"_bl=
ank">https://groups.google.com/d/msgid/jailhouse-dev/9f1616c7-ac5f-49de-bc2=
4-8bd8520f4c07n%40googlegroups.com?utm_medium=3Demail&amp;utm_source=3Dfoot=
er</a> &lt;<a href=3D"https://groups.google.com/d/msgid/jailhouse-dev/9f161=
6c7-ac5f-49de-bc24-8bd8520f4c07n%40googlegroups.com?utm_medium=3Demail&amp;=
utm_source=3Dfooter" rel=3D"nofollow" target=3D"_blank">https://groups.goog=
le.com/d/msgid/jailhouse-dev/9f1616c7-ac5f-49de-bc24-8bd8520f4c07n%40google=
groups.com?utm_medium=3Demail&amp;utm_source=3Dfooter</a>&gt; &lt;<a href=
=3D"https://groups.google.com/d/msgid/jailhouse-dev/9f1616c7-ac5f-49de-bc24=
-8bd8520f4c07n%40googlegroups.com?utm_medium=3Demail&amp;utm_source=3Dfoote=
r" rel=3D"nofollow" target=3D"_blank">https://groups.google.com/d/msgid/jai=
lhouse-dev/9f1616c7-ac5f-49de-bc24-8bd8520f4c07n%40googlegroups.com?utm_med=
ium=3Demail&amp;utm_source=3Dfooter</a> &lt;<a href=3D"https://groups.googl=
e.com/d/msgid/jailhouse-dev/9f1616c7-ac5f-49de-bc24-8bd8520f4c07n%40googleg=
roups.com?utm_medium=3Demail&amp;utm_source=3Dfooter" rel=3D"nofollow" targ=
et=3D"_blank">https://groups.google.com/d/msgid/jailhouse-dev/9f1616c7-ac5f=
-49de-bc24-8bd8520f4c07n%40googlegroups.com?utm_medium=3Demail&amp;utm_sour=
ce=3Dfooter</a>&gt;&gt;&gt;.
<br>&gt;      &gt;
<br>&gt;      &gt; --
<br>&gt;      &gt; You received this message because you are subscribed to =
the Google
<br>&gt;      &gt; Groups &quot;Jailhouse&quot; group.
<br>&gt;      &gt; To unsubscribe from this group and stop receiving emails=
 from it,
<br>&gt;     send
<br>&gt;      &gt; an email to <a rel=3D"nofollow">jailhouse-de...@googlegr=
oups.com</a>
<br>&gt;      &gt; &lt;mailto:<a rel=3D"nofollow">jailhouse-de...@googlegro=
ups.com</a>&gt;.
<br>&gt;      &gt; To view this discussion on the web visit
<br>&gt;      &gt;
<br>&gt;     <a href=3D"https://groups.google.com/d/msgid/jailhouse-dev/01d=
fb141-0e4f-4adc-939f-c7a0c145c055n%40googlegroups.com" rel=3D"nofollow" tar=
get=3D"_blank">https://groups.google.com/d/msgid/jailhouse-dev/01dfb141-0e4=
f-4adc-939f-c7a0c145c055n%40googlegroups.com</a> &lt;<a href=3D"https://gro=
ups.google.com/d/msgid/jailhouse-dev/01dfb141-0e4f-4adc-939f-c7a0c145c055n%=
40googlegroups.com" rel=3D"nofollow" target=3D"_blank">https://groups.googl=
e.com/d/msgid/jailhouse-dev/01dfb141-0e4f-4adc-939f-c7a0c145c055n%40googleg=
roups.com</a>&gt; &lt;<a href=3D"https://groups.google.com/d/msgid/jailhous=
e-dev/01dfb141-0e4f-4adc-939f-c7a0c145c055n%40googlegroups.com?utm_medium=
=3Demail&amp;utm_source=3Dfooter" rel=3D"nofollow" target=3D"_blank">https:=
//groups.google.com/d/msgid/jailhouse-dev/01dfb141-0e4f-4adc-939f-c7a0c145c=
055n%40googlegroups.com?utm_medium=3Demail&amp;utm_source=3Dfooter</a> &lt;=
<a href=3D"https://groups.google.com/d/msgid/jailhouse-dev/01dfb141-0e4f-4a=
dc-939f-c7a0c145c055n%40googlegroups.com?utm_medium=3Demail&amp;utm_source=
=3Dfooter" rel=3D"nofollow" target=3D"_blank">https://groups.google.com/d/m=
sgid/jailhouse-dev/01dfb141-0e4f-4adc-939f-c7a0c145c055n%40googlegroups.com=
?utm_medium=3Demail&amp;utm_source=3Dfooter</a>&gt;&gt;.
<br>&gt;=20
<br>&gt; --=20
<br>&gt; You received this message because you are subscribed to the Google=
=20
<br>&gt; Groups &quot;Jailhouse&quot; group.
<br>&gt; To unsubscribe from this group and stop receiving emails from it, =
send=20
<br>&gt; an email to <a rel=3D"nofollow">jailhouse-de...@googlegroups.com</=
a>=20
<br>&gt; &lt;mailto:<a rel=3D"nofollow">jailhouse-de...@googlegroups.com</a=
>&gt;.
<br>&gt; To view this discussion on the web visit=20
<br>&gt; <a href=3D"https://groups.google.com/d/msgid/jailhouse-dev/ed14da4=
5-f14b-48d3-a38d-071c55354ef0n%40googlegroups.com" rel=3D"nofollow" target=
=3D"_blank">https://groups.google.com/d/msgid/jailhouse-dev/ed14da45-f14b-4=
8d3-a38d-071c55354ef0n%40googlegroups.com</a> &lt;<a href=3D"https://groups=
.google.com/d/msgid/jailhouse-dev/ed14da45-f14b-48d3-a38d-071c55354ef0n%40g=
ooglegroups.com?utm_medium=3Demail&amp;utm_source=3Dfooter" rel=3D"nofollow=
" target=3D"_blank">https://groups.google.com/d/msgid/jailhouse-dev/ed14da4=
5-f14b-48d3-a38d-071c55354ef0n%40googlegroups.com?utm_medium=3Demail&amp;ut=
m_source=3Dfooter</a>&gt;.
<br></blockquote></div>

<p></p>

-- <br>
You received this message because you are subscribed to a topic in the Goog=
le Groups &quot;Jailhouse&quot; group.<br>
To unsubscribe from this topic, visit <a href=3D"https://groups.google.com/=
d/topic/jailhouse-dev/xrHHVosH75k/unsubscribe" target=3D"_blank">https://gr=
oups.google.com/d/topic/jailhouse-dev/xrHHVosH75k/unsubscribe</a>.<br>
To unsubscribe from this group and all its topics, send an email to <a href=
=3D"mailto:jailhouse-dev+unsubscribe@googlegroups.com" target=3D"_blank">ja=
ilhouse-dev+unsubscribe@googlegroups.com</a>.<br>
To view this discussion on the web visit <a href=3D"https://groups.google.c=
om/d/msgid/jailhouse-dev/7da1588b-2a97-4b23-924b-6d1ebb75e42cn%40googlegrou=
ps.com?utm_medium=3Demail&amp;utm_source=3Dfooter" target=3D"_blank">https:=
//groups.google.com/d/msgid/jailhouse-dev/7da1588b-2a97-4b23-924b-6d1ebb75e=
42cn%40googlegroups.com</a>.<br>
</blockquote></div>

<p></p>

-- <br />
You received this message because you are subscribed to the Google Groups &=
quot;Jailhouse&quot; group.<br />
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to <a href=3D"mailto:jailhouse-dev+unsubscribe@googlegroups.com">jailh=
ouse-dev+unsubscribe@googlegroups.com</a>.<br />
To view this discussion on the web visit <a href=3D"https://groups.google.c=
om/d/msgid/jailhouse-dev/CAKBX2QLbjz0kYBZbfQhE6yH8BhEgL9C8K79%3DT51GQVRW2-2=
YRw%40mail.gmail.com?utm_medium=3Demail&utm_source=3Dfooter">https://groups=
.google.com/d/msgid/jailhouse-dev/CAKBX2QLbjz0kYBZbfQhE6yH8BhEgL9C8K79%3DT5=
1GQVRW2-2YRw%40mail.gmail.com</a>.<br />

--0000000000007cc8d405f0f53b26--
