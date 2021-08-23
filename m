Return-Path: <jailhouse-dev+bncBDUOFW62WYFBBCNSR2EQMGQEC735AZY@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-wm1-x337.google.com (mail-wm1-x337.google.com [IPv6:2a00:1450:4864:20::337])
	by mail.lfdr.de (Postfix) with ESMTPS id 6AA483F4B13
	for <lists+jailhouse-dev@lfdr.de>; Mon, 23 Aug 2021 14:48:10 +0200 (CEST)
Received: by mail-wm1-x337.google.com with SMTP id 201-20020a1c01d2000000b002e72ba822dcsf4092853wmb.6
        for <lists+jailhouse-dev@lfdr.de>; Mon, 23 Aug 2021 05:48:10 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1629722890; cv=pass;
        d=google.com; s=arc-20160816;
        b=F4KaRCEtIgvVY/PCw7TGUixbiWa4F1Qh478EOnSW4+qQBtjgUQPVEa6xYA5HXwgf5Q
         BCF4TvFJDRrKlBQfv4lw6c91BEqb6zGSHmMfAVPHaqIgCbDkWsSqFJ3LDEa6VoTN9Iaq
         RYnUjf4sFBSmzMRb1yf0v5c5AhXSfGKCP0h/9a/qqvmdbwAmAfWEl8xuysYDCyOuXHvr
         TTdYUMI4JHzoZ8rOkR3zRVAAsrhVBoTzinTd8Tw7pzuVamhBda+sWLSbxwHK6km59ZGd
         bKHEmEKa0bYSRNcKnuviDPfoBXG2mENjg7Ffm5u3qF81KrTUdUQ8xPIhfXzKEkDAMhIf
         4DPg==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject:sender:dkim-signature;
        bh=LVFfVGcHv64t9ilda7xsSUBxNnJ6VRiLRuCSyHEOmYM=;
        b=R4z40fE7PsrpbDUzRXri37ZmDLlxJXPmMybBZyknDc00ICbnUMDt0Xa1dhhvluyyXR
         gN35xNxqyowaX5TgQxnD5l27jEZQ77fNMWaZMhe6pjwrCnrGYEQ6x52H/CSr/sqfK4c0
         Mm6gYcdolQjI8t/sIW7kXErgzvUCDsshbU8ZtE5GGbAfD7uleogTpqoLJnHdHK1WGp+2
         viY/xWfBZ/ZwuTA712q/C+ZVDHnaQo/Cnr3hNV5GcxekrR0vZBZaZ9swP2+FsUx/0Jd1
         cVgaUDqEJm+ZpRbn/B7432rdmpuSOCYAnj8IthLf1oGdf+JY4zubY5Z/XTvu8ksglNhy
         NEgw==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass header.i=@oth-regensburg.de header.s=mta01-20160622 header.b=OYZCiAWW;
       spf=pass (google.com: domain of ralf.ramsauer@oth-regensburg.de designates 194.95.104.12 as permitted sender) smtp.mailfrom=ralf.ramsauer@oth-regensburg.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=oth-regensburg.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20210112;
        h=sender:subject:to:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding
         :x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=LVFfVGcHv64t9ilda7xsSUBxNnJ6VRiLRuCSyHEOmYM=;
        b=XBaDVym8MALDlzKntMa+u239P3433Esb53d3GY+hxrKXIVBDtjUHrFspG3V0IKgokY
         yTLDWKcPwGSWvssfSI2ywgSXjuXM7gC2UQeYzRbqGWcZRKf1aC7yFApsg6tu2LzuMtig
         8e5ov+ODNtFL5uWkLiHXbrt97xlsFgyyanFx1EbedmGNBuDEAjVtrZJYqytPZloXXJmH
         SH8vhlnXJUbPXCpHaHhbk586lnxRwTWJ8BDfCnTmO0kuDmpF0/yrOqIfXiGGzzflNEM0
         Dtp/npHnNCglYN1kS29KaWqwi7mPrqQRsTHtiFz/YwjEdAV6PRQpNO6KXjhWu3ugbGg6
         OV+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:subject:to:references:from:message-id
         :date:user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :x-spam-checked-in-group:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=LVFfVGcHv64t9ilda7xsSUBxNnJ6VRiLRuCSyHEOmYM=;
        b=ca5YxdG5e3uSNRsZGAKzIRALYn7xrxK0IjE3apG5WL0eCMs4XvQKuE1bOvXauFKhlY
         XDZAP6tFUAV8CkjgEFwr234F8nkTwYZOtX0dkvPg2U0NpOBg7aOp+lGpEySL2gNvRQFu
         K9RacmgsBXXvViZG7+kUdi4FY1G1qEk24bkhFSD6D8tIXm44UVt7ITCnUq5Tf5KDGZ/n
         19XRl0vuTRyL44gs3QKx96EY9mNN4HAYD8fiO1W/gAKGt7sW7Yrgzvz54set375BWVr8
         PdDzCw0wnO2qc317dTcMcoFiB7H57PI0AQDyH5OSzbi3l9vvghl8GaHgzTJzPZPTjWQk
         lbtQ==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AOAM530hGdrznirBd/TRoaoWT2/ZPuAdT7horAY8Ps7TsxSdnIOPV1N3
	3UrB7g3tRL0/QtsT3OrWiLI=
