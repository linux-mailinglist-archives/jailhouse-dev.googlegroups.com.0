Return-Path: <jailhouse-dev+bncBDUOFW62WYFBBX66RKEQMGQES2GBJRI@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-wm1-x33a.google.com (mail-wm1-x33a.google.com [IPv6:2a00:1450:4864:20::33a])
	by mail.lfdr.de (Postfix) with ESMTPS id 812553F416B
	for <lists+jailhouse-dev@lfdr.de>; Sun, 22 Aug 2021 22:11:12 +0200 (CEST)
Received: by mail-wm1-x33a.google.com with SMTP id n20-20020a05600c4f9400b002e6dc6a99b9sf3890103wmq.1
        for <lists+jailhouse-dev@lfdr.de>; Sun, 22 Aug 2021 13:11:12 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1629663072; cv=pass;
        d=google.com; s=arc-20160816;
        b=rKLTXtxldDncdYmWVzMcgp30yW3og05a6qtKN7mMvg9NLawu7586At5j07nL8xwq0H
         X+K0OkJcJXIapErpR0sK2b0hDTVUizXhAH2JDouWanvPj1JejmWh2bJWA/pYVEIoYA+m
         G/ZdjS1bwQzqTHj0e8twzA9e/noRBBNjI4yhEoka/T0Mm8tBPQDowGBkETOhR51dd1eS
         qBJSNilgQVS/g5XUNhXJ58qEfJGqhTNHKuPBmfm15D/EUvPwspGL6O/nXXDQBVkXk33m
         0kFDx8RXGOoUzl3++16GNhL8tGH9iBqdVhvd/+68uE5shUfPAcydCfzRgd97bqPJBE0v
         3xKw==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject:sender:dkim-signature;
        bh=YSk6KEFif5xcIZ6JoXKEu9EdV95xo7HZnaBh7rfAUfo=;
        b=NKsDPL6NKiAtxZGwIDwm47sTJd1hnvuvnqY4Cnf3MWHSt7v36/V1CXHgUobKA/Wadz
         f0NhzGpLoHD3gZu4E/J5elbEKgml4TeNUIBuKQj9QrbQDihBg/Vq0qM9LkAUCqiqCZjY
         gN+OdoYTagdGr4NNt7vmxILCIaiGgc+2wxjw1o8/0eas0Q5Iu2/+37dMDcgQm8gyv76r
         v0uxw9ziC+jaVH2Zbimr7BBQGaMb9xp8sekpIM05whjuJFXgZ/39PuYaL+HQrf4TVUrV
         bd8djhKrI40kt5k1OGCsWl6mQ1UJ5XV4BBjp1md606XNJMWnX5QEIkP/G3phl5D7iUxA
         gL3A==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass header.i=@oth-regensburg.de header.s=mta01-20160622 header.b=aOgPk+M7;
       spf=pass (google.com: domain of ralf.ramsauer@oth-regensburg.de designates 2001:638:a01:1096::12 as permitted sender) smtp.mailfrom=ralf.ramsauer@oth-regensburg.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=oth-regensburg.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20210112;
        h=sender:subject:to:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding
         :x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=YSk6KEFif5xcIZ6JoXKEu9EdV95xo7HZnaBh7rfAUfo=;
        b=dFWXBqsDOoRhEOadKp+hqOLzsEy6h8qV29fxWCKIuOABARUT8EjXaokNL5aaHR7ltj
         WJaoCByTCs8tJqkE45vXeV/12jgUA4KrGDmASFz8oOBl+avw6PGdf5xnKciqeIE02HVH
         cuii57Px71jhjW3sNJS5XkX8cqzCA1eOkr5OABXs6ScJ0sIKXwoTV3++fXRvTWhROcj/
         t9ZYQXMavSmKDLSZ0HkOc+eTbN2kE1kSu0wcwC8QwW/Z2WqI4+UdXtrZWcTntbfzmeCW
         NjbwEjBitrxCF4t1nzP6ClPIVLL0BGHazC07bbIQTlqGW7GwGPann+G77RRq9LU+ZThv
         ekxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:subject:to:references:from:message-id
         :date:user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :x-spam-checked-in-group:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=YSk6KEFif5xcIZ6JoXKEu9EdV95xo7HZnaBh7rfAUfo=;
        b=J9p9g/0tHMRSVZ6U41E/9TNFHX7IN0dQ5H4+amP6A7MTElBZ7Bhl1IAQUY5ZOMn75x
         +cEo6pubJTqZyApmvZ++k2bwO2N891vBlB/V4vJZzF4P44FxPnOYfmJEFSnfQglZvdKF
         gqFkRUjX0OEuySuz3gNsbb8MRuFiOdmSkIqAAb8lRCLQMtyDGeL19BnjgDc7kEqrSBhS
         bTwD4VkOzBO4fCUUORMPMpNmfxdiXY/kiEGR/P7d6XBM7FYvgi5sEGdMSPTTPfx1fzJO
         PJUWji1LTCMhjl06TukBfhc/J0vwAOxNR9UCKEn4CFmOR2yBHcsZWpeidwUZkPp5+4CA
         CXIw==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AOAM530yzxYFsN3aWoKjMMKRmPnjU+Zmq+INnQSwxxvUunvSII2Z440q
	S0yggYCgNUzUPAj22F2qagM=
