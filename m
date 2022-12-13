Return-Path: <jailhouse-dev+bncBDUOFW62WYFBBVW44OOAMGQEDKFT7UQ@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-wm1-x338.google.com (mail-wm1-x338.google.com [IPv6:2a00:1450:4864:20::338])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D8F364BE5F
	for <lists+jailhouse-dev@lfdr.de>; Tue, 13 Dec 2022 22:27:51 +0100 (CET)
Received: by mail-wm1-x338.google.com with SMTP id a6-20020a05600c224600b003d1f3ed49adsf3360089wmm.4
        for <lists+jailhouse-dev@lfdr.de>; Tue, 13 Dec 2022 13:27:51 -0800 (PST)
ARC-Seal: i=2; a=rsa-sha256; t=1670966870; cv=pass;
        d=google.com; s=arc-20160816;
        b=K9gfFZu9BGsp7qaRDRtBzxOwVGQKvFLQfbjHfkLjSAwd/O1bzzi8XsmimmGJUJgRtG
         BEyovtfwVixejIYR6UhQwKxy5thVDLfNWQzgs1douMOZrSgbHmQ8XMJfQclOWiFfv6ql
         Byi6khx9U7q5TQ1WirRfvUDC1q9x+fCjKpNNsFER57hsmTmhCoqRHGfHhiOAfpMyBz5O
         7y1rDbzb8xqejlG68FqsWF8dkQUMEoTiEHfkUkeTL3UW8t/2zW8zyJ7YE4xpO0OuTH1k
         93Kxfkpk3OqSZKY2B3hmblV5PXaMG8l+SefNjvCW3L5rNf24sXLjStPtCYBDPOmoQT/Z
         5RuA==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:content-transfer-encoding
         :in-reply-to:from:references:to:content-language:subject:user-agent
         :mime-version:date:message-id:sender:dkim-signature;
        bh=WqbmxurDJQpjco51m70HtqeIv2cayo9R6O8tNxOhmz0=;
        b=J7f4A9msOVb/ONzX2O5UVjRKjq/aXSkVCcfgzHgzKHRPK6ArDHqQXCIpE+XlcfiNN5
         Ty5UBZUb7ckTMYpSe5ZeNkaC6s9YWEeDKfJa6btVhJmlIfM8rMHcSOBA1LTGm/N27pf1
         7/cIBvqffH2+N3UCKvsLcGQ1cqObuoZoykIkyNGR2S3JMHIjwaX7xmf0AA/80byvLh16
         Ffg74OdP/q0V5lH1WypXzFBklz0XZ3IUjunfe95pnvUVJUNov5mhmvNaVp641nZ5qaL9
         e/KIW0L6UDqIZzjLSIqmo+r+GaAvGF6hPnTYNupv5ytkkI3FSVAP5d9pE6auMyk5mkbw
         lCMw==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass header.i=@oth-regensburg.de header.s=mta01-20211122 header.b=MLEEx6SZ;
       spf=pass (google.com: domain of ralf.ramsauer@oth-regensburg.de designates 2001:638:a01:1096::11 as permitted sender) smtp.mailfrom=ralf.ramsauer@oth-regensburg.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=oth-regensburg.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20210112;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:x-original-authentication-results
         :x-original-sender:content-transfer-encoding:in-reply-to:from
         :references:to:content-language:subject:user-agent:mime-version:date
         :message-id:sender:from:to:cc:subject:date:message-id:reply-to;
        bh=WqbmxurDJQpjco51m70HtqeIv2cayo9R6O8tNxOhmz0=;
        b=mBdTFcQ5ETc550HdDtvRwc6kQ5RcPeV3jijRNLAVCVC4SDPUVrKQS4qh1twZLcpq2C
         xPBS7ho+sS7PvPoPfew7k/k+z4/UofC5awrawWJwg/N5sRek5ssr+twFmGcqtZGEFfL6
         MDsaA+ifumiPrYC8Hen6OvEl5vdSpJMtLWCbUXn7uKnp08YL3FIqUiPipfvfELQsvZ9b
         J6WWvjjbvEsMqxQc3//8aMShXA378Q3o5nrstTfNv0DivmbXhS28gJso2nOOIJ5jTWsb
         pTwyJ4UjsTSMr1l6SwLH+ueCgj+unAr8vR3cHF4p1yIlv2AmPYGWab9mYCQlxXMU1E9l
         IrEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :x-spam-checked-in-group:list-id:mailing-list:precedence
         :x-original-authentication-results:x-original-sender
         :content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:sender:from:to:cc:subject:date:message-id
         :reply-to;
        bh=WqbmxurDJQpjco51m70HtqeIv2cayo9R6O8tNxOhmz0=;
        b=V1Rlz6zaPOYQv0dry3SCO61zBNvq9WzpnyV288MgbdTreq8ScCGOaPLJM4SsUcyVIi
         V75ZXuhQV82WxgahetWLezP24dBP1sEaSZdiuo/vgbdY9/wNu+whBUMApS21kXXlAwPV
         2AvWJqOEsOEoeprpf4ynAIuDbOaEbKcVT3Uz0HgfpmvAajYqEkRBgwIhsKAKIXiDRjDp
         F5BJVwVRBoDuZiExoBIoolgrP54I7xd4F7ZDUH48MnPU/NeJOX5STPR3G2Hb0rK67FBW
         w0s1ihNtFC10Nacmk3uxB1OyrPKHoAi2UpVJBbpXlPO9sikw9+eC26V/eaGyghtfHMg6
         8LDA==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: ANoB5pnsC6e84JXbv7NOtlk063CSiFlBTarXuezTS2IE+2i9vIC6gi94
	uP3OAheiK9O6fmi00P8xF6o=