X-Google-Smtp-Source: ABdhPJwtyWA+/GyCU4sBg+taVR0/2BJtnagoHTvGXurwLbn6ZUrN1o+1ZZk2vJF1ZWDbJJqRav4LiQ==
X-Received: by 2002:a5d:4a8d:: with SMTP id o13mr13530714wrq.156.1629722890095;
        Mon, 23 Aug 2021 05:48:10 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a7b:cbd3:: with SMTP id n19ls2153179wmi.0.canary-gmail; Mon,
 23 Aug 2021 05:48:08 -0700 (PDT)
X-Received: by 2002:a05:600c:a4b:: with SMTP id c11mr15990259wmq.97.1629722888928;
        Mon, 23 Aug 2021 05:48:08 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1629722888; cv=none;
        d=google.com; s=arc-20160816;
        b=CfzDYolrAG+yUOOQR59agnkCLSY5oc/K1ICaP5kiw9/NGXB+bvQw4vOFX513a/+mlA
         G0WaauffpKG8B3vARGn/nv8PSfOYNADeI2Oy0b3Oaur3MRPfCo/PkcO+IfLTiSVqXORH
         vgpZybKaB5BmdRRhZSqLwstnt1FmoTc+whV1CXeONf/WPaJ6eoLjJuIaWm6X8ef2r6Aq
         IToeMIi2y1wN6FjElsVkHxvk9FbAYtinIFJ8QSNb3AWs0/dzyoDxJu3JFEDYnxpoz5RE
         4rK2WSihrUNG04w/yVeRF3luZqVb4QIWWieVFx/7KteFMKwbhO+Fmvm2xNbGzwz13wfU
         QLAQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:to:subject
         :dkim-signature;
        bh=9y3ElgBIKGma/KcoClvV8y+NdBCx66Es2EK42HjjMVg=;
        b=gZVPLjf3USQ6bQBh01S8swIcuHqoiU6CKfiBtVYDptMf2AxHrAJfmReEFlkBXxEhIF
         DfjUcVBsQzKdq/b4oXyhiQ3wG7ybFq8UXwBbb8kcntqjWgAJ4JLCOqD5rp1hguSkIt3v
         jrsh0WykWeK1E8T4T1G/LSDiQLYbWGZfkCr8e5Epe9eQUHW6wgdYKpwJUSPRUcIvdYrd
         5oRr4N3ULLvtGokReIVaOKCTw5Bp8y7KN/e8HNbLyJ9GCDznVePvDM199KOYKfGyyKy6
         xS8eUpNtXZ0dhbz70yBHixWM4xCs9Yl51/LfP66/QMjdVNHyo/erGDkxBPHtb5ykTsos
         2AAg==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       dkim=pass header.i=@oth-regensburg.de header.s=mta01-20160622 header.b=OYZCiAWW;
       spf=pass (google.com: domain of ralf.ramsauer@oth-regensburg.de designates 194.95.104.12 as permitted sender) smtp.mailfrom=ralf.ramsauer@oth-regensburg.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=oth-regensburg.de
Received: from mta02.hs-regensburg.de (mta02.hs-regensburg.de. [194.95.104.12])
        by gmr-mx.google.com with ESMTPS id u2si1074224wro.0.2021.08.23.05.48.08
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 23 Aug 2021 05:48:08 -0700 (PDT)
Received-SPF: pass (google.com: domain of ralf.ramsauer@oth-regensburg.de designates 194.95.104.12 as permitted sender) client-ip=194.95.104.12;
Received: from E16S03.hs-regensburg.de (e16s03.hs-regensburg.de [IPv6:2001:638:a01:8013::93])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(Client CN "E16S03", Issuer "E16S03" (not verified))
	by mta02.hs-regensburg.de (Postfix) with ESMTPS id 4GtX8m3dgrzyJp;
	Mon, 23 Aug 2021 14:48:08 +0200 (CEST)
Received: from [IPv6:2001:638:a01:8061:5c51:6883:5436:5db]
 (2001:638:a01:8013::138) by E16S03.hs-regensburg.de (2001:638:a01:8013::93)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2242.12; Mon, 23 Aug
 2021 14:48:08 +0200
