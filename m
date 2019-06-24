Return-Path: <jailhouse-dev+bncBCZKXDNMZALBB57GYTUAKGQEXUUYFQI@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-ot1-x33b.google.com (mail-ot1-x33b.google.com [IPv6:2607:f8b0:4864:20::33b])
	by mail.lfdr.de (Postfix) with ESMTPS id 9597851C6A
	for <lists+jailhouse-dev@lfdr.de>; Mon, 24 Jun 2019 22:32:57 +0200 (CEST)
Received: by mail-ot1-x33b.google.com with SMTP id a8sf7967250oti.8
        for <lists+jailhouse-dev@lfdr.de>; Mon, 24 Jun 2019 13:32:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:date:from:to:message-id:in-reply-to:references:subject
         :mime-version:x-original-sender:precedence:mailing-list:list-id
         :list-post:list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=iYibO25v4THeWOd7cffqSouwnGhA5R5YJhVCaVT6xP8=;
        b=EFlOSEZy7WOanW4GO8KpgspLYHBIrnm+3062GPuA4vkMKuXJ0haqMfI1cTw8Ny2Ten
         NG9KQtTKMzlayOZfS4WfzteiK+VOvaOk7ZHYq8CbvlZVRj1owku941jenq5QqxbLBwc3
         BWigeMl41wVZ6X4YyFKuUfzZ5UiOExgyGzl6/1qrWEtNQURWyWFMbGiL73EJIeoL+JP5
         2yd03jt9DKQe2wZnRAS1khWQIbck/DhLNF5Rp7h4o2VFiQvAwxFm2l/DkUwEO7iIqllQ
         mRXh5MSR+gVnyz+QYFy0Ay8Y89ECU/P12rO5Tfl/5zyPD2Wsg0mBb0OI59/+WWNGxZ8r
         lTuQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:message-id:in-reply-to:references:subject:mime-version
         :x-original-sender:precedence:mailing-list:list-id:list-post
         :list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=iYibO25v4THeWOd7cffqSouwnGhA5R5YJhVCaVT6xP8=;
        b=sAnQU9xyll+oHrg/Sy75e3AMlNg8nLJpryhT8awBFpf8a98TFRINmYfnD+cOZQE5n5
         qN4tbE4pKkfIMxLa3Ccdplgw6C3QxcSHb+g7/kF7UxbJ4saKpisHuQ8hFHJ7M4d7iJtd
         +Kp4nFab016ozPfZZzv6FTZe4Ivictng5Jl9TMnWobU9HxQEOH82YCjTuStXJcXCmFv2
         LX4llx5RFebKHvwlrZKM7rJcB/UuvEcLB91xtPkYiVYa1Dlv43se7aEjhmgYcKOrQr3q
         CKUXBIMssjNS65l0W6TTUZQzDKS1hybAbVJnu30CIC5WOFzvpiSH5hhOxx2L/QHV+Ny0
         CXSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:date:from:to:message-id:in-reply-to
         :references:subject:mime-version:x-original-sender:precedence
         :mailing-list:list-id:x-spam-checked-in-group:list-post:list-help
         :list-archive:list-subscribe:list-unsubscribe;
        bh=iYibO25v4THeWOd7cffqSouwnGhA5R5YJhVCaVT6xP8=;
        b=RCRbNl1wmU+W2MC3lOKxl/2aW1wBlecFnhX/ovaahXkylPSn0DoE8THi0b1Q7o+RWH
         CKt+uJ27TvnXMe1fGfdyWBG1QB2wjEJU7cTYNHJ9q+h255yr7/odfyMjELn5CveoIE3w
         /xlTHoE8kz4BgCDg9qrzAt+mAbB54SFslyJCb1zArXLA4BmpqR6tEeSZbqo7gTBXPQKC
         BxXh89aMTbJ7w0wnBMdwamDVbqTcpZza7sqORqr4g0uNQ6vSCPcJvWOyJcpuD/8GDpJb
         feuoqxxLvr1Yk8q6JjSE/R2IVamhzGEKJWCfQqWj4IBaglekR3XtqTYlWSVlgrTQ1iWF
         LENw==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: APjAAAXivO/W3G2KSLnsuLuNU46yFjiKN1NY/zQ229p3nUQpwuDkWgPH
	vmEzwDSFjRqzXRQd+raaV9g=
X-Google-Smtp-Source: APXvYqwuigTRu8lPUcZxW2V+z3j3ETgGFCoaGiLSc20Tcru6fG2hzI52xXYLKseu2eKqQKu7RCu0xQ==
X-Received: by 2002:a9d:6e01:: with SMTP id e1mr74398664otr.220.1561408376175;
        Mon, 24 Jun 2019 13:32:56 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a9d:6c1a:: with SMTP id f26ls113122otq.4.gmail; Mon, 24 Jun
 2019 13:32:55 -0700 (PDT)
X-Received: by 2002:a9d:578c:: with SMTP id q12mr4109863oth.240.1561408375528;
        Mon, 24 Jun 2019 13:32:55 -0700 (PDT)
