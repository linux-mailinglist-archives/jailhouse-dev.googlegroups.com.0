Return-Path: <jailhouse-dev+bncBD4JZQXE5UFRB4VO5PTQKGQET4YEI2A@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-wr1-x43d.google.com (mail-wr1-x43d.google.com [IPv6:2a00:1450:4864:20::43d])
	by mail.lfdr.de (Postfix) with ESMTPS id 6255D397C3
	for <lists+jailhouse-dev@lfdr.de>; Fri,  7 Jun 2019 23:30:27 +0200 (CEST)
Received: by mail-wr1-x43d.google.com with SMTP id b14sf1388597wrn.8
        for <lists+jailhouse-dev@lfdr.de>; Fri, 07 Jun 2019 14:30:27 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1559943027; cv=pass;
        d=google.com; s=arc-20160816;
        b=D149w85NA0L4Rzecy0ZtrGnkwoiu8qpXjEWnls9+bKzVvdqanSUpTm4mYh/2RwyxFq
         jiR4wZ9+mbZ9qFDIdX0B02kWICRHzQ7gPCKeRSAj3MT+VVrjovI+D11fPGkMEouC5X5Z
         zCgtNR0mR5fphIKg7gVtJVH6pkgp0Wf9ao2k7GGOh5W0bnC7pICVnSH2QTzHAVjotQhr
         q9WVc8Nce8Lp8uYFcKKaiBuFuSmz6xOYLaY4MJjE1RyrUzGvaVVBToSNA0AsBV/WK3y6
         mv0x+CXszbt1NMfxlpjC7nwagKtSVks5inn2ev+8RYC7bGp/YBjiD8E8wuXf25OL8Lf5
         kmqw==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:subject:autocrypt:openpgp:from:references:cc:to:sender
         :dkim-signature;
        bh=uAQAEACSp7y5t6/bypaud+GPb34N9ooA8VZRWmlPvAw=;
        b=b1URd1xvaFENZTOqPEGQpzxR4bkR0+E+OWX171QynWwocdpM1jj998Rhq2ysBCYJ1V
         ky+0/hMjUmBUGQQ02JE2duZpaatkUdxLoqZT1ijv5HCM1PIVFAjPGHhuE1nFX7+ywdvY
         EMuhC0JXQspQmmhnEfTqauMKYkr7+yjf+nzoZd1Z4fQOmPDrRiYt8dpaMS7cP71xRDTj
         ZdOx3wCcp/uPg6ptXHA9uxpz12yHBvGmzMRYPGv5Y75lOFiwOTk2tbJ7xlclCgdBEUA+
         oS8tQ561FlB9llUVxy1KtDMSCmG5cpfRUK1jxFOKS/D9/pBISr7nP1+u22EcBIhp9z/m
         Anwg==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass header.i=@oth-regensburg.de header.s=mta01-20160622 header.b=HB2w7zfu;
       spf=pass (google.com: domain of ralf.ramsauer@oth-regensburg.de designates 2001:638:a01:1096::11 as permitted sender) smtp.mailfrom=ralf.ramsauer@oth-regensburg.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=oth-regensburg.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:to:cc:references:from:openpgp:autocrypt:subject:message-id
         :date:user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :list-post:list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=uAQAEACSp7y5t6/bypaud+GPb34N9ooA8VZRWmlPvAw=;
        b=mdv4tEwfcuCXp6mVbw0A+t5lqRaGX7vYQiYVe/Z2m8f6uEu5h9WkVi6kKB7LClbPcO
         qQTMNflTaALjleSw+ae/sPrbUWR9g0GOZ/z2FJbnWYsuL+aXgr8ywdqeVozA8rS3rudh
         P0Rb488BJlXclJUdbxzyaMtCqU0V2WOIzhO1Og4O0b5/8sp0iduZ95+S52nspWgT0qno
         YgLG3l/92SdsCRdY5jyk6DH/KdHvx1WJZaRmc1LGBTNcQNnAm7fFqosib+KAhGXDift1
         8jWrCelhZljrgUZwqniaHrhe9m8oO3joIIpqRILjKKniHyAPUrIK1tvPparEY15qMLkE
         L5Lw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:to:cc:references:from:openpgp:autocrypt
         :subject:message-id:date:user-agent:mime-version:in-reply-to
         :content-language:content-transfer-encoding:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :x-spam-checked-in-group:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=uAQAEACSp7y5t6/bypaud+GPb34N9ooA8VZRWmlPvAw=;
        b=FSKwI0nTVKae/dKy9t2FB9bVaBqE68v10xxAsFmPSFgdWMYOtQoJOZI5UYWvRHZwdS
         xKZGgMc1Udu2KP6pFTbgNoKi+rT+JRJhgVZwWmL6pfVN81gl3G794H0lgjuMxBP2T/Rj
         Uarvn/juVISWi9ZrzSUKdFtALRWiDvyspAqd7fAu29MZ75SyfipcdbNzpv+MH41jP0Ly
         7+P5dvkVwEbG9w8kQjfQhwYisHedG4/jjNr9IeUJQpnK5ZicvzbO5UW657xXcuPP+T4U
         jfYI4/wVJ/Lq7lYYQ1+tJWdddIwh/K8trz7rQbG9r7EW/phiNyHM52j7dKb7ZemBpv3p
         mxMw==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: APjAAAUIW9HvLrbfPZteJ6/Er/MnAooOZAlRkJJsrFTdNB5UrAC7j3va
	vM2xT+xmX4wl6jBBSAbPyfI=
