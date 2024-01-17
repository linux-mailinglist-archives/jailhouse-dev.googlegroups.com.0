Return-Path: <jailhouse-dev+bncBDIJ36FET4JRB3H6T2WQMGQE6IVO23Q@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-yb1-xb3e.google.com (mail-yb1-xb3e.google.com [IPv6:2607:f8b0:4864:20::b3e])
	by mail.lfdr.de (Postfix) with ESMTPS id D2B008304C5
	for <lists+jailhouse-dev@lfdr.de>; Wed, 17 Jan 2024 12:52:18 +0100 (CET)
Received: by mail-yb1-xb3e.google.com with SMTP id 3f1490d57ef6-dc2470bc0bdsf113347276.1
        for <lists+jailhouse-dev@lfdr.de>; Wed, 17 Jan 2024 03:52:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20230601; t=1705492332; x=1706097132; darn=lfdr.de;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:x-original-sender:mime-version
         :subject:references:in-reply-to:message-id:to:from:date:sender:from
         :to:cc:subject:date:message-id:reply-to;
        bh=8UMW8O7MRX2i/AlRcyrYeohBU6pOLMCMkBHukkWkub0=;
        b=wTnPIdh/Ymwh1ngfolKv1ScD1zW0d4q4cVyvuZQG7Y9vLatik/xIyOLNGo6Fo2tgCy
         T6KEa0mWdbUx587+O1VzME6TmNeXqQTNKwyBOF/V3HSZ20NlYkHBsrSBnCa+blnlC7Iz
         3tZyX3RkEwmNiemS4M809TriDbXNBWAJM1dWIOsD7WJgr7wxYDZYl13pFpDDCGwN2YOf
         VbuS07XJhwflEn4sInNv8KIFLC43SPF6AClEY8jkTgXM/l03SE4gSfTobeqiQAI14pos
         roW8/bF8lVnVclp68V92EmFHouXLsowkADuPAah4VwTfQgIVfhlb4s7Ko6fNMRaEac6r
         wrkQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1705492332; x=1706097132; darn=lfdr.de;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:x-original-sender:mime-version
         :subject:references:in-reply-to:message-id:to:from:date:from:to:cc
         :subject:date:message-id:reply-to;
        bh=8UMW8O7MRX2i/AlRcyrYeohBU6pOLMCMkBHukkWkub0=;
        b=U9lTBFGu6mnTfsbKM6cvoEs5P3JZD97hJej0ugyGhEfJ3nPNR/vXBZf+lF0heLFemx
         Femgp/lJ9c7DN9Sn+NN2Epp/je267sylAvif8dWBF+oQ/iySbWRt/twzN444sHjMED2b
         tPAvb6Hl5wEGHz8Mgdyj/A+JxlPgnqkmqEKTccEkGntbysb1OEuQ3MfFsKUEQOWQ+rFN
         gWk/4gAlGmcasRjBXnzZ9lVAkBMv4PsgaSEMy7whTyd34jsIjZJy9R5JrY25hvRM0Kjz
         IRSjFSRjOOxPrqmKoe93lgt8Ql9LwwQO42Pmuj8kzM5Op4XUKldtOcOiFu9Krt79NWny
         +XNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1705492332; x=1706097132;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :x-spam-checked-in-group:list-id:mailing-list:precedence
         :x-original-sender:mime-version:subject:references:in-reply-to
         :message-id:to:from:date:x-beenthere:x-gm-message-state:sender:from
         :to:cc:subject:date:message-id:reply-to;
        bh=8UMW8O7MRX2i/AlRcyrYeohBU6pOLMCMkBHukkWkub0=;
        b=D87QFKjlyBlKNHgQ0U3sHn7B80b/uXTPXOlE5FzpsaRtfI4rGBEdebzckRepN+E36c
         5IKwkz4AyC+51RIN7+Ol3aKc5dmh+xXL9XFPnW6HYZPjRm/jMHKwM0AwsQR7KS+FAKDV
         mXVBGM4YlJKytVdw7MRr+LdmDbOXUANXHUCmQQNgw/veuTEc0gL4FQLfbZejZP+BU9Ya
         rxU+q5Sj/3h9ssjjgaPlxazP5zxmCBKkOw0s4J1rV2UQ5h/L/2p43o154M8e4fMczF71
         fijN5LD12bUShsLFYv7Cee6tO7acpTxPY/2qq9GsmjoMnpmS1ZfFVYE+sD6a0I4Ah2Wd
         HYpw==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AOJu0Yy65gjXcON9du5GjMZmz2KSaU4ZX7evflqWhLIEtamFnHcEvvhS
	r2WFbyexEKh9cERdIYY3FfA=
X-Google-Smtp-Source: AGHT+IHs4qkZMjQq5fH88Y966o/CMWc5/9UGhnEmE/F+RbULzsegpYjIR6+XQA3hA+5BQdiiQ/mb0Q==
X-Received: by 2002:a05:6902:240b:b0:dc2:392e:3ce0 with SMTP id dr11-20020a056902240b00b00dc2392e3ce0mr934428ybb.92.1705492332554;
        Wed, 17 Jan 2024 03:52:12 -0800 (PST)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a25:e0c5:0:b0:dc2:1e08:bec with SMTP id x188-20020a25e0c5000000b00dc21e080becls7573ybg.1.-pod-prod-08-us;
 Wed, 17 Jan 2024 03:52:11 -0800 (PST)
X-Received: by 2002:a0d:eec5:0:b0:5e8:bea4:4d37 with SMTP id x188-20020a0deec5000000b005e8bea44d37mr4466979ywe.7.1705492331020;
        Wed, 17 Jan 2024 03:52:11 -0800 (PST)
Date: Wed, 17 Jan 2024 03:52:10 -0800 (PST)
From: =?UTF-8?Q?Michele_Pescap=C3=A8?= <mic.pescape@gmail.com>
To: Jailhouse <jailhouse-dev@googlegroups.com>
Message-Id: <0f1154fe-f680-47e6-a3da-9e1a37fd1f55n@googlegroups.com>
In-Reply-To: <5fc9ef1f-e7ca-496f-aab5-c085c4586326@oth-regensburg.de>
References: <824bacc4-b7ae-47c9-878e-7203214b4fc3n@googlegroups.com>
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
 <78750023-1199-41e6-bee9-549c185d160c@oth-regensburg.de>
 <6fb04e63-2f4a-4d5b-9139-c11e9a9fc461n@googlegroups.com>
 <5fc9ef1f-e7ca-496f-aab5-c085c4586326@oth-regensburg.de>
Subject: Re: Unable to start non root linux cell
MIME-Version: 1.0
Content-Type: multipart/mixed; 
	boundary="----=_Part_24982_23890251.1705492330200"
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

------=_Part_24982_23890251.1705492330200
Content-Type: multipart/alternative; 
	boundary="----=_Part_24983_1672958424.1705492330200"

------=_Part_24983_1672958424.1705492330200
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi,=20

I checked again the configs with jailhouse config check and nothing came=20
up. I'm attaching the configurations.

Thanks,
Michele

Il giorno mercoled=C3=AC 17 gennaio 2024 alle 11:52:18 UTC+1 Ralf Ramsauer =
ha=20
scritto:

> Hi Michele,
>
> On 16/01/2024 20:44, Michele Pescap=C3=A8 wrote:
> > Hi,
> >=20
> > I'm trying to give network access to the non root cell, however it seem=
s=20
> > that I'm not able to pass the right PCI device. It always defaults to=
=20
> > taking away the 00:00.0 pci device from the root cell causing a crash=
=20
> > for the root cell.
> >=20
> > In both the root and non root cell's configs I added the shared memory=
=20
> > regions using the macro JAILHOUSE_SHMEM_NET_REGIONS(0x60000000, 0) for=
=20
> > the root and using dev_id=3D1 for the non root. The resulting regions d=
o=20
> > not overlap other memory regions, config check does not return any=20
> errors.
> >=20
> > I also added the following PCI device in both cells, where=20
> > .shmem_regions_start is assigned to the correct index for the first=20
> > shared memory region created using the aforementioned macro.
> >=20
> > /* IVSHMEM: 00:05.0 */
> > {
> > .type =3D JAILHOUSE_PCI_TYPE_IVSHMEM,
> > .domain =3D 0x0,
> > .bdf =3D 0x28,
>
> [=E2=80=A6]
>
> > .bar_mask =3D JAILHOUSE_IVSHMEM_BAR_MASK_MSIX,
> > .num_msix_vectors =3D 2,
> > .shmem_regions_start =3D 0,
> > .shmem_dev_id =3D 0,   (1 in the non root cell)
> > .shmem_peers =3D 2,
> > .shmem_protocol =3D JAILHOUSE_SHMEM_PROTO_VETH,
> > },
> >=20
> > I tried using different values for the .bdf, none of which were already=
=20
> > used by other devices but none worked. The root cell always sees the ne=
w=20
> > device correctly when starting the hypervisor, I can also see it with=
=20
> > lspci and ifconfig, however once I issue the cell linux command to star=
t=20
> > the non root cell, I get the following output followed by a streak of=
=20
> > errors from the hypervisor, forcing a manual reset.
> >=20
> > Removing PCI device 00:00.0 from cell "RootCell"
> > Adding PCI device 00:00.0 to cell "linux-1"
>
> .bdf =3D 0x28 doesn't correspond with 00:00.0. Would you please test your=
=20
> current configs against jailhouse-config-check, and in case of no=20
> errors, would you please attach the current versions again?
>
> Thanks,
> Ralf
>
> > FATAL: unable to get MMIO instruction
> > FATAL: Invalid MMIO/RAM write, addr: 0x0000000106d8c020 size: 0
> > RIP: 0xffffffffa910ff4c RSP: 0xffffab85400f7de0 FLAGS: 93
> > RAX: 0x0000000000000000 RBX: 0x000000000002f170 RCX: 0x0000000000000040
> > RDX: 0x0000000000000414 RSI: 0xffff8b6000955400 RDI: 0x0000000000000001
> > CS: 10 BASE: 0x0000000000000000 AR-BYTES: 29b EFER.LMA 1
> > CR0: 0x0000000080050033 CR3: 0x0000000106d8c000 CR4: 0x00000000003506a0
> > EFER: 0x0000000000001d01
> > Parking CPU 4 (Cell: "RootCell")
> > (etc..)
> >=20
> > I'm not sure what I'm missing here, CONFIG_IVSHMEM_NET is enabled in=20
> > both the root and non root kernel config, I also enabled=20
> > CONFIG_PCI_HOST_GENERIC in the root linux as suggested in one of the=20
> > conversations on this site.
> >=20
> > Thanks,
> > Michele
> >=20
> >=20
> > Il giorno domenica 14 gennaio 2024 alle 15:49:40 UTC+1 Ralf Ramsauer ha=
=20
> > scritto:
> >=20
> > Hi Michele,
> >=20
> > On 14/01/2024 02:18, Michele Pescap=C3=A8 wrote:
> > > Hi,
> > >
> > > There were PIO writes to ports 4e,4f,2e and 2f, each of size 1
> > and each
> > > one on subsequent restarts. I'm not sure how to figure out what they
> > > belong to.
> >=20
> > Easy and straight forward: Read the jailhouse crash dump.
> >=20
> > Look at the program counter, and maybe the return address. Disassemble
> > your kernel (objdump -d vmlinux) and lookup that address. Now you know
> > the name of the routine in the kernel that caused the crash.
> >=20
> > Don't simply whitelist ports. Only whitelist them, if you're sure what
> > you're doing.
> >=20
> > >
> > > CONFIG_ISA_DMA_API is already disabled.
> > >
> > > I missed the irqchip for the uart. However as of right now I just
> > copied
> > > the whole fragment from the root configuration which means I
> > could be
> > > taking away other interrupts from the root cell, I still have to
> > figure
> > > out how to tune that
> > >
> > > /* IOAPIC 13, GSI base 0 */
> > > {
> > > .address =3D 0xfec00000,
> > > .id =3D 0xa0,
> > > .pin_bitmap =3D {
> > > 0xffffffff, 0xffffffff, 0xffffffff, 0xffffffff
> >=20
> > With this, you take away ALL interrupts from the root cell, which you
> > don't want to do, you only want to take away the interrupt that
> > corresponds to ttyS0 (i.e. Port 0x3f8).
> >=20
> > See here: https://en.wikipedia.org/wiki/COM_(hardware_interface)
> > <https://en.wikipedia.org/wiki/COM_(hardware_interface)>
> >=20
> > COM1: I/O port 0x3F8, IRQ 4
> >=20
> > So you want to only assign IRQ 4 to your non-root cell. See
> > linux-x86-demo.c to see how that works.
> >=20
> > > },
> > > },
> > >
> > > Still, now I can finally login into the non root linux.
> >=20
> > Excellent!
> >=20
> > Ralf
> >=20
> > >
> > > Thanks,
> > > Michele
> > >
> > > Il giorno sabato 13 gennaio 2024 alle 21:09:28 UTC+1 Ralf
> > Ramsauer ha
> > > scritto:
> > >
> > > Hi Michele,
> > >
> > > On 13/01/2024 18:08, Michele Pescap=C3=A8 wrote:
> > > > Hi,
> > > >
> > > > The problem was that the ram regions in the non root configuration
> > > > weren't detected as such because of the missing JAILHOUSE_MEM_DMA
> > > flag.
> > >
> > > Yikes, makes sense.
> > >
> > > > After adding that, I also had to add two pio_regions because
> > the non
> > > > root linux was crashing because of two ports which aren't
> > present in
> > > > /proc/ioports.
> > >
> > > Uhm - which PIO ports? Don't simply assign PIO ports. There must
> > be a
> > > reason for them. What ports did crash?
> > >
> > > Did you disable(!) CONFIG_ISA_DMA_API? Please disable it. Therefore,
> > > you
> > > have to activate CONFIG_EXPERT first.
> > >
> > > I *bet* it was i8237=E2=80=A6
> > >
> > > > I also had to add mce=3Doff to the command line because i had an
> > > unhandled
> > >
> > > or disable CONFIG_X86_MCE.
> > >
> > > > MSR error, I'll have to disable that in the kernel config.
> > > > At this point the non root linux seems to start, I see the boot
> > > log. No
> > >
> > > Excellent!
> > >
> > > > way of interacting with it as there is not a login prompt or
> > > anything, I
> > > > think I need to ssh to the cell at this point, right?
> > >
> > > Was the initramdisk loaded correctly?
> > >
> > > Did you assign - in your non-root cell config - the irqchip and the
> > > corresponding interrupts of the uart?
> > >
> > > > That means I'll now need to work on those ivshmem net devices.
> > >
> > > If you need ivshmem, then this would be the next step.
> > >
> > > Ralf
> > >
> > > >
> > > > Thanks,
> > > > Michele
> > > >
> > > > Il giorno sabato 13 gennaio 2024 alle 15:13:12 UTC+1 Ralf
> > > Ramsauer ha
> > > > scritto:
> > > >
> > > > Hi,
> > > >
> > > > On 13/01/2024 12:28, Michele Pescap=C3=A8 wrote:
> > > > > Hi,
> > > > >
> > > > > You are right, I got confused about those addresses, my bad. At
> > > > least
> > > > > now I know that config is the correct one and I don't have to
> > > tinker
> > > > > with it.
> > > > > I'm back to a kernel panic from the inmate when booting the
> > cell.
> > > > It's
> > > > > similar to the one I had earlier, not sure yet of what the
> > > > problem may be.
> > > >
> > > > Great, we're a step further.
> > > >
> > > > >
> > > > > Created cell "linux-2"
> > > > > Page pool usage after cell creation: mem 406/32211, remap
> > > > 16392/131072
> > > > > Cell "linux-2" can be loaded
> > > > > CPU 9 received SIPI, vector 100
> > > > > Started cell "linux-2"
> > > > > CPU 8 received SIPI, vector 100
> > > > > No EFI environment detected.
> > > > > early console in extract_kernel
> > > > > input_data: 0x000000000275c308
> > > > > input_len: 0x00000000008b0981
> > > > > output: 0x0000000001000000
> > > > > output_len: 0x0000000001fccb30
> > > > > kernel_total_size: 0x0000000001e28000
> > > > > needed_size: 0x0000000002000000
> > > > > trampoline_32bit: 0x000000000009d000
> > > > >
> > > > > Decompressing Linux... Parsing ELF... done.
> > > > > Booting the kernel.
> > > > > [    0.000000] Linux version 6.2.0-rc3 (root@mp-LINUX-DESKTOP)
> > > > > (x86_64-buildroot       -linux-gnu-gcc.br_real (Buildroot
> > 2023.11)
> > > > > 12.3.0, GNU ld (GNU Binutils) 2.40) #       2 SMP
> > PREEMPT_DYNAMIC
> > > > Fri
> > > > > Jan 12 17:36:57 CET 2024
> > > > > [    0.000000] Command line: earlyprintk=3DttyS0,115200
> > > > > [    0.000000] KERNEL supported cpus:
> > > > > [    0.000000]   Intel GenuineIntel
> > > > > [    0.000000]   AMD AuthenticAMD
> > > > > [    0.000000] x86/fpu: Supporting XSAVE feature 0x001: 'x87
> > > > floating
> > > > > point regi       sters'
> > > > > [    0.000000] x86/fpu: Supporting XSAVE feature 0x002: 'SSE
> > > > registers'
> > > > > [    0.000000] x86/fpu: Supporting XSAVE feature 0x004: 'AVX
> > > > registers'
> > > > > [    0.000000] x86/fpu: xstate_offset[2]:  576, xstate_sizes[2]:
> > > >  256
> > > > > [    0.000000] x86/fpu: Enabled xstate features 0x7, context
> > size
> > > > is 832
> > > > > bytes,        using 'compacted' format.
> > > > > [    0.000000] signal: max sigframe size: 1360
> > > > > [    0.000000] BIOS-provided physical RAM map:
> > > > > [    0.000000] BIOS-e801: [mem
> > > > 0x0000000000000000-0x000000000009efff] usable
> > > >
> > > > Okay, here should be all memory regions listed. My non-root Linux
> > > in my
> > > > Qemu VM, for example, shows here:
> > > >
> > > > [ 0.000000] BIOS-provided physical RAM map:
> > > > [ 0.000000] BIOS-e820: [mem 0x0000000000000000-0x00000000000fffff]
> > > > usable
> > > > [ 0.000000] BIOS-e820: [mem 0x0000000000100000-0x0000000000100fff]
> > > > reserved
> > > > [ 0.000000] BIOS-e820: [mem 0x0000000000200000-0x00000000048fffff]
> > > > usable
> > > >
> > > > Are you absolutely sure, that you have no further modifications in
> > > > Jailhouse or the Linux loader?
> > > >
> > > > Actually, in your case, there should be e820 as well (instead of
> > > e801).
> > > > Go to the Linux kernel sources, have a look at
> > > > arch/x86/kernel/e820.c:1279
> > > >
> > > > and Jailhouse's jailhouse-cell-linux:638.
> > > >
> > > > jailhouse-cell-linux fills information of all memory regions into
> > > the
> > > > zero page. Would you please instrument code (Linux/Jailhouse)
> > to see
> > > > where those regions are not parsed?
> > > >
> > > > > [    0.000000] printk: bootconsole [earlyser0] enabled
> > > > > [    0.000000] NX (Execute Disable) protection: active
> > > > > [    0.000000] extended physical RAM map:
> > > > > [    0.000000] reserve setup_data: [mem
> > > > > 0x0000000000000000-0x0000000000001fff] u       sable
> > > > > [    0.000000] reserve setup_data: [mem
> > > > > 0x0000000000002000-0x000000000000212b] u       sable
> > > > > [    0.000000] reserve setup_data: [mem
> > > > > 0x000000000000212c-0x000000000009efff] u       sable
> > > > > [    0.000000] DMI not present or invalid.
> > > > > [    0.000000] Hypervisor detected: Jailhouse
> > > >
> > > > Just guessing loud: Hmm, you have guest support enabled, that's
> > > not the
> > > > issue.
> > > >
> > > > > [    0.000000] tsc: Detected 3393.624 MHz processor
> > > > > [    0.000017] .text .data .bss are not marked as E820_TYPE_RAM!
> > > >
> > > > Here's the next error that makes me curious, why you system falls
> > > back
> > > > to E801...
> > > >
> > > > > [    0.005745] last_pfn =3D 0x2e28 max_arch_pfn =3D 0x400000000
> > > > > [    0.011025] x86/PAT: PAT support disabled because
> > > > CONFIG_X86_PAT is
> > > > > disabled        in the kernel.
> > > >
> > > > Please enable CONFIG_X86_PAT and MTRR in your kernel.
> > > >
> > > > > [    0.019362] x86/PAT: Configuration [0-7]: WB  WT  UC- UC  WB
> > > >  WT  UC- UC
> > > > > [    0.034867] Using GB pages for direct mapping
> > > > > [    0.039193] Kernel panic - not syncing: alloc_low_pages: can
> > > not
> > > > > alloc memory
> > > >
> > > > Yeah, that's the logical aftereffect after the errors above.
> > > >
> > > > Thanks,
> > > > Ralf
> > > >
> > > > > [    0.046183] CPU: 0 PID: 0 Comm: swapper Not tainted
> > > 6.2.0-rc3 #2
> > > > > [    0.052176] Call Trace:
> > > > > [    0.054606]  <TASK>
> > > > > [    0.056691]  ? dump_stack_lvl+0x33/0x4e
> > > > > [    0.060510]  ? panic+0x157/0x303
> > > > > [    0.063723]  ? sprintf+0x56/0x80
> > > > > [    0.066936]  ? alloc_low_pages+0x70/0x1a0
> > > > > [    0.070930]  ? phys_pmd_init+0x1fc/0x2eb
> > > > > [    0.074839]  ? phys_pud_init+0x116/0x2d3
> > > > > [    0.078744]  ? __kernel_physical_mapping_init+0x11a/0x290
> > > > > [    0.084128]  ? init_memory_mapping+0x25e/0x3b0
> > > > > [    0.088558]  ? init_range_memory_mapping+0xe7/0x145
> > > > > [    0.093417]  ? init_mem_mapping+0x242/0x298
> > > > > [    0.097585]  ? setup_arch+0x74e/0xcbd
> > > > > [    0.101231]  ? start_kernel+0x66/0x8b7
> > > > > [    0.104965]  ? load_ucode_bsp+0x43/0x11b
> > > > > [    0.108873]  ? secondary_startup_64_no_verify+0xe0/0xeb
> > > > > [    0.114085]  </TASK>
> > > > > [    0.116255] ---[ end Kernel panic - not syncing:
> > > > alloc_low_pages: can
> > > > > not all       oc memory ]---
> > > > >
> > > > >
> > > > > Thank you for your continuous support,
> > > > > Michele
> > > > >
> > > > > Il giorno sabato 13 gennaio 2024 alle 00:05:43 UTC+1 Ralf
> > > > Ramsauer ha
> > > > > scritto:
> > > > >
> > > > > Hi Michele,
> > > > >
> > > > > On 12/01/2024 14:07, Michele Pescap=C3=A8 wrote:
> > > > > > jailhouse cell load linux-2 linux-loader.bin -a 0x0
> > > > > > ../buildroot-2023.11/output/images/bzImage -a 0xffbe00
> > > parameters
> > > > > -a 0x1000
> > > > > > jailhouse cell start linux-2
> > > > > >
> > > > > > I take it the kernel is loaded at 0xffbe00 which is right
> > at the
> > > > > edge of
> > > > > > the low ram region. In fact after issuing the cell load
> > command
> > > > and
> > > > > > adjusting the path for the loader I get JAILHOUSE_CELL_LOAD:
> > > > Invalid
> > > > > > argument.
> > > > >
> > > > > Just tested cell-linux in a qemu machine, there it works, with
> > > > pretty
> > > > > similar addresses, which got me confused.
> > > > >
> > > > > After double-checking it: 0xffb.e00 is *not* at the edge of low
> > > mem:
> > > > >
> > > > > Low mem is 0x000.000 -- 0x0ff.fff
> > > > > Comm region is 0x100.000 -- 0x100.fff
> > > > >
> > > > > 0xffb.e00 is (obviously) way above.
> > > > >
> > > > > Please try to set your high mem's .virt_start to 0x200000. Then,
> > > > > 0xffbe00 is offsetted ~16MB inside your highmem, and it should
> > > work!
> > > > >
> > > > > IOW:
> > > > >
> > > > > /* high RAM */
> > > > > {
> > > > > .phys_start =3D 0x42300000,
> > > > > .virt_start =3D 0x200000,
> > > > > .size =3D 0x11000000,
> > > > > .flags =3D JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
> > > > > JAILHOUSE_MEM_EXECUTE |
> > > > > JAILHOUSE_MEM_LOADABLE,
> > > > > },
> > > > >
> > > > > Thanks
> > > > > Ralf
> > > > >
> > > > > --
> > > > > You received this message because you are subscribed to the
> > Google
> > > > > Groups "Jailhouse" group.
> > > > > To unsubscribe from this group and stop receiving emails from
> > it,
> > > > send
> > > > > an email to jailhouse-de...@googlegroups.com
> > > > > <mailto:jailhouse-de...@googlegroups.com>.
> > > > > To view this discussion on the web visit
> > > > >
> > > >
> > >
> >=20
> https://groups.google.com/d/msgid/jailhouse-dev/6712361a-eaef-49cc-8a72-7=
9da2c434169n%40googlegroups.com=20
> <
> https://groups.google.com/d/msgid/jailhouse-dev/6712361a-eaef-49cc-8a72-7=
9da2c434169n%40googlegroups.com>=20
> <
> https://groups.google.com/d/msgid/jailhouse-dev/6712361a-eaef-49cc-8a72-7=
9da2c434169n%40googlegroups.com=20
> <
> https://groups.google.com/d/msgid/jailhouse-dev/6712361a-eaef-49cc-8a72-7=
9da2c434169n%40googlegroups.com>>=20
> <
> https://groups.google.com/d/msgid/jailhouse-dev/6712361a-eaef-49cc-8a72-7=
9da2c434169n%40googlegroups.com=20
> <
> https://groups.google.com/d/msgid/jailhouse-dev/6712361a-eaef-49cc-8a72-7=
9da2c434169n%40googlegroups.com>=20
> <
> https://groups.google.com/d/msgid/jailhouse-dev/6712361a-eaef-49cc-8a72-7=
9da2c434169n%40googlegroups.com=20
> <
> https://groups.google.com/d/msgid/jailhouse-dev/6712361a-eaef-49cc-8a72-7=
9da2c434169n%40googlegroups.com>>>=20
> <
> https://groups.google.com/d/msgid/jailhouse-dev/6712361a-eaef-49cc-8a72-7=
9da2c434169n%40googlegroups.com?utm_medium=3Demail&utm_source=3Dfooter=20
> <
> https://groups.google.com/d/msgid/jailhouse-dev/6712361a-eaef-49cc-8a72-7=
9da2c434169n%40googlegroups.com?utm_medium=3Demail&utm_source=3Dfooter>=20
> <
> https://groups.google.com/d/msgid/jailhouse-dev/6712361a-eaef-49cc-8a72-7=
9da2c434169n%40googlegroups.com?utm_medium=3Demail&utm_source=3Dfooter=20
> <
> https://groups.google.com/d/msgid/jailhouse-dev/6712361a-eaef-49cc-8a72-7=
9da2c434169n%40googlegroups.com?utm_medium=3Demail&utm_source=3Dfooter>>=20
> <
> https://groups.google.com/d/msgid/jailhouse-dev/6712361a-eaef-49cc-8a72-7=
9da2c434169n%40googlegroups.com?utm_medium=3Demail&utm_source=3Dfooter=20
> <
> https://groups.google.com/d/msgid/jailhouse-dev/6712361a-eaef-49cc-8a72-7=
9da2c434169n%40googlegroups.com?utm_medium=3Demail&utm_source=3Dfooter>=20
> <
> https://groups.google.com/d/msgid/jailhouse-dev/6712361a-eaef-49cc-8a72-7=
9da2c434169n%40googlegroups.com?utm_medium=3Demail&utm_source=3Dfooter=20
> <
> https://groups.google.com/d/msgid/jailhouse-dev/6712361a-eaef-49cc-8a72-7=
9da2c434169n%40googlegroups.com?utm_medium=3Demail&utm_source=3Dfooter
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
> https://groups.google.com/d/msgid/jailhouse-dev/860c1e75-c28f-4157-9212-a=
3d87ad25b27n%40googlegroups.com=20
> <
> https://groups.google.com/d/msgid/jailhouse-dev/860c1e75-c28f-4157-9212-a=
3d87ad25b27n%40googlegroups.com>=20
> <
> https://groups.google.com/d/msgid/jailhouse-dev/860c1e75-c28f-4157-9212-a=
3d87ad25b27n%40googlegroups.com=20
> <
> https://groups.google.com/d/msgid/jailhouse-dev/860c1e75-c28f-4157-9212-a=
3d87ad25b27n%40googlegroups.com>>=20
> <
> https://groups.google.com/d/msgid/jailhouse-dev/860c1e75-c28f-4157-9212-a=
3d87ad25b27n%40googlegroups.com?utm_medium=3Demail&utm_source=3Dfooter=20
> <
> https://groups.google.com/d/msgid/jailhouse-dev/860c1e75-c28f-4157-9212-a=
3d87ad25b27n%40googlegroups.com?utm_medium=3Demail&utm_source=3Dfooter>=20
> <
> https://groups.google.com/d/msgid/jailhouse-dev/860c1e75-c28f-4157-9212-a=
3d87ad25b27n%40googlegroups.com?utm_medium=3Demail&utm_source=3Dfooter=20
> <
> https://groups.google.com/d/msgid/jailhouse-dev/860c1e75-c28f-4157-9212-a=
3d87ad25b27n%40googlegroups.com?utm_medium=3Demail&utm_source=3Dfooter
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
> https://groups.google.com/d/msgid/jailhouse-dev/6146e208-1e8c-4335-abaf-9=
a2be8c85be5n%40googlegroups.com=20
> <
> https://groups.google.com/d/msgid/jailhouse-dev/6146e208-1e8c-4335-abaf-9=
a2be8c85be5n%40googlegroups.com>=20
> <
> https://groups.google.com/d/msgid/jailhouse-dev/6146e208-1e8c-4335-abaf-9=
a2be8c85be5n%40googlegroups.com?utm_medium=3Demail&utm_source=3Dfooter=20
> <
> https://groups.google.com/d/msgid/jailhouse-dev/6146e208-1e8c-4335-abaf-9=
a2be8c85be5n%40googlegroups.com?utm_medium=3Demail&utm_source=3Dfooter
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
> https://groups.google.com/d/msgid/jailhouse-dev/6fb04e63-2f4a-4d5b-9139-c=
11e9a9fc461n%40googlegroups.com=20
> <
> https://groups.google.com/d/msgid/jailhouse-dev/6fb04e63-2f4a-4d5b-9139-c=
11e9a9fc461n%40googlegroups.com?utm_medium=3Demail&utm_source=3Dfooter
> >.
>

