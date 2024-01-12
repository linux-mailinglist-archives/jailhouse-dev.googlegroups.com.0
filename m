Return-Path: <jailhouse-dev+bncBDIJ36FET4JRBDHTQSWQMGQEXBGIGFQ@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-yb1-xb38.google.com (mail-yb1-xb38.google.com [IPv6:2607:f8b0:4864:20::b38])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A43D82C086
	for <lists+jailhouse-dev@lfdr.de>; Fri, 12 Jan 2024 14:07:26 +0100 (CET)
Received: by mail-yb1-xb38.google.com with SMTP id 3f1490d57ef6-dbedaa77289sf7584350276.0
        for <lists+jailhouse-dev@lfdr.de>; Fri, 12 Jan 2024 05:07:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20230601; t=1705064845; x=1705669645; darn=lfdr.de;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:x-original-sender:mime-version
         :subject:references:in-reply-to:message-id:to:from:date:sender:from
         :to:cc:subject:date:message-id:reply-to;
        bh=PHne71u2bWOcais6n2DHEw9WLRXoUB7c1FbIpgbaHm0=;
        b=rb7AbupY6pCYe6TgxelRoQoV/7wAE+e1bWhEEwfePHBhQ/0AzBp6MA6prKdq3judZs
         /SHmrCjT+GbqnPZRYC+LaMyHH8QpCth4Sxi6XbPHsk5M8wUzm1MIbFkRwGSltshMwHzR
         au8BO51ZnpXVRaQTDOlogpkhJYkx62hXaQEoQklEVUTdA29J1AtoL+SlmudeHxQ+mvao
         m7hA4VxbfCdyZYhAgVFXX7GdP4haSxpiR4g9b78Jk3nTE8gj7fLQuaT4A8KsZB4ybSjG
         PQQCcbw74LPBZmuPTXJcVPGQcen4B5iU/kS+c7oXiQ8z5XjswmaRIxqiOpH3sZSX4qQv
         3PaQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1705064845; x=1705669645; darn=lfdr.de;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:x-original-sender:mime-version
         :subject:references:in-reply-to:message-id:to:from:date:from:to:cc
         :subject:date:message-id:reply-to;
        bh=PHne71u2bWOcais6n2DHEw9WLRXoUB7c1FbIpgbaHm0=;
        b=L9Vo5f5QHUqd64X98FpElQkQvjJjmnE2WpwnROu5yMpRp5EvJzVWbvNzjWQXk2wCXE
         tgxzAg0HjKerseTce9xDWkEJssNx4KGdqKE0xI+RBn3O9aaK59e4OUt8cG3VU5tiGPxN
         3kNSOj+LU6uiFrfXETvFWDw/cGBMGCDvgHPCERTItsAP798hgwql4pqhFecqGkIo4+/A
         1lenzLmKRuEhssInHhJuULR12O5j1AZw+MMHqqBoUAfpqO1t2cVC26U8ij0S0jACYjTw
         FOPJ616pJvAbmABnt3gdq7IJe20yD/5J3Rrv/Q2ZJA6JHpzGjSgfIJk2ZTAAJBoFDXxJ
         DfxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1705064845; x=1705669645;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :x-spam-checked-in-group:list-id:mailing-list:precedence
         :x-original-sender:mime-version:subject:references:in-reply-to
         :message-id:to:from:date:x-beenthere:x-gm-message-state:sender:from
         :to:cc:subject:date:message-id:reply-to;
        bh=PHne71u2bWOcais6n2DHEw9WLRXoUB7c1FbIpgbaHm0=;
        b=dTLkPMbFrOIHYcQ8+LXJsizytOrjCM54Cy5U69//QszcD7Xne5lQrNT+d2sxhsQE1R
         fZu6dB0UaMAuUXnCO60C3J6WFob6Zv/f/rf6hmOyZd3+aHQpQgqaRL2Gk7RmSjPRsU2t
         XmpfwFAALsd6QmT4S9sGuNLXUrsx3n+hcx8aHjv9dpGav6fGAjt6PGOarm4SYMiPGR7y
         K2ac35b5r1RcwjzdDGbFxfC6zrTI1aShg/cl6a1YlZJVnfu09gIMMiBRjUwkj+GbQIbE
         jMEdsjox7lxRXBgUkCioVJlsTnNvk1iDM3qR1Y+5p5RZeED2B8UvBvrXlHlzo5XKehdF
         bwfQ==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AOJu0YxM2YNU0tls3+Uc2Ytl5Iniri+yMJ8JRyGKg/u42iCxTktsi8Vr
	8JJ6BEpO3fn4dqLBbkDHdTY=
X-Google-Smtp-Source: AGHT+IHNXZAZveJN/FjVXONldqokpuCVOI5+RTboGJDn2WRDp5K5YFSoFcy6l8R8/o26yuzXBnrteQ==
X-Received: by 2002:a05:6902:724:b0:dbf:317f:ddc5 with SMTP id l4-20020a056902072400b00dbf317fddc5mr514602ybt.14.1705064845081;
        Fri, 12 Jan 2024 05:07:25 -0800 (PST)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a25:d743:0:b0:dbf:3bab:286c with SMTP id o64-20020a25d743000000b00dbf3bab286cls1197717ybg.2.-pod-prod-09-us;
 Fri, 12 Jan 2024 05:07:23 -0800 (PST)
X-Received: by 2002:a0d:ed42:0:b0:5fb:63fc:fac8 with SMTP id w63-20020a0ded42000000b005fb63fcfac8mr745871ywe.8.1705064842301;
        Fri, 12 Jan 2024 05:07:22 -0800 (PST)
Date: Fri, 12 Jan 2024 05:07:21 -0800 (PST)
From: =?UTF-8?Q?Michele_Pescap=C3=A8?= <mic.pescape@gmail.com>
To: Jailhouse <jailhouse-dev@googlegroups.com>
Message-Id: <bbd32aa2-053e-40a2-b4d5-2326238d0793n@googlegroups.com>
In-Reply-To: <81df336d-a7bb-49e2-8762-a1294aef67e9@oth-regensburg.de>
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
Subject: Re: Unable to start non root linux cell
MIME-Version: 1.0
Content-Type: multipart/mixed; 
	boundary="----=_Part_20638_1213602568.1705064841332"
X-Original-Sender: mic.pescape@gmail.com
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

------=_Part_20638_1213602568.1705064841332
Content-Type: multipart/alternative; 
	boundary="----=_Part_20639_468047453.1705064841332"

------=_Part_20639_468047453.1705064841332
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi,

The config is the correct one. Nothing from dmesg except

[ 8254.074890] smpboot: CPU 8 is now offline
[ 8254.206652] smpboot: CPU 9 is now offline
[ 8254.254775] Created Jailhouse cell "linux-2"

The hypervisor only reports:

CPU 9 received SIPI, vector 96         (this is the last line of the output=
=20
from the previous attempt)
Created cell "linux-2"        (first line after issuing the cell linux=20
command)
Page pool usage after cell creation: mem 272/32211, remap 16392/131072
Cell "linux-2" can be loaded


I tried using the -w flag, this is what it said when using :

jailhouse cell create configs/x86/linux_guest2.cell
jailhouse cell load linux-2 linux-loader.bin -a 0x0=20
../buildroot-2023.11/output/images/bzImage -a 0xffbe00 parameters -a 0x1000
jailhouse cell start linux-2

I take it the kernel is loaded at 0xffbe00 which is right at the edge of=20
the low ram region. In fact after issuing the cell load command and=20
adjusting the path for the loader I get JAILHOUSE_CELL_LOAD: Invalid=20
argument.
Nothing is said from dmesg, the hypervisor only says "Cell "linux-2" can be=
=20
loaded".=20

At this point I tried pointing the address for the kernel in the cell load=
=20
command to the high ram region by giving -a 0x42300000 as the address.=20

I get the following output when starting the cell:

Created cell "linux-2"
Page pool usage after cell creation: mem 270/32211, remap 16392/131072
Cell "linux-2" can be loaded=20
Started cell "linux-2"
CPU 9 received SIPI, vector 100
CPU 8 received SIPI, vector 100
FATAL: unable to get MMIO instruction
FATAL: Invalid MMIO/RAM read, addr: 0x0000000001000000 size: 0
RIP: 0x0000000001000200 RSP: 0x0000000000009fe8 FLAGS: 46
RAX: 0x0000000001000200 RBX: 0x000000000000427d RCX: 0x00000000000000ff
RDX: 0x0000000000000000 RSI: 0x0000000000001000 RDI: 0x0000000000000000
CS: 10 BASE: 0x0000000000000000 AR-BYTES: 29b EFER.LMA 1
CR0: 0x0000000080010011 CR3: 0x0000000000005000 CR4: 0x0000000000040220
EFER: 0x0000000000001500
Parking CPU 9 (Cell: "linux-2")
FATAL: Unexpected #VMEXIT, exitcode 7f, exitinfo1 0x0000000000000000=20
exitinfo2 0x0000000000000000
RIP: 0x000000000000000f RSP: 0x0000000000009fe8 FLAGS: 2
RAX: 0x0000000001000201 RBX: 0x000000000000427d RCX: 0x00000000000000ff
RDX: 0x0000000000000000 RSI: 0x0000000000001000 RDI: 0x0000000000000000
CS: 10 BASE: 0x0000000000000000 AR-BYTES: 29b EFER.LMA 1
CR0: 0x0000000001000201 CR3: 0x0000000000005000 CR4: 0x0000000000040220
EFER: 0x0000000000001500

And then it continues to display the vmexit error without stopping if the=
=20
cell isn't destroyed. I can avoid this by increasing the size of the low=20
ram region to 0x00200000.

That allows me to proceed and starting the cell with cell start, the=20
hypervisor output being:

Created cell "linux-2"
Page pool usage after cell creation: mem 272/32211, remap 16392/131072
Cell "linux-2" can be loaded
Started cell "linux-2"
CPU 9 received SIPI, vector 100
CPU 8 received SIPI, vector 100

but without any other sign.=20

I still need to decrease the kernel size, i only reduced it by 1MB.=20
I'll attach again the non root config, however it isn't much different than=
=20
the other I sent, i only fixed the weird alignment and changed a bit the=20
start addresses of the comm region and the high ram region.

Thanks,=20
Michele

Il giorno gioved=C3=AC 11 gennaio 2024 alle 21:55:47 UTC+1 Ralf Ramsauer ha=
=20
scritto:

> Hi,
>
> On 11/01/2024 13:57, Michele Pescap=C3=A8 wrote:
> > Hi,
> >=20
> > after changing the virt_start to match the phys_start for that memory=
=20
> > region I got an invalid argument error when starting the cell
> >=20
> > Traceback (most recent call last):
> >   File "/usr/local/libexec/jailhouse/jailhouse-cell-linux", line 739,=
=20
> > in <module>
> >     cell.load(arch.kernel_image, arch.kernel_address())
> >   File "/usr/local/lib/python3.10/dist-packages/pyjailhouse/cell.py",=
=20
> > line 44, in load
> >     fcntl.ioctl(self.dev, self.JAILHOUSE_CELL_LOAD, load)
> > OSError: [Errno 22] Invalid argument
>
> Are you sure that you created the cell with the correct config? What=20
> does dmesg say? Any output on the hypervisor console when this error=20
> happens?
>
> >=20
> > Printing the arch.kernel_address() returned 16760320 (should be=20
> > 0xffbe00), so I thought that the bzImage was too big for the low ram=20
> region.
>
> jailhouse-cell-linux won't load the bzImage to the low ram region. You=20
> can use the -w option to dump a file that prints the commands that=20
> jailhouse-cell-linux would invoke.
>
> > I increased the size to .size =3D 0x04000000 and shifted the virt and=
=20
> > phys_start of the other two regions to match the change (virt_start =3D=
=20
> > 0x04000000 for the comm region and virt=3Dphys_start =3D 0x46000000 for=
 the=20
> > third region) .
> > No issues were reported by config check but after starting the cell i=
=20
> > got no output even using earlyprintk.
> >=20
> > I also tried using an initrd but I got a similar issue, invalid argumen=
t=20
> > when starting the cell, this time it was the arch.ramdisk_address()=20
> > which was 107327488 (0x665b000).
> > So i tried increasing even more the size of the first region to size =
=3D=20
> > 0x0a000000 (comm region now starts at .virt_start =3D 0x0a000000, and t=
he=20
> > third region starts at  virt=3D.phys_start =3D 0x4c000000 with size =3D=
=20
> > 0x6000000).
> > Again, no config check issues so I started it but no output again, the=
=20
> > hypervisor only reports:
> >=20
> > Created cell "linux-1"
> > Page pool usage after cell creation: mem 268/32211, remap 16392/131072
> > Cell "linux-1" can be loaded
> > CPU 5 received SIPI, vector 100
> > CPU 4 received SIPI, vector 100
> > Started cell "linux-1"
> >=20
> > My bzImage is 12,9MB and the rootfs.cpio is 23.1MB if that matters.
>
> Try starting without the ramdisk. We can later take care of the ramdisk,=
=20
> but first the kernel needs to start.
>
> For a compressed image, your kernel is really huge. I bet you can boil=20
> it down to a few MBs. With a kernel of that size, you might want to play=
=20
> around with jailhouse-cell-linux -k.
>
> Ralf
>
> >=20
> > Thanks,
> > Michele
> >=20
> >=20
> >=20
> > Il giorno mercoled=C3=AC 10 gennaio 2024 alle 20:58:03 UTC+1 Ralf Ramsa=
uer ha=20
> > scritto:
> >=20
> > Hi Michele,
> >=20
> > On 10/01/2024 17:40, Michele Pescap=C3=A8 wrote:
> > > Hi,
> > >
> > > I'm attaching the configurations I'm currently using. I'll try
> > disabling
> > > KASLR.
> >=20
> > [=E2=80=A6]
> > /* high RAM */
> > {
> > .phys_start =3D 0x42100000,
> > .virt_start =3D 0x00101000,
> > .size =3D 0x8000000,
> > [=E2=80=A6]
> >=20
> > Alignment of your high ram is odd. Virt & Phys should have the same
> > alignment. Try to use .phys=3D.virt=3D0x42100000, I guess that should h=
elp.
> >=20
> > Thanks,
> > Ralf
> >=20
> >=20
> > >
> > > Thank you for your help,
> > > Michele
> > >
> > > Il giorno mercoled=C3=AC 10 gennaio 2024 alle 17:24:35 UTC+1 Ralf
> > Ramsauer ha
> > > scritto:
> > >
> > > Hi,
> > >
> > > On 09/01/2024 19:58, Michele Pescap=C3=A8 wrote:
> > > > Hi,
> > > >
> > > > Just an update, I was able to get the following output by
> > adding -c
> > > > "earlyprintk=3DttyS0,115200" to the command line:
> > > >
> > > > Started cell "linux-1"
> > > >
> > > >
> > > > Invalid physical address chosen!
> > >
> > > could you please share your system and non-root cell configuration?
> > >
> > > It smells like you have an overlap with the communication region.
> > You
> > > can check that with tools/jailhouse-config-check.
> > >
> > > >
> > > >
> > > >
> > > >
> > > > Physical KASLR disabled: no suitable memory region!
> > >
> > > Disable KASLR in your kernel for the moment. You don't need it while
> > > ramping up your system.
> > >
> > > Thanks,
> > > Ralf
> > >
> > > >
> > > > [    0.000000] Linux version 6.2.0-rc3 (root@mp-LINUX-DESKTOP)
> > > > (x86_64-buildroot-linux-gnu-gcc.br_real (Buildroot 2023.11)
> > > 12.3.0, GNU
> > > > ld (GNU Binutils) 2.40) #2 SMP PREEMPT_DYNAMIC Sun Jan  7
> > > 18:35:23 CET 2024
> > > > [    0.000000] Command line: earlyprintk=3DttyS0,115200
> > > > [    0.000000] KERNEL supported cpus:
> > > > [    0.000000]   Intel GenuineIntel
> > > > [    0.000000]   AMD AuthenticAMD
> > > > [    0.000000] x86/fpu: Supporting XSAVE feature 0x001: 'x87
> > > floating
> > > > point registers'
> > > > [    0.000000] x86/fpu: Supporting XSAVE feature 0x002: 'SSE
> > > registers'
> > > > [    0.000000] x86/fpu: Supporting XSAVE feature 0x004: 'AVX
> > > registers'
> > > > [    0.000000] x86/fpu: xstate_offset[2]:  576, xstate_sizes[2]:
> > >  256
> > > > [    0.000000] x86/fpu: Enabled xstate features 0x7, context size
> > > is 832
> > > > bytes, using 'compacted' format.
> > > > [    0.000000] signal: max sigframe size: 1776
> > > > [    0.000000] BIOS-provided physical RAM map:
> > > > [    0.000000] BIOS-e801: [mem
> > > 0x0000000000000000-0x000000000009efff] usable
> > > > [    0.000000] printk: bootconsole [earlyser0] enabled
> > > > [    0.000000] NX (Execute Disable) protection: active
> > > > [    0.000000] extended physical RAM map:
> > > > [    0.000000] reserve setup_data: [mem
> > > > 0x0000000000000000-0x0000000000001fff] usable
> > > > [    0.000000] reserve setup_data: [mem
> > > > 0x0000000000002000-0x000000000000212b] usable
> > > > [    0.000000] reserve setup_data: [mem
> > > > 0x000000000000212c-0x000000000009efff] usable
> > > > [    0.000000] DMI not present or invalid.
> > > > [    0.000000] Hypervisor detected: Jailhouse
> > > > [    0.000000] tsc: Detected 3393.624 MHz processor
> > > > [    0.000019] .text .data .bss are not marked as E820_TYPE_RAM!
> > > > [    0.005751] last_pfn =3D 0x3630 max_arch_pfn =3D 0x400000000
> > > > [    0.011039] x86/PAT: Configuration [0-7]: WB  WC  UC- UC  WB
> > >  WP  UC- WT
> > > > Memory KASLR using RDRAND RDTSC...
> > > > [    0.032374] Using GB pages for direct mapping
> > > > [    0.036743] Kernel panic - not syncing: alloc_low_pages: can
> > not
> > > > alloc memory
> > > > [    0.043712] CPU: 0 PID: 0 Comm: swapper Not tainted
> > 6.2.0-rc3 #2
> > > > [    0.049702] Call Trace:
> > > > [    0.052134]  <TASK>
> > > > [    0.054219]  dump_stack_lvl+0x3a/0x58
> > > > [    0.057865]  dump_stack+0x10/0x18
> > > > [    0.061162]  panic+0x15c/0x308
> > > > [    0.064205]  alloc_low_pages+0x7d/0x1c0
> > > > [    0.068024]  phys_pmd_init+0x1f2/0x2eb
> > > > [    0.071758]  phys_pud_init+0x114/0x2d5
> > > > [    0.075493]  phys_p4d_init+0x4c/0x269
> > > > [    0.079135]  ?
> > > __raw_callee_save___native_queued_spin_unlock+0x15/0x30
> > > > [    0.085649]  __kernel_physical_mapping_init+0x11e/0x29a
> > > > [    0.090859]  kernel_physical_mapping_init+0xf/0x20
> > > > [    0.095631]  init_memory_mapping+0x273/0x410
> > > > [    0.099890]  init_range_memory_mapping+0xec/0x150
> > > > [    0.104574]  init_mem_mapping+0x268/0x2e7
> > > > [    0.108567]  setup_arch+0x839/0xdcf
> > > > [    0.112039]  ? lockdown_lsm_init+0x21/0x2f
> > > > [    0.116120]  start_kernel+0x6e/0x997
> > > > [    0.119680]  x86_64_start_reservations+0x24/0x2c
> > > > [    0.124281]  x86_64_start_kernel+0xec/0xff
> > > > [    0.128360]  secondary_startup_64_no_verify+0xe5/0xeb
> > > > [    0.133400]  </TASK>
> > > > [    0.135570] ---[ end Kernel panic - not syncing:
> > > alloc_low_pages: can
> > > > not alloc memory ]---
> > > > Closing cell "linux-1"
> > > > Page pool usage after cell destruction: mem 254/32211, remap
> > > 16392/131072
> > > > CPU 4 received SIPI, vector 96
> > > > CPU 5 received SIPI, vector 96
> > > >
> > > > This happens both with and without the initrd in the command,
> > > i'll try
> > > > to solve this and see what happens.
> > > >
> > > > By the way, is it possible that the new cell starts transmitting
> > > with a
> > > > baud rate different than the root cell? Without specifying the
> > > speed in
> > > > the command above the serial console stopped receiving anything
> > > until I
> > > > disabled and re-enabled the hypervisor. If not I may have
> > something
> > > > wrong on my end to solve
> > > >
> > > > Il giorno marted=C3=AC 9 gennaio 2024 alle 17:37:48 UTC+1 Michele
> > > Pescap=C3=A8 ha
> > > > scritto:
> > > >
> > > > I stand corrected, the freeze happens when i do not set
> > > > JAILHOUSE_CELL_PASSIVE_COMMREG in the inmate
> > > >
> > > > Il giorno marted=C3=AC 9 gennaio 2024 alle 17:26:57 UTC+1 Michele
> > Pescap=C3=A8
> > > > ha scritto:
> > > >
> > > > Hi, thank you for replying.
> > > >
> > > > ttyS0 is indeed whitelisted in the inmate and the number of
> > > > pio_regions is set accordingly.
> > > >
> > > > As for the crash after disable/shutdown, I think it was related
> > > > to the PCI device, after commenting that and the corresponding
> > > > regions out I no longer get that freeze. CONFIG_JAILHOUSE_GUEST
> > and
> > > > CONFIG_JAILHOUSE_DBCON were already set in the kernel
> > > > configuration I'm using for the non root linux; still, I
> > > > recompiled it just in case.
> > > >
> > > > Michele
> > > >
> > > > Il giorno marted=C3=AC 9 gennaio 2024 alle 14:14:33 UTC+1 Ralf
> > > > Ramsauer ha scritto:
> > > >
> > > > Hi,
> > > >
> > > > On 08/01/2024 23:56, Michele Pescap=C3=A8 wrote:
> > > > > Hi all,
> > > > >
> > > > > I have an AMD Ryzen 2600 on a b450 motherboard. My goal
> > > > is to run two
> > > > > non root linux cells, however, as of right now, I'm not
> > > > able to start
> > > > > any non root linux cells.
> > > > > First of all I don't receive an output from the cell (I
> > > > do get output
> > > > > from the apic-demo though), therefore I don't really know
> > > > if they're
> > > > > even crashing or not; this is the output I get from the
> > > > hypervisor after
> > > > > enabling the root cell and issuing the following command:
> > > > >
> > > > > sudo jailhouse cell linux configs/x86/linux_guest1.cell
> > > > > ../buildroot-2023.11/output/images/bzImage -i
> > > > > ../buildroot-2023.11/output/images/rootfs.cpio
> > > >
> > > > for the first few tries, simply don't load a ramdisk. Try to
> > > > get the
> > > > kernel booting. It will crash with "cannot mount rootfs". If
> > > > we get so
> > > > far, then you can continue specifying the ramdisk. But
> > > > first, we have to
> > > > get that far.
> > > >
> > > > >
> > > > > Adding PCI device ff:1f.7 to cell "linux-x86-demo"
> > > > > Created cell "linux-x86-demo"
> > > > > Page pool usage after cell creation: mem 336/32211, remap
> > > > 16392/131072
> > > > > Cell "linux-x86-demo" can be loaded
> > > > > CPU 4 received SIPI, vector 100
> > > > > CPU 3 received SIPI, vector 100
> > > > > Started cell "linux-x86-demo"
> > > > >
> > > > > After this the cell appears to be running in cell list,
> > > > however I can't
> > > > > seem to get any output to confirm that (I even set
> > > > > JAILHOUSE_CELL_VIRTUAL_CONSOLE_ACTIVE, but nothing
> > > > appears on the vrtual
> > > > > console accessed via "jailhouse console -f"). I also
> > > > tried adding -c
> > > > > "console=3DttyS0,115200".
> > > >
> > > > ttyS0, i.e., x86 Port 0x3f8 is whitelisted in the cell
> > > > configuration?
> > > > Actually, your cmdline is correct.
> > > >
> > > > > At this point if I try to disable/shutdown the cell, the
> > > > system freezes
> > > > > requiring a hard reset.
> > > >
> > > > Okay, is the guest Linux compiled with Jailhouse guest
> > > > support? Please
> > > > ensure that non-root Linux is compiled with
> > > > CONFIG_JAILHOUSE_GUEST and
> > > > CONFIG_JAILHOUSE_DBCON. The first one is mandatory for x86
> > > > Linux guests.
> > > >
> > > > >
> > > > > Also, there seems to be a mismatch between the PCI bdf
> > > > value in the log
> > > > > above and the one in the cell's configuration. In both
> > > > root and non root
> > > > > cells i set .bdf =3D (0x0f << 3) for the IVSHMEM net device
> > > > and the Root
> > > > > cell correctly reports that ("Adding virtual PCI device
> > > > 00:0f.0 to cell
> > > > > "RootCell"").
> > > >
> > > > First things first. Let's try to get Linux kicked off before
> > > > diving into
> > > > PCI. Comment it out for the moment, let's do that later.
> > > >
> > > > Ralf
> > > >
> > > > >
> > > > > If I understood correctly, once the cell works properly I
> > > > won't need to
> > > > > set the console anymore as I can assign an ip (-c "ip
> > > > x.x.x.x" in the
> > > > > cell linux command) and ssh to the cell, right?
> > > > >
> > > > > I attach the root and non root cells' configurations in
> > > > case they're
> > > > > needed. I can provide both the root and non root cell's
> > > > kernel .conf and
> > > > > the buildroot configuration I used if needed.
> > > > >
> > > > > Thank you for your time,
> > > > > Michele
> > > > >
> > > > > --
> > > > > You received this message because you are subscribed to
> > > > the Google
> > > > > Groups "Jailhouse" group.
> > > > > To unsubscribe from this group and stop receiving emails
> > > > from it, send
> > > > > an email to jailhouse-de...@googlegroups.com
> > > > > <mailto:jailhouse-de...@googlegroups.com>.
> > > > > To view this discussion on the web visit
> > > > >
> > > >
> > >
> >=20
> https://groups.google.com/d/msgid/jailhouse-dev/824bacc4-b7ae-47c9-878e-7=
203214b4fc3n%40googlegroups.com=20
> <
> https://groups.google.com/d/msgid/jailhouse-dev/824bacc4-b7ae-47c9-878e-7=
203214b4fc3n%40googlegroups.com>=20
> <
> https://groups.google.com/d/msgid/jailhouse-dev/824bacc4-b7ae-47c9-878e-7=
203214b4fc3n%40googlegroups.com=20
> <
> https://groups.google.com/d/msgid/jailhouse-dev/824bacc4-b7ae-47c9-878e-7=
203214b4fc3n%40googlegroups.com>>=20
> <
> https://groups.google.com/d/msgid/jailhouse-dev/824bacc4-b7ae-47c9-878e-7=
203214b4fc3n%40googlegroups.com=20
> <
> https://groups.google.com/d/msgid/jailhouse-dev/824bacc4-b7ae-47c9-878e-7=
203214b4fc3n%40googlegroups.com>=20
> <
> https://groups.google.com/d/msgid/jailhouse-dev/824bacc4-b7ae-47c9-878e-7=
203214b4fc3n%40googlegroups.com=20
> <
> https://groups.google.com/d/msgid/jailhouse-dev/824bacc4-b7ae-47c9-878e-7=
203214b4fc3n%40googlegroups.com>>>=20
> <
> https://groups.google.com/d/msgid/jailhouse-dev/824bacc4-b7ae-47c9-878e-7=
203214b4fc3n%40googlegroups.com?utm_medium=3Demail&utm_source=3Dfooter=20
> <
> https://groups.google.com/d/msgid/jailhouse-dev/824bacc4-b7ae-47c9-878e-7=
203214b4fc3n%40googlegroups.com?utm_medium=3Demail&utm_source=3Dfooter>=20
> <
> https://groups.google.com/d/msgid/jailhouse-dev/824bacc4-b7ae-47c9-878e-7=
203214b4fc3n%40googlegroups.com?utm_medium=3Demail&utm_source=3Dfooter=20
> <
> https://groups.google.com/d/msgid/jailhouse-dev/824bacc4-b7ae-47c9-878e-7=
203214b4fc3n%40googlegroups.com?utm_medium=3Demail&utm_source=3Dfooter>>=20
> <
> https://groups.google.com/d/msgid/jailhouse-dev/824bacc4-b7ae-47c9-878e-7=
203214b4fc3n%40googlegroups.com?utm_medium=3Demail&utm_source=3Dfooter=20
> <
> https://groups.google.com/d/msgid/jailhouse-dev/824bacc4-b7ae-47c9-878e-7=
203214b4fc3n%40googlegroups.com?utm_medium=3Demail&utm_source=3Dfooter>=20
> <
> https://groups.google.com/d/msgid/jailhouse-dev/824bacc4-b7ae-47c9-878e-7=
203214b4fc3n%40googlegroups.com?utm_medium=3Demail&utm_source=3Dfooter=20
> <
> https://groups.google.com/d/msgid/jailhouse-dev/824bacc4-b7ae-47c9-878e-7=
203214b4fc3n%40googlegroups.com?utm_medium=3Demail&utm_source=3Dfooter
> >>>>.
> > > >
> > > > --
> > > > You received this message because you are subscribed to the Google
> > > > Groups "Jailhouse" group.
> > > > To unsubscribe from this group and stop receiving emails from it,
> > > send
> > > > an email to jailhouse-de...@googlegroups.com
> > > > <mailto:jailhouse-de...@googlegroups.com>.
> > > > To view this discussion on the web visit
> > > >
> > >
> >=20
> https://groups.google.com/d/msgid/jailhouse-dev/2202bf30-5b2c-45ea-9f9f-6=
99daf338843n%40googlegroups.com=20
> <
> https://groups.google.com/d/msgid/jailhouse-dev/2202bf30-5b2c-45ea-9f9f-6=
99daf338843n%40googlegroups.com>=20
> <
> https://groups.google.com/d/msgid/jailhouse-dev/2202bf30-5b2c-45ea-9f9f-6=
99daf338843n%40googlegroups.com=20
> <
> https://groups.google.com/d/msgid/jailhouse-dev/2202bf30-5b2c-45ea-9f9f-6=
99daf338843n%40googlegroups.com>>=20
> <
> https://groups.google.com/d/msgid/jailhouse-dev/2202bf30-5b2c-45ea-9f9f-6=
99daf338843n%40googlegroups.com?utm_medium=3Demail&utm_source=3Dfooter=20
> <
> https://groups.google.com/d/msgid/jailhouse-dev/2202bf30-5b2c-45ea-9f9f-6=
99daf338843n%40googlegroups.com?utm_medium=3Demail&utm_source=3Dfooter>=20
> <
> https://groups.google.com/d/msgid/jailhouse-dev/2202bf30-5b2c-45ea-9f9f-6=
99daf338843n%40googlegroups.com?utm_medium=3Demail&utm_source=3Dfooter=20
> <
> https://groups.google.com/d/msgid/jailhouse-dev/2202bf30-5b2c-45ea-9f9f-6=
99daf338843n%40googlegroups.com?utm_medium=3Demail&utm_source=3Dfooter
> >>>.
> > >
> > > --
> > > You received this message because you are subscribed to the Google
> > > Groups "Jailhouse" group.
> > > To unsubscribe from this group and stop receiving emails from it,
> > send
> > > an email to jailhouse-de...@googlegroups.com
> > > <mailto:jailhouse-de...@googlegroups.com>.
> > > To view this discussion on the web visit
> > >
> >=20
> https://groups.google.com/d/msgid/jailhouse-dev/9a021e3f-caca-4ebe-9351-b=
e2c3e999446n%40googlegroups.com=20
> <
> https://groups.google.com/d/msgid/jailhouse-dev/9a021e3f-caca-4ebe-9351-b=
e2c3e999446n%40googlegroups.com>=20
> <
> https://groups.google.com/d/msgid/jailhouse-dev/9a021e3f-caca-4ebe-9351-b=
e2c3e999446n%40googlegroups.com?utm_medium=3Demail&utm_source=3Dfooter=20
> <
> https://groups.google.com/d/msgid/jailhouse-dev/9a021e3f-caca-4ebe-9351-b=
e2c3e999446n%40googlegroups.com?utm_medium=3Demail&utm_source=3Dfooter
> >>.
> >=20
> > --=20
> > You received this message because you are subscribed to the Google=20
> > Groups "Jailhouse" group.
> > To unsubscribe from this group and stop receiving emails from it, send=
=20
> > an email to jailhouse-de...@googlegroups.com=20
> > <mailto:jailhouse-de...@googlegroups.com>.
> > To view this discussion on the web visit=20
> >=20
> https://groups.google.com/d/msgid/jailhouse-dev/23a9c30e-5507-449e-9589-6=
97904becac4n%40googlegroups.com=20
> <
> https://groups.google.com/d/msgid/jailhouse-dev/23a9c30e-5507-449e-9589-6=
97904becac4n%40googlegroups.com?utm_medium=3Demail&utm_source=3Dfooter
> >.
>

--=20
You received this message because you are subscribed to the Google Groups "=
Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/=
jailhouse-dev/bbd32aa2-053e-40a2-b4d5-2326238d0793n%40googlegroups.com.

------=_Part_20639_468047453.1705064841332
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi,<br /><br />The config is the correct one. Nothing from dmesg except<br =
/><br />[ 8254.074890] smpboot: CPU 8 is now offline<br />[ 8254.206652] sm=
pboot: CPU 9 is now offline<br />[ 8254.254775] Created Jailhouse cell "lin=
ux-2"<br /><br />The hypervisor only reports:<br /><br />CPU 9 received SIP=
I, vector 96 =C2=A0 =C2=A0 =C2=A0 =C2=A0 (this is the last line of the outp=
ut from the previous attempt)<br />Created cell "linux-2"=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0 (first line after issuing the cell linux command)<=
br />Page pool usage after cell creation: mem 272/32211, remap 16392/131072=
<br />Cell "linux-2" can be loaded<br /><br /><br />I tried using the -w fl=
ag, this is what it said when using :<br /><br />jailhouse cell create conf=
igs/x86/linux_guest2.cell<br />jailhouse cell load linux-2 linux-loader.bin=
 -a 0x0 ../buildroot-2023.11/output/images/bzImage -a 0xffbe00 parameters -=
a 0x1000<br />jailhouse cell start linux-2<br /><br />I take it the kernel =
is loaded at 0xffbe00 which is right at the edge of the low ram region. In =
fact after issuing the cell load command and adjusting the path for the loa=
der I get JAILHOUSE_CELL_LOAD: Invalid argument.<br />Nothing is said from =
dmesg, the hypervisor only says "Cell "linux-2" can be loaded". <br /><br /=
><div>At this point I tried pointing the address for the kernel in the cell=
 load command to the high ram region by giving -a 0x42300000 as the address=
. <br /><br />I get the following output when starting the cell:<br /><br /=
>Created cell "linux-2"<br />Page pool usage after cell creation: mem 270/3=
2211, remap 16392/131072<br />Cell "linux-2" can be loaded <br />Started ce=
ll "linux-2"<br />CPU 9 received SIPI, vector 100<br />CPU 8 received SIPI,=
 vector 100<br />FATAL: unable to get MMIO instruction<br />FATAL: Invalid =
MMIO/RAM read, addr: 0x0000000001000000 size: 0<br />RIP: 0x000000000100020=
0 RSP: 0x0000000000009fe8 FLAGS: 46<br />RAX: 0x0000000001000200 RBX: 0x000=
000000000427d RCX: 0x00000000000000ff<br />RDX: 0x0000000000000000 RSI: 0x0=
000000000001000 RDI: 0x0000000000000000<br />CS: 10 BASE: 0x000000000000000=
0 AR-BYTES: 29b EFER.LMA 1<br />CR0: 0x0000000080010011 CR3: 0x000000000000=
5000 CR4: 0x0000000000040220<br />EFER: 0x0000000000001500<br />Parking CPU=
 9 (Cell: "linux-2")<br />FATAL: Unexpected #VMEXIT, exitcode 7f, exitinfo1=
 0x0000000000000000 exitinfo2 0x0000000000000000<br />RIP: 0x00000000000000=
0f RSP: 0x0000000000009fe8 FLAGS: 2<br />RAX: 0x0000000001000201 RBX: 0x000=
000000000427d RCX: 0x00000000000000ff<br />RDX: 0x0000000000000000 RSI: 0x0=
000000000001000 RDI: 0x0000000000000000<br />CS: 10 BASE: 0x000000000000000=
0 AR-BYTES: 29b EFER.LMA 1<br />CR0: 0x0000000001000201 CR3: 0x000000000000=
5000 CR4: 0x0000000000040220<br />EFER: 0x0000000000001500<br /><br />And t=
hen it continues to display the vmexit error without stopping if the cell i=
sn't destroyed. I can avoid this by increasing the size of the low ram regi=
on to 0x00200000.<br /><br />That allows me to proceed and starting the cel=
l with cell start, the hypervisor output being:<br /><br /></div><div>Creat=
ed cell "linux-2"<br />Page pool usage after cell creation: mem 272/32211, =
remap 16392/131072<br />Cell "linux-2" can be loaded<br />Started cell "lin=
ux-2"<br />CPU 9 received SIPI, vector 100<br />CPU 8 received SIPI, vector=
 100<br /><br /></div>but without any other sign. <br /><br />I still need =
to decrease the kernel size, i only reduced it by 1MB. <br />I'll attach ag=
ain the non root config, however it isn't much different than the other I s=
ent, i only fixed the weird alignment and changed a bit the start addresses=
 of the comm region and the high ram region.<br /><br />Thanks, <br />Miche=
le<br /><br /><div class=3D"gmail_quote"><div dir=3D"auto" class=3D"gmail_a=
ttr">Il giorno gioved=C3=AC 11 gennaio 2024 alle 21:55:47 UTC+1 Ralf Ramsau=
er ha scritto:<br/></div><blockquote class=3D"gmail_quote" style=3D"margin:=
 0 0 0 0.8ex; border-left: 1px solid rgb(204, 204, 204); padding-left: 1ex;=
">Hi,
<br>
<br>On 11/01/2024 13:57, Michele Pescap=C3=A8 wrote:
<br>&gt; Hi,
<br>&gt;=20
<br>&gt; after changing the virt_start to match the phys_start for that mem=
ory=20
<br>&gt; region I got an invalid argument error when starting the cell
<br>&gt;=20
<br>&gt; Traceback (most recent call last):
<br>&gt;  =C2=A0 File &quot;/usr/local/libexec/jailhouse/jailhouse-cell-lin=
ux&quot;, line 739,=20
<br>&gt; in &lt;module&gt;
<br>&gt;  =C2=A0 =C2=A0 cell.load(arch.kernel_image, arch.kernel_address())
<br>&gt;  =C2=A0 File &quot;/usr/local/lib/python3.10/dist-packages/pyjailh=
ouse/cell.py&quot;,=20
<br>&gt; line 44, in load
<br>&gt;  =C2=A0 =C2=A0 fcntl.ioctl(<a href=3D"http://self.dev" target=3D"_=
blank" rel=3D"nofollow" data-saferedirecturl=3D"https://www.google.com/url?=
hl=3Dit&amp;q=3Dhttp://self.dev&amp;source=3Dgmail&amp;ust=3D17051481819210=
00&amp;usg=3DAOvVaw2rzpkeUX4Rf748PnCg05kS">self.dev</a>, self.JAILHOUSE_CEL=
L_LOAD, load)
<br>&gt; OSError: [Errno 22] Invalid argument
<br>
<br>Are you sure that you created the cell with the correct config? What=20
<br>does dmesg say? Any output on the hypervisor console when this error=20
<br>happens?
<br>
<br>&gt;=20
<br>&gt; Printing the arch.kernel_address() returned 16760320 (should be=20
<br>&gt; 0xffbe00), so I thought that the bzImage was too big for the low r=
am region.
<br>
<br>jailhouse-cell-linux won&#39;t load the bzImage to the low ram region. =
You=20
<br>can use the -w option to dump a file that prints the commands that=20
<br>jailhouse-cell-linux would invoke.
<br>
<br>&gt; I increased the size to .size =3D 0x04000000 and shifted the virt =
and=20
<br>&gt; phys_start of the other two regions to match the change (virt_star=
t =3D=20
<br>&gt; 0x04000000 for the comm region and virt=3Dphys_start =3D 0x4600000=
0 for the=20
<br>&gt; third region) .
<br>&gt; No issues were reported by config check but after starting the cel=
l i=20
<br>&gt; got no output even using earlyprintk.
<br>&gt;=20
<br>&gt; I also tried using an initrd but I got a similar issue, invalid ar=
gument=20
<br>&gt; when starting the cell, this time it was the arch.ramdisk_address(=
)=20
<br>&gt; which was 107327488 (0x665b000).
<br>&gt; So i tried increasing even more the size of the first region to si=
ze =3D=20
<br>&gt; 0x0a000000 (comm region now starts at .virt_start =3D 0x0a000000, =
and the=20
<br>&gt; third region starts at=C2=A0 virt=3D.phys_start =3D 0x4c000000 wit=
h size =3D=20
<br>&gt; 0x6000000).
<br>&gt; Again, no config check issues so I started it but no output again,=
 the=20
<br>&gt; hypervisor only reports:
<br>&gt;=20
<br>&gt; Created cell &quot;linux-1&quot;
<br>&gt; Page pool usage after cell creation: mem 268/32211, remap 16392/13=
1072
<br>&gt; Cell &quot;linux-1&quot; can be loaded
<br>&gt; CPU 5 received SIPI, vector 100
<br>&gt; CPU 4 received SIPI, vector 100
<br>&gt; Started cell &quot;linux-1&quot;
<br>&gt;=20
<br>&gt; My bzImage is 12,9MB and the rootfs.cpio is 23.1MB if that matters=
.
<br>
<br>Try starting without the ramdisk. We can later take care of the ramdisk=
,=20
<br>but first the kernel needs to start.
<br>
<br>For a compressed image, your kernel is really huge. I bet you can boil=
=20
<br>it down to a few MBs. With a kernel of that size, you might want to pla=
y=20
<br>around with jailhouse-cell-linux -k.
<br>
<br>   Ralf
<br>
<br>&gt;=20
<br>&gt; Thanks,
<br>&gt; Michele
<br>&gt;=20
<br>&gt;=20
<br>&gt;=20
<br>&gt; Il giorno mercoled=C3=AC 10 gennaio 2024 alle 20:58:03 UTC+1 Ralf =
Ramsauer ha=20
<br>&gt; scritto:
<br>&gt;=20
<br>&gt;     Hi Michele,
<br>&gt;=20
<br>&gt;     On 10/01/2024 17:40, Michele Pescap=C3=A8 wrote:
<br>&gt;      &gt; Hi,
<br>&gt;      &gt;
<br>&gt;      &gt; I&#39;m attaching the configurations I&#39;m currently u=
sing. I&#39;ll try
<br>&gt;     disabling
<br>&gt;      &gt; KASLR.
<br>&gt;=20
<br>&gt;     [=E2=80=A6]
<br>&gt;     /* high RAM */
<br>&gt;     {
<br>&gt;     .phys_start =3D 0x42100000,
<br>&gt;     .virt_start =3D 0x00101000,
<br>&gt;     .size =3D 0x8000000,
<br>&gt;     [=E2=80=A6]
<br>&gt;=20
<br>&gt;     Alignment of your high ram is odd. Virt &amp; Phys should have=
 the same
<br>&gt;     alignment. Try to use .phys=3D.virt=3D0x42100000, I guess that=
 should help.
<br>&gt;=20
<br>&gt;     Thanks,
<br>&gt;     Ralf
<br>&gt;=20
<br>&gt;=20
<br>&gt;      &gt;
<br>&gt;      &gt; Thank you for your help,
<br>&gt;      &gt; Michele
<br>&gt;      &gt;
<br>&gt;      &gt; Il giorno mercoled=C3=AC 10 gennaio 2024 alle 17:24:35 U=
TC+1 Ralf
<br>&gt;     Ramsauer ha
<br>&gt;      &gt; scritto:
<br>&gt;      &gt;
<br>&gt;      &gt; Hi,
<br>&gt;      &gt;
<br>&gt;      &gt; On 09/01/2024 19:58, Michele Pescap=C3=A8 wrote:
<br>&gt;      &gt; &gt; Hi,
<br>&gt;      &gt; &gt;
<br>&gt;      &gt; &gt; Just an update, I was able to get the following out=
put by
<br>&gt;     adding -c
<br>&gt;      &gt; &gt; &quot;earlyprintk=3DttyS0,115200&quot; to the comma=
nd line:
<br>&gt;      &gt; &gt;
<br>&gt;      &gt; &gt; Started cell &quot;linux-1&quot;
<br>&gt;      &gt; &gt;
<br>&gt;      &gt; &gt;
<br>&gt;      &gt; &gt; Invalid physical address chosen!
<br>&gt;      &gt;
<br>&gt;      &gt; could you please share your system and non-root cell con=
figuration?
<br>&gt;      &gt;
<br>&gt;      &gt; It smells like you have an overlap with the communicatio=
n region.
<br>&gt;     You
<br>&gt;      &gt; can check that with tools/jailhouse-config-check.
<br>&gt;      &gt;
<br>&gt;      &gt; &gt;
<br>&gt;      &gt; &gt;
<br>&gt;      &gt; &gt;
<br>&gt;      &gt; &gt;
<br>&gt;      &gt; &gt; Physical KASLR disabled: no suitable memory region!
<br>&gt;      &gt;
<br>&gt;      &gt; Disable KASLR in your kernel for the moment. You don&#39=
;t need it while
<br>&gt;      &gt; ramping up your system.
<br>&gt;      &gt;
<br>&gt;      &gt; Thanks,
<br>&gt;      &gt; Ralf
<br>&gt;      &gt;
<br>&gt;      &gt; &gt;
<br>&gt;      &gt; &gt; [ =C2=A0 =C2=A00.000000] Linux version 6.2.0-rc3 (r=
oot@mp-LINUX-DESKTOP)
<br>&gt;      &gt; &gt; (x86_64-buildroot-linux-gnu-gcc.br_real (Buildroot =
2023.11)
<br>&gt;      &gt; 12.3.0, GNU
<br>&gt;      &gt; &gt; ld (GNU Binutils) 2.40) #2 SMP PREEMPT_DYNAMIC Sun =
Jan =C2=A07
<br>&gt;      &gt; 18:35:23 CET 2024
<br>&gt;      &gt; &gt; [ =C2=A0 =C2=A00.000000] Command line: earlyprintk=
=3DttyS0,115200
<br>&gt;      &gt; &gt; [ =C2=A0 =C2=A00.000000] KERNEL supported cpus:
<br>&gt;      &gt; &gt; [ =C2=A0 =C2=A00.000000] =C2=A0 Intel GenuineIntel
<br>&gt;      &gt; &gt; [ =C2=A0 =C2=A00.000000] =C2=A0 AMD AuthenticAMD
<br>&gt;      &gt; &gt; [ =C2=A0 =C2=A00.000000] x86/fpu: Supporting XSAVE =
feature 0x001: &#39;x87
<br>&gt;      &gt; floating
<br>&gt;      &gt; &gt; point registers&#39;
<br>&gt;      &gt; &gt; [ =C2=A0 =C2=A00.000000] x86/fpu: Supporting XSAVE =
feature 0x002: &#39;SSE
<br>&gt;      &gt; registers&#39;
<br>&gt;      &gt; &gt; [ =C2=A0 =C2=A00.000000] x86/fpu: Supporting XSAVE =
feature 0x004: &#39;AVX
<br>&gt;      &gt; registers&#39;
<br>&gt;      &gt; &gt; [ =C2=A0 =C2=A00.000000] x86/fpu: xstate_offset[2]:=
 =C2=A0576, xstate_sizes[2]:
<br>&gt;      &gt; =C2=A0256
<br>&gt;      &gt; &gt; [ =C2=A0 =C2=A00.000000] x86/fpu: Enabled xstate fe=
atures 0x7, context size
<br>&gt;      &gt; is 832
<br>&gt;      &gt; &gt; bytes, using &#39;compacted&#39; format.
<br>&gt;      &gt; &gt; [ =C2=A0 =C2=A00.000000] signal: max sigframe size:=
 1776
<br>&gt;      &gt; &gt; [ =C2=A0 =C2=A00.000000] BIOS-provided physical RAM=
 map:
<br>&gt;      &gt; &gt; [ =C2=A0 =C2=A00.000000] BIOS-e801: [mem
<br>&gt;      &gt; 0x0000000000000000-0x000000000009efff] usable
<br>&gt;      &gt; &gt; [ =C2=A0 =C2=A00.000000] printk: bootconsole [early=
ser0] enabled
<br>&gt;      &gt; &gt; [ =C2=A0 =C2=A00.000000] NX (Execute Disable) prote=
ction: active
<br>&gt;      &gt; &gt; [ =C2=A0 =C2=A00.000000] extended physical RAM map:
<br>&gt;      &gt; &gt; [ =C2=A0 =C2=A00.000000] reserve setup_data: [mem
<br>&gt;      &gt; &gt; 0x0000000000000000-0x0000000000001fff] usable
<br>&gt;      &gt; &gt; [ =C2=A0 =C2=A00.000000] reserve setup_data: [mem
<br>&gt;      &gt; &gt; 0x0000000000002000-0x000000000000212b] usable
<br>&gt;      &gt; &gt; [ =C2=A0 =C2=A00.000000] reserve setup_data: [mem
<br>&gt;      &gt; &gt; 0x000000000000212c-0x000000000009efff] usable
<br>&gt;      &gt; &gt; [ =C2=A0 =C2=A00.000000] DMI not present or invalid=
.
<br>&gt;      &gt; &gt; [ =C2=A0 =C2=A00.000000] Hypervisor detected: Jailh=
ouse
<br>&gt;      &gt; &gt; [ =C2=A0 =C2=A00.000000] tsc: Detected 3393.624 MHz=
 processor
<br>&gt;      &gt; &gt; [ =C2=A0 =C2=A00.000019] .text .data .bss are not m=
arked as E820_TYPE_RAM!
<br>&gt;      &gt; &gt; [ =C2=A0 =C2=A00.005751] last_pfn =3D 0x3630 max_ar=
ch_pfn =3D 0x400000000
<br>&gt;      &gt; &gt; [ =C2=A0 =C2=A00.011039] x86/PAT: Configuration [0-=
7]: WB =C2=A0WC =C2=A0UC- UC =C2=A0WB
<br>&gt;      &gt; =C2=A0WP =C2=A0UC- WT
<br>&gt;      &gt; &gt; Memory KASLR using RDRAND RDTSC...
<br>&gt;      &gt; &gt; [ =C2=A0 =C2=A00.032374] Using GB pages for direct =
mapping
<br>&gt;      &gt; &gt; [ =C2=A0 =C2=A00.036743] Kernel panic - not syncing=
: alloc_low_pages: can
<br>&gt;     not
<br>&gt;      &gt; &gt; alloc memory
<br>&gt;      &gt; &gt; [ =C2=A0 =C2=A00.043712] CPU: 0 PID: 0 Comm: swappe=
r Not tainted
<br>&gt;     6.2.0-rc3 #2
<br>&gt;      &gt; &gt; [ =C2=A0 =C2=A00.049702] Call Trace:
<br>&gt;      &gt; &gt; [ =C2=A0 =C2=A00.052134] =C2=A0&lt;TASK&gt;
<br>&gt;      &gt; &gt; [ =C2=A0 =C2=A00.054219] =C2=A0dump_stack_lvl+0x3a/=
0x58
<br>&gt;      &gt; &gt; [ =C2=A0 =C2=A00.057865] =C2=A0dump_stack+0x10/0x18
<br>&gt;      &gt; &gt; [ =C2=A0 =C2=A00.061162] =C2=A0panic+0x15c/0x308
<br>&gt;      &gt; &gt; [ =C2=A0 =C2=A00.064205] =C2=A0alloc_low_pages+0x7d=
/0x1c0
<br>&gt;      &gt; &gt; [ =C2=A0 =C2=A00.068024] =C2=A0phys_pmd_init+0x1f2/=
0x2eb
<br>&gt;      &gt; &gt; [ =C2=A0 =C2=A00.071758] =C2=A0phys_pud_init+0x114/=
0x2d5
<br>&gt;      &gt; &gt; [ =C2=A0 =C2=A00.075493] =C2=A0phys_p4d_init+0x4c/0=
x269
<br>&gt;      &gt; &gt; [ =C2=A0 =C2=A00.079135] =C2=A0?
<br>&gt;      &gt; __raw_callee_save___native_queued_spin_unlock+0x15/0x30
<br>&gt;      &gt; &gt; [ =C2=A0 =C2=A00.085649] =C2=A0__kernel_physical_ma=
pping_init+0x11e/0x29a
<br>&gt;      &gt; &gt; [ =C2=A0 =C2=A00.090859] =C2=A0kernel_physical_mapp=
ing_init+0xf/0x20
<br>&gt;      &gt; &gt; [ =C2=A0 =C2=A00.095631] =C2=A0init_memory_mapping+=
0x273/0x410
<br>&gt;      &gt; &gt; [ =C2=A0 =C2=A00.099890] =C2=A0init_range_memory_ma=
pping+0xec/0x150
<br>&gt;      &gt; &gt; [ =C2=A0 =C2=A00.104574] =C2=A0init_mem_mapping+0x2=
68/0x2e7
<br>&gt;      &gt; &gt; [ =C2=A0 =C2=A00.108567] =C2=A0setup_arch+0x839/0xd=
cf
<br>&gt;      &gt; &gt; [ =C2=A0 =C2=A00.112039] =C2=A0? lockdown_lsm_init+=
0x21/0x2f
<br>&gt;      &gt; &gt; [ =C2=A0 =C2=A00.116120] =C2=A0start_kernel+0x6e/0x=
997
<br>&gt;      &gt; &gt; [ =C2=A0 =C2=A00.119680] =C2=A0x86_64_start_reserva=
tions+0x24/0x2c
<br>&gt;      &gt; &gt; [ =C2=A0 =C2=A00.124281] =C2=A0x86_64_start_kernel+=
0xec/0xff
<br>&gt;      &gt; &gt; [ =C2=A0 =C2=A00.128360] =C2=A0secondary_startup_64=
_no_verify+0xe5/0xeb
<br>&gt;      &gt; &gt; [ =C2=A0 =C2=A00.133400] =C2=A0&lt;/TASK&gt;
<br>&gt;      &gt; &gt; [ =C2=A0 =C2=A00.135570] ---[ end Kernel panic - no=
t syncing:
<br>&gt;      &gt; alloc_low_pages: can
<br>&gt;      &gt; &gt; not alloc memory ]---
<br>&gt;      &gt; &gt; Closing cell &quot;linux-1&quot;
<br>&gt;      &gt; &gt; Page pool usage after cell destruction: mem 254/322=
11, remap
<br>&gt;      &gt; 16392/131072
<br>&gt;      &gt; &gt; CPU 4 received SIPI, vector 96
<br>&gt;      &gt; &gt; CPU 5 received SIPI, vector 96
<br>&gt;      &gt; &gt;
<br>&gt;      &gt; &gt; This happens both with and without the initrd in th=
e command,
<br>&gt;      &gt; i&#39;ll try
<br>&gt;      &gt; &gt; to solve this and see what happens.
<br>&gt;      &gt; &gt;
<br>&gt;      &gt; &gt; By the way, is it possible that the new cell starts=
 transmitting
<br>&gt;      &gt; with a
<br>&gt;      &gt; &gt; baud rate different than the root cell? Without spe=
cifying the
<br>&gt;      &gt; speed in
<br>&gt;      &gt; &gt; the command above the serial console stopped receiv=
ing anything
<br>&gt;      &gt; until I
<br>&gt;      &gt; &gt; disabled and re-enabled the hypervisor. If not I ma=
y have
<br>&gt;     something
<br>&gt;      &gt; &gt; wrong on my end to solve
<br>&gt;      &gt; &gt;
<br>&gt;      &gt; &gt; Il giorno marted=C3=AC 9 gennaio 2024 alle 17:37:48=
 UTC+1 Michele
<br>&gt;      &gt; Pescap=C3=A8 ha
<br>&gt;      &gt; &gt; scritto:
<br>&gt;      &gt; &gt;
<br>&gt;      &gt; &gt; I stand corrected, the freeze happens when i do not=
 set
<br>&gt;      &gt; &gt; JAILHOUSE_CELL_PASSIVE_COMMREG in the inmate
<br>&gt;      &gt; &gt;
<br>&gt;      &gt; &gt; Il giorno marted=C3=AC 9 gennaio 2024 alle 17:26:57=
 UTC+1 Michele
<br>&gt;     Pescap=C3=A8
<br>&gt;      &gt; &gt; ha scritto:
<br>&gt;      &gt; &gt;
<br>&gt;      &gt; &gt; Hi, thank you for replying.
<br>&gt;      &gt; &gt;
<br>&gt;      &gt; &gt; ttyS0 is indeed whitelisted in the inmate and the n=
umber of
<br>&gt;      &gt; &gt; pio_regions is set accordingly.
<br>&gt;      &gt; &gt;
<br>&gt;      &gt; &gt; As for the crash after disable/shutdown, I think it=
 was related
<br>&gt;      &gt; &gt; to the PCI device, after commenting that and the co=
rresponding
<br>&gt;      &gt; &gt; regions out I no longer get that freeze. CONFIG_JAI=
LHOUSE_GUEST
<br>&gt;     and
<br>&gt;      &gt; &gt; CONFIG_JAILHOUSE_DBCON were already set in the kern=
el
<br>&gt;      &gt; &gt; configuration I&#39;m using for the non root linux;=
 still, I
<br>&gt;      &gt; &gt; recompiled it just in case.
<br>&gt;      &gt; &gt;
<br>&gt;      &gt; &gt; Michele
<br>&gt;      &gt; &gt;
<br>&gt;      &gt; &gt; Il giorno marted=C3=AC 9 gennaio 2024 alle 14:14:33=
 UTC+1 Ralf
<br>&gt;      &gt; &gt; Ramsauer ha scritto:
<br>&gt;      &gt; &gt;
<br>&gt;      &gt; &gt; Hi,
<br>&gt;      &gt; &gt;
<br>&gt;      &gt; &gt; On 08/01/2024 23:56, Michele Pescap=C3=A8 wrote:
<br>&gt;      &gt; &gt; &gt; Hi all,
<br>&gt;      &gt; &gt; &gt;
<br>&gt;      &gt; &gt; &gt; I have an AMD Ryzen 2600 on a b450 motherboard=
. My goal
<br>&gt;      &gt; &gt; is to run two
<br>&gt;      &gt; &gt; &gt; non root linux cells, however, as of right now=
, I&#39;m not
<br>&gt;      &gt; &gt; able to start
<br>&gt;      &gt; &gt; &gt; any non root linux cells.
<br>&gt;      &gt; &gt; &gt; First of all I don&#39;t receive an output fro=
m the cell (I
<br>&gt;      &gt; &gt; do get output
<br>&gt;      &gt; &gt; &gt; from the apic-demo though), therefore I don&#3=
9;t really know
<br>&gt;      &gt; &gt; if they&#39;re
<br>&gt;      &gt; &gt; &gt; even crashing or not; this is the output I get=
 from the
<br>&gt;      &gt; &gt; hypervisor after
<br>&gt;      &gt; &gt; &gt; enabling the root cell and issuing the followi=
ng command:
<br>&gt;      &gt; &gt; &gt;
<br>&gt;      &gt; &gt; &gt; sudo jailhouse cell linux configs/x86/linux_gu=
est1.cell
<br>&gt;      &gt; &gt; &gt; ../buildroot-2023.11/output/images/bzImage -i
<br>&gt;      &gt; &gt; &gt; ../buildroot-2023.11/output/images/rootfs.cpio
<br>&gt;      &gt; &gt;
<br>&gt;      &gt; &gt; for the first few tries, simply don&#39;t load a ra=
mdisk. Try to
<br>&gt;      &gt; &gt; get the
<br>&gt;      &gt; &gt; kernel booting. It will crash with &quot;cannot mou=
nt rootfs&quot;. If
<br>&gt;      &gt; &gt; we get so
<br>&gt;      &gt; &gt; far, then you can continue specifying the ramdisk. =
But
<br>&gt;      &gt; &gt; first, we have to
<br>&gt;      &gt; &gt; get that far.
<br>&gt;      &gt; &gt;
<br>&gt;      &gt; &gt; &gt;
<br>&gt;      &gt; &gt; &gt; Adding PCI device ff:1f.7 to cell &quot;linux-=
x86-demo&quot;
<br>&gt;      &gt; &gt; &gt; Created cell &quot;linux-x86-demo&quot;
<br>&gt;      &gt; &gt; &gt; Page pool usage after cell creation: mem 336/3=
2211, remap
<br>&gt;      &gt; &gt; 16392/131072
<br>&gt;      &gt; &gt; &gt; Cell &quot;linux-x86-demo&quot; can be loaded
<br>&gt;      &gt; &gt; &gt; CPU 4 received SIPI, vector 100
<br>&gt;      &gt; &gt; &gt; CPU 3 received SIPI, vector 100
<br>&gt;      &gt; &gt; &gt; Started cell &quot;linux-x86-demo&quot;
<br>&gt;      &gt; &gt; &gt;
<br>&gt;      &gt; &gt; &gt; After this the cell appears to be running in c=
ell list,
<br>&gt;      &gt; &gt; however I can&#39;t
<br>&gt;      &gt; &gt; &gt; seem to get any output to confirm that (I even=
 set
<br>&gt;      &gt; &gt; &gt; JAILHOUSE_CELL_VIRTUAL_CONSOLE_ACTIVE, but not=
hing
<br>&gt;      &gt; &gt; appears on the vrtual
<br>&gt;      &gt; &gt; &gt; console accessed via &quot;jailhouse console -=
f&quot;). I also
<br>&gt;      &gt; &gt; tried adding -c
<br>&gt;      &gt; &gt; &gt; &quot;console=3DttyS0,115200&quot;.
<br>&gt;      &gt; &gt;
<br>&gt;      &gt; &gt; ttyS0, i.e., x86 Port 0x3f8 is whitelisted in the c=
ell
<br>&gt;      &gt; &gt; configuration?
<br>&gt;      &gt; &gt; Actually, your cmdline is correct.
<br>&gt;      &gt; &gt;
<br>&gt;      &gt; &gt; &gt; At this point if I try to disable/shutdown the=
 cell, the
<br>&gt;      &gt; &gt; system freezes
<br>&gt;      &gt; &gt; &gt; requiring a hard reset.
<br>&gt;      &gt; &gt;
<br>&gt;      &gt; &gt; Okay, is the guest Linux compiled with Jailhouse gu=
est
<br>&gt;      &gt; &gt; support? Please
<br>&gt;      &gt; &gt; ensure that non-root Linux is compiled with
<br>&gt;      &gt; &gt; CONFIG_JAILHOUSE_GUEST and
<br>&gt;      &gt; &gt; CONFIG_JAILHOUSE_DBCON. The first one is mandatory =
for x86
<br>&gt;      &gt; &gt; Linux guests.
<br>&gt;      &gt; &gt;
<br>&gt;      &gt; &gt; &gt;
<br>&gt;      &gt; &gt; &gt; Also, there seems to be a mismatch between the=
 PCI bdf
<br>&gt;      &gt; &gt; value in the log
<br>&gt;      &gt; &gt; &gt; above and the one in the cell&#39;s configurat=
ion. In both
<br>&gt;      &gt; &gt; root and non root
<br>&gt;      &gt; &gt; &gt; cells i set .bdf =3D (0x0f &lt;&lt; 3) for the=
 IVSHMEM net device
<br>&gt;      &gt; &gt; and the Root
<br>&gt;      &gt; &gt; &gt; cell correctly reports that (&quot;Adding virt=
ual PCI device
<br>&gt;      &gt; &gt; 00:0f.0 to cell
<br>&gt;      &gt; &gt; &gt; &quot;RootCell&quot;&quot;).
<br>&gt;      &gt; &gt;
<br>&gt;      &gt; &gt; First things first. Let&#39;s try to get Linux kick=
ed off before
<br>&gt;      &gt; &gt; diving into
<br>&gt;      &gt; &gt; PCI. Comment it out for the moment, let&#39;s do th=
at later.
<br>&gt;      &gt; &gt;
<br>&gt;      &gt; &gt; Ralf
<br>&gt;      &gt; &gt;
<br>&gt;      &gt; &gt; &gt;
<br>&gt;      &gt; &gt; &gt; If I understood correctly, once the cell works=
 properly I
<br>&gt;      &gt; &gt; won&#39;t need to
<br>&gt;      &gt; &gt; &gt; set the console anymore as I can assign an ip =
(-c &quot;ip
<br>&gt;      &gt; &gt; x.x.x.x&quot; in the
<br>&gt;      &gt; &gt; &gt; cell linux command) and ssh to the cell, right=
?
<br>&gt;      &gt; &gt; &gt;
<br>&gt;      &gt; &gt; &gt; I attach the root and non root cells&#39; conf=
igurations in
<br>&gt;      &gt; &gt; case they&#39;re
<br>&gt;      &gt; &gt; &gt; needed. I can provide both the root and non ro=
ot cell&#39;s
<br>&gt;      &gt; &gt; kernel .conf and
<br>&gt;      &gt; &gt; &gt; the buildroot configuration I used if needed.
<br>&gt;      &gt; &gt; &gt;
<br>&gt;      &gt; &gt; &gt; Thank you for your time,
<br>&gt;      &gt; &gt; &gt; Michele
<br>&gt;      &gt; &gt; &gt;
<br>&gt;      &gt; &gt; &gt; --
<br>&gt;      &gt; &gt; &gt; You received this message because you are subs=
cribed to
<br>&gt;      &gt; &gt; the Google
<br>&gt;      &gt; &gt; &gt; Groups &quot;Jailhouse&quot; group.
<br>&gt;      &gt; &gt; &gt; To unsubscribe from this group and stop receiv=
ing emails
<br>&gt;      &gt; &gt; from it, send
<br>&gt;      &gt; &gt; &gt; an email to <a href data-email-masked rel=3D"n=
ofollow">jailhouse-de...@googlegroups.com</a>
<br>&gt;      &gt; &gt; &gt; &lt;mailto:<a href data-email-masked rel=3D"no=
follow">jailhouse-de...@googlegroups.com</a>&gt;.
<br>&gt;      &gt; &gt; &gt; To view this discussion on the web visit
<br>&gt;      &gt; &gt; &gt;
<br>&gt;      &gt; &gt;
<br>&gt;      &gt;
<br>&gt;     <a href=3D"https://groups.google.com/d/msgid/jailhouse-dev/824=
bacc4-b7ae-47c9-878e-7203214b4fc3n%40googlegroups.com" target=3D"_blank" re=
l=3D"nofollow" data-saferedirecturl=3D"https://www.google.com/url?hl=3Dit&a=
mp;q=3Dhttps://groups.google.com/d/msgid/jailhouse-dev/824bacc4-b7ae-47c9-8=
78e-7203214b4fc3n%2540googlegroups.com&amp;source=3Dgmail&amp;ust=3D1705148=
181921000&amp;usg=3DAOvVaw0ZReoZ2YGtgc98rdnZdHAw">https://groups.google.com=
/d/msgid/jailhouse-dev/824bacc4-b7ae-47c9-878e-7203214b4fc3n%40googlegroups=
.com</a> &lt;<a href=3D"https://groups.google.com/d/msgid/jailhouse-dev/824=
bacc4-b7ae-47c9-878e-7203214b4fc3n%40googlegroups.com" target=3D"_blank" re=
l=3D"nofollow" data-saferedirecturl=3D"https://www.google.com/url?hl=3Dit&a=
mp;q=3Dhttps://groups.google.com/d/msgid/jailhouse-dev/824bacc4-b7ae-47c9-8=
78e-7203214b4fc3n%2540googlegroups.com&amp;source=3Dgmail&amp;ust=3D1705148=
181921000&amp;usg=3DAOvVaw0ZReoZ2YGtgc98rdnZdHAw">https://groups.google.com=
/d/msgid/jailhouse-dev/824bacc4-b7ae-47c9-878e-7203214b4fc3n%40googlegroups=
.com</a>&gt; &lt;<a href=3D"https://groups.google.com/d/msgid/jailhouse-dev=
/824bacc4-b7ae-47c9-878e-7203214b4fc3n%40googlegroups.com" target=3D"_blank=
" rel=3D"nofollow" data-saferedirecturl=3D"https://www.google.com/url?hl=3D=
it&amp;q=3Dhttps://groups.google.com/d/msgid/jailhouse-dev/824bacc4-b7ae-47=
c9-878e-7203214b4fc3n%2540googlegroups.com&amp;source=3Dgmail&amp;ust=3D170=
5148181921000&amp;usg=3DAOvVaw0ZReoZ2YGtgc98rdnZdHAw">https://groups.google=
.com/d/msgid/jailhouse-dev/824bacc4-b7ae-47c9-878e-7203214b4fc3n%40googlegr=
oups.com</a> &lt;<a href=3D"https://groups.google.com/d/msgid/jailhouse-dev=
/824bacc4-b7ae-47c9-878e-7203214b4fc3n%40googlegroups.com" target=3D"_blank=
" rel=3D"nofollow" data-saferedirecturl=3D"https://www.google.com/url?hl=3D=
it&amp;q=3Dhttps://groups.google.com/d/msgid/jailhouse-dev/824bacc4-b7ae-47=
c9-878e-7203214b4fc3n%2540googlegroups.com&amp;source=3Dgmail&amp;ust=3D170=
5148181921000&amp;usg=3DAOvVaw0ZReoZ2YGtgc98rdnZdHAw">https://groups.google=
.com/d/msgid/jailhouse-dev/824bacc4-b7ae-47c9-878e-7203214b4fc3n%40googlegr=
oups.com</a>&gt;&gt; &lt;<a href=3D"https://groups.google.com/d/msgid/jailh=
ouse-dev/824bacc4-b7ae-47c9-878e-7203214b4fc3n%40googlegroups.com" target=
=3D"_blank" rel=3D"nofollow" data-saferedirecturl=3D"https://www.google.com=
/url?hl=3Dit&amp;q=3Dhttps://groups.google.com/d/msgid/jailhouse-dev/824bac=
c4-b7ae-47c9-878e-7203214b4fc3n%2540googlegroups.com&amp;source=3Dgmail&amp=
;ust=3D1705148181921000&amp;usg=3DAOvVaw0ZReoZ2YGtgc98rdnZdHAw">https://gro=
ups.google.com/d/msgid/jailhouse-dev/824bacc4-b7ae-47c9-878e-7203214b4fc3n%=
40googlegroups.com</a> &lt;<a href=3D"https://groups.google.com/d/msgid/jai=
lhouse-dev/824bacc4-b7ae-47c9-878e-7203214b4fc3n%40googlegroups.com" target=
=3D"_blank" rel=3D"nofollow" data-saferedirecturl=3D"https://www.google.com=
/url?hl=3Dit&amp;q=3Dhttps://groups.google.com/d/msgid/jailhouse-dev/824bac=
c4-b7ae-47c9-878e-7203214b4fc3n%2540googlegroups.com&amp;source=3Dgmail&amp=
;ust=3D1705148181922000&amp;usg=3DAOvVaw36PXRjsbkYUMwO5vLtNnzM">https://gro=
ups.google.com/d/msgid/jailhouse-dev/824bacc4-b7ae-47c9-878e-7203214b4fc3n%=
40googlegroups.com</a>&gt; &lt;<a href=3D"https://groups.google.com/d/msgid=
/jailhouse-dev/824bacc4-b7ae-47c9-878e-7203214b4fc3n%40googlegroups.com" ta=
rget=3D"_blank" rel=3D"nofollow" data-saferedirecturl=3D"https://www.google=
.com/url?hl=3Dit&amp;q=3Dhttps://groups.google.com/d/msgid/jailhouse-dev/82=
4bacc4-b7ae-47c9-878e-7203214b4fc3n%2540googlegroups.com&amp;source=3Dgmail=
&amp;ust=3D1705148181922000&amp;usg=3DAOvVaw36PXRjsbkYUMwO5vLtNnzM">https:/=
/groups.google.com/d/msgid/jailhouse-dev/824bacc4-b7ae-47c9-878e-7203214b4f=
c3n%40googlegroups.com</a> &lt;<a href=3D"https://groups.google.com/d/msgid=
/jailhouse-dev/824bacc4-b7ae-47c9-878e-7203214b4fc3n%40googlegroups.com" ta=
rget=3D"_blank" rel=3D"nofollow" data-saferedirecturl=3D"https://www.google=
.com/url?hl=3Dit&amp;q=3Dhttps://groups.google.com/d/msgid/jailhouse-dev/82=
4bacc4-b7ae-47c9-878e-7203214b4fc3n%2540googlegroups.com&amp;source=3Dgmail=
&amp;ust=3D1705148181922000&amp;usg=3DAOvVaw36PXRjsbkYUMwO5vLtNnzM">https:/=
/groups.google.com/d/msgid/jailhouse-dev/824bacc4-b7ae-47c9-878e-7203214b4f=
c3n%40googlegroups.com</a>&gt;&gt;&gt; &lt;<a href=3D"https://groups.google=
.com/d/msgid/jailhouse-dev/824bacc4-b7ae-47c9-878e-7203214b4fc3n%40googlegr=
oups.com?utm_medium=3Demail&amp;utm_source=3Dfooter" target=3D"_blank" rel=
=3D"nofollow" data-saferedirecturl=3D"https://www.google.com/url?hl=3Dit&am=
p;q=3Dhttps://groups.google.com/d/msgid/jailhouse-dev/824bacc4-b7ae-47c9-87=
8e-7203214b4fc3n%2540googlegroups.com?utm_medium%3Demail%26utm_source%3Dfoo=
ter&amp;source=3Dgmail&amp;ust=3D1705148181922000&amp;usg=3DAOvVaw1fThJgGyh=
C5Ol3NKrnG_mA">https://groups.google.com/d/msgid/jailhouse-dev/824bacc4-b7a=
e-47c9-878e-7203214b4fc3n%40googlegroups.com?utm_medium=3Demail&amp;utm_sou=
rce=3Dfooter</a> &lt;<a href=3D"https://groups.google.com/d/msgid/jailhouse=
-dev/824bacc4-b7ae-47c9-878e-7203214b4fc3n%40googlegroups.com?utm_medium=3D=
email&amp;utm_source=3Dfooter" target=3D"_blank" rel=3D"nofollow" data-safe=
redirecturl=3D"https://www.google.com/url?hl=3Dit&amp;q=3Dhttps://groups.go=
ogle.com/d/msgid/jailhouse-dev/824bacc4-b7ae-47c9-878e-7203214b4fc3n%2540go=
oglegroups.com?utm_medium%3Demail%26utm_source%3Dfooter&amp;source=3Dgmail&=
amp;ust=3D1705148181922000&amp;usg=3DAOvVaw1fThJgGyhC5Ol3NKrnG_mA">https://=
groups.google.com/d/msgid/jailhouse-dev/824bacc4-b7ae-47c9-878e-7203214b4fc=
3n%40googlegroups.com?utm_medium=3Demail&amp;utm_source=3Dfooter</a>&gt; &l=
t;<a href=3D"https://groups.google.com/d/msgid/jailhouse-dev/824bacc4-b7ae-=
47c9-878e-7203214b4fc3n%40googlegroups.com?utm_medium=3Demail&amp;utm_sourc=
e=3Dfooter" target=3D"_blank" rel=3D"nofollow" data-saferedirecturl=3D"http=
s://www.google.com/url?hl=3Dit&amp;q=3Dhttps://groups.google.com/d/msgid/ja=
ilhouse-dev/824bacc4-b7ae-47c9-878e-7203214b4fc3n%2540googlegroups.com?utm_=
medium%3Demail%26utm_source%3Dfooter&amp;source=3Dgmail&amp;ust=3D170514818=
1922000&amp;usg=3DAOvVaw1fThJgGyhC5Ol3NKrnG_mA">https://groups.google.com/d=
/msgid/jailhouse-dev/824bacc4-b7ae-47c9-878e-7203214b4fc3n%40googlegroups.c=
om?utm_medium=3Demail&amp;utm_source=3Dfooter</a> &lt;<a href=3D"https://gr=
oups.google.com/d/msgid/jailhouse-dev/824bacc4-b7ae-47c9-878e-7203214b4fc3n=
%40googlegroups.com?utm_medium=3Demail&amp;utm_source=3Dfooter" target=3D"_=
blank" rel=3D"nofollow" data-saferedirecturl=3D"https://www.google.com/url?=
hl=3Dit&amp;q=3Dhttps://groups.google.com/d/msgid/jailhouse-dev/824bacc4-b7=
ae-47c9-878e-7203214b4fc3n%2540googlegroups.com?utm_medium%3Demail%26utm_so=
urce%3Dfooter&amp;source=3Dgmail&amp;ust=3D1705148181922000&amp;usg=3DAOvVa=
w1fThJgGyhC5Ol3NKrnG_mA">https://groups.google.com/d/msgid/jailhouse-dev/82=
4bacc4-b7ae-47c9-878e-7203214b4fc3n%40googlegroups.com?utm_medium=3Demail&a=
mp;utm_source=3Dfooter</a>&gt;&gt; &lt;<a href=3D"https://groups.google.com=
/d/msgid/jailhouse-dev/824bacc4-b7ae-47c9-878e-7203214b4fc3n%40googlegroups=
.com?utm_medium=3Demail&amp;utm_source=3Dfooter" target=3D"_blank" rel=3D"n=
ofollow" data-saferedirecturl=3D"https://www.google.com/url?hl=3Dit&amp;q=
=3Dhttps://groups.google.com/d/msgid/jailhouse-dev/824bacc4-b7ae-47c9-878e-=
7203214b4fc3n%2540googlegroups.com?utm_medium%3Demail%26utm_source%3Dfooter=
&amp;source=3Dgmail&amp;ust=3D1705148181922000&amp;usg=3DAOvVaw1fThJgGyhC5O=
l3NKrnG_mA">https://groups.google.com/d/msgid/jailhouse-dev/824bacc4-b7ae-4=
7c9-878e-7203214b4fc3n%40googlegroups.com?utm_medium=3Demail&amp;utm_source=
=3Dfooter</a> &lt;<a href=3D"https://groups.google.com/d/msgid/jailhouse-de=
v/824bacc4-b7ae-47c9-878e-7203214b4fc3n%40googlegroups.com?utm_medium=3Dema=
il&amp;utm_source=3Dfooter" target=3D"_blank" rel=3D"nofollow" data-safered=
irecturl=3D"https://www.google.com/url?hl=3Dit&amp;q=3Dhttps://groups.googl=
e.com/d/msgid/jailhouse-dev/824bacc4-b7ae-47c9-878e-7203214b4fc3n%2540googl=
egroups.com?utm_medium%3Demail%26utm_source%3Dfooter&amp;source=3Dgmail&amp=
;ust=3D1705148181922000&amp;usg=3DAOvVaw1fThJgGyhC5Ol3NKrnG_mA">https://gro=
ups.google.com/d/msgid/jailhouse-dev/824bacc4-b7ae-47c9-878e-7203214b4fc3n%=
40googlegroups.com?utm_medium=3Demail&amp;utm_source=3Dfooter</a>&gt; &lt;<=
a href=3D"https://groups.google.com/d/msgid/jailhouse-dev/824bacc4-b7ae-47c=
9-878e-7203214b4fc3n%40googlegroups.com?utm_medium=3Demail&amp;utm_source=
=3Dfooter" target=3D"_blank" rel=3D"nofollow" data-saferedirecturl=3D"https=
://www.google.com/url?hl=3Dit&amp;q=3Dhttps://groups.google.com/d/msgid/jai=
lhouse-dev/824bacc4-b7ae-47c9-878e-7203214b4fc3n%2540googlegroups.com?utm_m=
edium%3Demail%26utm_source%3Dfooter&amp;source=3Dgmail&amp;ust=3D1705148181=
922000&amp;usg=3DAOvVaw1fThJgGyhC5Ol3NKrnG_mA">https://groups.google.com/d/=
msgid/jailhouse-dev/824bacc4-b7ae-47c9-878e-7203214b4fc3n%40googlegroups.co=
m?utm_medium=3Demail&amp;utm_source=3Dfooter</a> &lt;<a href=3D"https://gro=
ups.google.com/d/msgid/jailhouse-dev/824bacc4-b7ae-47c9-878e-7203214b4fc3n%=
40googlegroups.com?utm_medium=3Demail&amp;utm_source=3Dfooter" target=3D"_b=
lank" rel=3D"nofollow" data-saferedirecturl=3D"https://www.google.com/url?h=
l=3Dit&amp;q=3Dhttps://groups.google.com/d/msgid/jailhouse-dev/824bacc4-b7a=
e-47c9-878e-7203214b4fc3n%2540googlegroups.com?utm_medium%3Demail%26utm_sou=
rce%3Dfooter&amp;source=3Dgmail&amp;ust=3D1705148181922000&amp;usg=3DAOvVaw=
1fThJgGyhC5Ol3NKrnG_mA">https://groups.google.com/d/msgid/jailhouse-dev/824=
bacc4-b7ae-47c9-878e-7203214b4fc3n%40googlegroups.com?utm_medium=3Demail&am=
p;utm_source=3Dfooter</a>&gt;&gt;&gt;&gt;.
<br>&gt;      &gt; &gt;
<br>&gt;      &gt; &gt; --
<br>&gt;      &gt; &gt; You received this message because you are subscribe=
d to the Google
<br>&gt;      &gt; &gt; Groups &quot;Jailhouse&quot; group.
<br>&gt;      &gt; &gt; To unsubscribe from this group and stop receiving e=
mails from it,
<br>&gt;      &gt; send
<br>&gt;      &gt; &gt; an email to <a href data-email-masked rel=3D"nofoll=
ow">jailhouse-de...@googlegroups.com</a>
<br>&gt;      &gt; &gt; &lt;mailto:<a href data-email-masked rel=3D"nofollo=
w">jailhouse-de...@googlegroups.com</a>&gt;.
<br>&gt;      &gt; &gt; To view this discussion on the web visit
<br>&gt;      &gt; &gt;
<br>&gt;      &gt;
<br>&gt;     <a href=3D"https://groups.google.com/d/msgid/jailhouse-dev/220=
2bf30-5b2c-45ea-9f9f-699daf338843n%40googlegroups.com" target=3D"_blank" re=
l=3D"nofollow" data-saferedirecturl=3D"https://www.google.com/url?hl=3Dit&a=
mp;q=3Dhttps://groups.google.com/d/msgid/jailhouse-dev/2202bf30-5b2c-45ea-9=
f9f-699daf338843n%2540googlegroups.com&amp;source=3Dgmail&amp;ust=3D1705148=
181922000&amp;usg=3DAOvVaw0thY06TpjPs0_yIlSTVrD-">https://groups.google.com=
/d/msgid/jailhouse-dev/2202bf30-5b2c-45ea-9f9f-699daf338843n%40googlegroups=
.com</a> &lt;<a href=3D"https://groups.google.com/d/msgid/jailhouse-dev/220=
2bf30-5b2c-45ea-9f9f-699daf338843n%40googlegroups.com" target=3D"_blank" re=
l=3D"nofollow" data-saferedirecturl=3D"https://www.google.com/url?hl=3Dit&a=
mp;q=3Dhttps://groups.google.com/d/msgid/jailhouse-dev/2202bf30-5b2c-45ea-9=
f9f-699daf338843n%2540googlegroups.com&amp;source=3Dgmail&amp;ust=3D1705148=
181922000&amp;usg=3DAOvVaw0thY06TpjPs0_yIlSTVrD-">https://groups.google.com=
/d/msgid/jailhouse-dev/2202bf30-5b2c-45ea-9f9f-699daf338843n%40googlegroups=
.com</a>&gt; &lt;<a href=3D"https://groups.google.com/d/msgid/jailhouse-dev=
/2202bf30-5b2c-45ea-9f9f-699daf338843n%40googlegroups.com" target=3D"_blank=
" rel=3D"nofollow" data-saferedirecturl=3D"https://www.google.com/url?hl=3D=
it&amp;q=3Dhttps://groups.google.com/d/msgid/jailhouse-dev/2202bf30-5b2c-45=
ea-9f9f-699daf338843n%2540googlegroups.com&amp;source=3Dgmail&amp;ust=3D170=
5148181922000&amp;usg=3DAOvVaw0thY06TpjPs0_yIlSTVrD-">https://groups.google=
.com/d/msgid/jailhouse-dev/2202bf30-5b2c-45ea-9f9f-699daf338843n%40googlegr=
oups.com</a> &lt;<a href=3D"https://groups.google.com/d/msgid/jailhouse-dev=
/2202bf30-5b2c-45ea-9f9f-699daf338843n%40googlegroups.com" target=3D"_blank=
" rel=3D"nofollow" data-saferedirecturl=3D"https://www.google.com/url?hl=3D=
it&amp;q=3Dhttps://groups.google.com/d/msgid/jailhouse-dev/2202bf30-5b2c-45=
ea-9f9f-699daf338843n%2540googlegroups.com&amp;source=3Dgmail&amp;ust=3D170=
5148181922000&amp;usg=3DAOvVaw0thY06TpjPs0_yIlSTVrD-">https://groups.google=
.com/d/msgid/jailhouse-dev/2202bf30-5b2c-45ea-9f9f-699daf338843n%40googlegr=
oups.com</a>&gt;&gt; &lt;<a href=3D"https://groups.google.com/d/msgid/jailh=
ouse-dev/2202bf30-5b2c-45ea-9f9f-699daf338843n%40googlegroups.com?utm_mediu=
m=3Demail&amp;utm_source=3Dfooter" target=3D"_blank" rel=3D"nofollow" data-=
saferedirecturl=3D"https://www.google.com/url?hl=3Dit&amp;q=3Dhttps://group=
s.google.com/d/msgid/jailhouse-dev/2202bf30-5b2c-45ea-9f9f-699daf338843n%25=
40googlegroups.com?utm_medium%3Demail%26utm_source%3Dfooter&amp;source=3Dgm=
ail&amp;ust=3D1705148181922000&amp;usg=3DAOvVaw0NoFbCF2ncTo5Y2SuI3bH8">http=
s://groups.google.com/d/msgid/jailhouse-dev/2202bf30-5b2c-45ea-9f9f-699daf3=
38843n%40googlegroups.com?utm_medium=3Demail&amp;utm_source=3Dfooter</a> &l=
t;<a href=3D"https://groups.google.com/d/msgid/jailhouse-dev/2202bf30-5b2c-=
45ea-9f9f-699daf338843n%40googlegroups.com?utm_medium=3Demail&amp;utm_sourc=
e=3Dfooter" target=3D"_blank" rel=3D"nofollow" data-saferedirecturl=3D"http=
s://www.google.com/url?hl=3Dit&amp;q=3Dhttps://groups.google.com/d/msgid/ja=
ilhouse-dev/2202bf30-5b2c-45ea-9f9f-699daf338843n%2540googlegroups.com?utm_=
medium%3Demail%26utm_source%3Dfooter&amp;source=3Dgmail&amp;ust=3D170514818=
1922000&amp;usg=3DAOvVaw0NoFbCF2ncTo5Y2SuI3bH8">https://groups.google.com/d=
/msgid/jailhouse-dev/2202bf30-5b2c-45ea-9f9f-699daf338843n%40googlegroups.c=
om?utm_medium=3Demail&amp;utm_source=3Dfooter</a>&gt; &lt;<a href=3D"https:=
//groups.google.com/d/msgid/jailhouse-dev/2202bf30-5b2c-45ea-9f9f-699daf338=
843n%40googlegroups.com?utm_medium=3Demail&amp;utm_source=3Dfooter" target=
=3D"_blank" rel=3D"nofollow" data-saferedirecturl=3D"https://www.google.com=
/url?hl=3Dit&amp;q=3Dhttps://groups.google.com/d/msgid/jailhouse-dev/2202bf=
30-5b2c-45ea-9f9f-699daf338843n%2540googlegroups.com?utm_medium%3Demail%26u=
tm_source%3Dfooter&amp;source=3Dgmail&amp;ust=3D1705148181922000&amp;usg=3D=
AOvVaw0NoFbCF2ncTo5Y2SuI3bH8">https://groups.google.com/d/msgid/jailhouse-d=
ev/2202bf30-5b2c-45ea-9f9f-699daf338843n%40googlegroups.com?utm_medium=3Dem=
ail&amp;utm_source=3Dfooter</a> &lt;<a href=3D"https://groups.google.com/d/=
msgid/jailhouse-dev/2202bf30-5b2c-45ea-9f9f-699daf338843n%40googlegroups.co=
m?utm_medium=3Demail&amp;utm_source=3Dfooter" target=3D"_blank" rel=3D"nofo=
llow" data-saferedirecturl=3D"https://www.google.com/url?hl=3Dit&amp;q=3Dht=
tps://groups.google.com/d/msgid/jailhouse-dev/2202bf30-5b2c-45ea-9f9f-699da=
f338843n%2540googlegroups.com?utm_medium%3Demail%26utm_source%3Dfooter&amp;=
source=3Dgmail&amp;ust=3D1705148181922000&amp;usg=3DAOvVaw0NoFbCF2ncTo5Y2Su=
I3bH8">https://groups.google.com/d/msgid/jailhouse-dev/2202bf30-5b2c-45ea-9=
f9f-699daf338843n%40googlegroups.com?utm_medium=3Demail&amp;utm_source=3Dfo=
oter</a>&gt;&gt;&gt;.
<br>&gt;      &gt;
<br>&gt;      &gt; --
<br>&gt;      &gt; You received this message because you are subscribed to =
the Google
<br>&gt;      &gt; Groups &quot;Jailhouse&quot; group.
<br>&gt;      &gt; To unsubscribe from this group and stop receiving emails=
 from it,
<br>&gt;     send
<br>&gt;      &gt; an email to <a href data-email-masked rel=3D"nofollow">j=
ailhouse-de...@googlegroups.com</a>
<br>&gt;      &gt; &lt;mailto:<a href data-email-masked rel=3D"nofollow">ja=
ilhouse-de...@googlegroups.com</a>&gt;.
<br>&gt;      &gt; To view this discussion on the web visit
<br>&gt;      &gt;
<br>&gt;     <a href=3D"https://groups.google.com/d/msgid/jailhouse-dev/9a0=
21e3f-caca-4ebe-9351-be2c3e999446n%40googlegroups.com" target=3D"_blank" re=
l=3D"nofollow" data-saferedirecturl=3D"https://www.google.com/url?hl=3Dit&a=
mp;q=3Dhttps://groups.google.com/d/msgid/jailhouse-dev/9a021e3f-caca-4ebe-9=
351-be2c3e999446n%2540googlegroups.com&amp;source=3Dgmail&amp;ust=3D1705148=
181922000&amp;usg=3DAOvVaw0Sl482lquQ5_EAozTbRPaC">https://groups.google.com=
/d/msgid/jailhouse-dev/9a021e3f-caca-4ebe-9351-be2c3e999446n%40googlegroups=
.com</a> &lt;<a href=3D"https://groups.google.com/d/msgid/jailhouse-dev/9a0=
21e3f-caca-4ebe-9351-be2c3e999446n%40googlegroups.com" target=3D"_blank" re=
l=3D"nofollow" data-saferedirecturl=3D"https://www.google.com/url?hl=3Dit&a=
mp;q=3Dhttps://groups.google.com/d/msgid/jailhouse-dev/9a021e3f-caca-4ebe-9=
351-be2c3e999446n%2540googlegroups.com&amp;source=3Dgmail&amp;ust=3D1705148=
181922000&amp;usg=3DAOvVaw0Sl482lquQ5_EAozTbRPaC">https://groups.google.com=
/d/msgid/jailhouse-dev/9a021e3f-caca-4ebe-9351-be2c3e999446n%40googlegroups=
.com</a>&gt; &lt;<a href=3D"https://groups.google.com/d/msgid/jailhouse-dev=
/9a021e3f-caca-4ebe-9351-be2c3e999446n%40googlegroups.com?utm_medium=3Demai=
l&amp;utm_source=3Dfooter" target=3D"_blank" rel=3D"nofollow" data-saferedi=
recturl=3D"https://www.google.com/url?hl=3Dit&amp;q=3Dhttps://groups.google=
.com/d/msgid/jailhouse-dev/9a021e3f-caca-4ebe-9351-be2c3e999446n%2540google=
groups.com?utm_medium%3Demail%26utm_source%3Dfooter&amp;source=3Dgmail&amp;=
ust=3D1705148181922000&amp;usg=3DAOvVaw1KML7_nllQaPcl6Kc8GTJh">https://grou=
ps.google.com/d/msgid/jailhouse-dev/9a021e3f-caca-4ebe-9351-be2c3e999446n%4=
0googlegroups.com?utm_medium=3Demail&amp;utm_source=3Dfooter</a> &lt;<a hre=
f=3D"https://groups.google.com/d/msgid/jailhouse-dev/9a021e3f-caca-4ebe-935=
1-be2c3e999446n%40googlegroups.com?utm_medium=3Demail&amp;utm_source=3Dfoot=
er" target=3D"_blank" rel=3D"nofollow" data-saferedirecturl=3D"https://www.=
google.com/url?hl=3Dit&amp;q=3Dhttps://groups.google.com/d/msgid/jailhouse-=
dev/9a021e3f-caca-4ebe-9351-be2c3e999446n%2540googlegroups.com?utm_medium%3=
Demail%26utm_source%3Dfooter&amp;source=3Dgmail&amp;ust=3D1705148181922000&=
amp;usg=3DAOvVaw1KML7_nllQaPcl6Kc8GTJh">https://groups.google.com/d/msgid/j=
ailhouse-dev/9a021e3f-caca-4ebe-9351-be2c3e999446n%40googlegroups.com?utm_m=
edium=3Demail&amp;utm_source=3Dfooter</a>&gt;&gt;.
<br>&gt;=20
<br>&gt; --=20
<br>&gt; You received this message because you are subscribed to the Google=
=20
<br>&gt; Groups &quot;Jailhouse&quot; group.
<br>&gt; To unsubscribe from this group and stop receiving emails from it, =
send=20
<br>&gt; an email to <a href data-email-masked rel=3D"nofollow">jailhouse-d=
e...@googlegroups.com</a>=20
<br>&gt; &lt;mailto:<a href data-email-masked rel=3D"nofollow">jailhouse-de=
...@googlegroups.com</a>&gt;.
<br>&gt; To view this discussion on the web visit=20
<br>&gt; <a href=3D"https://groups.google.com/d/msgid/jailhouse-dev/23a9c30=
e-5507-449e-9589-697904becac4n%40googlegroups.com" target=3D"_blank" rel=3D=
"nofollow" data-saferedirecturl=3D"https://www.google.com/url?hl=3Dit&amp;q=
=3Dhttps://groups.google.com/d/msgid/jailhouse-dev/23a9c30e-5507-449e-9589-=
697904becac4n%2540googlegroups.com&amp;source=3Dgmail&amp;ust=3D17051481819=
22000&amp;usg=3DAOvVaw0nUd7XT7qjqRLzxAecuDav">https://groups.google.com/d/m=
sgid/jailhouse-dev/23a9c30e-5507-449e-9589-697904becac4n%40googlegroups.com=
</a> &lt;<a href=3D"https://groups.google.com/d/msgid/jailhouse-dev/23a9c30=
e-5507-449e-9589-697904becac4n%40googlegroups.com?utm_medium=3Demail&amp;ut=
m_source=3Dfooter" target=3D"_blank" rel=3D"nofollow" data-saferedirecturl=
=3D"https://www.google.com/url?hl=3Dit&amp;q=3Dhttps://groups.google.com/d/=
msgid/jailhouse-dev/23a9c30e-5507-449e-9589-697904becac4n%2540googlegroups.=
com?utm_medium%3Demail%26utm_source%3Dfooter&amp;source=3Dgmail&amp;ust=3D1=
705148181922000&amp;usg=3DAOvVaw1kVTFQ8pUfqmCbyThoQy6o">https://groups.goog=
le.com/d/msgid/jailhouse-dev/23a9c30e-5507-449e-9589-697904becac4n%40google=
groups.com?utm_medium=3Demail&amp;utm_source=3Dfooter</a>&gt;.
<br></blockquote></div>

<p></p>

-- <br />
You received this message because you are subscribed to the Google Groups &=
quot;Jailhouse&quot; group.<br />
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to <a href=3D"mailto:jailhouse-dev+unsubscribe@googlegroups.com">jailh=
ouse-dev+unsubscribe@googlegroups.com</a>.<br />
To view this discussion on the web visit <a href=3D"https://groups.google.c=
om/d/msgid/jailhouse-dev/bbd32aa2-053e-40a2-b4d5-2326238d0793n%40googlegrou=
ps.com?utm_medium=3Demail&utm_source=3Dfooter">https://groups.google.com/d/=
msgid/jailhouse-dev/bbd32aa2-053e-40a2-b4d5-2326238d0793n%40googlegroups.co=
m</a>.<br />

------=_Part_20639_468047453.1705064841332--

------=_Part_20638_1213602568.1705064841332
Content-Type: text/x-csrc; charset=US-ASCII; name=linux_guest2.c
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename=linux_guest2.c
X-Attachment-Id: c8f637cd-9f16-42e1-b197-7a78bb400409
Content-ID: <c8f637cd-9f16-42e1-b197-7a78bb400409>

/*
 * Jailhouse, a Linux-based partitioning hypervisor
 *
 * Configuration for Linux inmate, 1 CPU, 74 MB RAM, ~1MB shmem, serial ports
 *
 * Copyright (c) Siemens AG, 2013-2015
 *
 * Authors:
 *  Jan Kiszka <jan.kiszka@siemens.com>
 *
 * This work is licensed under the terms of the GNU GPL, version 2.  See
 * the COPYING file in the top-level directory.
 */

#include <jailhouse/types.h>
#include <jailhouse/cell-config.h>

struct {
	struct jailhouse_cell_desc cell;
	__u64 cpus[1];
	struct jailhouse_memory mem_regions[3];
	struct jailhouse_pci_device pci_devices[0];
	struct jailhouse_pio pio_regions[1];

} __attribute__((packed)) config = {
	.cell = {
		.signature = JAILHOUSE_CELL_DESC_SIGNATURE,
		.revision = JAILHOUSE_CONFIG_REVISION,
		.architecture = JAILHOUSE_X86,
		.name = "linux-2",
		.flags = JAILHOUSE_CELL_PASSIVE_COMMREG |
			 JAILHOUSE_CELL_VIRTUAL_CONSOLE_ACTIVE,

		.cpu_set_size = sizeof(config.cpus),
		.num_memory_regions = ARRAY_SIZE(config.mem_regions),
		.num_pci_devices = ARRAY_SIZE(config.pci_devices),
		.num_pio_regions = ARRAY_SIZE(config.pio_regions),
		
		.console = {
			.address = 0x3f8,
			.type = JAILHOUSE_CON_TYPE_8250,
			.flags = JAILHOUSE_CON_ACCESS_PIO,
		},
	},
	 	
	.cpus = {
		0b1100000000,
	},


	.mem_regions = {
		/* low RAM */ 
		{
			.phys_start = 0x42000000,
			.virt_start = 0,
			//.size = 0x00100000, gives continuous error output
			.size = 0x00200000,
			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
				JAILHOUSE_MEM_EXECUTE |
				JAILHOUSE_MEM_LOADABLE,
		},
		/* communication region */ 
		{
			.virt_start = 0x00200000,
			.size = 0x00001000,
			.flags = JAILHOUSE_MEM_READ |  JAILHOUSE_MEM_WRITE |
				JAILHOUSE_MEM_COMM_REGION,
		},
		
		/* high RAM */
		{
			.phys_start = 0x42300000,
			.virt_start = 0x42300000,		
			.size = 0x11000000,
			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
				JAILHOUSE_MEM_EXECUTE |
				JAILHOUSE_MEM_LOADABLE,
		},
		/* IVSHMEM shared memory regions (networking) */
	//	JAILHOUSE_SHMEM_NET_REGIONS(0x4a100000, 1),
	},
		

		.pio_regions = {
			 /*Port I/O: serial 1 */
			 PIO_RANGE(0x3f8, 0x8),
		},
	
	
	/*	.pci_devices = {
			 IVSHMEM: 00:12.0 
		{
			.type = JAILHOUSE_PCI_TYPE_IVSHMEM,
			.iommu = 1,
			.domain = 0x0,
			.bdf = 0x12 << 3,
			.bar_mask = JAILHOUSE_IVSHMEM_BAR_MASK_MSIX,
			.num_msix_vectors = 2,
			.shmem_regions_start = 3,
			.shmem_dev_id = 1, 
			.shmem_peers = 2,
			.shmem_protocol = JAILHOUSE_SHMEM_PROTO_VETH,
		},
	},*/
		};

------=_Part_20638_1213602568.1705064841332--