X-Google-Smtp-Source: APXvYqyISAfXfdsmB5Y5QoBlW+U4NUEx6/0Witq09H5KXQXYb7B01pruVjRb5c0tyoZWmzl8owlYhw==
X-Received: by 2002:adf:f006:: with SMTP id j6mr22128688wro.243.1559943027028;
        Fri, 07 Jun 2019 14:30:27 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a1c:9d45:: with SMTP id g66ls3111533wme.1.gmail; Fri, 07 Jun
 2019 14:30:26 -0700 (PDT)
X-Received: by 2002:a7b:cd84:: with SMTP id y4mr5220046wmj.41.1559943026435;
        Fri, 07 Jun 2019 14:30:26 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1559943026; cv=none;
        d=google.com; s=arc-20160816;
        b=aAyFWnpBGTeenVjxcBf1gDH3y71WrcqzHJWQ9C2wpk3UsNdHGzi5vhVqwZA2XMFlua
         JUaGRs8PO2bH6LKP7pFWZzBoh/C2av476Iqd9O8/ZKfN2aZOQeAcsYq8yB+UzPeoN2xd
         Ap7qTxN8XRg36HgaY1lmF+C/HRx/AsSEjN5k4u0l29JUKeZwPIJFhzRSOpJXkg9E+FeY
         Uqy0V6x1vdHUVXsBM0xsmFzb0zzYNPmEgJvz6238/J0om0QXf2UKzaMAXvZlMisg8VY/
         HfHLEjn4imendX5Ftf6l3GX5Vi8JgzbO8oAciugzLF4mqssQ+BCMlcYd1sbsjYHyJZ7j
         2tZw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:subject:autocrypt:openpgp:from
         :references:cc:to:dkim-signature;
        bh=7cV+jKyEHwurOtS3a/13+3hLTfKp7XQITLdf/Qqqq5c=;
        b=fJlpz7sSUH73Jw+eTo+HsezGUnger2c9H0Y9HsUsfDrrVH063QHzt4mewfn0G8R0Pn
         LqgFF0pAWWauH0fqEMfxbU+NskqBO9l4332LyXVn8i0NJvurjx+G02hsDThiAB7UuceW
         cq89mkjS5I31TWiUK3DWnwHJ09InUOqBsL3+kZL/FJsZWKbgUiRvxbwipmcpG+xf8Qh9
         TX3CKS3jqOtbGYJtW/ZjgaOILyTGeNQ7KFFXgP1eQE+D4wbm1cj3EIORsY7woAqTWLKm
         8UvWqxhluE7YtSE2ja0afonuY2LooHaettvDJFJFKmxj/Peh0OR8n7Vt+ZWed709SEoY
         7zSA==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       dkim=pass header.i=@oth-regensburg.de header.s=mta01-20160622 header.b=HB2w7zfu;
       spf=pass (google.com: domain of ralf.ramsauer@oth-regensburg.de designates 2001:638:a01:1096::11 as permitted sender) smtp.mailfrom=ralf.ramsauer@oth-regensburg.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=oth-regensburg.de
