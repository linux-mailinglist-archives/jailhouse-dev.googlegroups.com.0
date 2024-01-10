Return-Path: <jailhouse-dev+bncBDIJ36FET4JRB5EQ7OWAMGQEICRTBMQ@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-yb1-xb3f.google.com (mail-yb1-xb3f.google.com [IPv6:2607:f8b0:4864:20::b3f])
	by mail.lfdr.de (Postfix) with ESMTPS id 47010829EB8
	for <lists+jailhouse-dev@lfdr.de>; Wed, 10 Jan 2024 17:40:22 +0100 (CET)
Received: by mail-yb1-xb3f.google.com with SMTP id 3f1490d57ef6-dbe9dacc912sf4998227276.2
        for <lists+jailhouse-dev@lfdr.de>; Wed, 10 Jan 2024 08:40:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20230601; t=1704904821; x=1705509621; darn=lfdr.de;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:x-original-sender:mime-version
         :subject:references:in-reply-to:message-id:to:from:date:sender:from
         :to:cc:subject:date:message-id:reply-to;
        bh=yUv4c1ztPia2b0wI7UoGO0+eXqalzZk4nhpGLEtczOw=;
        b=B78ilV44FKS4qsgc41czjT3pjhk1OzF+p302Zywb2XF0evRkZAVx5kOCKLvWFzO/v5
         5Qv77+BhapR+bqFOPfKckjbzMC2+2ralvJxySKNo5ifM2iwSPhhsrXdH9F5cAmkXP+DV
         lP6RdABxpxAW6WsWcg2hWxun0X/IkrB6ZkEQ5pKLZ8ebH3wXdaKNGJqym0yRbhcf8Gtd
         7h8G84xEVu3PvFkvJUdfgGEzg3xcMi5ZtDx6S6SJLncoaJ04262app9SPMPZ0K+0imzy
         TDtU4R8oawldX2dbw3hFeirXpFrJ6+44z+8h7rI/3YUKTagNa3oJ/IsuNdCqroQpxvxc
         D0vA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1704904821; x=1705509621; darn=lfdr.de;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:x-original-sender:mime-version
         :subject:references:in-reply-to:message-id:to:from:date:from:to:cc
         :subject:date:message-id:reply-to;
        bh=yUv4c1ztPia2b0wI7UoGO0+eXqalzZk4nhpGLEtczOw=;
        b=ijkre740ds/OMuGeugbVMa9ObV3NvOk/gvgkf7TVX2RhJrzUEy+jPu29DCkmaHxokR
         ELbn47VLhWGEwLM6H/90DtQEJZR+lxSCBKBkW5LPPDQDJDuaXp/0RDZwBzinn5b9ZD3h
         6KA8dpfqOg/275OR/i/ednuq+cCC1h+WQo29kpKvxgUs7ajctL1e3ZKAYfQxp44aAnGJ
         UtUbwJ0vLPfygKK7aSnSwxe3Zj5KGaYuW8tsBgT3DmmjZXjqECgLsNZqFQrqCcbMjAF0
         CQPN+P5V3puDcxVVV0eJW19u6GxLJoNpimER6ZJCVczJluxWwKzY3R6x7K1FyHrkM8Wq
         dfEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1704904821; x=1705509621;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :x-spam-checked-in-group:list-id:mailing-list:precedence
         :x-original-sender:mime-version:subject:references:in-reply-to
         :message-id:to:from:date:x-beenthere:x-gm-message-state:sender:from
         :to:cc:subject:date:message-id:reply-to;
        bh=yUv4c1ztPia2b0wI7UoGO0+eXqalzZk4nhpGLEtczOw=;
        b=COp9MHZxkgLBSDsHUtASPl3asNLmN4WPJohgrW1jaVVuHjz+4sBHjvuG0Kk6+CiDJ/
         Wq8S6AJY+NT+/3R4JH5cFc8FLt1L8CNuse5rQ3ac+/51T29yqoO17M3cPiGfisfOxm2/
         xt2rcFl5E5GREVegp7ItQ9OtClg24fWMB4R9sANPCOwUp/WNqvpXEYU0MVW7H9G7pL+V
         Rcq+ac74iGyLoDIcUBv4V24fWkNxoprbSo4VAvGZ8W5S3gaHWQy87I/tmv5OcmoptCk0
         m2j/exnPh0ZKoGbogx2MaFpbwTIpMKlnFfTMnhzEe6YeqUhXZD7+R6shGRJsyB713ng0
         OLYQ==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AOJu0YyRzx7B8UvdDBzus4SGIXfWhBPNt44vuRDsAU+HUzG9ot/JGSIT
	DBTb0E0t/CA6gH7k2c1etA0=
X-Google-Smtp-Source: AGHT+IGfkU1lNVCwICeJUrd44HdCga5tjlQE12M+cVycN4jRoFn9HfpzOB5K2SjTQelnUhOX6n3lWQ==
X-Received: by 2002:a25:ad8e:0:b0:dbd:e651:a32f with SMTP id z14-20020a25ad8e000000b00dbde651a32fmr1062852ybi.114.1704904820668;
        Wed, 10 Jan 2024 08:40:20 -0800 (PST)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a25:d208:0:b0:dbd:5a03:f5a8 with SMTP id j8-20020a25d208000000b00dbd5a03f5a8ls370631ybg.2.-pod-prod-02-us;
 Wed, 10 Jan 2024 08:40:19 -0800 (PST)
X-Received: by 2002:a05:690c:b03:b0:5e3:2a36:b4d with SMTP id cj3-20020a05690c0b0300b005e32a360b4dmr486152ywb.1.1704904819076;
        Wed, 10 Jan 2024 08:40:19 -0800 (PST)
Date: Wed, 10 Jan 2024 08:40:18 -0800 (PST)
From: =?UTF-8?Q?Michele_Pescap=C3=A8?= <mic.pescape@gmail.com>
To: Jailhouse <jailhouse-dev@googlegroups.com>
Message-Id: <9a021e3f-caca-4ebe-9351-be2c3e999446n@googlegroups.com>
In-Reply-To: <0431cb6c-c2ca-4417-97d4-f0dc9bc3f389@oth-regensburg.de>
References: <824bacc4-b7ae-47c9-878e-7203214b4fc3n@googlegroups.com>
 <d36e18a4-dd64-4f9c-b2cf-89b02b1a0469@oth-regensburg.de>
 <c9dad4f3-f856-4f25-b6ad-41ec63cf2c64n@googlegroups.com>
 <219b013e-4970-4bb3-969f-bb0d7bae3ab7n@googlegroups.com>
 <2202bf30-5b2c-45ea-9f9f-699daf338843n@googlegroups.com>
 <0431cb6c-c2ca-4417-97d4-f0dc9bc3f389@oth-regensburg.de>
Subject: Re: Unable to start non root linux cell
MIME-Version: 1.0
Content-Type: multipart/mixed; 
	boundary="----=_Part_24858_1555442018.1704904818182"
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

------=_Part_24858_1555442018.1704904818182
Content-Type: multipart/alternative; 
	boundary="----=_Part_24859_154305498.1704904818182"

------=_Part_24859_154305498.1704904818182
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi,

I'm attaching the configurations I'm currently using. I'll try disabling=20
KASLR.

Thank you for your help,
Michele

Il giorno mercoled=C3=AC 10 gennaio 2024 alle 17:24:35 UTC+1 Ralf Ramsauer =
ha=20
scritto:

> Hi,
>
> On 09/01/2024 19:58, Michele Pescap=C3=A8 wrote:
> > Hi,
> >=20
> > Just an update, I was able to get the following output by adding -c=20
> > "earlyprintk=3DttyS0,115200" to the command line:
> >=20
> > Started cell "linux-1"
> >=20
> >=20
> > Invalid physical address chosen!
>
> could you please share your system and non-root cell configuration?
>
> It smells like you have an overlap with the communication region. You=20
> can check that with tools/jailhouse-config-check.
>
> >=20
> >=20
> >=20
> >=20
> > Physical KASLR disabled: no suitable memory region!
>
> Disable KASLR in your kernel for the moment. You don't need it while=20
> ramping up your system.
>
> Thanks,
> Ralf
>
> >=20
> > [    0.000000] Linux version 6.2.0-rc3 (root@mp-LINUX-DESKTOP)=20
> > (x86_64-buildroot-linux-gnu-gcc.br_real (Buildroot 2023.11) 12.3.0, GNU=
=20
> > ld (GNU Binutils) 2.40) #2 SMP PREEMPT_DYNAMIC Sun Jan  7 18:35:23 CET=
=20
> 2024
> > [    0.000000] Command line: earlyprintk=3DttyS0,115200
> > [    0.000000] KERNEL supported cpus:
> > [    0.000000]   Intel GenuineIntel
> > [    0.000000]   AMD AuthenticAMD
> > [    0.000000] x86/fpu: Supporting XSAVE feature 0x001: 'x87 floating=
=20
> > point registers'
> > [    0.000000] x86/fpu: Supporting XSAVE feature 0x002: 'SSE registers'
> > [    0.000000] x86/fpu: Supporting XSAVE feature 0x004: 'AVX registers'
> > [    0.000000] x86/fpu: xstate_offset[2]:  576, xstate_sizes[2]:  256
> > [    0.000000] x86/fpu: Enabled xstate features 0x7, context size is 83=
2=20
> > bytes, using 'compacted' format.
> > [    0.000000] signal: max sigframe size: 1776
> > [    0.000000] BIOS-provided physical RAM map:
> > [    0.000000] BIOS-e801: [mem 0x0000000000000000-0x000000000009efff]=
=20
> usable
> > [    0.000000] printk: bootconsole [earlyser0] enabled
> > [    0.000000] NX (Execute Disable) protection: active
> > [    0.000000] extended physical RAM map:
> > [    0.000000] reserve setup_data: [mem=20
> > 0x0000000000000000-0x0000000000001fff] usable
> > [    0.000000] reserve setup_data: [mem=20
> > 0x0000000000002000-0x000000000000212b] usable
> > [    0.000000] reserve setup_data: [mem=20
> > 0x000000000000212c-0x000000000009efff] usable
> > [    0.000000] DMI not present or invalid.
> > [    0.000000] Hypervisor detected: Jailhouse
> > [    0.000000] tsc: Detected 3393.624 MHz processor
> > [    0.000019] .text .data .bss are not marked as E820_TYPE_RAM!
> > [    0.005751] last_pfn =3D 0x3630 max_arch_pfn =3D 0x400000000
> > [    0.011039] x86/PAT: Configuration [0-7]: WB  WC  UC- UC  WB  WP  UC=
-=20
> WT
> > Memory KASLR using RDRAND RDTSC...
> > [    0.032374] Using GB pages for direct mapping
> > [    0.036743] Kernel panic - not syncing: alloc_low_pages: can not=20
> > alloc memory
> > [    0.043712] CPU: 0 PID: 0 Comm: swapper Not tainted 6.2.0-rc3 #2
> > [    0.049702] Call Trace:
> > [    0.052134]  <TASK>
> > [    0.054219]  dump_stack_lvl+0x3a/0x58
> > [    0.057865]  dump_stack+0x10/0x18
> > [    0.061162]  panic+0x15c/0x308
> > [    0.064205]  alloc_low_pages+0x7d/0x1c0
> > [    0.068024]  phys_pmd_init+0x1f2/0x2eb
> > [    0.071758]  phys_pud_init+0x114/0x2d5
> > [    0.075493]  phys_p4d_init+0x4c/0x269
> > [    0.079135]  ? __raw_callee_save___native_queued_spin_unlock+0x15/0x=
30
> > [    0.085649]  __kernel_physical_mapping_init+0x11e/0x29a
> > [    0.090859]  kernel_physical_mapping_init+0xf/0x20
> > [    0.095631]  init_memory_mapping+0x273/0x410
> > [    0.099890]  init_range_memory_mapping+0xec/0x150
> > [    0.104574]  init_mem_mapping+0x268/0x2e7
> > [    0.108567]  setup_arch+0x839/0xdcf
> > [    0.112039]  ? lockdown_lsm_init+0x21/0x2f
> > [    0.116120]  start_kernel+0x6e/0x997
> > [    0.119680]  x86_64_start_reservations+0x24/0x2c
> > [    0.124281]  x86_64_start_kernel+0xec/0xff
> > [    0.128360]  secondary_startup_64_no_verify+0xe5/0xeb
> > [    0.133400]  </TASK>
> > [    0.135570] ---[ end Kernel panic - not syncing: alloc_low_pages: ca=
n=20
> > not alloc memory ]---
> > Closing cell "linux-1"
> > Page pool usage after cell destruction: mem 254/32211, remap 16392/1310=
72
> > CPU 4 received SIPI, vector 96
> > CPU 5 received SIPI, vector 96
> >=20
> > This happens both with and without the initrd in the command, i'll try=
=20
> > to solve this and see what happens.
> >=20
> > By the way, is it possible that the new cell starts transmitting with a=
=20
> > baud rate different than the root cell? Without specifying the speed in=
=20
> > the command above the serial console stopped receiving anything until I=
=20
> > disabled and re-enabled the hypervisor. If not I may have something=20
> > wrong on my end to solve
> >=20
> > Il giorno marted=C3=AC 9 gennaio 2024 alle 17:37:48 UTC+1 Michele Pesca=
p=C3=A8 ha=20
> > scritto:
> >=20
> > I stand corrected, the freeze happens when i do not set
> > JAILHOUSE_CELL_PASSIVE_COMMREG in the inmate
> >=20
> > Il giorno marted=C3=AC 9 gennaio 2024 alle 17:26:57 UTC+1 Michele Pesca=
p=C3=A8
> > ha scritto:
> >=20
> > Hi, thank you for replying.
> >=20
> > ttyS0 is indeed whitelisted in the inmate and the number of
> > pio_regions is set accordingly.
> >=20
> > As for the crash after disable/shutdown, I think it was related
> > to the PCI device, after commenting that and the corresponding
> > regions out I no longer get that freeze. CONFIG_JAILHOUSE_GUEST and
> > CONFIG_JAILHOUSE_DBCON were already set in the kernel
> > configuration I'm using for the non root linux; still, I
> > recompiled it just in case.
> >=20
> > Michele
> >=20
> > Il giorno marted=C3=AC 9 gennaio 2024 alle 14:14:33 UTC+1 Ralf
> > Ramsauer ha scritto:
> >=20
> > Hi,
> >=20
> > On 08/01/2024 23:56, Michele Pescap=C3=A8 wrote:
> > > Hi all,
> > >
> > > I have an AMD Ryzen 2600 on a b450 motherboard. My goal
> > is to run two
> > > non root linux cells, however, as of right now, I'm not
> > able to start
> > > any non root linux cells.
> > > First of all I don't receive an output from the cell (I
> > do get output
> > > from the apic-demo though), therefore I don't really know
> > if they're
> > > even crashing or not; this is the output I get from the
> > hypervisor after
> > > enabling the root cell and issuing the following command:
> > >
> > > sudo jailhouse cell linux configs/x86/linux_guest1.cell
> > > ../buildroot-2023.11/output/images/bzImage -i
> > > ../buildroot-2023.11/output/images/rootfs.cpio
> >=20
> > for the first few tries, simply don't load a ramdisk. Try to
> > get the
> > kernel booting. It will crash with "cannot mount rootfs". If
> > we get so
> > far, then you can continue specifying the ramdisk. But
> > first, we have to
> > get that far.
> >=20
> > >
> > > Adding PCI device ff:1f.7 to cell "linux-x86-demo"
> > > Created cell "linux-x86-demo"
> > > Page pool usage after cell creation: mem 336/32211, remap
> > 16392/131072
> > > Cell "linux-x86-demo" can be loaded
> > > CPU 4 received SIPI, vector 100
> > > CPU 3 received SIPI, vector 100
> > > Started cell "linux-x86-demo"
> > >
> > > After this the cell appears to be running in cell list,
> > however I can't
> > > seem to get any output to confirm that (I even set
> > > JAILHOUSE_CELL_VIRTUAL_CONSOLE_ACTIVE, but nothing
> > appears on the vrtual
> > > console accessed via "jailhouse console -f"). I also
> > tried adding -c
> > > "console=3DttyS0,115200".
> >=20
> > ttyS0, i.e., x86 Port 0x3f8 is whitelisted in the cell
> > configuration?
> > Actually, your cmdline is correct.
> >=20
> > > At this point if I try to disable/shutdown the cell, the
> > system freezes
> > > requiring a hard reset.
> >=20
> > Okay, is the guest Linux compiled with Jailhouse guest
> > support? Please
> > ensure that non-root Linux is compiled with
> > CONFIG_JAILHOUSE_GUEST and
> > CONFIG_JAILHOUSE_DBCON. The first one is mandatory for x86
> > Linux guests.
> >=20
> > >
> > > Also, there seems to be a mismatch between the PCI bdf
> > value in the log
> > > above and the one in the cell's configuration. In both
> > root and non root
> > > cells i set .bdf =3D (0x0f << 3) for the IVSHMEM net device
> > and the Root
> > > cell correctly reports that ("Adding virtual PCI device
> > 00:0f.0 to cell
> > > "RootCell"").
> >=20
> > First things first. Let's try to get Linux kicked off before
> > diving into
> > PCI. Comment it out for the moment, let's do that later.
> >=20
> > Ralf
> >=20
> > >
> > > If I understood correctly, once the cell works properly I
> > won't need to
> > > set the console anymore as I can assign an ip (-c "ip
> > x.x.x.x" in the
> > > cell linux command) and ssh to the cell, right?
> > >
> > > I attach the root and non root cells' configurations in
> > case they're
> > > needed. I can provide both the root and non root cell's
> > kernel .conf and
> > > the buildroot configuration I used if needed.
> > >
> > > Thank you for your time,
> > > Michele
> > >
> > > --
> > > You received this message because you are subscribed to
> > the Google
> > > Groups "Jailhouse" group.
> > > To unsubscribe from this group and stop receiving emails
> > from it, send
> > > an email to jailhouse-de...@googlegroups.com
> > > <mailto:jailhouse-de...@googlegroups.com>.
> > > To view this discussion on the web visit
> > >
> >=20
> https://groups.google.com/d/msgid/jailhouse-dev/824bacc4-b7ae-47c9-878e-7=
203214b4fc3n%40googlegroups.com=20
> <
> https://groups.google.com/d/msgid/jailhouse-dev/824bacc4-b7ae-47c9-878e-7=
203214b4fc3n%40googlegroups.com>=20
> <
> https://groups.google.com/d/msgid/jailhouse-dev/824bacc4-b7ae-47c9-878e-7=
203214b4fc3n%40googlegroups.com?utm_medium=3Demail&utm_source=3Dfooter=20
> <
> https://groups.google.com/d/msgid/jailhouse-dev/824bacc4-b7ae-47c9-878e-7=
203214b4fc3n%40googlegroups.com?utm_medium=3Demail&utm_source=3Dfooter
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
> https://groups.google.com/d/msgid/jailhouse-dev/2202bf30-5b2c-45ea-9f9f-6=
99daf338843n%40googlegroups.com=20
> <
> https://groups.google.com/d/msgid/jailhouse-dev/2202bf30-5b2c-45ea-9f9f-6=
99daf338843n%40googlegroups.com?utm_medium=3Demail&utm_source=3Dfooter
> >.
>

--=20
You received this message because you are subscribed to the Google Groups "=
Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/=
jailhouse-dev/9a021e3f-caca-4ebe-9351-be2c3e999446n%40googlegroups.com.

------=_Part_24859_154305498.1704904818182
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi,<br /><br />I'm attaching the configurations I'm currently using. I'll t=
ry disabling KASLR.<br /><br />Thank you for your help,<br />Michele<br /><=
br /><div class=3D"gmail_quote"><div dir=3D"auto" class=3D"gmail_attr">Il g=
iorno mercoled=C3=AC 10 gennaio 2024 alle 17:24:35 UTC+1 Ralf Ramsauer ha s=
critto:<br/></div><blockquote class=3D"gmail_quote" style=3D"margin: 0 0 0 =
0.8ex; border-left: 1px solid rgb(204, 204, 204); padding-left: 1ex;">Hi,
<br>
<br>On 09/01/2024 19:58, Michele Pescap=C3=A8 wrote:
<br>&gt; Hi,
<br>&gt;=20
<br>&gt; Just an update, I was able to get the following output by adding -=
c=20
<br>&gt; &quot;earlyprintk=3DttyS0,115200&quot; to the command line:
<br>&gt;=20
<br>&gt; Started cell &quot;linux-1&quot;
<br>&gt;=20
<br>&gt;=20
<br>&gt; Invalid physical address chosen!
<br>
<br>could you please share your system and non-root cell configuration?
<br>
<br>It smells like you have an overlap with the communication region. You=
=20
<br>can check that with tools/jailhouse-config-check.
<br>
<br>&gt;=20
<br>&gt;=20
<br>&gt;=20
<br>&gt;=20
<br>&gt; Physical KASLR disabled: no suitable memory region!
<br>
<br>Disable KASLR in your kernel for the moment. You don&#39;t need it whil=
e=20
<br>ramping up your system.
<br>
<br>Thanks,
<br>   Ralf
<br>
<br>&gt;=20
<br>&gt; [ =C2=A0 =C2=A00.000000] Linux version 6.2.0-rc3 (root@mp-LINUX-DE=
SKTOP)=20
<br>&gt; (x86_64-buildroot-linux-gnu-gcc.br_real (Buildroot 2023.11) 12.3.0=
, GNU=20
<br>&gt; ld (GNU Binutils) 2.40) #2 SMP PREEMPT_DYNAMIC Sun Jan =C2=A07 18:=
35:23 CET 2024
<br>&gt; [ =C2=A0 =C2=A00.000000] Command line: earlyprintk=3DttyS0,115200
<br>&gt; [ =C2=A0 =C2=A00.000000] KERNEL supported cpus:
<br>&gt; [ =C2=A0 =C2=A00.000000] =C2=A0 Intel GenuineIntel
<br>&gt; [ =C2=A0 =C2=A00.000000] =C2=A0 AMD AuthenticAMD
<br>&gt; [ =C2=A0 =C2=A00.000000] x86/fpu: Supporting XSAVE feature 0x001: =
&#39;x87 floating=20
<br>&gt; point registers&#39;
<br>&gt; [ =C2=A0 =C2=A00.000000] x86/fpu: Supporting XSAVE feature 0x002: =
&#39;SSE registers&#39;
<br>&gt; [ =C2=A0 =C2=A00.000000] x86/fpu: Supporting XSAVE feature 0x004: =
&#39;AVX registers&#39;
<br>&gt; [ =C2=A0 =C2=A00.000000] x86/fpu: xstate_offset[2]: =C2=A0576, xst=
ate_sizes[2]: =C2=A0256
<br>&gt; [ =C2=A0 =C2=A00.000000] x86/fpu: Enabled xstate features 0x7, con=
text size is 832=20
<br>&gt; bytes, using &#39;compacted&#39; format.
<br>&gt; [ =C2=A0 =C2=A00.000000] signal: max sigframe size: 1776
<br>&gt; [ =C2=A0 =C2=A00.000000] BIOS-provided physical RAM map:
<br>&gt; [ =C2=A0 =C2=A00.000000] BIOS-e801: [mem 0x0000000000000000-0x0000=
00000009efff] usable
<br>&gt; [ =C2=A0 =C2=A00.000000] printk: bootconsole [earlyser0] enabled
<br>&gt; [ =C2=A0 =C2=A00.000000] NX (Execute Disable) protection: active
<br>&gt; [ =C2=A0 =C2=A00.000000] extended physical RAM map:
<br>&gt; [ =C2=A0 =C2=A00.000000] reserve setup_data: [mem=20
<br>&gt; 0x0000000000000000-0x0000000000001fff] usable
<br>&gt; [ =C2=A0 =C2=A00.000000] reserve setup_data: [mem=20
<br>&gt; 0x0000000000002000-0x000000000000212b] usable
<br>&gt; [ =C2=A0 =C2=A00.000000] reserve setup_data: [mem=20
<br>&gt; 0x000000000000212c-0x000000000009efff] usable
<br>&gt; [ =C2=A0 =C2=A00.000000] DMI not present or invalid.
<br>&gt; [ =C2=A0 =C2=A00.000000] Hypervisor detected: Jailhouse
<br>&gt; [ =C2=A0 =C2=A00.000000] tsc: Detected 3393.624 MHz processor
<br>&gt; [ =C2=A0 =C2=A00.000019] .text .data .bss are not marked as E820_T=
YPE_RAM!
<br>&gt; [ =C2=A0 =C2=A00.005751] last_pfn =3D 0x3630 max_arch_pfn =3D 0x40=
0000000
<br>&gt; [ =C2=A0 =C2=A00.011039] x86/PAT: Configuration [0-7]: WB =C2=A0WC=
 =C2=A0UC- UC =C2=A0WB =C2=A0WP =C2=A0UC- WT
<br>&gt; Memory KASLR using RDRAND RDTSC...
<br>&gt; [ =C2=A0 =C2=A00.032374] Using GB pages for direct mapping
<br>&gt; [ =C2=A0 =C2=A00.036743] Kernel panic - not syncing: alloc_low_pag=
es: can not=20
<br>&gt; alloc memory
<br>&gt; [ =C2=A0 =C2=A00.043712] CPU: 0 PID: 0 Comm: swapper Not tainted 6=
.2.0-rc3 #2
<br>&gt; [ =C2=A0 =C2=A00.049702] Call Trace:
<br>&gt; [ =C2=A0 =C2=A00.052134] =C2=A0&lt;TASK&gt;
<br>&gt; [ =C2=A0 =C2=A00.054219] =C2=A0dump_stack_lvl+0x3a/0x58
<br>&gt; [ =C2=A0 =C2=A00.057865] =C2=A0dump_stack+0x10/0x18
<br>&gt; [ =C2=A0 =C2=A00.061162] =C2=A0panic+0x15c/0x308
<br>&gt; [ =C2=A0 =C2=A00.064205] =C2=A0alloc_low_pages+0x7d/0x1c0
<br>&gt; [ =C2=A0 =C2=A00.068024] =C2=A0phys_pmd_init+0x1f2/0x2eb
<br>&gt; [ =C2=A0 =C2=A00.071758] =C2=A0phys_pud_init+0x114/0x2d5
<br>&gt; [ =C2=A0 =C2=A00.075493] =C2=A0phys_p4d_init+0x4c/0x269
<br>&gt; [ =C2=A0 =C2=A00.079135] =C2=A0? __raw_callee_save___native_queued=
_spin_unlock+0x15/0x30
<br>&gt; [ =C2=A0 =C2=A00.085649] =C2=A0__kernel_physical_mapping_init+0x11=
e/0x29a
<br>&gt; [ =C2=A0 =C2=A00.090859] =C2=A0kernel_physical_mapping_init+0xf/0x=
20
<br>&gt; [ =C2=A0 =C2=A00.095631] =C2=A0init_memory_mapping+0x273/0x410
<br>&gt; [ =C2=A0 =C2=A00.099890] =C2=A0init_range_memory_mapping+0xec/0x15=
0
<br>&gt; [ =C2=A0 =C2=A00.104574] =C2=A0init_mem_mapping+0x268/0x2e7
<br>&gt; [ =C2=A0 =C2=A00.108567] =C2=A0setup_arch+0x839/0xdcf
<br>&gt; [ =C2=A0 =C2=A00.112039] =C2=A0? lockdown_lsm_init+0x21/0x2f
<br>&gt; [ =C2=A0 =C2=A00.116120] =C2=A0start_kernel+0x6e/0x997
<br>&gt; [ =C2=A0 =C2=A00.119680] =C2=A0x86_64_start_reservations+0x24/0x2c
<br>&gt; [ =C2=A0 =C2=A00.124281] =C2=A0x86_64_start_kernel+0xec/0xff
<br>&gt; [ =C2=A0 =C2=A00.128360] =C2=A0secondary_startup_64_no_verify+0xe5=
/0xeb
<br>&gt; [ =C2=A0 =C2=A00.133400] =C2=A0&lt;/TASK&gt;
<br>&gt; [ =C2=A0 =C2=A00.135570] ---[ end Kernel panic - not syncing: allo=
c_low_pages: can=20
<br>&gt; not alloc memory ]---
<br>&gt; Closing cell &quot;linux-1&quot;
<br>&gt; Page pool usage after cell destruction: mem 254/32211, remap 16392=
/131072
<br>&gt; CPU 4 received SIPI, vector 96
<br>&gt; CPU 5 received SIPI, vector 96
<br>&gt;=20
<br>&gt; This happens both with and without the initrd in the command, i&#3=
9;ll try=20
<br>&gt; to solve this and see what happens.
<br>&gt;=20
<br>&gt; By the way, is it possible that the new cell starts transmitting w=
ith a=20
<br>&gt; baud rate different than the root cell? Without specifying the spe=
ed in=20
<br>&gt; the command above the serial console stopped receiving anything un=
til I=20
<br>&gt; disabled and re-enabled the hypervisor. If not I may have somethin=
g=20
<br>&gt; wrong on my end to solve
<br>&gt;=20
<br>&gt; Il giorno marted=C3=AC 9 gennaio 2024 alle 17:37:48 UTC+1 Michele =
Pescap=C3=A8 ha=20
<br>&gt; scritto:
<br>&gt;=20
<br>&gt;     I stand corrected, the freeze happens when i do not set
<br>&gt;     JAILHOUSE_CELL_PASSIVE_COMMREG in the inmate
<br>&gt;=20
<br>&gt;     Il giorno marted=C3=AC 9 gennaio 2024 alle 17:26:57 UTC+1 Mich=
ele Pescap=C3=A8
<br>&gt;     ha scritto:
<br>&gt;=20
<br>&gt;         Hi, thank you for replying.
<br>&gt;=20
<br>&gt;         ttyS0 is indeed whitelisted in the inmate and the number o=
f
<br>&gt;         pio_regions is set accordingly.
<br>&gt;=20
<br>&gt;         As for the crash after disable/shutdown, I think it was re=
lated
<br>&gt;         to the PCI device, after commenting that and the correspon=
ding
<br>&gt;         regions out I no longer get that freeze. CONFIG_JAILHOUSE_=
GUEST and
<br>&gt;         CONFIG_JAILHOUSE_DBCON were already set in the kernel
<br>&gt;         configuration I&#39;m using for the non root linux; still,=
 I
<br>&gt;         recompiled it just in case.
<br>&gt;=20
<br>&gt;         Michele
<br>&gt;=20
<br>&gt;         Il giorno marted=C3=AC 9 gennaio 2024 alle 14:14:33 UTC+1 =
Ralf
<br>&gt;         Ramsauer ha scritto:
<br>&gt;=20
<br>&gt;             Hi,
<br>&gt;=20
<br>&gt;             On 08/01/2024 23:56, Michele Pescap=C3=A8 wrote:
<br>&gt;              &gt; Hi all,
<br>&gt;              &gt;
<br>&gt;              &gt; I have an AMD Ryzen 2600 on a b450 motherboard. =
My goal
<br>&gt;             is to run two
<br>&gt;              &gt; non root linux cells, however, as of right now, =
I&#39;m not
<br>&gt;             able to start
<br>&gt;              &gt; any non root linux cells.
<br>&gt;              &gt; First of all I don&#39;t receive an output from =
the cell (I
<br>&gt;             do get output
<br>&gt;              &gt; from the apic-demo though), therefore I don&#39;=
t really know
<br>&gt;             if they&#39;re
<br>&gt;              &gt; even crashing or not; this is the output I get f=
rom the
<br>&gt;             hypervisor after
<br>&gt;              &gt; enabling the root cell and issuing the following=
 command:
<br>&gt;              &gt;
<br>&gt;              &gt; sudo jailhouse cell linux configs/x86/linux_gues=
t1.cell
<br>&gt;              &gt; ../buildroot-2023.11/output/images/bzImage -i
<br>&gt;              &gt; ../buildroot-2023.11/output/images/rootfs.cpio
<br>&gt;=20
<br>&gt;             for the first few tries, simply don&#39;t load a ramdi=
sk. Try to
<br>&gt;             get the
<br>&gt;             kernel booting. It will crash with &quot;cannot mount =
rootfs&quot;. If
<br>&gt;             we get so
<br>&gt;             far, then you can continue specifying the ramdisk. But
<br>&gt;             first, we have to
<br>&gt;             get that far.
<br>&gt;=20
<br>&gt;              &gt;
<br>&gt;              &gt; Adding PCI device ff:1f.7 to cell &quot;linux-x8=
6-demo&quot;
<br>&gt;              &gt; Created cell &quot;linux-x86-demo&quot;
<br>&gt;              &gt; Page pool usage after cell creation: mem 336/322=
11, remap
<br>&gt;             16392/131072
<br>&gt;              &gt; Cell &quot;linux-x86-demo&quot; can be loaded
<br>&gt;              &gt; CPU 4 received SIPI, vector 100
<br>&gt;              &gt; CPU 3 received SIPI, vector 100
<br>&gt;              &gt; Started cell &quot;linux-x86-demo&quot;
<br>&gt;              &gt;
<br>&gt;              &gt; After this the cell appears to be running in cel=
l list,
<br>&gt;             however I can&#39;t
<br>&gt;              &gt; seem to get any output to confirm that (I even s=
et
<br>&gt;              &gt; JAILHOUSE_CELL_VIRTUAL_CONSOLE_ACTIVE, but nothi=
ng
<br>&gt;             appears on the vrtual
<br>&gt;              &gt; console accessed via &quot;jailhouse console -f&=
quot;). I also
<br>&gt;             tried adding -c
<br>&gt;              &gt; &quot;console=3DttyS0,115200&quot;.
<br>&gt;=20
<br>&gt;             ttyS0, i.e., x86 Port 0x3f8 is whitelisted in the cell
<br>&gt;             configuration?
<br>&gt;             Actually, your cmdline is correct.
<br>&gt;=20
<br>&gt;              &gt; At this point if I try to disable/shutdown the c=
ell, the
<br>&gt;             system freezes
<br>&gt;              &gt; requiring a hard reset.
<br>&gt;=20
<br>&gt;             Okay, is the guest Linux compiled with Jailhouse guest
<br>&gt;             support? Please
<br>&gt;             ensure that non-root Linux is compiled with
<br>&gt;             CONFIG_JAILHOUSE_GUEST and
<br>&gt;             CONFIG_JAILHOUSE_DBCON. The first one is mandatory for=
 x86
<br>&gt;             Linux guests.
<br>&gt;=20
<br>&gt;              &gt;
<br>&gt;              &gt; Also, there seems to be a mismatch between the P=
CI bdf
<br>&gt;             value in the log
<br>&gt;              &gt; above and the one in the cell&#39;s configuratio=
n. In both
<br>&gt;             root and non root
<br>&gt;              &gt; cells i set .bdf =3D (0x0f &lt;&lt; 3) for the I=
VSHMEM net device
<br>&gt;             and the Root
<br>&gt;              &gt; cell correctly reports that (&quot;Adding virtua=
l PCI device
<br>&gt;             00:0f.0 to cell
<br>&gt;              &gt; &quot;RootCell&quot;&quot;).
<br>&gt;=20
<br>&gt;             First things first. Let&#39;s try to get Linux kicked =
off before
<br>&gt;             diving into
<br>&gt;             PCI. Comment it out for the moment, let&#39;s do that =
later.
<br>&gt;=20
<br>&gt;             Ralf
<br>&gt;=20
<br>&gt;              &gt;
<br>&gt;              &gt; If I understood correctly, once the cell works p=
roperly I
<br>&gt;             won&#39;t need to
<br>&gt;              &gt; set the console anymore as I can assign an ip (-=
c &quot;ip
<br>&gt;             x.x.x.x&quot; in the
<br>&gt;              &gt; cell linux command) and ssh to the cell, right?
<br>&gt;              &gt;
<br>&gt;              &gt; I attach the root and non root cells&#39; config=
urations in
<br>&gt;             case they&#39;re
<br>&gt;              &gt; needed. I can provide both the root and non root=
 cell&#39;s
<br>&gt;             kernel .conf and
<br>&gt;              &gt; the buildroot configuration I used if needed.
<br>&gt;              &gt;
<br>&gt;              &gt; Thank you for your time,
<br>&gt;              &gt; Michele
<br>&gt;              &gt;
<br>&gt;              &gt; --
<br>&gt;              &gt; You received this message because you are subscr=
ibed to
<br>&gt;             the Google
<br>&gt;              &gt; Groups &quot;Jailhouse&quot; group.
<br>&gt;              &gt; To unsubscribe from this group and stop receivin=
g emails
<br>&gt;             from it, send
<br>&gt;              &gt; an email to <a href data-email-masked rel=3D"nof=
ollow">jailhouse-de...@googlegroups.com</a>
<br>&gt;              &gt; &lt;mailto:<a href data-email-masked rel=3D"nofo=
llow">jailhouse-de...@googlegroups.com</a>&gt;.
<br>&gt;              &gt; To view this discussion on the web visit
<br>&gt;              &gt;
<br>&gt;             <a href=3D"https://groups.google.com/d/msgid/jailhouse=
-dev/824bacc4-b7ae-47c9-878e-7203214b4fc3n%40googlegroups.com" target=3D"_b=
lank" rel=3D"nofollow" data-saferedirecturl=3D"https://www.google.com/url?h=
l=3Dit&amp;q=3Dhttps://groups.google.com/d/msgid/jailhouse-dev/824bacc4-b7a=
e-47c9-878e-7203214b4fc3n%2540googlegroups.com&amp;source=3Dgmail&amp;ust=
=3D1704990919007000&amp;usg=3DAOvVaw19P0DGXZYOxmuzo6epHUwU">https://groups.=
google.com/d/msgid/jailhouse-dev/824bacc4-b7ae-47c9-878e-7203214b4fc3n%40go=
oglegroups.com</a> &lt;<a href=3D"https://groups.google.com/d/msgid/jailhou=
se-dev/824bacc4-b7ae-47c9-878e-7203214b4fc3n%40googlegroups.com" target=3D"=
_blank" rel=3D"nofollow" data-saferedirecturl=3D"https://www.google.com/url=
?hl=3Dit&amp;q=3Dhttps://groups.google.com/d/msgid/jailhouse-dev/824bacc4-b=
7ae-47c9-878e-7203214b4fc3n%2540googlegroups.com&amp;source=3Dgmail&amp;ust=
=3D1704990919007000&amp;usg=3DAOvVaw19P0DGXZYOxmuzo6epHUwU">https://groups.=
google.com/d/msgid/jailhouse-dev/824bacc4-b7ae-47c9-878e-7203214b4fc3n%40go=
oglegroups.com</a>&gt; &lt;<a href=3D"https://groups.google.com/d/msgid/jai=
lhouse-dev/824bacc4-b7ae-47c9-878e-7203214b4fc3n%40googlegroups.com?utm_med=
ium=3Demail&amp;utm_source=3Dfooter" target=3D"_blank" rel=3D"nofollow" dat=
a-saferedirecturl=3D"https://www.google.com/url?hl=3Dit&amp;q=3Dhttps://gro=
ups.google.com/d/msgid/jailhouse-dev/824bacc4-b7ae-47c9-878e-7203214b4fc3n%=
2540googlegroups.com?utm_medium%3Demail%26utm_source%3Dfooter&amp;source=3D=
gmail&amp;ust=3D1704990919007000&amp;usg=3DAOvVaw0qNBDKraiw2uxsDb2pdxJX">ht=
tps://groups.google.com/d/msgid/jailhouse-dev/824bacc4-b7ae-47c9-878e-72032=
14b4fc3n%40googlegroups.com?utm_medium=3Demail&amp;utm_source=3Dfooter</a> =
&lt;<a href=3D"https://groups.google.com/d/msgid/jailhouse-dev/824bacc4-b7a=
e-47c9-878e-7203214b4fc3n%40googlegroups.com?utm_medium=3Demail&amp;utm_sou=
rce=3Dfooter" target=3D"_blank" rel=3D"nofollow" data-saferedirecturl=3D"ht=
tps://www.google.com/url?hl=3Dit&amp;q=3Dhttps://groups.google.com/d/msgid/=
jailhouse-dev/824bacc4-b7ae-47c9-878e-7203214b4fc3n%2540googlegroups.com?ut=
m_medium%3Demail%26utm_source%3Dfooter&amp;source=3Dgmail&amp;ust=3D1704990=
919007000&amp;usg=3DAOvVaw0qNBDKraiw2uxsDb2pdxJX">https://groups.google.com=
/d/msgid/jailhouse-dev/824bacc4-b7ae-47c9-878e-7203214b4fc3n%40googlegroups=
.com?utm_medium=3Demail&amp;utm_source=3Dfooter</a>&gt;&gt;.
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
<br>&gt; <a href=3D"https://groups.google.com/d/msgid/jailhouse-dev/2202bf3=
0-5b2c-45ea-9f9f-699daf338843n%40googlegroups.com" target=3D"_blank" rel=3D=
"nofollow" data-saferedirecturl=3D"https://www.google.com/url?hl=3Dit&amp;q=
=3Dhttps://groups.google.com/d/msgid/jailhouse-dev/2202bf30-5b2c-45ea-9f9f-=
699daf338843n%2540googlegroups.com&amp;source=3Dgmail&amp;ust=3D17049909190=
07000&amp;usg=3DAOvVaw3lMZ7q_xVIShKYzYpH7-8X">https://groups.google.com/d/m=
sgid/jailhouse-dev/2202bf30-5b2c-45ea-9f9f-699daf338843n%40googlegroups.com=
</a> &lt;<a href=3D"https://groups.google.com/d/msgid/jailhouse-dev/2202bf3=
0-5b2c-45ea-9f9f-699daf338843n%40googlegroups.com?utm_medium=3Demail&amp;ut=
m_source=3Dfooter" target=3D"_blank" rel=3D"nofollow" data-saferedirecturl=
=3D"https://www.google.com/url?hl=3Dit&amp;q=3Dhttps://groups.google.com/d/=
msgid/jailhouse-dev/2202bf30-5b2c-45ea-9f9f-699daf338843n%2540googlegroups.=
com?utm_medium%3Demail%26utm_source%3Dfooter&amp;source=3Dgmail&amp;ust=3D1=
704990919007000&amp;usg=3DAOvVaw1agP5JDDGl4uwBkc-ypiv2">https://groups.goog=
le.com/d/msgid/jailhouse-dev/2202bf30-5b2c-45ea-9f9f-699daf338843n%40google=
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
om/d/msgid/jailhouse-dev/9a021e3f-caca-4ebe-9351-be2c3e999446n%40googlegrou=
ps.com?utm_medium=3Demail&utm_source=3Dfooter">https://groups.google.com/d/=
msgid/jailhouse-dev/9a021e3f-caca-4ebe-9351-be2c3e999446n%40googlegroups.co=
m</a>.<br />

------=_Part_24859_154305498.1704904818182--

------=_Part_24858_1555442018.1704904818182
Content-Type: text/x-csrc; charset=US-ASCII; name=128M_b450m_root.c
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename=128M_b450m_root.c
X-Attachment-Id: 4a72edb2-35b5-4792-86d4-4b64bbc15384
Content-ID: <4a72edb2-35b5-4792-86d4-4b64bbc15384>

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
 * created with '/usr/local/libexec/jailhouse/jailhouse config create --mem-hv 128M --mem-inmates 512M b450m_big.c'
 *
 * NOTE: This config expects the following to be appended to your kernel cmdline
 *       "memmap=0x68000000$0x3a000000"
 */

#include <jailhouse/types.h>
#include <jailhouse/cell-config.h>

struct {
	struct jailhouse_system header;
	__u64 cpus[1];
	struct jailhouse_memory mem_regions[50];
	struct jailhouse_irqchip irqchips[2];
	struct jailhouse_pio pio_regions[16];
	struct jailhouse_pci_device pci_devices[39];
	struct jailhouse_pci_capability pci_caps[116];
} __attribute__((packed)) config = {
	.header = {
		.signature = JAILHOUSE_SYSTEM_SIGNATURE,
		.revision = JAILHOUSE_CONFIG_REVISION,
		.flags = JAILHOUSE_SYS_VIRTUAL_DEBUG_CONSOLE,
		.hypervisor_memory = {
			.phys_start = 0x3a000000,
			.size = 0x8000000,
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
		/* IVSHMEM shared memory regions (networking) - guest1 */
		JAILHOUSE_SHMEM_NET_REGIONS(0x61f00000, 0),
		
		/* MemRegion: 42000000-61ffffff : JAILHOUSE Inmate Memory - original*/
		/* MemRegion: 42000000-61efffff : JAILHOUSE Inmate Memory */
		{
			.phys_start = 0x42000000,
			.virt_start = 0x42000000,
			.size = 0x1ff00000,
			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE,
		},
		/* MemRegion: 42000000-4a0fffff : JAILHOUSE Inmate Memory - guest1*/
		/*{
			.phys_start = 0x42000000,
			.virt_start = 0x42000000,
			.size = 0x8100000,
			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE,
		},*/
		/* MemRegion: 00000000-0009ffff : System RAM */
		{
			.phys_start = 0x0,
			.virt_start = 0x0,
			.size = 0xa0000,
			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
				JAILHOUSE_MEM_EXECUTE | JAILHOUSE_MEM_DMA,
		},
		/* MemRegion: 000f0000-000fffff : System ROM */
		{
			.phys_start = 0xf0000,
			.virt_start = 0xf0000,
			.size = 0x10000,
			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE,
		},
		/* MemRegion: 00100000-09cfffff : System RAM */
		{
			.phys_start = 0x100000,
			.virt_start = 0x100000,
			.size = 0x9c00000,
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
		/* MemRegion: 0a200000-0a209fff : ACPI Non-volatile Storage */
		{
			.phys_start = 0xa200000,
			.virt_start = 0xa200000,
			.size = 0xa000,
			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE,
		},
		/* MemRegion: 0a20a000-0affffff : System RAM */
		{
			.phys_start = 0xa20a000,
			.virt_start = 0xa20a000,
			.size = 0xdf6000,
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
		/* MemRegion: a2000000-d7024fff : System RAM */
		{
			.phys_start = 0xa2000000,
			.virt_start = 0xa2000000,
			.size = 0x35025000,
			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
				JAILHOUSE_MEM_EXECUTE | JAILHOUSE_MEM_DMA,
		},
		/* MemRegion: d7026000-d8142fff : System RAM */
		{
			.phys_start = 0xd7026000,
			.virt_start = 0xd7026000,
			.size = 0x111d000,
			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
				JAILHOUSE_MEM_EXECUTE | JAILHOUSE_MEM_DMA,
		},
		/* MemRegion: d819a000-dbb12fff : System RAM */
		{
			.phys_start = 0xd819a000,
			.virt_start = 0xd819a000,
			.size = 0x3979000,
			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
				JAILHOUSE_MEM_EXECUTE | JAILHOUSE_MEM_DMA,
		},
		/* MemRegion: dbc63000-dbcdffff : ACPI Tables */
		{
			.phys_start = 0xdbc63000,
			.virt_start = 0xdbc63000,
			.size = 0x7d000,
			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE,
		},
		// invalid read addr 0xdc19d80c
		/* MemRegion: dbce0000 - dc200000 : ??? */ //part of ACPI non volatile storage
		{
			.phys_start = 0xdbce0000,
			.virt_start = 0xdbce0000,
			.size = 0x520000,
			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
				JAILHOUSE_MEM_EXECUTE | JAILHOUSE_MEM_DMA,
		},
		/* MemRegion: dc222000-dc222fff : MSFT0101:00 */
		{
			.phys_start = 0xdc222000,
			.virt_start = 0xdc222000,
			.size = 0x1000,
			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE,
		},
		/* MemRegion: dc226000-dc226fff : MSFT0101:00 */
		{
			.phys_start = 0xdc226000,
			.virt_start = 0xdc226000,
			.size = 0x1000,
			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE,
		},
		
		//error invalid read addr 0xdce25c18
		/* MemRegion: dc241000 - dcebbfff : ??? */ //reserved but accessed
		{
			.phys_start = 0xdc241000,
			.virt_start = 0xdc241000,
			.size = 0xc7b000,
			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
				JAILHOUSE_MEM_EXECUTE | JAILHOUSE_MEM_DMA,
		},
		/* MemRegion: dcebc000-deffffff : System RAM */
		{
			.phys_start = 0xdcebc000,
			.virt_start = 0xdcebc000,
			.size = 0x2144000,
			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
				JAILHOUSE_MEM_EXECUTE | JAILHOUSE_MEM_DMA,
		},
		/* MemRegion: e0000000-efffffff : 0000:07:00.0 */
		{
			.phys_start = 0xe0000000,
			.virt_start = 0xe0000000,
			.size = 0x10000000,
			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE,
		},
		/* MemRegion: f0000000-f01fffff : 0000:07:00.0 */
		{
			.phys_start = 0xf0000000,
			.virt_start = 0xf0000000,
			.size = 0x200000,
			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE,
		},
		/* MemRegion: fe200000-fe2fdfff : xhci-hcd */
		{
			.phys_start = 0xfe200000,
			.virt_start = 0xfe200000,
			.size = 0xfe000,
			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE,
		},
		/* MemRegion: fe2ff000-fe2fffff : xhci-hcd */
		{
			.phys_start = 0xfe2ff000,
			.virt_start = 0xfe2ff000,
			.size = 0x1000,
			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE,
		},
		/* MemRegion: fe300000-fe3fffff : ccp */
		{
			.phys_start = 0xfe300000,
			.virt_start = 0xfe300000,
			.size = 0x100000,
			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE,
		},
		/* MemRegion: fe401000-fe401fff : ccp */
		{
			.phys_start = 0xfe401000,
			.virt_start = 0xfe401000,
			.size = 0x1000,
			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE,
		},
		/* MemRegion: fe501000-fe503fff : 0000:04:00.0 */
		{
			.phys_start = 0xfe501000,
			.virt_start = 0xfe501000,
			.size = 0x3000,
			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE,
		},
		/* MemRegion: fe504000-fe504fff : r8169 */
		{
			.phys_start = 0xfe504000,
			.virt_start = 0xfe504000,
			.size = 0x1000,
			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE,
		},
		/* MemRegion: fe600000-fe67ffff : 0000:02:00.1 */
		{
			.phys_start = 0xfe600000,
			.virt_start = 0xfe600000,
			.size = 0x80000,
			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE,
		},
		/* MemRegion: fe680000-fe69ffff : ahci */
		{
			.phys_start = 0xfe680000,
			.virt_start = 0xfe680000,
			.size = 0x20000,
			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE,
		},
		/* MemRegion: fe6a0000-fe6a1fff : xhci-hcd */
		{
			.phys_start = 0xfe6a0000,
			.virt_start = 0xfe6a0000,
			.size = 0x2000,
			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE,
		},
		/* MemRegion: fe6a3000-fe6a7fff : xhci-hcd */
		{
			.phys_start = 0xfe6a3000,
			.virt_start = 0xfe6a3000,
			.size = 0x5000,
			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE,
		},
		/* MemRegion: fe700000-fe707fff : ICH HD audio */
		{
			.phys_start = 0xfe700000,
			.virt_start = 0xfe700000,
			.size = 0x8000,
			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE,
		},
		/* MemRegion: fe708000-fe708fff : ahci */
		{
			.phys_start = 0xfe708000,
			.virt_start = 0xfe708000,
			.size = 0x1000,
			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE,
		},
		/* MemRegion: fe800000-fe83ffff : 0000:07:00.0 */
		{
			.phys_start = 0xfe800000,
			.virt_start = 0xfe800000,
			.size = 0x40000,
			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE,
		},
		/* MemRegion: fe860000-fe863fff : ICH HD audio */
		{
			.phys_start = 0xfe860000,
			.virt_start = 0xfe860000,
			.size = 0x4000,
			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE,
		},
		/* MemRegion: fe900000-fe901fff : nvme */
		{
			.phys_start = 0xfe900000,
			.virt_start = 0xfe900000,
			.size = 0x2000,
			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE,
		},
		/* MemRegion: fe903000-fe903fff : nvme */
		{
			.phys_start = 0xfe903000,
			.virt_start = 0xfe903000,
			.size = 0x1000,
			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE,
		},
		/* MemRegion: fe904000-fe904fff : nvme */
		{
			.phys_start = 0xfe904000,
			.virt_start = 0xfe904000,
			.size = 0x1000,
			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE,
		},
		/* MemRegion: fe905000-fe905fff : nvme */
		{
			.phys_start = 0xfe905000,
			.virt_start = 0xfe905000,
			.size = 0x1000,
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
		/* MemRegion: fed80000-fed8ffff : reserved but accessed */
		{
			.phys_start = 0xfed80000,
			.virt_start = 0xfed80000,
			.size = 0x1000, //only to fed80fff enough for fed802b0 which is the error's address
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
		/* MemRegion: 000c0000-000dffff : ROMs */
		{
			.phys_start = 0xc0000,
			.virt_start = 0xc0000,
			.size = 0x20000,
			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE,
		},
		
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
		/* Port I/O: 0020-0021 : pic1 */
		 PIO_RANGE(0x20, 0x2), 
		/* Port I/O: 0040-0043 : timer0 */
		PIO_RANGE(0x40, 0x4),
		/* Port I/O: 0060-0060 : keyboard */
		PIO_RANGE(0x60, 0x1),
		/* Port I/O: 0061-0061 : PNP0800:00 */
		PIO_RANGE(0x61, 0x1),
		/* Port I/O: 0064-0064 : keyboard */
		PIO_RANGE(0x64, 0x1),
		/* Port I/O: 0070-0071 : rtc0 */
		PIO_RANGE(0x70, 0x2),
		/* Port I/O: 00a0-00a1 : pic2 */
		 PIO_RANGE(0xa0, 0x2), 
		/* Port I/O: 03f8-03ff : serial */
		PIO_RANGE(0x3f8, 0x8),
		/* Port I/O: 0800-0803 : ACPI PM1a_EVT_BLK */
		 PIO_RANGE(0x800, 0x4), 
		/* Port I/O: 0810-0815 : ACPI CPU throttle */
		 PIO_RANGE(0x810, 0x6), 
		/* Port I/O: 0820-0827 : ACPI GPE0_BLK */
		 PIO_RANGE(0x820, 0x8), 
		/* Port I/O: e000-e0ff : 0000:07:00.0 */
		PIO_RANGE(0xe000, 0x100),
		/* Port I/O: f000-f0ff : 0000:04:00.0 */
		PIO_RANGE(0xf000, 0x100),
		
		//pio range for invalid pio read, port 414 size 1
		PIO_RANGE(0x414, 0x1),
		
		PIO_RANGE(0xb2, 0x2),
		
		//serial 2
		PIO_RANGE(0x2f8, 0x8),
		
		
	},

	.pci_devices = {
			/* IVSHMEM: - net guest1*/
		{
			.type = JAILHOUSE_PCI_TYPE_IVSHMEM,
			.domain = 0x0,
			.bdf = (0x0f << 3),
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
		/* PCIDevice: 00:01.1 */
		{
			.type = JAILHOUSE_PCI_TYPE_BRIDGE,
			.iommu = 0,
			.domain = 0x0,
			.bdf = 0x9,
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
				0xffffc000, 0xffffffff, 0xfffff000,
				0xfffff000, 0x00000000, 0x00000000,
			},
			.caps_start = 20,
			.num_caps = 11,
			.num_msi_vectors = 32,
			.msi_64bits = 1,
			.msi_maskable = 1,
			.num_msix_vectors = 33,
			.msix_region_size = 0x1000,
			.msix_address = 0xfe902000,
		},
		/* PCIDevice: 02:00.0 */
		{
			.type = JAILHOUSE_PCI_TYPE_DEVICE,
			.iommu = 0,
			.domain = 0x0,
			.bdf = 0x200,
			.bar_mask = {
				0xffff8000, 0xffffffff, 0x00000000,
				0x00000000, 0x00000000, 0x00000000,
			},
			.caps_start = 31,
			.num_caps = 8,
			.num_msi_vectors = 8,
			.msi_64bits = 1,
			.msi_maskable = 0,
			.num_msix_vectors = 8,
			.msix_region_size = 0x1000,
			.msix_address = 0xfe6a2000,
		},
		/* PCIDevice: 02:00.1 */
		{
			.type = JAILHOUSE_PCI_TYPE_DEVICE,
			.iommu = 0,
			.domain = 0x0,
			.bdf = 0x201,
			.bar_mask = {
				0x00000000, 0x00000000, 0x00000000,
				0x00000000, 0x00000000, 0xfffe0000,
			},
			.caps_start = 39,
			.num_caps = 4,
			.num_msi_vectors = 1,
			.msi_64bits = 1,
			.msi_maskable = 0,
			.num_msix_vectors = 0,
			.msix_region_size = 0x0,
			.msix_address = 0x0,
		},
		/* PCIDevice: 02:00.2 */
		{
			.type = JAILHOUSE_PCI_TYPE_BRIDGE,
			.iommu = 0,
			.domain = 0x0,
			.bdf = 0x202,
			.bar_mask = {
				0x00000000, 0x00000000, 0x00000000,
				0x00000000, 0x00000000, 0x00000000,
			},
			.caps_start = 43,
			.num_caps = 5,
			.num_msi_vectors = 1,
			.msi_64bits = 1,
			.msi_maskable = 0,
			.num_msix_vectors = 0,
			.msix_region_size = 0x0,
			.msix_address = 0x0,
		},
		/* PCIDevice: 03:00.0 */
		{
			.type = JAILHOUSE_PCI_TYPE_BRIDGE,
			.iommu = 0,
			.domain = 0x0,
			.bdf = 0x300,
			.bar_mask = {
				0x00000000, 0x00000000, 0x00000000,
				0x00000000, 0x00000000, 0x00000000,
			},
			.caps_start = 48,
			.num_caps = 7,
			.num_msi_vectors = 1,
			.msi_64bits = 1,
			.msi_maskable = 0,
			.num_msix_vectors = 0,
			.msix_region_size = 0x0,
			.msix_address = 0x0,
		},
		/* PCIDevice: 03:01.0 */
		{
			.type = JAILHOUSE_PCI_TYPE_BRIDGE,
			.iommu = 0,
			.domain = 0x0,
			.bdf = 0x308,
			.bar_mask = {
				0x00000000, 0x00000000, 0x00000000,
				0x00000000, 0x00000000, 0x00000000,
			},
			.caps_start = 48,
			.num_caps = 7,
			.num_msi_vectors = 1,
			.msi_64bits = 1,
			.msi_maskable = 0,
			.num_msix_vectors = 0,
			.msix_region_size = 0x0,
			.msix_address = 0x0,
		},
		/* PCIDevice: 03:04.0 */
		{
			.type = JAILHOUSE_PCI_TYPE_BRIDGE,
			.iommu = 0,
			.domain = 0x0,
			.bdf = 0x320,
			.bar_mask = {
				0x00000000, 0x00000000, 0x00000000,
				0x00000000, 0x00000000, 0x00000000,
			},
			.caps_start = 48,
			.num_caps = 7,
			.num_msi_vectors = 1,
			.msi_64bits = 1,
			.msi_maskable = 0,
			.num_msix_vectors = 0,
			.msix_region_size = 0x0,
			.msix_address = 0x0,
		},
		/* PCIDevice: 04:00.0 */
		{
			.type = JAILHOUSE_PCI_TYPE_DEVICE,
			.iommu = 0,
			.domain = 0x0,
			.bdf = 0x400,
			.bar_mask = {
				0xffffff00, 0x00000000, 0xfffff000,
				0xffffffff, 0xffffc000, 0xffffffff,
			},
			.caps_start = 55,
			.num_caps = 9,
			.num_msi_vectors = 1,
			.msi_64bits = 1,
			.msi_maskable = 0,
			.num_msix_vectors = 4,
			.msix_region_size = 0x1000,
			.msix_address = 0xfe500000,
		},
		/* PCIDevice: 07:00.0 */
		{
			.type = JAILHOUSE_PCI_TYPE_DEVICE,
			.iommu = 0,
			.domain = 0x0,
			.bdf = 0x700,
			.bar_mask = {
				0xf0000000, 0xffffffff, 0xffe00000,
				0xffffffff, 0xffffff00, 0xfffc0000,
			},
			.caps_start = 64,
			.num_caps = 14,
			.num_msi_vectors = 1,
			.msi_64bits = 1,
			.msi_maskable = 0,
			.num_msix_vectors = 0,
			.msix_region_size = 0x0,
			.msix_address = 0x0,
		},
		/* PCIDevice: 07:00.1 */
		{
			.type = JAILHOUSE_PCI_TYPE_DEVICE,
			.iommu = 0,
			.domain = 0x0,
			.bdf = 0x701,
			.bar_mask = {
				0xffffc000, 0xffffffff, 0x00000000,
				0x00000000, 0x00000000, 0x00000000,
			},
			.caps_start = 78,
			.num_caps = 7,
			.num_msi_vectors = 1,
			.msi_64bits = 1,
			.msi_maskable = 0,
			.num_msix_vectors = 0,
			.msix_region_size = 0x0,
			.msix_address = 0x0,
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
			.caps_start = 85,
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
				0x00000000, 0x00000000, 0xfff00000,
				0x00000000, 0x00000000, 0xffffe000,
			},
			.caps_start = 92,
			.num_caps = 8,
			.num_msi_vectors = 2,
			.msi_64bits = 1,
			.msi_maskable = 0,
			.num_msix_vectors = 2,
			.msix_region_size = 0x1000,
			.msix_address = 0xfe400000,
		},
		/* PCIDevice: 08:00.3 */
		{
			.type = JAILHOUSE_PCI_TYPE_DEVICE,
			.iommu = 0,
			.domain = 0x0,
			.bdf = 0x803,
			.bar_mask = {
				0xfff00000, 0xffffffff, 0x00000000,
				0x00000000, 0x00000000, 0x00000000,
			},
			.caps_start = 92,
			.num_caps = 8,
			.num_msi_vectors = 8,
			.msi_64bits = 1,
			.msi_maskable = 0,
			.num_msix_vectors = 8,
			.msix_region_size = 0x1000,
			.msix_address = 0xfe2fe000,
		},
		/* PCIDevice: 09:00.0 */
		{
			.type = JAILHOUSE_PCI_TYPE_DEVICE,
			.iommu = 0,
			.domain = 0x0,
			.bdf = 0x900,
			.bar_mask = {
				0x00000000, 0x00000000, 0x00000000,
				0x00000000, 0x00000000, 0x00000000,
			},
			.caps_start = 85,
			.num_caps = 7,
			.num_msi_vectors = 0,
			.msi_64bits = 0,
			.msi_maskable = 0,
			.num_msix_vectors = 0,
			.msix_region_size = 0x0,
			.msix_address = 0x0,
		},
		/* PCIDevice: 09:00.2 */
		{
			.type = JAILHOUSE_PCI_TYPE_DEVICE,
			.iommu = 0,
			.domain = 0x0,
			.bdf = 0x902,
			.bar_mask = {
				0x00000000, 0x00000000, 0x00000000,
				0x00000000, 0x00000000, 0xfffff000,
			},
			.caps_start = 100,
			.num_caps = 8,
			.num_msi_vectors = 16,
			.msi_64bits = 1,
			.msi_maskable = 0,
			.num_msix_vectors = 0,
			.msix_region_size = 0x0,
			.msix_address = 0x0,
		},
		/* PCIDevice: 09:00.3 */
		{
			.type = JAILHOUSE_PCI_TYPE_DEVICE,
			.iommu = 0,
			.domain = 0x0,
			.bdf = 0x903,
			.bar_mask = {
				0xffff8000, 0x00000000, 0x00000000,
				0x00000000, 0x00000000, 0x00000000,
			},
			.caps_start = 108,
			.num_caps = 8,
			.num_msi_vectors = 1,
			.msi_64bits = 1,
			.msi_maskable = 0,
			.num_msix_vectors = 0,
			.msix_region_size = 0x0,
			.msix_address = 0x0,
		},
	},

	.pci_caps = {
		/* PCIDevice: 00:01.1 */
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
			.id = PCI_CAP_ID_PM,
			.start = 0x80,
			.len = 0x8,
			.flags = JAILHOUSE_PCICAPS_WRITE,
		},
		{
			.id = PCI_CAP_ID_MSI,
			.start = 0x90,
			.len = 0x18,
			.flags = JAILHOUSE_PCICAPS_WRITE,
		},
		{
			.id = PCI_CAP_ID_MSIX,
			.start = 0xb0,
			.len = 0xc,
			.flags = JAILHOUSE_PCICAPS_WRITE,
		},
		{
			.id = PCI_CAP_ID_EXP,
			.start = 0xc0,
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
			.id = PCI_EXT_CAP_ID_DSN | JAILHOUSE_PCI_EXT_CAP,
			.start = 0x150,
			.len = 0xc,
			.flags = 0,
		},
		{
			.id = PCI_EXT_CAP_ID_PWR | JAILHOUSE_PCI_EXT_CAP,
			.start = 0x160,
			.len = 0x10,
			.flags = 0,
		},
		{
			.id = PCI_EXT_CAP_ID_LTR | JAILHOUSE_PCI_EXT_CAP,
			.start = 0x1b8,
			.len = 0x8,
			.flags = 0,
		},
		{
			.id = PCI_EXT_CAP_ID_SECPCI | JAILHOUSE_PCI_EXT_CAP,
			.start = 0x300,
			.len = 0x10,
			.flags = 0,
		},
		{
			.id = PCI_EXT_CAP_ID_VNDR | JAILHOUSE_PCI_EXT_CAP,
			.start = 0x400,
			.len = 0x14,
			.flags = 0,
		},
		{
			.id = PCI_EXT_CAP_ID_L1SS | JAILHOUSE_PCI_EXT_CAP,
			.start = 0x900,
			.len = 0x4,
			.flags = 0,
		},
		/* PCIDevice: 02:00.0 */
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
		/* PCIDevice: 02:00.1 */
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
		/* PCIDevice: 02:00.2 */
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
		/* PCIDevice: 03:00.0 */
		/* PCIDevice: 03:01.0 */
		/* PCIDevice: 03:04.0 */
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
		/* PCIDevice: 04:00.0 */
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
		/* PCIDevice: 07:00.0 */
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
		/* PCIDevice: 07:00.1 */
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
		/* PCIDevice: 08:00.0 */
		/* PCIDevice: 09:00.0 */
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
		/* PCIDevice: 08:00.2 */
		/* PCIDevice: 08:00.3 */
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
		/* PCIDevice: 09:00.2 */
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
		/* PCIDevice: 09:00.3 */
		{
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
			.len = 0x8,
			.flags = JAILHOUSE_PCICAPS_WRITE,
		},
	},
};

------=_Part_24858_1555442018.1704904818182
Content-Type: text/x-csrc; charset=US-ASCII; name=linux_guest1.c
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename=linux_guest1.c
X-Attachment-Id: eb249962-6573-46a2-adc5-b7ddd20a7cda
Content-ID: <eb249962-6573-46a2-adc5-b7ddd20a7cda>

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
		.name = "linux-1",
		.flags = JAILHOUSE_CELL_PASSIVE_COMMREG |
			 JAILHOUSE_CELL_VIRTUAL_CONSOLE_ACTIVE,

		.cpu_set_size = sizeof(config.cpus),
		.num_memory_regions = ARRAY_SIZE(config.mem_regions),
		.num_pci_devices = ARRAY_SIZE(config.pci_devices),
		.num_pio_regions = ARRAY_SIZE(config.pio_regions),
		.num_irqchips = 0,
		
		.console = {
			.type = JAILHOUSE_CON_TYPE_8250,
			.flags = JAILHOUSE_CON_ACCESS_PIO,
			.address = 0x3f8,
		},
	},
	 	
	.cpus = {
		0b110000,
	},


	.mem_regions = {
		/* IVSHMEM shared memory regions (networking) */
		//JAILHOUSE_SHMEM_NET_REGIONS(0x61f00000, 1),
		/* low RAM */ 
		{
			.phys_start = 0x42000000,
			.virt_start = 0,
			.size = 0x00100000,
			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
				JAILHOUSE_MEM_EXECUTE |
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
			.phys_start = 0x42100000,   
			.virt_start = 0x00101000,
			.size = 0x8000000,
			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
				JAILHOUSE_MEM_EXECUTE |
				JAILHOUSE_MEM_LOADABLE,
		},
		
	},
		

		.pio_regions = {
			 /*Port I/O: serial 1 */
			 PIO_RANGE(0x3f8, 0x8),
		},
	
	
		/*.pci_devices = {
			IVSHMEM: 00:0f.0 - net guest1
		{
			.type = JAILHOUSE_PCI_TYPE_IVSHMEM,
			.domain = 0x0,
			.bdf = (0x0f << 3),
			.bar_mask = JAILHOUSE_IVSHMEM_BAR_MASK_MSIX,
			.num_msix_vectors = 2,
			.shmem_regions_start = 0,
			.shmem_dev_id = 1, 
			.shmem_peers = 2,
			.shmem_protocol = JAILHOUSE_SHMEM_PROTO_VETH,
		},
	},*/
		};

------=_Part_24858_1555442018.1704904818182--
