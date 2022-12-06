Return-Path: <jailhouse-dev+bncBDUOFW62WYFBBT6OXWOAMGQEJQ3LUHI@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-lj1-x23e.google.com (mail-lj1-x23e.google.com [IPv6:2a00:1450:4864:20::23e])
	by mail.lfdr.de (Postfix) with ESMTPS id 2A2F2644885
	for <lists+jailhouse-dev@lfdr.de>; Tue,  6 Dec 2022 17:01:21 +0100 (CET)
Received: by mail-lj1-x23e.google.com with SMTP id m4-20020a2ea584000000b0027a02705679sf1916158ljp.4
        for <lists+jailhouse-dev@lfdr.de>; Tue, 06 Dec 2022 08:01:21 -0800 (PST)
ARC-Seal: i=2; a=rsa-sha256; t=1670342480; cv=pass;
        d=google.com; s=arc-20160816;
        b=flApKiacHuk+FuQJ/k805NT2MEK64pydmECEgC0rt6To98nyvdssee+syDotvqdyuh
         D3CxAORRx2/2YprmqStfj+Uq1pHp5vOT12bLIYXPxb2s2BMue8WK/poCaeluhS9Mu0Sj
         atyQknA5llnDOPAKWGNtor5vk+2kKhtBNreSzSwDmPiTS6leUGjBqixfXddAOlEytWbG
         VOaSYamo2a5r9s+lGQeQw7q1641f8trlYQCSy7cxfPqEoIVp9MFOQxOnrbhZcd1FHuPh
         3h5UrBpRr6zpF+rBogKMge8PHlH9D2eES7fdBRlWS5uJJBn+eFJpVETH6Mx7VKDtRSqW
         CgNA==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:content-transfer-encoding
         :in-reply-to:from:references:to:content-language:subject:user-agent
         :mime-version:date:message-id:sender:dkim-signature;
        bh=8pnC+xWCPWreelzdv01y6RzjvHPHEFhFmOCpMuIrNvM=;
        b=JOfekJuVTamX+zRbr4uw7t32YFFRfpvpAdsryyzY1QmjXhCwJMkIMHU8LRY9NrDFEU
         6M4F7WA1GgshIXUSy5lUk9Wz/hwzNBIlzopZO1dui8JN2mF4tDbny7Le5VFmJGgoJ5f5
         YOin804Ek9ZTq1gIQgh5xD9YaCaMQX1VeyylNNLLSTy8AV/VtxTD+DcDA7fFRvdpjeEf
         Y68Gom4b4SignA7httWcrn5/fpL52zLWznqSn4GJ5Sc5BJHhatGSuagCVN6nv1c+kNPC
         rNG/sRGMHFA41GvsG2B+ldDQdG7jAnaVSAktTBLkr7JknGH+oWAQUz8quhq+A6crXdrU
         aDAQ==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass header.i=@oth-regensburg.de header.s=mta01-20211122 header.b=ar7KBFUC;
       spf=pass (google.com: domain of ralf.ramsauer@oth-regensburg.de designates 2001:638:a01:1096::11 as permitted sender) smtp.mailfrom=ralf.ramsauer@oth-regensburg.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=oth-regensburg.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20210112;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:x-original-authentication-results
         :x-original-sender:content-transfer-encoding:in-reply-to:from
         :references:to:content-language:subject:user-agent:mime-version:date
         :message-id:sender:from:to:cc:subject:date:message-id:reply-to;
        bh=8pnC+xWCPWreelzdv01y6RzjvHPHEFhFmOCpMuIrNvM=;
        b=jHmxaCqwhEbN6c9UweR7OuCvOQtyVupgCQINHW7kljvz1nhopXuzTAdOfRGrG2N3ai
         V0HKNNx3Bpaqjw/1xqMWmOIfIG593ip4uh7i5giQVVyjSZBdd+6i1278Hj2wAzsut0lr
         zKhsuAILIpq3BXv7ev5BDIz5IA/UPvQt95FSCJlt8A6nvcWFpVUmdu69g24q6FVxxw1Q
         Q8QeJ0Oh2ueASLl/e9xDt+tUU4wW5wXF9DQcVMu+QJbovl4Po4LkxzX2B2lwsPQAvSNo
         qZ+RaE4cIMlapZ6Qvyr9b1D+/9dXxBlARTkWRbImDYQRhovkMT6bu2YE6LmJFclmP/pu
         dtvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :x-spam-checked-in-group:list-id:mailing-list:precedence
         :x-original-authentication-results:x-original-sender
         :content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:sender:from:to:cc:subject:date:message-id
         :reply-to;
        bh=8pnC+xWCPWreelzdv01y6RzjvHPHEFhFmOCpMuIrNvM=;
        b=PiTgCaAJQZWQDcBmtQTx0AgdtslIPAhsKuToqhptToe8uEvSht+rbmo0fpghE+2Xis
         0JRJ304XoZGjciPVhCVN5BXRx/B0bJlBHLNngJtZ1X8amxqYqJqrwowKiuXMdej7uN8L
         6T8p7QgZ6A1nV8wCVO8stPp0y0o80tPD0ukfM/DSpRqJC1P1xx8mAJUWG25Ovt8/U+nD
         Fc2T+Imz9NFcKqZavsazeG5i60bTSXo54J6tU+M93rjCVa4iSZBm31SZaVbAjDyK9oN3
         +wHoORHlxPf6T9w1EN99jN/8bJqPRU78ZMumNn/FMHiFnkssN3A1CYG+elgaY6etpDYK
         hn5Q==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: ANoB5pm+AdEqHNgtHBZDXUlseehjvm8IEoiXOsMB7rEymyvbICq7e2Ez
	/PjYpr9LsI8DMvQZ+YKfcJA=