X-Google-Smtp-Source: AA0mqf72YkNxwBcBxbrLEDFs61FzE1WnE1FBn4Vktfy4QPJfTqnwndK3VAa74WPitwJMkEyAjSPqsw==
X-Received: by 2002:a05:600c:4929:b0:3cf:703e:1d88 with SMTP id f41-20020a05600c492900b003cf703e1d88mr7816wmp.155.1670966870698;
        Tue, 13 Dec 2022 13:27:50 -0800 (PST)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a05:600c:3b17:b0:3d1:be63:3b63 with SMTP id
 m23-20020a05600c3b1700b003d1be633b63ls12760681wms.1.-pod-canary-gmail; Tue,
 13 Dec 2022 13:27:49 -0800 (PST)
X-Received: by 2002:a05:600c:6010:b0:3d1:f496:e25f with SMTP id az16-20020a05600c601000b003d1f496e25fmr16307235wmb.16.1670966869057;
        Tue, 13 Dec 2022 13:27:49 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1670966869; cv=none;
        d=google.com; s=arc-20160816;
        b=voPTqgR3RWKOm5Y7CtJ4VCwzaA4EnoFn4Z+cuMz40cFB1VLBda0pnhSrA6FPl7G6Gk
         vQnMC7wpmLshIOAmzUzYzla/BPhBD9uISBVselVahkl4YyRd9EJ7/WOS4HyuivSnE4/O
         9dq+QsA+KC9uiAB1p5TzCzitGlvNBVnUIp4+FGFm+2sUXGRPtuwTsbiuBmHJkC1psHap
         gkPj51YmXst4bflsRtwcjqoeW8WcgWMSesGtxPzRp96qZW3wCsF6+iZcEoBKdrtXrp8+
         eNNQCw0pzDsN877gU7ibVaQ6e7olAXcpB9StdoX45W8wtbYEWSIl5fzpTarqyMNE4Dv7
         vRSA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=/WfsuHOWwTXYJgtQXqDy5JhsaDC0+wbWe3DZpyh/IpE=;
        b=zxeIFDA1GizEB6z4iD4lDNnOwV9hlsgUNzBFDhSAvjKrd4ahZAHwZSevr/iWBNOPbO
         nYOjGjgKwq+rmXQj9eVFUkGkeKFHzBQAi8lKpUkIr/sDd1v37VljaBDYCBYeiBHa6ttv
         +E/ZMjiqK4uxvfSJ1EQdzi1FNPUn9JCLnTZyNBq9Yjeb1cTuPRGibylPXJeb5kakpEI1
         A8GeJThHW5D+WeUbdJmunKS1A/iwXwvVdnEhykfS9LvqaJBzac+cWydjSEWMpdqjxYNE
         SZfxXSuwlgzFR0QAJBMSXQCOusVJ6HX6X2CcGk8MP7h9JIst+ijT2vpnqRGz+QnxFPpQ
         bHqg==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       dkim=pass header.i=@oth-regensburg.de header.s=mta01-20211122 header.b=MLEEx6SZ;
       spf=pass (google.com: domain of ralf.ramsauer@oth-regensburg.de designates 2001:638:a01:1096::11 as permitted sender) smtp.mailfrom=ralf.ramsauer@oth-regensburg.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=oth-regensburg.de
