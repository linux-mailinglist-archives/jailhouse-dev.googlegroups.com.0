Return-Path: <jailhouse-dev+bncBDUOFW62WYFBB3EE4KOAMGQE3YIOMHQ@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-wm1-x33a.google.com (mail-wm1-x33a.google.com [IPv6:2a00:1450:4864:20::33a])
	by mail.lfdr.de (Postfix) with ESMTPS id 0F5F764B693
	for <lists+jailhouse-dev@lfdr.de>; Tue, 13 Dec 2022 14:47:26 +0100 (CET)
Received: by mail-wm1-x33a.google.com with SMTP id r129-20020a1c4487000000b003d153a83d27sf4870999wma.0
        for <lists+jailhouse-dev@lfdr.de>; Tue, 13 Dec 2022 05:47:26 -0800 (PST)
ARC-Seal: i=2; a=rsa-sha256; t=1670939245; cv=pass;
        d=google.com; s=arc-20160816;
        b=ovHNz4cXs4gw1kGCGfJDFptciDmNfHzf4ABFluC9OR+cFY5z/9swAGcFfkU36YM5I/
         1tH7ZR0bPgs9oDgUqkpYfDpCD7kEYNr5VGefhti/xDwqK1aFtc2AAgkhQMwCv5Er+ZKH
         fExZJ1VktvL9b5k08qsyXZQdLT4Hl/AbjFb24+Rii1e6aPWZPE1Fe7pjPQlovrE4wTcp
         yVu7/KbSTO9Fb+0GMSBk79to6lGlE6gvcB1+q7Qpd4TT1hr9ux3WqqyjXj1kVtTidmeQ
         pqL0FT61VuQ/3sMEXj/jwDRmSL4in0q0xhlZbi0JU72/dJmBMtv9nA3qdCB602WW6vG6
         YvEA==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:content-transfer-encoding
         :in-reply-to:from:references:to:content-language:subject:user-agent
         :mime-version:date:message-id:sender:dkim-signature;
        bh=bcJry0M+JgwoAP7tb+gF1FKrTKEkEdZPEE3WYc2nNmE=;
        b=VbaVu1bjWeCRzBPlG6zE6LzNzNPRPzBOCCHasBGvh12t/r1yOsw6NjST2xNbQOyR79
         /NZf9EpgSe1VbrqeOx68a7ptWrUVhfSP7YsGyMRiA5Nyhtp5GLDP2dqnNkidAXC1XsGD
         kW3DMTWBF+6Pby5uVCebVWi14AlXVG+VrgoADLu+u6T+nc4sjIiJ1gs8BpRcOp1Htw59
         k9I/ScMGHfjkxabJwSIuLldwsI5Iap38XwKNwCjF/hgk3rkC4PX+jG4B/yFvTZKZz7sG
         CkryMEDlhCcaOLOCI76VknpfFMKxpFzFCSEOnuTuKzQXgk4t1jYbIcyPkseg4K5l5x5g
         MA3g==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass header.i=@oth-regensburg.de header.s=mta01-20211122 header.b=ITihJK4s;
       spf=pass (google.com: domain of ralf.ramsauer@oth-regensburg.de designates 2001:638:a01:1096::11 as permitted sender) smtp.mailfrom=ralf.ramsauer@oth-regensburg.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=oth-regensburg.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20210112;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:x-original-authentication-results
         :x-original-sender:content-transfer-encoding:in-reply-to:from
         :references:to:content-language:subject:user-agent:mime-version:date
         :message-id:sender:from:to:cc:subject:date:message-id:reply-to;
        bh=bcJry0M+JgwoAP7tb+gF1FKrTKEkEdZPEE3WYc2nNmE=;
        b=FGozvN67mFI2RGWjl+3MWU70zIuGCmOrin+RvbaJOJ2FkzZ7rOa9kWfPssYCli5kF1
         +0W1NWd7stl0k5LcTR/pPvIPDRi8d1JJFccua8wK7CfUGV/F2iC3qZ3EW7GG79uWRtpT
         ugy6jG1ZKWmpJaWu+UUczRcl1knBFEeY5PdYLRBP3pCjnUlNadIdSArf40x6Q3D6tiye
         084EMmKfNM1BFmHWYHmOk4PGPTsv04UyGllK1EM2U/UX1SHDH+ziLS7ywPA6zGHSvKsr
         Qm1O6cu3PjDA0sAKvwC0RUFqV7zff0SL9K3DDGDy3hlyQpZmYrRUnkkFr2X8adl2JgVA
         lUZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :x-spam-checked-in-group:list-id:mailing-list:precedence
         :x-original-authentication-results:x-original-sender
         :content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:sender:from:to:cc:subject:date:message-id
         :reply-to;
        bh=bcJry0M+JgwoAP7tb+gF1FKrTKEkEdZPEE3WYc2nNmE=;
        b=tTUqm9f59oImgyS5pVR5/fvmY/H/8qi519rq+FpBrcXHVliSzqFito8p8kHUv4Ky3F
         7bArdTy0t6GVuk13mEvuxea1BiFqp415qAHvUHC2DQ6SkVKNNAViy0fTf9LQT5KDYaaZ
         Ybqcl1GnC3+4OuXBheffkpy95LLjj2z1qofUHRZzdnNu5JBceBwMWRf8h6F/cciNxe+/
         NYX3DsTjGR0Wz52qmRT+1AhEsCrkEZj4TMY568N/f3uX/t1h9KVUPVRtcDnH++Rr3o17
         Fq4r2sMzh1ICwNMacwixbDckFvwnm2TBxCbK5lQa08tbmvG+w9favdnwKFfebicjZR53
         jKKA==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: ANoB5pm/w2sfsBsGzsKRzidg0DJQSv9MneG87oKDwWHWRQZKzYqSdkgw
	qN8WJyuovWH8vwUarn38mYc=
