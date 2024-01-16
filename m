Return-Path: <jailhouse-dev+bncBDIJ36FET4JRBFVZTOWQMGQETFQB3PI@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-yb1-xb38.google.com (mail-yb1-xb38.google.com [IPv6:2607:f8b0:4864:20::b38])
	by mail.lfdr.de (Postfix) with ESMTPS id 8748C82F5C0
	for <lists+jailhouse-dev@lfdr.de>; Tue, 16 Jan 2024 20:44:24 +0100 (CET)
Received: by mail-yb1-xb38.google.com with SMTP id 3f1490d57ef6-dc21cba32adsf2179054276.1
        for <lists+jailhouse-dev@lfdr.de>; Tue, 16 Jan 2024 11:44:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20230601; t=1705434263; x=1706039063; darn=lfdr.de;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:x-original-sender:mime-version
         :subject:references:in-reply-to:message-id:to:from:date:sender:from
         :to:cc:subject:date:message-id:reply-to;
        bh=RBZRyYIXpKgPPvRPKcuTw1NHAXEojOv1PnayvR3qYIo=;
        b=M5iwRRbZamCcWvl2mMIGqZ+KAIZCLY6SvP60FyjV/aUx4QynIat74UX5ziyJWSUIex
         +ERpWQUjtb1wQeooJtJsEzuY+tYkoybqxVa8/HK8iqRYQb6Gdv+e3AIyI7PTNGk9Homc
         pw6pP5fQhp94IucREuv/O4SbnGVSMQ4PIOlUSrKqDKnOLqT2ayZsvXMeTE+rS0dJTal+
         6lcJ5I/+04ud51qJN3A+lnU7nDqL5S48cMzgZEr5RXWehjpSiWka5lf3WpqandZgcKPx
         yi+IxXfjuFoV1I23PdKu2akG9X2iER6ZujHqTMvrFx/SqW2Ht2xq4OipUcK6q8Fij9yf
         11wA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1705434263; x=1706039063; darn=lfdr.de;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:x-original-sender:mime-version
         :subject:references:in-reply-to:message-id:to:from:date:from:to:cc
         :subject:date:message-id:reply-to;
        bh=RBZRyYIXpKgPPvRPKcuTw1NHAXEojOv1PnayvR3qYIo=;
        b=Ne2OBKbsEGi/whTojasMSIgs8dvu+Zbe/3aPdpiomBTtTvqXJAmXTFpAz0A14Fa27j
         YKwcAdtQxlHnDSC/+p1Ud1Qm8mFKvReH9SX/6D0r7cEW8sJoVExedMK3p4Y1u/vPgApH
         DId+ZytxqyHV5zFA4MKtQIh3hHivyFEcWZ3FS0/jtihpFKfweCBlJFwu4bktUpxUw+mX
         syOzuX3onyZ3ok1UctCY1GZkHx64Q4JYRHKSSJY5GrqyAtCvxShjHqwoObX5MpLWo8Tm
         xT5L4vqSAeUbPK6Pb88BuRzfXdv3skZVxBe0txTBSGaD0zorNMIGSEfHR/YRvnDRbE8A
         v7zA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1705434263; x=1706039063;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :x-spam-checked-in-group:list-id:mailing-list:precedence
         :x-original-sender:mime-version:subject:references:in-reply-to
         :message-id:to:from:date:x-beenthere:x-gm-message-state:sender:from
         :to:cc:subject:date:message-id:reply-to;
        bh=RBZRyYIXpKgPPvRPKcuTw1NHAXEojOv1PnayvR3qYIo=;
        b=YrwXFfIW2bfROKMGbfNW6ECr6P+ixXKSGBAVy8KvE1mf4uB7upYRgewPptTZrTCtg1
         7cmo5zhGbEXKIUt0Ri1W/mC+DGVbPf+6Vecr+pjmmFBeK8Ft2mWYJXm84rEK5AzXzBtr
         rTbAp2QaeR0OKezv6ca4FkiGbVQU8P4T5mbj7zrsuGc/S9PUbxoZdJ734+gwPPRfRMmc
         H9PO0RH7RtFdxenbTb4hQ5HOwV//e64qTavr1FFz4ewCfo7eGNkh5QRTDXyKv4hkifQl
         MV0BoaKnvF4XDUiWTfRX6SVitREYcWnRmquUdMFvPq8riZqE7kPPtkH2N48rVrPe+b8r
         7E1Q==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AOJu0YzcrQrdzDTqX4ZN0aidZXPEuxkp+EZRd3p+x5hYsgivp9APwswb
	hP9IRPiqylKVl8ql2BYa++U=
X-Google-Smtp-Source: AGHT+IEvp1BKcwdY6bWSbDU3wv6rI+MrHO0EwOWbewXmBfYtenTXQB4AIVMdMDluwKxync2w9hXyDA==
X-Received: by 2002:a25:dbc4:0:b0:dbd:7282:8c72 with SMTP id g187-20020a25dbc4000000b00dbd72828c72mr4253231ybf.52.1705434263060;
        Tue, 16 Jan 2024 11:44:23 -0800 (PST)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a25:d885:0:b0:dc2:2e01:4ff7 with SMTP id p127-20020a25d885000000b00dc22e014ff7ls830620ybg.0.-pod-prod-03-us;
 Tue, 16 Jan 2024 11:44:21 -0800 (PST)
X-Received: by 2002:a81:be02:0:b0:5fb:fd6d:c197 with SMTP id i2-20020a81be02000000b005fbfd6dc197mr2587074ywn.1.1705434261438;
        Tue, 16 Jan 2024 11:44:21 -0800 (PST)
Date: Tue, 16 Jan 2024 11:44:20 -0800 (PST)
From: =?UTF-8?Q?Michele_Pescap=C3=A8?= <mic.pescape@gmail.com>
To: Jailhouse <jailhouse-dev@googlegroups.com>
Message-Id: <6fb04e63-2f4a-4d5b-9139-c11e9a9fc461n@googlegroups.com>
In-Reply-To: <78750023-1199-41e6-bee9-549c185d160c@oth-regensburg.de>
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
 <78750023-1199-41e6-bee9-549c185d160c@oth-regensburg.de>
Subject: Re: Unable to start non root linux cell
MIME-Version: 1.0
Content-Type: multipart/mixed; 
	boundary="----=_Part_96_585508954.1705434260529"
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

------=_Part_96_585508954.1705434260529
Content-Type: multipart/alternative; 
	boundary="----=_Part_97_1358540854.1705434260529"

------=_Part_97_1358540854.1705434260529
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi,

I'm trying to give network access to the non root cell, however it seems=20
that I'm not able to pass the right PCI device. It always defaults to=20
taking away the 00:00.0 pci device from the root cell causing a crash for=
=20
the root cell.

In both the root and non root cell's configs I added the shared memory=20
regions using the macro JAILHOUSE_SHMEM_NET_REGIONS(0x60000000, 0) for the=
=20
root and using dev_id=3D1 for the non root. The resulting regions do not=20
overlap other memory regions, config check does not return any errors.

I also added the following PCI device in both cells, where=20
.shmem_regions_start is assigned to the correct index for the first shared=
=20
memory region created using the aforementioned macro.

/* IVSHMEM: 00:05.0 */
{
.type =3D JAILHOUSE_PCI_TYPE_IVSHMEM,
.domain =3D 0x0,
.bdf =3D 0x28,
.bar_mask =3D JAILHOUSE_IVSHMEM_BAR_MASK_MSIX,
.num_msix_vectors =3D 2,
.shmem_regions_start =3D 0,
.shmem_dev_id =3D 0,   (1 in the non root cell)
.shmem_peers =3D 2,
.shmem_protocol =3D JAILHOUSE_SHMEM_PROTO_VETH,
},

I tried using different values for the .bdf, none of which were already=20
used by other devices but none worked. The root cell always sees the new=20
device correctly when starting the hypervisor, I can also see it with lspci=
=20
and ifconfig, however once I issue the cell linux command to start the non=
=20
root cell, I get the following output followed by a streak of errors from=
=20
the hypervisor, forcing a manual reset.