X-Google-Smtp-Source: ABdhPJyUKwFmk96v6ua3DGCtf7EH2F7XNB2aFrb9X1g0ljeHqIG7lYZVx6TJno8D0mYYYpJSKVfELg==
X-Received: by 2002:a1c:e912:: with SMTP id q18mr13458336wmc.21.1629663072117;
        Sun, 22 Aug 2021 13:11:12 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a5d:4a43:: with SMTP id v3ls4138865wrs.2.gmail; Sun, 22 Aug
 2021 13:11:11 -0700 (PDT)
X-Received: by 2002:a5d:5642:: with SMTP id j2mr7779961wrw.264.1629663070891;
        Sun, 22 Aug 2021 13:11:10 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1629663070; cv=none;
        d=google.com; s=arc-20160816;
        b=Lbyly+B5Jefz5Hlb8sILQvfzgEWeIfdHmC3tuHDAp//MtEroTlIpekIPElbPArurZ5
         JctdZCji02iju0Oi/1BBYfGGxQfolNIm6aq1Mp4hDq2FukS3rHhYjZDV83FmDGTYUmMM
         tKfaPy3LWNKty6Wc+V9kW0Nn3P1I/LoNCk0ERoWce62p+R8PLrARB9mn0UkyMvfGcTwP
         PxbbA56MUUNEiikDOS2I0rOFdCXSbucPwRPweME+iQcyUHz4heEHJomg820rrjQVidzT
         3ruyAlHzgukld1FnOeSLZhcgB7N+InRgQl0fBP2C9/ZKdWXldxodjFL/VWQg+z+wZuOd
         dWoA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:to:subject
         :dkim-signature;
        bh=J9+3HhmXr/LgHpaTPgUelq9xSv9r/dRxqIYBwsosNzo=;
        b=zrW8erNpjwS8mCwvhJJPRcEP1n1FYLuhhNLH+yfIrxLYG59RtntihwBfOQS5/jAtbA
         CPXYzy0Wig69zKMMo2/nWMY+8J4DLN2lTy0tLAUlVyoNZEMX3O29G8+1t9ncc/tUE1Qr
         wflLW7nipnM9oT/JkmOElseWvLnebryYLTgt9giIKZvvnqi4Xo4YXDt2NYkKZl2rGkr9
         ywafqqeejlTUTaKcnArC263eS/kEPGNetStn6n8XDIdFAo9MVT+bGmgnmivV+gGR825W
         sN5JOchpCcmAkLwcKS4wFPzVlHhqrAFIZ6cMVBBMdhNigGPpsEzp2iQHgRJEQ09hUYI9
         oFGg==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       dkim=pass header.i=@oth-regensburg.de header.s=mta01-20160622 header.b=aOgPk+M7;
       spf=pass (google.com: domain of ralf.ramsauer@oth-regensburg.de designates 2001:638:a01:1096::12 as permitted sender) smtp.mailfrom=ralf.ramsauer@oth-regensburg.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=oth-regensburg.de
Received: from mta02.hs-regensburg.de (mta02.hs-regensburg.de. [2001:638:a01:1096::12])
        by gmr-mx.google.com with ESMTPS id s12si913777wmh.3.2021.08.22.13.11.10
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Sun, 22 Aug 2021 13:11:10 -0700 (PDT)
Received-SPF: pass (google.com: domain of ralf.ramsauer@oth-regensburg.de designates 2001:638:a01:1096::12 as permitted sender) client-ip=2001:638:a01:1096::12;
Received: from E16S03.hs-regensburg.de (e16s03.hs-regensburg.de [IPv6:2001:638:a01:8013::93])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(Client CN "E16S03", Issuer "E16S03" (not verified))
	by mta02.hs-regensburg.de (Postfix) with ESMTPS id 4Gt62Q3RSWzyF7;
	Sun, 22 Aug 2021 22:11:10 +0200 (CEST)