X-Google-Smtp-Source: AA0mqf53Ad8ObhedXPjprHqWhf09HUPaLdDdUwxEkjLRyxYFOFliDMb4xsAo/bRlIRERPybZppZ93Q==
X-Received: by 2002:a05:651c:c8b:b0:277:f8b:bb4f with SMTP id bz11-20020a05651c0c8b00b002770f8bbb4fmr23388457ljb.161.1670342480262;
        Tue, 06 Dec 2022 08:01:20 -0800 (PST)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a05:6512:3457:b0:4b5:3cdf:5a65 with SMTP id
 j23-20020a056512345700b004b53cdf5a65ls3476210lfr.2.-pod-prod-gmail; Tue, 06
 Dec 2022 08:01:18 -0800 (PST)
X-Received: by 2002:ac2:5e61:0:b0:4a2:48c1:455f with SMTP id a1-20020ac25e61000000b004a248c1455fmr21950941lfr.96.1670342478145;
        Tue, 06 Dec 2022 08:01:18 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1670342478; cv=none;
        d=google.com; s=arc-20160816;
        b=KwAo9vINhXF8pLMUC8v0NfiaOKcTNZG7NHudhC4YzGD65CbObMbWZC7OlOusPvoDRU
         x3MYp9bc7U+dFDmM/i2xSkl0mX/eds3fz3dl/glk825yehRNEW36TPmGkvP3km0gqore
         Z8bdVF7UIYGKOFVuhwj0QGTh047sMecGmh6Me4+IKlWgN9O7MobVubdqHUGN9Hski3dB
         fsgFbCG7FPHdsF1TAGI7R9mdUC09NNiqoT0TjyBPGYpHcNkIdp9kdoldSknB/AlVoa9m
         HSGZd+DJKrH4ISvW/K0pdNBX02mGPg2Hf/9e/KdTMDibO0zIj1JCmXuAoTtJnXHLST5r
         Ob4w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=xqKslr00/etgG/K1yxSKMIR6ANGSdnH3pXg33EhAodc=;
        b=WVNMdI/6RrsXlmZcXDuOjpf8buLM1xr3cG6lQ0Ln2FDqt91vUxStW549dTHResw81U
         r/KPUj9IMJkpVDUU2rpCC6fO0s7zr0VDiZo2Avel1RuOQEf7I/ba1NanF4tz7bA0BUDr
         xkwgMfRzbNqKfXFbwLRkKUCHO37ZBVWrQKWcY+rwducFvyOOIL/NwVYoh1/Z86qfyBuD
         6aejhzpX7GN5JJ8UBLbXf02Izqumz52k6n8qllj5+PIsEtQJriZuVWVXxc1QVuqyZZJ7
         6gcxKdVL5SiDxvDIIW5ujLq0g4H1y5A8PUTGocJXekVuyoGsLpGquClFFqkXCP/HFj1H
         WUcQ==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       dkim=pass header.i=@oth-regensburg.de header.s=mta01-20211122 header.b=ar7KBFUC;
       spf=pass (google.com: domain of ralf.ramsauer@oth-regensburg.de designates 2001:638:a01:1096::11 as permitted sender) smtp.mailfrom=ralf.ramsauer@oth-regensburg.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=oth-regensburg.de
