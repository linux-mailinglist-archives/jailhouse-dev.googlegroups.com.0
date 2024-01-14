Return-Path: <jailhouse-dev+bncBDUOFW62WYFBBA7JR6WQMGQEHFGQTAI@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-wr1-x440.google.com (mail-wr1-x440.google.com [IPv6:2a00:1450:4864:20::440])
	by mail.lfdr.de (Postfix) with ESMTPS id F396F82D104
	for <lists+jailhouse-dev@lfdr.de>; Sun, 14 Jan 2024 15:49:46 +0100 (CET)
Received: by mail-wr1-x440.google.com with SMTP id ffacd0b85a97d-3368c707b03sf4664495f8f.3
        for <lists+jailhouse-dev@lfdr.de>; Sun, 14 Jan 2024 06:49:46 -0800 (PST)
ARC-Seal: i=2; a=rsa-sha256; t=1705243781; cv=pass;
        d=google.com; s=arc-20160816;
        b=cccITLPEPGZK4MEpHIxltmfyroPYxkGZJgSxO9hs1RdGikI75I8Ic18gr4Oqi3CF8u
         srijGamkdiEr1U/9ZV26h107ETakcfNAIgqL+KT68bIn5+COncKcSXdLqkG5mUWkE2Vl
         JYUuWNWDdIYg02TjRbw4TUxIDJFP2hZc7O2bLEXLtx5KiyH1qbKXOGU3ZAAxpnte0KoQ
         VcHUYz5FcH4XbfAcipz8Jf8YwKQLmNeWGFlw72Toa4dmtqmnjG1lrxWEvkesTkfMIAVN
         h9N+UJaaJrQeYmERdC9skO7B8DZ7K4v9V8XUZvJUXuVOCtms5xq2/DX92X5WJACu4kJ7
         fBoQ==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:content-transfer-encoding
         :in-reply-to:from:references:to:content-language:subject:user-agent
         :mime-version:date:message-id:sender:dkim-signature;
        bh=yEIWGg82vTUvyNl1HpTbrx4zFbEyApEvD0V1sx0wcaE=;
        fh=xV0wa0Mgs5ocIf1n2t9ZgMFJEALBdodouLvqFRUuVHA=;
        b=HdRp64xpHa2IG3ktXehfxDJxaStuq69/kE9pkaNLk315X+u3Bl2Rt6Og3MgOEr+v0s
         Cvvdx3jrCNBbLoZohLmWVjelDU85VstqWIA7oqHfqXcrkXhNgaZLZqUcQHLAf5hnoOse
         Rm3m75NeFu5B0lLMV5kVQv9uE0PUEQDuKNFJ9+yMvnylhdTPPMZz6A6nO7VAWIIZC4xx
         bOi4Fc6zflsLJEtBU8IomikQXdTSgIxpru2g6OTQ0zUqqaiIXaaPQ8sGwPENR+OFdGeh
         MkWiau3dmPqQKLVN7lIanuqYdlKfPfhUhsi+o9gpiKxAtBMq85aUK6/9ccHhxzyaEsp1
         3bpw==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass header.i=@oth-regensburg.de header.s=mta02-20211122 header.b=i8mGj+XH;
       spf=pass (google.com: domain of ralf.ramsauer@oth-regensburg.de designates 194.95.233.60 as permitted sender) smtp.mailfrom=ralf.ramsauer@oth-regensburg.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=oth-regensburg.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20230601; t=1705243781; x=1705848581; darn=lfdr.de;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:x-original-authentication-results
         :x-original-sender:content-transfer-encoding:in-reply-to:from
         :references:to:content-language:subject:user-agent:mime-version:date
         :message-id:sender:from:to:cc:subject:date:message-id:reply-to;
        bh=yEIWGg82vTUvyNl1HpTbrx4zFbEyApEvD0V1sx0wcaE=;
        b=lEBxssPgL5LjFlb9JKwrp/Tl1MLvqUJIcXIqjoM2GM/2QniRoDVCCYrLV2WgbPnk+K
         CoiVBNDhYLNlbzgukj1Ha06aqDKI4AP2/16mfb2LbNo0qqRl2xFF+8jI2XeQ7fOpM23N
         Abwd66Gdn3Bkn9glrRRXNxaAKaZH/zdDpt9kZ4hZ4Iw9hp0ulnkFNXDsh0ggBTXjTAUE
         lBDRtHcHUJ4EDxV6X1QdprKW2/yk++O74NSBVaU32/g2oAqu9NnalIjLcXRoCkeoIwsL
         vUOSqLIzpNjxP+OJZQMy4xFnATsfBDRbdb6PExUaIf4VI9TCxZ4QKD74d5uto2laJ0QT
         kc5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1705243781; x=1705848581;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :x-spam-checked-in-group:list-id:mailing-list:precedence
         :x-original-authentication-results:x-original-sender
         :content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-beenthere:x-gm-message-state:sender:from:to:cc:subject:date
         :message-id:reply-to;
        bh=yEIWGg82vTUvyNl1HpTbrx4zFbEyApEvD0V1sx0wcaE=;
        b=PIkOWgem6VCnwqsSMhSQYA8rl0zYuSh9E1UQLRsxqXThuafdk8JLku875dTmJB92to
         p9p5vM8KOyybMGo054CV3gvi/F9B0724CHeT3gc+cl7h/qrGPIApaK1nbwIeScMy0bqC
         ju7XtrcwRI2/vP7qrLWeJI5d9L/+DfL9S0PR7+xSqxy+5KLp/Py0R5N5oMjFXh2e3EL8
         5AXxMkQd3Z6Kl5aU0tnp885FIXm/Ef+5TYiIXC3Ac+TzBYgo39ZdkmiRv7ZvTuLWExJH
         yS4bY0U2q06XO0GMnI4dHvhV+JjiiYU50M5fiGRg5ufnB8i3wNcVrZ2hnvsR1txvnSFf
         pexw==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AOJu0Yw3bux3acdT/7wvRSdXsi1jFMoD6ePX1vQya7oRORI4a+bY2OSy
	cEWiXyVecze94AhakUFRAV0=
