Return-Path: <jailhouse-dev+bncBD4JZQXE5UFRBU5OQPUAKGQEFPPBWPY@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-wr1-x43b.google.com (mail-wr1-x43b.google.com [IPv6:2a00:1450:4864:20::43b])
	by mail.lfdr.de (Postfix) with ESMTPS id A81BC422CF
	for <lists+jailhouse-dev@lfdr.de>; Wed, 12 Jun 2019 12:43:31 +0200 (CEST)
Received: by mail-wr1-x43b.google.com with SMTP id o18sf904712wrm.0
        for <lists+jailhouse-dev@lfdr.de>; Wed, 12 Jun 2019 03:43:31 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1560336211; cv=pass;
        d=google.com; s=arc-20160816;
        b=dBf+Dq9FU5TJ3tJxCKIVlbSXI2plEiIuhgZoDss+d6ssboWf1DgEv8ojOasGQ1Ko6/
         5nnsYnqP/E9A/LcIe3bGgg1kUUwFTmysWwYSq+wTZ35QWIW63/Hy1KxMmCajLY0OPlXW
         Ev00wYm8TC/59AUpG56kURpwx9Irk061AWHgrjrlHWOddRb5OhvqGGuobflOba25j4kL
         6aeUyAxvajzOp4dtLtinGR4SD0tMFkvsxG5XZwUPwU4oj+izNRp7Z2HnHTp8pev3Sw4g
         rmHGH9G0RBLi1OkuAZGC8MSlmZ9U5Ao9gWeIlmsrbrpAKINL/fFgDnqbZWz9Twjv1m4A
         POlA==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:openpgp:from:references:cc:to:subject:sender
         :dkim-signature;
        bh=n6ZP2X7bvCMS7207uQwcQxFBzD9czGcd0/1fJtjhCNk=;
        b=y/gzfgz9Re7IKiZo1Uwc98EJsa0suTeXJQsLLAFTTCZa/hqP+560BY13XDI9LgMHh0
         OCXAS9em7S0F16fMTckhgVNl0HKDQ5dqnY/GYMjMs0zv8wImi59kixSOqF/5vc7qoW/7
         Qy7jw/F/m302ZDJYRHKRUx9WxOs+R6is7O+HNnj75Lh6dXaUe6rRfPHks4Ffz2t6Plhe
         LdIL5b4vtZLROb1EsNm+ZInulOOqK8jyiQpGWUjb0VlHrh4IlyoyQtev/g4i8v/1iRrj
         o9p2PLpHQ0NhLS2CsgCSghQz/apOrP5SvjEDEMa3pxAAvYtuUIydR3gM4UeBZf5MBFUj
         /Eaw==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass header.i=@oth-regensburg.de header.s=mta01-20160622 header.b=HGdDdANG;
       spf=pass (google.com: domain of ralf.ramsauer@oth-regensburg.de designates 2001:638:a01:1096::11 as permitted sender) smtp.mailfrom=ralf.ramsauer@oth-regensburg.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=oth-regensburg.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:subject:to:cc:references:from:openpgp:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :list-post:list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=n6ZP2X7bvCMS7207uQwcQxFBzD9czGcd0/1fJtjhCNk=;
        b=UwXpNK0Jz3XtRVKR5Mxy0qDvBu8TNqHNklbOxubLobeBpLFIhtmnd2OH9XAbo3eeu3
         AVZ/awb9sYa4Th9hnDP4F6nzfXNX+8vg+Bn8M5KBArP1jCO0UYruQfFzIiwiTYOhGpk0
         mrUxVBdKQ3/DPDKLg20qNfR8ImS1DI3lSXT3fEG1oOErP0qWtSM9RX4B/g2yIMdXczHk
         J4Ekl6NFrSs1WAHeBAtuz3ImH4IBSx4UDiybBA7Rm7LCkAipPnvDmVVIHWsqx/gRQMMz
         m+NvVQEdZIsI2C81QsxDaBh36xI2yzx6ww1qe/08xoH3cfX+ak0ykO1k/x6VWcGA5zws
         5VIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:subject:to:cc:references:from:openpgp
         :message-id:date:user-agent:mime-version:in-reply-to
         :content-language:content-transfer-encoding:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :x-spam-checked-in-group:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=n6ZP2X7bvCMS7207uQwcQxFBzD9czGcd0/1fJtjhCNk=;
        b=N3oxfHw8LPiMThOlzTcbEC8u6Z0mcf2e1FUxAPO+aCqTNDTaqnpW8kCPfxkr7SzAHt
         HUBDZIYd0+7EahtpczspoYXpyiZS0D1MbWx9bClopHFyu8qAIeW7QeMoEsYqslDnbfi3
         kTcmBPvTperf7pvRtHGgm/4rPOaXYRPtCWziLSWWvaaCDrnF42qYwGnBstyx/b58olQo
         eSncOvLARek8V2oQjQKGAXM9vxIDB3sf0zg7vN7vwG38YSqHLNMRn49Nh9UigKcIlPbD
         Q6pYFYP12/ANbu0VkRAl+fIm7ViUH/NJOHm4OFAk/wkwQMvFwH1tDaET0PML2LFWy6OU
         OfJQ==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: APjAAAXB8XBTt0QZr3JMPKauDFRUVeAwk6kX0EM1v/Yn88f2jAWGvOe4
	DgawBxCXgLrZrSp+RNHbwxQ=
X-Google-Smtp-Source: APXvYqyCWYOQruEs1bxCvMp4OMONY9zxk6RFGhRDqoiZyozQJvrXYzzlcqUh+YqaeHO7HuM06jw3+A==
X-Received: by 2002:a1c:238d:: with SMTP id j135mr22015665wmj.53.1560336211199;
        Wed, 12 Jun 2019 03:43:31 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a1c:b484:: with SMTP id d126ls540029wmf.2.canary-gmail; Wed,
 12 Jun 2019 03:43:30 -0700 (PDT)
X-Received: by 2002:a1c:f519:: with SMTP id t25mr2479795wmh.58.1560336210623;
        Wed, 12 Jun 2019 03:43:30 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1560336210; cv=none;
        d=google.com; s=arc-20160816;
        b=OIjs9yT0UtZMbdUuqFaHgkEOYDDZFGZaNePj91ktxH8u4GFnPvCC7NxB6XiXN0NAie
         JlYPsNloQl2srQ/4FnNTYnvEHqbI92lwtV9w2ft2N/Ik8dEGy7Uk2zWxyIpnZZMgcFYj
         RZP8+btBKj5XETw8rs+88C9Ye5JZ9Ekv4h3ICnkCaA9mQRBeboKoO3LlZzbElwbtupxN
         uFzxzwDzkukGknSdJN0RCu9Fiv+hqH7Z54eofx0ZMc/EMM28nQV8rUHSI3K8bAWlor8C
         CVaFXUrPlX5VAY+OyciHYTnrEKSSgbfAlEBNAnSVsm0givRGm6knSE/NLtFVaV48AYYA
         5S6w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:openpgp:from:references:cc:to:subject
         :dkim-signature;
        bh=iQObLtxD6cxGg6UsXHQ7Thu0ocZy9hQUS5t84Ytk7rc=;
        b=sQaCGSiONy9kktYD73PysTvj9JbP2feTW8EuumKbyqI4UMfsRboQbPTov880upSnyq
         V7+jEoxYMvTcrmPKiB7iVWWC6UI3pEcFV9X3gEYtGrTAVrlYMEsFLeGprpplDdVjt8pC
         jD6gy80SbAk2AHB8yh842FivUgWtPKBj0VOk1eSevXFiB3TERpunx5WojWokZyBQsqJa
         Jl01bOIl+IT6iR/x/H+fPahHqvXqViAivdjKNWChIWEca8WwPSVHAgCO7b5sJXrh476x
         3J1rUMw4ogpv13rv3ojsefo/2BCwwxnJooYsumjw7/hRySGliScu+V0RZZL3wo8ow3nG
         jfLw==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       dkim=pass header.i=@oth-regensburg.de header.s=mta01-20160622 header.b=HGdDdANG;
       spf=pass (google.com: domain of ralf.ramsauer@oth-regensburg.de designates 2001:638:a01:1096::11 as permitted sender) smtp.mailfrom=ralf.ramsauer@oth-regensburg.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=oth-regensburg.de