X-Google-Smtp-Source: AA0mqf4NkghCFcRXvWR6stxmBKHwwb6zn5GFw+P8dahacC1ZPULtcD8AlNDBlGXHK91svqhxNhSZGQ==
X-Received: by 2002:a05:600c:1e24:b0:3d1:fcb4:4073 with SMTP id ay36-20020a05600c1e2400b003d1fcb44073mr162974wmb.185.1670939245425;
        Tue, 13 Dec 2022 05:47:25 -0800 (PST)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a05:600c:3b17:b0:3d1:be63:3b63 with SMTP id
 m23-20020a05600c3b1700b003d1be633b63ls12110712wms.1.-pod-canary-gmail; Tue,
 13 Dec 2022 05:47:23 -0800 (PST)
X-Received: by 2002:a05:600c:3d8f:b0:3cf:d70d:d5a8 with SMTP id bi15-20020a05600c3d8f00b003cfd70dd5a8mr14917182wmb.6.1670939243759;
        Tue, 13 Dec 2022 05:47:23 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1670939243; cv=none;
        d=google.com; s=arc-20160816;
        b=yOOziug5/+0h43TLz4v22HoLjr9pEY/bPCxrB4TtI7BvoArN/9AMlTOQyVen9rnNz6
         f1yusaHhv6Cik8+uOZ4kqd9Jw4ShYf20EXdVxihzLtkMWtGOQdxhamoI/eNHWl2aQwR1
         ku7mHlQeHJlmr3071qNoDaMzSx4etDo1jKj4I2R2REl/wlj94Dt0KZzySLdP15uILaiT
         rDHxelBrNRSHmGaV8Pybmy8Bn7In12SIDrnCzEag7ofuOR2P6JRy3JC2DhAHG5/Grew6
         OJQJo/hgiL/OxJfAecX2NLU1Vylm5a8uSiYdYgEQs/hKJe7Wk4rGmx6KzaHMkW+CJME+
         hbuw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=yt2mnpAoxjdXZvjojN7oRbQNVMlbTAh1MgqTHmNoQbM=;
        b=m09bI4uZem4kyuHsioNjRYdzkaVTlTtggCR4hWsxARR5O+AeHk4ibFZeRtPICUuNYf
         b49fsGts0mLseJzL5RjmBLROXsJCtPV02KIwvh5V1IvMkTUZA2V3p8NRQxPdTto52oc6
         7ufQ8O1DZHSL0jI9/Jyl26YD47wNpkiD/FN5LJoCowi/Ov85oNYu4BGA7ZO+txLFDwLu
         Etbap1X4Ex/zGYE+MsPK17gaVCYo6PD9Q4GBDtxXTmrlzPPppFMkhr8HdmVNuEShsa4n
         fbJINb91vRVVXwLXhJcIzAH1cRuPVnA7HNto0NbwOdBa58kxO1tanAKxrRc8x53wjMEv
         rtFg==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       dkim=pass header.i=@oth-regensburg.de header.s=mta01-20211122 header.b=ITihJK4s;
       spf=pass (google.com: domain of ralf.ramsauer@oth-regensburg.de designates 2001:638:a01:1096::11 as permitted sender) smtp.mailfrom=ralf.ramsauer@oth-regensburg.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=oth-regensburg.de