Received: from mta01.hs-regensburg.de (mta01.hs-regensburg.de. [2001:638:a01:1096::11])
        by gmr-mx.google.com with ESMTPS id n7-20020a1c2707000000b003cf567afb1fsi143462wmn.3.2022.12.13.13.27.48
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 Dec 2022 13:27:48 -0800 (PST)
Received-SPF: pass (google.com: domain of ralf.ramsauer@oth-regensburg.de designates 2001:638:a01:1096::11 as permitted sender) client-ip=2001:638:a01:1096::11;
Received: from E16S03.hs-regensburg.de (e16s03.hs-regensburg.de [IPv6:2001:638:a01:8013::93])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(Client CN "E16S03", Issuer "E16S03" (not verified))
	by mta01.hs-regensburg.de (Postfix) with ESMTPS id 4NWs6D41qzzxpy;
	Tue, 13 Dec 2022 22:27:48 +0100 (CET)
Received: from [172.23.3.84] (194.95.106.226) by E16S03.hs-regensburg.de
 (2001:638:a01:8013::93) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.16; Tue, 13 Dec
 2022 22:27:48 +0100
Message-ID: <918e2011-a51d-d1d6-9028-13e64bd7466c@oth-regensburg.de>
Date: Tue, 13 Dec 2022 22:27:47 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.1
Subject: Re: RTOS inmate misses interrupts
Content-Language: en-US
To: Rasty Slutsker <rslutsker@gmail.com>, Jailhouse
	<jailhouse-dev@googlegroups.com>
References: <fde55f66-2e83-4df2-8f5e-44b0fb831acbn@googlegroups.com>
 <34d2d078-1282-c240-9a65-301469b0bbe2@oth-regensburg.de>
 <9f1616c7-ac5f-49de-bc24-8bd8520f4c07n@googlegroups.com>
 <b538dfcd-0431-58d7-dd05-60205acc2c06@oth-regensburg.de>
 <01dfb141-0e4f-4adc-939f-c7a0c145c055n@googlegroups.com>
 <8bf22a0b-ec26-5974-e942-c5a0ebc9a028@oth-regensburg.de>
 <ed14da45-f14b-48d3-a38d-071c55354ef0n@googlegroups.com>
From: Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>
In-Reply-To: <ed14da45-f14b-48d3-a38d-071c55354ef0n@googlegroups.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: quoted-printable
X-Originating-IP: [194.95.106.226]
X-ClientProxiedBy: E16S03.hs-regensburg.de (2001:638:a01:8013::93) To
 E16S03.hs-regensburg.de (2001:638:a01:8013::93)
X-Original-Sender: ralf.ramsauer@oth-regensburg.de
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass
 header.i=@oth-regensburg.de header.s=mta01-20211122 header.b=MLEEx6SZ;
       spf=pass (google.com: domain of ralf.ramsauer@oth-regensburg.de
 designates 2001:638:a01:1096::11 as permitted sender) smtp.mailfrom=ralf.ramsauer@oth-regensburg.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=oth-regensburg.de
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

Hi Rasty,

(reply-to-all :) )

On 13/12/2022 19:31, Rasty Slutsker wrote:
> We learned how you export some statistics from Jailhouse as you guys do=
=20
> and added 3 variables

You reference to 'jailhouse cell stats'?

> 1. At the entry=C2=A0 Jailhouse IRQ (if irq=3D=3Dxxx counter ++)
> 2. At injection point of the same IRQ to inmate, still in Jailhouse
> 3. At the beginning of ISR in inmate (RTOS).

Ok, but that just counts the interrupts, and not the occuring delays, right=
?