Removing PCI device 00:00.0 from cell "RootCell"
Adding PCI device 00:00.0 to cell "linux-1"
FATAL: unable to get MMIO instruction
FATAL: Invalid MMIO/RAM write, addr: 0x0000000106d8c020 size: 0
RIP: 0xffffffffa910ff4c RSP: 0xffffab85400f7de0 FLAGS: 93
RAX: 0x0000000000000000 RBX: 0x000000000002f170 RCX: 0x0000000000000040
RDX: 0x0000000000000414 RSI: 0xffff8b6000955400 RDI: 0x0000000000000001
CS: 10 BASE: 0x0000000000000000 AR-BYTES: 29b EFER.LMA 1
CR0: 0x0000000080050033 CR3: 0x0000000106d8c000 CR4: 0x00000000003506a0
EFER: 0x0000000000001d01
Parking CPU 4 (Cell: "RootCell")
(etc..)

I'm not sure what I'm missing here, CONFIG_IVSHMEM_NET is enabled in both=
=20
the root and non root kernel config, I also enabled CONFIG_PCI_HOST_GENERIC=
=20
in the root linux as suggested in one of the conversations on this site.

Thanks,
Michele


Il giorno domenica 14 gennaio 2024 alle 15:49:40 UTC+1 Ralf Ramsauer ha=20
scritto:

> Hi Michele,
>
> On 14/01/2024 02:18, Michele Pescap=C3=A8 wrote:
> > Hi,
> >=20
> > There were PIO writes to ports 4e,4f,2e and 2f, each of size 1 and each=
=20
> > one on subsequent restarts. I'm not sure how to figure out what they=20
> > belong to.
>
> Easy and straight forward: Read the jailhouse crash dump.
>
> Look at the program counter, and maybe the return address. Disassemble=20
> your kernel (objdump -d vmlinux) and lookup that address. Now you know=20
> the name of the routine in the kernel that caused the crash.
>
> Don't simply whitelist ports. Only whitelist them, if you're sure what=20
> you're doing.
>
> >=20
> > CONFIG_ISA_DMA_API is already disabled.
> >=20
> > I missed the irqchip for the uart. However as of right now I just copie=
d=20
> > the whole fragment from the root configuration which means I could be=
=20
> > taking away other interrupts from the root cell, I still have to figure=
=20
> > out how to tune that
> >=20
> > /* IOAPIC 13, GSI base 0 */
> > {
> > .address =3D 0xfec00000,
> > .id =3D 0xa0,
> > .pin_bitmap =3D {
> > 0xffffffff, 0xffffffff, 0xffffffff, 0xffffffff
>
> With this, you take away ALL interrupts from the root cell, which you=20
> don't want to do, you only want to take away the interrupt that=20
> corresponds to ttyS0 (i.e. Port 0x3f8).
>
> See here: https://en.wikipedia.org/wiki/COM_(hardware_interface)
>
> COM1: I/O port 0x3F8, IRQ 4
>
> So you want to only assign IRQ 4 to your non-root cell. See=20
> linux-x86-demo.c to see how that works.
>
> > },
> > },
> >=20
> > Still, now I can finally login into the non root linux.
>
> Excellent!
>
> Ralf
>
> >=20
> > Thanks,
> > Michele
> >=20
> > Il giorno sabato 13 gennaio 2024 alle 21:09:28 UTC+1 Ralf Ramsauer ha=
=20
> > scritto:
> >=20
> > Hi Michele,
> >=20
> > On 13/01/2024 18:08, Michele Pescap=C3=A8 wrote:
> > > Hi,
> > >
> > > The problem was that the ram regions in the non root configuration
> > > weren't detected as such because of the missing JAILHOUSE_MEM_DMA
> > flag.
> >=20
> > Yikes, makes sense.
> >=20
> > > After adding that, I also had to add two pio_regions because the non
> > > root linux was crashing because of two ports which aren't present in
> > > /proc/ioports.
> >=20
> > Uhm - which PIO ports? Don't simply assign PIO ports. There must be a
> > reason for them. What ports did crash?
> >=20
> > Did you disable(!) CONFIG_ISA_DMA_API? Please disable it. Therefore,
> > you
> > have to activate CONFIG_EXPERT first.
> >=20
> > I *bet* it was i8237=E2=80=A6
> >=20
> > > I also had to add mce=3Doff to the command line because i had an
> > unhandled
> >=20
> > or disable CONFIG_X86_MCE.
> >=20
> > > MSR error, I'll have to disable that in the kernel config.
> > > At this point the non root linux seems to start, I see the boot
> > log. No
> >=20
> > Excellent!
> >=20
> > > way of interacting with it as there is not a login prompt or
> > anything, I
> > > think I need to ssh to the cell at this point, right?
> >=20
> > Was the initramdisk loaded correctly?
> >=20
> > Did you assign - in your non-root cell config - the irqchip and the
> > corresponding interrupts of the uart?
> >=20
> > > That means I'll now need to work on those ivshmem net devices.
> >=20
> > If you need ivshmem, then this would be the next step.
> >=20
> > Ralf
> >=20
> > >
> > > Thanks,
> > > Michele
> > >
> > > Il giorno sabato 13 gennaio 2024 alle 15:13:12 UTC+1 Ralf
> > Ramsauer ha
> > > scritto:
> > >
> > > Hi,
> > >
> > > On 13/01/2024 12:28, Michele Pescap=C3=A8 wrote:
> > > > Hi,
> > > >
> > > > You are right, I got confused about those addresses, my bad. At
> > > least
> > > > now I know that config is the correct one and I don't have to
> > tinker
> > > > with it.
> > > > I'm back to a kernel panic from the inmate when booting the cell.
> > > It's
> > > > similar to the one I had earlier, not sure yet of what the
> > > problem may be.
> > >
> > > Great, we're a step further.
> > >
> > > >
> > > > Created cell "linux-2"
> > > > Page pool usage after cell creation: mem 406/32211, remap
> > > 16392/131072
> > > > Cell "linux-2" can be loaded
> > > > CPU 9 received SIPI, vector 100
> > > > Started cell "linux-2"
> > > > CPU 8 received SIPI, vector 100
> > > > No EFI environment detected.
> > > > early console in extract_kernel
> > > > input_data: 0x000000000275c308
> > > > input_len: 0x00000000008b0981
> > > > output: 0x0000000001000000
> > > > output_len: 0x0000000001fccb30
> > > > kernel_total_size: 0x0000000001e28000
> > > > needed_size: 0x0000000002000000
> > > > trampoline_32bit: 0x000000000009d000
> > > >
> > > > Decompressing Linux... Parsing ELF... done.
> > > > Booting the kernel.
> > > > [    0.000000] Linux version 6.2.0-rc3 (root@mp-LINUX-DESKTOP)
> > > > (x86_64-buildroot       -linux-gnu-gcc.br_real (Buildroot 2023.11)
> > > > 12.3.0, GNU ld (GNU Binutils) 2.40) #       2 SMP PREEMPT_DYNAMIC
> > > Fri
> > > > Jan 12 17:36:57 CET 2024
> > > > [    0.000000] Command line: earlyprintk=3DttyS0,115200
> > > > [    0.000000] KERNEL supported cpus:
> > > > [    0.000000]   Intel GenuineIntel
> > > > [    0.000000]   AMD AuthenticAMD
> > > > [    0.000000] x86/fpu: Supporting XSAVE feature 0x001: 'x87
> > > floating
> > > > point regi       sters'
> > > > [    0.000000] x86/fpu: Supporting XSAVE feature 0x002: 'SSE
> > > registers'
> > > > [    0.000000] x86/fpu: Supporting XSAVE feature 0x004: 'AVX
> > > registers'
> > > > [    0.000000] x86/fpu: xstate_offset[2]:  576, xstate_sizes[2]:
> > >  256
> > > > [    0.000000] x86/fpu: Enabled xstate features 0x7, context size
> > > is 832
> > > > bytes,        using 'compacted' format.
> > > > [    0.000000] signal: max sigframe size: 1360
> > > > [    0.000000] BIOS-provided physical RAM map:
> > > > [    0.000000] BIOS-e801: [mem
> > > 0x0000000000000000-0x000000000009efff] usable
> > >
> > > Okay, here should be all memory regions listed. My non-root Linux
> > in my
> > > Qemu VM, for example, shows here:
> > >
> > > [ 0.000000] BIOS-provided physical RAM map:
> > > [ 0.000000] BIOS-e820: [mem 0x0000000000000000-0x00000000000fffff]
> > > usable
> > > [ 0.000000] BIOS-e820: [mem 0x0000000000100000-0x0000000000100fff]
> > > reserved
> > > [ 0.000000] BIOS-e820: [mem 0x0000000000200000-0x00000000048fffff]
> > > usable
> > >
> > > Are you absolutely sure, that you have no further modifications in
> > > Jailhouse or the Linux loader?
> > >
> > > Actually, in your case, there should be e820 as well (instead of
> > e801).
> > > Go to the Linux kernel sources, have a look at
> > > arch/x86/kernel/e820.c:1279
> > >
> > > and Jailhouse's jailhouse-cell-linux:638.
> > >
> > > jailhouse-cell-linux fills information of all memory regions into
> > the
> > > zero page. Would you please instrument code (Linux/Jailhouse) to see
> > > where those regions are not parsed?
> > >
> > > > [    0.000000] printk: bootconsole [earlyser0] enabled
> > > > [    0.000000] NX (Execute Disable) protection: active
> > > > [    0.000000] extended physical RAM map:
> > > > [    0.000000] reserve setup_data: [mem
> > > > 0x0000000000000000-0x0000000000001fff] u       sable
> > > > [    0.000000] reserve setup_data: [mem
> > > > 0x0000000000002000-0x000000000000212b] u       sable
> > > > [    0.000000] reserve setup_data: [mem
> > > > 0x000000000000212c-0x000000000009efff] u       sable
> > > > [    0.000000] DMI not present or invalid.
> > > > [    0.000000] Hypervisor detected: Jailhouse
> > >
> > > Just guessing loud: Hmm, you have guest support enabled, that's
> > not the
> > > issue.
> > >
> > > > [    0.000000] tsc: Detected 3393.624 MHz processor
> > > > [    0.000017] .text .data .bss are not marked as E820_TYPE_RAM!
> > >
> > > Here's the next error that makes me curious, why you system falls
> > back
> > > to E801...
> > >
> > > > [    0.005745] last_pfn =3D 0x2e28 max_arch_pfn =3D 0x400000000
> > > > [    0.011025] x86/PAT: PAT support disabled because
> > > CONFIG_X86_PAT is
> > > > disabled        in the kernel.
> > >
> > > Please enable CONFIG_X86_PAT and MTRR in your kernel.
> > >
> > > > [    0.019362] x86/PAT: Configuration [0-7]: WB  WT  UC- UC  WB
> > >  WT  UC- UC
> > > > [    0.034867] Using GB pages for direct mapping
> > > > [    0.039193] Kernel panic - not syncing: alloc_low_pages: can
> > not
> > > > alloc memory
> > >
> > > Yeah, that's the logical aftereffect after the errors above.
> > >
> > > Thanks,
> > > Ralf
> > >
> > > > [    0.046183] CPU: 0 PID: 0 Comm: swapper Not tainted
> > 6.2.0-rc3 #2
> > > > [    0.052176] Call Trace:
> > > > [    0.054606]  <TASK>
> > > > [    0.056691]  ? dump_stack_lvl+0x33/0x4e
> > > > [    0.060510]  ? panic+0x157/0x303
> > > > [    0.063723]  ? sprintf+0x56/0x80
> > > > [    0.066936]  ? alloc_low_pages+0x70/0x1a0
> > > > [    0.070930]  ? phys_pmd_init+0x1fc/0x2eb
> > > > [    0.074839]  ? phys_pud_init+0x116/0x2d3
> > > > [    0.078744]  ? __kernel_physical_mapping_init+0x11a/0x290
> > > > [    0.084128]  ? init_memory_mapping+0x25e/0x3b0
> > > > [    0.088558]  ? init_range_memory_mapping+0xe7/0x145
> > > > [    0.093417]  ? init_mem_mapping+0x242/0x298
> > > > [    0.097585]  ? setup_arch+0x74e/0xcbd
> > > > [    0.101231]  ? start_kernel+0x66/0x8b7
> > > > [    0.104965]  ? load_ucode_bsp+0x43/0x11b
> > > > [    0.108873]  ? secondary_startup_64_no_verify+0xe0/0xeb
> > > > [    0.114085]  </TASK>
> > > > [    0.116255] ---[ end Kernel panic - not syncing:
> > > alloc_low_pages: can
> > > > not all       oc memory ]---
> > > >
> > > >
> > > > Thank you for your continuous support,
> > > > Michele
> > > >
> > > > Il giorno sabato 13 gennaio 2024 alle 00:05:43 UTC+1 Ralf
> > > Ramsauer ha
> > > > scritto:
> > > >
> > > > Hi Michele,
> > > >
> > > > On 12/01/2024 14:07, Michele Pescap=C3=A8 wrote:
> > > > > jailhouse cell load linux-2 linux-loader.bin -a 0x0
> > > > > ../buildroot-2023.11/output/images/bzImage -a 0xffbe00
> > parameters
> > > > -a 0x1000
> > > > > jailhouse cell start linux-2
> > > > >
> > > > > I take it the kernel is loaded at 0xffbe00 which is right at the
> > > > edge of
> > > > > the low ram region. In fact after issuing the cell load command
> > > and
> > > > > adjusting the path for the loader I get JAILHOUSE_CELL_LOAD:
> > > Invalid
> > > > > argument.
> > > >
> > > > Just tested cell-linux in a qemu machine, there it works, with
> > > pretty
> > > > similar addresses, which got me confused.
> > > >
> > > > After double-checking it: 0xffb.e00 is *not* at the edge of low
> > mem:
> > > >
> > > > Low mem is 0x000.000 -- 0x0ff.fff
> > > > Comm region is 0x100.000 -- 0x100.fff
> > > >
> > > > 0xffb.e00 is (obviously) way above.
> > > >
> > > > Please try to set your high mem's .virt_start to 0x200000. Then,
> > > > 0xffbe00 is offsetted ~16MB inside your highmem, and it should
> > work!
> > > >
> > > > IOW:
> > > >
> > > > /* high RAM */
> > > > {
> > > > .phys_start =3D 0x42300000,
> > > > .virt_start =3D 0x200000,
> > > > .size =3D 0x11000000,
> > > > .flags =3D JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
> > > > JAILHOUSE_MEM_EXECUTE |
> > > > JAILHOUSE_MEM_LOADABLE,
> > > > },
> > > >
> > > > Thanks
> > > > Ralf
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
> https://groups.google.com/d/msgid/jailhouse-dev/860c1e75-c28f-4157-9212-a=
3d87ad25b27n%40googlegroups.com=20
> <
> https://groups.google.com/d/msgid/jailhouse-dev/860c1e75-c28f-4157-9212-a=
3d87ad25b27n%40googlegroups.com>=20
> <
> https://groups.google.com/d/msgid/jailhouse-dev/860c1e75-c28f-4157-9212-a=
3d87ad25b27n%40googlegroups.com?utm_medium=3Demail&utm_source=3Dfooter=20
> <
> https://groups.google.com/d/msgid/jailhouse-dev/860c1e75-c28f-4157-9212-a=
3d87ad25b27n%40googlegroups.com?utm_medium=3Demail&utm_source=3Dfooter
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
> https://groups.google.com/d/msgid/jailhouse-dev/6146e208-1e8c-4335-abaf-9=
a2be8c85be5n%40googlegroups.com=20
> <
> https://groups.google.com/d/msgid/jailhouse-dev/6146e208-1e8c-4335-abaf-9=
a2be8c85be5n%40googlegroups.com?utm_medium=3Demail&utm_source=3Dfooter
> >.
>

--=20
You received this message because you are subscribed to the Google Groups "=
Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/=
jailhouse-dev/6fb04e63-2f4a-4d5b-9139-c11e9a9fc461n%40googlegroups.com.