Received: from [172.23.3.46] (194.95.106.138) by E16S03.hs-regensburg.de
 (2001:638:a01:8013::93) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2242.12; Sun, 22 Aug
 2021 22:11:10 +0200
Subject: Re: Editing Inmate to add GPIO for Raspberry Pi4
To: Moustafa Nofal <mustafa13e09940@gmail.com>, Jailhouse
	<jailhouse-dev@googlegroups.com>
References: <cd1adc59-e867-4ce1-a6ea-371ae1754cdan@googlegroups.com>
 <434c3e0d-3f9d-cef4-faa8-e94248176db8@oth-regensburg.de>
 <560fff74-e071-4713-a1ec-e29b842f7564n@googlegroups.com>
From: Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>
Message-ID: <a30c722d-4fc3-fd3a-f2c2-5dd80b2d8887@oth-regensburg.de>
Date: Sun, 22 Aug 2021 22:11:07 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <560fff74-e071-4713-a1ec-e29b842f7564n@googlegroups.com>
Content-Type: text/plain; charset="UTF-8"
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable
X-Originating-IP: [194.95.106.138]
X-ClientProxiedBy: E16S02.hs-regensburg.de (2001:638:a01:8013::92) To
 E16S03.hs-regensburg.de (2001:638:a01:8013::93)
X-Original-Sender: ralf.ramsauer@oth-regensburg.de
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass
 header.i=@oth-regensburg.de header.s=mta01-20160622 header.b=aOgPk+M7;
       spf=pass (google.com: domain of ralf.ramsauer@oth-regensburg.de
 designates 2001:638:a01:1096::12 as permitted sender) smtp.mailfrom=ralf.ramsauer@oth-regensburg.de;
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



On 22/08/2021 19:40, Moustafa Nofal wrote:
>=20
>=20
> On Sunday, 22 August 2021 at 15:42:12 UTC+2 Ralf Ramsauer wrote:
>=20
>=20
>=20
>     On 22/08/2021 12:45, Moustafa Nofal wrote:
>     >
>     > Hi,
>     > I build Jailhouse on RPi4 using 5.3 Kernel and it is working nice. =
I
>     > need to toggle a GPIO pin. I tried baremetal code but I figured out=
,
>     > that I must map the peripheral using specifically this function:
>     > p->mem_fd =3D open("/dev/mem", O_RDWR|O_SYNC);
>     > So, I need the following headers to be included:
>     > /*For munmap, MAP_FAILED, MAP_SHARED, PROT_READ, PROT_WRITE*/>
>     #include <sys/mman.h>
>     > /* For open(), creat() */
>     > #include <unistd.h>
>     > /* For O_RDWR */
>     > #include <fcntl.h>
>=20
>     >>Do I understand correctly, that you want those header in your inmat=
e?
>     I am not sure about it, but I needed to know the correct procedure.

Please do _not_ reply with html mails in future. It's almost impossible
to figure out where you exactly responded. And please always reply to all.

>=20
> =C2=A0
>=20
>     > What could be a clean way, to add such headers into jailhouse, I
>     have my
>     > own header-which describes addresses of GPIO registers- added to
>     > /inmates/lib/include, but is there any possible way to add these
>     headers?

Sorry, I think I don't understand the question. Of course, if you have
custom modifications, you can place you headers there.

>=20
>     >That's not the right approach to solve your issue. Having those
>     standard
>     >library functions means that you need tons of logic in your inmate,
>     >including a fully-fledged operating systems.
>=20
>     >What you actually want to do:
>     >0. Pass the GPIO device to the inmate in your cell's config
>     >1. Figure out the memory address of your GPIO controller + pin. For
>     >reference, consider looking at datasheets or device trees.
>=20
>=20
> I have done this in the inmate file, read the datasheet and device tree
> and edited also the .dts file in jailhouse, I wonder, whether it is
> necessary.

The device tree is only required if you use Linux in your inmate. If you
want to use the bare-metal inmate library, then you only need to adjust
the configuration of your inmate.

>=20
>     >2. Map that address to your inmate using map_range()
>     >(instead of opening /dev/mem, there is no semantic at all for device=
s
>     >in our tiny libinmate)
>=20
> =C2=A0
>=20
>     Yes, that was my problem, I tried accessing the registers directly,
>     but it must be mapped first, there are two solutions for this,
>     either using assembly code or use such a function.
>     I did not know about map_range, or whether jailhouse uses it, but I
>     will check and get back to you.