Received: from mta01.hs-regensburg.de (mta01.hs-regensburg.de. [2001:638:a01:1096::11])
        by gmr-mx.google.com with ESMTPS id c19-20020a056512075300b0048b38f379d7si768606lfs.0.2022.12.06.08.01.17
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 06 Dec 2022 08:01:17 -0800 (PST)
Received-SPF: pass (google.com: domain of ralf.ramsauer@oth-regensburg.de designates 2001:638:a01:1096::11 as permitted sender) client-ip=2001:638:a01:1096::11;
Received: from E16S03.hs-regensburg.de (e16s03.hs-regensburg.de [IPv6:2001:638:a01:8013::93])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(Client CN "E16S03", Issuer "E16S03" (not verified))
	by mta01.hs-regensburg.de (Postfix) with ESMTPS id 4NRQBj0MCczy6H;
	Tue,  6 Dec 2022 17:01:17 +0100 (CET)
Received: from [IPV6:2001:638:a01:8068:f8d9:f11a:f164:a35a]
 (2001:638:a01:8013::226) by E16S03.hs-regensburg.de (2001:638:a01:8013::93)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.16; Tue, 6 Dec
 2022 17:01:16 +0100
Message-ID: <b538dfcd-0431-58d7-dd05-60205acc2c06@oth-regensburg.de>
Date: Tue, 6 Dec 2022 17:01:16 +0100
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
From: Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>
In-Reply-To: <9f1616c7-ac5f-49de-bc24-8bd8520f4c07n@googlegroups.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: quoted-printable
X-Originating-IP: [2001:638:a01:8013::226]
X-ClientProxiedBy: E16S04.hs-regensburg.de (2001:638:a01:8013::94) To
 E16S03.hs-regensburg.de (2001:638:a01:8013::93)
X-Original-Sender: ralf.ramsauer@oth-regensburg.de
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass
 header.i=@oth-regensburg.de header.s=mta01-20211122 header.b=ar7KBFUC;
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

Hi,

On 05/12/2022 17:30, Rasty Slutsker wrote:
> Hi Ralf,
> Thank you for the answer.
> We have periodic interrupt each 30 u(!)Sec. Linux cannot deal with such=
=20
> rate, so we need hypervisor/RTOS.

I understand.

> We managed to read a code of hypervisor. It appears that all interrupts=
=20
> to all cores are intercepted by hypervisor and then forwarded to guests=
=20
> (per core).

Yes, exactly, that's the case if you don't have SDEI. If you have a=20
platform that would come with SDEI, then you have of course less overhead.

> If we reduce interrupt priority of mentioned interrupt (as you suggest)=
=20
> we lose even more interrupts, even without stress.
> Interrupt is defined as edge triggered, I assumed that it is memorized=20
> by gic until serviced.
> Is it possible that Hypervisor acknowledges pending interrupt while=20
> servicing interrupt from another source ? Kind of race - 2 interrupts=20
> for 2 cores arrive nearly simultaneously. One is lost.

The EOIR and IAR registers of the GIC are core-local registers of the=20
GIC CPU interface (GICC), so I wonder how this should cause a race,=20
unless there isn't a hard logical mistake in the code, which I doubt.


What you could try to do for debugging purposes:

1. Slow down from 30=C2=B5s to something sloooower, which you can handle
    even under load. Say 100=C2=B5s, 500=C2=B5s, something like that.

2. Measure the jitter x between arrival of the interrupt, and final
    acknowledgement in your RTOS. You can use performance monitoring
    registers, or watch CPU cycle counters, whatever. Repeat the
    measurement, w/ load and w/o load on Linux-side.

3. If max(x) >=3D 30=C2=B5s, then you know where your IRQs go in case of a
    periodic cycle of 30=C2=B5s.


Reason: What I did some while ago, is measuring the Jitter of=20
Linux+Jailhouse on ARM systems with cyclictest. On a Jetson TX1=20
platform, for example, we saw Jitter up 50=C2=B5s. So there's IRQ=20
reinjection, a full Linux stack and some userspace application involved,=20
so three context switches and lots of code. You have probably two=20
context switches and less code, as you use a RTOS, but I think there's a=20
certain chance to exceed 30=C2=B5s.

