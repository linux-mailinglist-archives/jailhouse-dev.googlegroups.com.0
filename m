Return-Path: <jailhouse-dev+bncBCJI7SMNV4NBBC5BQD4QKGQEIHXFY3I@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-lf1-x13e.google.com (mail-lf1-x13e.google.com [IPv6:2a00:1450:4864:20::13e])
	by mail.lfdr.de (Postfix) with ESMTPS id E71F1230923
	for <lists+jailhouse-dev@lfdr.de>; Tue, 28 Jul 2020 13:48:27 +0200 (CEST)
Received: by mail-lf1-x13e.google.com with SMTP id j22sf2642981lfg.21
        for <lists+jailhouse-dev@lfdr.de>; Tue, 28 Jul 2020 04:48:27 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1595936907; cv=pass;
        d=google.com; s=arc-20160816;
        b=DegcC3OHQAV/VxevZtuzo4oGZV4gY/uzSxuRnbsts2MCCaVA2dStu37xQC6jqkUp7S
         J4Y6g3eeRBXqjFAZtsx4aDEkYRT9qN1kN7YXjq3xZJJjTC23W8g0PXa+q+NEobFhI71q
         3XeN9HF0XjxahxHXuk48hosJObecdFkw16rBZD2k252NPlEQrKc+8uBvaZf5wP97cQ/n
         xGiAgxjOFSqoaJayI2rLVaZapt71P+tEkbK4Vf6vnzDigiHQzVqRv809PLsWd5fmBK5G
         HtyarOrU1bjRqQhkE//gsszDUkt2f8epDb403P+Y4pubtjlMApUGIbfHraICWTAmEXkt
         b/rw==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject:sender:dkim-signature;
        bh=cGczhMnqHVcOCy61k84TN/iKulslAL1vUVuPLzW1BsI=;
        b=mJekfwFRS32D1WNBef1uwegThysMZOVwgbIEJd+Gpw6eNwowmpCD9Bobw+cCAirzqc
         7lqdwqcLsmeJw5gZWzMplFUhxULHKuAZ4qf6CI5qU1n5PPG4lQe4DLZxbMvPOXAFgzwg
         y5mrT2+UOZNK2ssKioWZ0BQmDPEZ0v5Jsb4HmZ6Xs7zz8DZ4cHn6IG/1zES1SlTWV/tp
         RVVHybIbGnHaPXUIAlmVvsDuRfYn2uummXH/E3xqssA9d9ZXA9mRoj/3WbYLPwonOzpm
         CZwW7ghwSjElLCECr59Qz1HzPlSywgrOaegrbSvaCFIGEEiZKBcTrg/K/R8Pgb06y+1K
         L1Ng==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.2 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:subject:to:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding
         :x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=cGczhMnqHVcOCy61k84TN/iKulslAL1vUVuPLzW1BsI=;
        b=Ojmw+g3l8UW7E22NjPke0C8y2jEMatCke7CnRZSH7uM/SJICB19CAvOs6YC+c6aFit
         5AEWgtBAsjXNyVWpgvzomWffzGttXfZFXM64BEIV/1wIrOHQElXdVqki93O7RIIbgJMK
         PHrQNmPVGl3XngmXELOQ4gxo8ggH146slbNLNWhN5w6SR+sz1Oy3UOmbeUr/8RDBQesh
         W5xT5NpynNW3Rdgkd06UlsTpGteji5rrkRsDn3DRgGQLIayXHJsOxiGbkRoFcQ5sRfUb
         nHkbJhGYGhPYxH3Zqu/R5jSWnUo5UCsGehuk/1J5BJPS1fclxYUlTWB20aWgFgztFoyG
         qarw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:subject:to:references:from:message-id
         :date:user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :x-spam-checked-in-group:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=cGczhMnqHVcOCy61k84TN/iKulslAL1vUVuPLzW1BsI=;
        b=EvSDsNzl6NAZjPRagDvIMMmUPBLDFQ6LJCkhCw9razcK/fm/Dm8St0h0GSkkCHAwae
         1yExqN4SPm8Ye7Lr2coCq5D9g9igjOR2xZjVbo19aBqoM6/hHUxQkQUXfbjAPaGfDKDI
         alWXOLpRYZ1GhMiXCCzdYUxHL6eBREIWDSwLRt3YSuMeHfUmM3fseF/8vLwAEL+zROiJ
         akSEqAa3g95tu1J+z90bbV3fAOzutqXcabrZq2NWbUmUIy8B/YdXYGScFmGiB7F/n6Qu
         X8kbSLe+J82dglKSkL5TlCxP8BuogafNLbIAe2sSTz/nDFkBTr75L9NPYntEFloMTehn
         lYaQ==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AOAM532Dp83407krltj34qLWtixAB87s5tWb57knZFC3MjQQaYmrrAKM
	TGYXNXknrXDumZwddwxInn0=