Date: Mon, 24 Jun 2019 13:32:54 -0700 (PDT)
From: Alejandro Largacha <alexlargacha@gmail.com>
To: Jailhouse <jailhouse-dev@googlegroups.com>
Message-Id: <3f445e6c-699b-4cc0-b73e-10df44848858@googlegroups.com>
In-Reply-To: <d51da6c7-705d-4695-867d-6d114b4abeef@googlegroups.com>
References: <b6a945e8-0bef-4939-a412-19d1e7bc6f53@googlegroups.com>
 <0954fc59-e01b-cb24-64c1-9f44b26a6e21@siemens.com>
 <058dbed0-9c53-4b6b-acd9-bd831f8ff3a3@googlegroups.com>
 <997ea182-e94b-46ae-8eee-408541db2c4b@googlegroups.com>
 <07298146-b472-b565-ce5a-7b96258d29d8@web.de>
 <b82a848d-4c1e-4958-98c2-b4000451b256@googlegroups.com>
 <4b964f87-c2ea-49b5-bf85-3f11fd60bf88@googlegroups.com>
 <38c1bdda-dffd-3971-28dd-c8475bb774e9@siemens.com>
 <60b8cf79-5a1b-44ab-a693-7b7e129f543b@googlegroups.com>
 <01210628-e7af-3dd9-a875-199abd7c611b@siemens.com>
 <da4669b3-87aa-4dbc-b75c-a1f2a787a98c@googlegroups.com>
 <fc9f0c8e-151b-e328-7bf6-54b52ed0478d@siemens.com>
 <d51da6c7-705d-4695-867d-6d114b4abeef@googlegroups.com>
Subject: Re: Running Jailhouse on UltraZed SOM board --stuck at enabling
 root cell
MIME-Version: 1.0
Content-Type: multipart/mixed; 
	boundary="----=_Part_1802_1695439640.1561408374902"
X-Original-Sender: alexlargacha@gmail.com
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

------=_Part_1802_1695439640.1561408374902
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