Received: from mta01.hs-regensburg.de (mta01.hs-regensburg.de. [2001:638:a01:1096::11])
        by gmr-mx.google.com with ESMTPS id l19si1325wmc.1.2019.06.07.14.30.26
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 07 Jun 2019 14:30:26 -0700 (PDT)
Received-SPF: pass (google.com: domain of ralf.ramsauer@oth-regensburg.de designates 2001:638:a01:1096::11 as permitted sender) client-ip=2001:638:a01:1096::11;
Received: from E16S02.hs-regensburg.de (e16s02.hs-regensburg.de [IPv6:2001:638:a01:8013::92])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(Client CN "E16S02", Issuer "E16S02" (not verified))
	by mta01.hs-regensburg.de (Postfix) with ESMTPS id 45LG0K62MMzyRR;
	Fri,  7 Jun 2019 23:30:25 +0200 (CEST)
Received: from [172.23.3.82] (194.95.106.138) by E16S02.hs-regensburg.de
 (2001:638:a01:8013::92) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1713.5; Fri, 7 Jun 2019
 23:30:25 +0200
To: Wayne <racedrive1503@gmail.com>
CC: <jailhouse-dev@googlegroups.com>, <jan.kiszka@siemens.com>
References: <CA++Khc2iKk1J6+0huh5__dS4HyujXzV9r+LbKLzuVZ4K3Bt5eA@mail.gmail.com>
 <57edbc3b-cadc-c850-8310-4640fc623085@oth-regensburg.de>
 <CA++Khc3HLaSEo9z2jd6hVLuDK-zd4P6au0KP3+6db8KBR47izQ@mail.gmail.com>
From: Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>
Openpgp: preference=signencrypt
Autocrypt: addr=ralf.ramsauer@oth-regensburg.de; keydata=
 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
 RncIIYr0LjXAAzY=
Subject: Re: Linux non-root node question
Message-ID: <166c6ad9-379c-bad6-f30f-8af4f97b8bb1@oth-regensburg.de>
Date: Fri, 7 Jun 2019 23:30:15 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.0
MIME-Version: 1.0
In-Reply-To: <CA++Khc3HLaSEo9z2jd6hVLuDK-zd4P6au0KP3+6db8KBR47izQ@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Language: en-PH
Content-Transfer-Encoding: quoted-printable
X-Originating-IP: [194.95.106.138]
X-ClientProxiedBy: E16S02.hs-regensburg.de (2001:638:a01:8013::92) To
 E16S02.hs-regensburg.de (2001:638:a01:8013::92)
X-Original-Sender: ralf.ramsauer@oth-regensburg.de
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass
 header.i=@oth-regensburg.de header.s=mta01-20160622 header.b=HB2w7zfu;
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

Hi Wayne,

On 6/7/19 10:04 PM, Wayne wrote:
> Hi Ralf,
>=20
> Thank you for your responses.=C2=A0 I have attached the requested config
> files.=C2=A0 I am now just trying to use the same bzImage for the root an=
d
> the non-root linux node.

One question that you didn't answer: do apic-demo or tiny-demo work?
They need to to have correct .console parameter set, so ensure that
parameters are set if you run those demos in your linux-demo cell. Just
compare it to tiny-demo.c or apic-demo.c

>=20
> Yes, I am using vanilla 4.16 because the documentation indicated that it
> is the first mainline release to officially support Jailhouse Guest
> images.=C2=A0 Do you suggest that I use something else?

As Jan already wrote: Try to use Siemens' 4.19 branch.

