Return-Path: <jailhouse-dev+bncBC7MJ2PM5UERBUVD47UQKGQEFONS6LQ@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-ot1-x340.google.com (mail-ot1-x340.google.com [IPv6:2607:f8b0:4864:20::340])
	by mail.lfdr.de (Postfix) with ESMTPS id AFD0575357
	for <lists+jailhouse-dev@lfdr.de>; Thu, 25 Jul 2019 17:59:15 +0200 (CEST)
Received: by mail-ot1-x340.google.com with SMTP id q16sf27615876otn.11
        for <lists+jailhouse-dev@lfdr.de>; Thu, 25 Jul 2019 08:59:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:date:from:to:message-id:subject:mime-version
         :x-original-sender:precedence:mailing-list:list-id:list-post
         :list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=tD0mqeLO+M8cDH+153jmTl8mbQgIfjkamCglfEAZEzU=;
        b=rfI6c6v/jRnQHIftcMKRNFZLl7uniAnx1fzAoyVG1rdHIb5M9vEIv+mthCs+rAvOOG
         tub7f6J4M0oWqQzLZxvfzE254q9IelASnLLXQ43ldNtkxSsNo59tAvqoOsXsdGnPSKcb
         0HW2VGKRsMZSPi2Ar89YPJ33Ri3YFMqol7Y9lt/v+D/CVmKxEr5/vQIouwOEwO+pfJS9
         tdLpdw63cEPcItTaiQt51bM1NgTj44qMje/rUClZwC0sN9kb8e8NJ8c6HfB9elIv/v4+
         337Dua3qxVbILI0hTq08ucTY1M3wNFH7tU2lxe+0oHPeFH3Xt+ddSL3i1mgnAQNC6c4v
         7ctA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:message-id:subject:mime-version:x-original-sender
         :precedence:mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=tD0mqeLO+M8cDH+153jmTl8mbQgIfjkamCglfEAZEzU=;
        b=sn0LkwGldiP2oSanNTL/CZ3heSUiQJUMu3n0uW7/2RpzIgR5T1/mFgjgfLjckmvris
         QIkwZvyvIvs0b4O7WgBA/6jC4w72bq5D/4ZaUc+FiNGn+31I6UWaLalJN8pqSAztrflr
         wtIN0DF2BIZFz/Jbs6EOUgVawMUDSUlv+oMQAj+GNgxDZggZojgy0WiT/vLHa/DQZ4a8
         ODGTpO71SFdxFwSkODquB6naFUe3UUP4FJYbg8aRslCGHm0PVhXp1Pgq8+yW8qfB7wDQ
         bc58rmyGyNOjC5PR3oCJcwR7j1AGocwU3LrXzBkeIB2gwqMjqhfLllGW1JqLTiJr8mHt
         PYQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:date:from:to:message-id:subject
         :mime-version:x-original-sender:precedence:mailing-list:list-id
         :x-spam-checked-in-group:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=tD0mqeLO+M8cDH+153jmTl8mbQgIfjkamCglfEAZEzU=;
        b=GALvTAHBB8EmsY5kZWXRolcUMfdqxhLHrwODTPvmzxvlEIGoNpbDyn+k4c1wAKmi8h
         iATLURqL8aIccg0YOFjmO3c2cnLRHHFcQ29omiJeZu4Gr4pQ9PbM+wBjwkz2NjNUYWYZ
         fEmdhXLQwmaaPmV9bRwC/pJOYysFI90lKjRF8GW0GrchlBIcrPEzGmuOy9ISVrPvn686
         DL9CuSMc1tlECKBDNONbAOlJhe/GIriLuxZnYxDfhp4ZR/HusmcycwYG7LQG+sPORFZD
         LnBIQCg4d285s0J2BTzFwkBsai3pjsYSEg5CKAfW8UxyZNgdWQl9MtVv6RSE9y31hLQ2
         CUVw==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: APjAAAU/sKIxHta8ml2sLlpASSVBe0mp1RehrnLxcDJbDspByKZqYLYV
	hD08Ko7UDV0RiUMv/PrV5d4=
X-Google-Smtp-Source: APXvYqygbKsWSwNiPG5fAiAXsxiWq7iBgdtiiK+VyRXiD59C0PecNiONmxAPWVJbJzDjjRJ24eK9Mw==
X-Received: by 2002:a9d:6ac3:: with SMTP id m3mr6344514otq.92.1564070354425;
        Thu, 25 Jul 2019 08:59:14 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:aca:c78e:: with SMTP id x136ls6561030oif.5.gmail; Thu, 25
 Jul 2019 08:59:14 -0700 (PDT)