X-Google-Smtp-Source: AGHT+IH68Un4kju9AnHMgKjn2KQtb+xoRfouHKIj5Y55l5/5ySQMDnrOcMdHXD9bglTDe5mGQBI6fg==
X-Received: by 2002:a05:600c:204:b0:40e:4694:38a6 with SMTP id 4-20020a05600c020400b0040e469438a6mr2162705wmi.157.1705243780736;
        Sun, 14 Jan 2024 06:49:40 -0800 (PST)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a05:600c:3c88:b0:40d:2f89:3349 with SMTP id
 bg8-20020a05600c3c8800b0040d2f893349ls668139wmb.1.-pod-prod-03-eu; Sun, 14
 Jan 2024 06:49:38 -0800 (PST)
X-Received: by 2002:a1c:7c0d:0:b0:40e:487b:7ad8 with SMTP id x13-20020a1c7c0d000000b0040e487b7ad8mr2246855wmc.46.1705243777749;
        Sun, 14 Jan 2024 06:49:37 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1705243777; cv=none;
        d=google.com; s=arc-20160816;
        b=rX80z2lzcL8DQxQXkkxz/U2fbqyW3FEHPjR9ZKUXtall7S3raGjUIbE/NM6iipHSBo
         RsiWnJzJDWFEEzzapsnK8AqelOsz+0fUFOg0DvPp5bfXs9yCjZXOnnoGSucUlre+zXNO
         xhhegezwX7lwuvtpRk7tnHgp6FwWDMhE2YxuLX7sNHPcRb2YVk2qCGztTZc/s2b2aYut
         7hS9v7Of2puVJXgAMCk/yq2QIp8NwcUKpJwJ/dHRsQtyG2svdO7S98Pb/loojP46FrzC
         oDqaOi6uSLnr3yHMFK6mFoOF/4Op6MTvja6FspjSjvvYJibXBh7xm5WLmoFUFHiaOY5h
         dqDA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=X9sVmRi9zdl9sDVEIq1/UgVDgzlZslyQWOSsT1EaReM=;
        fh=xV0wa0Mgs5ocIf1n2t9ZgMFJEALBdodouLvqFRUuVHA=;
        b=SITbQMCRkUBMfFI7PItobVJnw8+Mts3Pa809NYxBPo/nWK7/ecv2Sd9hSfCHUxdf0z
         9tQBerH8c04D/0UQovfuSx2BAOIQaZJnUhoMgU3sZw+ODYp4O5MMeUs0KzzMjMVKFwdi
         9QQVTcJqSJ5J0OFxFqHmnPkarLfpBm6nXUDRsst4QY3fxFH386PYxnQCNXx5B5jRysF2
         pqB3x4Lg8q4kf5K29fSq3CtwywvtkArYx2UpiXVOh08KSP938whQfdTsSiw2D6w/kfQ+
         8hGE3cJjrjJNombE3FLOu9P4vqEBNYthz7XjtuTxODooGz3fHvNwigIur4+nGGJ0MbWz
         3I1g==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       dkim=pass header.i=@oth-regensburg.de header.s=mta02-20211122 header.b=i8mGj+XH;
       spf=pass (google.com: domain of ralf.ramsauer@oth-regensburg.de designates 194.95.233.60 as permitted sender) smtp.mailfrom=ralf.ramsauer@oth-regensburg.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=oth-regensburg.de