------=_Part_97_1358540854.1705434260529
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi,<br /><br />I'm trying to give network access to the non root cell, howe=
ver it seems that I'm not able to pass the right PCI device. It always defa=
ults to taking away the 00:00.0 pci device from the root cell causing a cra=
sh for the root cell.<br /><br />In both the root and non root cell's confi=
gs I added the shared memory regions using the macro JAILHOUSE_SHMEM_NET_RE=
GIONS(0x60000000, 0) for the root and using dev_id=3D1 for the non root. Th=
e resulting regions do not overlap other memory regions, config check does =
not return any errors.<br /><br />I also added the following PCI device in =
both cells, where .shmem_regions_start is assigned to the correct index for=
 the first shared memory region created using the aforementioned macro.<br =
/><span style=3D"white-space: pre;">		</span><br />/* IVSHMEM: 00:05.0 */<b=
r /><span style=3D"white-space: pre;">		</span>{<br /><span style=3D"white-=
space: pre;">			</span>.type =3D JAILHOUSE_PCI_TYPE_IVSHMEM,<br /><span sty=
le=3D"white-space: pre;">			</span>.domain =3D 0x0,<br /><span style=3D"whi=
te-space: pre;">			</span>.bdf =3D 0x28,<br /><span style=3D"white-space: p=
re;">			</span>.bar_mask =3D JAILHOUSE_IVSHMEM_BAR_MASK_MSIX,<br /><span st=
yle=3D"white-space: pre;">			</span>.num_msix_vectors =3D 2,<br /><span sty=
le=3D"white-space: pre;">			</span>.shmem_regions_start =3D 0,<br /><span s=
tyle=3D"white-space: pre;">			</span>.shmem_dev_id =3D 0, =C2=A0 (1 in the =
non root cell)<br /><span style=3D"white-space: pre;">			</span>.shmem_peer=
s =3D 2,<br /><span style=3D"white-space: pre;">			</span>.shmem_protocol =
=3D JAILHOUSE_SHMEM_PROTO_VETH,<br /><span style=3D"white-space: pre;">		</=
span>},<br /><br />I tried using different values for the .bdf, none of whi=
ch were already used by other devices but none worked. The root cell always=
 sees the new device correctly when starting the hypervisor, I can also see=
 it with lspci and ifconfig, however once I issue the cell linux command to=
 start the non root cell, I get the following output followed by a streak o=
f errors from the hypervisor, forcing a manual reset.<br /><br />Removing P=
CI device 00:00.0 from cell "RootCell"<br />Adding PCI device 00:00.0 to ce=
ll "linux-1"<br />FATAL: unable to get MMIO instruction<br />FATAL: Invalid=
 MMIO/RAM write, addr: 0x0000000106d8c020 size: 0<br />RIP: 0xffffffffa910f=
f4c RSP: 0xffffab85400f7de0 FLAGS: 93<br />RAX: 0x0000000000000000 RBX: 0x0=
00000000002f170 RCX: 0x0000000000000040<br />RDX: 0x0000000000000414 RSI: 0=
xffff8b6000955400 RDI: 0x0000000000000001<br />CS: 10 BASE: 0x0000000000000=
000 AR-BYTES: 29b EFER.LMA 1<br />CR0: 0x0000000080050033 CR3: 0x0000000106=
d8c000 CR4: 0x00000000003506a0<br />EFER: 0x0000000000001d01<br />Parking C=
PU 4 (Cell: "RootCell")<br />(etc..)<br /><br />I'm not sure what I'm missi=
ng here, CONFIG_IVSHMEM_NET is enabled in both the root and non root kernel=
 config, I also enabled CONFIG_PCI_HOST_GENERIC in the root linux as sugges=
ted in one of the conversations on this site.<br /><br />Thanks,<br />Miche=
le<br /><br /><br /><div class=3D"gmail_quote"><div dir=3D"auto" class=3D"g=
mail_attr">Il giorno domenica 14 gennaio 2024 alle 15:49:40 UTC+1 Ralf Rams=
auer ha scritto:<br/></div><blockquote class=3D"gmail_quote" style=3D"margi=
n: 0 0 0 0.8ex; border-left: 1px solid rgb(204, 204, 204); padding-left: 1e=
x;">Hi Michele,
<br>
<br>On 14/01/2024 02:18, Michele Pescap=C3=A8 wrote:
<br>&gt; Hi,
<br>&gt;=20
<br>&gt; There were PIO writes to ports 4e,4f,2e and 2f, each of size 1 and=
 each=20
<br>&gt; one on subsequent restarts. I&#39;m not sure how to figure out wha=
t they=20
<br>&gt; belong to.
<br>
<br>Easy and straight forward: Read the jailhouse crash dump.
<br>
<br>Look at the program counter, and maybe the return address. Disassemble=
=20
<br>your kernel (objdump -d vmlinux) and lookup that address. Now you know=
=20
<br>the name of the routine in the kernel that caused the crash.
<br>
<br>Don&#39;t simply whitelist ports. Only whitelist them, if you&#39;re su=
re what=20
<br>you&#39;re doing.
<br>
<br>&gt;=20
<br>&gt; CONFIG_ISA_DMA_API is already disabled.
<br>&gt;=20
<br>&gt; I missed the irqchip for the uart. However as of right now I just =
copied=20
<br>&gt; the whole fragment from the root configuration which means I could=
 be=20
<br>&gt; taking away other interrupts from the root cell, I still have to f=
igure=20
<br>&gt; out how to tune that
<br>&gt;=20
<br>&gt; /* IOAPIC 13, GSI base 0 */
<br>&gt; {
<br>&gt; .address =3D 0xfec00000,
<br>&gt; .id =3D 0xa0,
<br>&gt; .pin_bitmap =3D {
<br>&gt; 0xffffffff, 0xffffffff, 0xffffffff, 0xffffffff
<br>
<br>With this, you take away ALL interrupts from the root cell, which you=
=20
<br>don&#39;t want to do, you only want to take away the interrupt that=20
<br>corresponds to ttyS0 (i.e. Port 0x3f8).
<br>
<br>See here: <a href=3D"https://en.wikipedia.org/wiki/COM_(hardware_interf=
ace)" target=3D"_blank" rel=3D"nofollow" data-saferedirecturl=3D"https://ww=
w.google.com/url?hl=3Dit&amp;q=3Dhttps://en.wikipedia.org/wiki/COM_(hardwar=
e_interface)&amp;source=3Dgmail&amp;ust=3D1705520308870000&amp;usg=3DAOvVaw=
2jgWOEiG8ze4FJAP5lcCii">https://en.wikipedia.org/wiki/COM_(hardware_interfa=
ce)</a>
<br>
<br>COM1: I/O port 0x3F8, IRQ 4
<br>
<br>So you want to only assign IRQ 4 to your non-root cell. See=20
<br>linux-x86-demo.c to see how that works.
<br>
<br>&gt; },
<br>&gt; },
<br>&gt;=20
<br>&gt; Still, now I can finally login into the non root linux.
<br>
<br>Excellent!
<br>
<br>   Ralf
<br>
<br>&gt;=20
<br>&gt; Thanks,
<br>&gt; Michele
<br>&gt;=20
<br>&gt; Il giorno sabato 13 gennaio 2024 alle 21:09:28 UTC+1 Ralf Ramsauer=
 ha=20