X-Received: by 2002:aca:4a4e:: with SMTP id x75mr42929585oia.154.1564070353855;
        Thu, 25 Jul 2019 08:59:13 -0700 (PDT)
Date: Thu, 25 Jul 2019 08:59:13 -0700 (PDT)
From: dianaramos007@gmail.com
To: Jailhouse <jailhouse-dev@googlegroups.com>
Message-Id: <15e809ef-6d04-4df6-a706-7fa43e7deee3@googlegroups.com>
Subject: Problem with IVSHMEM on Bananapi
MIME-Version: 1.0
Content-Type: multipart/mixed; 
	boundary="----=_Part_7206_1733242103.1564070353272"
X-Original-Sender: dianaramos007@gmail.com
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

------=_Part_7206_1733242103.1564070353272
Content-Type: multipart/alternative; 
	boundary="----=_Part_7207_187835092.1564070353273"

------=_Part_7207_187835092.1564070353273
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Dear all,

I'm trying to establish an inter-cell communication between 2 cells in=20
Banana Pi-M1 (BPI) using the IVSHMEM protocol.

So far I have compiled and inserted both jailhouse.ko and uio_ivshmem.ko=20
(from https://github.com/henning-schild-work/ivshmem-guest-code) modules in=
=20
BPI, running in Linux kernel 4.13.0, and gic-demo works fine.=20
I've tried to follow this patch (
https://groups.google.com/forum/#!topic/jailhouse-dev/IqwQsQ9JEno) in order=
=20
to create the config file (bananapi-gic-ivshmem-demo.c) based on gic-demo.

For that I added the shared-memory region for IVSHMEM communication:

/* IVSHMEM shared memory region */ {
            .phys_start =3D 0x7bf00000,
            .virt_start =3D 0x7bf00000,
            .size =3D 0x100000,
            .flags =3D JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE,
},

Then, I loaded the cell with the following command:=20

"jailhouse cell load 1 ../inmates/demos/arm/ivshmem-demo.bin -s=20
"pci-cfg-base=3D0x02000000 ivshmem-irq=3D155" -a 0x1000=E2=80=9D and starte=
d it using=20
"jailhouse cell start 1=E2=80=9D, but only got the following output:
"IVSHMEM: pci-cfg-base:0x2000000
IVSHMEM: ivshmem-irq:155"

This is the dmesg output that I get when I load the cell:

[   66.717056] jailhouse: loading out-of-tree module taints kernel.
[   98.515850] OF: PCI: host bridge //pci@0 ranges:
[   98.521159] OF: PCI:   MEM 0x02100000..0x02101fff -> 0x02100000
[   98.527811] pci-host-generic 2000000.pci: ECAM at [mem=20
0x02000000-0x020fffff] for [bus 00]
[   98.538938] pci-host-generic 2000000.pci: PCI host bridge to bus 0000:00
[   98.545808] pci_bus 0000:00: root bus resource [bus 00]
[   98.551289] pci_bus 0000:00: root bus resource [mem=20
0x02100000-0x02101fff]
[   98.559373] pci 0000:00:00.0: [1af4:1110] type 00 class 0xff0000
[   98.559471] pci 0000:00:00.0: reg 0x10: [mem 0x00000000-0x000000ff 64bit=
]
[   98.561658] PCI: bus0: Fast back to back transfers disabled
[   98.567901] pci 0000:00:00.0: BAR 0: assigned [mem 0x02100000-0x021000ff=
=20
64bit]
[   98.578033] uio_ivshmem 0000:00:00.0: enabling device (0000 -> 0002)
[   98.586492] The Jailhouse is opening.
[  110.942999] Created Jailhouse cell "bananapi-gic-ivshmem-demo=E2=80=9D

This is the output that I get when I execute:

./jailhouse console
Initializing Jailhouse hypervisor v0.11 on CPU 1
Code location: 0xf0000040
Page pool usage after early setup: mem 56/16362, remap 0/131072
Initializing processors:
 CPU 1... OK
 CPU 0... OK
Initializing unit: irqchip
Initializing unit: PCI
Adding virtual PCI device 00:00.0 to cell "Banana-Pi"
Page pool usage after late setup: mem 68/16362, remap 5/131072
Activating hypervisor
Adding virtual PCI device 00:00.0 to cell "bananapi-gic-ivshmem-demo"
Shared memory connection established: "bananapi-gic-ivshmem-demo" <-->=20
"Banana-Pi"
Created cell "bananapi-gic-ivshmem-demo"
Page pool usage after cell creation: mem 82/16362, remap 5/131072
Cell "bananapi-gic-ivshmem-demo" can be loaded
Started cell "bananapi-gic-ivshmem-demo

When I list the PCI devices, I obtain the following:

lspci -v
00:00.0 Unassigned class [ff00]: Red Hat, Inc. Inter-VM shared memory
    Subsystem: Red Hat, Inc. Inter-VM shared memory
    Flags: fast devsel, IRQ 86
    Memory at 02100000 (64-bit, non-prefetchable) [size=3D256]

Up until this point, everything seems to work correctly but it is supposed=
=20
to see the info "Kernel driver in use: uio_ivshmem=E2=80=9D when I list the=
 PCI=20
devices. However this information does not show up.
Moreover, as far as I understand I need to create a UIO device in order to=
=20
use IVSHMEM, but when a try to register a new device with  "echo "1af4=20
1110" > /sys/bus/pci/drivers/uio_ivshmem/new_id=E2=80=9D I get the error "w=
rite=20
error: file exists=E2=80=9D. However, if a list all the UIO devices with =
=E2=80=9Cls=20
/dev/uio*=E2=80=9D, the command returns nothing.

To sum up, although I have UIO support compiled into the kernel, the UIO=20
device files are not beeing created.=20

Can anyone help me in overcoming this issue and put IVSHMEM to work in=20
Banana Pi? If needed, I can send any configuration files that I am using.

--=20
You received this message because you are subscribed to the Google Groups "=
Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/=
jailhouse-dev/15e809ef-6d04-4df6-a706-7fa43e7deee3%40googlegroups.com.

------=_Part_7207_187835092.1564070353273
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><font size=3D"2"><span style=3D"font-size:11pt;">Dear all,=
<br>

<br>

I&#39;m trying to establish an inter-cell communication between 2 cells in =
Banana Pi-M1 (BPI) using the IVSHMEM protocol.<br>

<br>

So far I have compiled and inserted both jailhouse.ko and uio_ivshmem.ko (f=
rom <a href=3D"https://github.com/henning-schild-work/ivshmem-guest-code" t=
arget=3D"_blank" rel=3D"noopener noreferrer" data-auth=3D"NotApplicable" id=
=3D"LPlnk475858">
https://github.com/henning-schild-work/ivshmem-guest-code</a>) modules in B=
PI, running in Linux kernel 4.13.0, and gic-demo works fine.
<br>

I&#39;ve tried to follow this patch (<a href=3D"https://groups.google.com/f=
orum/#!topic/jailhouse-dev/IqwQsQ9JEno" target=3D"_blank" rel=3D"noopener n=
oreferrer" data-auth=3D"NotApplicable" id=3D"LPlnk680770" class=3D"OWAAutoL=
ink">https://groups.google.com/forum/#!topic/jailhouse-dev/IqwQsQ9JEno</a>)=
 in order
to create the config file (bananapi-gic-ivshmem-demo.c) based on gic-demo.<=
br>

<br>

For that I added the shared-memory region for IVSHMEM communication:<br>

<br>

/* IVSHMEM shared memory region */ {<br>

=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 .phys_st=
art =3D 0x7bf00000,<br>

=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 .virt_st=
art =3D 0x7bf00000,<br>

=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 .size =
=3D 0x100000,<br>

=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 .flags =
=3D JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE,<br>

},<br>

<br>

Then, I loaded the cell with the following command: <br>

<br>

&quot;jailhouse cell load 1 ../inmates/demos/arm/ivshmem-demo.bin -s=20
&quot;pci-cfg-base=3D0x02000000 ivshmem-irq=3D155&quot; -a 0x1000=E2=80=9D =
and started it=20
using &quot;jailhouse cell start 1=E2=80=9D, but only got the following out=
put:<br>

&quot;IVSHMEM: pci-cfg-base:0x2000000<br>

IVSHMEM: ivshmem-irq:155&quot;<br>

<br>

This is the dmesg output that I get when I load the cell:<br>

<br>

[=C2=A0=C2=A0 66.717056] jailhouse: loading out-of-tree module taints kerne=
l.<br>

[=C2=A0=C2=A0 98.515850] OF: PCI: host bridge //pci@0 ranges:<br>

[=C2=A0=C2=A0 98.521159] OF: PCI:=C2=A0=C2=A0 MEM 0x02100000..0x02101fff -&=
gt; 0x02100000<br>

[=C2=A0=C2=A0 98.527811] pci-host-generic 2000000.pci: ECAM at [mem 0x02000=
000-0x020fffff] for [bus 00]<br>

[=C2=A0=C2=A0 98.538938] pci-host-generic 2000000.pci: PCI host bridge to b=
us 0000:00<br>

[=C2=A0=C2=A0 98.545808] pci_bus 0000:00: root bus resource [bus 00]<br>

[=C2=A0=C2=A0 98.551289] pci_bus 0000:00: root bus resource [mem 0x02100000=
-0x02101fff]<br>

[=C2=A0=C2=A0 98.559373] pci 0000:00:00.0: [1af4:1110] type 00 class 0xff00=
00<br>

[=C2=A0=C2=A0 98.559471] pci 0000:00:00.0: reg 0x10: [mem 0x00000000-0x0000=
00ff 64bit]<br>

[=C2=A0=C2=A0 98.561658] PCI: bus0: Fast back to back transfers disabled<br=
>

[=C2=A0=C2=A0 98.567901] pci 0000:00:00.0: BAR 0: assigned [mem 0x02100000-=
0x021000ff 64bit]<br>

[=C2=A0=C2=A0 98.578033] uio_ivshmem 0000:00:00.0: enabling device (0000 -&=
gt; 0002)<br>

[=C2=A0=C2=A0 98.586492] The Jailhouse is opening.<br>

[=C2=A0 110.942999] Created Jailhouse cell &quot;bananapi-gic-ivshmem-demo=
=E2=80=9D<br>

<br>

This is the output that I get when I execute:<br>

<br>

./jailhouse console<br>

Initializing Jailhouse hypervisor v0.11 on CPU 1<br>

Code location: 0xf0000040<br>

Page pool usage after early setup: mem 56/16362, remap 0/131072<br>

Initializing processors:<br>

=C2=A0CPU 1... OK<br>

=C2=A0CPU 0... OK<br>

Initializing unit: irqchip<br>

Initializing unit: PCI<br>

Adding virtual PCI device 00:00.0 to cell &quot;Banana-Pi&quot;<br>

Page pool usage after late setup: mem 68/16362, remap 5/131072<br>

Activating hypervisor<br>

Adding virtual PCI device 00:00.0 to cell &quot;bananapi-gic-ivshmem-demo&q=
uot;<br>

Shared memory connection established: &quot;bananapi-gic-ivshmem-demo&quot;=
 &lt;--&gt; &quot;Banana-Pi&quot;<br>

Created cell &quot;bananapi-gic-ivshmem-demo&quot;<br>

Page pool usage after cell creation: mem 82/16362, remap 5/131072<br>

Cell &quot;bananapi-gic-ivshmem-demo&quot; can be loaded<br>

Started cell &quot;bananapi-gic-ivshmem-demo<br>

<br>

When I list the PCI devices, I obtain the following:<br>

<br>

lspci -v<br>

00:00.0 Unassigned class [ff00]: Red Hat, Inc. Inter-VM shared memory<br>

=C2=A0=C2=A0=C2=A0 Subsystem: Red Hat, Inc. Inter-VM shared memory<br>

=C2=A0=C2=A0=C2=A0 Flags: fast devsel, IRQ 86<br>

=C2=A0=C2=A0=C2=A0 Memory at 02100000 (64-bit, non-prefetchable) [size=3D25=
6]<br>

<br>

Up until this point, everything seems to work correctly but it is=20
supposed to see the info &quot;Kernel driver in use: uio_ivshmem=E2=80=9D w=
hen I list
 the PCI devices. However this information does not show up.<br>

Moreover, as far as I understand I need to create a UIO device in order=20
to use IVSHMEM, but when a try to register a new device with=C2=A0 &quot;ec=
ho=20
&quot;1af4 1110&quot; &gt; /sys/bus/pci/drivers/uio_ivshmem/new_id=E2=80=9D=
 I get the=20
error &quot;write error: file exists=E2=80=9D. However, if a list
all the UIO devices with =E2=80=9Cls /dev/uio*=E2=80=9D, the command return=
s nothing.<br>

<br>

To sum up, although I have UIO support compiled into the kernel, the UIO de=
vice files are not beeing created.
<br>

<br>

Can anyone help me in overcoming this issue and put IVSHMEM to work in=20
Banana Pi? If needed, I can send any configuration files that I am=20
using.</span></font></div>

<p></p>

-- <br />
You received this message because you are subscribed to the Google Groups &=
quot;Jailhouse&quot; group.<br />
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to <a href=3D"mailto:jailhouse-dev+unsubscribe@googlegroups.com">jailh=
ouse-dev+unsubscribe@googlegroups.com</a>.<br />
To view this discussion on the web visit <a href=3D"https://groups.google.c=
om/d/msgid/jailhouse-dev/15e809ef-6d04-4df6-a706-7fa43e7deee3%40googlegroup=
s.com?utm_medium=3Demail&utm_source=3Dfooter">https://groups.google.com/d/m=
sgid/jailhouse-dev/15e809ef-6d04-4df6-a706-7fa43e7deee3%40googlegroups.com<=
/a>.<br />

------=_Part_7207_187835092.1564070353273--

------=_Part_7206_1733242103.1564070353272--