Subject: Re: Editing Inmate to add GPIO for Raspberry Pi4
To: Moustafa Nofal <mustafa13e09940@gmail.com>, Jailhouse
	<jailhouse-dev@googlegroups.com>
References: <cd1adc59-e867-4ce1-a6ea-371ae1754cdan@googlegroups.com>
 <434c3e0d-3f9d-cef4-faa8-e94248176db8@oth-regensburg.de>
 <560fff74-e071-4713-a1ec-e29b842f7564n@googlegroups.com>
 <a30c722d-4fc3-fd3a-f2c2-5dd80b2d8887@oth-regensburg.de>
 <12f6f39b-14fa-47c4-9fe6-6ca0897e14c0n@googlegroups.com>
From: Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>
Message-ID: <66d9ac5b-8e2c-621d-d948-ff921aa0aa5e@oth-regensburg.de>
Date: Mon, 23 Aug 2021 14:48:08 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <12f6f39b-14fa-47c4-9fe6-6ca0897e14c0n@googlegroups.com>
Content-Type: text/plain; charset="UTF-8"
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable
X-Originating-IP: [2001:638:a01:8013::138]
X-ClientProxiedBy: E16S04.hs-regensburg.de (2001:638:a01:8013::94) To
 E16S03.hs-regensburg.de (2001:638:a01:8013::93)
X-Original-Sender: ralf.ramsauer@oth-regensburg.de
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass
 header.i=@oth-regensburg.de header.s=mta01-20160622 header.b=OYZCiAWW;
       spf=pass (google.com: domain of ralf.ramsauer@oth-regensburg.de
 designates 194.95.104.12 as permitted sender) smtp.mailfrom=ralf.ramsauer@oth-regensburg.de;
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



On 23/08/2021 13:04, Moustafa Nofal wrote:
>=20
>     >Please do _not_ reply with html mails in future. It's almost
>     impossible
>     >to figure out where you exactly responded. And please always reply
>     to all.
>     Okay, sure.

Last warning. :)

You answer in html inside response and use strange formatting: it's
really hard to read your mails and a fiddling finding out the spots
where you responded.

>     >
>     > =C2=A0
>     >
>     > > What could be a clean way, to add such headers into jailhouse, I
>     > have my
>     > > own header-which describes addresses of GPIO registers- added to
>     > > /inmates/lib/include, but is there any possible way to add these
>     > headers?
>=20
>     >>>Sorry, I think I don't understand the question. Of course, if you
>     have
>     >>>custom modifications, you can place you headers there.
>=20
> =C2=A0
>=20
>     I want to avoid such headers as much as possible.
>=20
> =C2=A0
>=20
>=20
>=20
>     >>The device tree is only required if you use Linux in your inmate.
>     If you
>     >>want to use the bare-metal inmate library, then you only need to
>     adjust
>     >>the configuration of your inmate.
>     Okay, I understand it now.
>=20
>     >
>     > >2. Map that address to your inmate using map_range()
>     > >(instead of opening /dev/mem, there is no semantic at all for
>     devices
>     > >in our tiny libinmate)
>     >
>     > =C2=A0
>     > Yes, that was my problem, I tried accessing the registers directly,
>     > but it must be mapped first, there are two solutions for this,
>     > either using assembly code or use such a function.
>     > I did not know about map_range, or whether jailhouse uses it, but I
>     > will check and get back to you.
>=20
>     >map_range is a routine of libinmate, it /belongs/ to jailhouse. Use
>     "git
>     >grep map_range" to see how it is used.
>     I tried map_range
>     #define GPIO_BASE=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0xFE200000
>     =C2=A0=C2=A0=C2=A0 map_range((void*)GPIO_BASE, 0xb4,MAP_CACHED);

You need to use MAP_UNCACHED for MMIO devices. But keep in mind that we
use huge pages on arm, so 2MiB will get mapped, but that shouldn't be an
issue in your case.

>     I could not find a signature, but I think I need a void pointer with
>     address as an argument, am I correct?

How can you even not find the signature? There's nothing easier like that:
$ git grep map_range
void map_range(void *start, unsigned long size, enum map_type map_type)

But yes, besides you should use MAP_UNCACHED, this looks good.

>=20
>=20
>     > On the other hand, I found mmio_write32() for writing registers, bu=
t
>     > I could not find the source file. Also timer_start(), I do not know
>     > where is the definition of this function.
>=20
>     >After you mapped the physical memory, you can then access registers
>     with
>     >mmio_write()-accessors. To find the definition of those routines, ju=
st
>     >use git grep:
>=20
>     >lib/arm-common/include/inmate.h:static inline void mmio_write32
>=20
>     Okay, great!, I am not sure about the signature as well, but am sure