<br>&gt; scritto:
<br>&gt;=20
<br>&gt;     Hi Michele,
<br>&gt;=20
<br>&gt;     On 13/01/2024 18:08, Michele Pescap=C3=A8 wrote:
<br>&gt;      &gt; Hi,
<br>&gt;      &gt;
<br>&gt;      &gt; The problem was that the ram regions in the non root con=
figuration
<br>&gt;      &gt; weren&#39;t detected as such because of the missing=C2=
=A0JAILHOUSE_MEM_DMA
<br>&gt;     flag.
<br>&gt;=20
<br>&gt;     Yikes, makes sense.
<br>&gt;=20
<br>&gt;      &gt; After adding that, I also had to add two pio_regions bec=
ause the non
<br>&gt;      &gt; root linux was crashing because of two ports which aren&=
#39;t present in
<br>&gt;      &gt; /proc/ioports.
<br>&gt;=20
<br>&gt;     Uhm - which PIO ports? Don&#39;t simply assign PIO ports. Ther=
e must be a
<br>&gt;     reason for them. What ports did crash?
<br>&gt;=20
<br>&gt;     Did you disable(!) CONFIG_ISA_DMA_API? Please disable it. Ther=
efore,
<br>&gt;     you
<br>&gt;     have to activate CONFIG_EXPERT first.
<br>&gt;=20
<br>&gt;     I *bet* it was i8237=E2=80=A6
<br>&gt;=20
<br>&gt;      &gt; I also had to add mce=3Doff to the command line because =
i had an
<br>&gt;     unhandled
<br>&gt;=20
<br>&gt;     or disable CONFIG_X86_MCE.
<br>&gt;=20
<br>&gt;      &gt; MSR error, I&#39;ll have to disable that in the kernel c=
onfig.
<br>&gt;      &gt; At this point the non root linux seems to start, I see t=
he boot
<br>&gt;     log. No
<br>&gt;=20
<br>&gt;     Excellent!
<br>&gt;=20
<br>&gt;      &gt; way of interacting with it as there is not a login promp=
t or
<br>&gt;     anything, I
<br>&gt;      &gt; think I need to ssh to the cell at this point, right?
<br>&gt;=20
<br>&gt;     Was the initramdisk loaded correctly?
<br>&gt;=20
<br>&gt;     Did you assign - in your non-root cell config - the irqchip an=
d the
<br>&gt;     corresponding interrupts of the uart?
<br>&gt;=20
<br>&gt;      &gt; That means I&#39;ll now need to work on those ivshmem ne=
t devices.
<br>&gt;=20
<br>&gt;     If you need ivshmem, then this would be the next step.
<br>&gt;=20
<br>&gt;     Ralf
<br>&gt;=20
<br>&gt;      &gt;
<br>&gt;      &gt; Thanks,
<br>&gt;      &gt; Michele
<br>&gt;      &gt;
<br>&gt;      &gt; Il giorno sabato 13 gennaio 2024 alle 15:13:12 UTC+1 Ral=
f
<br>&gt;     Ramsauer ha
<br>&gt;      &gt; scritto:
<br>&gt;      &gt;
<br>&gt;      &gt; Hi,
<br>&gt;      &gt;
<br>&gt;      &gt; On 13/01/2024 12:28, Michele Pescap=C3=A8 wrote:
<br>&gt;      &gt; &gt; Hi,
<br>&gt;      &gt; &gt;
<br>&gt;      &gt; &gt; You are right, I got confused about those addresses=
, my bad. At
<br>&gt;      &gt; least
<br>&gt;      &gt; &gt; now I know that config is the correct one and I don=
&#39;t have to
<br>&gt;     tinker
<br>&gt;      &gt; &gt; with it.
<br>&gt;      &gt; &gt; I&#39;m back to a kernel panic from the inmate when=
 booting the cell.
<br>&gt;      &gt; It&#39;s
<br>&gt;      &gt; &gt; similar to the one I had earlier, not sure yet of w=
hat the
<br>&gt;      &gt; problem may be.
<br>&gt;      &gt;
<br>&gt;      &gt; Great, we&#39;re a step further.
<br>&gt;      &gt;
<br>&gt;      &gt; &gt;
<br>&gt;      &gt; &gt; Created cell &quot;linux-2&quot;
<br>&gt;      &gt; &gt; Page pool usage after cell creation: mem 406/32211,=
 remap
<br>&gt;      &gt; 16392/131072
<br>&gt;      &gt; &gt; Cell &quot;linux-2&quot; can be loaded
<br>&gt;      &gt; &gt; CPU 9 received SIPI, vector 100
<br>&gt;      &gt; &gt; Started cell &quot;linux-2&quot;
<br>&gt;      &gt; &gt; CPU 8 received SIPI, vector 100
<br>&gt;      &gt; &gt; No EFI environment detected.
<br>&gt;      &gt; &gt; early console in extract_kernel
<br>&gt;      &gt; &gt; input_data: 0x000000000275c308
<br>&gt;      &gt; &gt; input_len: 0x00000000008b0981
<br>&gt;      &gt; &gt; output: 0x0000000001000000
<br>&gt;      &gt; &gt; output_len: 0x0000000001fccb30
<br>&gt;      &gt; &gt; kernel_total_size: 0x0000000001e28000
<br>&gt;      &gt; &gt; needed_size: 0x0000000002000000
<br>&gt;      &gt; &gt; trampoline_32bit: 0x000000000009d000
<br>&gt;      &gt; &gt;
<br>&gt;      &gt; &gt; Decompressing Linux... Parsing ELF... done.
<br>&gt;      &gt; &gt; Booting the kernel.
<br>&gt;      &gt; &gt; [ =C2=A0 =C2=A00.000000] Linux version 6.2.0-rc3 (r=
oot@mp-LINUX-DESKTOP)
<br>&gt;      &gt; &gt; (x86_64-buildroot =C2=A0 =C2=A0 =C2=A0 -linux-gnu-g=
cc.br_real (Buildroot 2023.11)
<br>&gt;      &gt; &gt; 12.3.0, GNU ld (GNU Binutils) 2.40) # =C2=A0 =C2=A0=
 =C2=A0 2 SMP PREEMPT_DYNAMIC
<br>&gt;      &gt; Fri
<br>&gt;      &gt; &gt; Jan 12 17:36:57 CET 2024
<br>&gt;      &gt; &gt; [ =C2=A0 =C2=A00.000000] Command line: earlyprintk=
=3DttyS0,115200
<br>&gt;      &gt; &gt; [ =C2=A0 =C2=A00.000000] KERNEL supported cpus:
<br>&gt;      &gt; &gt; [ =C2=A0 =C2=A00.000000] =C2=A0 Intel GenuineIntel
<br>&gt;      &gt; &gt; [ =C2=A0 =C2=A00.000000] =C2=A0 AMD AuthenticAMD
<br>&gt;      &gt; &gt; [ =C2=A0 =C2=A00.000000] x86/fpu: Supporting XSAVE =
feature 0x001: &#39;x87
<br>&gt;      &gt; floating
<br>&gt;      &gt; &gt; point regi =C2=A0 =C2=A0 =C2=A0 sters&#39;
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
<br>&gt;      &gt; &gt; bytes, =C2=A0 =C2=A0 =C2=A0 =C2=A0using &#39;compac=
ted&#39; format.
<br>&gt;      &gt; &gt; [ =C2=A0 =C2=A00.000000] signal: max sigframe size:=
 1360
<br>&gt;      &gt; &gt; [ =C2=A0 =C2=A00.000000] BIOS-provided physical RAM=
 map:
<br>&gt;      &gt; &gt; [ =C2=A0 =C2=A00.000000] BIOS-e801: [mem
<br>&gt;      &gt; 0x0000000000000000-0x000000000009efff] usable
<br>&gt;      &gt;
<br>&gt;      &gt; Okay, here should be all memory regions listed. My non-r=
oot Linux
<br>&gt;     in my
<br>&gt;      &gt; Qemu VM, for example, shows here:
<br>&gt;      &gt;
<br>&gt;      &gt; [ 0.000000] BIOS-provided physical RAM map:
<br>&gt;      &gt; [ 0.000000] BIOS-e820: [mem 0x0000000000000000-0x0000000=
0000fffff]
<br>&gt;      &gt; usable
<br>&gt;      &gt; [ 0.000000] BIOS-e820: [mem 0x0000000000100000-0x0000000=
000100fff]
<br>&gt;      &gt; reserved
<br>&gt;      &gt; [ 0.000000] BIOS-e820: [mem 0x0000000000200000-0x0000000=
0048fffff]
<br>&gt;      &gt; usable
<br>&gt;      &gt;
<br>&gt;      &gt; Are you absolutely sure, that you have no further modifi=
cations in
<br>&gt;      &gt; Jailhouse or the Linux loader?
<br>&gt;      &gt;
<br>&gt;      &gt; Actually, in your case, there should be e820 as well (in=
stead of
<br>&gt;     e801).
<br>&gt;      &gt; Go to the Linux kernel sources, have a look at
<br>&gt;      &gt; arch/x86/kernel/e820.c:1279
<br>&gt;      &gt;
<br>&gt;      &gt; and Jailhouse&#39;s jailhouse-cell-linux:638.
<br>&gt;      &gt;
<br>&gt;      &gt; jailhouse-cell-linux fills information of all memory reg=
ions into
<br>&gt;     the
<br>&gt;      &gt; zero page. Would you please instrument code (Linux/Jailh=
ouse) to see
<br>&gt;      &gt; where those regions are not parsed?
<br>&gt;      &gt;
<br>&gt;      &gt; &gt; [ =C2=A0 =C2=A00.000000] printk: bootconsole [early=
ser0] enabled
<br>&gt;      &gt; &gt; [ =C2=A0 =C2=A00.000000] NX (Execute Disable) prote=
ction: active
<br>&gt;      &gt; &gt; [ =C2=A0 =C2=A00.000000] extended physical RAM map:
<br>&gt;      &gt; &gt; [ =C2=A0 =C2=A00.000000] reserve setup_data: [mem
<br>&gt;      &gt; &gt; 0x0000000000000000-0x0000000000001fff] u =C2=A0 =C2=
=A0 =C2=A0 sable
<br>&gt;      &gt; &gt; [ =C2=A0 =C2=A00.000000] reserve setup_data: [mem
<br>&gt;      &gt; &gt; 0x0000000000002000-0x000000000000212b] u =C2=A0 =C2=
=A0 =C2=A0 sable
<br>&gt;      &gt; &gt; [ =C2=A0 =C2=A00.000000] reserve setup_data: [mem
<br>&gt;      &gt; &gt; 0x000000000000212c-0x000000000009efff] u =C2=A0 =C2=
=A0 =C2=A0 sable
<br>&gt;      &gt; &gt; [ =C2=A0 =C2=A00.000000] DMI not present or invalid=
.
<br>&gt;      &gt; &gt; [ =C2=A0 =C2=A00.000000] Hypervisor detected: Jailh=
ouse
<br>&gt;      &gt;
<br>&gt;      &gt; Just guessing loud: Hmm, you have guest support enabled,=
 that&#39;s
<br>&gt;     not the
<br>&gt;      &gt; issue.
<br>&gt;      &gt;
<br>&gt;      &gt; &gt; [ =C2=A0 =C2=A00.000000] tsc: Detected 3393.624 MHz=
 processor
<br>&gt;      &gt; &gt; [ =C2=A0 =C2=A00.000017] .text .data .bss are not m=
arked as E820_TYPE_RAM!
<br>&gt;      &gt;
<br>&gt;      &gt; Here&#39;s the next error that makes me curious, why you=
 system falls
<br>&gt;     back
<br>&gt;      &gt; to E801...
<br>&gt;      &gt;
<br>&gt;      &gt; &gt; [ =C2=A0 =C2=A00.005745] last_pfn =3D 0x2e28 max_ar=
ch_pfn =3D 0x400000000
<br>&gt;      &gt; &gt; [ =C2=A0 =C2=A00.011025] x86/PAT: PAT support disab=
led because
<br>&gt;      &gt; CONFIG_X86_PAT is
<br>&gt;      &gt; &gt; disabled =C2=A0 =C2=A0 =C2=A0 =C2=A0in the kernel.
<br>&gt;      &gt;
<br>&gt;      &gt; Please enable CONFIG_X86_PAT and MTRR in your kernel.
<br>&gt;      &gt;
<br>&gt;      &gt; &gt; [ =C2=A0 =C2=A00.019362] x86/PAT: Configuration [0-=
7]: WB =C2=A0WT =C2=A0UC- UC =C2=A0WB
<br>&gt;      &gt; =C2=A0WT =C2=A0UC- UC
<br>&gt;      &gt; &gt; [ =C2=A0 =C2=A00.034867] Using GB pages for direct =
mapping
<br>&gt;      &gt; &gt; [ =C2=A0 =C2=A00.039193] Kernel panic - not syncing=
: alloc_low_pages: can
<br>&gt;     not
<br>&gt;      &gt; &gt; alloc memory
<br>&gt;      &gt;
<br>&gt;      &gt; Yeah, that&#39;s the logical aftereffect after the error=
s above.
<br>&gt;      &gt;
<br>&gt;      &gt; Thanks,
<br>&gt;      &gt; Ralf
<br>&gt;      &gt;
<br>&gt;      &gt; &gt; [ =C2=A0 =C2=A00.046183] CPU: 0 PID: 0 Comm: swappe=
r Not tainted
<br>&gt;     6.2.0-rc3 #2
<br>&gt;      &gt; &gt; [ =C2=A0 =C2=A00.052176] Call Trace:
<br>&gt;      &gt; &gt; [ =C2=A0 =C2=A00.054606] =C2=A0&lt;TASK&gt;
<br>&gt;      &gt; &gt; [ =C2=A0 =C2=A00.056691] =C2=A0? dump_stack_lvl+0x3=
3/0x4e
<br>&gt;      &gt; &gt; [ =C2=A0 =C2=A00.060510] =C2=A0? panic+0x157/0x303
<br>&gt;      &gt; &gt; [ =C2=A0 =C2=A00.063723] =C2=A0? sprintf+0x56/0x80
<br>&gt;      &gt; &gt; [ =C2=A0 =C2=A00.066936] =C2=A0? alloc_low_pages+0x=
70/0x1a0
<br>&gt;      &gt; &gt; [ =C2=A0 =C2=A00.070930] =C2=A0? phys_pmd_init+0x1f=
c/0x2eb
<br>&gt;      &gt; &gt; [ =C2=A0 =C2=A00.074839] =C2=A0? phys_pud_init+0x11=
6/0x2d3
<br>&gt;      &gt; &gt; [ =C2=A0 =C2=A00.078744] =C2=A0? __kernel_physical_=
mapping_init+0x11a/0x290
<br>&gt;      &gt; &gt; [ =C2=A0 =C2=A00.084128] =C2=A0? init_memory_mappin=
g+0x25e/0x3b0
<br>&gt;      &gt; &gt; [ =C2=A0 =C2=A00.088558] =C2=A0? init_range_memory_=
mapping+0xe7/0x145
<br>&gt;      &gt; &gt; [ =C2=A0 =C2=A00.093417] =C2=A0? init_mem_mapping+0=
x242/0x298
<br>&gt;      &gt; &gt; [ =C2=A0 =C2=A00.097585] =C2=A0? setup_arch+0x74e/0=
xcbd
<br>&gt;      &gt; &gt; [ =C2=A0 =C2=A00.101231] =C2=A0? start_kernel+0x66/=
0x8b7
<br>&gt;      &gt; &gt; [ =C2=A0 =C2=A00.104965] =C2=A0? load_ucode_bsp+0x4=
3/0x11b
<br>&gt;      &gt; &gt; [ =C2=A0 =C2=A00.108873] =C2=A0? secondary_startup_=
64_no_verify+0xe0/0xeb
<br>&gt;      &gt; &gt; [ =C2=A0 =C2=A00.114085] =C2=A0&lt;/TASK&gt;
<br>&gt;      &gt; &gt; [ =C2=A0 =C2=A00.116255] ---[ end Kernel panic - no=
t syncing:
<br>&gt;      &gt; alloc_low_pages: can
<br>&gt;      &gt; &gt; not all =C2=A0 =C2=A0 =C2=A0 oc memory ]---
<br>&gt;      &gt; &gt;
<br>&gt;      &gt; &gt;
<br>&gt;      &gt; &gt; Thank you for your continuous support,
<br>&gt;      &gt; &gt; Michele
<br>&gt;      &gt; &gt;
<br>&gt;      &gt; &gt; Il giorno sabato 13 gennaio 2024 alle 00:05:43 UTC+=
1 Ralf
<br>&gt;      &gt; Ramsauer ha
<br>&gt;      &gt; &gt; scritto:
<br>&gt;      &gt; &gt;
<br>&gt;      &gt; &gt; Hi Michele,
<br>&gt;      &gt; &gt;
<br>&gt;      &gt; &gt; On 12/01/2024 14:07, Michele Pescap=C3=A8 wrote:
<br>&gt;      &gt; &gt; &gt; jailhouse cell load linux-2 linux-loader.bin -=
a 0x0
<br>&gt;      &gt; &gt; &gt; ../buildroot-2023.11/output/images/bzImage -a =
0xffbe00
<br>&gt;     parameters
<br>&gt;      &gt; &gt; -a 0x1000
<br>&gt;      &gt; &gt; &gt; jailhouse cell start linux-2
<br>&gt;      &gt; &gt; &gt;
<br>&gt;      &gt; &gt; &gt; I take it the kernel is loaded at 0xffbe00 whi=
ch is right at the
<br>&gt;      &gt; &gt; edge of
<br>&gt;      &gt; &gt; &gt; the low ram region. In fact after issuing the =
cell load command
<br>&gt;      &gt; and
<br>&gt;      &gt; &gt; &gt; adjusting the path for the loader I get JAILHO=
USE_CELL_LOAD:
<br>&gt;      &gt; Invalid
<br>&gt;      &gt; &gt; &gt; argument.
<br>&gt;      &gt; &gt;
<br>&gt;      &gt; &gt; Just tested cell-linux in a qemu machine, there it =
works, with
<br>&gt;      &gt; pretty
<br>&gt;      &gt; &gt; similar addresses, which got me confused.
<br>&gt;      &gt; &gt;
<br>&gt;      &gt; &gt; After double-checking it: 0xffb.e00 is *not* at the=
 edge of low