--=20
You received this message because you are subscribed to the Google Groups "=
Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/=
jailhouse-dev/0f1154fe-f680-47e6-a3da-9e1a37fd1f55n%40googlegroups.com.

------=_Part_24983_1672958424.1705492330200
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi, <br /><br />I checked again the configs with jailhouse config check and=
 nothing came up. I'm attaching the configurations.<br /><br />Thanks,<br /=
>Michele<br /><br /><div class=3D"gmail_quote"><div dir=3D"auto" class=3D"g=
mail_attr">Il giorno mercoled=C3=AC 17 gennaio 2024 alle 11:52:18 UTC+1 Ral=
f Ramsauer ha scritto:<br/></div><blockquote class=3D"gmail_quote" style=3D=
"margin: 0 0 0 0.8ex; border-left: 1px solid rgb(204, 204, 204); padding-le=
ft: 1ex;">Hi Michele,
<br>
<br>On 16/01/2024 20:44, Michele Pescap=C3=A8 wrote:
<br>&gt; Hi,
<br>&gt;=20
<br>&gt; I&#39;m trying to give network access to the non root cell, howeve=
r it seems=20
<br>&gt; that I&#39;m not able to pass the right PCI device. It always defa=
ults to=20
<br>&gt; taking away the 00:00.0 pci device from the root cell causing a cr=
ash=20
<br>&gt; for the root cell.
<br>&gt;=20
<br>&gt; In both the root and non root cell&#39;s configs I added the share=
d memory=20
<br>&gt; regions using the macro JAILHOUSE_SHMEM_NET_REGIONS(0x60000000, 0)=
 for=20
<br>&gt; the root and using dev_id=3D1 for the non root. The resulting regi=
ons do=20
<br>&gt; not overlap other memory regions, config check does not return any=
 errors.
<br>&gt;=20
<br>&gt; I also added the following PCI device in both cells, where=20
<br>&gt; .shmem_regions_start is assigned to the correct index for the firs=
t=20
<br>&gt; shared memory region created using the aforementioned macro.
<br>&gt;=20
<br>&gt; /* IVSHMEM: 00:05.0 */
<br>&gt; {
<br>&gt; .type =3D JAILHOUSE_PCI_TYPE_IVSHMEM,
<br>&gt; .domain =3D 0x0,
<br>&gt; .bdf =3D 0x28,
<br>
<br>[=E2=80=A6]
<br>
<br>&gt; .bar_mask =3D JAILHOUSE_IVSHMEM_BAR_MASK_MSIX,
<br>&gt; .num_msix_vectors =3D 2,
<br>&gt; .shmem_regions_start =3D 0,
<br>&gt; .shmem_dev_id =3D 0, =C2=A0 (1 in the non root cell)
<br>&gt; .shmem_peers =3D 2,
<br>&gt; .shmem_protocol =3D JAILHOUSE_SHMEM_PROTO_VETH,
<br>&gt; },
<br>&gt;=20
<br>&gt; I tried using different values for the .bdf, none of which were al=
ready=20
<br>&gt; used by other devices but none worked. The root cell always sees t=
he new=20
<br>&gt; device correctly when starting the hypervisor, I can also see it w=
ith=20
<br>&gt; lspci and ifconfig, however once I issue the cell linux command to=
 start=20
<br>&gt; the non root cell, I get the following output followed by a streak=
 of=20
<br>&gt; errors from the hypervisor, forcing a manual reset.
<br>&gt;=20
<br>&gt; Removing PCI device 00:00.0 from cell &quot;RootCell&quot;
<br>&gt; Adding PCI device 00:00.0 to cell &quot;linux-1&quot;
<br>
<br>.bdf =3D 0x28 doesn&#39;t correspond with 00:00.0. Would you please tes=
t your=20
<br>current configs against jailhouse-config-check, and in case of no=20
<br>errors, would you please attach the current versions again?
<br>
<br>Thanks,
<br>   Ralf
<br>
<br>&gt; FATAL: unable to get MMIO instruction
<br>&gt; FATAL: Invalid MMIO/RAM write, addr: 0x0000000106d8c020 size: 0
<br>&gt; RIP: 0xffffffffa910ff4c RSP: 0xffffab85400f7de0 FLAGS: 93
<br>&gt; RAX: 0x0000000000000000 RBX: 0x000000000002f170 RCX: 0x00000000000=
00040
<br>&gt; RDX: 0x0000000000000414 RSI: 0xffff8b6000955400 RDI: 0x00000000000=
00001
<br>&gt; CS: 10 BASE: 0x0000000000000000 AR-BYTES: 29b EFER.LMA 1
<br>&gt; CR0: 0x0000000080050033 CR3: 0x0000000106d8c000 CR4: 0x00000000003=
506a0
<br>&gt; EFER: 0x0000000000001d01
<br>&gt; Parking CPU 4 (Cell: &quot;RootCell&quot;)
<br>&gt; (etc..)
<br>&gt;=20
<br>&gt; I&#39;m not sure what I&#39;m missing here, CONFIG_IVSHMEM_NET is =
enabled in=20
<br>&gt; both the root and non root kernel config, I also enabled=20
<br>&gt; CONFIG_PCI_HOST_GENERIC in the root linux as suggested in one of t=
he=20
<br>&gt; conversations on this site.
<br>&gt;=20
<br>&gt; Thanks,
<br>&gt; Michele
<br>&gt;=20
<br>&gt;=20
<br>&gt; Il giorno domenica 14 gennaio 2024 alle 15:49:40 UTC+1 Ralf Ramsau=
er ha=20
<br>&gt; scritto:
<br>&gt;=20
<br>&gt;     Hi Michele,
<br>&gt;=20
<br>&gt;     On 14/01/2024 02:18, Michele Pescap=C3=A8 wrote:
<br>&gt;      &gt; Hi,
<br>&gt;      &gt;
<br>&gt;      &gt; There were PIO writes to ports 4e,4f,2e and 2f, each of =
size 1
<br>&gt;     and each
<br>&gt;      &gt; one on subsequent restarts. I&#39;m not sure how to figu=
re out what they
<br>&gt;      &gt; belong to.
<br>&gt;=20
<br>&gt;     Easy and straight forward: Read the jailhouse crash dump.
<br>&gt;=20
<br>&gt;     Look at the program counter, and maybe the return address. Dis=
assemble
<br>&gt;     your kernel (objdump -d vmlinux) and lookup that address. Now =
you know
<br>&gt;     the name of the routine in the kernel that caused the crash.
<br>&gt;=20
<br>&gt;     Don&#39;t simply whitelist ports. Only whitelist them, if you&=
#39;re sure what
<br>&gt;     you&#39;re doing.
<br>&gt;=20
<br>&gt;      &gt;
<br>&gt;      &gt; CONFIG_ISA_DMA_API is already disabled.
<br>&gt;      &gt;
<br>&gt;      &gt; I missed the irqchip for the uart. However as of right n=
ow I just
<br>&gt;     copied
<br>&gt;      &gt; the whole fragment from the root configuration which mea=
ns I
<br>&gt;     could be
<br>&gt;      &gt; taking away other interrupts from the root cell, I still=
 have to