Received: from mta01.hs-regensburg.de (mta01.hs-regensburg.de. [2001:638:a01:1096::11])
        by gmr-mx.google.com with ESMTPS id z11si177337wmc.2.2019.06.12.03.43.30
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 12 Jun 2019 03:43:30 -0700 (PDT)
Received-SPF: pass (google.com: domain of ralf.ramsauer@oth-regensburg.de designates 2001:638:a01:1096::11 as permitted sender) client-ip=2001:638:a01:1096::11;
Received: from E16S02.hs-regensburg.de (e16s02.hs-regensburg.de [IPv6:2001:638:a01:8013::92])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(Client CN "E16S02", Issuer "E16S02" (not verified))
	by mta01.hs-regensburg.de (Postfix) with ESMTPS id 45P3PZ1rwgzyCD;
	Wed, 12 Jun 2019 12:43:30 +0200 (CEST)
Received: from [IPv6:2001:638:a01:8061:aefd:ceff:fef3:ba65]
 (2001:638:a01:8013::138) by E16S02.hs-regensburg.de (2001:638:a01:8013::92)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1713.5; Wed, 12 Jun
 2019 12:43:30 +0200
Subject: Re: Linux non-root node question
To: Wayne <racedrive1503@gmail.com>
CC: <jailhouse-dev@googlegroups.com>, <jan.kiszka@siemens.com>
References: <CA++Khc2iKk1J6+0huh5__dS4HyujXzV9r+LbKLzuVZ4K3Bt5eA@mail.gmail.com>
 <57edbc3b-cadc-c850-8310-4640fc623085@oth-regensburg.de>
 <CA++Khc3HLaSEo9z2jd6hVLuDK-zd4P6au0KP3+6db8KBR47izQ@mail.gmail.com>
 <166c6ad9-379c-bad6-f30f-8af4f97b8bb1@oth-regensburg.de>
 <CA++Khc0yQbb3BjzCuR+6JLVqvx7EA3F5JHCFtf5FpN41CiGGVA@mail.gmail.com>
 <f0936088-a32d-3da7-a9ba-d552ede5052e@oth-regensburg.de>
 <CA++Khc0FZSWvVZZyV+4_F0TO7dHPN70Mn3LUCmq_3M2fnGN4ig@mail.gmail.com>
 <CA++Khc0O2zSeuLLY3MaeRW7cQrWbq-6Y2BHJg+x_j6nk=ECa_A@mail.gmail.com>
From: Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>
Openpgp: preference=signencrypt
Message-ID: <ad13aaa6-41ac-14fd-33fe-fa4f6dfc789e@oth-regensburg.de>
Date: Wed, 12 Jun 2019 12:43:29 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.0
MIME-Version: 1.0
In-Reply-To: <CA++Khc0O2zSeuLLY3MaeRW7cQrWbq-6Y2BHJg+x_j6nk=ECa_A@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Language: de-DE
Content-Transfer-Encoding: quoted-printable
X-Originating-IP: [2001:638:a01:8013::138]
X-ClientProxiedBy: E16S02.hs-regensburg.de (2001:638:a01:8013::92) To
 E16S02.hs-regensburg.de (2001:638:a01:8013::92)
X-Original-Sender: ralf.ramsauer@oth-regensburg.de
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass
 header.i=@oth-regensburg.de header.s=mta01-20160622 header.b=HGdDdANG;
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

On 6/11/19 11:05 PM, Wayne wrote:
> Jan/Ralf,
>=20
> I was able to get past issues 1 and 3 above by using Jan's kernel config
> from this thread:
>=20
> https://groups.google.com/forum/#!searchin/jailhouse-dev/Re$3A$20Failed$2=
0to$20boot$20jailhouse%7Csort:relevance/jailhouse-dev/M7UO89XFIk0/Qi40DDuMB=
AAJ".=C2=A0
>=20
> The DMA issue was resolved by disabling kernel option=C2=A0CONFIG_ISA_DMA=
_API
> as stated in another thread, and reflected in the config file above.
>=20
> So now I think i've almost got the non-root linux booting.=C2=A0 I'm stuc=
k at
> the point where its trying to mount a filesystem and since i'm not
> providing an initramfs it panics.

Perfect!

>=20
> Similar to the output below:
>=20
> [ 1.080178] VFS: Cannot open root device "(null)" or unknown-block(0,0):
> error -6
> [ 1.087662] Please append a correct "root=3D" boot option; here are the
> available partitions:
> [ 1.096013] Kernel panic - not syncing: VFS: Unable to mount root fs on
> unknown-block(0,0)
>=20
> I have just a couple more questions:
> 1. In general, is it true that an inmate will takeover control from the
> root of any resource in the following arrays, or are there some cases
> where they get "shared" between the root and inmate?

Depends.

> =C2=A0 =C2=A0 =C2=A0A. ".mem_regions" -> Shared?

May be shared with the root cell (i.e., if the region has the flag
JAILHOUSE_MEM_ROOTSHARED set).

> =C2=A0 =C2=A0 =C2=A0B. ".irqchips" -> Shared?

Shared with whom? Only one guest runs on a CPU. This guest will have
full access to the irqchip. Some accesses must be intercepted.

> =C2=A0 =C2=A0 =C2=A0C. ".pio_bitmap" -> Inmate takes control of these if =
matching
> between inmate and root

Exclusive control.

> =C2=A0 =C2=A0 =C2=A0D. ".pci_devices" -> Inmate takes control?

Exclusive control.

> =C2=A0 =C2=A0 =C2=A0E. ".pci_caps" -> Inmate takes control?

Exclusive control.

>=20
> 2. Along the same lines, going back to my ttyS0 issue mentioned above
> while trying to share it:
>=20
> =C2=A0 =C2=A0 =C2=A0 =C2=A0If I allocate the following to the linux non r=
oot cell (and set
> to -1 in the root)

BTW, there's generally no need to set -1 in the root cell -- it will be
taken away when the non-root cell is created.