Received: from mta01.hs-regensburg.de (mta01.hs-regensburg.de. [2001:638:a01:1096::11])
        by gmr-mx.google.com with ESMTPS id 65-20020a1c1944000000b003d090dbdab3si107245wmz.1.2022.12.13.05.47.23
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 Dec 2022 05:47:23 -0800 (PST)
Received-SPF: pass (google.com: domain of ralf.ramsauer@oth-regensburg.de designates 2001:638:a01:1096::11 as permitted sender) client-ip=2001:638:a01:1096::11;
Received: from E16S03.hs-regensburg.de (e16s03.hs-regensburg.de [IPv6:2001:638:a01:8013::93])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(Client CN "E16S03", Issuer "E16S03" (not verified))
	by mta01.hs-regensburg.de (Postfix) with ESMTPS id 4NWftz2jlFzxr7;
	Tue, 13 Dec 2022 14:47:23 +0100 (CET)
Received: from [IPV6:2001:638:a01:8068:f8d9:f11a:f164:a35a]
 (2001:638:a01:8013::226) by E16S03.hs-regensburg.de (2001:638:a01:8013::93)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.16; Tue, 13 Dec
 2022 14:47:22 +0100
Message-ID: <8bf22a0b-ec26-5974-e942-c5a0ebc9a028@oth-regensburg.de>
Date: Tue, 13 Dec 2022 14:47:21 +0100
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
From: Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>
In-Reply-To: <01dfb141-0e4f-4adc-939f-c7a0c145c055n@googlegroups.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: quoted-printable
X-Originating-IP: [2001:638:a01:8013::226]
X-ClientProxiedBy: E16S03.hs-regensburg.de (2001:638:a01:8013::93) To
 E16S03.hs-regensburg.de (2001:638:a01:8013::93)
X-Original-Sender: ralf.ramsauer@oth-regensburg.de
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass
 header.i=@oth-regensburg.de header.s=mta01-20211122 header.b=ITihJK4s;
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

Please reply-to-all, then your reply will also pop up in my Inbox.

On 10/12/2022 08:52, Rasty Slutsker wrote:
> Hi,
> We did some performance measurements.
> Added counters in 3 places (per Irq source)
> 1. entry to jailhouse ISR
> 2. dispatch of interrupt to particular vector to particular core
> 3. in RTOS isr.

Okay. How do you read and dump them? I hope after everything is done.

Take care that if you dump them immediately to the uart, this will=20
consume a lot of time and cause significant delay. ('heavy' printk logic=20
+ busy waiting for the uart)

>=20
> *We see that all 3 counters have the same value*, but we measure time=20

huh? What counters do you access? There's something odd if they hold the=20
same value at different places.

> gaps in RTOS in ISR invocation times, sometimes upto 60 uSec.
>=20
> It means that either
> a) interrupt request is lost. But, according to setup it is=20
> edge-triggered, it cannot be lost, just delayed.
> b) there is a delay of more than 60 usec in jailhouse ISR.
>=20
> questions:
> 1. Is it possible that jailhouse interrupt dispatching routine enters=20
> some loop that takes considerable amount of time?

If you use printk during dispatching for debugging - yes. Otherwise, I=20
guess no. Not 60=C2=B5s.

> 2. What would be explanation of interrupt latency of 60 Secs? Even if we=
=20
> take into account cache line refill we get much lower number, which do=20
> not reach tens uSecs.

Ack, I would definitely not expect 60=C2=B5s delay for IRQ reinjection.

Thanks
   Ralf

