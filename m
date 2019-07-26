Return-Path: <jailhouse-dev+bncBCJI7SMNV4NBBLGS5LUQKGQEWMTVGKA@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-wm1-x339.google.com (mail-wm1-x339.google.com [IPv6:2a00:1450:4864:20::339])
	by mail.lfdr.de (Postfix) with ESMTPS id B4FBB75F8D
	for <lists+jailhouse-dev@lfdr.de>; Fri, 26 Jul 2019 09:18:04 +0200 (CEST)
Received: by mail-wm1-x339.google.com with SMTP id d65sf12099571wmd.3
        for <lists+jailhouse-dev@lfdr.de>; Fri, 26 Jul 2019 00:18:04 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1564125484; cv=pass;
        d=google.com; s=arc-20160816;
        b=cJqx5d2lWEvzEIB8WU3W5IDA51udghhx1z1bHMb/GxkIKEIuvEN8k1XNW5UCIe0yc6
         ZLvw9XUUWafEn8Olh7aycu2bL9uq8rlzm2h4tl7af7zAtuhuNtTWUF1bAuHPugp0m1KB
         CRYnW1J+jee9cemxBwlLGtFy7P5UPEKr/esDMAQo5tbZytd8RF/argsMNmT6ebIcTYqE
         ymbUS3LbqVGklleElmJzsWmnupF61UiX5zFTgkM6eMuX0K0Eq82Ih2XtAvsdlwn9LzCe
         9/IiPZ5w9tpglQUczV9fiSEXxDFtFekz4W+QW2ha3YLvgYu4ww+TAUJ3XUl7RxDEmkwg
         3XwA==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:references:to:subject:from:sender:dkim-signature;
        bh=uSnOzXddQu55mZJy40Y+y5b0TFD9Ivix1BiWd4/2dTw=;
        b=p0bnH+jjZTuEuLk5CdkEbUpUtZmlbH//iOeTG4O7jjF2tHOL7CD82ZDMuQQgR8amMp
         9WbdsbHZ/usC+RXnXD4kqtzmTAITLW9FGNu2MTIczfUeZ32H7SVTWnCbB8VqnmjH+7LB
         V+LHq1kLiXhajDzwCAUcv58TOK2126NLETytrJSoUXompVcwIskMw9YvTCREkBNEuS1d
         DFeHA0iXAPAuRgMtH8Kz/uOGdxgfyqnXwDWIY9zBGSkbVFjtnbKi8Yd98a+FBA+YKLcn
         EZu2PsnIKIEQ+sgJ5XfAFx/wHZKGTkwtQNeDncL1WPRE+9I40nMewSO4ZxkNM+PmNm4v
         vKTg==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 194.138.37.39 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:from:subject:to:references:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding
         :x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=uSnOzXddQu55mZJy40Y+y5b0TFD9Ivix1BiWd4/2dTw=;
        b=Kh3cjliUxkOXg29X1GBEj9bG6OqSpzxmGugytJsxnKxE80VhfAJZ5DEbNmsGCfGT1P
         Uhm2HieeeW/nMKgmPy+tO1hiwjsi9IIjPHWN4h7Kr+rYoQp7CzcGYniflkw0fyjDfzji
         9fA3IxwVurqZajlsKrDoj4MoOfZQswQfw8l3hws6guFDDjwLTxUqTK5XtvEu0moSuqzx
         t003AU5Gl6l1uhwmht8OFvl+i47wkKlTDZOXVzp0LGbW3D3jO3o+PV7DTlTO5v+VUvlI
         LI7M0erNv5/PbXdS/Yro22QhHgnr0pkJPZZntdlIY3kh67UVoC8AhH12lrYU5JdeunsL
         N8Gw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:from:subject:to:references:message-id
         :date:user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :x-spam-checked-in-group:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=uSnOzXddQu55mZJy40Y+y5b0TFD9Ivix1BiWd4/2dTw=;
        b=L55QPzfI85LRVPSvwzgfOWm+t931kx/AegGybFpVrlYD1Kt95ykstVQ9Y9/J7yg2Hg
         4go6TY4yJXkZ/W6uiN7+/bBvmQhlY2aXc9IYic835jQcEEq6wzRW/I9QEMVecA9Bd9UW
         nHJkSNcC/Y2Q6xeA7xojJI2bPtYC4tayAWQ3xe4towhy/uWmsZ1lQVYyTJaInrHbZKrY
         r9hEX6O1f+XeAOVASISQ0xFUMGg92U8ce0gRC14HZT9mUufpw6DdBoJJazEeqFOd+uH0
         oUWzrjNnFWJ03ZRny80nTPPARZfcPQsetDdpJo/m1iPur7vWo1f9aMsPqWFeewAPosXm
         9kpg==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: APjAAAXrZS7A7xvAyfShGqsDiOk0hceliQQ9VO2m02a5YkWX85cEzWnX
	4AFh0EG+LoLOh7r6isq5dZQ=