X-Google-Smtp-Source: ABdhPJwyOgj2TVNnD0L6trXkoCoX+Jfb83/Po1fpch+6n41HRUemfoem1Vi0ZIuvt0ep/40+KN44+A==
X-Received: by 2002:a19:c197:: with SMTP id r145mr14115714lff.41.1595936907425;
        Tue, 28 Jul 2020 04:48:27 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a19:60e:: with SMTP id 14ls70188lfg.0.gmail; Tue, 28 Jul
 2020 04:48:26 -0700 (PDT)
X-Received: by 2002:a19:a07:: with SMTP id 7mr14247893lfk.65.1595936906462;
        Tue, 28 Jul 2020 04:48:26 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1595936906; cv=none;
        d=google.com; s=arc-20160816;
        b=iz5FnhwNronJBg0ByFWOM2XmRSN1b9Gfazw9XZBFR9pdxV3JiAmpd4P1AarOOynx7h
         ihGpTiJyXwBSkPGihtIf8Wfyp9viKkz9mHpueRskdOh8SQ167A0iWvGnF0cqy6fAb5gL
         V193rvEaNQy2inu0/Z5m0cXmDv95uj3i+Qt7aO/WTEoC1EbMJWgTbHHzMpV5wVjAxq73
         Bm6pLSNxtE6N8/u09IDkXO73XZLSq1yihxfqo4olOxzi+aWnD7BFuXrZ0m57scSL/Q52
         Ks3oZjUy6POB5xxtwdW9rBQG+Nt2kHMJVGQp1N71pwLcYhyB3QLSMx2n9KslmeZz1DBz
         v7NQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:to:subject;
        bh=mkXGEVpddefnIQkWHq4ih3zhUFps2hXi9PguUmuAuSs=;
        b=v+tmh/QbKHcOtRFdEqaZ3NNQURODAEmSESQs9UhE2xpv7ID9P3KP3WG5UAetleSh4q
         fGjsammArtIyATAujccbL2CIijQdEcJ0o1QU8bXOm7Y2tEcK0IWxjcSDtA2OseaN2qfn
         Xy41dmLeF7OIfMkGdEdNeOEm3aOMXaf4yXvfXyA7avG8LpnwOGJLxDkb5aEhBXNqF9Se
         JyeJHS8SPHIQrLR8HcForacnmb5dNVKQFYxSnZ749bX7Q6IMxOoFC3S7CTCffPhbMIvf
         8i2dxbmo+nIHIHVFgbTXUdxcNyCeYEeWSYz7Z5iqxeyFFJpj+G+DG0CihNqWX+KCKqjf
         VUnA==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.2 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
Received: from thoth.sbs.de (thoth.sbs.de. [192.35.17.2])
        by gmr-mx.google.com with ESMTPS id q26si658042ljg.1.2020.07.28.04.48.26
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 28 Jul 2020 04:48:26 -0700 (PDT)
Received-SPF: pass (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.2 as permitted sender) client-ip=192.35.17.2;
Received: from mail2.sbs.de (mail2.sbs.de [192.129.41.66])
	by thoth.sbs.de (8.15.2/8.15.2) with ESMTPS id 06SBmP2T032262
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 28 Jul 2020 13:48:25 +0200
Received: from [167.87.93.82] ([167.87.93.82])
	by mail2.sbs.de (8.15.2/8.15.2) with ESMTP id 06SBmOAC019560;
	Tue, 28 Jul 2020 13:48:25 +0200
Subject: Re: GSoC Report: Week 8
To: =?UTF-8?B?SmFrdWIgTHXFvm7DvQ==?= <jakub@luzny.cz>,
        jailhouse-dev@googlegroups.com