>=20
> Best regards
> Rasty
>=20
>=20
>=20
>=20
>=20
> On Tuesday, December 6, 2022 at 6:01:20 PM UTC+2 Ralf Ramsauer wrote:
>=20
>     Hi,
>=20
>     On 05/12/2022 17:30, Rasty Slutsker wrote:
>      > Hi Ralf,
>      > Thank you for the answer.
>      > We have periodic interrupt each 30 u(!)Sec. Linux cannot deal
>     with such
>      > rate, so we need hypervisor/RTOS.
>=20
>     I understand.
>=20
>      > We managed to read a code of hypervisor. It appears that all
>     interrupts
>      > to all cores are intercepted by hypervisor and then forwarded to
>     guests
>      > (per core).
>=20
>     Yes, exactly, that's the case if you don't have SDEI. If you have a
>     platform that would come with SDEI, then you have of course less
>     overhead.
>=20
>      > If we reduce interrupt priority of mentioned interrupt (as you
>     suggest)
>      > we lose even more interrupts, even without stress.
>      > Interrupt is defined as edge triggered, I assumed that it is
>     memorized
>      > by gic until serviced.
>      > Is it possible that Hypervisor acknowledges pending interrupt whil=
e
>      > servicing interrupt from another source ? Kind of race - 2
>     interrupts
>      > for 2 cores arrive nearly simultaneously. One is lost.
>=20
>     The EOIR and IAR registers of the GIC are core-local registers of the
>     GIC CPU interface (GICC), so I wonder how this should cause a race,
>     unless there isn't a hard logical mistake in the code, which I doubt.
>=20
>=20
>     What you could try to do for debugging purposes:
>=20
>     1. Slow down from 30=C2=B5s to something sloooower, which you can han=
dle
>     even under load. Say 100=C2=B5s, 500=C2=B5s, something like that.
>=20
>     2. Measure the jitter x between arrival of the interrupt, and final
>     acknowledgement in your RTOS. You can use performance monitoring
>     registers, or watch CPU cycle counters, whatever. Repeat the
>     measurement, w/ load and w/o load on Linux-side.
>=20
>     3. If max(x) >=3D 30=C2=B5s, then you know where your IRQs go in case=
 of a