>=20
> Right now i'm just trying to get some serial output from the non-root
> Linux.=C2=A0 Hopefully, I have that configured correctly.=C2=A0 Ideally, =
I would
> like to share the same serial console for the Root node and non-root
> node eventually if possible.=C2=A0 I have been OK with using the virtual
> console (jailhouse console -f) for the Hypervisor output.

In addition to Jan's comment:

Currently you only have access to the jailhouse console via 'jailhouse
console' from your root cell. Imagine your root cell crashes for some
reason. You will never see the fault reason, which makes things hard to
debug.

I would suggest to configure the hypervisor to use the serial console.
You can share the device with the non-root Linux, that's no problem.

In this case, the non-root kernel's output will always be printed to the
serial console. Directly, if you choose console=3DttySx, and indirectly
via the hypervisor if you choose console=3Djailhouse.

BTW: According to your config, your system is a PowerEdge, and the
non-root cell gets both, 0x2f8 and 0x3f8. Are you sure that ttyS1 is the
correct console that you are connected to?

Just mentioning this as we have a similar machine here, and, afair, both
platform serial device are 'usable', but one ends in the nirvana while
it is accessible.

Ah, and one last thing: try to switch to the current next branch for
jailhouse. Jan just integrated a few patches from me that might also be
relevant for your machine.

HTH
  Ralf

>=20
> Wayne
>=20
> On Fri, Jun 7, 2019 at 9:10 AM Ralf Ramsauer
> <ralf.ramsauer@oth-regensburg.de
> <mailto:ralf.ramsauer@oth-regensburg.de>> wrote:
>=20
>     Hi,
>=20
>     On 6/7/19 2:28 PM, Wayne wrote:
>     > Hello,
>     >
>     > I am new to Linux development and Jailhouse.=C2=A0 I have successfu=
lly
>     booted
>     > the Jailhouse Hypervisor and root cell on a bare metal X86 Linux
>     system
>     > (No QEMU).=C2=A0 I am now trying to load a non-root Linux cell and =
I have a
>     > few questions.=C2=A0 Jailhouse accepts and starts my non-root linux=
 cell
>     > configuration and I see it as "running" through the "jailhouse cell
>     > list" command.=C2=A0 However, I don't see any serial output from th=
e
>     > "non-root linux" cell booting up.=C2=A0 I=E2=80=99m not sure what t=
he non-root node
>     > is doing at this point.
>=20
>     Ok, first of all, can you see any output from Jailhouse's demo inmate=
s
>     (e.g., tiny-demo or apic-demo)?
>=20
>     >
>     > =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0My root node=
 is a 4.16 kernel configured this way:
>     > =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 1. CONFIG_JAILHOUSE_GUEST is not set
>     > =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 2. CONFIG_SERIO=3Dy
>     > =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 3. CONFIG_SERIAL_8250_RUNTIME_UARTS=
=3D4
>     >
>     > =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0My non-root =
node is a 4.16 kernel configured this way:
>     > =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 1. CONFIG_JAILHOUSE_GUEST=3Dy
>     > =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 2. CONFIG_SERIO=3Dm (can't seem to d=
isable
>     > completely in my config for 4.16)
>     > =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 3. CONFIG_SERIAL_8250_RUNTIME_UARTS=
=3D1
>=20
>     Could you please provide a full .config? What branch are you exactly
>     using? Vanilla 4.16?
>=20
>     Please attach your system config and your non-root linux config as we=
ll.
>=20
>     You may also want to try https://github.com/siemens/linux . See
>     jailhouse-enabling branches for some releases.
>=20
>     >
>     > In general, do the kernel config settings have to match between
>     the root
>     > node and non-linux or is the above fine?
>=20
>     No, they do not have to be the same, but they can. Still, an analysis
>     requires your .config.
>=20
>     >
>     > The vmlinux-4.1.16-Guest bzImage is approx 7MB, and the inmate node=
 is