<br>&gt;     figure
<br>&gt;      &gt; out how to tune that
<br>&gt;      &gt;
<br>&gt;      &gt; /* IOAPIC 13, GSI base 0 */
<br>&gt;      &gt; {
<br>&gt;      &gt; .address =3D 0xfec00000,
<br>&gt;      &gt; .id =3D 0xa0,
<br>&gt;      &gt; .pin_bitmap =3D {
<br>&gt;      &gt; 0xffffffff, 0xffffffff, 0xffffffff, 0xffffffff
<br>&gt;=20
<br>&gt;     With this, you take away ALL interrupts from the root cell, wh=
ich you
<br>&gt;     don&#39;t want to do, you only want to take away the interrupt=
 that
<br>&gt;     corresponds to ttyS0 (i.e. Port 0x3f8).
<br>&gt;=20
<br>&gt;     See here: <a href=3D"https://en.wikipedia.org/wiki/COM_(hardwa=
re_interface)" target=3D"_blank" rel=3D"nofollow" data-saferedirecturl=3D"h=
ttps://www.google.com/url?hl=3Dit&amp;q=3Dhttps://en.wikipedia.org/wiki/COM=
_(hardware_interface)&amp;source=3Dgmail&amp;ust=3D1705577656433000&amp;usg=
=3DAOvVaw0ycJrdcybcwPNquoM6tg3x">https://en.wikipedia.org/wiki/COM_(hardwar=
e_interface)</a>
<br>&gt;     &lt;<a href=3D"https://en.wikipedia.org/wiki/COM_(hardware_int=
erface)" target=3D"_blank" rel=3D"nofollow" data-saferedirecturl=3D"https:/=
/www.google.com/url?hl=3Dit&amp;q=3Dhttps://en.wikipedia.org/wiki/COM_(hard=
ware_interface)&amp;source=3Dgmail&amp;ust=3D1705577656433000&amp;usg=3DAOv=
Vaw0ycJrdcybcwPNquoM6tg3x">https://en.wikipedia.org/wiki/COM_(hardware_inte=
rface)</a>&gt;
<br>&gt;=20
<br>&gt;     COM1: I/O port 0x3F8, IRQ 4
<br>&gt;=20
<br>&gt;     So you want to only assign IRQ 4 to your non-root cell. See
<br>&gt;     linux-x86-demo.c to see how that works.
<br>&gt;=20
<br>&gt;      &gt; },
<br>&gt;      &gt; },
<br>&gt;      &gt;
<br>&gt;      &gt; Still, now I can finally login into the non root linux.
<br>&gt;=20
<br>&gt;     Excellent!
<br>&gt;=20
<br>&gt;     Ralf
<br>&gt;=20
<br>&gt;      &gt;
<br>&gt;      &gt; Thanks,
<br>&gt;      &gt; Michele
<br>&gt;      &gt;
<br>&gt;      &gt; Il giorno sabato 13 gennaio 2024 alle 21:09:28 UTC+1 Ral=
f
<br>&gt;     Ramsauer ha
<br>&gt;      &gt; scritto:
<br>&gt;      &gt;
<br>&gt;      &gt; Hi Michele,
<br>&gt;      &gt;
<br>&gt;      &gt; On 13/01/2024 18:08, Michele Pescap=C3=A8 wrote:
<br>&gt;      &gt; &gt; Hi,
<br>&gt;      &gt; &gt;
<br>&gt;      &gt; &gt; The problem was that the ram regions in the non roo=
t configuration
<br>&gt;      &gt; &gt; weren&#39;t detected as such because of the missing=
=C2=A0JAILHOUSE_MEM_DMA
<br>&gt;      &gt; flag.
<br>&gt;      &gt;
<br>&gt;      &gt; Yikes, makes sense.
<br>&gt;      &gt;
<br>&gt;      &gt; &gt; After adding that, I also had to add two pio_region=
s because
<br>&gt;     the non
<br>&gt;      &gt; &gt; root linux was crashing because of two ports which =
aren&#39;t
<br>&gt;     present in
<br>&gt;      &gt; &gt; /proc/ioports.
<br>&gt;      &gt;
<br>&gt;      &gt; Uhm - which PIO ports? Don&#39;t simply assign PIO ports=
. There must
<br>&gt;     be a
<br>&gt;      &gt; reason for them. What ports did crash?
<br>&gt;      &gt;
<br>&gt;      &gt; Did you disable(!) CONFIG_ISA_DMA_API? Please disable it=
. Therefore,
<br>&gt;      &gt; you
<br>&gt;      &gt; have to activate CONFIG_EXPERT first.
<br>&gt;      &gt;
<br>&gt;      &gt; I *bet* it was i8237=E2=80=A6
<br>&gt;      &gt;
<br>&gt;      &gt; &gt; I also had to add mce=3Doff to the command line bec=
ause i had an
<br>&gt;      &gt; unhandled
<br>&gt;      &gt;
<br>&gt;      &gt; or disable CONFIG_X86_MCE.
<br>&gt;      &gt;
<br>&gt;      &gt; &gt; MSR error, I&#39;ll have to disable that in the ker=
nel config.
<br>&gt;      &gt; &gt; At this point the non root linux seems to start, I =
see the boot
<br>&gt;      &gt; log. No
<br>&gt;      &gt;
<br>&gt;      &gt; Excellent!
<br>&gt;      &gt;
<br>&gt;      &gt; &gt; way of interacting with it as there is not a login =
prompt or
<br>&gt;      &gt; anything, I
<br>&gt;      &gt; &gt; think I need to ssh to the cell at this point, righ=
t?
<br>&gt;      &gt;
<br>&gt;      &gt; Was the initramdisk loaded correctly?
<br>&gt;      &gt;
<br>&gt;      &gt; Did you assign - in your non-root cell config - the irqc=
hip and the
<br>&gt;      &gt; corresponding interrupts of the uart?
<br>&gt;      &gt;
<br>&gt;      &gt; &gt; That means I&#39;ll now need to work on those ivshm=
em net devices.
<br>&gt;      &gt;
<br>&gt;      &gt; If you need ivshmem, then this would be the next step.
<br>&gt;      &gt;
<br>&gt;      &gt; Ralf
<br>&gt;      &gt;
<br>&gt;      &gt; &gt;
<br>&gt;      &gt; &gt; Thanks,
<br>&gt;      &gt; &gt; Michele
<br>&gt;      &gt; &gt;
<br>&gt;      &gt; &gt; Il giorno sabato 13 gennaio 2024 alle 15:13:12 UTC+=
1 Ralf
<br>&gt;      &gt; Ramsauer ha
<br>&gt;      &gt; &gt; scritto:
<br>&gt;      &gt; &gt;
<br>&gt;      &gt; &gt; Hi,
<br>&gt;      &gt; &gt;
<br>&gt;      &gt; &gt; On 13/01/2024 12:28, Michele Pescap=C3=A8 wrote:
<br>&gt;      &gt; &gt; &gt; Hi,
<br>&gt;      &gt; &gt; &gt;
<br>&gt;      &gt; &gt; &gt; You are right, I got confused about those addr=
esses, my bad. At
<br>&gt;      &gt; &gt; least
<br>&gt;      &gt; &gt; &gt; now I know that config is the correct one and =
I don&#39;t have to
<br>&gt;      &gt; tinker
<br>&gt;      &gt; &gt; &gt; with it.
<br>&gt;      &gt; &gt; &gt; I&#39;m back to a kernel panic from the inmate=
 when booting the
<br>&gt;     cell.
<br>&gt;      &gt; &gt; It&#39;s
<br>&gt;      &gt; &gt; &gt; similar to the one I had earlier, not sure yet=
 of what the
<br>&gt;      &gt; &gt; problem may be.
<br>&gt;      &gt; &gt;
<br>&gt;      &gt; &gt; Great, we&#39;re a step further.
<br>&gt;      &gt; &gt;
<br>&gt;      &gt; &gt; &gt;
<br>&gt;      &gt; &gt; &gt; Created cell &quot;linux-2&quot;
<br>&gt;      &gt; &gt; &gt; Page pool usage after cell creation: mem 406/3=
2211, remap
<br>&gt;      &gt; &gt; 16392/131072
<br>&gt;      &gt; &gt; &gt; Cell &quot;linux-2&quot; can be loaded
<br>&gt;      &gt; &gt; &gt; CPU 9 received SIPI, vector 100
<br>&gt;      &gt; &gt; &gt; Started cell &quot;linux-2&quot;
<br>&gt;      &gt; &gt; &gt; CPU 8 received SIPI, vector 100
<br>&gt;      &gt; &gt; &gt; No EFI environment detected.
<br>&gt;      &gt; &gt; &gt; early console in extract_kernel
<br>&gt;      &gt; &gt; &gt; input_data: 0x000000000275c308
<br>&gt;      &gt; &gt; &gt; input_len: 0x00000000008b0981
<br>&gt;      &gt; &gt; &gt; output: 0x0000000001000000
<br>&gt;      &gt; &gt; &gt; output_len: 0x0000000001fccb30
<br>&gt;      &gt; &gt; &gt; kernel_total_size: 0x0000000001e28000
<br>&gt;      &gt; &gt; &gt; needed_size: 0x0000000002000000
<br>&gt;      &gt; &gt; &gt; trampoline_32bit: 0x000000000009d000
<br>&gt;      &gt; &gt; &gt;
<br>&gt;      &gt; &gt; &gt; Decompressing Linux... Parsing ELF... done.
<br>&gt;      &gt; &gt; &gt; Booting the kernel.
<br>&gt;      &gt; &gt; &gt; [ =C2=A0 =C2=A00.000000] Linux version 6.2.0-r=
c3 (root@mp-LINUX-DESKTOP)
<br>&gt;      &gt; &gt; &gt; (x86_64-buildroot =C2=A0 =C2=A0 =C2=A0 -linux-=
gnu-gcc.br_real (Buildroot
<br>&gt;     2023.11)
<br>&gt;      &gt; &gt; &gt; 12.3.0, GNU ld (GNU Binutils) 2.40) # =C2=A0 =
=C2=A0 =C2=A0 2 SMP
<br>&gt;     PREEMPT_DYNAMIC
<br>&gt;      &gt; &gt; Fri
<br>&gt;      &gt; &gt; &gt; Jan 12 17:36:57 CET 2024
<br>&gt;      &gt; &gt; &gt; [ =C2=A0 =C2=A00.000000] Command line: earlypr=
intk=3DttyS0,115200
<br>&gt;      &gt; &gt; &gt; [ =C2=A0 =C2=A00.000000] KERNEL supported cpus=
:
<br>&gt;      &gt; &gt; &gt; [ =C2=A0 =C2=A00.000000] =C2=A0 Intel GenuineI=
ntel
<br>&gt;      &gt; &gt; &gt; [ =C2=A0 =C2=A00.000000] =C2=A0 AMD AuthenticA=
MD
<br>&gt;      &gt; &gt; &gt; [ =C2=A0 =C2=A00.000000] x86/fpu: Supporting X=
SAVE feature 0x001: &#39;x87
<br>&gt;      &gt; &gt; floating
<br>&gt;      &gt; &gt; &gt; point regi =C2=A0 =C2=A0 =C2=A0 sters&#39;
<br>&gt;      &gt; &gt; &gt; [ =C2=A0 =C2=A00.000000] x86/fpu: Supporting X=
SAVE feature 0x002: &#39;SSE
<br>&gt;      &gt; &gt; registers&#39;
<br>&gt;      &gt; &gt; &gt; [ =C2=A0 =C2=A00.000000] x86/fpu: Supporting X=
SAVE feature 0x004: &#39;AVX
<br>&gt;      &gt; &gt; registers&#39;
<br>&gt;      &gt; &gt; &gt; [ =C2=A0 =C2=A00.000000] x86/fpu: xstate_offse=
t[2]: =C2=A0576, xstate_sizes[2]:
<br>&gt;      &gt; &gt; =C2=A0256
<br>&gt;      &gt; &gt; &gt; [ =C2=A0 =C2=A00.000000] x86/fpu: Enabled xsta=
te features 0x7, context
<br>&gt;     size
<br>&gt;      &gt; &gt; is 832
<br>&gt;      &gt; &gt; &gt; bytes, =C2=A0 =C2=A0 =C2=A0 =C2=A0using &#39;c=
ompacted&#39; format.
<br>&gt;      &gt; &gt; &gt; [ =C2=A0 =C2=A00.000000] signal: max sigframe =
size: 1360
<br>&gt;      &gt; &gt; &gt; [ =C2=A0 =C2=A00.000000] BIOS-provided physica=
l RAM map:
<br>&gt;      &gt; &gt; &gt; [ =C2=A0 =C2=A00.000000] BIOS-e801: [mem
<br>&gt;      &gt; &gt; 0x0000000000000000-0x000000000009efff] usable
<br>&gt;      &gt; &gt;
<br>&gt;      &gt; &gt; Okay, here should be all memory regions listed. My =
non-root Linux
<br>&gt;      &gt; in my
<br>&gt;      &gt; &gt; Qemu VM, for example, shows here:
<br>&gt;      &gt; &gt;
<br>&gt;      &gt; &gt; [ 0.000000] BIOS-provided physical RAM map:
<br>&gt;      &gt; &gt; [ 0.000000] BIOS-e820: [mem 0x0000000000000000-0x00=
000000000fffff]
<br>&gt;      &gt; &gt; usable
<br>&gt;      &gt; &gt; [ 0.000000] BIOS-e820: [mem 0x0000000000100000-0x00=
00000000100fff]
<br>&gt;      &gt; &gt; reserved
<br>&gt;      &gt; &gt; [ 0.000000] BIOS-e820: [mem 0x0000000000200000-0x00=
000000048fffff]
<br>&gt;      &gt; &gt; usable
<br>&gt;      &gt; &gt;
<br>&gt;      &gt; &gt; Are you absolutely sure, that you have no further m=
odifications in
<br>&gt;      &gt; &gt; Jailhouse or the Linux loader?
<br>&gt;      &gt; &gt;
<br>&gt;      &gt; &gt; Actually, in your case, there should be e820 as wel=
l (instead of
<br>&gt;      &gt; e801).
<br>&gt;      &gt; &gt; Go to the Linux kernel sources, have a look at
<br>&gt;      &gt; &gt; arch/x86/kernel/e820.c:1279
<br>&gt;      &gt; &gt;
<br>&gt;      &gt; &gt; and Jailhouse&#39;s jailhouse-cell-linux:638.
<br>&gt;      &gt; &gt;
<br>&gt;      &gt; &gt; jailhouse-cell-linux fills information of all memor=
y regions into
<br>&gt;      &gt; the
<br>&gt;      &gt; &gt; zero page. Would you please instrument code (Linux/=
Jailhouse)
<br>&gt;     to see
<br>&gt;      &gt; &gt; where those regions are not parsed?
<br>&gt;      &gt; &gt;
<br>&gt;      &gt; &gt; &gt; [ =C2=A0 =C2=A00.000000] printk: bootconsole [=
earlyser0] enabled
<br>&gt;      &gt; &gt; &gt; [ =C2=A0 =C2=A00.000000] NX (Execute Disable) =
protection: active
<br>&gt;      &gt; &gt; &gt; [ =C2=A0 =C2=A00.000000] extended physical RAM=
 map:
<br>&gt;      &gt; &gt; &gt; [ =C2=A0 =C2=A00.000000] reserve setup_data: [=
mem
<br>&gt;      &gt; &gt; &gt; 0x0000000000000000-0x0000000000001fff] u =C2=
=A0 =C2=A0 =C2=A0 sable
<br>&gt;      &gt; &gt; &gt; [ =C2=A0 =C2=A00.000000] reserve setup_data: [=
mem
<br>&gt;      &gt; &gt; &gt; 0x0000000000002000-0x000000000000212b] u =C2=
=A0 =C2=A0 =C2=A0 sable
<br>&gt;      &gt; &gt; &gt; [ =C2=A0 =C2=A00.000000] reserve setup_data: [=
mem
<br>&gt;      &gt; &gt; &gt; 0x000000000000212c-0x000000000009efff] u =C2=
=A0 =C2=A0 =C2=A0 sable
<br>&gt;      &gt; &gt; &gt; [ =C2=A0 =C2=A00.000000] DMI not present or in=
valid.
<br>&gt;      &gt; &gt; &gt; [ =C2=A0 =C2=A00.000000] Hypervisor detected: =
Jailhouse
<br>&gt;      &gt; &gt;
<br>&gt;      &gt; &gt; Just guessing loud: Hmm, you have guest support ena=
bled, that&#39;s
<br>&gt;      &gt; not the
<br>&gt;      &gt; &gt; issue.
<br>&gt;      &gt; &gt;
<br>&gt;      &gt; &gt; &gt; [ =C2=A0 =C2=A00.000000] tsc: Detected 3393.62=
4 MHz processor
<br>&gt;      &gt; &gt; &gt; [ =C2=A0 =C2=A00.000017] .text .data .bss are =
not marked as E820_TYPE_RAM!
<br>&gt;      &gt; &gt;
<br>&gt;      &gt; &gt; Here&#39;s the next error that makes me curious, wh=
y you system falls
<br>&gt;      &gt; back
<br>&gt;      &gt; &gt; to E801...
<br>&gt;      &gt; &gt;
<br>&gt;      &gt; &gt; &gt; [ =C2=A0 =C2=A00.005745] last_pfn =3D 0x2e28 m=
ax_arch_pfn =3D 0x400000000
<br>&gt;      &gt; &gt; &gt; [ =C2=A0 =C2=A00.011025] x86/PAT: PAT support =
disabled because
<br>&gt;      &gt; &gt; CONFIG_X86_PAT is
<br>&gt;      &gt; &gt; &gt; disabled =C2=A0 =C2=A0 =C2=A0 =C2=A0in the ker=
nel.
<br>&gt;      &gt; &gt;
<br>&gt;      &gt; &gt; Please enable CONFIG_X86_PAT and MTRR in your kerne=
l.
<br>&gt;      &gt; &gt;
<br>&gt;      &gt; &gt; &gt; [ =C2=A0 =C2=A00.019362] x86/PAT: Configuratio=
n [0-7]: WB =C2=A0WT =C2=A0UC- UC =C2=A0WB
<br>&gt;      &gt; &gt; =C2=A0WT =C2=A0UC- UC
<br>&gt;      &gt; &gt; &gt; [ =C2=A0 =C2=A00.034867] Using GB pages for di=
rect mapping
<br>&gt;      &gt; &gt; &gt; [ =C2=A0 =C2=A00.039193] Kernel panic - not sy=
ncing: alloc_low_pages: can
<br>&gt;      &gt; not
<br>&gt;      &gt; &gt; &gt; alloc memory
<br>&gt;      &gt; &gt;
<br>&gt;      &gt; &gt; Yeah, that&#39;s the logical aftereffect after the =
errors above.
<br>&gt;      &gt; &gt;
<br>&gt;      &gt; &gt; Thanks,
<br>&gt;      &gt; &gt; Ralf
<br>&gt;      &gt; &gt;
<br>&gt;      &gt; &gt; &gt; [ =C2=A0 =C2=A00.046183] CPU: 0 PID: 0 Comm: s=
wapper Not tainted
<br>&gt;      &gt; 6.2.0-rc3 #2
<br>&gt;      &gt; &gt; &gt; [ =C2=A0 =C2=A00.052176] Call Trace:
<br>&gt;      &gt; &gt; &gt; [ =C2=A0 =C2=A00.054606] =C2=A0&lt;TASK&gt;
<br>&gt;      &gt; &gt; &gt; [ =C2=A0 =C2=A00.056691] =C2=A0? dump_stack_lv=
l+0x33/0x4e
<br>&gt;      &gt; &gt; &gt; [ =C2=A0 =C2=A00.060510] =C2=A0? panic+0x157/0=
x303
<br>&gt;      &gt; &gt; &gt; [ =C2=A0 =C2=A00.063723] =C2=A0? sprintf+0x56/=
0x80
<br>&gt;      &gt; &gt; &gt; [ =C2=A0 =C2=A00.066936] =C2=A0? alloc_low_pag=
es+0x70/0x1a0
<br>&gt;      &gt; &gt; &gt; [ =C2=A0 =C2=A00.070930] =C2=A0? phys_pmd_init=
+0x1fc/0x2eb
<br>&gt;      &gt; &gt; &gt; [ =C2=A0 =C2=A00.074839] =C2=A0? phys_pud_init=
+0x116/0x2d3
<br>&gt;      &gt; &gt; &gt; [ =C2=A0 =C2=A00.078744] =C2=A0? __kernel_phys=
ical_mapping_init+0x11a/0x290
<br>&gt;      &gt; &gt; &gt; [ =C2=A0 =C2=A00.084128] =C2=A0? init_memory_m=
apping+0x25e/0x3b0
<br>&gt;      &gt; &gt; &gt; [ =C2=A0 =C2=A00.088558] =C2=A0? init_range_me=
mory_mapping+0xe7/0x145
<br>&gt;      &gt; &gt; &gt; [ =C2=A0 =C2=A00.093417] =C2=A0? init_mem_mapp=
ing+0x242/0x298
<br>&gt;      &gt; &gt; &gt; [ =C2=A0 =C2=A00.097585] =C2=A0? setup_arch+0x=
74e/0xcbd
<br>&gt;      &gt; &gt; &gt; [ =C2=A0 =C2=A00.101231] =C2=A0? start_kernel+=
0x66/0x8b7
<br>&gt;      &gt; &gt; &gt; [ =C2=A0 =C2=A00.104965] =C2=A0? load_ucode_bs=
p+0x43/0x11b
<br>&gt;      &gt; &gt; &gt; [ =C2=A0 =C2=A00.108873] =C2=A0? secondary_sta=
rtup_64_no_verify+0xe0/0xeb
<br>&gt;      &gt; &gt; &gt; [ =C2=A0 =C2=A00.114085] =C2=A0&lt;/TASK&gt;
<br>&gt;      &gt; &gt; &gt; [ =C2=A0 =C2=A00.116255] ---[ end Kernel panic=
 - not syncing:
<br>&gt;      &gt; &gt; alloc_low_pages: can
<br>&gt;      &gt; &gt; &gt; not all =C2=A0 =C2=A0 =C2=A0 oc memory ]---
<br>&gt;      &gt; &gt; &gt;
<br>&gt;      &gt; &gt; &gt;
<br>&gt;      &gt; &gt; &gt; Thank you for your continuous support,
<br>&gt;      &gt; &gt; &gt; Michele
<br>&gt;      &gt; &gt; &gt;
<br>&gt;      &gt; &gt; &gt; Il giorno sabato 13 gennaio 2024 alle 00:05:43=
 UTC+1 Ralf