> =C2=A0 =C2=A0 =C2=A0.pio_bitmap =3D {
> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 [0x3f8/8 ... 0x3ff/8] =3D 0x00=C2=A0 =
=C2=A0/* serial 2*/
> =C2=A0 =C2=A0 =C2=A0 =C2=A0}
>=20
> =C2=A0 =C2=A0 =C2=A0 =C2=A0Then on the root cell I randomly get a PIO rea=
d fault on "0x3FE"
> when the non-root is booting, i'm not sure what process is causing this.

- Are you sure you remove the device from the kernel cmdline?
- Are you sure that there doesn't spawn a tty? Check with systemctl.
- lsof | grep ttyS
- The root-cell might receive the serial device's interrupt, while its
  ports are assigned to the non-root cell. Does the crash happen when
  you type in a character to the serial line?

  In this case, assign the interrupt to the non-root cell. You will need
  it in any case there once you have a initrd and want to type in stuff.

So there must be some reason why the crash happens. The hard way is to
add 8250.nr_uarts=3D0 in your kernel cmdline of the root cell.

>=20
> =C2=A0 =C2=A0 =C2=A0 =C2=A0if I leave out the pio mapping in the non-root=
 linux, and
> alolothat block in the root cell instead then the non-root linux gets a
> PIO read fault on "0x3F9" while booting.=C2=A0 =C2=A0 =C2=A0 =C2=A0
> =C2=A0 =C2=A0 =C2=A0 =C2=A0Ralf mentioned that Linux would not try enumer=
ate the device if
> its set to -1 (=C2=A0[0x3f8/8 ... 0x3ff/8] =3D -1)=C2=A0 , but the non-ro=
ot seems to
> attempt to do something with it anyway:
>=20
> "[ =C2=A0 =C2=A00.956146]Serial: 8250/16550 driver, 1 ports, IRQ sharing =
enabled"
> "FATAL: Invalid PIO read, port: 3f9: size 1"=C2=A0=20

Hmm. At least that's what I thought. I don't know how enumeration of
platform devices works exactly, but reconsidering this, the behaviour
above makes sense: How would it know that a platform device is not
present, depending of the configuration of the pio_bitmap.

Anyway, 8250 drivers have some cmdline parameters that can be used to
control initialisation (e.g., see the nr_uarts parameters above).

>=20
> =C2=A0 =C2=A0 =C2=A0 =C2=A0Is it possible to map the same pio block in bo=
th the root and
> non-root with a different mask?=C2=A0 Or does the non-root just override =
it?=C2=A0
> It seems like the latter is true.=C2=A0=C2=A0=C2=A0=20

Exactly. That's not a) possible, and b) does not really make sense.

  Ralf

>=20
> Thanks again Jan and Ralf for your help getting to this point.
>=20
>=20
> On Tue, Jun 11, 2019 at 2:13 PM Wayne <racedrive1503@gmail.com
> <mailto:racedrive1503@gmail.com>> wrote:
>=20
>     Jan & Ralf:
>=20
>     I have a little good news, I have successfully gotten the non-root
>     linux to display some startup output based on your suggestions.=C2=A0
>     Also, there must have been some small difference between the stock
>     linux-x86-demo cell config and the one I tweaked.=C2=A0 I went back t=
o
>     the original and made some minor changes and it started displaying
>     the serial output now for the non-root node.
>=20
>     I ended up making the root cell the primary user of the ttyS0
>     device, and just having the non-root linux output to the hypervisor
>     virtual console (console=3Djailhouse).=C2=A0 In my setup, there appea=
rs to
>     be some process still attempting to use the ttyS0 randomly on the
>     root linux, and that causes the hypervisor to halt it if I don't
>     leave it in the PIO array.=C2=A0 Not sure who is doing it.
>=20
>=20
>     This is where i'm at now.=C2=A0 The non-root linux keeps running into
>     points where it tries to access PIO and gets parked:
>=20
>     1. First crash:
>=20
>     [ =C2=A0 =C2=A00.424925]kworker/u6:0 (27) used greated stack depth: 1=
4656
>     bytes left
>     [ =C2=A0 =C2=A00.425807]futex has table entries: 1024 (order: 4, 6553=
6 bytes)
>     "FATAL: Invalid PIO write, port: 70: size 1"
>     ...
>     Parking CPU 3 (Cell: "linux-x86-demo")
>=20
>     According to /proc/ioports, 70 has to do with the Realtime clock
>     (rtc0).=C2=A0 I was able to temporarily add the 70 mapping to the
>     non-root linux, but should it be there at all?=C2=A0 I tried to disab=
le
>     RTC support in the guest kernel config.
>=20
>=20
>     2. On the next attempt, I then got further with a crash trying to
>     initialize Ser device ttyS0:
>=20
>     "[ =C2=A0 =C2=A00.956146]Serial: 8250/16550 driver, 1 ports, IRQ shar=
ing enabled"
>     "FATAL: Invalid PIO read, port: 3f9: size 1"
>     ...
>     Parking CPU 3 (Cell: "linux-x86-demo")
>=20
>     I can get around that if I allow the non-root access in its pio
>     table, but then I have a problem above with the root linux randomly
>     trying to use it.
>=20
>=20
>     3. Now with the temporary adjustments to the non-root pio table
>     above I get here:
>=20
>     "[ =C2=A0 =C2=A00.972399]clocksource:Switched to clocksource tsc"
>     "FATAL: Invalid PIO read, port: 87: size 1"
>     ...
>     Parking CPU 3 (Cell: "linux-x86-demo")
>=20
>     According to proc/ioports this one has to do with "dma page
>     request". It isn't mapped in my root linux PIO or non-root linux arra=
y.
>=20
>=20
>     Aside from the serial conflict, it seems like these should remain
>     controlled by the root linux or hypervisor.=C2=A0 =C2=A0Do you use a
>     particular bare minimum x86 kernel config on your machine for the
>     guest to get around these?=C2=A0 I know Jan mentioned the
>     jailhouse-images project might have something, but I couldn't find
>     it digging around quick.
>=20
>     Thanks to you both for your responses and patience.=C2=A0 I got the r=
oot
>     linux up and going on my own, but the non-root guest is proving to
>     be more difficult.
>=20
>     Wayne
>=20
>=20
>=20
>     On Tue, Jun 11, 2019 at 11:31 AM Ralf Ramsauer
>     <ralf.ramsauer@oth-regensburg.de
>     <mailto:ralf.ramsauer@oth-regensburg.de>> wrote:
>=20
>         Hi,
>=20
>         On 6/10/19 7:45 PM, Wayne wrote:
>         > Thank you for your responses Ralf and Jan.
>         >
>         > Yes, I have successfully gotten both the apic-demo and
>         tiny-demo cells
>         > to work on my system before attempting to load the non-root
>         linux.=C2=A0 I
>         > can see serial output from them.
>         >
>         > However, if I try to share the UART between root and inmate
>         for them I
>         > run into a crash on the hypervisor if the root linux attempts
>         to write
>         > to the UART (after creating/starting a demo).=C2=A0 Does the ro=
ot
>         linux lose
>         > access once an inmate is created/started?=C2=A0 Or am I missing
>         something
>         > from my System config or tiny-demo config that allows them to
>         share?=C2=A0 I
>         > attached the crash in hypervisor_output.txt.
>         >
>         > Also, I noticed the tiny-demo output on the UART gets mirrored
>         on the
>=20
>         Yes, according to your config,
>         JAILHOUSE_CELL_VIRTUAL_CONSOLE_ACTIVE is
>         set. This means that the guest will use the virtual console. The
>         virtual
>         console uses the hypervisor output which depends whatever is set
>         in your
>         system configuration. In your case the hypervisor uses 3f8.
>=20
>         And additionally, the inmate also a valid .console set. Again,
>         3f8. This
>         means, it will use the console *and* the hypervisor debug
>         hypercall. In
>         your case, both outputs are routed to the same device which
>         explains the
>         mirroring.
>=20
>         > Jailhouse virtual console.=C2=A0 Does that mean that its writin=
g to the
>         > serial through the hypervisor and not directly accessing ttyS0
>         itself?
>=20
>         Exactly.
>=20
>         > If so, is there a way to create the cell to write ttyS0
>         directly as a
>         > test?=C2=A0 To see if it exhibits same behavior as the non-root=
 linux.