Received: from a2752.mx.srv.dfn.de (a2752.mx.srv.dfn.de. [194.95.233.60])
        by gmr-mx.google.com with ESMTPS id s1-20020a5d69c1000000b003378da52b54si192984wrw.0.2024.01.14.06.49.37
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 14 Jan 2024 06:49:37 -0800 (PST)
Received-SPF: pass (google.com: domain of ralf.ramsauer@oth-regensburg.de designates 194.95.233.60 as permitted sender) client-ip=194.95.233.60;
Received: from mta02.hs-regensburg.de (mta02.hs-regensburg.de [194.95.104.12])
	by a2752.mx.srv.dfn.de (Postfix) with ESMTPS id 59FBA2E02F5;
	Sun, 14 Jan 2024 15:49:36 +0100 (CET)
Received: from E16S03.hs-regensburg.de (e16s03.hs-regensburg.de [IPv6:2001:638:a01:8013::93])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(Client CN "E16S03", Issuer "E16S03" (not verified))
	by mta02.hs-regensburg.de (Postfix) with ESMTPS id 4TCdTX0QFJzxqw;
	Sun, 14 Jan 2024 15:49:36 +0100 (CET)
Received: from [172.16.2.23] (194.95.106.226) by E16S03.hs-regensburg.de
 (2001:638:a01:8013::93) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.35; Sun, 14 Jan
 2024 15:49:35 +0100
Message-ID: <78750023-1199-41e6-bee9-549c185d160c@oth-regensburg.de>
Date: Sun, 14 Jan 2024 15:49:35 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: Unable to start non root linux cell
Content-Language: en-US
To: =?UTF-8?Q?Michele_Pescap=C3=A8?= <mic.pescape@gmail.com>, Jailhouse
	<jailhouse-dev@googlegroups.com>
References: <824bacc4-b7ae-47c9-878e-7203214b4fc3n@googlegroups.com>
 <d36e18a4-dd64-4f9c-b2cf-89b02b1a0469@oth-regensburg.de>
 <c9dad4f3-f856-4f25-b6ad-41ec63cf2c64n@googlegroups.com>
 <219b013e-4970-4bb3-969f-bb0d7bae3ab7n@googlegroups.com>
 <2202bf30-5b2c-45ea-9f9f-699daf338843n@googlegroups.com>
 <0431cb6c-c2ca-4417-97d4-f0dc9bc3f389@oth-regensburg.de>
 <9a021e3f-caca-4ebe-9351-be2c3e999446n@googlegroups.com>
 <e4aef5c1-45fa-49f2-8b6c-04f36d7f556d@oth-regensburg.de>
 <23a9c30e-5507-449e-9589-697904becac4n@googlegroups.com>
 <81df336d-a7bb-49e2-8762-a1294aef67e9@oth-regensburg.de>
 <bbd32aa2-053e-40a2-b4d5-2326238d0793n@googlegroups.com>
 <0aa4c10d-a635-4a37-bf51-2b9863beb2a0@oth-regensburg.de>
 <6712361a-eaef-49cc-8a72-79da2c434169n@googlegroups.com>
 <b4520b71-86ba-48e7-b9ad-c720c4f6cb42@oth-regensburg.de>
 <860c1e75-c28f-4157-9212-a3d87ad25b27n@googlegroups.com>
 <b13f671c-b870-48b1-8f39-d5eae43c7a5b@oth-regensburg.de>
 <6146e208-1e8c-4335-abaf-9a2be8c85be5n@googlegroups.com>