<br>&gt;      &gt; &gt; Ramsauer ha
<br>&gt;      &gt; &gt; &gt; scritto:
<br>&gt;      &gt; &gt; &gt;
<br>&gt;      &gt; &gt; &gt; Hi Michele,
<br>&gt;      &gt; &gt; &gt;
<br>&gt;      &gt; &gt; &gt; On 12/01/2024 14:07, Michele Pescap=C3=A8 wrot=
e:
<br>&gt;      &gt; &gt; &gt; &gt; jailhouse cell load linux-2 linux-loader.=
bin -a 0x0
<br>&gt;      &gt; &gt; &gt; &gt; ../buildroot-2023.11/output/images/bzImag=
e -a 0xffbe00
<br>&gt;      &gt; parameters
<br>&gt;      &gt; &gt; &gt; -a 0x1000
<br>&gt;      &gt; &gt; &gt; &gt; jailhouse cell start linux-2
<br>&gt;      &gt; &gt; &gt; &gt;
<br>&gt;      &gt; &gt; &gt; &gt; I take it the kernel is loaded at 0xffbe0=
0 which is right
<br>&gt;     at the
<br>&gt;      &gt; &gt; &gt; edge of
<br>&gt;      &gt; &gt; &gt; &gt; the low ram region. In fact after issuing=
 the cell load
<br>&gt;     command
<br>&gt;      &gt; &gt; and
<br>&gt;      &gt; &gt; &gt; &gt; adjusting the path for the loader I get J=
AILHOUSE_CELL_LOAD:
<br>&gt;      &gt; &gt; Invalid
<br>&gt;      &gt; &gt; &gt; &gt; argument.
<br>&gt;      &gt; &gt; &gt;
<br>&gt;      &gt; &gt; &gt; Just tested cell-linux in a qemu machine, ther=
e it works, with
<br>&gt;      &gt; &gt; pretty
<br>&gt;      &gt; &gt; &gt; similar addresses, which got me confused.
<br>&gt;      &gt; &gt; &gt;
<br>&gt;      &gt; &gt; &gt; After double-checking it: 0xffb.e00 is *not* a=
t the edge of low
<br>&gt;      &gt; mem:
<br>&gt;      &gt; &gt; &gt;
<br>&gt;      &gt; &gt; &gt; Low mem is 0x000.000 -- 0x0ff.fff
<br>&gt;      &gt; &gt; &gt; Comm region is 0x100.000 -- 0x100.fff
<br>&gt;      &gt; &gt; &gt;
<br>&gt;      &gt; &gt; &gt; 0xffb.e00 is (obviously) way above.
<br>&gt;      &gt; &gt; &gt;
<br>&gt;      &gt; &gt; &gt; Please try to set your high mem&#39;s .virt_st=
art to 0x200000. Then,
<br>&gt;      &gt; &gt; &gt; 0xffbe00 is offsetted ~16MB inside your highme=
m, and it should
<br>&gt;      &gt; work!
<br>&gt;      &gt; &gt; &gt;
<br>&gt;      &gt; &gt; &gt; IOW:
<br>&gt;      &gt; &gt; &gt;
<br>&gt;      &gt; &gt; &gt; /* high RAM */
<br>&gt;      &gt; &gt; &gt; {
<br>&gt;      &gt; &gt; &gt; .phys_start =3D 0x42300000,
<br>&gt;      &gt; &gt; &gt; .virt_start =3D 0x200000,
<br>&gt;      &gt; &gt; &gt; .size =3D 0x11000000,
<br>&gt;      &gt; &gt; &gt; .flags =3D JAILHOUSE_MEM_READ | JAILHOUSE_MEM_=
WRITE |
<br>&gt;      &gt; &gt; &gt; JAILHOUSE_MEM_EXECUTE |
<br>&gt;      &gt; &gt; &gt; JAILHOUSE_MEM_LOADABLE,
<br>&gt;      &gt; &gt; &gt; },
<br>&gt;      &gt; &gt; &gt;
<br>&gt;      &gt; &gt; &gt; Thanks
<br>&gt;      &gt; &gt; &gt; Ralf
<br>&gt;      &gt; &gt; &gt;
<br>&gt;      &gt; &gt; &gt; --
<br>&gt;      &gt; &gt; &gt; You received this message because you are subs=
cribed to the
<br>&gt;     Google
<br>&gt;      &gt; &gt; &gt; Groups &quot;Jailhouse&quot; group.
<br>&gt;      &gt; &gt; &gt; To unsubscribe from this group and stop receiv=
ing emails from
<br>&gt;     it,
<br>&gt;      &gt; &gt; send
<br>&gt;      &gt; &gt; &gt; an email to <a href data-email-masked rel=3D"n=
ofollow">jailhouse-de...@googlegroups.com</a>
<br>&gt;      &gt; &gt; &gt; &lt;mailto:<a href data-email-masked rel=3D"no=
follow">jailhouse-de...@googlegroups.com</a>&gt;.
<br>&gt;      &gt; &gt; &gt; To view this discussion on the web visit
<br>&gt;      &gt; &gt; &gt;
<br>&gt;      &gt; &gt;
<br>&gt;      &gt;
<br>&gt;     <a href=3D"https://groups.google.com/d/msgid/jailhouse-dev/671=
2361a-eaef-49cc-8a72-79da2c434169n%40googlegroups.com" target=3D"_blank" re=
l=3D"nofollow" data-saferedirecturl=3D"https://www.google.com/url?hl=3Dit&a=
mp;q=3Dhttps://groups.google.com/d/msgid/jailhouse-dev/6712361a-eaef-49cc-8=
a72-79da2c434169n%2540googlegroups.com&amp;source=3Dgmail&amp;ust=3D1705577=
656434000&amp;usg=3DAOvVaw2xnI67R7C7myy_sR_IJcZ_">https://groups.google.com=
/d/msgid/jailhouse-dev/6712361a-eaef-49cc-8a72-79da2c434169n%40googlegroups=
.com</a> &lt;<a href=3D"https://groups.google.com/d/msgid/jailhouse-dev/671=
2361a-eaef-49cc-8a72-79da2c434169n%40googlegroups.com" target=3D"_blank" re=
l=3D"nofollow" data-saferedirecturl=3D"https://www.google.com/url?hl=3Dit&a=
mp;q=3Dhttps://groups.google.com/d/msgid/jailhouse-dev/6712361a-eaef-49cc-8=
a72-79da2c434169n%2540googlegroups.com&amp;source=3Dgmail&amp;ust=3D1705577=
656434000&amp;usg=3DAOvVaw2xnI67R7C7myy_sR_IJcZ_">https://groups.google.com=
/d/msgid/jailhouse-dev/6712361a-eaef-49cc-8a72-79da2c434169n%40googlegroups=
.com</a>&gt; &lt;<a href=3D"https://groups.google.com/d/msgid/jailhouse-dev=
/6712361a-eaef-49cc-8a72-79da2c434169n%40googlegroups.com" target=3D"_blank=
" rel=3D"nofollow" data-saferedirecturl=3D"https://www.google.com/url?hl=3D=
it&amp;q=3Dhttps://groups.google.com/d/msgid/jailhouse-dev/6712361a-eaef-49=
cc-8a72-79da2c434169n%2540googlegroups.com&amp;source=3Dgmail&amp;ust=3D170=
5577656434000&amp;usg=3DAOvVaw2xnI67R7C7myy_sR_IJcZ_">https://groups.google=
.com/d/msgid/jailhouse-dev/6712361a-eaef-49cc-8a72-79da2c434169n%40googlegr=
oups.com</a> &lt;<a href=3D"https://groups.google.com/d/msgid/jailhouse-dev=
/6712361a-eaef-49cc-8a72-79da2c434169n%40googlegroups.com" target=3D"_blank=
" rel=3D"nofollow" data-saferedirecturl=3D"https://www.google.com/url?hl=3D=
it&amp;q=3Dhttps://groups.google.com/d/msgid/jailhouse-dev/6712361a-eaef-49=
cc-8a72-79da2c434169n%2540googlegroups.com&amp;source=3Dgmail&amp;ust=3D170=
5577656434000&amp;usg=3DAOvVaw2xnI67R7C7myy_sR_IJcZ_">https://groups.google=
.com/d/msgid/jailhouse-dev/6712361a-eaef-49cc-8a72-79da2c434169n%40googlegr=
oups.com</a>&gt;&gt; &lt;<a href=3D"https://groups.google.com/d/msgid/jailh=
ouse-dev/6712361a-eaef-49cc-8a72-79da2c434169n%40googlegroups.com" target=
=3D"_blank" rel=3D"nofollow" data-saferedirecturl=3D"https://www.google.com=
/url?hl=3Dit&amp;q=3Dhttps://groups.google.com/d/msgid/jailhouse-dev/671236=
1a-eaef-49cc-8a72-79da2c434169n%2540googlegroups.com&amp;source=3Dgmail&amp=
;ust=3D1705577656434000&amp;usg=3DAOvVaw2xnI67R7C7myy_sR_IJcZ_">https://gro=
ups.google.com/d/msgid/jailhouse-dev/6712361a-eaef-49cc-8a72-79da2c434169n%=
40googlegroups.com</a> &lt;<a href=3D"https://groups.google.com/d/msgid/jai=
lhouse-dev/6712361a-eaef-49cc-8a72-79da2c434169n%40googlegroups.com" target=
=3D"_blank" rel=3D"nofollow" data-saferedirecturl=3D"https://www.google.com=
/url?hl=3Dit&amp;q=3Dhttps://groups.google.com/d/msgid/jailhouse-dev/671236=
1a-eaef-49cc-8a72-79da2c434169n%2540googlegroups.com&amp;source=3Dgmail&amp=
;ust=3D1705577656434000&amp;usg=3DAOvVaw2xnI67R7C7myy_sR_IJcZ_">https://gro=
ups.google.com/d/msgid/jailhouse-dev/6712361a-eaef-49cc-8a72-79da2c434169n%=
40googlegroups.com</a>&gt; &lt;<a href=3D"https://groups.google.com/d/msgid=
/jailhouse-dev/6712361a-eaef-49cc-8a72-79da2c434169n%40googlegroups.com" ta=
rget=3D"_blank" rel=3D"nofollow" data-saferedirecturl=3D"https://www.google=
.com/url?hl=3Dit&amp;q=3Dhttps://groups.google.com/d/msgid/jailhouse-dev/67=
12361a-eaef-49cc-8a72-79da2c434169n%2540googlegroups.com&amp;source=3Dgmail=
&amp;ust=3D1705577656434000&amp;usg=3DAOvVaw2xnI67R7C7myy_sR_IJcZ_">https:/=
/groups.google.com/d/msgid/jailhouse-dev/6712361a-eaef-49cc-8a72-79da2c4341=
69n%40googlegroups.com</a> &lt;<a href=3D"https://groups.google.com/d/msgid=
/jailhouse-dev/6712361a-eaef-49cc-8a72-79da2c434169n%40googlegroups.com" ta=
rget=3D"_blank" rel=3D"nofollow" data-saferedirecturl=3D"https://www.google=
.com/url?hl=3Dit&amp;q=3Dhttps://groups.google.com/d/msgid/jailhouse-dev/67=
12361a-eaef-49cc-8a72-79da2c434169n%2540googlegroups.com&amp;source=3Dgmail=
&amp;ust=3D1705577656434000&amp;usg=3DAOvVaw2xnI67R7C7myy_sR_IJcZ_">https:/=
/groups.google.com/d/msgid/jailhouse-dev/6712361a-eaef-49cc-8a72-79da2c4341=
69n%40googlegroups.com</a>&gt;&gt;&gt; &lt;<a href=3D"https://groups.google=
.com/d/msgid/jailhouse-dev/6712361a-eaef-49cc-8a72-79da2c434169n%40googlegr=
oups.com?utm_medium=3Demail&amp;utm_source=3Dfooter" target=3D"_blank" rel=
=3D"nofollow" data-saferedirecturl=3D"https://www.google.com/url?hl=3Dit&am=
p;q=3Dhttps://groups.google.com/d/msgid/jailhouse-dev/6712361a-eaef-49cc-8a=
72-79da2c434169n%2540googlegroups.com?utm_medium%3Demail%26utm_source%3Dfoo=
ter&amp;source=3Dgmail&amp;ust=3D1705577656434000&amp;usg=3DAOvVaw154Kk6dq5=
VPzFPcTaTT9Ey">https://groups.google.com/d/msgid/jailhouse-dev/6712361a-eae=
f-49cc-8a72-79da2c434169n%40googlegroups.com?utm_medium=3Demail&amp;utm_sou=
rce=3Dfooter</a> &lt;<a href=3D"https://groups.google.com/d/msgid/jailhouse=
-dev/6712361a-eaef-49cc-8a72-79da2c434169n%40googlegroups.com?utm_medium=3D=
email&amp;utm_source=3Dfooter" target=3D"_blank" rel=3D"nofollow" data-safe=
redirecturl=3D"https://www.google.com/url?hl=3Dit&amp;q=3Dhttps://groups.go=
ogle.com/d/msgid/jailhouse-dev/6712361a-eaef-49cc-8a72-79da2c434169n%2540go=
oglegroups.com?utm_medium%3Demail%26utm_source%3Dfooter&amp;source=3Dgmail&=
amp;ust=3D1705577656434000&amp;usg=3DAOvVaw154Kk6dq5VPzFPcTaTT9Ey">https://=
groups.google.com/d/msgid/jailhouse-dev/6712361a-eaef-49cc-8a72-79da2c43416=
9n%40googlegroups.com?utm_medium=3Demail&amp;utm_source=3Dfooter</a>&gt; &l=
t;<a href=3D"https://groups.google.com/d/msgid/jailhouse-dev/6712361a-eaef-=
49cc-8a72-79da2c434169n%40googlegroups.com?utm_medium=3Demail&amp;utm_sourc=
e=3Dfooter" target=3D"_blank" rel=3D"nofollow" data-saferedirecturl=3D"http=
s://www.google.com/url?hl=3Dit&amp;q=3Dhttps://groups.google.com/d/msgid/ja=
ilhouse-dev/6712361a-eaef-49cc-8a72-79da2c434169n%2540googlegroups.com?utm_=
medium%3Demail%26utm_source%3Dfooter&amp;source=3Dgmail&amp;ust=3D170557765=
6434000&amp;usg=3DAOvVaw154Kk6dq5VPzFPcTaTT9Ey">https://groups.google.com/d=
/msgid/jailhouse-dev/6712361a-eaef-49cc-8a72-79da2c434169n%40googlegroups.c=
om?utm_medium=3Demail&amp;utm_source=3Dfooter</a> &lt;<a href=3D"https://gr=
oups.google.com/d/msgid/jailhouse-dev/6712361a-eaef-49cc-8a72-79da2c434169n=
%40googlegroups.com?utm_medium=3Demail&amp;utm_source=3Dfooter" target=3D"_=
blank" rel=3D"nofollow" data-saferedirecturl=3D"https://www.google.com/url?=
hl=3Dit&amp;q=3Dhttps://groups.google.com/d/msgid/jailhouse-dev/6712361a-ea=
ef-49cc-8a72-79da2c434169n%2540googlegroups.com?utm_medium%3Demail%26utm_so=
urce%3Dfooter&amp;source=3Dgmail&amp;ust=3D1705577656434000&amp;usg=3DAOvVa=
w154Kk6dq5VPzFPcTaTT9Ey">https://groups.google.com/d/msgid/jailhouse-dev/67=
12361a-eaef-49cc-8a72-79da2c434169n%40googlegroups.com?utm_medium=3Demail&a=
mp;utm_source=3Dfooter</a>&gt;&gt; &lt;<a href=3D"https://groups.google.com=
/d/msgid/jailhouse-dev/6712361a-eaef-49cc-8a72-79da2c434169n%40googlegroups=
.com?utm_medium=3Demail&amp;utm_source=3Dfooter" target=3D"_blank" rel=3D"n=
ofollow" data-saferedirecturl=3D"https://www.google.com/url?hl=3Dit&amp;q=
=3Dhttps://groups.google.com/d/msgid/jailhouse-dev/6712361a-eaef-49cc-8a72-=
79da2c434169n%2540googlegroups.com?utm_medium%3Demail%26utm_source%3Dfooter=
&amp;source=3Dgmail&amp;ust=3D1705577656434000&amp;usg=3DAOvVaw154Kk6dq5VPz=
FPcTaTT9Ey">https://groups.google.com/d/msgid/jailhouse-dev/6712361a-eaef-4=
9cc-8a72-79da2c434169n%40googlegroups.com?utm_medium=3Demail&amp;utm_source=
=3Dfooter</a> &lt;<a href=3D"https://groups.google.com/d/msgid/jailhouse-de=
v/6712361a-eaef-49cc-8a72-79da2c434169n%40googlegroups.com?utm_medium=3Dema=
il&amp;utm_source=3Dfooter" target=3D"_blank" rel=3D"nofollow" data-safered=
irecturl=3D"https://www.google.com/url?hl=3Dit&amp;q=3Dhttps://groups.googl=
e.com/d/msgid/jailhouse-dev/6712361a-eaef-49cc-8a72-79da2c434169n%2540googl=
egroups.com?utm_medium%3Demail%26utm_source%3Dfooter&amp;source=3Dgmail&amp=
;ust=3D1705577656434000&amp;usg=3DAOvVaw154Kk6dq5VPzFPcTaTT9Ey">https://gro=
ups.google.com/d/msgid/jailhouse-dev/6712361a-eaef-49cc-8a72-79da2c434169n%=
40googlegroups.com?utm_medium=3Demail&amp;utm_source=3Dfooter</a>&gt; &lt;<=
a href=3D"https://groups.google.com/d/msgid/jailhouse-dev/6712361a-eaef-49c=
c-8a72-79da2c434169n%40googlegroups.com?utm_medium=3Demail&amp;utm_source=
=3Dfooter" target=3D"_blank" rel=3D"nofollow" data-saferedirecturl=3D"https=
://www.google.com/url?hl=3Dit&amp;q=3Dhttps://groups.google.com/d/msgid/jai=
lhouse-dev/6712361a-eaef-49cc-8a72-79da2c434169n%2540googlegroups.com?utm_m=
edium%3Demail%26utm_source%3Dfooter&amp;source=3Dgmail&amp;ust=3D1705577656=
434000&amp;usg=3DAOvVaw154Kk6dq5VPzFPcTaTT9Ey">https://groups.google.com/d/=
msgid/jailhouse-dev/6712361a-eaef-49cc-8a72-79da2c434169n%40googlegroups.co=
m?utm_medium=3Demail&amp;utm_source=3Dfooter</a> &lt;<a href=3D"https://gro=
ups.google.com/d/msgid/jailhouse-dev/6712361a-eaef-49cc-8a72-79da2c434169n%=
40googlegroups.com?utm_medium=3Demail&amp;utm_source=3Dfooter" target=3D"_b=
lank" rel=3D"nofollow" data-saferedirecturl=3D"https://www.google.com/url?h=
l=3Dit&amp;q=3Dhttps://groups.google.com/d/msgid/jailhouse-dev/6712361a-eae=
f-49cc-8a72-79da2c434169n%2540googlegroups.com?utm_medium%3Demail%26utm_sou=
rce%3Dfooter&amp;source=3Dgmail&amp;ust=3D1705577656434000&amp;usg=3DAOvVaw=
154Kk6dq5VPzFPcTaTT9Ey">https://groups.google.com/d/msgid/jailhouse-dev/671=
2361a-eaef-49cc-8a72-79da2c434169n%40googlegroups.com?utm_medium=3Demail&am=
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
<br>&gt;     <a href=3D"https://groups.google.com/d/msgid/jailhouse-dev/860=
c1e75-c28f-4157-9212-a3d87ad25b27n%40googlegroups.com" target=3D"_blank" re=
l=3D"nofollow" data-saferedirecturl=3D"https://www.google.com/url?hl=3Dit&a=
mp;q=3Dhttps://groups.google.com/d/msgid/jailhouse-dev/860c1e75-c28f-4157-9=
212-a3d87ad25b27n%2540googlegroups.com&amp;source=3Dgmail&amp;ust=3D1705577=
656434000&amp;usg=3DAOvVaw10un2qyN95FINEakXST2k2">https://groups.google.com=
/d/msgid/jailhouse-dev/860c1e75-c28f-4157-9212-a3d87ad25b27n%40googlegroups=
.com</a> &lt;<a href=3D"https://groups.google.com/d/msgid/jailhouse-dev/860=
c1e75-c28f-4157-9212-a3d87ad25b27n%40googlegroups.com" target=3D"_blank" re=
l=3D"nofollow" data-saferedirecturl=3D"https://www.google.com/url?hl=3Dit&a=
mp;q=3Dhttps://groups.google.com/d/msgid/jailhouse-dev/860c1e75-c28f-4157-9=
212-a3d87ad25b27n%2540googlegroups.com&amp;source=3Dgmail&amp;ust=3D1705577=
656434000&amp;usg=3DAOvVaw10un2qyN95FINEakXST2k2">https://groups.google.com=
/d/msgid/jailhouse-dev/860c1e75-c28f-4157-9212-a3d87ad25b27n%40googlegroups=
.com</a>&gt; &lt;<a href=3D"https://groups.google.com/d/msgid/jailhouse-dev=
/860c1e75-c28f-4157-9212-a3d87ad25b27n%40googlegroups.com" target=3D"_blank=
" rel=3D"nofollow" data-saferedirecturl=3D"https://www.google.com/url?hl=3D=
it&amp;q=3Dhttps://groups.google.com/d/msgid/jailhouse-dev/860c1e75-c28f-41=
57-9212-a3d87ad25b27n%2540googlegroups.com&amp;source=3Dgmail&amp;ust=3D170=
5577656434000&amp;usg=3DAOvVaw10un2qyN95FINEakXST2k2">https://groups.google=
.com/d/msgid/jailhouse-dev/860c1e75-c28f-4157-9212-a3d87ad25b27n%40googlegr=
oups.com</a> &lt;<a href=3D"https://groups.google.com/d/msgid/jailhouse-dev=
/860c1e75-c28f-4157-9212-a3d87ad25b27n%40googlegroups.com" target=3D"_blank=
" rel=3D"nofollow" data-saferedirecturl=3D"https://www.google.com/url?hl=3D=
it&amp;q=3Dhttps://groups.google.com/d/msgid/jailhouse-dev/860c1e75-c28f-41=
57-9212-a3d87ad25b27n%2540googlegroups.com&amp;source=3Dgmail&amp;ust=3D170=
5577656434000&amp;usg=3DAOvVaw10un2qyN95FINEakXST2k2">https://groups.google=
.com/d/msgid/jailhouse-dev/860c1e75-c28f-4157-9212-a3d87ad25b27n%40googlegr=
oups.com</a>&gt;&gt; &lt;<a href=3D"https://groups.google.com/d/msgid/jailh=
ouse-dev/860c1e75-c28f-4157-9212-a3d87ad25b27n%40googlegroups.com?utm_mediu=
m=3Demail&amp;utm_source=3Dfooter" target=3D"_blank" rel=3D"nofollow" data-=
saferedirecturl=3D"https://www.google.com/url?hl=3Dit&amp;q=3Dhttps://group=
s.google.com/d/msgid/jailhouse-dev/860c1e75-c28f-4157-9212-a3d87ad25b27n%25=
40googlegroups.com?utm_medium%3Demail%26utm_source%3Dfooter&amp;source=3Dgm=
ail&amp;ust=3D1705577656434000&amp;usg=3DAOvVaw3nmjbQsyaLjfysmNCjBr64">http=
s://groups.google.com/d/msgid/jailhouse-dev/860c1e75-c28f-4157-9212-a3d87ad=
25b27n%40googlegroups.com?utm_medium=3Demail&amp;utm_source=3Dfooter</a> &l=
t;<a href=3D"https://groups.google.com/d/msgid/jailhouse-dev/860c1e75-c28f-=
4157-9212-a3d87ad25b27n%40googlegroups.com?utm_medium=3Demail&amp;utm_sourc=
e=3Dfooter" target=3D"_blank" rel=3D"nofollow" data-saferedirecturl=3D"http=
s://www.google.com/url?hl=3Dit&amp;q=3Dhttps://groups.google.com/d/msgid/ja=
ilhouse-dev/860c1e75-c28f-4157-9212-a3d87ad25b27n%2540googlegroups.com?utm_=
medium%3Demail%26utm_source%3Dfooter&amp;source=3Dgmail&amp;ust=3D170557765=
6435000&amp;usg=3DAOvVaw023WzBBemrCB1m18OZRkSO">https://groups.google.com/d=
/msgid/jailhouse-dev/860c1e75-c28f-4157-9212-a3d87ad25b27n%40googlegroups.c=
om?utm_medium=3Demail&amp;utm_source=3Dfooter</a>&gt; &lt;<a href=3D"https:=
//groups.google.com/d/msgid/jailhouse-dev/860c1e75-c28f-4157-9212-a3d87ad25=
b27n%40googlegroups.com?utm_medium=3Demail&amp;utm_source=3Dfooter" target=
=3D"_blank" rel=3D"nofollow" data-saferedirecturl=3D"https://www.google.com=
/url?hl=3Dit&amp;q=3Dhttps://groups.google.com/d/msgid/jailhouse-dev/860c1e=
75-c28f-4157-9212-a3d87ad25b27n%2540googlegroups.com?utm_medium%3Demail%26u=
tm_source%3Dfooter&amp;source=3Dgmail&amp;ust=3D1705577656435000&amp;usg=3D=
AOvVaw023WzBBemrCB1m18OZRkSO">https://groups.google.com/d/msgid/jailhouse-d=
ev/860c1e75-c28f-4157-9212-a3d87ad25b27n%40googlegroups.com?utm_medium=3Dem=
ail&amp;utm_source=3Dfooter</a> &lt;<a href=3D"https://groups.google.com/d/=
msgid/jailhouse-dev/860c1e75-c28f-4157-9212-a3d87ad25b27n%40googlegroups.co=
m?utm_medium=3Demail&amp;utm_source=3Dfooter" target=3D"_blank" rel=3D"nofo=
llow" data-saferedirecturl=3D"https://www.google.com/url?hl=3Dit&amp;q=3Dht=
tps://groups.google.com/d/msgid/jailhouse-dev/860c1e75-c28f-4157-9212-a3d87=
ad25b27n%2540googlegroups.com?utm_medium%3Demail%26utm_source%3Dfooter&amp;=
source=3Dgmail&amp;ust=3D1705577656435000&amp;usg=3DAOvVaw023WzBBemrCB1m18O=
ZRkSO">https://groups.google.com/d/msgid/jailhouse-dev/860c1e75-c28f-4157-9=
212-a3d87ad25b27n%40googlegroups.com?utm_medium=3Demail&amp;utm_source=3Dfo=
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
<br>&gt;     <a href=3D"https://groups.google.com/d/msgid/jailhouse-dev/614=
6e208-1e8c-4335-abaf-9a2be8c85be5n%40googlegroups.com" target=3D"_blank" re=
l=3D"nofollow" data-saferedirecturl=3D"https://www.google.com/url?hl=3Dit&a=
mp;q=3Dhttps://groups.google.com/d/msgid/jailhouse-dev/6146e208-1e8c-4335-a=
baf-9a2be8c85be5n%2540googlegroups.com&amp;source=3Dgmail&amp;ust=3D1705577=
656435000&amp;usg=3DAOvVaw1-rp1uUs2tH2Ri2BXaihwa">https://groups.google.com=
/d/msgid/jailhouse-dev/6146e208-1e8c-4335-abaf-9a2be8c85be5n%40googlegroups=
.com</a> &lt;<a href=3D"https://groups.google.com/d/msgid/jailhouse-dev/614=
6e208-1e8c-4335-abaf-9a2be8c85be5n%40googlegroups.com" target=3D"_blank" re=
l=3D"nofollow" data-saferedirecturl=3D"https://www.google.com/url?hl=3Dit&a=
mp;q=3Dhttps://groups.google.com/d/msgid/jailhouse-dev/6146e208-1e8c-4335-a=
baf-9a2be8c85be5n%2540googlegroups.com&amp;source=3Dgmail&amp;ust=3D1705577=
656435000&amp;usg=3DAOvVaw1-rp1uUs2tH2Ri2BXaihwa">https://groups.google.com=
/d/msgid/jailhouse-dev/6146e208-1e8c-4335-abaf-9a2be8c85be5n%40googlegroups=
.com</a>&gt; &lt;<a href=3D"https://groups.google.com/d/msgid/jailhouse-dev=
/6146e208-1e8c-4335-abaf-9a2be8c85be5n%40googlegroups.com?utm_medium=3Demai=
l&amp;utm_source=3Dfooter" target=3D"_blank" rel=3D"nofollow" data-saferedi=
recturl=3D"https://www.google.com/url?hl=3Dit&amp;q=3Dhttps://groups.google=
.com/d/msgid/jailhouse-dev/6146e208-1e8c-4335-abaf-9a2be8c85be5n%2540google=
groups.com?utm_medium%3Demail%26utm_source%3Dfooter&amp;source=3Dgmail&amp;=
ust=3D1705577656435000&amp;usg=3DAOvVaw1pfOosL0t8zauSd78S9L39">https://grou=
ps.google.com/d/msgid/jailhouse-dev/6146e208-1e8c-4335-abaf-9a2be8c85be5n%4=
0googlegroups.com?utm_medium=3Demail&amp;utm_source=3Dfooter</a> &lt;<a hre=
f=3D"https://groups.google.com/d/msgid/jailhouse-dev/6146e208-1e8c-4335-aba=
f-9a2be8c85be5n%40googlegroups.com?utm_medium=3Demail&amp;utm_source=3Dfoot=
er" target=3D"_blank" rel=3D"nofollow" data-saferedirecturl=3D"https://www.=
google.com/url?hl=3Dit&amp;q=3Dhttps://groups.google.com/d/msgid/jailhouse-=
dev/6146e208-1e8c-4335-abaf-9a2be8c85be5n%2540googlegroups.com?utm_medium%3=
Demail%26utm_source%3Dfooter&amp;source=3Dgmail&amp;ust=3D1705577656435000&=
amp;usg=3DAOvVaw1pfOosL0t8zauSd78S9L39">https://groups.google.com/d/msgid/j=
ailhouse-dev/6146e208-1e8c-4335-abaf-9a2be8c85be5n%40googlegroups.com?utm_m=
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
<br>&gt; <a href=3D"https://groups.google.com/d/msgid/jailhouse-dev/6fb04e6=
3-2f4a-4d5b-9139-c11e9a9fc461n%40googlegroups.com" target=3D"_blank" rel=3D=
"nofollow" data-saferedirecturl=3D"https://www.google.com/url?hl=3Dit&amp;q=
=3Dhttps://groups.google.com/d/msgid/jailhouse-dev/6fb04e63-2f4a-4d5b-9139-=
c11e9a9fc461n%2540googlegroups.com&amp;source=3Dgmail&amp;ust=3D17055776564=
35000&amp;usg=3DAOvVaw345aTFsz3x3CvS0my4e_8l">https://groups.google.com/d/m=
sgid/jailhouse-dev/6fb04e63-2f4a-4d5b-9139-c11e9a9fc461n%40googlegroups.com=
</a> &lt;<a href=3D"https://groups.google.com/d/msgid/jailhouse-dev/6fb04e6=
3-2f4a-4d5b-9139-c11e9a9fc461n%40googlegroups.com?utm_medium=3Demail&amp;ut=
m_source=3Dfooter" target=3D"_blank" rel=3D"nofollow" data-saferedirecturl=
=3D"https://www.google.com/url?hl=3Dit&amp;q=3Dhttps://groups.google.com/d/=
msgid/jailhouse-dev/6fb04e63-2f4a-4d5b-9139-c11e9a9fc461n%2540googlegroups.=
com?utm_medium%3Demail%26utm_source%3Dfooter&amp;source=3Dgmail&amp;ust=3D1=
705577656435000&amp;usg=3DAOvVaw0R8j4sDdzI4jJqZZGllrQB">https://groups.goog=
le.com/d/msgid/jailhouse-dev/6fb04e63-2f4a-4d5b-9139-c11e9a9fc461n%40google=
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
om/d/msgid/jailhouse-dev/0f1154fe-f680-47e6-a3da-9e1a37fd1f55n%40googlegrou=
ps.com?utm_medium=3Demail&utm_source=3Dfooter">https://groups.google.com/d/=
msgid/jailhouse-dev/0f1154fe-f680-47e6-a3da-9e1a37fd1f55n%40googlegroups.co=
m</a>.<br />