>=20
> We let system run, introduce some load to linux. We see physical effects=
=20
> that suggest that we lose interrupts.
> We confirm it with difference in performance counters (gaps in quanta of=
=20
> 30 uSecs) that we sample in inmate ISR.
> Than we kill interrupt.
> All 3 counters are the same. Amount matches interrupt rate.
> My conclusion that Interrupt request is lost.

Could be the case. I don't know what happens if the jitter gets too long=20
between interrupts.

>=20
> Another question.
> We try to read CPU time stamp counter from Jailhouse ISR . We get 0.
> mrc =C2=A0 =C2=A0 p15, #0, r0, c9, c13, #0

That's the PMCNTR, right?

>=20
> Any idea why? Do you have some code for that?

Uhm, I would have to read the reference manual as well. Does reading the=20
TSC work in Linux? Maybe it has to be activated or enabled for the=20
hypervisor?

https://developer.arm.com/documentation/ddi0406/b/Debug-Architecture/Debug-=
Registers-Reference/Performance-monitor-registers/c9--Count-Enable-Set-Regi=
ster--PMCNTENSET-?lang=3Den

Thanks,
   Ralf

>=20
> Best regards
> Rasty
>=20
>=20
>=20
> On Tuesday, December 13, 2022 at 3:47:25 PM UTC+2 Ralf Ramsauer wrote:
>=20
>     Hi Rasty,
>=20
>     Please reply-to-all, then your reply will also pop up in my Inbox.
>=20
>     On 10/12/2022 08:52, Rasty Slutsker wrote:
>      > Hi,
>      > We did some performance measurements.
>      > Added counters in 3 places (per Irq source)
>      > 1. entry to jailhouse ISR
>      > 2. dispatch of interrupt to particular vector to particular core
>      > 3. in RTOS isr.
>=20
>     Okay. How do you read and dump them? I hope after everything is done.
>=20
>     Take care that if you dump them immediately to the uart, this will
>     consume a lot of time and cause significant delay. ('heavy' printk
>     logic
>     + busy waiting for the uart)
>=20
>      >
>      > *We see that all 3 counters have the same value*, but we measure
>     time
>=20
>     huh? What counters do you access? There's something odd if they hold
>     the
>     same value at different places.
>=20
>      > gaps in RTOS in ISR invocation times, sometimes upto 60 uSec.
>      >
>      > It means that either
>      > a) interrupt request is lost. But, according to setup it is
>      > edge-triggered, it cannot be lost, just delayed.
>      > b) there is a delay of more than 60 usec in jailhouse ISR.
>      >
>      > questions:
>      > 1. Is it possible that jailhouse interrupt dispatching routine
>     enters
>      > some loop that takes considerable amount of time?
>=20
>     If you use printk during dispatching for debugging - yes. Otherwise, =
I
>     guess no. Not 60=C2=B5s.
>=20
>      > 2. What would be explanation of interrupt latency of 60 Secs?
>     Even if we
>      > take into account cache line refill we get much lower number,
>     which do
>      > not reach tens uSecs.
>=20
>     Ack, I would definitely not expect 60=C2=B5s delay for IRQ reinjectio=
n.
>=20
>     Thanks
>     Ralf
>=20
>      >
>      > Best regards
>      > Rasty
>      >
>      >
>      >
>      >
>      >
>      > On Tuesday, December 6, 2022 at 6:01:20 PM UTC+2 Ralf Ramsauer
>     wrote:
>      >
>      > Hi,
>      >
>      > On 05/12/2022 17:30, Rasty Slutsker wrote:
>      > > Hi Ralf,
>      > > Thank you for the answer.
>      > > We have periodic interrupt each 30 u(!)Sec. Linux cannot deal
>      > with such
>      > > rate, so we need hypervisor/RTOS.
>      >
>      > I understand.
>      >
>      > > We managed to read a code of hypervisor. It appears that all
>      > interrupts
>      > > to all cores are intercepted by hypervisor and then forwarded to
>      > guests
>      > > (per core).
>      >
>      > Yes, exactly, that's the case if you don't have SDEI. If you have =
a
>      > platform that would come with SDEI, then you have of course less
>      > overhead.
>      >
>      > > If we reduce interrupt priority of mentioned interrupt (as you
>      > suggest)
>      > > we lose even more interrupts, even without stress.
>      > > Interrupt is defined as edge triggered, I assumed that it is
>      > memorized
>      > > by gic until serviced.
>      > > Is it possible that Hypervisor acknowledges pending interrupt
>     while
>      > > servicing interrupt from another source ? Kind of race - 2
>      > interrupts
>      > > for 2 cores arrive nearly simultaneously. One is lost.
>      >
>      > The EOIR and IAR registers of the GIC are core-local registers of
>     the
>      > GIC CPU interface (GICC), so I wonder how this should cause a race=
,
>      > unless there isn't a hard logical mistake in the code, which I
>     doubt.
>      >
>      >
>      > What you could try to do for debugging purposes:
>      >
>      > 1. Slow down from 30=C2=B5s to something sloooower, which you can =
handle
>      > even under load. Say 100=C2=B5s, 500=C2=B5s, something like that.
>      >
>      > 2. Measure the jitter x between arrival of the interrupt, and fina=
l
>      > acknowledgement in your RTOS. You can use performance monitoring
>      > registers, or watch CPU cycle counters, whatever. Repeat the
>      > measurement, w/ load and w/o load on Linux-side.
>      >
>      > 3. If max(x) >=3D 30=C2=B5s, then you know where your IRQs go in c=
ase of a
>      > periodic cycle of 30=C2=B5s.
>      >
>      >
>      > Reason: What I did some while ago, is measuring the Jitter of
>      > Linux+Jailhouse on ARM systems with cyclictest. On a Jetson TX1
>      > platform, for example, we saw Jitter up 50=C2=B5s. So there's IRQ
>      > reinjection, a full Linux stack and some userspace application
>      > involved,
>      > so three context switches and lots of code. You have probably two
>      > context switches and less code, as you use a RTOS, but I think
>      > there's a
>      > certain chance to exceed 30=C2=B5s.
>      >
>      > What my gut feeling tells me is that you manage to hold those
>     30=C2=B5s if
>      > Linux is quiet. As soon as there's some stress on the system bus,
>     and
>      > even on shared caches, you exceed you deadline.
>      >
>      > Thanks
>      > Ralf
>      >
>      > >
>      > > Best regards
>      > > Rasty
>      > >
>      > > On Monday, December 5, 2022 at 5:14:37 PM UTC+2 Ralf Ramsauer
>     wrote:
>      > >
>      > > Hi Nir,
>      > >
>      > > On 29/11/2022 14:21, nirge...@gmail.com wrote:
>      > > > Hi there,
>      > > >
>      > > > Our target is Sitara AM5726 , CortexA15 dual core on which we
>     are
>      > > > running Linux on A15 core0 and RTOS on core1.
>      > > >
>      > > > __
>      > > >
>      > > > RTOS gets periodic interrupt from external hardware via nirq1
>     pin
>      > > > (dedicated input into ARM gic).____
>      > > >
>      > > > Under heavy load in Linux (core 0!), RTOS, which runs on core1
>      > > misses
>      > > > interrupts.____
>      > >
>      > > Uhm. Can you reconstruct that issue w/o Jailhouse under Linux?
>      > >
>      > > I mean, can you set the SMP affinity of that IRQ to core 1 under
>      > Linux,
>      > > and then write some test application running on core 1 that just
>      > > receives the IRQ. If that issue happens under Linux as well, the=
n
>      > you
>      > > know that the issue has probably nothing to do with Jailhouse.
>      > >
>      > >
>      > > What also might happen: If there's enough pressure on the shared
>      > system
>      > > bus when Linux is under load, then you simply loose those IRQs a=
s
>      > the
>      > > RTOS doesn't have enough time to handle it. You can test this
>      > > hypothesis
>      > > if you lower the frequency of the the periodic interrupt. If you
>      > still
>      > > loose IRQs, then this should not be the case.
>      > >
>      > > >
>      > > > Questions____
>      > > >
>      > > > 1. Does linux/hypervisor participate in interrupt
>      > > scheduling/forwarding
>      > > > to cell on Core1____
>      > >
>      > > Linux: No, Linux does not participate in anything that is going
>      > on on
>      > > CPU 1. That's the idea behind Jailhouse.
>      > >
>      > > Jailhouse: Maybe. On ARM platforms, Jailhouse needs to reinject
>     the
>      > > Interrupt from the hypervisor to the guest, if SDEI is not
>      > available.
>      > > Does the Sitara come with support for SDEI support?
>      > >
>      > > (You can btw monitor the exits of the hypervisor with 'jailhouse
>      > cell
>      > > stats')
>      > >
>      > > Ralf
>      > >
>      > > > 2. Is there a description of interrupt forwarding/virtualizati=
on
>      > > scheme
>      > > > to cores (if exists)? Any pointer to document/source code
>     would be
>      > > > appreciated.
>      > > >
>      > > > Thanks a lot,
>      > > >
>      > > > Nir.
>      > > >
>      > > > --
>      > > > You received this message because you are subscribed to the
>     Google
>      > > > Groups "Jailhouse" group.
>      > > > To unsubscribe from this group and stop receiving emails from
>     it,
>      > > send
>      > > > an email to jailhouse-de...@googlegroups.com
>      > > > <mailto:jailhouse-de...@googlegroups.com>.
>      > > > To view this discussion on the web visit
>      > > >
>      > >
>      >
>     https://groups.google.com/d/msgid/jailhouse-dev/fde55f66-2e83-4df2-8f=
5e-44b0fb831acbn%40googlegroups.com <https://groups.google.com/d/msgid/jail=
house-dev/fde55f66-2e83-4df2-8f5e-44b0fb831acbn%40googlegroups.com> <https:=
//groups.google.com/d/msgid/jailhouse-dev/fde55f66-2e83-4df2-8f5e-44b0fb831=
acbn%40googlegroups.com <https://groups.google.com/d/msgid/jailhouse-dev/fd=
e55f66-2e83-4df2-8f5e-44b0fb831acbn%40googlegroups.com>> <https://groups.go=
ogle.com/d/msgid/jailhouse-dev/fde55f66-2e83-4df2-8f5e-44b0fb831acbn%40goog=
legroups.com <https://groups.google.com/d/msgid/jailhouse-dev/fde55f66-2e83=
-4df2-8f5e-44b0fb831acbn%40googlegroups.com> <https://groups.google.com/d/m=
sgid/jailhouse-dev/fde55f66-2e83-4df2-8f5e-44b0fb831acbn%40googlegroups.com=
 <https://groups.google.com/d/msgid/jailhouse-dev/fde55f66-2e83-4df2-8f5e-4=
4b0fb831acbn%40googlegroups.com>>> <https://groups.google.com/d/msgid/jailh=
ouse-dev/fde55f66-2e83-4df2-8f5e-44b0fb831acbn%40googlegroups.com?utm_mediu=
m=3Demail&utm_source=3Dfooter <https://groups.google.com/d/msgid/jailhouse-=
dev/fde55f66-2e83-4df2-8f5e-44b0fb831acbn%40googlegroups.com?utm_medium=3De=
mail&utm_source=3Dfooter> <https://groups.google.com/d/msgid/jailhouse-dev/=
fde55f66-2e83-4df2-8f5e-44b0fb831acbn%40googlegroups.com?utm_medium=3Demail=
&utm_source=3Dfooter <https://groups.google.com/d/msgid/jailhouse-dev/fde55=
f66-2e83-4df2-8f5e-44b0fb831acbn%40googlegroups.com?utm_medium=3Demail&utm_=
source=3Dfooter>> <https://groups.google.com/d/msgid/jailhouse-dev/fde55f66=
-2e83-4df2-8f5e-44b0fb831acbn%40googlegroups.com?utm_medium=3Demail&utm_sou=
rce=3Dfooter <https://groups.google.com/d/msgid/jailhouse-dev/fde55f66-2e83=
-4df2-8f5e-44b0fb831acbn%40googlegroups.com?utm_medium=3Demail&utm_source=
=3Dfooter> <https://groups.google.com/d/msgid/jailhouse-dev/fde55f66-2e83-4=
df2-8f5e-44b0fb831acbn%40googlegroups.com?utm_medium=3Demail&utm_source=3Df=
ooter <https://groups.google.com/d/msgid/jailhouse-dev/fde55f66-2e83-4df2-8=
f5e-44b0fb831acbn%40googlegroups.com?utm_medium=3Demail&utm_source=3Dfooter=
>>>>.
>      > >
>      > > --
>      > > You received this message because you are subscribed to the Goog=
le
>      > > Groups "Jailhouse" group.
>      > > To unsubscribe from this group and stop receiving emails from it=
,
>      > send
>      > > an email to jailhouse-de...@googlegroups.com
>      > > <mailto:jailhouse-de...@googlegroups.com>.
>      > > To view this discussion on the web visit
>      > >
>      >
>     https://groups.google.com/d/msgid/jailhouse-dev/9f1616c7-ac5f-49de-bc=
24-8bd8520f4c07n%40googlegroups.com <https://groups.google.com/d/msgid/jail=
house-dev/9f1616c7-ac5f-49de-bc24-8bd8520f4c07n%40googlegroups.com> <https:=
//groups.google.com/d/msgid/jailhouse-dev/9f1616c7-ac5f-49de-bc24-8bd8520f4=
c07n%40googlegroups.com <https://groups.google.com/d/msgid/jailhouse-dev/9f=
1616c7-ac5f-49de-bc24-8bd8520f4c07n%40googlegroups.com>> <https://groups.go=
ogle.com/d/msgid/jailhouse-dev/9f1616c7-ac5f-49de-bc24-8bd8520f4c07n%40goog=
legroups.com?utm_medium=3Demail&utm_source=3Dfooter <https://groups.google.=
com/d/msgid/jailhouse-dev/9f1616c7-ac5f-49de-bc24-8bd8520f4c07n%40googlegro=
ups.com?utm_medium=3Demail&utm_source=3Dfooter> <https://groups.google.com/=
d/msgid/jailhouse-dev/9f1616c7-ac5f-49de-bc24-8bd8520f4c07n%40googlegroups.=
com?utm_medium=3Demail&utm_source=3Dfooter <https://groups.google.com/d/msg=
id/jailhouse-dev/9f1616c7-ac5f-49de-bc24-8bd8520f4c07n%40googlegroups.com?u=
tm_medium=3Demail&utm_source=3Dfooter>>>.
>      >
>      > --
>      > You received this message because you are subscribed to the Google
>      > Groups "Jailhouse" group.
>      > To unsubscribe from this group and stop receiving emails from it,
>     send
>      > an email to jailhouse-de...@googlegroups.com
>      > <mailto:jailhouse-de...@googlegroups.com>.
>      > To view this discussion on the web visit
>      >
>     https://groups.google.com/d/msgid/jailhouse-dev/01dfb141-0e4f-4adc-93=
9f-c7a0c145c055n%40googlegroups.com <https://groups.google.com/d/msgid/jail=
house-dev/01dfb141-0e4f-4adc-939f-c7a0c145c055n%40googlegroups.com> <https:=
//groups.google.com/d/msgid/jailhouse-dev/01dfb141-0e4f-4adc-939f-c7a0c145c=
055n%40googlegroups.com?utm_medium=3Demail&utm_source=3Dfooter <https://gro=
ups.google.com/d/msgid/jailhouse-dev/01dfb141-0e4f-4adc-939f-c7a0c145c055n%=
40googlegroups.com?utm_medium=3Demail&utm_source=3Dfooter>>.
>=20
> --=20
> You received this message because you are subscribed to the Google=20
> Groups "Jailhouse" group.
> To unsubscribe from this group and stop receiving emails from it, send=20
> an email to jailhouse-dev+unsubscribe@googlegroups.com=20
> <mailto:jailhouse-dev+unsubscribe@googlegroups.com>.
> To view this discussion on the web visit=20
> https://groups.google.com/d/msgid/jailhouse-dev/ed14da45-f14b-48d3-a38d-0=
71c55354ef0n%40googlegroups.com <https://groups.google.com/d/msgid/jailhous=
e-dev/ed14da45-f14b-48d3-a38d-071c55354ef0n%40googlegroups.com?utm_medium=
=3Demail&utm_source=3Dfooter>.

--=20
You received this message because you are subscribed to the Google Groups "=
Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/=
jailhouse-dev/918e2011-a51d-d1d6-9028-13e64bd7466c%40oth-regensburg.de.