From: Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>
In-Reply-To: <6146e208-1e8c-4335-abaf-9a2be8c85be5n@googlegroups.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: quoted-printable
X-Originating-IP: [194.95.106.226]
X-ClientProxiedBy: E16S02.hs-regensburg.de (2001:638:a01:8013::92) To
 E16S03.hs-regensburg.de (2001:638:a01:8013::93)
X-Original-Sender: ralf.ramsauer@oth-regensburg.de
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass
 header.i=@oth-regensburg.de header.s=mta02-20211122 header.b=i8mGj+XH;
       spf=pass (google.com: domain of ralf.ramsauer@oth-regensburg.de
 designates 194.95.233.60 as permitted sender) smtp.mailfrom=ralf.ramsauer@oth-regensburg.de;
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

Hi Michele,

On 14/01/2024 02:18, Michele Pescap=C3=A8 wrote:
> Hi,
>=20
> There were PIO writes to ports 4e,4f,2e and 2f, each of size 1 and each=
=20
> one on subsequent restarts. I'm not sure how to figure out what they=20
> belong to.

Easy and straight forward: Read the jailhouse crash dump.

Look at the program counter, and maybe the return address. Disassemble=20
your kernel (objdump -d vmlinux) and lookup that address. Now you know=20
the name of the routine in the kernel that caused the crash.

Don't simply whitelist ports. Only whitelist them, if you're sure what=20
you're doing.

>=20
> CONFIG_ISA_DMA_API is already disabled.
>=20
> I missed the irqchip for the uart. However as of right now I just copied=
=20
> the whole fragment from the root configuration which means I could be=20
> taking away other interrupts from the root cell, I still have to figure=
=20
> out how to tune that
>=20
> /* IOAPIC 13, GSI base 0 */
> {
> .address =3D 0xfec00000,
> .id =3D 0xa0,
> .pin_bitmap =3D {
> 0xffffffff, 0xffffffff, 0xffffffff, 0xffffffff

With this, you take away ALL interrupts from the root cell, which you=20
don't want to do, you only want to take away the interrupt that=20
corresponds to ttyS0 (i.e. Port 0x3f8).

See here: https://en.wikipedia.org/wiki/COM_(hardware_interface)

COM1: I/O port 0x3F8, IRQ 4

So you want to only assign IRQ 4 to your non-root cell. See=20
linux-x86-demo.c to see how that works.

> },
> },
>=20
> Still, now I can finally login into the non root linux.

Excellent!

   Ralf