------=_Part_24983_1672958424.1705492330200--

------=_Part_24982_23890251.1705492330200
Content-Type: text/x-csrc; charset=US-ASCII; name=guest1.c
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename=guest1.c
X-Attachment-Id: 33987bb6-376a-4e18-a2d0-e77e7064cfb7
Content-ID: <33987bb6-376a-4e18-a2d0-e77e7064cfb7>

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
	struct jailhouse_memory mem_regions[7];	
	struct jailhouse_irqchip irqchips[1];
	struct jailhouse_pci_device pci_devices[1];
	struct jailhouse_pio pio_regions[3];
	struct jailhouse_pci_capability pci_caps[0];

} __attribute__((packed)) config = {
	.cell = {
		.signature = JAILHOUSE_CELL_DESC_SIGNATURE,
		.revision = JAILHOUSE_CONFIG_REVISION,
		.architecture = JAILHOUSE_X86,
		.name = "linux-1",
		.flags = JAILHOUSE_CELL_PASSIVE_COMMREG |
			 JAILHOUSE_CELL_VIRTUAL_CONSOLE_PERMITTED,

		.cpu_set_size = sizeof(config.cpus),
		.num_memory_regions = ARRAY_SIZE(config.mem_regions),
		.num_pci_devices = ARRAY_SIZE(config.pci_devices),
		.num_pio_regions = ARRAY_SIZE(config.pio_regions),
		.num_irqchips = ARRAY_SIZE(config.irqchips),
		.num_pci_caps = ARRAY_SIZE(config.pci_caps),
		
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
		
		/* IVSHMEM shared memory regions (networking) */
		JAILHOUSE_SHMEM_NET_REGIONS(0x60000000, 1),

		/* low RAM */ 
		{
			.phys_start = 0x3a600000,
			.virt_start = 0,
			.size = 0x00100000, 
			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
				JAILHOUSE_MEM_EXECUTE | JAILHOUSE_MEM_DMA |
				JAILHOUSE_MEM_LOADABLE,
		},
		/* communication region */ 
		{
			.virt_start = 0x00100000,
			.size = 0x00001000,
			.flags = JAILHOUSE_MEM_READ |  JAILHOUSE_MEM_WRITE |
				JAILHOUSE_MEM_COMM_REGION,
		},
		
		/* high RAM */
		{
			.phys_start = 0x3a800000,
			.virt_start = 0x00200000,		
			.size = 0x8000000,
			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
				JAILHOUSE_MEM_EXECUTE | JAILHOUSE_MEM_DMA |
				JAILHOUSE_MEM_LOADABLE,
		},

	},	


	.irqchips = {	
		/* IOAPIC 13, GSI base 0 */
		{
			.address = 0xfec00000,
			.id = 0xa0,
			.pin_bitmap =  {
				 (1 << 4),
			},
		
		},
	
	},
	
	.pio_regions = {
			 /*Port I/O: serial 1 */
			 PIO_RANGE(0x3f8, 0x8),
			 
			 /*Port for pio write on 4e and 4f error on boot*/
			 PIO_RANGE(0x4e,0x2),
			 
			 PIO_RANGE(0x2e,0x2),
	},
	
	
	.pci_devices = {
			/* IVSHMEM: 00:05.0 */
		{
			.type = JAILHOUSE_PCI_TYPE_IVSHMEM,
			.domain = 0x0,
			.bdf = 0x28,
			.bar_mask = JAILHOUSE_IVSHMEM_BAR_MASK_MSIX,
			.num_msix_vectors = 2,
			.shmem_regions_start = 0,
			.shmem_dev_id = 1, 
			.shmem_peers = 2,
			.shmem_protocol = JAILHOUSE_SHMEM_PROTO_VETH,
		},
	},
};

------=_Part_24982_23890251.1705492330200
Content-Type: text/x-csrc; charset=US-ASCII; name=new_root.c
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename=new_root.c
X-Attachment-Id: a1dfd275-9f01-48bf-b8de-b1230856b55a
Content-ID: <a1dfd275-9f01-48bf-b8de-b1230856b55a>

/*
 * Jailhouse, a Linux-based partitioning hypervisor
 *
 * Copyright (c) Siemens AG, 2014-2017
 *
 * This work is licensed under the terms of the GNU GPL, version 2.  See
 * the COPYING file in the top-level directory.
 *
 * Alternatively, you can use or redistribute this file under the following
 * BSD license:
 *
 * Redistribution and use in source and binary forms, with or without
 * modification, are permitted provided that the following conditions
 * are met:
 *
 * 1. Redistributions of source code must retain the above copyright
 *    notice, this list of conditions and the following disclaimer.
 *
 * 2. Redistributions in binary form must reproduce the above copyright
 *    notice, this list of conditions and the following disclaimer in the
 *    documentation and/or other materials provided with the distribution.
 *
 * THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS"
 * AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE
 * IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE
 * ARE DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT HOLDER OR CONTRIBUTORS BE
 * LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR
 * CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF
 * SUBSTITUTE GOODS OR SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESS
 * INTERRUPTION) HOWEVER CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN
 * CONTRACT, STRICT LIABILITY, OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE)
 * ARISING IN ANY WAY OUT OF THE USE OF THIS SOFTWARE, EVEN IF ADVISED OF
 * THE POSSIBILITY OF SUCH DAMAGE.
 *
 * Configuration for Gigabyte Technology Co., Ltd. B450 AORUS M
 * created with '/usr/local/libexec/jailhouse/jailhouse config create new_root.c'
 *
 * NOTE: This config expects the following to be appended to your kernel cmdline
 *       "memmap=0x68000000$0x3a000000"
 */

#include <jailhouse/types.h>
#include <jailhouse/cell-config.h>