>     > allocated ~75MB of RAM.
>     >
>     > I have a single UART, so I have configured the root cell system con=
fig
>     > to output to the virtual hypervisor console:
>=20
>     Wait... You configured your root-cell to use the hypervisor debug
>     console? How? It's only available once the hypervisor is enabled. How
>     should this work?
>=20
>     But let's have a look at your configuration first.
>=20
>     So you want to:
>     =C2=A0 - Have the UART (0x3f8) available in the non-root cell
>     =C2=A0 - Use 0x3f8 as hypervisor debug console as well
>     =C2=A0 - No console for root-cell
>=20
>     Did I get this right?
>=20
>     =C2=A0 Ralf
>=20
>     >
>     > .flags =3D JAILHOUSE_SYS_VIRTUAL_DEBUG_CONSOLE,
>     >
>     > .debug_console =3D {
>     > .type =3D JAILHOUSE_CON_TYPE_NONE,
>     > },
>     >
>     > and I have configured the non-root linux cell to output to the UART=
:
>     >
>     > (Added serial 0x3f8 to pio bitmap for non-root linux) and started t=
he
>     > node with this:
>     >
>     > ./tools/jailhouse cell linux configs/x86/linux-x86.cell
>     > /boot/vmlinux-4.1.16-Guest -c "console=3DttyS0,115200"
>     > (Note I also tried "console=3Djailhouse" in the command above, and =
that
>     > produces the same result)
>     >
>     > I then see the following on my hypervisor console (./tools/jailhous=
e
>     > console -f):
>     >
>     > Created cell "linux-x86-demo"
>     > ...
>     > Cell "linux-x86-demo" can be loaded
>     > Started cell "linux-x86-demo"
>     >
>     > After a little while I do get a parked CPU error on the root node,
>     looks
>     > like its trying to do something with the UART as well:
>     > FATAL: Invalid PIO read, port: 3fe size: 1
>     >
>     > I would expect something to pop out on the UART from the non-root
>     linux
>     > node first.=C2=A0 Note that root node has serial 0x3f8 disabled in =
its pio
>     > bitmap.
>     >
>     > I verifed that the UART is functioning by allowing the hypervisor t=
o
>     > print to it and also performed an echo test over ttyS0.
>     >
>     > I have tried several configurations of kernel.....including your
>     current
>     > "queues/jailhouse" branch head kernel for the non-root node, along
>     with
>     > the kernel config for 4.7 posted in this thread below (but I get sa=
me
>     > result as above when I start it, no kernel output):
>     > =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0
>     >
>     =C2=A0"https://groups.google.com/forum/#!searchin/jailhouse-dev/Re$3A=
$20Failed$20to$20boot$20jailhouse%7Csort:relevance/jailhouse-dev/M7UO89XFIk=
0/Qi40DDuMBAAJ".
>     >
>     > Any information you can provide to me will be helpful.=C2=A0 I'm no=
t sure
>     > what might be going wrong here.
>     >
>     > Thanks,
>     > Wayne
>     >
>     > --
>     > You received this message because you are subscribed to the Google
>     > Groups "Jailhouse" group.
>     > To unsubscribe from this group and stop receiving emails from it, s=
end
>     > an email to jailhouse-dev+unsubscribe@googlegroups.com
>     <mailto:jailhouse-dev%2Bunsubscribe@googlegroups.com>
>     > <mailto:jailhouse-dev+unsubscribe@googlegroups.com
>     <mailto:jailhouse-dev%2Bunsubscribe@googlegroups.com>>.
>     > To view this discussion on the web visit
>     >
>     https://groups.google.com/d/msgid/jailhouse-dev/CA%2B%2BKhc2iKk1J6%2B=
0huh5__dS4HyujXzV9r%2BLbKLzuVZ4K3Bt5eA%40mail.gmail.com
>     >
>     <https://groups.google.com/d/msgid/jailhouse-dev/CA%2B%2BKhc2iKk1J6%2=
B0huh5__dS4HyujXzV9r%2BLbKLzuVZ4K3Bt5eA%40mail.gmail.com?utm_medium=3Demail=
&utm_source=3Dfooter>.
>     > For more options, visit https://groups.google.com/d/optout.
>=20

--=20
You received this message because you are subscribed to the Google Groups "=
Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/=
jailhouse-dev/166c6ad9-379c-bad6-f30f-8af4f97b8bb1%40oth-regensburg.de.
For more options, visit https://groups.google.com/d/optout.