What my gut feeling tells me is that you manage to hold those 30=C2=B5s if=
=20
Linux is quiet. As soon as there's some stress on the system bus, and=20
even on shared caches, you exceed you deadline.

Thanks
   Ralf

>=20
> Best regards
> Rasty
>=20
> On Monday, December 5, 2022 at 5:14:37 PM UTC+2 Ralf Ramsauer wrote:
>=20
>     Hi Nir,
>=20
>     On 29/11/2022 14:21, nirge...@gmail.com wrote:
>      > Hi there,
>      >
>      > Our target is Sitara AM5726 , CortexA15 dual core on which we are
>      > running Linux on A15 core0 and RTOS on core1.
>      >
>      > __
>      >
>      > RTOS gets periodic interrupt from external hardware via nirq1 pin
>      > (dedicated input into ARM gic).____
>      >
>      > Under heavy load in Linux (core 0!), RTOS, which runs on core1
>     misses
>      > interrupts.____
>=20
>     Uhm. Can you reconstruct that issue w/o Jailhouse under Linux?
>=20
>     I mean, can you set the SMP affinity of that IRQ to core 1 under Linu=
x,
>     and then write some test application running on core 1 that just
>     receives the IRQ. If that issue happens under Linux as well, then you
>     know that the issue has probably nothing to do with Jailhouse.
>=20
>=20
>     What also might happen: If there's enough pressure on the shared syst=
em
>     bus when Linux is under load, then you simply loose those IRQs as the
>     RTOS doesn't have enough time to handle it. You can test this
>     hypothesis
>     if you lower the frequency of the the periodic interrupt. If you stil=
l
>     loose IRQs, then this should not be the case.
>=20
>      >
>      > Questions____
>      >
>      > 1. Does linux/hypervisor participate in interrupt
>     scheduling/forwarding
>      > to cell on Core1____
>=20
>     Linux: No, Linux does not participate in anything that is going on on
>     CPU 1. That's the idea behind Jailhouse.
>=20
>     Jailhouse: Maybe. On ARM platforms, Jailhouse needs to reinject the
>     Interrupt from the hypervisor to the guest, if SDEI is not available.
>     Does the Sitara come with support for SDEI support?
>=20
>     (You can btw monitor the exits of the hypervisor with 'jailhouse cell
>     stats')
>=20
>     Ralf
>=20
>      > 2. Is there a description of interrupt forwarding/virtualization
>     scheme
>      > to cores (if exists)? Any pointer to document/source code would be
>      > appreciated.
>      >
>      > Thanks a lot,
>      >
>      > Nir.
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
>     https://groups.google.com/d/msgid/jailhouse-dev/fde55f66-2e83-4df2-8f=
5e-44b0fb831acbn%40googlegroups.com <https://groups.google.com/d/msgid/jail=
house-dev/fde55f66-2e83-4df2-8f5e-44b0fb831acbn%40googlegroups.com> <https:=
//groups.google.com/d/msgid/jailhouse-dev/fde55f66-2e83-4df2-8f5e-44b0fb831=
acbn%40googlegroups.com?utm_medium=3Demail&utm_source=3Dfooter <https://gro=
ups.google.com/d/msgid/jailhouse-dev/fde55f66-2e83-4df2-8f5e-44b0fb831acbn%=
40googlegroups.com?utm_medium=3Demail&utm_source=3Dfooter>>.
>=20
> --=20
> You received this message because you are subscribed to the Google=20
> Groups "Jailhouse" group.
> To unsubscribe from this group and stop receiving emails from it, send=20
> an email to jailhouse-dev+unsubscribe@googlegroups.com=20
> <mailto:jailhouse-dev+unsubscribe@googlegroups.com>.
> To view this discussion on the web visit=20
> https://groups.google.com/d/msgid/jailhouse-dev/9f1616c7-ac5f-49de-bc24-8=
bd8520f4c07n%40googlegroups.com <https://groups.google.com/d/msgid/jailhous=
e-dev/9f1616c7-ac5f-49de-bc24-8bd8520f4c07n%40googlegroups.com?utm_medium=
=3Demail&utm_source=3Dfooter>.

--=20
You received this message because you are subscribed to the Google Groups "=
Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/=
jailhouse-dev/b538dfcd-0431-58d7-dd05-60205acc2c06%40oth-regensburg.de.