struct {
	struct jailhouse_system header;
	__u64 cpus[1];
	struct jailhouse_memory mem_regions[43];
	struct jailhouse_irqchip irqchips[2];
	struct jailhouse_pio pio_regions[10];
	struct jailhouse_pci_device pci_devices[37];
	struct jailhouse_pci_capability pci_caps[105];
} __attribute__((packed)) config = {
	.header = {
		.signature = JAILHOUSE_SYSTEM_SIGNATURE,
		.revision = JAILHOUSE_CONFIG_REVISION,
		.flags = JAILHOUSE_SYS_VIRTUAL_DEBUG_CONSOLE,
		.hypervisor_memory = {
			.phys_start = 0x3a000000,
			.size = 0x600000,
		},
		.debug_console = {
			.address = 0x3f8,
			.type = JAILHOUSE_CON_TYPE_8250,
			.flags = JAILHOUSE_CON_ACCESS_PIO |
				 JAILHOUSE_CON_REGDIST_1,
		},
		.platform_info = {
			.pci_mmconfig_base = 0xf8000000,
			.pci_mmconfig_end_bus = 0x3f,
			/*.iommu_units = {
				{
					.type = JAILHOUSE_IOMMU_AMD,
					.base = 0xfeb80000,
					.size = 0x80000,
					.amd.bdf = 0x2,
					.amd.base_cap = 0x40,
					.amd.msi_cap = 0x64,
					.amd.features = 0x80048f6f,
				},
			},*/
			.x86 = {
				.pm_timer_address = 0x808,
				.vtd_interrupt_limit = 256,
			},
		},
		.root_cell = {
			.name = "RootCell",
			.cpu_set_size = sizeof(config.cpus),
			.num_memory_regions = ARRAY_SIZE(config.mem_regions),
			.num_irqchips = ARRAY_SIZE(config.irqchips),
			.num_pio_regions = ARRAY_SIZE(config.pio_regions),
			.num_pci_devices = ARRAY_SIZE(config.pci_devices),
			.num_pci_caps = ARRAY_SIZE(config.pci_caps),
		},
	},

	.cpus = {
		0x0000000000000fff,
	},

	.mem_regions = {
	
		/* IVSHMEM shared memory regions (networking) */
		JAILHOUSE_SHMEM_NET_REGIONS(0x60000000, 0),
		
		/* MemRegion: 0x3a600000-5fffffff : JAILHOUSE Inmate Memory */
		{
			.phys_start = 0x3a600000,
			.virt_start = 0x3a600000,
			.size = 0x25a00000,
			//.size = 0x20000000,
			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE|
				JAILHOUSE_MEM_EXECUTE | JAILHOUSE_MEM_DMA,
				 
		},
	
		/* MemRegion: 00000000-0009ffff : System RAM */
		{
			.phys_start = 0x0,
			.virt_start = 0x0,
			.size = 0xa0000,
			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
				JAILHOUSE_MEM_EXECUTE | JAILHOUSE_MEM_DMA,
		},
		/* MemRegion: 000a0000-000dffff : PCI Bus 0000:00 */
		{
			.phys_start = 0xa0000,
			.virt_start = 0xa0000,
			.size = 0x40000,
			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE,
		},
		/* MemRegion: 000f0000-000fffff : System ROM */
		{
			.phys_start = 0xf0000,
			.virt_start = 0xf0000,
			.size = 0x10000,
			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE,
		},
		/* MemRegion: 00100000-09dfffff : System RAM */
		{
			.phys_start = 0x100000,
			.virt_start = 0x100000,
			.size = 0x9d00000,
			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
				JAILHOUSE_MEM_EXECUTE | JAILHOUSE_MEM_DMA,
		},
		/* MemRegion: 0a000000-0a1fffff : System RAM */
		{
			.phys_start = 0xa000000,
			.virt_start = 0xa000000,
			.size = 0x200000,
			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
				JAILHOUSE_MEM_EXECUTE | JAILHOUSE_MEM_DMA,
		},
		/* MemRegion: 0a200000-0a20afff : ACPI Non-volatile Storage */
		{
			.phys_start = 0xa200000,
			.virt_start = 0xa200000,
			.size = 0xb000,
			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE,
		},
		/* MemRegion: 0a20b000-0affffff : System RAM */
		{
			.phys_start = 0xa20b000,
			.virt_start = 0xa20b000,
			.size = 0xdf5000,
			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
				JAILHOUSE_MEM_EXECUTE | JAILHOUSE_MEM_DMA,
		},
		/* MemRegion: 0b020000-39ffffff : System RAM */
		{
			.phys_start = 0xb020000,
			.virt_start = 0xb020000,
			.size = 0x2efe0000,
			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
				JAILHOUSE_MEM_EXECUTE | JAILHOUSE_MEM_DMA,
		},
		/* MemRegion: a2000000-d887bfff : System RAM */
		{
			.phys_start = 0xa2000000,
			.virt_start = 0xa2000000,
			.size = 0x3687c000,
			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
				JAILHOUSE_MEM_EXECUTE | JAILHOUSE_MEM_DMA,
		},
		/* MemRegion: d88d3000-da27efff : System RAM */
		{
			.phys_start = 0xd88d3000,
			.virt_start = 0xd88d3000,
			.size = 0x19ac000,
			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
				JAILHOUSE_MEM_EXECUTE | JAILHOUSE_MEM_DMA,
		},
		/* MemRegion: da280000-db9f4fff : System RAM */
		{
			.phys_start = 0xda280000,
			.virt_start = 0xda280000,
			.size = 0x1775000,
			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
				JAILHOUSE_MEM_EXECUTE | JAILHOUSE_MEM_DMA,
		},
		/* MemRegion: dbb53000-dbbcffff : ACPI Tables */
		{
			.phys_start = 0xdbb53000,
			.virt_start = 0xdbb53000,
			.size = 0x7d000,
			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE,
		},
		/* MemRegion: dbbd0000-dc12bfff : ACPI Non-volatile Storage */
		{
			.phys_start = 0xdbbd0000,
			.virt_start = 0xdbbd0000,
			.size = 0x55c000,
			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE,
		},
	
		
		/* MemRegion: dcd80000-deffffff : System RAM */
		{
			.phys_start = 0xdcd80000,
			.virt_start = 0xdcd80000,
			.size = 0x2280000,
			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
				JAILHOUSE_MEM_EXECUTE | JAILHOUSE_MEM_DMA,
		},
		/* MemRegion: e0000000-efffffff : 0000:06:00.0 */
		{
			.phys_start = 0xe0000000,
			.virt_start = 0xe0000000,
			.size = 0x10000000,
			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE,
		},
		/* MemRegion: f0000000-f01fffff : 0000:06:00.0 */
		{
			.phys_start = 0xf0000000,
			.virt_start = 0xf0000000,
			.size = 0x200000,
			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE,
		},
		/* MemRegion: fc900000-fc9fdfff : xhci-hcd */
		{
			.phys_start = 0xfc900000,
			.virt_start = 0xfc900000,
			.size = 0xfe000,
			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE,
		},
		/* MemRegion: fc9ff000-fc9fffff : xhci-hcd */
		{
			.phys_start = 0xfc9ff000,
			.virt_start = 0xfc9ff000,
			.size = 0x1000,
			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE,
		},
		/* MemRegion: fca00000-fcafffff : ccp */
		{
			.phys_start = 0xfca00000,
			.virt_start = 0xfca00000,
			.size = 0x100000,
			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE,
		},
		/* MemRegion: fcb01000-fcb01fff : ccp */
		{
			.phys_start = 0xfcb01000,
			.virt_start = 0xfcb01000,
			.size = 0x1000,
			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE,
		},
		/* MemRegion: fcc01000-fcc03fff : 0000:03:00.0 */
		{
			.phys_start = 0xfcc01000,
			.virt_start = 0xfcc01000,
			.size = 0x3000,
			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE,
		},
		/* MemRegion: fcc04000-fcc04fff : r8169 */
		{
			.phys_start = 0xfcc04000,
			.virt_start = 0xfcc04000,
			.size = 0x1000,
			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE,
		},
		/* MemRegion: fcd00000-fcd7ffff : 0000:01:00.1 */
		{
			.phys_start = 0xfcd00000,
			.virt_start = 0xfcd00000,
			.size = 0x80000,
			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE,
		},
		/* MemRegion: fcd80000-fcd9ffff : ahci */
		{
			.phys_start = 0xfcd80000,
			.virt_start = 0xfcd80000,
			.size = 0x20000,
			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE,
		},
		/* MemRegion: fcda0000-fcda1fff : xhci-hcd */
		{
			.phys_start = 0xfcda0000,
			.virt_start = 0xfcda0000,
			.size = 0x2000,
			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE,
		},
		/* MemRegion: fcda3000-fcda7fff : xhci-hcd */
		{
			.phys_start = 0xfcda3000,
			.virt_start = 0xfcda3000,
			.size = 0x5000,
			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE,
		},
		/* MemRegion: fce00000-fce07fff : ICH HD audio */
		{
			.phys_start = 0xfce00000,
			.virt_start = 0xfce00000,
			.size = 0x8000,
			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE,
		},
		/* MemRegion: fce08000-fce08fff : ahci */
		{
			.phys_start = 0xfce08000,
			.virt_start = 0xfce08000,
			.size = 0x1000,
			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE,
		},
		/* MemRegion: fcf00000-fcf3ffff : 0000:06:00.0 */
		{
			.phys_start = 0xfcf00000,
			.virt_start = 0xfcf00000,
			.size = 0x40000,
			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE,
		},
		/* MemRegion: fcf40000-fcf5ffff : 0000:06:00.0 */
		{
			.phys_start = 0xfcf40000,
			.virt_start = 0xfcf40000,
			.size = 0x20000,
			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE,
		},
		/* MemRegion: fcf60000-fcf63fff : ICH HD audio */
		{
			.phys_start = 0xfcf60000,
			.virt_start = 0xfcf60000,
			.size = 0x4000,
			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE,
		},
		/* MemRegion: fec10000-fec10fff : pnp 00:05 */
		{
			.phys_start = 0xfec10000,
			.virt_start = 0xfec10000,
			.size = 0x1000,
			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE,
		},
		/* MemRegion: fec30000-fec30fff : AMDIF030:00 AMDIF030:00 */
		{
			.phys_start = 0xfec30000,
			.virt_start = 0xfec30000,
			.size = 0x1000,
			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE,
		},
		/* MemRegion: fed00000-fed003ff : PNP0103:00 */
		{
			.phys_start = 0xfed00000,
			.virt_start = 0xfed00000,
			.size = 0x1000,
			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE,
		},
		/* MemRegion: fed81500-fed818ff : AMDI0030:00 AMDI0030:00 */
		{
			.phys_start = 0xfed81500,
			.virt_start = 0xfed81500,
			.size = 0x1000,
			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE,
		},
		/* MemRegion: fedc0000-fedc0fff : pnp 00:05 */
		{
			.phys_start = 0xfedc0000,
			.virt_start = 0xfedc0000,
			.size = 0x1000,
			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE,
		},
		/* MemRegion: ff000000-ffffffff : pnp 00:05 */
		{
			.phys_start = 0xff000000,
			.virt_start = 0xff000000,
			.size = 0x1000000,
			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE,
		},
		/* MemRegion: 100000000-41fffffff : System RAM */
		{
			.phys_start = 0x100000000,
			.virt_start = 0x100000000,
			.size = 0x320000000,
			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
				JAILHOUSE_MEM_EXECUTE | JAILHOUSE_MEM_DMA,
		},
		/* : 3a600000-3f1fffff : JAILHOUSE Inmate Memory */
	/*	{
			.phys_start = 0x3a600000,
			.virt_start = 0x3a600000,
			.size = 0x4c00000,
			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE,
		},*/
	},

	.irqchips = {
		/* IOAPIC 13, GSI base 0 */
		{
			.address = 0xfec00000,
			.id = 0xa0,
			.pin_bitmap = {
				0xffffffff, 0xffffffff, 0xffffffff, 0xffffffff
			},
		},
		/* IOAPIC 14, GSI base 24 */
		{
			.address = 0xfec01000,
			.id = 0x1,
			.pin_bitmap = {
				0xffffffff, 0xffffffff, 0xffffffff, 0xffffffff
			},
		},
	},

	.pio_regions = {
		/* Port I/O: 0000-001f : dma1 */
		/* PIO_RANGE(0x0, 0x20), */
		/* Port I/O: 0020-0021 : pic1 */
		/* PIO_RANGE(0x20, 0x2), */
		/* Port I/O: 0040-0043 : timer0 */
		PIO_RANGE(0x40, 0x4),
		/* Port I/O: 0050-0053 : timer1 */
		/* PIO_RANGE(0x50, 0x4), */
		/* Port I/O: 0060-0060 : keyboard */
		PIO_RANGE(0x60, 0x1),
		/* Port I/O: 0061-0061 : PNP0800:00 */
		PIO_RANGE(0x61, 0x1),
		/* Port I/O: 0064-0064 : keyboard */
		PIO_RANGE(0x64, 0x1),
		/* Port I/O: 0070-0071 : rtc0 */
		PIO_RANGE(0x70, 0x2),
		/* Port I/O: 0080-008f : dma page reg */
		/* PIO_RANGE(0x80, 0x10), */
		/* Port I/O: 00a0-00a1 : pic2 */
		/* PIO_RANGE(0xa0, 0x2), */
		/* Port I/O: 00c0-00df : dma2 */
		/* PIO_RANGE(0xc0, 0x20), */
		/* Port I/O: 00f0-00ff : fpu */
		/* PIO_RANGE(0xf0, 0x10), */
		/* Port I/O: 0378-037a : parport0 */
		/* PIO_RANGE(0x378, 0x3), */
		/* Port I/O: 037b-037f : parport0 */
		/* PIO_RANGE(0x37b, 0x5), */
		/* Port I/O: 03b0-03df : PCI Bus 0000:00 */
		/* PIO_RANGE(0x3b0, 0x30), */
		/* Port I/O: 03f8-03ff : serial */
		PIO_RANGE(0x3f8, 0x8),
		/* Port I/O: 040b-040b : pnp 00:05 */
		/* PIO_RANGE(0x40b, 0x1), */
		/* Port I/O: 04d0-04d1 : pnp 00:05 */
		/* PIO_RANGE(0x4d0, 0x2), */
		/* Port I/O: 04d6-04d6 : pnp 00:05 */
		/* PIO_RANGE(0x4d6, 0x1), */
		/* Port I/O: 0800-0803 : ACPI PM1a_EVT_BLK */
		/* PIO_RANGE(0x800, 0x4), */
		/* Port I/O: 0804-0805 : ACPI PM1a_CNT_BLK */
		/* PIO_RANGE(0x804, 0x2), */
		/* Port I/O: 0808-080b : ACPI PM_TMR */
		/* PIO_RANGE(0x808, 0x4), */
		/* Port I/O: 0810-0815 : ACPI CPU throttle */
		/* PIO_RANGE(0x810, 0x6), */
		/* Port I/O: 0820-0827 : ACPI GPE0_BLK */
		/* PIO_RANGE(0x820, 0x8), */
		/* Port I/O: 0900-090f : pnp 00:05 */
		/* PIO_RANGE(0x900, 0x10), */
		/* Port I/O: 0910-091f : pnp 00:05 */
		/* PIO_RANGE(0x910, 0x10), */
		/* Port I/O: 0a00-0a2f : pnp 00:02 */
		/* PIO_RANGE(0xa00, 0x30), */
		/* Port I/O: 0a30-0a3f : pnp 00:02 */
		/* PIO_RANGE(0xa30, 0x10), */
		/* Port I/O: 0a40-0a4f : pnp 00:02 */
		/* PIO_RANGE(0xa40, 0x10), */
		/* Port I/O: 0b00-0b08 : piix4_smbus */
		/* PIO_RANGE(0xb00, 0x9), */
		/* Port I/O: 0b20-0b28 : piix4_smbus */
		/* PIO_RANGE(0xb20, 0x9), */
		/* Port I/O: 0c00-0c01 : pnp 00:05 */
		/* PIO_RANGE(0xc00, 0x2), */
		/* Port I/O: 0c14-0c14 : pnp 00:05 */
		/* PIO_RANGE(0xc14, 0x1), */
		/* Port I/O: 0c50-0c51 : pnp 00:05 */
		/* PIO_RANGE(0xc50, 0x2), */
		/* Port I/O: 0c52-0c52 : pnp 00:05 */
		/* PIO_RANGE(0xc52, 0x1), */
		/* Port I/O: 0c6c-0c6c : pnp 00:05 */
		/* PIO_RANGE(0xc6c, 0x1), */
		/* Port I/O: 0c6f-0c6f : pnp 00:05 */
		/* PIO_RANGE(0xc6f, 0x1), */
		/* Port I/O: 0cd0-0cd1 : pnp 00:05 */
		/* PIO_RANGE(0xcd0, 0x2), */
		/* Port I/O: 0cd2-0cd3 : pnp 00:05 */
		/* PIO_RANGE(0xcd2, 0x2), */
		/* Port I/O: 0cd4-0cd5 : pnp 00:05 */
		/* PIO_RANGE(0xcd4, 0x2), */
		/* Port I/O: 0cd6-0cd7 : pnp 00:05 */
		/* PIO_RANGE(0xcd6, 0x2), */
		/* Port I/O: 0cd8-0cdf : pnp 00:05 */
		/* PIO_RANGE(0xcd8, 0x8), */
		/* Port I/O: e000-e0ff : 0000:06:00.0 */
		PIO_RANGE(0xe000, 0x100),
		/* Port I/O: f000-f0ff : 0000:03:00.0 */
		PIO_RANGE(0xf000, 0x100),
		
		//pio range for invalid pio read, port 414 size 1
		PIO_RANGE(0x414, 0x1),
		
		PIO_RANGE(0x810, 0x4),
	},

	.pci_devices = {
	
		/* IVSHMEM: 00:05.0 - guest 1*/
		{
			.type = JAILHOUSE_PCI_TYPE_IVSHMEM,
			.domain = 0x0,
			.bdf = 0x28,
			.bar_mask = JAILHOUSE_IVSHMEM_BAR_MASK_MSIX,
			.num_msix_vectors = 2,
			.shmem_regions_start = 0,
			.shmem_dev_id = 0, 
			.shmem_peers = 2,
			.shmem_protocol = JAILHOUSE_SHMEM_PROTO_VETH,
		},
	

		/* PCIDevice: 00:00.0 */
		{
			.type = JAILHOUSE_PCI_TYPE_DEVICE,
			.domain = 0x0,
			.bdf = 0x0,
			.bar_mask = {
				0x00000000, 0x00000000, 0x00000000,
				0x00000000, 0x00000000, 0x00000000,
			},
			.caps_start = 0,
			.num_caps = 0,
			.num_msi_vectors = 0,
			.msi_64bits = 0,
			.msi_maskable = 0,
			.num_msix_vectors = 0,
			.msix_region_size = 0x0,
			.msix_address = 0x0,
		},
		/* PCIDevice: 00:01.0 */
		{
			.type = JAILHOUSE_PCI_TYPE_DEVICE,
			.iommu = 0,
			.domain = 0x0,
			.bdf = 0x8,
			.bar_mask = {
				0x00000000, 0x00000000, 0x00000000,
				0x00000000, 0x00000000, 0x00000000,
			},
			.caps_start = 0,
			.num_caps = 0,
			.num_msi_vectors = 0,
			.msi_64bits = 0,
			.msi_maskable = 0,
			.num_msix_vectors = 0,
			.msix_region_size = 0x0,
			.msix_address = 0x0,
		},
		/* PCIDevice: 00:01.3 */
		{
			.type = JAILHOUSE_PCI_TYPE_BRIDGE,
			.iommu = 0,
			.domain = 0x0,
			.bdf = 0xb,
			.bar_mask = {
				0x00000000, 0x00000000, 0x00000000,
				0x00000000, 0x00000000, 0x00000000,
			},
			.caps_start = 0,
			.num_caps = 11,
			.num_msi_vectors = 1,
			.msi_64bits = 1,
			.msi_maskable = 0,
			.num_msix_vectors = 0,
			.msix_region_size = 0x0,
			.msix_address = 0x0,
		},
		/* PCIDevice: 00:02.0 */
		{
			.type = JAILHOUSE_PCI_TYPE_DEVICE,
			.iommu = 0,
			.domain = 0x0,
			.bdf = 0x10,
			.bar_mask = {
				0x00000000, 0x00000000, 0x00000000,
				0x00000000, 0x00000000, 0x00000000,
			},
			.caps_start = 0,
			.num_caps = 0,
			.num_msi_vectors = 0,
			.msi_64bits = 0,
			.msi_maskable = 0,
			.num_msix_vectors = 0,
			.msix_region_size = 0x0,
			.msix_address = 0x0,
		},
		/* PCIDevice: 00:03.0 */
		{
			.type = JAILHOUSE_PCI_TYPE_DEVICE,
			.iommu = 0,
			.domain = 0x0,
			.bdf = 0x18,
			.bar_mask = {
				0x00000000, 0x00000000, 0x00000000,
				0x00000000, 0x00000000, 0x00000000,
			},
			.caps_start = 0,
			.num_caps = 0,
			.num_msi_vectors = 0,
			.msi_64bits = 0,
			.msi_maskable = 0,
			.num_msix_vectors = 0,
			.msix_region_size = 0x0,
			.msix_address = 0x0,
		},
		/* PCIDevice: 00:03.1 */
		{
			.type = JAILHOUSE_PCI_TYPE_BRIDGE,
			.iommu = 0,
			.domain = 0x0,
			.bdf = 0x19,
			.bar_mask = {
				0x00000000, 0x00000000, 0x00000000,
				0x00000000, 0x00000000, 0x00000000,
			},
			.caps_start = 0,
			.num_caps = 11,
			.num_msi_vectors = 1,
			.msi_64bits = 1,
			.msi_maskable = 0,
			.num_msix_vectors = 0,
			.msix_region_size = 0x0,
			.msix_address = 0x0,
		},
		/* PCIDevice: 00:04.0 */
		{
			.type = JAILHOUSE_PCI_TYPE_DEVICE,
			.iommu = 0,
			.domain = 0x0,
			.bdf = 0x20,
			.bar_mask = {
				0x00000000, 0x00000000, 0x00000000,
				0x00000000, 0x00000000, 0x00000000,
			},
			.caps_start = 0,
			.num_caps = 0,
			.num_msi_vectors = 0,
			.msi_64bits = 0,
			.msi_maskable = 0,
			.num_msix_vectors = 0,
			.msix_region_size = 0x0,
			.msix_address = 0x0,
		},
		/* PCIDevice: 00:07.0 */
		{
			.type = JAILHOUSE_PCI_TYPE_DEVICE,
			.iommu = 0,
			.domain = 0x0,
			.bdf = 0x38,
			.bar_mask = {
				0x00000000, 0x00000000, 0x00000000,
				0x00000000, 0x00000000, 0x00000000,
			},
			.caps_start = 0,
			.num_caps = 0,
			.num_msi_vectors = 0,
			.msi_64bits = 0,
			.msi_maskable = 0,
			.num_msix_vectors = 0,
			.msix_region_size = 0x0,
			.msix_address = 0x0,
		},
		/* PCIDevice: 00:07.1 */
		{
			.type = JAILHOUSE_PCI_TYPE_BRIDGE,
			.iommu = 0,
			.domain = 0x0,
			.bdf = 0x39,
			.bar_mask = {
				0x00000000, 0x00000000, 0x00000000,
				0x00000000, 0x00000000, 0x00000000,
			},
			.caps_start = 11,
			.num_caps = 9,
			.num_msi_vectors = 1,
			.msi_64bits = 1,
			.msi_maskable = 0,
			.num_msix_vectors = 0,
			.msix_region_size = 0x0,
			.msix_address = 0x0,
		},
		/* PCIDevice: 00:08.0 */
		{
			.type = JAILHOUSE_PCI_TYPE_DEVICE,
			.iommu = 0,
			.domain = 0x0,
			.bdf = 0x40,
			.bar_mask = {
				0x00000000, 0x00000000, 0x00000000,
				0x00000000, 0x00000000, 0x00000000,
			},
			.caps_start = 0,
			.num_caps = 0,
			.num_msi_vectors = 0,
			.msi_64bits = 0,
			.msi_maskable = 0,
			.num_msix_vectors = 0,
			.msix_region_size = 0x0,
			.msix_address = 0x0,
		},
		/* PCIDevice: 00:08.1 */
		{
			.type = JAILHOUSE_PCI_TYPE_BRIDGE,
			.iommu = 0,
			.domain = 0x0,
			.bdf = 0x41,
			.bar_mask = {
				0x00000000, 0x00000000, 0x00000000,
				0x00000000, 0x00000000, 0x00000000,
			},
			.caps_start = 11,
			.num_caps = 9,
			.num_msi_vectors = 1,
			.msi_64bits = 1,
			.msi_maskable = 0,
			.num_msix_vectors = 0,
			.msix_region_size = 0x0,
			.msix_address = 0x0,
		},
		/* PCIDevice: 00:14.0 */
		{
			.type = JAILHOUSE_PCI_TYPE_DEVICE,
			.iommu = 0,
			.domain = 0x0,
			.bdf = 0xa0,
			.bar_mask = {
				0x00000000, 0x00000000, 0x00000000,
				0x00000000, 0x00000000, 0x00000000,
			},
			.caps_start = 0,
			.num_caps = 0,
			.num_msi_vectors = 0,
			.msi_64bits = 0,
			.msi_maskable = 0,
			.num_msix_vectors = 0,
			.msix_region_size = 0x0,
			.msix_address = 0x0,
		},
		/* PCIDevice: 00:14.3 */
		{
			.type = JAILHOUSE_PCI_TYPE_DEVICE,
			.iommu = 0,
			.domain = 0x0,
			.bdf = 0xa3,
			.bar_mask = {
				0x00000000, 0x00000000, 0x00000000,
				0x00000000, 0x00000000, 0x00000000,
			},
			.caps_start = 0,
			.num_caps = 0,
			.num_msi_vectors = 0,
			.msi_64bits = 0,
			.msi_maskable = 0,
			.num_msix_vectors = 0,
			.msix_region_size = 0x0,
			.msix_address = 0x0,
		},
		/* PCIDevice: 00:18.0 */
		{
			.type = JAILHOUSE_PCI_TYPE_DEVICE,
			.iommu = 0,
			.domain = 0x0,
			.bdf = 0xc0,
			.bar_mask = {
				0x00000000, 0x00000000, 0x00000000,
				0x00000000, 0x00000000, 0x00000000,
			},
			.caps_start = 0,
			.num_caps = 0,
			.num_msi_vectors = 0,
			.msi_64bits = 0,
			.msi_maskable = 0,
			.num_msix_vectors = 0,
			.msix_region_size = 0x0,
			.msix_address = 0x0,
		},
		/* PCIDevice: 00:18.1 */
		{
			.type = JAILHOUSE_PCI_TYPE_DEVICE,
			.iommu = 0,
			.domain = 0x0,
			.bdf = 0xc1,
			.bar_mask = {
				0x00000000, 0x00000000, 0x00000000,
				0x00000000, 0x00000000, 0x00000000,
			},
			.caps_start = 0,
			.num_caps = 0,
			.num_msi_vectors = 0,
			.msi_64bits = 0,
			.msi_maskable = 0,
			.num_msix_vectors = 0,
			.msix_region_size = 0x0,
			.msix_address = 0x0,
		},
		/* PCIDevice: 00:18.2 */
		{
			.type = JAILHOUSE_PCI_TYPE_DEVICE,
			.iommu = 0,
			.domain = 0x0,
			.bdf = 0xc2,
			.bar_mask = {
				0x00000000, 0x00000000, 0x00000000,
				0x00000000, 0x00000000, 0x00000000,
			},
			.caps_start = 0,
			.num_caps = 0,
			.num_msi_vectors = 0,
			.msi_64bits = 0,
			.msi_maskable = 0,
			.num_msix_vectors = 0,
			.msix_region_size = 0x0,
			.msix_address = 0x0,
		},
		/* PCIDevice: 00:18.3 */
		{
			.type = JAILHOUSE_PCI_TYPE_DEVICE,
			.iommu = 0,
			.domain = 0x0,
			.bdf = 0xc3,
			.bar_mask = {
				0x00000000, 0x00000000, 0x00000000,
				0x00000000, 0x00000000, 0x00000000,
			},
			.caps_start = 0,
			.num_caps = 0,
			.num_msi_vectors = 0,
			.msi_64bits = 0,
			.msi_maskable = 0,
			.num_msix_vectors = 0,
			.msix_region_size = 0x0,
			.msix_address = 0x0,
		},
		/* PCIDevice: 00:18.4 */
		{
			.type = JAILHOUSE_PCI_TYPE_DEVICE,
			.iommu = 0,
			.domain = 0x0,
			.bdf = 0xc4,
			.bar_mask = {
				0x00000000, 0x00000000, 0x00000000,
				0x00000000, 0x00000000, 0x00000000,
			},
			.caps_start = 0,
			.num_caps = 0,
			.num_msi_vectors = 0,
			.msi_64bits = 0,
			.msi_maskable = 0,
			.num_msix_vectors = 0,
			.msix_region_size = 0x0,
			.msix_address = 0x0,
		},
		/* PCIDevice: 00:18.5 */
		{
			.type = JAILHOUSE_PCI_TYPE_DEVICE,
			.iommu = 0,
			.domain = 0x0,
			.bdf = 0xc5,
			.bar_mask = {
				0x00000000, 0x00000000, 0x00000000,
				0x00000000, 0x00000000, 0x00000000,
			},
			.caps_start = 0,
			.num_caps = 0,
			.num_msi_vectors = 0,
			.msi_64bits = 0,
			.msi_maskable = 0,
			.num_msix_vectors = 0,
			.msix_region_size = 0x0,
			.msix_address = 0x0,
		},
		/* PCIDevice: 00:18.6 */
		{
			.type = JAILHOUSE_PCI_TYPE_DEVICE,
			.iommu = 0,
			.domain = 0x0,
			.bdf = 0xc6,
			.bar_mask = {
				0x00000000, 0x00000000, 0x00000000,
				0x00000000, 0x00000000, 0x00000000,
			},
			.caps_start = 0,
			.num_caps = 0,
			.num_msi_vectors = 0,
			.msi_64bits = 0,
			.msi_maskable = 0,
			.num_msix_vectors = 0,
			.msix_region_size = 0x0,
			.msix_address = 0x0,
		},
		/* PCIDevice: 00:18.7 */
		{
			.type = JAILHOUSE_PCI_TYPE_DEVICE,
			.iommu = 0,
			.domain = 0x0,
			.bdf = 0xc7,
			.bar_mask = {
				0x00000000, 0x00000000, 0x00000000,
				0x00000000, 0x00000000, 0x00000000,
			},
			.caps_start = 0,
			.num_caps = 0,
			.num_msi_vectors = 0,
			.msi_64bits = 0,
			.msi_maskable = 0,
			.num_msix_vectors = 0,
			.msix_region_size = 0x0,
			.msix_address = 0x0,
		},
		/* PCIDevice: 01:00.0 */
		{
			.type = JAILHOUSE_PCI_TYPE_DEVICE,
			.iommu = 0,
			.domain = 0x0,
			.bdf = 0x100,
			.bar_mask = {
				0xffff8000, 0xffffffff, 0x00000000,
				0x00000000, 0x00000000, 0x00000000,
			},
			.caps_start = 20,
			.num_caps = 8,
			.num_msi_vectors = 8,
			.msi_64bits = 1,
			.msi_maskable = 0,
			.num_msix_vectors = 8,
			.msix_region_size = 0x1000,
			.msix_address = 0xfcda2000,
		},
		/* PCIDevice: 01:00.1 */
		{
			.type = JAILHOUSE_PCI_TYPE_DEVICE,
			.iommu = 0,
			.domain = 0x0,
			.bdf = 0x101,
			.bar_mask = {
				0x00000000, 0x00000000, 0x00000000,
				0x00000000, 0x00000000, 0xfffe0000,
			},
			.caps_start = 28,
			.num_caps = 4,
			.num_msi_vectors = 1,
			.msi_64bits = 1,
			.msi_maskable = 0,
			.num_msix_vectors = 0,
			.msix_region_size = 0x0,
			.msix_address = 0x0,
		},
		/* PCIDevice: 01:00.2 */
		{
			.type = JAILHOUSE_PCI_TYPE_BRIDGE,
			.iommu = 0,
			.domain = 0x0,
			.bdf = 0x102,
			.bar_mask = {
				0x00000000, 0x00000000, 0x00000000,
				0x00000000, 0x00000000, 0x00000000,
			},
			.caps_start = 32,
			.num_caps = 5,
			.num_msi_vectors = 1,
			.msi_64bits = 1,
			.msi_maskable = 0,
			.num_msix_vectors = 0,
			.msix_region_size = 0x0,
			.msix_address = 0x0,
		},
		/* PCIDevice: 02:00.0 */
		{
			.type = JAILHOUSE_PCI_TYPE_BRIDGE,
			.iommu = 0,
			.domain = 0x0,
			.bdf = 0x200,
			.bar_mask = {
				0x00000000, 0x00000000, 0x00000000,
				0x00000000, 0x00000000, 0x00000000,
			},
			.caps_start = 37,
			.num_caps = 7,
			.num_msi_vectors = 1,
			.msi_64bits = 1,
			.msi_maskable = 0,
			.num_msix_vectors = 0,
			.msix_region_size = 0x0,
			.msix_address = 0x0,
		},
		/* PCIDevice: 02:01.0 */
		{
			.type = JAILHOUSE_PCI_TYPE_BRIDGE,
			.iommu = 0,
			.domain = 0x0,
			.bdf = 0x208,
			.bar_mask = {
				0x00000000, 0x00000000, 0x00000000,
				0x00000000, 0x00000000, 0x00000000,
			},
			.caps_start = 37,
			.num_caps = 7,
			.num_msi_vectors = 1,
			.msi_64bits = 1,
			.msi_maskable = 0,
			.num_msix_vectors = 0,
			.msix_region_size = 0x0,
			.msix_address = 0x0,
		},
		/* PCIDevice: 02:04.0 */
		{
			.type = JAILHOUSE_PCI_TYPE_BRIDGE,
			.iommu = 0,
			.domain = 0x0,
			.bdf = 0x220,
			.bar_mask = {
				0x00000000, 0x00000000, 0x00000000,
				0x00000000, 0x00000000, 0x00000000,
			},
			.caps_start = 37,
			.num_caps = 7,
			.num_msi_vectors = 1,
			.msi_64bits = 1,
			.msi_maskable = 0,
			.num_msix_vectors = 0,
			.msix_region_size = 0x0,
			.msix_address = 0x0,
		},
		/* PCIDevice: 03:00.0 */
		{
			.type = JAILHOUSE_PCI_TYPE_DEVICE,
			.iommu = 0,
			.domain = 0x0,
			.bdf = 0x300,
			.bar_mask = {
				0xffffff00, 0x00000000, 0xfffff000,
				0xffffffff, 0xffffc000, 0xffffffff,
			},
			.caps_start = 44,
			.num_caps = 9,
			.num_msi_vectors = 1,
			.msi_64bits = 1,
			.msi_maskable = 0,
			.num_msix_vectors = 4,
			.msix_region_size = 0x1000,
			.msix_address = 0xfcc00000,
		},
		/* PCIDevice: 06:00.0 */
		{
			.type = JAILHOUSE_PCI_TYPE_DEVICE,
			.iommu = 0,
			.domain = 0x0,
			.bdf = 0x600,
			.bar_mask = {
				0xf0000000, 0xffffffff, 0xffe00000,
				0xffffffff, 0xffffff00, 0xfffc0000,
			},
			.caps_start = 53,
			.num_caps = 14,
			.num_msi_vectors = 1,
			.msi_64bits = 1,
			.msi_maskable = 0,
			.num_msix_vectors = 0,
			.msix_region_size = 0x0,
			.msix_address = 0x0,
		},
		/* PCIDevice: 06:00.1 */
		{
			.type = JAILHOUSE_PCI_TYPE_DEVICE,
			.iommu = 0,
			.domain = 0x0,
			.bdf = 0x601,
			.bar_mask = {
				0xffffc000, 0xffffffff, 0x00000000,
				0x00000000, 0x00000000, 0x00000000,
			},
			.caps_start = 67,
			.num_caps = 7,
			.num_msi_vectors = 1,
			.msi_64bits = 1,
			.msi_maskable = 0,
			.num_msix_vectors = 0,
			.msix_region_size = 0x0,
			.msix_address = 0x0,
		},
		/* PCIDevice: 07:00.0 */
		{
			.type = JAILHOUSE_PCI_TYPE_DEVICE,
			.iommu = 0,
			.domain = 0x0,
			.bdf = 0x700,
			.bar_mask = {
				0x00000000, 0x00000000, 0x00000000,
				0x00000000, 0x00000000, 0x00000000,
			},
			.caps_start = 74,
			.num_caps = 7,
			.num_msi_vectors = 0,
			.msi_64bits = 0,
			.msi_maskable = 0,
			.num_msix_vectors = 0,
			.msix_region_size = 0x0,
			.msix_address = 0x0,
		},
		/* PCIDevice: 07:00.2 */
		{
			.type = JAILHOUSE_PCI_TYPE_DEVICE,
			.iommu = 0,
			.domain = 0x0,
			.bdf = 0x702,
			.bar_mask = {
				0x00000000, 0x00000000, 0xfff00000,
				0x00000000, 0x00000000, 0xffffe000,
			},
			.caps_start = 81,
			.num_caps = 8,
			.num_msi_vectors = 2,
			.msi_64bits = 1,
			.msi_maskable = 0,
			.num_msix_vectors = 2,
			.msix_region_size = 0x1000,
			.msix_address = 0xfcb00000,
		},
		/* PCIDevice: 07:00.3 */
		{
			.type = JAILHOUSE_PCI_TYPE_DEVICE,
			.iommu = 0,
			.domain = 0x0,
			.bdf = 0x703,
			.bar_mask = {
				0xfff00000, 0xffffffff, 0x00000000,
				0x00000000, 0x00000000, 0x00000000,
			},
			.caps_start = 81,
			.num_caps = 8,
			.num_msi_vectors = 8,
			.msi_64bits = 1,
			.msi_maskable = 0,
			.num_msix_vectors = 8,
			.msix_region_size = 0x1000,
			.msix_address = 0xfc9fe000,
		},
		/* PCIDevice: 08:00.0 */
		{
			.type = JAILHOUSE_PCI_TYPE_DEVICE,
			.iommu = 0,
			.domain = 0x0,
			.bdf = 0x800,
			.bar_mask = {
				0x00000000, 0x00000000, 0x00000000,
				0x00000000, 0x00000000, 0x00000000,
			},
			.caps_start = 74,
			.num_caps = 7,
			.num_msi_vectors = 0,
			.msi_64bits = 0,
			.msi_maskable = 0,
			.num_msix_vectors = 0,
			.msix_region_size = 0x0,
			.msix_address = 0x0,
		},
		/* PCIDevice: 08:00.2 */
		{
			.type = JAILHOUSE_PCI_TYPE_DEVICE,
			.iommu = 0,
			.domain = 0x0,
			.bdf = 0x802,
			.bar_mask = {
				0x00000000, 0x00000000, 0x00000000,
				0x00000000, 0x00000000, 0xfffff000,
			},
			.caps_start = 89,
			.num_caps = 8,
			.num_msi_vectors = 16,
			.msi_64bits = 1,
			.msi_maskable = 0,
			.num_msix_vectors = 0,
			.msix_region_size = 0x0,
			.msix_address = 0x0,
		},
		/* PCIDevice: 08:00.3 */
		{
			.type = JAILHOUSE_PCI_TYPE_DEVICE,
			.iommu = 0,
			.domain = 0x0,
			.bdf = 0x803,
			.bar_mask = {
				0xffff8000, 0x00000000, 0x00000000,
				0x00000000, 0x00000000, 0x00000000,
			},
			.caps_start = 97,
			.num_caps = 7,
			.num_msi_vectors = 1,
			.msi_64bits = 1,
			.msi_maskable = 0,
			.num_msix_vectors = 0,
			.msix_region_size = 0x0,
			.msix_address = 0x0,
		},

	},

	.pci_caps = {
		/* PCIDevice: 00:01.3 */
		/* PCIDevice: 00:03.1 */
		{
			.id = PCI_CAP_ID_PM,
			.start = 0x50,
			.len = 0x8,
			.flags = JAILHOUSE_PCICAPS_WRITE,
		},
		{
			.id = PCI_CAP_ID_EXP,
			.start = 0x58,
			.len = 0x3c,
			.flags = 0,
		},
		{
			.id = PCI_CAP_ID_MSI,
			.start = 0xa0,
			.len = 0xe,
			.flags = JAILHOUSE_PCICAPS_WRITE,
		},
		{
			.id = PCI_CAP_ID_SSVID,
			.start = 0xc0,
			.len = 0x2,
			.flags = 0,
		},
		{
			.id = PCI_CAP_ID_HT,
			.start = 0xc8,
			.len = 0x2,
			.flags = 0,
		},
		{
			.id = PCI_EXT_CAP_ID_VNDR | JAILHOUSE_PCI_EXT_CAP,
			.start = 0x100,
			.len = 0x14,
			.flags = 0,
		},
		{
			.id = PCI_EXT_CAP_ID_ERR | JAILHOUSE_PCI_EXT_CAP,
			.start = 0x150,
			.len = 0x40,
			.flags = 0,
		},
		{
			.id = PCI_EXT_CAP_ID_SECPCI | JAILHOUSE_PCI_EXT_CAP,
			.start = 0x270,
			.len = 0x10,
			.flags = 0,
		},
		{
			.id = PCI_EXT_CAP_ID_ACS | JAILHOUSE_PCI_EXT_CAP,
			.start = 0x2a0,
			.len = 0x8,
			.flags = 0,
		},
		{
			.id = PCI_EXT_CAP_ID_L1SS | JAILHOUSE_PCI_EXT_CAP,
			.start = 0x370,
			.len = 0x4,
			.flags = 0,
		},
		{
			.id = 0x23 | JAILHOUSE_PCI_EXT_CAP,
			.start = 0x3c4,
			.len = 0x4,
			.flags = 0,
		},
		/* PCIDevice: 00:07.1 */
		/* PCIDevice: 00:08.1 */
		{
			.id = PCI_CAP_ID_PM,
			.start = 0x50,
			.len = 0x8,
			.flags = JAILHOUSE_PCICAPS_WRITE,
		},
		{
			.id = PCI_CAP_ID_EXP,
			.start = 0x58,
			.len = 0x3c,
			.flags = 0,
		},
		{
			.id = PCI_CAP_ID_MSI,
			.start = 0xa0,
			.len = 0xe,
			.flags = JAILHOUSE_PCICAPS_WRITE,
		},
		{
			.id = PCI_CAP_ID_SSVID,
			.start = 0xc0,
			.len = 0x2,
			.flags = 0,
		},
		{
			.id = PCI_CAP_ID_HT,
			.start = 0xc8,
			.len = 0x2,
			.flags = 0,
		},
		{
			.id = PCI_EXT_CAP_ID_VNDR | JAILHOUSE_PCI_EXT_CAP,
			.start = 0x100,
			.len = 0x14,
			.flags = 0,
		},
		{
			.id = PCI_EXT_CAP_ID_ERR | JAILHOUSE_PCI_EXT_CAP,
			.start = 0x150,
			.len = 0x40,
			.flags = 0,
		},
		{
			.id = PCI_EXT_CAP_ID_SECPCI | JAILHOUSE_PCI_EXT_CAP,
			.start = 0x270,
			.len = 0x10,
			.flags = 0,
		},
		{
			.id = PCI_EXT_CAP_ID_ACS | JAILHOUSE_PCI_EXT_CAP,
			.start = 0x2a0,
			.len = 0x8,
			.flags = 0,
		},
		/* PCIDevice: 01:00.0 */
		{
			.id = PCI_CAP_ID_MSI,
			.start = 0x50,
			.len = 0xe,
			.flags = JAILHOUSE_PCICAPS_WRITE,
		},
		{
			.id = PCI_CAP_ID_MSIX,
			.start = 0x68,
			.len = 0xc,
			.flags = JAILHOUSE_PCICAPS_WRITE,
		},
		{
			.id = PCI_CAP_ID_PM,
			.start = 0x78,
			.len = 0x8,
			.flags = JAILHOUSE_PCICAPS_WRITE,
		},
		{
			.id = PCI_CAP_ID_EXP,
			.start = 0x80,
			.len = 0x3c,
			.flags = 0,
		},
		{
			.id = PCI_EXT_CAP_ID_ERR | JAILHOUSE_PCI_EXT_CAP,
			.start = 0x100,
			.len = 0x40,
			.flags = 0,
		},
		{
			.id = PCI_EXT_CAP_ID_SECPCI | JAILHOUSE_PCI_EXT_CAP,
			.start = 0x200,
			.len = 0x10,
			.flags = 0,
		},
		{
			.id = PCI_EXT_CAP_ID_LTR | JAILHOUSE_PCI_EXT_CAP,
			.start = 0x300,
			.len = 0x8,
			.flags = 0,
		},
		{
			.id = PCI_EXT_CAP_ID_L1SS | JAILHOUSE_PCI_EXT_CAP,
			.start = 0x400,
			.len = 0x4,
			.flags = 0,
		},
		/* PCIDevice: 01:00.1 */
		{
			.id = PCI_CAP_ID_MSI,
			.start = 0x50,
			.len = 0xe,
			.flags = JAILHOUSE_PCICAPS_WRITE,
		},
		{
			.id = PCI_CAP_ID_PM,
			.start = 0x78,
			.len = 0x8,
			.flags = JAILHOUSE_PCICAPS_WRITE,
		},
		{
			.id = PCI_CAP_ID_EXP,
			.start = 0x80,
			.len = 0x3c,
			.flags = 0,
		},
		{
			.id = PCI_EXT_CAP_ID_ERR | JAILHOUSE_PCI_EXT_CAP,
			.start = 0x100,
			.len = 0x40,
			.flags = 0,
		},
		/* PCIDevice: 01:00.2 */
		{
			.id = PCI_CAP_ID_MSI,
			.start = 0x50,
			.len = 0xe,
			.flags = JAILHOUSE_PCICAPS_WRITE,
		},
		{
			.id = PCI_CAP_ID_PM,
			.start = 0x78,
			.len = 0x8,
			.flags = JAILHOUSE_PCICAPS_WRITE,
		},
		{
			.id = PCI_CAP_ID_EXP,
			.start = 0x80,
			.len = 0x3c,
			.flags = 0,
		},
		{
			.id = PCI_CAP_ID_SSVID,
			.start = 0xc0,
			.len = 0x2,
			.flags = 0,
		},
		{
			.id = PCI_EXT_CAP_ID_ERR | JAILHOUSE_PCI_EXT_CAP,
			.start = 0x100,
			.len = 0x40,
			.flags = 0,
		},
		/* PCIDevice: 02:00.0 */
		/* PCIDevice: 02:01.0 */
		/* PCIDevice: 02:04.0 */
		{
			.id = PCI_CAP_ID_MSI,
			.start = 0x50,
			.len = 0xe,
			.flags = JAILHOUSE_PCICAPS_WRITE,
		},
		{
			.id = PCI_CAP_ID_PM,
			.start = 0x78,
			.len = 0x8,
			.flags = JAILHOUSE_PCICAPS_WRITE,
		},
		{
			.id = PCI_CAP_ID_EXP,
			.start = 0x80,
			.len = 0x3c,
			.flags = 0,
		},
		{
			.id = PCI_CAP_ID_SSVID,
			.start = 0xc0,
			.len = 0x2,
			.flags = 0,
		},
		{
			.id = PCI_EXT_CAP_ID_ERR | JAILHOUSE_PCI_EXT_CAP,
			.start = 0x100,
			.len = 0x40,
			.flags = 0,
		},
		{
			.id = PCI_EXT_CAP_ID_SECPCI | JAILHOUSE_PCI_EXT_CAP,
			.start = 0x200,
			.len = 0x10,
			.flags = 0,
		},
		{
			.id = PCI_EXT_CAP_ID_L1SS | JAILHOUSE_PCI_EXT_CAP,
			.start = 0x400,
			.len = 0x4,
			.flags = 0,
		},
		/* PCIDevice: 03:00.0 */
		{
			.id = PCI_CAP_ID_PM,
			.start = 0x40,
			.len = 0x8,
			.flags = JAILHOUSE_PCICAPS_WRITE,
		},
		{
			.id = PCI_CAP_ID_MSI,
			.start = 0x50,
			.len = 0xe,
			.flags = JAILHOUSE_PCICAPS_WRITE,
		},
		{
			.id = PCI_CAP_ID_EXP,
			.start = 0x70,
			.len = 0x3c,
			.flags = 0,
		},
		{
			.id = PCI_CAP_ID_MSIX,
			.start = 0xb0,
			.len = 0xc,
			.flags = JAILHOUSE_PCICAPS_WRITE,
		},
		{
			.id = PCI_EXT_CAP_ID_ERR | JAILHOUSE_PCI_EXT_CAP,
			.start = 0x100,
			.len = 0x40,
			.flags = 0,
		},
		{
			.id = PCI_EXT_CAP_ID_VC | JAILHOUSE_PCI_EXT_CAP,
			.start = 0x140,
			.len = 0x10,
			.flags = 0,
		},
		{
			.id = PCI_EXT_CAP_ID_DSN | JAILHOUSE_PCI_EXT_CAP,
			.start = 0x160,
			.len = 0xc,
			.flags = 0,
		},
		{
			.id = PCI_EXT_CAP_ID_LTR | JAILHOUSE_PCI_EXT_CAP,
			.start = 0x170,
			.len = 0x8,
			.flags = 0,
		},
		{
			.id = PCI_EXT_CAP_ID_L1SS | JAILHOUSE_PCI_EXT_CAP,
			.start = 0x178,
			.len = 0x4,
			.flags = 0,
		},
		/* PCIDevice: 06:00.0 */
		{
			.id = PCI_CAP_ID_VNDR,
			.start = 0x48,
			.len = 0x2,
			.flags = 0,
		},
		{
			.id = PCI_CAP_ID_PM,
			.start = 0x50,
			.len = 0x8,
			.flags = JAILHOUSE_PCICAPS_WRITE,
		},
		{
			.id = PCI_CAP_ID_EXP,
			.start = 0x58,
			.len = 0x3c,
			.flags = 0,
		},
		{
			.id = PCI_CAP_ID_MSI,
			.start = 0xa0,
			.len = 0xe,
			.flags = JAILHOUSE_PCICAPS_WRITE,
		},
		{
			.id = PCI_EXT_CAP_ID_VNDR | JAILHOUSE_PCI_EXT_CAP,
			.start = 0x100,
			.len = 0x14,
			.flags = 0,
		},
		{
			.id = PCI_EXT_CAP_ID_ERR | JAILHOUSE_PCI_EXT_CAP,
			.start = 0x150,
			.len = 0x40,
			.flags = 0,
		},
		{
			.id = PCI_EXT_CAP_ID_REBAR | JAILHOUSE_PCI_EXT_CAP,
			.start = 0x200,
			.len = 0x4,
			.flags = 0,
		},
		{
			.id = PCI_EXT_CAP_ID_SECPCI | JAILHOUSE_PCI_EXT_CAP,
			.start = 0x270,
			.len = 0x10,
			.flags = 0,
		},
		{
			.id = PCI_EXT_CAP_ID_ATS | JAILHOUSE_PCI_EXT_CAP,
			.start = 0x2b0,
			.len = 0x4,
			.flags = 0,
		},
		{
			.id = PCI_EXT_CAP_ID_PRI | JAILHOUSE_PCI_EXT_CAP,
			.start = 0x2c0,
			.len = 0x4,
			.flags = 0,
		},
		{
			.id = PCI_EXT_CAP_ID_PASID | JAILHOUSE_PCI_EXT_CAP,
			.start = 0x2d0,
			.len = 0x8,
			.flags = 0,
		},
		{
			.id = PCI_EXT_CAP_ID_LTR | JAILHOUSE_PCI_EXT_CAP,
			.start = 0x320,
			.len = 0x8,
			.flags = 0,
		},
		{
			.id = PCI_EXT_CAP_ID_ARI | JAILHOUSE_PCI_EXT_CAP,
			.start = 0x328,
			.len = 0x8,
			.flags = 0,
		},
		{
			.id = PCI_EXT_CAP_ID_L1SS | JAILHOUSE_PCI_EXT_CAP,
			.start = 0x370,
			.len = 0x4,
			.flags = 0,
		},
		/* PCIDevice: 06:00.1 */
		{
			.id = PCI_CAP_ID_VNDR,
			.start = 0x48,
			.len = 0x2,
			.flags = 0,
		},
		{
			.id = PCI_CAP_ID_PM,
			.start = 0x50,
			.len = 0x8,
			.flags = JAILHOUSE_PCICAPS_WRITE,
		},
		{
			.id = PCI_CAP_ID_EXP,
			.start = 0x58,
			.len = 0x3c,
			.flags = 0,
		},
		{
			.id = PCI_CAP_ID_MSI,
			.start = 0xa0,
			.len = 0xe,
			.flags = JAILHOUSE_PCICAPS_WRITE,
		},
		{
			.id = PCI_EXT_CAP_ID_VNDR | JAILHOUSE_PCI_EXT_CAP,
			.start = 0x100,
			.len = 0x14,
			.flags = 0,
		},
		{
			.id = PCI_EXT_CAP_ID_ERR | JAILHOUSE_PCI_EXT_CAP,
			.start = 0x150,
			.len = 0x40,
			.flags = 0,
		},
		{
			.id = PCI_EXT_CAP_ID_ARI | JAILHOUSE_PCI_EXT_CAP,
			.start = 0x328,
			.len = 0x8,
			.flags = 0,
		},
		/* PCIDevice: 07:00.0 */
		/* PCIDevice: 08:00.0 */
		{
			.id = PCI_CAP_ID_VNDR,
			.start = 0x48,
			.len = 0x2,
			.flags = 0,
		},
		{
			.id = PCI_CAP_ID_PM,
			.start = 0x50,
			.len = 0x8,
			.flags = JAILHOUSE_PCICAPS_WRITE,
		},
		{
			.id = PCI_CAP_ID_EXP,
			.start = 0x64,
			.len = 0x3c,
			.flags = 0,
		},
		{
			.id = PCI_EXT_CAP_ID_VNDR | JAILHOUSE_PCI_EXT_CAP,
			.start = 0x100,
			.len = 0x14,
			.flags = 0,
		},
		{
			.id = PCI_EXT_CAP_ID_ERR | JAILHOUSE_PCI_EXT_CAP,
			.start = 0x150,
			.len = 0x40,
			.flags = 0,
		},
		{
			.id = PCI_EXT_CAP_ID_SECPCI | JAILHOUSE_PCI_EXT_CAP,
			.start = 0x270,
			.len = 0x10,
			.flags = 0,
		},
		{
			.id = PCI_EXT_CAP_ID_ACS | JAILHOUSE_PCI_EXT_CAP,
			.start = 0x2a0,
			.len = 0x8,
			.flags = 0,
		},
		/* PCIDevice: 07:00.2 */
		/* PCIDevice: 07:00.3 */
		{
			.id = PCI_CAP_ID_VNDR,
			.start = 0x48,
			.len = 0x2,
			.flags = 0,
		},
		{
			.id = PCI_CAP_ID_PM,
			.start = 0x50,
			.len = 0x8,
			.flags = JAILHOUSE_PCICAPS_WRITE,
		},
		{
			.id = PCI_CAP_ID_EXP,
			.start = 0x64,
			.len = 0x3c,
			.flags = 0,
		},
		{
			.id = PCI_CAP_ID_MSI,
			.start = 0xa0,
			.len = 0xe,
			.flags = JAILHOUSE_PCICAPS_WRITE,
		},
		{
			.id = PCI_CAP_ID_MSIX,
			.start = 0xc0,
			.len = 0xc,
			.flags = JAILHOUSE_PCICAPS_WRITE,
		},
		{
			.id = PCI_EXT_CAP_ID_VNDR | JAILHOUSE_PCI_EXT_CAP,
			.start = 0x100,
			.len = 0x14,
			.flags = 0,
		},
		{
			.id = PCI_EXT_CAP_ID_ERR | JAILHOUSE_PCI_EXT_CAP,
			.start = 0x150,
			.len = 0x40,
			.flags = 0,
		},
		{
			.id = PCI_EXT_CAP_ID_ACS | JAILHOUSE_PCI_EXT_CAP,
			.start = 0x2a0,
			.len = 0x8,
			.flags = 0,
		},
		/* PCIDevice: 08:00.2 */
		{
			.id = PCI_CAP_ID_VNDR,
			.start = 0x48,
			.len = 0x2,
			.flags = 0,
		},
		{
			.id = PCI_CAP_ID_PM,
			.start = 0x50,
			.len = 0x8,
			.flags = JAILHOUSE_PCICAPS_WRITE,
		},
		{
			.id = PCI_CAP_ID_EXP,
			.start = 0x64,
			.len = 0x3c,
			.flags = 0,
		},
		{
			.id = PCI_CAP_ID_MSI,
			.start = 0xa0,
			.len = 0xe,
			.flags = JAILHOUSE_PCICAPS_WRITE,
		},
		{
			.id = PCI_CAP_ID_SATA,
			.start = 0xd0,
			.len = 0x2,
			.flags = 0,
		},
		{
			.id = PCI_EXT_CAP_ID_VNDR | JAILHOUSE_PCI_EXT_CAP,
			.start = 0x100,
			.len = 0x14,
			.flags = 0,
		},
		{
			.id = PCI_EXT_CAP_ID_ERR | JAILHOUSE_PCI_EXT_CAP,
			.start = 0x150,
			.len = 0x40,
			.flags = 0,
		},
		{
			.id = PCI_EXT_CAP_ID_ACS | JAILHOUSE_PCI_EXT_CAP,
			.start = 0x2a0,
			.len = 0x8,
			.flags = 0,
		},
		/* PCIDevice: 08:00.3 */
		{
			//.id = PCI_CAP_ID_VNDR,
			.start = 0x42,
			.len = 0x1,
			.flags = JAILHOUSE_PCICAPS_WRITE,
		},
		{
			.id = PCI_CAP_ID_VNDR,
			.start = 0x48,
			.len = 0x2,
			.flags = 0,
		},
		{
			.id = PCI_CAP_ID_PM,
			.start = 0x50,
			.len = 0x8,
			.flags = JAILHOUSE_PCICAPS_WRITE,
		},
		{
			.id = PCI_CAP_ID_EXP,
			.start = 0x64,
			.len = 0x3c,
			.flags = JAILHOUSE_PCICAPS_WRITE,
		},
		{
			.id = PCI_CAP_ID_MSI,
			.start = 0xa0,
			.len = 0xe,
			.flags = JAILHOUSE_PCICAPS_WRITE,
		},
		{
			.id = PCI_EXT_CAP_ID_VNDR | JAILHOUSE_PCI_EXT_CAP,
			.start = 0x100,
			.len = 0x14,
			.flags = 0,
		},
		{
			.id = PCI_EXT_CAP_ID_ERR | JAILHOUSE_PCI_EXT_CAP,
			.start = 0x150,
			.len = 0x40,
			.flags = JAILHOUSE_PCICAPS_WRITE,
		},
		{
			.id = PCI_EXT_CAP_ID_ACS | JAILHOUSE_PCI_EXT_CAP,
			.start = 0x2a0,
			.len = 0x9,
			.flags = JAILHOUSE_PCICAPS_WRITE,
		},
	},
};

------=_Part_24982_23890251.1705492330200--