>=20
>         Sure, simply align the .address field of .console, and allow
>         access to
>         that port via .pio_bitmap.
>=20
>         >
>         > FYI, I create the tiny-demo like this:
>         >
>         > jailhouse cell create configs/x86/tiny-demo.cell
>         > jailhouse cell load tiny-demo inmates/demos/x86/tiny-demo.cell =
=C2=A0
>         > jailhouse cell start tiny-demo
>         >
>         > Going back to my original non-root linux question, I don't see =
any
>         > output when connected over ttyS0.=C2=A0 Its address is 0x3f8
>         ("serial 1") in
>         > the PIO, and that seems to work fine for the other simple
>         demos, minus
>         > the hypervisor crash issue above when sharing.=C2=A0 I know the=
re
>         is the
>         > other "serial 2" port but I haven't tried to use that one.
>=20
>         I see that port on our Dell server as well. It's present, but I
>         don't
>         know where it's connected to.
>=20
>         Let me just summarise your issue:
>=20
>         You only have one serial line available, right? From the root-cel=
l's
>         POV, it's ttyS0 on 3f8.
>=20
>         I would propose to share ttyS0 between the hypervisor and non-roo=
t
>         Linux. This means:
>=20
>         =C2=A0 - Don't let the root-cell use ttyS0. Remove any console=3D=
ttyS0
>         =C2=A0 =C2=A0 parameters from you commandline. Ensure that noone =
else accesses
>         =C2=A0 =C2=A0 ttyS0 (e.g., getty@ttyS0 or other friends)
>=20
>         =C2=A0 - Set 3f8 as debug_console in your master.c (seems you alr=
eady
>         have)
>=20
>         =C2=A0 - Allow 3f8 access in the linux-demo.c (already set in the=
 default
>         =C2=A0 =C2=A0 linux-demo
>=20
>         =C2=A0 - Disallow 2f8 access in linux-demo.c:
>         -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0[ 0x2f8/8=
 ...=C2=A0 0x2ff/8] =3D 0, /* serial2 */
>         +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0[ 0x2f8/8=
 ...=C2=A0 0x2ff/8] =3D -1, /* serial2 */
>=20
>         =C2=A0 =C2=A0 I don't know how Linux enumerates serial devices, b=
ut this
>         ensures
>         =C2=A0 =C2=A0 that Linux won't see the unconnected serial line an=
d map
>         ttyS0 to
>         =C2=A0 =C2=A0 3f8
>=20
>         >
>         > non root linux launched with:
>         > /tools/jailhouse cell linux configs/x86/linux-x86.cell
>         > /boot/vmlinux-4.1.16-Guest -c "console=3DttyS0,115200"
>=20
>         Then, this should actually work...
>=20
>         And if not, then console=3Djailhouse0 should work.
>=20
>         >
>         > I can try the 4.19 siemens kernel and "next" branch for
>         jailhouse you
>         > suggested.=C2=A0 Do you think that combination will resolve the=
 missing
>         > serial for the non-root linux?=C2=A0 Otherwise, did my kernel
>         config, system
>         > config, and non-root linux cell configs look OK?
>=20
>         I didn't look at it, but we should at least - even if some flags =
are
>         still incorrect - see the "Uncompressing kernel..." thing.
>=20
>         Wait -- one thing you could try: Deactivate CONFIG_EFI and
>         especially
>         CONFIG_EFI_STUBS. I'm not sure, but it could be that EFI_STUBS
>         change
>         the header format that our bootloader patches.
>=20
>         >
>         > Thanks again for your help.
>=20
>         No problem. But it's not yet working. ;-)
>=20
>         =C2=A0 Ralf
>=20
>         >
>         >
>         > On Fri, Jun 7, 2019 at 5:30 PM Ralf Ramsauer
>         > <ralf.ramsauer@oth-regensburg.de
>         <mailto:ralf.ramsauer@oth-regensburg.de>
>         > <mailto:ralf.ramsauer@oth-regensburg.de
>         <mailto:ralf.ramsauer@oth-regensburg.de>>> wrote:
>         >
>         >=C2=A0 =C2=A0 =C2=A0Hi Wayne,
>         >
>         >=C2=A0 =C2=A0 =C2=A0On 6/7/19 10:04 PM, Wayne wrote:
>         >=C2=A0 =C2=A0 =C2=A0> Hi Ralf,
>         >=C2=A0 =C2=A0 =C2=A0>
>         >=C2=A0 =C2=A0 =C2=A0> Thank you for your responses.=C2=A0 I have=
 attached the
>         requested config
>         >=C2=A0 =C2=A0 =C2=A0> files.=C2=A0 I am now just trying to use t=
he same bzImage for
>         the root and
>         >=C2=A0 =C2=A0 =C2=A0> the non-root linux node.
>         >
>         >=C2=A0 =C2=A0 =C2=A0One question that you didn't answer: do apic=
-demo or
>         tiny-demo work?
>         >=C2=A0 =C2=A0 =C2=A0They need to to have correct .console parame=
ter set, so
>         ensure that
>         >=C2=A0 =C2=A0 =C2=A0parameters are set if you run those demos in=
 your
>         linux-demo cell. Just
>         >=C2=A0 =C2=A0 =C2=A0compare it to tiny-demo.c or apic-demo.c
>         >
>         >=C2=A0 =C2=A0 =C2=A0>
>         >=C2=A0 =C2=A0 =C2=A0> Yes, I am using vanilla 4.16 because the d=
ocumentation
>         indicated
>         >=C2=A0 =C2=A0 =C2=A0that it
>         >=C2=A0 =C2=A0 =C2=A0> is the first mainline release to officiall=
y support
>         Jailhouse Guest
>         >=C2=A0 =C2=A0 =C2=A0> images.=C2=A0 Do you suggest that I use so=
mething else?
>         >
>         >=C2=A0 =C2=A0 =C2=A0As Jan already wrote: Try to use Siemens' 4.=
19 branch.
>         >
>         >=C2=A0 =C2=A0 =C2=A0>
>         >=C2=A0 =C2=A0 =C2=A0> Right now i'm just trying to get some seri=
al output from
>         the non-root
>         >=C2=A0 =C2=A0 =C2=A0> Linux.=C2=A0 Hopefully, I have that config=
ured correctly.=C2=A0
>         Ideally, I would
>         >=C2=A0 =C2=A0 =C2=A0> like to share the same serial console for =
the Root node
>         and non-root
>         >=C2=A0 =C2=A0 =C2=A0> node eventually if possible.=C2=A0 I have =
been OK with using
>         the virtual
>         >=C2=A0 =C2=A0 =C2=A0> console (jailhouse console -f) for the Hyp=
ervisor output.
>         >
>         >=C2=A0 =C2=A0 =C2=A0In addition to Jan's comment:
>         >
>         >=C2=A0 =C2=A0 =C2=A0Currently you only have access to the jailho=
use console
>         via 'jailhouse
>         >=C2=A0 =C2=A0 =C2=A0console' from your root cell. Imagine your r=
oot cell
>         crashes for some
>         >=C2=A0 =C2=A0 =C2=A0reason. You will never see the fault reason,=
 which makes
>         things hard to
>         >=C2=A0 =C2=A0 =C2=A0debug.
>         >
>         >=C2=A0 =C2=A0 =C2=A0I would suggest to configure the hypervisor =
to use the
>         serial console.
>         >=C2=A0 =C2=A0 =C2=A0You can share the device with the non-root L=
inux, that's
>         no problem.
>         >
>         >=C2=A0 =C2=A0 =C2=A0In this case, the non-root kernel's output w=
ill always be
>         printed to the
>         >=C2=A0 =C2=A0 =C2=A0serial console. Directly, if you choose cons=
ole=3DttySx, and
>         indirectly
>         >=C2=A0 =C2=A0 =C2=A0via the hypervisor if you choose console=3Dj=
ailhouse.
>         >
>         >=C2=A0 =C2=A0 =C2=A0BTW: According to your config, your system i=
s a PowerEdge,
>         and the
>         >=C2=A0 =C2=A0 =C2=A0non-root cell gets both, 0x2f8 and 0x3f8. Ar=
e you sure
>         that ttyS1 is the
>         >=C2=A0 =C2=A0 =C2=A0correct console that you are connected to?
>         >
>         >=C2=A0 =C2=A0 =C2=A0Just mentioning this as we have a similar ma=
chine here,
>         and, afair, both
>         >=C2=A0 =C2=A0 =C2=A0platform serial device are 'usable', but one=
 ends in the
>         nirvana while
>         >=C2=A0 =C2=A0 =C2=A0it is accessible.
>         >
>         >=C2=A0 =C2=A0 =C2=A0Ah, and one last thing: try to switch to the=
 current next
>         branch for
>         >=C2=A0 =C2=A0 =C2=A0jailhouse. Jan just integrated a few patches=
 from me that
>         might also be
>         >=C2=A0 =C2=A0 =C2=A0relevant for your machine.
>         >
>         >=C2=A0 =C2=A0 =C2=A0HTH
>         >=C2=A0 =C2=A0 =C2=A0=C2=A0 Ralf
>         >
>         >=C2=A0 =C2=A0 =C2=A0>
>         >=C2=A0 =C2=A0 =C2=A0> Wayne
>         >=C2=A0 =C2=A0 =C2=A0>
>         >=C2=A0 =C2=A0 =C2=A0> On Fri, Jun 7, 2019 at 9:10 AM Ralf Ramsau=
er
>         >=C2=A0 =C2=A0 =C2=A0> <ralf.ramsauer@oth-regensburg.de
>         <mailto:ralf.ramsauer@oth-regensburg.de>
>         >=C2=A0 =C2=A0 =C2=A0<mailto:ralf.ramsauer@oth-regensburg.de
>         <mailto:ralf.ramsauer@oth-regensburg.de>>
>         >=C2=A0 =C2=A0 =C2=A0> <mailto:ralf.ramsauer@oth-regensburg.de
>         <mailto:ralf.ramsauer@oth-regensburg.de>
>         >=C2=A0 =C2=A0 =C2=A0<mailto:ralf.ramsauer@oth-regensburg.de
>         <mailto:ralf.ramsauer@oth-regensburg.de>>>> wrote:
>         >=C2=A0 =C2=A0 =C2=A0>
>         >=C2=A0 =C2=A0 =C2=A0>=C2=A0 =C2=A0 =C2=A0Hi,
>         >=C2=A0 =C2=A0 =C2=A0>
>         >=C2=A0 =C2=A0 =C2=A0>=C2=A0 =C2=A0 =C2=A0On 6/7/19 2:28 PM, Wayn=
e wrote:
>         >=C2=A0 =C2=A0 =C2=A0>=C2=A0 =C2=A0 =C2=A0> Hello,
>         >=C2=A0 =C2=A0 =C2=A0>=C2=A0 =C2=A0 =C2=A0>
>         >=C2=A0 =C2=A0 =C2=A0>=C2=A0 =C2=A0 =C2=A0> I am new to Linux dev=
elopment and Jailhouse.=C2=A0 I have
>         >=C2=A0 =C2=A0 =C2=A0successfully
>         >=C2=A0 =C2=A0 =C2=A0>=C2=A0 =C2=A0 =C2=A0booted
>         >=C2=A0 =C2=A0 =C2=A0>=C2=A0 =C2=A0 =C2=A0> the Jailhouse Hypervi=
sor and root cell on a bare
>         metal X86 Linux
>         >=C2=A0 =C2=A0 =C2=A0>=C2=A0 =C2=A0 =C2=A0system
>         >=C2=A0 =C2=A0 =C2=A0>=C2=A0 =C2=A0 =C2=A0> (No QEMU).=C2=A0 I am=
 now trying to load a non-root
>         Linux cell
>         >=C2=A0 =C2=A0 =C2=A0and I have a
>         >=C2=A0 =C2=A0 =C2=A0>=C2=A0 =C2=A0 =C2=A0> few questions.=C2=A0 =
Jailhouse accepts and starts my
>         non-root
>         >=C2=A0 =C2=A0 =C2=A0linux cell
>         >=C2=A0 =C2=A0 =C2=A0>=C2=A0 =C2=A0 =C2=A0> configuration and I s=
ee it as "running" through the
>         >=C2=A0 =C2=A0 =C2=A0"jailhouse cell
>         >=C2=A0 =C2=A0 =C2=A0>=C2=A0 =C2=A0 =C2=A0> list" command.=C2=A0 =
However, I don't see any serial
>         output from the
>         >=C2=A0 =C2=A0 =C2=A0>=C2=A0 =C2=A0 =C2=A0> "non-root linux" cell=
 booting up.=C2=A0 I=E2=80=99m not sure
>         what the
>         >=C2=A0 =C2=A0 =C2=A0non-root node
>         >=C2=A0 =C2=A0 =C2=A0>=C2=A0 =C2=A0 =C2=A0> is doing at this poin=
t.
>         >=C2=A0 =C2=A0 =C2=A0>
>         >=C2=A0 =C2=A0 =C2=A0>=C2=A0 =C2=A0 =C2=A0Ok, first of all, can y=
ou see any output from
>         Jailhouse's demo
>         >=C2=A0 =C2=A0 =C2=A0inmates
>         >=C2=A0 =C2=A0 =C2=A0>=C2=A0 =C2=A0 =C2=A0(e.g., tiny-demo or api=
c-demo)?
>         >=C2=A0 =C2=A0 =C2=A0>
>         >=C2=A0 =C2=A0 =C2=A0>=C2=A0 =C2=A0 =C2=A0>
>         >=C2=A0 =C2=A0 =C2=A0>=C2=A0 =C2=A0 =C2=A0> =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0My root node is a 4.16 kernel
>         configured this
>         >=C2=A0 =C2=A0 =C2=A0way:
>         >=C2=A0 =C2=A0 =C2=A0>=C2=A0 =C2=A0 =C2=A0> =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 1.
>         CONFIG_JAILHOUSE_GUEST is
>         >=C2=A0 =C2=A0 =C2=A0not set
>         >=C2=A0 =C2=A0 =C2=A0>=C2=A0 =C2=A0 =C2=A0> =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 2. CONFIG_SERIO=3Dy
>         >=C2=A0 =C2=A0 =C2=A0>=C2=A0 =C2=A0 =C2=A0> =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 3.
>         >=C2=A0 =C2=A0 =C2=A0CONFIG_SERIAL_8250_RUNTIME_UARTS=3D4
>         >=C2=A0 =C2=A0 =C2=A0>=C2=A0 =C2=A0 =C2=A0>
>         >=C2=A0 =C2=A0 =C2=A0>=C2=A0 =C2=A0 =C2=A0> =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0My non-root node is a 4.16 kernel
>         configured
>         >=C2=A0 =C2=A0 =C2=A0this way:
>         >=C2=A0 =C2=A0 =C2=A0>=C2=A0 =C2=A0 =C2=A0> =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 1.
>         CONFIG_JAILHOUSE_GUEST=3Dy
>         >=C2=A0 =C2=A0 =C2=A0>=C2=A0 =C2=A0 =C2=A0> =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 2. CONFIG_SERIO=3Dm
>         (can't seem
>         >=C2=A0 =C2=A0 =C2=A0to disable
>         >=C2=A0 =C2=A0 =C2=A0>=C2=A0 =C2=A0 =C2=A0> completely in my conf=
ig for 4.16)
>         >=C2=A0 =C2=A0 =C2=A0>=C2=A0 =C2=A0 =C2=A0> =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 3.
>         >=C2=A0 =C2=A0 =C2=A0CONFIG_SERIAL_8250_RUNTIME_UARTS=3D1
>         >=C2=A0 =C2=A0 =C2=A0>
>         >=C2=A0 =C2=A0 =C2=A0>=C2=A0 =C2=A0 =C2=A0Could you please provid=
e a full .config? What branch
>         are you
>         >=C2=A0 =C2=A0 =C2=A0exactly
>         >=C2=A0 =C2=A0 =C2=A0>=C2=A0 =C2=A0 =C2=A0using? Vanilla 4.16?
>         >=C2=A0 =C2=A0 =C2=A0>
>         >=C2=A0 =C2=A0 =C2=A0>=C2=A0 =C2=A0 =C2=A0Please attach your syst=
em config and your non-root linux
>         >=C2=A0 =C2=A0 =C2=A0config as well.
>         >=C2=A0 =C2=A0 =C2=A0>
>         >=C2=A0 =C2=A0 =C2=A0>=C2=A0 =C2=A0 =C2=A0You may also want to tr=
y
>         https://github.com/siemens/linux . See
>         >=C2=A0 =C2=A0 =C2=A0>=C2=A0 =C2=A0 =C2=A0jailhouse-enabling bran=
ches for some releases.
>         >=C2=A0 =C2=A0 =C2=A0>
>         >=C2=A0 =C2=A0 =C2=A0>=C2=A0 =C2=A0 =C2=A0>
>         >=C2=A0 =C2=A0 =C2=A0>=C2=A0 =C2=A0 =C2=A0> In general, do the ke=
rnel config settings have to
>         match between
>         >=C2=A0 =C2=A0 =C2=A0>=C2=A0 =C2=A0 =C2=A0the root
>         >=C2=A0 =C2=A0 =C2=A0>=C2=A0 =C2=A0 =C2=A0> node and non-linux or=
 is the above fine?
>         >=C2=A0 =C2=A0 =C2=A0>
>         >=C2=A0 =C2=A0 =C2=A0>=C2=A0 =C2=A0 =C2=A0No, they do not have to=
 be the same, but they can.
>         Still, an
>         >=C2=A0 =C2=A0 =C2=A0analysis
>         >=C2=A0 =C2=A0 =C2=A0>=C2=A0 =C2=A0 =C2=A0requires your .config.
>         >=C2=A0 =C2=A0 =C2=A0>
>         >=C2=A0 =C2=A0 =C2=A0>=C2=A0 =C2=A0 =C2=A0>
>         >=C2=A0 =C2=A0 =C2=A0>=C2=A0 =C2=A0 =C2=A0> The vmlinux-4.1.16-Gu=
est bzImage is approx 7MB,
>         and the
>         >=C2=A0 =C2=A0 =C2=A0inmate node is
>         >=C2=A0 =C2=A0 =C2=A0>=C2=A0 =C2=A0 =C2=A0> allocated ~75MB of RA=
M.
>         >=C2=A0 =C2=A0 =C2=A0>=C2=A0 =C2=A0 =C2=A0>
>         >=C2=A0 =C2=A0 =C2=A0>=C2=A0 =C2=A0 =C2=A0> I have a single UART,=
 so I have configured the
>         root cell
>         >=C2=A0 =C2=A0 =C2=A0system config
>         >=C2=A0 =C2=A0 =C2=A0>=C2=A0 =C2=A0 =C2=A0> to output to the virt=
ual hypervisor console:
>         >=C2=A0 =C2=A0 =C2=A0>
>         >=C2=A0 =C2=A0 =C2=A0>=C2=A0 =C2=A0 =C2=A0Wait... You configured =
your root-cell to use the
>         hypervisor debug
>         >=C2=A0 =C2=A0 =C2=A0>=C2=A0 =C2=A0 =C2=A0console? How? It's only=
 available once the hypervisor is
>         >=C2=A0 =C2=A0 =C2=A0enabled. How
>         >=C2=A0 =C2=A0 =C2=A0>=C2=A0 =C2=A0 =C2=A0should this work?
>         >=C2=A0 =C2=A0 =C2=A0>
>         >=C2=A0 =C2=A0 =C2=A0>=C2=A0 =C2=A0 =C2=A0But let's have a look a=
t your configuration first.
>         >=C2=A0 =C2=A0 =C2=A0>
>         >=C2=A0 =C2=A0 =C2=A0>=C2=A0 =C2=A0 =C2=A0So you want to:
>         >=C2=A0 =C2=A0 =C2=A0>=C2=A0 =C2=A0 =C2=A0=C2=A0 - Have the UART =
(0x3f8) available in the non-root cell
>         >=C2=A0 =C2=A0 =C2=A0>=C2=A0 =C2=A0 =C2=A0=C2=A0 - Use 0x3f8 as h=
ypervisor debug console as well
>         >=C2=A0 =C2=A0 =C2=A0>=C2=A0 =C2=A0 =C2=A0=C2=A0 - No console for=
 root-cell
>         >=C2=A0 =C2=A0 =C2=A0>
>         >=C2=A0 =C2=A0 =C2=A0>=C2=A0 =C2=A0 =C2=A0Did I get this right?
>         >=C2=A0 =C2=A0 =C2=A0>
>         >=C2=A0 =C2=A0 =C2=A0>=C2=A0 =C2=A0 =C2=A0=C2=A0 Ralf
>         >=C2=A0 =C2=A0 =C2=A0>
>         >=C2=A0 =C2=A0 =C2=A0>=C2=A0 =C2=A0 =C2=A0>
>         >=C2=A0 =C2=A0 =C2=A0>=C2=A0 =C2=A0 =C2=A0> .flags =3D JAILHOUSE_=
SYS_VIRTUAL_DEBUG_CONSOLE,
>         >=C2=A0 =C2=A0 =C2=A0>=C2=A0 =C2=A0 =C2=A0>
>         >=C2=A0 =C2=A0 =C2=A0>=C2=A0 =C2=A0 =C2=A0> .debug_console =3D {
>         >=C2=A0 =C2=A0 =C2=A0>=C2=A0 =C2=A0 =C2=A0> .type =3D JAILHOUSE_C=
ON_TYPE_NONE,
>         >=C2=A0 =C2=A0 =C2=A0>=C2=A0 =C2=A0 =C2=A0> },
>         >=C2=A0 =C2=A0 =C2=A0>=C2=A0 =C2=A0 =C2=A0>
>         >=C2=A0 =C2=A0 =C2=A0>=C2=A0 =C2=A0 =C2=A0> and I have configured=
 the non-root linux cell to
>         output to
>         >=C2=A0 =C2=A0 =C2=A0the UART:
>         >=C2=A0 =C2=A0 =C2=A0>=C2=A0 =C2=A0 =C2=A0>
>         >=C2=A0 =C2=A0 =C2=A0>=C2=A0 =C2=A0 =C2=A0> (Added serial 0x3f8 t=
o pio bitmap for non-root
>         linux) and
>         >=C2=A0 =C2=A0 =C2=A0started the
>         >=C2=A0 =C2=A0 =C2=A0>=C2=A0 =C2=A0 =C2=A0> node with this:
>         >=C2=A0 =C2=A0 =C2=A0>=C2=A0 =C2=A0 =C2=A0>
>         >=C2=A0 =C2=A0 =C2=A0>=C2=A0 =C2=A0 =C2=A0> ./tools/jailhouse cel=
l linux
>         configs/x86/linux-x86.cell
>         >=C2=A0 =C2=A0 =C2=A0>=C2=A0 =C2=A0 =C2=A0> /boot/vmlinux-4.1.16-=
Guest -c "console=3DttyS0,115200"
>         >=C2=A0 =C2=A0 =C2=A0>=C2=A0 =C2=A0 =C2=A0> (Note I also tried "c=
onsole=3Djailhouse" in the
>         command above,
>         >=C2=A0 =C2=A0 =C2=A0and that
>         >=C2=A0 =C2=A0 =C2=A0>=C2=A0 =C2=A0 =C2=A0> produces the same res=
ult)
>         >=C2=A0 =C2=A0 =C2=A0>=C2=A0 =C2=A0 =C2=A0>
>         >=C2=A0 =C2=A0 =C2=A0>=C2=A0 =C2=A0 =C2=A0> I then see the follow=
ing on my hypervisor console
>         >=C2=A0 =C2=A0 =C2=A0(./tools/jailhouse
>         >=C2=A0 =C2=A0 =C2=A0>=C2=A0 =C2=A0 =C2=A0> console -f):
>         >=C2=A0 =C2=A0 =C2=A0>=C2=A0 =C2=A0 =C2=A0>
>         >=C2=A0 =C2=A0 =C2=A0>=C2=A0 =C2=A0 =C2=A0> Created cell "linux-x=
86-demo"
>         >=C2=A0 =C2=A0 =C2=A0>=C2=A0 =C2=A0 =C2=A0> ...
>         >=C2=A0 =C2=A0 =C2=A0>=C2=A0 =C2=A0 =C2=A0> Cell "linux-x86-demo"=
 can be loaded
>         >=C2=A0 =C2=A0 =C2=A0>=C2=A0 =C2=A0 =C2=A0> Started cell "linux-x=
86-demo"
>         >=C2=A0 =C2=A0 =C2=A0>=C2=A0 =C2=A0 =C2=A0>
>         >=C2=A0 =C2=A0 =C2=A0>=C2=A0 =C2=A0 =C2=A0> After a little while =
I do get a parked CPU error
>         on the root
>         >=C2=A0 =C2=A0 =C2=A0node,
>         >=C2=A0 =C2=A0 =C2=A0>=C2=A0 =C2=A0 =C2=A0looks
>         >=C2=A0 =C2=A0 =C2=A0>=C2=A0 =C2=A0 =C2=A0> like its trying to do=
 something with the UART as well:
>         >=C2=A0 =C2=A0 =C2=A0>=C2=A0 =C2=A0 =C2=A0> FATAL: Invalid PIO re=
ad, port: 3fe size: 1
>         >=C2=A0 =C2=A0 =C2=A0>=C2=A0 =C2=A0 =C2=A0>
>         >=C2=A0 =C2=A0 =C2=A0>=C2=A0 =C2=A0 =C2=A0> I would expect someth=
ing to pop out on the UART
>         from the
>         >=C2=A0 =C2=A0 =C2=A0non-root
>         >=C2=A0 =C2=A0 =C2=A0>=C2=A0 =C2=A0 =C2=A0linux
>         >=C2=A0 =C2=A0 =C2=A0>=C2=A0 =C2=A0 =C2=A0> node first.=C2=A0 Not=
e that root node has serial 0x3f8
>         disabled
>         >=C2=A0 =C2=A0 =C2=A0in its pio
>         >=C2=A0 =C2=A0 =C2=A0>=C2=A0 =C2=A0 =C2=A0> bitmap.
>         >=C2=A0 =C2=A0 =C2=A0>=C2=A0 =C2=A0 =C2=A0>
>         >=C2=A0 =C2=A0 =C2=A0>=C2=A0 =C2=A0 =C2=A0> I verifed that the UA=
RT is functioning by allowing the
>         >=C2=A0 =C2=A0 =C2=A0hypervisor to
>         >=C2=A0 =C2=A0 =C2=A0>=C2=A0 =C2=A0 =C2=A0> print to it and also =
performed an echo test over
>         ttyS0.
>         >=C2=A0 =C2=A0 =C2=A0>=C2=A0 =C2=A0 =C2=A0>
>         >=C2=A0 =C2=A0 =C2=A0>=C2=A0 =C2=A0 =C2=A0> I have tried several =
configurations of
>         kernel.....including your
>         >=C2=A0 =C2=A0 =C2=A0>=C2=A0 =C2=A0 =C2=A0current
>         >=C2=A0 =C2=A0 =C2=A0>=C2=A0 =C2=A0 =C2=A0> "queues/jailhouse" br=
anch head kernel for the
>         non-root node,
>         >=C2=A0 =C2=A0 =C2=A0along
>         >=C2=A0 =C2=A0 =C2=A0>=C2=A0 =C2=A0 =C2=A0with
>         >=C2=A0 =C2=A0 =C2=A0>=C2=A0 =C2=A0 =C2=A0> the kernel config for=
 4.7 posted in this thread
>         below (but I
>         >=C2=A0 =C2=A0 =C2=A0get same
>         >=C2=A0 =C2=A0 =C2=A0>=C2=A0 =C2=A0 =C2=A0> result as above when =
I start it, no kernel output):
>         >=C2=A0 =C2=A0 =C2=A0>=C2=A0 =C2=A0 =C2=A0> =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0
>         >=C2=A0 =C2=A0 =C2=A0>=C2=A0 =C2=A0 =C2=A0>
>         >=C2=A0 =C2=A0 =C2=A0>=C2=A0 =C2=A0
>         >=C2=A0 =C2=A0
>         =C2=A0=C2=A0=C2=A0"https://groups.google.com/forum/#!searchin/jai=
lhouse-dev/Re$3A$20Failed$20to$20boot$20jailhouse%7Csort:relevance/jailhous=
e-dev/M7UO89XFIk0/Qi40DDuMBAAJ".
>         >=C2=A0 =C2=A0 =C2=A0>=C2=A0 =C2=A0 =C2=A0>
>         >=C2=A0 =C2=A0 =C2=A0>=C2=A0 =C2=A0 =C2=A0> Any information you c=
an provide to me will be
>         helpful.=C2=A0 I'm
>         >=C2=A0 =C2=A0 =C2=A0not sure
>         >=C2=A0 =C2=A0 =C2=A0>=C2=A0 =C2=A0 =C2=A0> what might be going w=
rong here.
>         >=C2=A0 =C2=A0 =C2=A0>=C2=A0 =C2=A0 =C2=A0>
>         >=C2=A0 =C2=A0 =C2=A0>=C2=A0 =C2=A0 =C2=A0> Thanks,
>         >=C2=A0 =C2=A0 =C2=A0>=C2=A0 =C2=A0 =C2=A0> Wayne
>         >=C2=A0 =C2=A0 =C2=A0>=C2=A0 =C2=A0 =C2=A0>
>         >=C2=A0 =C2=A0 =C2=A0>=C2=A0 =C2=A0 =C2=A0> --
>         >=C2=A0 =C2=A0 =C2=A0>=C2=A0 =C2=A0 =C2=A0> You received this mes=
sage because you are
>         subscribed to the
>         >=C2=A0 =C2=A0 =C2=A0Google
>         >=C2=A0 =C2=A0 =C2=A0>=C2=A0 =C2=A0 =C2=A0> Groups "Jailhouse" gr=
oup.
>         >=C2=A0 =C2=A0 =C2=A0>=C2=A0 =C2=A0 =C2=A0> To unsubscribe from t=
his group and stop receiving
>         emails
>         >=C2=A0 =C2=A0 =C2=A0from it, send
>         >=C2=A0 =C2=A0 =C2=A0>=C2=A0 =C2=A0 =C2=A0> an email to
>         jailhouse-dev+unsubscribe@googlegroups.com
>         <mailto:jailhouse-dev%2Bunsubscribe@googlegroups.com>
>         >=C2=A0 =C2=A0 =C2=A0<mailto:jailhouse-dev%2Bunsubscribe@googlegr=
oups.com
>         <mailto:jailhouse-dev%252Bunsubscribe@googlegroups.com>>
>         >=C2=A0 =C2=A0 =C2=A0>=C2=A0 =C2=A0 =C2=A0<mailto:jailhouse-dev%2=
Bunsubscribe@googlegroups.com
>         <mailto:jailhouse-dev%252Bunsubscribe@googlegroups.com>
>         >=C2=A0 =C2=A0 =C2=A0<mailto:jailhouse-dev%252Bunsubscribe@google=
groups.com
>         <mailto:jailhouse-dev%25252Bunsubscribe@googlegroups.com>>>
>         >=C2=A0 =C2=A0 =C2=A0>=C2=A0 =C2=A0 =C2=A0> <mailto:jailhouse-dev=
+unsubscribe@googlegroups.com
>         <mailto:jailhouse-dev%2Bunsubscribe@googlegroups.com>
>         >=C2=A0 =C2=A0 =C2=A0<mailto:jailhouse-dev%2Bunsubscribe@googlegr=
oups.com
>         <mailto:jailhouse-dev%252Bunsubscribe@googlegroups.com>>
>         >=C2=A0 =C2=A0 =C2=A0>=C2=A0 =C2=A0 =C2=A0<mailto:jailhouse-dev%2=
Bunsubscribe@googlegroups.com
>         <mailto:jailhouse-dev%252Bunsubscribe@googlegroups.com>
>         >=C2=A0 =C2=A0 =C2=A0<mailto:jailhouse-dev%252Bunsubscribe@google=
groups.com
>         <mailto:jailhouse-dev%25252Bunsubscribe@googlegroups.com>>>>.
>         >=C2=A0 =C2=A0 =C2=A0>=C2=A0 =C2=A0 =C2=A0> To view this discussi=
on on the web visit
>         >=C2=A0 =C2=A0 =C2=A0>=C2=A0 =C2=A0 =C2=A0>
>         >=C2=A0 =C2=A0 =C2=A0>=C2=A0 =C2=A0
>         >=C2=A0 =C2=A0
>         =C2=A0=C2=A0https://groups.google.com/d/msgid/jailhouse-dev/CA%2B=
%2BKhc2iKk1J6%2B0huh5__dS4HyujXzV9r%2BLbKLzuVZ4K3Bt5eA%40mail.gmail.com
>         >=C2=A0 =C2=A0 =C2=A0>=C2=A0 =C2=A0 =C2=A0>
>         >=C2=A0 =C2=A0 =C2=A0>=C2=A0 =C2=A0
>         >=C2=A0 =C2=A0
>         =C2=A0=C2=A0<https://groups.google.com/d/msgid/jailhouse-dev/CA%2=
B%2BKhc2iKk1J6%2B0huh5__dS4HyujXzV9r%2BLbKLzuVZ4K3Bt5eA%40mail.gmail.com?ut=
m_medium=3Demail&utm_source=3Dfooter>.
>         >=C2=A0 =C2=A0 =C2=A0>=C2=A0 =C2=A0 =C2=A0> For more options, vis=
it
>         https://groups.google.com/d/optout.
>         >=C2=A0 =C2=A0 =C2=A0>
>         >
>=20
> --=20
> You received this message because you are subscribed to the Google
> Groups "Jailhouse" group.
> To unsubscribe from this group and stop receiving emails from it, send
> an email to jailhouse-dev+unsubscribe@googlegroups.com
> <mailto:jailhouse-dev+unsubscribe@googlegroups.com>.
> To view this discussion on the web visit
> https://groups.google.com/d/msgid/jailhouse-dev/CA%2B%2BKhc0O2zSeuLLY3Mae=
RW7cQrWbq-6Y2BHJg%2Bx_j6nk%3DECa_A%40mail.gmail.com
> <https://groups.google.com/d/msgid/jailhouse-dev/CA%2B%2BKhc0O2zSeuLLY3Ma=
eRW7cQrWbq-6Y2BHJg%2Bx_j6nk%3DECa_A%40mail.gmail.com?utm_medium=3Demail&utm=
_source=3Dfooter>.
> For more options, visit https://groups.google.com/d/optout.

--=20
You received this message because you are subscribed to the Google Groups "=
Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/=
jailhouse-dev/ad13aaa6-41ac-14fd-33fe-fa4f6dfc789e%40oth-regensburg.de.
For more options, visit https://groups.google.com/d/optout.