OK - I think I don't understand what you refer to with "signature".

>     of the address and I added the whole memory starting from 0xFE200000
>     to 0xFE2000B4 to the inmate-demo.c
>=20
>     here
>     =C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=
=C2=A0 =C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0 /*GPIO*/{
>     =C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 .phys_start =
=3D 0xfe200000,
>     =C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 .virt_start =
=3D 0xfe200000,
>     =C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 .size =3D 0x=
b4,
>     =C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 .flags =3D J=
AILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
>     =C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 JAILHOUSE_ME=
M_IO,

Ok, now things get a bit complicated:

Usually, the finest granularity for assigning memory is the PAGE_SIZE,
which is, in case of ARM, 4KiB (0x1000). If you map anything below
0x1000 (e.g., 0xb4), then Jailhouse implements subpaging: The hypervisor
will trap on access, and dispatch the access. In this case, you must
specify JAILHOUSE_MEM_IO_${WIDTH} (with WIDTH=3D8,16,32,64), in order to
allow access within a specified width.

>     =C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0=C2=A0 },
>=20
>     and in gic-demo.c
>=20
>     static void *GPIO_GPFSEL2=3D (void*)0xFE200008;
>     =C2=A0=C2=A0=C2=A0 mmio_write32(GPIO_GPFSEL2, mmio_read32(GPIO_GPFSEL=
2) ^ (1 << 3));=C2=A0
>     I get from the UART console:
>=20
> =C2=A0=C2=A0=C2=A0=C2=A0 FATAL: Invalied MMIO read, address:fe200008, siz=
e 4.

Otherwise, you will fault, as you can see here. "size 4" tells you that
the width was 4*8=3D32 bit (obviously, you used mmio_write32).

So now there are two possibilities how you can fix this issue:

1. Change the config flags of the memory region to:
  .flags =3D JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
           JAILHOUSE_MEM_IO | JAILHOUSE_MEM_IO_32

  Advantage: You *exactly* only map 0xb4 byte of the device
  Disadvantage: The hypervisor will trap on every access


2. Change .size from 0xb4 to 1*PAGE_SIZE. This will map 4KiB instead of
   0xb4 byte. If there are no other devices behind that physical memory
   region, then this should be the preferred choice, as no further
   hypervisor activity will be involved.

  Ralf

>=20
>     FATAL: forbidden access (exception class 0x24)
>     I am not sure if the mapping was correct.>
>     > One more question, I think you must have mapped the timer and UART0
>     > peripherals, in order to be able to trigger it. I saw the memory
>=20
>     >In order to trigger what? What is "it"? :)
>     I meant the timer by it :). How is the timer
>     > region structure=C2=A0 in *rpi4-inmate-demo.c *and could understand=
, how
>     > could you make it and implemented something similar for the GPIO.=
=C2=A0
>     > But where the initialization of the timer and uart, I mean in which
>     > file, or how is that made>
>     >On arm, libinmate uses the platform timer. Take a look at
>     >inmates/lib/arm-common/timing.c.
>     Okay, thanks
>     >
>     > >3. directly write to the address
>     >
>     > >Other than that, have a look at demos/arm/gic-demo.c or
>     > >demos/x86/apic-demo.c. There we have the cmdline argument that
>     allows
>     > >for specifying a led-pin, which is nothing else but a GPIO.
>     > Yes, this part I understand, but my experience was with
>     > ARM-Cortex-M, so I thought I could just write to the register
>     > without mapping it. But thanks for the information and would really
>     > appreciate, if you could tell in which direction shall I dig.
>=20
>     >On ARM, we use virtual memory management for inmates. So you
>     definitely
>     >need a mapping prior to accessing MMIO registers.
>     Yeah, I could understand.
>=20
>     Best Regards,
>     Moustafa Noufale
>=20
>     =C2=A0
>=20
> --=20
> You received this message because you are subscribed to the Google
> Groups "Jailhouse" group.
> To unsubscribe from this group and stop receiving emails from it, send
> an email to jailhouse-dev+unsubscribe@googlegroups.com
> <mailto:jailhouse-dev+unsubscribe@googlegroups.com>.
> To view this discussion on the web visit
> https://groups.google.com/d/msgid/jailhouse-dev/12f6f39b-14fa-47c4-9fe6-6=
ca0897e14c0n%40googlegroups.com
> <https://groups.google.com/d/msgid/jailhouse-dev/12f6f39b-14fa-47c4-9fe6-=
6ca0897e14c0n%40googlegroups.com?utm_medium=3Demail&utm_source=3Dfooter>.

--=20
You received this message because you are subscribed to the Google Groups "=
Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/=
jailhouse-dev/66d9ac5b-8e2c-621d-d948-ff921aa0aa5e%40oth-regensburg.de.