El mi=C3=A9rcoles, 7 de noviembre de 2018, 3:55:07 (UTC+1), JJZhu  escribi=
=C3=B3:
> =E5=9C=A8 2018=E5=B9=B411=E6=9C=886=E6=97=A5=E6=98=9F=E6=9C=9F=E4=BA=8C U=
TC+8=E4=B8=8B=E5=8D=887:44:37=EF=BC=8CJ. Kiszka=E5=86=99=E9=81=93=EF=BC=9A
> > On 06.11.18 08:16, jjzhu1989@gmail.com wrote:
> > > Hi Jan,
> > >=20
> > > Thank you for you help! the root cell finally booted up successfully!
> > >=20
> > > jh_01 login: root
> > > Password:
> > > root@jh_01:~# start_getty 115200 ttyPS1 &
> > > [1] 2045
> > > root@jh_01:~# modprobe jailhouse
> > > [   63.894446] jailhouse: loading out-of-tree module taints kernel.
> > > root@jh_01:~# jailhouse enable zynqmp-zcu102.cell
> > >=20
> > > Initializing Jailhouse hypervisor v0.10 on CPU 3
> > > Code location: 0x0000ffffc0200800
> > > Page pool usage after early setup: mem 39/996, remap 0/131072
> > > Initializing processors:
> > >   CPU 3... OK
> > >   CPU 1... OK
> > >   CPU 0... OK
> > >   CPU 2... OK
> > > Initializing unit: irqchip
> > > Initializing unit: PCI
> > > Adding virtual PCI device 00:00.0 to cell "ZynqMP-ZCU102"
> > > Adding virtual PCI device 00:01.0 to cell "ZynqMP-ZCU102"
> > > Page pool usage after late setup: mem 61/996, remap 5/131072
> > > Activating hypervisor
> > > [   67.785765] OF: PCI: host bridge //pci@0 ranges:
> > > [   67.792657] OF: PCI:   MEM 0xfc100000..0xfc103fff -> 0xfc100000
> > > [   67.800870] pci-host-generic fc000000.pci: ECAM at [mem 0xfc000000=
-0xfc0fffff] for [bus 00]
> > > [   67.811624] pci-host-generic fc000000.pci: PCI host bridge to bus =
0000:00
> > > [   67.820716] pci_bus 0000:00: root bus resource [bus 00]
> > > [   67.828212] pci_bus 0000:00: root bus resource [mem 0xfc100000-0xf=
c103fff]
> > > [   67.837843] pci 0000:00:00.0: BAR 0: assigned [mem 0xfc100000-0xfc=
1000ff 64bit]
> > > [   67.847427] pci 0000:00:01.0: BAR 0: assigned [mem 0xfc100100-0xfc=
1001ff 64bit]
> > > [   67.857009] The Jailhouse is opening.
> > > root@jh_01:~# jailhouse cell create zynqmp-zcu102-gic-demo.cell
> > > [   82.076593] CPU3: shutdown
> > > [   82.081468] psci: CPU3 killed.
> > > Created cell "gic-demo"
> > > Page pool usage after cell creation: mem 75/996, remap 5/131072
> > > [   82.116898] Created Jailhouse cell "gic-demo"
> > > root@jh_01:~# jailhouse cell load
> > > --name    1         gic-demo
> > > root@jh_01:~# jailhouse cell load 1 gic-demo1.bin
> > > Cell "gic-demo" can be loaded
> > > root@jh_01:~# jailhouse cell  start
> > > Usage: jailhouse { COMMAND | --help | --version }
> > >=20
> > > Available commands:
> > >     enable SYSCONFIG
> > >     disable
> > >     console [-f | --follow]
> > >     cell create CELLCONFIG
> > >     cell list
> > >     cell load { ID | [--name] NAME } { IMAGE | { -s | --string } "STR=
ING" }
> > >               [-a | --address ADDRESS] ...
> > >     cell start { ID | [--name] NAME }
> > >     cell shutdown { ID | [--name] NAME }
> > >     cell destroy { ID | [--name] NAME }
> > >     cell linux CELLCONFIG KERNEL [-i | --initrd FILE]
> > >                [-c | --cmdline "STRING"] [-w | --write-params FILE]
> > >     cell stats { ID | [--name] NAME }
> > >     config create [-h] [-g] [-r ROOT] [--mem-inmates MEM_INMATES]
> > >                   [--mem-hv MEM_HV] FILE
> > >     config collect FILE.TAR
> > >     hardware check
> > > root@jh_01:~# jailhouse cell start 1
> > > Started cell "gic-demo"
> > >=20
> > > The modification I did is as follow:
> > > in zynqmp-zcu102.c
> > >=20
> > > .header =3D {
> > > 		.signature =3D JAILHOUSE_SYSTEM_SIGNATURE,
> > > 		.revision =3D JAILHOUSE_CONFIG_REVISION,
> > > 		.flags =3D JAILHOUSE_SYS_VIRTUAL_DEBUG_CONSOLE,
> > > 		.hypervisor_memory =3D {
> > > 			.phys_start =3D 0x40000000,
> > > 			.size =3D       0x00400000,
> > > 		},
> > >=20
> > > /* RAM */ {
> > > 			.phys_start =3D 0x0,
> > > 			.virt_start =3D 0x0,
> > > 			.size =3D 0x40000000,
> > > 			.flags =3D JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
> > > 				JAILHOUSE_MEM_EXECUTE,
> > > 		},
> > > 		/* RAM */ {
> > > 			.phys_start =3D 0x40600000,
> > > 			.virt_start =3D 0x40600000,
> > > 			.size =3D 0x3fa00000,
> > > 			.flags =3D JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
> > > 				JAILHOUSE_MEM_EXECUTE,
> > > 		},
> > > 		/* IVSHMEM shared memory region for 00:00.0 */ {
> > > 			.phys_start =3D 0x40400000,
> > > 			.virt_start =3D 0x40400000,
> > > 			.size =3D 0x100000,
> > > 			.flags =3D JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE,
> > > 		},
> > > 		/* IVSHMEM shared memory region for 00:01.0 */ {
> > > 			.phys_start =3D 0x40500000,
> > > 			.virt_start =3D 0x40500000,
> > > 			.size =3D 0x100000,
> > > 			.flags =3D JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE,
> > > 		},
> > >=20
> > > I also have changed the zynqmp-zcu102-gic-demo.c
> > >=20
> > > /* RAM */ {
> > > 			.phys_start =3D 0x40600000,
> > > 			.virt_start =3D 0,
> > > 			.size =3D 0x00010000,
> > > 			.flags =3D JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
> > > 				JAILHOUSE_MEM_EXECUTE | JAILHOUSE_MEM_LOADABLE,
> > > 		},
> > >=20
> > > But when I start the gic-demo cell, no print out information.
> >=20
> > If you are using/deriving from configs/arm64/zynqmp-zcu102-gic-demo.c, =
you will=20
> > see that this directs the output to the second UART. If you don't have =
that=20
> > port, change it to be shared with the root cell's UART.
> >=20
> > Jan
> >=20
> > --=20
> > Siemens AG, Corporate Technology, CT RDA IOT SES-DE
> > Corporate Competence Center Embedded Linux
>=20
> Hi Jan,
>=20
> This board has the second Uart. I have tested it with=20
> start_tty 115200 ttyPS1 &
>=20
> Could you give some hints on how to develop a simple "hello world" image =
from Xilinx SDK?=20
> Than you!

Hello,

Where you able to see the prints in the second uart? I am facing the same p=
roblem in UltraZed Som. I have followed this topic and been able to load th=
e system cell and the gic-demo cell and the gic-demo.bin, but cannot see th=
e prints in the second Uart. I tested the hardware with a baremetal app in =
sdk and the second uart is alive.

I am running a 4.14 kernel from Xilinx.

thank you in advance.

Alex

--=20
You received this message because you are subscribed to the Google Groups "=
Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/=
jailhouse-dev/3f445e6c-699b-4cc0-b73e-10df44848858%40googlegroups.com.
For more options, visit https://groups.google.com/d/optout.

------=_Part_1802_1695439640.1561408374902--