X-Google-Smtp-Source: APXvYqwOoY5RGR95gEKbZVK2EzyO1MU9akA4W+5G1UjMQo4IYaeAUreQwgKt0Tuz9fg+ghNLONiNPQ==
X-Received: by 2002:a05:6000:9:: with SMTP id h9mr8193630wrx.271.1564125484454;
        Fri, 26 Jul 2019 00:18:04 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a1c:2d02:: with SMTP id t2ls18502867wmt.0.canary-gmail; Fri,
 26 Jul 2019 00:18:03 -0700 (PDT)
X-Received: by 2002:a05:600c:225a:: with SMTP id a26mr87657666wmm.81.1564125483782;
        Fri, 26 Jul 2019 00:18:03 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1564125483; cv=none;
        d=google.com; s=arc-20160816;
        b=oapFyY/RDpzX3IbEl2z+0IEqC6g1D7UJInIob4/1xaVKcOuDc5NPTXLBm5P2d0u7Ez
         9LNDsopBmknGiWLvCN4c3bSkkbZMyDaBuJkSSbgdJDe0tNJlxW01Yz8I3A1oBuaslkaI
         RqINxIdmxFLzNtQVYh8scfYaWJO3Bz1z8ImwnF/Ay+PQuxaij1kBPjolY593BTWSXpVH
         I9lbMdEf85/MiL6yst5PJCcRvJNezhrOPV4Q2mc45kdUyZUEcurIMguuncUYx6JUnFeA
         puGuL1WGQAu0pYIT3XS5Y/QhHDd6LeBSgGmVR46UMx8uLRnEKYP82QtY+IrZWTA4cSVX
         EPzQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:references:to:subject:from;
        bh=X9NiU0a1hQgX0wghDKPOgi/G4+pdm5HphCEnETOm1BA=;
        b=Cj10AeHIKdP5bP651T7lmA3BSJdnGtE1R9YEF8QdosoIw4woEDcffqaqsbCHI6uVw0
         38O8XsFZaxmKvEaHVdkiA0ffRxqfVLwzKYl4brWKyPEcGB9rCv3zwFkFoDi63q9+u9BA
         pQ8DW11TAxtottO7aIeBtxcMLZxFowbd7v7ABbeFgBXA2kE6GS28BXh3Qx1SNlXnsORR
         k1COLIYLnvUsmBjjOg4k++4ahaOO5hbl2t19L3wqbYrN359GdqS+WT2vVwkNCRY9Dl27
         Fvlg2Y3HR+wtIPNSJe6eolpYTP0IOkMDkcl8noavCpHoOPCUZwaCZv3Qgsr/5CyyZ0xh
         ZYew==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 194.138.37.39 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
Received: from lizzard.sbs.de (lizzard.sbs.de. [194.138.37.39])
        by gmr-mx.google.com with ESMTPS id p4si1307559wme.2.2019.07.26.00.18.03
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 26 Jul 2019 00:18:03 -0700 (PDT)
Received-SPF: pass (google.com: domain of jan.kiszka@siemens.com designates 194.138.37.39 as permitted sender) client-ip=194.138.37.39;
Received: from mail1.sbs.de (mail1.sbs.de [192.129.41.35])
	by lizzard.sbs.de (8.15.2/8.15.2) with ESMTPS id x6Q7I2En017633
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 26 Jul 2019 09:18:02 +0200
Received: from [167.87.23.89] ([167.87.23.89])
	by mail1.sbs.de (8.15.2/8.15.2) with ESMTP id x6Q7I1db003200;
	Fri, 26 Jul 2019 09:18:02 +0200