<br>&gt;     mem:
<br>&gt;      &gt; &gt;
<br>&gt;      &gt; &gt; Low mem is 0x000.000 -- 0x0ff.fff
<br>&gt;      &gt; &gt; Comm region is 0x100.000 -- 0x100.fff
<br>&gt;      &gt; &gt;
<br>&gt;      &gt; &gt; 0xffb.e00 is (obviously) way above.
<br>&gt;      &gt; &gt;
<br>&gt;      &gt; &gt; Please try to set your high mem&#39;s .virt_start t=
o 0x200000. Then,
<br>&gt;      &gt; &gt; 0xffbe00 is offsetted ~16MB inside your highmem, an=
d it should
<br>&gt;     work!
<br>&gt;      &gt; &gt;
<br>&gt;      &gt; &gt; IOW:
<br>&gt;      &gt; &gt;
<br>&gt;      &gt; &gt; /* high RAM */
<br>&gt;      &gt; &gt; {
<br>&gt;      &gt; &gt; .phys_start =3D 0x42300000,
<br>&gt;      &gt; &gt; .virt_start =3D 0x200000,
<br>&gt;      &gt; &gt; .size =3D 0x11000000,
<br>&gt;      &gt; &gt; .flags =3D JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE=
 |
<br>&gt;      &gt; &gt; JAILHOUSE_MEM_EXECUTE |
<br>&gt;      &gt; &gt; JAILHOUSE_MEM_LOADABLE,
<br>&gt;      &gt; &gt; },
<br>&gt;      &gt; &gt;
<br>&gt;      &gt; &gt; Thanks
<br>&gt;      &gt; &gt; Ralf
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
<br>&gt;     <a href=3D"https://groups.google.com/d/msgid/jailhouse-dev/671=
2361a-eaef-49cc-8a72-79da2c434169n%40googlegroups.com" target=3D"_blank" re=
l=3D"nofollow" data-saferedirecturl=3D"https://www.google.com/url?hl=3Dit&a=
mp;q=3Dhttps://groups.google.com/d/msgid/jailhouse-dev/6712361a-eaef-49cc-8=
a72-79da2c434169n%2540googlegroups.com&amp;source=3Dgmail&amp;ust=3D1705520=
308871000&amp;usg=3DAOvVaw3AaAdqf_7nf0RwIEOItyD_">https://groups.google.com=
/d/msgid/jailhouse-dev/6712361a-eaef-49cc-8a72-79da2c434169n%40googlegroups=
.com</a> &lt;<a href=3D"https://groups.google.com/d/msgid/jailhouse-dev/671=
2361a-eaef-49cc-8a72-79da2c434169n%40googlegroups.com" target=3D"_blank" re=
l=3D"nofollow" data-saferedirecturl=3D"https://www.google.com/url?hl=3Dit&a=
mp;q=3Dhttps://groups.google.com/d/msgid/jailhouse-dev/6712361a-eaef-49cc-8=
a72-79da2c434169n%2540googlegroups.com&amp;source=3Dgmail&amp;ust=3D1705520=
308871000&amp;usg=3DAOvVaw3AaAdqf_7nf0RwIEOItyD_">https://groups.google.com=
/d/msgid/jailhouse-dev/6712361a-eaef-49cc-8a72-79da2c434169n%40googlegroups=
.com</a>&gt; &lt;<a href=3D"https://groups.google.com/d/msgid/jailhouse-dev=
/6712361a-eaef-49cc-8a72-79da2c434169n%40googlegroups.com" target=3D"_blank=
" rel=3D"nofollow" data-saferedirecturl=3D"https://www.google.com/url?hl=3D=
it&amp;q=3Dhttps://groups.google.com/d/msgid/jailhouse-dev/6712361a-eaef-49=
cc-8a72-79da2c434169n%2540googlegroups.com&amp;source=3Dgmail&amp;ust=3D170=
5520308871000&amp;usg=3DAOvVaw3AaAdqf_7nf0RwIEOItyD_">https://groups.google=
.com/d/msgid/jailhouse-dev/6712361a-eaef-49cc-8a72-79da2c434169n%40googlegr=
oups.com</a> &lt;<a href=3D"https://groups.google.com/d/msgid/jailhouse-dev=
/6712361a-eaef-49cc-8a72-79da2c434169n%40googlegroups.com" target=3D"_blank=
" rel=3D"nofollow" data-saferedirecturl=3D"https://www.google.com/url?hl=3D=
it&amp;q=3Dhttps://groups.google.com/d/msgid/jailhouse-dev/6712361a-eaef-49=
cc-8a72-79da2c434169n%2540googlegroups.com&amp;source=3Dgmail&amp;ust=3D170=
5520308871000&amp;usg=3DAOvVaw3AaAdqf_7nf0RwIEOItyD_">https://groups.google=
.com/d/msgid/jailhouse-dev/6712361a-eaef-49cc-8a72-79da2c434169n%40googlegr=
oups.com</a>&gt;&gt; &lt;<a href=3D"https://groups.google.com/d/msgid/jailh=
ouse-dev/6712361a-eaef-49cc-8a72-79da2c434169n%40googlegroups.com?utm_mediu=
m=3Demail&amp;utm_source=3Dfooter" target=3D"_blank" rel=3D"nofollow" data-=
saferedirecturl=3D"https://www.google.com/url?hl=3Dit&amp;q=3Dhttps://group=
s.google.com/d/msgid/jailhouse-dev/6712361a-eaef-49cc-8a72-79da2c434169n%25=
40googlegroups.com?utm_medium%3Demail%26utm_source%3Dfooter&amp;source=3Dgm=
ail&amp;ust=3D1705520308871000&amp;usg=3DAOvVaw0D695OZ75k-3Hqw4LCR4Rx">http=
s://groups.google.com/d/msgid/jailhouse-dev/6712361a-eaef-49cc-8a72-79da2c4=
34169n%40googlegroups.com?utm_medium=3Demail&amp;utm_source=3Dfooter</a> &l=
t;<a href=3D"https://groups.google.com/d/msgid/jailhouse-dev/6712361a-eaef-=
49cc-8a72-79da2c434169n%40googlegroups.com?utm_medium=3Demail&amp;utm_sourc=
e=3Dfooter" target=3D"_blank" rel=3D"nofollow" data-saferedirecturl=3D"http=
s://www.google.com/url?hl=3Dit&amp;q=3Dhttps://groups.google.com/d/msgid/ja=
ilhouse-dev/6712361a-eaef-49cc-8a72-79da2c434169n%2540googlegroups.com?utm_=
medium%3Demail%26utm_source%3Dfooter&amp;source=3Dgmail&amp;ust=3D170552030=
8871000&amp;usg=3DAOvVaw0D695OZ75k-3Hqw4LCR4Rx">https://groups.google.com/d=
/msgid/jailhouse-dev/6712361a-eaef-49cc-8a72-79da2c434169n%40googlegroups.c=
om?utm_medium=3Demail&amp;utm_source=3Dfooter</a>&gt; &lt;<a href=3D"https:=
//groups.google.com/d/msgid/jailhouse-dev/6712361a-eaef-49cc-8a72-79da2c434=
169n%40googlegroups.com?utm_medium=3Demail&amp;utm_source=3Dfooter" target=
=3D"_blank" rel=3D"nofollow" data-saferedirecturl=3D"https://www.google.com=
/url?hl=3Dit&amp;q=3Dhttps://groups.google.com/d/msgid/jailhouse-dev/671236=
1a-eaef-49cc-8a72-79da2c434169n%2540googlegroups.com?utm_medium%3Demail%26u=
tm_source%3Dfooter&amp;source=3Dgmail&amp;ust=3D1705520308871000&amp;usg=3D=
AOvVaw0D695OZ75k-3Hqw4LCR4Rx">https://groups.google.com/d/msgid/jailhouse-d=
ev/6712361a-eaef-49cc-8a72-79da2c434169n%40googlegroups.com?utm_medium=3Dem=
ail&amp;utm_source=3Dfooter</a> &lt;<a href=3D"https://groups.google.com/d/=
msgid/jailhouse-dev/6712361a-eaef-49cc-8a72-79da2c434169n%40googlegroups.co=
m?utm_medium=3Demail&amp;utm_source=3Dfooter" target=3D"_blank" rel=3D"nofo=
llow" data-saferedirecturl=3D"https://www.google.com/url?hl=3Dit&amp;q=3Dht=
tps://groups.google.com/d/msgid/jailhouse-dev/6712361a-eaef-49cc-8a72-79da2=
c434169n%2540googlegroups.com?utm_medium%3Demail%26utm_source%3Dfooter&amp;=
source=3Dgmail&amp;ust=3D1705520308871000&amp;usg=3DAOvVaw0D695OZ75k-3Hqw4L=
CR4Rx">https://groups.google.com/d/msgid/jailhouse-dev/6712361a-eaef-49cc-8=
a72-79da2c434169n%40googlegroups.com?utm_medium=3Demail&amp;utm_source=3Dfo=
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
<br>&gt;     <a href=3D"https://groups.google.com/d/msgid/jailhouse-dev/860=
c1e75-c28f-4157-9212-a3d87ad25b27n%40googlegroups.com" target=3D"_blank" re=
l=3D"nofollow" data-saferedirecturl=3D"https://www.google.com/url?hl=3Dit&a=
mp;q=3Dhttps://groups.google.com/d/msgid/jailhouse-dev/860c1e75-c28f-4157-9=
212-a3d87ad25b27n%2540googlegroups.com&amp;source=3Dgmail&amp;ust=3D1705520=
308871000&amp;usg=3DAOvVaw06XB_y_gyaezFHJ17tfzdO">https://groups.google.com=
/d/msgid/jailhouse-dev/860c1e75-c28f-4157-9212-a3d87ad25b27n%40googlegroups=
.com</a> &lt;<a href=3D"https://groups.google.com/d/msgid/jailhouse-dev/860=
c1e75-c28f-4157-9212-a3d87ad25b27n%40googlegroups.com" target=3D"_blank" re=
l=3D"nofollow" data-saferedirecturl=3D"https://www.google.com/url?hl=3Dit&a=
mp;q=3Dhttps://groups.google.com/d/msgid/jailhouse-dev/860c1e75-c28f-4157-9=
212-a3d87ad25b27n%2540googlegroups.com&amp;source=3Dgmail&amp;ust=3D1705520=
308871000&amp;usg=3DAOvVaw06XB_y_gyaezFHJ17tfzdO">https://groups.google.com=
/d/msgid/jailhouse-dev/860c1e75-c28f-4157-9212-a3d87ad25b27n%40googlegroups=
.com</a>&gt; &lt;<a href=3D"https://groups.google.com/d/msgid/jailhouse-dev=
/860c1e75-c28f-4157-9212-a3d87ad25b27n%40googlegroups.com?utm_medium=3Demai=
l&amp;utm_source=3Dfooter" target=3D"_blank" rel=3D"nofollow" data-saferedi=
recturl=3D"https://www.google.com/url?hl=3Dit&amp;q=3Dhttps://groups.google=
.com/d/msgid/jailhouse-dev/860c1e75-c28f-4157-9212-a3d87ad25b27n%2540google=
groups.com?utm_medium%3Demail%26utm_source%3Dfooter&amp;source=3Dgmail&amp;=
ust=3D1705520308871000&amp;usg=3DAOvVaw01ql45nHwDOKyOJmY8lBr7">https://grou=
ps.google.com/d/msgid/jailhouse-dev/860c1e75-c28f-4157-9212-a3d87ad25b27n%4=
0googlegroups.com?utm_medium=3Demail&amp;utm_source=3Dfooter</a> &lt;<a hre=
f=3D"https://groups.google.com/d/msgid/jailhouse-dev/860c1e75-c28f-4157-921=
2-a3d87ad25b27n%40googlegroups.com?utm_medium=3Demail&amp;utm_source=3Dfoot=
er" target=3D"_blank" rel=3D"nofollow" data-saferedirecturl=3D"https://www.=
google.com/url?hl=3Dit&amp;q=3Dhttps://groups.google.com/d/msgid/jailhouse-=
dev/860c1e75-c28f-4157-9212-a3d87ad25b27n%2540googlegroups.com?utm_medium%3=
Demail%26utm_source%3Dfooter&amp;source=3Dgmail&amp;ust=3D1705520308871000&=
amp;usg=3DAOvVaw01ql45nHwDOKyOJmY8lBr7">https://groups.google.com/d/msgid/j=
ailhouse-dev/860c1e75-c28f-4157-9212-a3d87ad25b27n%40googlegroups.com?utm_m=
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
<br>&gt; <a href=3D"https://groups.google.com/d/msgid/jailhouse-dev/6146e20=
8-1e8c-4335-abaf-9a2be8c85be5n%40googlegroups.com" target=3D"_blank" rel=3D=
"nofollow" data-saferedirecturl=3D"https://www.google.com/url?hl=3Dit&amp;q=
=3Dhttps://groups.google.com/d/msgid/jailhouse-dev/6146e208-1e8c-4335-abaf-=
9a2be8c85be5n%2540googlegroups.com&amp;source=3Dgmail&amp;ust=3D17055203088=
71000&amp;usg=3DAOvVaw3g-JMVjMnhsYa5SG32zsIY">https://groups.google.com/d/m=
sgid/jailhouse-dev/6146e208-1e8c-4335-abaf-9a2be8c85be5n%40googlegroups.com=
</a> &lt;<a href=3D"https://groups.google.com/d/msgid/jailhouse-dev/6146e20=
8-1e8c-4335-abaf-9a2be8c85be5n%40googlegroups.com?utm_medium=3Demail&amp;ut=
m_source=3Dfooter" target=3D"_blank" rel=3D"nofollow" data-saferedirecturl=
=3D"https://www.google.com/url?hl=3Dit&amp;q=3Dhttps://groups.google.com/d/=
msgid/jailhouse-dev/6146e208-1e8c-4335-abaf-9a2be8c85be5n%2540googlegroups.=
com?utm_medium%3Demail%26utm_source%3Dfooter&amp;source=3Dgmail&amp;ust=3D1=
705520308871000&amp;usg=3DAOvVaw13ZQuJqY-6U-rE6nbOypYg">https://groups.goog=
le.com/d/msgid/jailhouse-dev/6146e208-1e8c-4335-abaf-9a2be8c85be5n%40google=
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
om/d/msgid/jailhouse-dev/6fb04e63-2f4a-4d5b-9139-c11e9a9fc461n%40googlegrou=
ps.com?utm_medium=3Demail&utm_source=3Dfooter">https://groups.google.com/d/=
msgid/jailhouse-dev/6fb04e63-2f4a-4d5b-9139-c11e9a9fc461n%40googlegroups.co=
m</a>.<br />

------=_Part_97_1358540854.1705434260529--

------=_Part_96_585508954.1705434260529--