map_range is a routine of libinmate, it /belongs/ to jailhouse. Use "git
grep map_range" to see how it is used.

>     On the other hand, I found mmio_write32() for writing registers, but
>     I could not find the source file. Also timer_start(), I do not know
>     where is the definition of this function.

After you mapped the physical memory, you can then access registers with
mmio_write()-accessors. To find the definition of those routines, just
use git grep:

lib/arm-common/include/inmate.h:static inline void mmio_write32

>     One more question, I think you must have mapped the timer and UART0
>     peripherals, in order to be able to trigger it. I saw the memory

In order to trigger what? What is "it"? :)

>     region structure=C2=A0 in *rpi4-inmate-demo.c *and could understand, =
how
>     could you make it and implemented something similar for the GPIO.=C2=
=A0
>     But where the initialization of the timer and uart, I mean in which
>     file, or how is that made

On arm, libinmate uses the platform timer. Take a look at
inmates/lib/arm-common/timing.c.

>=20
>     >3. directly write to the address
>=20
>     >Other than that, have a look at demos/arm/gic-demo.c or
>     >demos/x86/apic-demo.c. There we have the cmdline argument that allow=
s
>     >for specifying a led-pin, which is nothing else but a GPIO.
>     Yes, this part I understand, but my experience was with
>     ARM-Cortex-M, so I thought I could just write to the register
>     without mapping it. But thanks for the information and would really
>     appreciate, if you could tell in which direction shall I dig.

On ARM, we use virtual memory management for inmates. So you definitely
need a mapping prior to accessing MMIO registers.

HTH,
  Ralf

>=20
>=20
>     >@Jan, BTW, I think I just found a bug in demos/arm/gic-demo.c: Since=
 I
>     >introduced arch_mmu_enable(), I forgot to map physical addresses for
>     >map_range() for the led_reg. Will provide a patch soon=E2=80=A6
>=20
>     >Ralf
>     Best regards,
>     Moustafa Noufale
>     >
>     > Thanks in advance
>     > Moustafa Noufale
>     >
>     > --
>     > You received this message because you are subscribed to the Google
>     > Groups "Jailhouse" group.
>     > To unsubscribe from this group and stop receiving emails from it,
>     send
>     > an email to jailhouse-de...@googlegroups.com
>     > <mailto:jailhouse-de...@googlegroups.com>.
>     > To view this discussion on the web visit
>     >
>     https://groups.google.com/d/msgid/jailhouse-dev/cd1adc59-e867-4ce1-a6=
ea-371ae1754cdan%40googlegroups.com
>     <https://groups.google.com/d/msgid/jailhouse-dev/cd1adc59-e867-4ce1-a=
6ea-371ae1754cdan%40googlegroups.com>
>=20
>     >
>     <https://groups.google.com/d/msgid/jailhouse-dev/cd1adc59-e867-4ce1-a=
6ea-371ae1754cdan%40googlegroups.com?utm_medium=3Demail&utm_source=3Dfooter
>     <https://groups.google.com/d/msgid/jailhouse-dev/cd1adc59-e867-4ce1-a=
6ea-371ae1754cdan%40googlegroups.com?utm_medium=3Demail&utm_source=3Dfooter=
>>.
>=20
>=20
> --=20
> You received this message because you are subscribed to the Google
> Groups "Jailhouse" group.
> To unsubscribe from this group and stop receiving emails from it, send
> an email to jailhouse-dev+unsubscribe@googlegroups.com
> <mailto:jailhouse-dev+unsubscribe@googlegroups.com>.
> To view this discussion on the web visit
> https://groups.google.com/d/msgid/jailhouse-dev/560fff74-e071-4713-a1ec-e=
29b842f7564n%40googlegroups.com
> <https://groups.google.com/d/msgid/jailhouse-dev/560fff74-e071-4713-a1ec-=
e29b842f7564n%40googlegroups.com?utm_medium=3Demail&utm_source=3Dfooter>.

--=20
Mit freundlichen Gr=C3=BC=C3=9Fen

Ralf Ramsauer
Labor f=C3=BCr Digitalisierung
Fakult=C3=A4t f=C3=BCr Informatik und Mathematik

Ostbayerische Technische Hochschule Regensburg
Galgenbergstrasse 32
93053 Regensburg

Tel.: +49 (0)941 943-9267
E-Mail: ralf.ramsauer@oth-regensburg.de
http://www.oth-regensburg.de

--=20
You received this message because you are subscribed to the Google Groups "=
Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/=
jailhouse-dev/a30c722d-4fc3-fd3a-f2c2-5dd80b2d8887%40oth-regensburg.de.