From: Jan Kiszka <jan.kiszka@siemens.com>
Subject: Re: Problem with IVSHMEM on Bananapi
To: dianaramos007@gmail.com, Jailhouse <jailhouse-dev@googlegroups.com>
References: <15e809ef-6d04-4df6-a706-7fa43e7deee3@googlegroups.com>
Message-ID: <f6e7c240-8686-aeff-1167-a8350e0cb03f@siemens.com>
Date: Fri, 26 Jul 2019 09:18:01 +0200
User-Agent: Mozilla/5.0 (X11; U; Linux i686 (x86_64); de; rv:1.8.1.12)
 Gecko/20080226 SUSE/2.0.0.12-1.1 Thunderbird/2.0.0.12 Mnenhy/0.7.5.666
MIME-Version: 1.0
In-Reply-To: <15e809ef-6d04-4df6-a706-7fa43e7deee3@googlegroups.com>
Content-Type: text/plain; charset="UTF-8"
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable
X-Original-Sender: jan.kiszka@siemens.com
X-Original-Authentication-Results: gmr-mx.google.com;       spf=pass
 (google.com: domain of jan.kiszka@siemens.com designates 194.138.37.39 as
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

On 25.07.19 17:59, dianaramos007@gmail.com wrote:
> Dear all,
>=20
> I'm trying to establish an inter-cell communication between 2 cells in Ba=
nana
> Pi-M1 (BPI) using the IVSHMEM protocol.
>=20
> So far I have compiled and inserted both jailhouse.ko and uio_ivshmem.ko =
(from
> https://github.com/henning-schild-work/ivshmem-guest-code) modules in BPI=
,
> running in Linux kernel 4.13.0, and gic-demo works fine.
> I've tried to follow this patch
> (https://groups.google.com/forum/#!topic/jailhouse-dev/IqwQsQ9JEno) in or=
der to
> create the config file (bananapi-gic-ivshmem-demo.c) based on gic-demo.
>=20
> For that I added the shared-memory region for IVSHMEM communication:
>=20
> /* IVSHMEM shared memory region */ {
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 .phys_=
start =3D 0x7bf00000,
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 .virt_=
start =3D 0x7bf00000,
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 .size =
=3D 0x100000,
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 .flags=
 =3D JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE,
> },
>=20
> Then, I loaded the cell with the following command:
>=20
> "jailhouse cell load 1 ../inmates/demos/arm/ivshmem-demo.bin -s
> "pci-cfg-base=3D0x02000000 ivshmem-irq=3D155" -a 0x1000=E2=80=9D and star=
ted it using
> "jailhouse cell start 1=E2=80=9D, but only got the following output:
> "IVSHMEM: pci-cfg-base:0x2000000
> IVSHMEM: ivshmem-irq:155"
>=20
> This is the dmesg output that I get when I load the cell:
>=20
> [=C2=A0=C2=A0 66.717056] jailhouse: loading out-of-tree module taints ker=
nel.
> [=C2=A0=C2=A0 98.515850] OF: PCI: host bridge //pci@0 ranges:
> [=C2=A0=C2=A0 98.521159] OF: PCI:=C2=A0=C2=A0 MEM 0x02100000..0x02101fff =
-> 0x02100000
> [=C2=A0=C2=A0 98.527811] pci-host-generic 2000000.pci: ECAM at [mem 0x020=
00000-0x020fffff]
> for [bus 00]
> [=C2=A0=C2=A0 98.538938] pci-host-generic 2000000.pci: PCI host bridge to=
 bus 0000:00
> [=C2=A0=C2=A0 98.545808] pci_bus 0000:00: root bus resource [bus 00]
> [=C2=A0=C2=A0 98.551289] pci_bus 0000:00: root bus resource [mem 0x021000=
00-0x02101fff]
> [=C2=A0=C2=A0 98.559373] pci 0000:00:00.0: [1af4:1110] type 00 class 0xff=
0000
> [=C2=A0=C2=A0 98.559471] pci 0000:00:00.0: reg 0x10: [mem 0x00000000-0x00=
0000ff 64bit]
> [=C2=A0=C2=A0 98.561658] PCI: bus0: Fast back to back transfers disabled
> [=C2=A0=C2=A0 98.567901] pci 0000:00:00.0: BAR 0: assigned [mem 0x0210000=
0-0x021000ff 64bit]
> [=C2=A0=C2=A0 98.578033] uio_ivshmem 0000:00:00.0: enabling device (0000 =
-> 0002)
> [=C2=A0=C2=A0 98.586492] The Jailhouse is opening.
> [=C2=A0 110.942999] Created Jailhouse cell "bananapi-gic-ivshmem-demo=E2=
=80=9D
>=20
> This is the output that I get when I execute:
>=20
> ./jailhouse console
> Initializing Jailhouse hypervisor v0.11 on CPU 1
> Code location: 0xf0000040
> Page pool usage after early setup: mem 56/16362, remap 0/131072
> Initializing processors:
> =C2=A0CPU 1... OK
> =C2=A0CPU 0... OK
> Initializing unit: irqchip
> Initializing unit: PCI
> Adding virtual PCI device 00:00.0 to cell "Banana-Pi"
> Page pool usage after late setup: mem 68/16362, remap 5/131072
> Activating hypervisor
> Adding virtual PCI device 00:00.0 to cell "bananapi-gic-ivshmem-demo"
> Shared memory connection established: "bananapi-gic-ivshmem-demo" <--> "B=
anana-Pi"
> Created cell "bananapi-gic-ivshmem-demo"
> Page pool usage after cell creation: mem 82/16362, remap 5/131072
> Cell "bananapi-gic-ivshmem-demo" can be loaded
> Started cell "bananapi-gic-ivshmem-demo
>=20
> When I list the PCI devices, I obtain the following:
>=20
> lspci -v
> 00:00.0 Unassigned class [ff00]: Red Hat, Inc. Inter-VM shared memory
> =C2=A0=C2=A0=C2=A0 Subsystem: Red Hat, Inc. Inter-VM shared memory
> =C2=A0=C2=A0=C2=A0 Flags: fast devsel, IRQ 86
> =C2=A0=C2=A0=C2=A0 Memory at 02100000 (64-bit, non-prefetchable) [size=3D=
256]
>=20
> Up until this point, everything seems to work correctly but it is suppose=
d to
> see the info "Kernel driver in use: uio_ivshmem=E2=80=9D when I list the =
PCI devices.
> However this information does not show up.
> Moreover, as far as I understand I need to create a UIO device in order t=
o use
> IVSHMEM, but when a try to register a new device with=C2=A0 "echo "1af4 1=
110" >
> /sys/bus/pci/drivers/uio_ivshmem/new_id=E2=80=9D I get the error "write e=
rror: file
> exists=E2=80=9D. However, if a list all the UIO devices with =E2=80=9Cls =
/dev/uio*=E2=80=9D, the command
> returns nothing.
>=20
> To sum up, although I have UIO support compiled into the kernel, the UIO =
device
> files are not beeing created.
>=20
> Can anyone help me in overcoming this issue and put IVSHMEM to work in Ba=
nana
> Pi? If needed, I can send any configuration files that I am using.
>=20

What does the kernel log say about the uio driver setup? Probing might have=
 gone
wrong.

And which uio_ivshmem driver revision from
https://github.com/henning-schild-work/ivshmem-guest-code did you use? Some=
time,
people check out the wrong branch.

Also note that there is now a wip/ivshmem2 branch in jailhouse with a rewor=
ked
device and a queues/jailhouse-ivshmem2 on http://git.kiszka.org/linux.git/ =
with
a rewritten uio driver as part of the queue. Maybe that is actually easier =
to
set up.

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
jailhouse-dev/f6e7c240-8686-aeff-1167-a8350e0cb03f%40siemens.com.