>=20
> Thanks,
> Michele
>=20
> Il giorno sabato 13 gennaio 2024 alle 21:09:28 UTC+1 Ralf Ramsauer ha=20
> scritto:
>=20
>     Hi Michele,
>=20
>     On 13/01/2024 18:08, Michele Pescap=C3=A8 wrote:
>      > Hi,
>      >
>      > The problem was that the ram regions in the non root configuration
>      > weren't detected as such because of the missing=C2=A0JAILHOUSE_MEM=
_DMA
>     flag.
>=20
>     Yikes, makes sense.
>=20
>      > After adding that, I also had to add two pio_regions because the n=
on
>      > root linux was crashing because of two ports which aren't present =
in
>      > /proc/ioports.
>=20
>     Uhm - which PIO ports? Don't simply assign PIO ports. There must be a
>     reason for them. What ports did crash?
>=20
>     Did you disable(!) CONFIG_ISA_DMA_API? Please disable it. Therefore,
>     you
>     have to activate CONFIG_EXPERT first.
>=20
>     I *bet* it was i8237=E2=80=A6
>=20
>      > I also had to add mce=3Doff to the command line because i had an
>     unhandled
>=20
>     or disable CONFIG_X86_MCE.
>=20
>      > MSR error, I'll have to disable that in the kernel config.
>      > At this point the non root linux seems to start, I see the boot
>     log. No
>=20
>     Excellent!
>=20
>      > way of interacting with it as there is not a login prompt or
>     anything, I
>      > think I need to ssh to the cell at this point, right?
>=20
>     Was the initramdisk loaded correctly?
>=20
>     Did you assign - in your non-root cell config - the irqchip and the
>     corresponding interrupts of the uart?
>=20
>      > That means I'll now need to work on those ivshmem net devices.
>=20
>     If you need ivshmem, then this would be the next step.
>=20
>     Ralf
>=20
>      >
>      > Thanks,
>      > Michele
>      >
>      > Il giorno sabato 13 gennaio 2024 alle 15:13:12 UTC+1 Ralf
>     Ramsauer ha
>      > scritto:
>      >
>      > Hi,
>      >
>      > On 13/01/2024 12:28, Michele Pescap=C3=A8 wrote:
>      > > Hi,
>      > >
>      > > You are right, I got confused about those addresses, my bad. At
>      > least
>      > > now I know that config is the correct one and I don't have to
>     tinker
>      > > with it.
>      > > I'm back to a kernel panic from the inmate when booting the cell=
.
>      > It's
>      > > similar to the one I had earlier, not sure yet of what the
>      > problem may be.
>      >
>      > Great, we're a step further.
>      >
>      > >
>      > > Created cell "linux-2"
>      > > Page pool usage after cell creation: mem 406/32211, remap
>      > 16392/131072
>      > > Cell "linux-2" can be loaded
>      > > CPU 9 received SIPI, vector 100
>      > > Started cell "linux-2"
>      > > CPU 8 received SIPI, vector 100
>      > > No EFI environment detected.
>      > > early console in extract_kernel
>      > > input_data: 0x000000000275c308
>      > > input_len: 0x00000000008b0981
>      > > output: 0x0000000001000000
>      > > output_len: 0x0000000001fccb30
>      > > kernel_total_size: 0x0000000001e28000
>      > > needed_size: 0x0000000002000000
>      > > trampoline_32bit: 0x000000000009d000
>      > >
>      > > Decompressing Linux... Parsing ELF... done.
>      > > Booting the kernel.
>      > > [ =C2=A0 =C2=A00.000000] Linux version 6.2.0-rc3 (root@mp-LINUX-=
DESKTOP)
>      > > (x86_64-buildroot =C2=A0 =C2=A0 =C2=A0 -linux-gnu-gcc.br_real (B=
uildroot 2023.11)
>      > > 12.3.0, GNU ld (GNU Binutils) 2.40) # =C2=A0 =C2=A0 =C2=A0 2 SMP=
 PREEMPT_DYNAMIC