>     periodic cycle of 30=C2=B5s.
>=20
>=20
>     Reason: What I did some while ago, is measuring the Jitter of
>     Linux+Jailhouse on ARM systems with cyclictest. On a Jetson TX1
>     platform, for example, we saw Jitter up 50=C2=B5s. So there's IRQ
>     reinjection, a full Linux stack and some userspace application
>     involved,
>     so three context switches and lots of code. You have probably two
>     context switches and less code, as you use a RTOS, but I think
>     there's a
>     certain chance to exceed 30=C2=B5s.
>=20
>     What my gut feeling tells me is that you manage to hold those 30=C2=
=B5s if
>     Linux is quiet. As soon as there's some stress on the system bus, and
>     even on shared caches, you exceed you deadline.
>=20
>     Thanks
>     Ralf
>=20
>      >
>      > Best regards
>      > Rasty
>      >
>      > On Monday, December 5, 2022 at 5:14:37 PM UTC+2 Ralf Ramsauer wrot=
e:
>      >
>      > Hi Nir,
>      >
>      > On 29/11/2022 14:21, nirge...@gmail.com wrote:
>      > > Hi there,
>      > >
>      > > Our target is Sitara AM5726 , CortexA15 dual core on which we ar=
e
>      > > running Linux on A15 core0 and RTOS on core1.
>      > >
>      > > __
>      > >
>      > > RTOS gets periodic interrupt from external hardware via nirq1 pi=
n
>      > > (dedicated input into ARM gic).____
>      > >
>      > > Under heavy load in Linux (core 0!), RTOS, which runs on core1
>      > misses
>      > > interrupts.____
>      >
>      > Uhm. Can you reconstruct that issue w/o Jailhouse under Linux?
>      >
>      > I mean, can you set the SMP affinity of that IRQ to core 1 under
>     Linux,
>      > and then write some test application running on core 1 that just
>      > receives the IRQ. If that issue happens under Linux as well, then
>     you
>      > know that the issue has probably nothing to do with Jailhouse.
>      >
>      >
>      > What also might happen: If there's enough pressure on the shared
>     system
>      > bus when Linux is under load, then you simply loose those IRQs as
>     the
>      > RTOS doesn't have enough time to handle it. You can test this
>      > hypothesis
>      > if you lower the frequency of the the periodic interrupt. If you
>     still
>      > loose IRQs, then this should not be the case.
>      >
>      > >
>      > > Questions____
>      > >
>      > > 1. Does linux/hypervisor participate in interrupt
>      > scheduling/forwarding
>      > > to cell on Core1____
>      >
>      > Linux: No, Linux does not participate in anything that is going
>     on on
>      > CPU 1. That's the idea behind Jailhouse.
>      >
>      > Jailhouse: Maybe. On ARM platforms, Jailhouse needs to reinject th=
e
>      > Interrupt from the hypervisor to the guest, if SDEI is not
>     available.
>      > Does the Sitara come with support for SDEI support?
>      >
>      > (You can btw monitor the exits of the hypervisor with 'jailhouse
>     cell
>      > stats')
>      >
>      > Ralf
>      >
>      > > 2. Is there a description of interrupt forwarding/virtualization
>      > scheme
>      > > to cores (if exists)? Any pointer to document/source code would =
be
>      > > appreciated.
>      > >
>      > > Thanks a lot,
>      > >
>      > > Nir.
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
>     https://groups.google.com/d/msgid/jailhouse-dev/fde55f66-2e83-4df2-8f=
5e-44b0fb831acbn%40googlegroups.com <https://groups.google.com/d/msgid/jail=
house-dev/fde55f66-2e83-4df2-8f5e-44b0fb831acbn%40googlegroups.com> <https:=
//groups.google.com/d/msgid/jailhouse-dev/fde55f66-2e83-4df2-8f5e-44b0fb831=
acbn%40googlegroups.com <https://groups.google.com/d/msgid/jailhouse-dev/fd=
e55f66-2e83-4df2-8f5e-44b0fb831acbn%40googlegroups.com>> <https://groups.go=
ogle.com/d/msgid/jailhouse-dev/fde55f66-2e83-4df2-8f5e-44b0fb831acbn%40goog=
legroups.com?utm_medium=3Demail&utm_source=3Dfooter <https://groups.google.=
com/d/msgid/jailhouse-dev/fde55f66-2e83-4df2-8f5e-44b0fb831acbn%40googlegro=
ups.com?utm_medium=3Demail&utm_source=3Dfooter> <https://groups.google.com/=
d/msgid/jailhouse-dev/fde55f66-2e83-4df2-8f5e-44b0fb831acbn%40googlegroups.=
com?utm_medium=3Demail&utm_source=3Dfooter <https://groups.google.com/d/msg=
id/jailhouse-dev/fde55f66-2e83-4df2-8f5e-44b0fb831acbn%40googlegroups.com?u=
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
>     https://groups.google.com/d/msgid/jailhouse-dev/9f1616c7-ac5f-49de-bc=
24-8bd8520f4c07n%40googlegroups.com <https://groups.google.com/d/msgid/jail=
house-dev/9f1616c7-ac5f-49de-bc24-8bd8520f4c07n%40googlegroups.com> <https:=
//groups.google.com/d/msgid/jailhouse-dev/9f1616c7-ac5f-49de-bc24-8bd8520f4=
c07n%40googlegroups.com?utm_medium=3Demail&utm_source=3Dfooter <https://gro=
ups.google.com/d/msgid/jailhouse-dev/9f1616c7-ac5f-49de-bc24-8bd8520f4c07n%=
40googlegroups.com?utm_medium=3Demail&utm_source=3Dfooter>>.
>=20
> --=20
> You received this message because you are subscribed to the Google=20
> Groups "Jailhouse" group.
> To unsubscribe from this group and stop receiving emails from it, send=20
> an email to jailhouse-dev+unsubscribe@googlegroups.com=20
> <mailto:jailhouse-dev+unsubscribe@googlegroups.com>.
> To view this discussion on the web visit=20
> https://groups.google.com/d/msgid/jailhouse-dev/01dfb141-0e4f-4adc-939f-c=
7a0c145c055n%40googlegroups.com <https://groups.google.com/d/msgid/jailhous=
e-dev/01dfb141-0e4f-4adc-939f-c7a0c145c055n%40googlegroups.com?utm_medium=
=3Demail&utm_source=3Dfooter>.

--=20
You received this message because you are subscribed to the Google Groups "=
Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/=
jailhouse-dev/8bf22a0b-ec26-5974-e942-c5a0ebc9a028%40oth-regensburg.de.