References: <CAGdCPwuLnZQSPxaj7j_iZwY16d+dN+FTo8H50Jjog6T_-Yz0Gg@mail.gmail.com>
From: Jan Kiszka <jan.kiszka@siemens.com>
Message-ID: <9c941621-bc4c-ee6d-6a4b-2b9d2d3ac807@siemens.com>
Date: Tue, 28 Jul 2020 13:48:24 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <CAGdCPwuLnZQSPxaj7j_iZwY16d+dN+FTo8H50Jjog6T_-Yz0Gg@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable
X-Original-Sender: jan.kiszka@siemens.com
X-Original-Authentication-Results: gmr-mx.google.com;       spf=pass
 (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.2 as
 permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;       dmarc=pass
 (p=NONE sp=NONE dis=NONE) header.from=siemens.com
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

On 28.07.20 11:31, Jakub Lu=C5=BEn=C3=BD wrote:
>=20
>   Week 8: Jailhouse & RPi4 with more than 1G of memory
>=20
> This week I was working on enabling Jailhouse to use more than 1 GiB of=
=20
> memory on the Raspberry Pi 4. However, with little success so far.
>=20
> Jailhouse comes with a configuration that is made for the 1 GiB variant=
=20
> of the RPi4 (that is actually not even sold anymore). It also works on=20
> the variants with more memory, but then it stays limited to 1 GiB. To=20
> illustrate how the memory layout of the Raspberry Pi looks like, I took=
=20
> the following map from the BCM2711 ARM Peripherals documentation=20
> <https://www.raspberrypi.org/documentation/hardware/raspberrypi/bcm2711/r=
pi_DATA_2711_1p0.pdf>.=20
> I took the address map in the =E2=80=9CLow Peripheral=E2=80=9D mode, as i=
t seems to=20
> reflect the configuration supplied with Jailhouse. Note the memory=20
> regions are not in scale.
>=20
> Raspberry Pi 4 memory layout
>=20
> In the default configuration=20
> <https://github.com/siemens/jailhouse/blob/master/configs/arm64/rpi4.c>,=
=20
> Jailhouse allocates the memory range 0x0 - 0x3fa10000 (~1018M) for the=20
> cells. The rest of the first 0x40000000 (1024M) long memory space is=20
> used for the hypervisor itself and various shared memory regions. To=20
> avoid the Linux kernel using all of the memory, |mem=3D768M|=C2=A0kernel=
=20
> parameter is used=20
> <https://github.com/siemens/jailhouse-images/blob/master/recipes-bsp/rpi-=
firmware/files/cmdline.txt>.=20
> That makes the memory above 768M available for the non-root cells.=20
> Regarding the GPU memory, the |gpu_mem|=C2=A0parameter in Raspberry=E2=80=
=99s=20
> config.txt is not set=20
> <https://github.com/siemens/jailhouse-images/blob/master/recipes-bsp/rpi-=
firmware/files/config.txt>,=20
> so it defaults to 64M. Then, the area of 0x3b400000 (948M) - 0x40000000=
=20
> (1024M) is reserved by the Raspberry firmware. I don=E2=80=99t know how t=
hey=20
> make sure that Jailhouse=E2=80=99s shared memory regions don=E2=80=99t in=
terfere with=20
> the GPU, but it seems that they know what they=E2=80=99re doing.
>=20
> To extend the support to the 4GiB version, I added a section describing=
=20
> the additional memory region to the Jailhouse configuration:
>=20
> |/* RAM (1024M-4032M) */ { .phys_start =3D 0x40000000, .virt_start =3D=20
> 0x40000000, .size =3D 0xbc000000, .flags =3D JAILHOUSE_MEM_READ |=20
> JAILHOUSE_MEM_WRITE | JAILHOUSE_MEM_EXECUTE, }, |
>=20
> To simulate the behavior of the previous |mem=3D768M|=C2=A0kernel paramet=
er, I=20
> decided to reserve the memory area of 0x30000000 (768M) - 0x40000000=20
> (1024M). At first, I tried that by using the |memmap|=C2=A0kernel paramet=
er,=20
> but I found out it=E2=80=99s x86 only and I have to define the reservatio=
n in=20
> the device tree. So I had to make my own device tree overlay (DTBO).=20
> After some time of figuring out the actual format, this one is doing=20
> what I want:
>=20
> |// Reserved memory for Jailhouse use /dts-v1/; /plugin/; / { compatible=
=20
> =3D "brcm,bcm2835"; fragment@0 { target-path =3D "/"; __overlay__ {=20
> reserved-memory { #address-cells =3D <2>; #size-cells =3D <1>; ranges;=20
> jailhouse_reserved: jailhouse@30000000 { reg =3D <0x0 0x30000000=20
> 0x10000000>; no-map; }; }; }; }; }; |
>=20
> However, even after all of this, I can=E2=80=99t get Jailhouse to work wi=
th this=20
> additional memory. When I run |jailhouse enable|=C2=A0with this modified=
=20
> configuration, it crashes immediately:
>=20
> |root@demo:~# jailhouse enable rpi4-4g.cell Initializing Jailhouse=20
> hypervisor v0.12 (59-g4ce7658d) on CPU 3 Code location:=20
> 0x0000ffffc0200800 Page pool usage after early setup: mem 39/994, remap=
=20
> 0/131072 Initializing processors: CPU 3... OK CPU 0... OK CPU 2... OK=20
> CPU 1... OK Initializing unit: irqchip Initializing unit: ARM SMMU v3=20
> Initializing unit: PVU IOMMU Initializing unit: PCI Adding virtual PCI=20
> device 00:00.0 to cell "Raspberry-Pi4 4G" Adding virtual PCI device=20
> 00:01.0 to cell "Raspberry-Pi4 4G" Page pool usage after late setup: mem=
=20
> 61/994, remap 5/131072 FATAL: instruction abort at 0xfbfff7c0 FATAL:=20
> forbidden access (exception class 0x20) Cell state before exception: pc:=
=20
> ffffffc0089fd7c0 lr: ffffffc0089fd7c0 spsr: 20000085 EL1 sp:=20
> ffffffc01000bef0 esr: 20 1 0000086 x0: 0000000000000000 x1:=20
> 0000000000000000 x2: 0000000000000000 x3: 0000000000000000 x4:=20
> 0000000000000000 x5: 0000000000000000 x6: 0000000000000000 x7:=20
> 0000000000000000 x8: 0000000000000000 x9: 0000000000000000 x10:=20
> 0000000000000000 x11: 0000000000000000 x12: 0000000000000000 x13:=20
> 0000000000000000 x14: 0000000000000000 x15: 0000000000000000 x16:=20
> 0000000000000000 x17: 0000000000000000 x18: 0000000000000000 x19:=20
> ffffffc008a04c28 x20: ffffffc014800000 x21: 0000000000000000 x22:=20
> 0000000000000001 x23: 0000000000000000 x24: 0000000000000001 x25:=20
> 0000000000000001 x26: ffffffc010fe3dc0 x27: 0000000000000000 x28:=20
> ffffff80f6da5940 x29: ffffffc01000bef0 Parking CPU 1 (Cell:=20
> "Raspberry-Pi4 4G") |
>=20
> The address 0xfbfff7c0 of the instruction abort is 0x840 (2112) bytes=20
> before the end of the defined memory region and the start of the=20
> peripheral space. When I limit the kernel memory by using the=20
> |mem=3D|=C2=A0kernel parameter, e.g. |mem=3D2G|, the address moves, but i=
t stays=20
> at the same offset from the end of the memory space. I can=E2=80=99t figu=
re out=20
> why it=E2=80=99s crashing. I tried to ask in the jailhouse-dev mailing li=
st=20
> <https://groups.google.com/g/jailhouse-dev/c/iY84ebxz2hI>, but I haven=E2=
=80=99t=20
> got any answers.

Sorry, "fixed" that at least now... Unfortunately, I only have a 1G RPi4=20
in reach to do cross-checking.

>=20
> In the meanwhile, my meta-agl-jailhouse layer was accepted into=20
> meta-agl-devel=20
> <https://gerrit.automotivelinux.org/gerrit/c/AGL/meta-agl-devel/+/25034>.=
 In=20
> the next week, while trying to figure out this issue, I want to make a=20
> recipe for compiling additional cell configurations independently from=20
> the jailhouse recipe.

That nice to hear! BTW, who is hosting your GSoC project? AGL?

Jan

--=20
Siemens AG, Corporate Technology, CT RDA IOT SES-DE
Corporate Competence Center Embedded Linux

--=20
You received this message because you are subscribed to the Google Groups "=
Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/=
jailhouse-dev/9c941621-bc4c-ee6d-6a4b-2b9d2d3ac807%40siemens.com.