>      > Fri
>      > > Jan 12 17:36:57 CET 2024
>      > > [ =C2=A0 =C2=A00.000000] Command line: earlyprintk=3DttyS0,11520=
0
>      > > [ =C2=A0 =C2=A00.000000] KERNEL supported cpus:
>      > > [ =C2=A0 =C2=A00.000000] =C2=A0 Intel GenuineIntel
>      > > [ =C2=A0 =C2=A00.000000] =C2=A0 AMD AuthenticAMD
>      > > [ =C2=A0 =C2=A00.000000] x86/fpu: Supporting XSAVE feature 0x001=
: 'x87
>      > floating
>      > > point regi =C2=A0 =C2=A0 =C2=A0 sters'
>      > > [ =C2=A0 =C2=A00.000000] x86/fpu: Supporting XSAVE feature 0x002=
: 'SSE
>      > registers'
>      > > [ =C2=A0 =C2=A00.000000] x86/fpu: Supporting XSAVE feature 0x004=
: 'AVX
>      > registers'
>      > > [ =C2=A0 =C2=A00.000000] x86/fpu: xstate_offset[2]: =C2=A0576, x=
state_sizes[2]:
>      > =C2=A0256
>      > > [ =C2=A0 =C2=A00.000000] x86/fpu: Enabled xstate features 0x7, c=
ontext size
>      > is 832
>      > > bytes, =C2=A0 =C2=A0 =C2=A0 =C2=A0using 'compacted' format.
>      > > [ =C2=A0 =C2=A00.000000] signal: max sigframe size: 1360
>      > > [ =C2=A0 =C2=A00.000000] BIOS-provided physical RAM map:
>      > > [ =C2=A0 =C2=A00.000000] BIOS-e801: [mem
>      > 0x0000000000000000-0x000000000009efff] usable
>      >
>      > Okay, here should be all memory regions listed. My non-root Linux
>     in my
>      > Qemu VM, for example, shows here:
>      >
>      > [ 0.000000] BIOS-provided physical RAM map:
>      > [ 0.000000] BIOS-e820: [mem 0x0000000000000000-0x00000000000fffff]
>      > usable
>      > [ 0.000000] BIOS-e820: [mem 0x0000000000100000-0x0000000000100fff]
>      > reserved
>      > [ 0.000000] BIOS-e820: [mem 0x0000000000200000-0x00000000048fffff]
>      > usable
>      >
>      > Are you absolutely sure, that you have no further modifications in
>      > Jailhouse or the Linux loader?
>      >
>      > Actually, in your case, there should be e820 as well (instead of
>     e801).
>      > Go to the Linux kernel sources, have a look at
>      > arch/x86/kernel/e820.c:1279
>      >
>      > and Jailhouse's jailhouse-cell-linux:638.
>      >
>      > jailhouse-cell-linux fills information of all memory regions into
>     the
>      > zero page. Would you please instrument code (Linux/Jailhouse) to s=
ee
>      > where those regions are not parsed?
>      >
>      > > [ =C2=A0 =C2=A00.000000] printk: bootconsole [earlyser0] enabled
>      > > [ =C2=A0 =C2=A00.000000] NX (Execute Disable) protection: active
>      > > [ =C2=A0 =C2=A00.000000] extended physical RAM map:
>      > > [ =C2=A0 =C2=A00.000000] reserve setup_data: [mem
>      > > 0x0000000000000000-0x0000000000001fff] u =C2=A0 =C2=A0 =C2=A0 sa=
ble
>      > > [ =C2=A0 =C2=A00.000000] reserve setup_data: [mem
>      > > 0x0000000000002000-0x000000000000212b] u =C2=A0 =C2=A0 =C2=A0 sa=
ble
>      > > [ =C2=A0 =C2=A00.000000] reserve setup_data: [mem
>      > > 0x000000000000212c-0x000000000009efff] u =C2=A0 =C2=A0 =C2=A0 sa=
ble
>      > > [ =C2=A0 =C2=A00.000000] DMI not present or invalid.
>      > > [ =C2=A0 =C2=A00.000000] Hypervisor detected: Jailhouse
>      >
>      > Just guessing loud: Hmm, you have guest support enabled, that's
>     not the
>      > issue.
>      >
>      > > [ =C2=A0 =C2=A00.000000] tsc: Detected 3393.624 MHz processor
>      > > [ =C2=A0 =C2=A00.000017] .text .data .bss are not marked as E820=
_TYPE_RAM!
>      >
>      > Here's the next error that makes me curious, why you system falls
>     back
>      > to E801...
>      >
>      > > [ =C2=A0 =C2=A00.005745] last_pfn =3D 0x2e28 max_arch_pfn =3D 0x=
400000000
>      > > [ =C2=A0 =C2=A00.011025] x86/PAT: PAT support disabled because
>      > CONFIG_X86_PAT is
>      > > disabled =C2=A0 =C2=A0 =C2=A0 =C2=A0in the kernel.
>      >
>      > Please enable CONFIG_X86_PAT and MTRR in your kernel.
>      >
>      > > [ =C2=A0 =C2=A00.019362] x86/PAT: Configuration [0-7]: WB =C2=A0=
WT =C2=A0UC- UC =C2=A0WB
>      > =C2=A0WT =C2=A0UC- UC
>      > > [ =C2=A0 =C2=A00.034867] Using GB pages for direct mapping
>      > > [ =C2=A0 =C2=A00.039193] Kernel panic - not syncing: alloc_low_p=
ages: can
>     not
>      > > alloc memory
>      >
>      > Yeah, that's the logical aftereffect after the errors above.
>      >
>      > Thanks,
>      > Ralf
>      >
>      > > [ =C2=A0 =C2=A00.046183] CPU: 0 PID: 0 Comm: swapper Not tainted
>     6.2.0-rc3 #2
>      > > [ =C2=A0 =C2=A00.052176] Call Trace:
>      > > [ =C2=A0 =C2=A00.054606] =C2=A0<TASK>
>      > > [ =C2=A0 =C2=A00.056691] =C2=A0? dump_stack_lvl+0x33/0x4e
>      > > [ =C2=A0 =C2=A00.060510] =C2=A0? panic+0x157/0x303
>      > > [ =C2=A0 =C2=A00.063723] =C2=A0? sprintf+0x56/0x80
>      > > [ =C2=A0 =C2=A00.066936] =C2=A0? alloc_low_pages+0x70/0x1a0
>      > > [ =C2=A0 =C2=A00.070930] =C2=A0? phys_pmd_init+0x1fc/0x2eb
>      > > [ =C2=A0 =C2=A00.074839] =C2=A0? phys_pud_init+0x116/0x2d3
>      > > [ =C2=A0 =C2=A00.078744] =C2=A0? __kernel_physical_mapping_init+=
0x11a/0x290
>      > > [ =C2=A0 =C2=A00.084128] =C2=A0? init_memory_mapping+0x25e/0x3b0
>      > > [ =C2=A0 =C2=A00.088558] =C2=A0? init_range_memory_mapping+0xe7/=
0x145
>      > > [ =C2=A0 =C2=A00.093417] =C2=A0? init_mem_mapping+0x242/0x298
>      > > [ =C2=A0 =C2=A00.097585] =C2=A0? setup_arch+0x74e/0xcbd
>      > > [ =C2=A0 =C2=A00.101231] =C2=A0? start_kernel+0x66/0x8b7
>      > > [ =C2=A0 =C2=A00.104965] =C2=A0? load_ucode_bsp+0x43/0x11b
>      > > [ =C2=A0 =C2=A00.108873] =C2=A0? secondary_startup_64_no_verify+=
0xe0/0xeb
>      > > [ =C2=A0 =C2=A00.114085] =C2=A0</TASK>
>      > > [ =C2=A0 =C2=A00.116255] ---[ end Kernel panic - not syncing:
>      > alloc_low_pages: can
>      > > not all =C2=A0 =C2=A0 =C2=A0 oc memory ]---
>      > >
>      > >
>      > > Thank you for your continuous support,
>      > > Michele
>      > >
>      > > Il giorno sabato 13 gennaio 2024 alle 00:05:43 UTC+1 Ralf
>      > Ramsauer ha
>      > > scritto:
>      > >
>      > > Hi Michele,
>      > >
>      > > On 12/01/2024 14:07, Michele Pescap=C3=A8 wrote:
>      > > > jailhouse cell load linux-2 linux-loader.bin -a 0x0
>      > > > ../buildroot-2023.11/output/images/bzImage -a 0xffbe00
>     parameters
>      > > -a 0x1000
>      > > > jailhouse cell start linux-2
>      > > >
>      > > > I take it the kernel is loaded at 0xffbe00 which is right at t=
he
>      > > edge of
>      > > > the low ram region. In fact after issuing the cell load comman=
d
>      > and
>      > > > adjusting the path for the loader I get JAILHOUSE_CELL_LOAD:
>      > Invalid
>      > > > argument.
>      > >
>      > > Just tested cell-linux in a qemu machine, there it works, with
>      > pretty
>      > > similar addresses, which got me confused.
>      > >
>      > > After double-checking it: 0xffb.e00 is *not* at the edge of low
>     mem:
>      > >
>      > > Low mem is 0x000.000 -- 0x0ff.fff
>      > > Comm region is 0x100.000 -- 0x100.fff
>      > >
>      > > 0xffb.e00 is (obviously) way above.
>      > >
>      > > Please try to set your high mem's .virt_start to 0x200000. Then,
>      > > 0xffbe00 is offsetted ~16MB inside your highmem, and it should
>     work!
>      > >
>      > > IOW:
>      > >
>      > > /* high RAM */
>      > > {
>      > > .phys_start =3D 0x42300000,
>      > > .virt_start =3D 0x200000,
>      > > .size =3D 0x11000000,
>      > > .flags =3D JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
>      > > JAILHOUSE_MEM_EXECUTE |
>      > > JAILHOUSE_MEM_LOADABLE,
>      > > },
>      > >
>      > > Thanks
>      > > Ralf
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
>     https://groups.google.com/d/msgid/jailhouse-dev/6712361a-eaef-49cc-8a=
72-79da2c434169n%40googlegroups.com <https://groups.google.com/d/msgid/jail=
house-dev/6712361a-eaef-49cc-8a72-79da2c434169n%40googlegroups.com> <https:=
//groups.google.com/d/msgid/jailhouse-dev/6712361a-eaef-49cc-8a72-79da2c434=
169n%40googlegroups.com <https://groups.google.com/d/msgid/jailhouse-dev/67=
12361a-eaef-49cc-8a72-79da2c434169n%40googlegroups.com>> <https://groups.go=
ogle.com/d/msgid/jailhouse-dev/6712361a-eaef-49cc-8a72-79da2c434169n%40goog=
legroups.com?utm_medium=3Demail&utm_source=3Dfooter <https://groups.google.=
com/d/msgid/jailhouse-dev/6712361a-eaef-49cc-8a72-79da2c434169n%40googlegro=
ups.com?utm_medium=3Demail&utm_source=3Dfooter> <https://groups.google.com/=
d/msgid/jailhouse-dev/6712361a-eaef-49cc-8a72-79da2c434169n%40googlegroups.=
com?utm_medium=3Demail&utm_source=3Dfooter <https://groups.google.com/d/msg=
id/jailhouse-dev/6712361a-eaef-49cc-8a72-79da2c434169n%40googlegroups.com?u=
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
>     https://groups.google.com/d/msgid/jailhouse-dev/860c1e75-c28f-4157-92=
12-a3d87ad25b27n%40googlegroups.com <https://groups.google.com/d/msgid/jail=
house-dev/860c1e75-c28f-4157-9212-a3d87ad25b27n%40googlegroups.com> <https:=
//groups.google.com/d/msgid/jailhouse-dev/860c1e75-c28f-4157-9212-a3d87ad25=
b27n%40googlegroups.com?utm_medium=3Demail&utm_source=3Dfooter <https://gro=
ups.google.com/d/msgid/jailhouse-dev/860c1e75-c28f-4157-9212-a3d87ad25b27n%=
40googlegroups.com?utm_medium=3Demail&utm_source=3Dfooter>>.
>=20
> --=20
> You received this message because you are subscribed to the Google=20
> Groups "Jailhouse" group.
> To unsubscribe from this group and stop receiving emails from it, send=20
> an email to jailhouse-dev+unsubscribe@googlegroups.com=20
> <mailto:jailhouse-dev+unsubscribe@googlegroups.com>.
> To view this discussion on the web visit=20
> https://groups.google.com/d/msgid/jailhouse-dev/6146e208-1e8c-4335-abaf-9=
a2be8c85be5n%40googlegroups.com <https://groups.google.com/d/msgid/jailhous=
e-dev/6146e208-1e8c-4335-abaf-9a2be8c85be5n%40googlegroups.com?utm_medium=
=3Demail&utm_source=3Dfooter>.

--=20
You received this message because you are subscribed to the Google Groups "=
Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/=
jailhouse-dev/78750023-1199-41e6-bee9-549c185d160c%40oth-regensburg.de.
