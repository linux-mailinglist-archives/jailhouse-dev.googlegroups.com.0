Return-Path: <jailhouse-dev+bncBDIJ36FET4JRBK6L76WAMGQEJ2K3QII@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-yb1-xb39.google.com (mail-yb1-xb39.google.com [IPv6:2607:f8b0:4864:20::b39])
	by mail.lfdr.de (Postfix) with ESMTPS id 40ED382AF06
	for <lists+jailhouse-dev@lfdr.de>; Thu, 11 Jan 2024 13:57:17 +0100 (CET)
Received: by mail-yb1-xb39.google.com with SMTP id 3f1490d57ef6-dbedaa77289sf6101301276.0
        for <lists+jailhouse-dev@lfdr.de>; Thu, 11 Jan 2024 04:57:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20230601; t=1704977836; x=1705582636; darn=lfdr.de;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:x-original-sender:mime-version
         :subject:references:in-reply-to:message-id:to:from:date:sender:from
         :to:cc:subject:date:message-id:reply-to;
        bh=/Pk2F+Sit3t8qWkKHXB3aqbXm41UNCofTW/O1h5Y0vE=;
        b=hKABfXUaAOIAVmtQW9YtkOO9EyQsWknVt6dQy7Dn7u7kBxVFyhwSjsDi8bycR/7NvY
         VgV3xzENQOlG5ZZT6BK+Vg0h/TB8qXOOiKtyZ0rG7SFhIx4cxeIPwhb1AyT6dUm3lis+
         Mjbak/tgGAIfm58MMy4NpOJUYfvf6IhDIVIi0ThL5uhsRkW8n/UxSt34ARBnYCv/Wben
         i3MIulyNVBxdbOAr9Kp2IDu4nFFGZmT63nr9ELTvw04HouYvebXXqFrzQrs/HsQxvxJC
         oeiv0X3SB3IdGxK0Mnk6sgLgrnjdHBLPfHrHZaAEazdR88yzNXCE2mxI5ByVKNxwbF1L
         Ghmw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1704977836; x=1705582636; darn=lfdr.de;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:x-original-sender:mime-version
         :subject:references:in-reply-to:message-id:to:from:date:from:to:cc
         :subject:date:message-id:reply-to;
        bh=/Pk2F+Sit3t8qWkKHXB3aqbXm41UNCofTW/O1h5Y0vE=;
        b=G8hNe/esfFF/iN8WL6KYKuCMNWiabY6UFR/arGICvbjYjutRTM6QwAgekNGn1kFDCY
         1QX3IHts9J15c42XocZY+hz9912oD7apR12gLlSj4tjpTjHpZa0V1xyv4Q09diLMaC3E
         QARup9gCdMnO8QuQxLtW4vEBp9o+YEzTk+KSkv3MVJQpNlNljt7pZFhua29JBmQnY11E
         PGviYeECz4Q12a/5yP38Umj+etGwfUmWBCAEHqbLap221zhZDgo9xR1/q++mniQ4kr68
         TEQj8V+C8ur76OvHw+JjZyd4J/5kfZyXKjJljclJrbMg/5L3QYN31Km7Dw9D0kuC2umJ
         k8Fg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1704977836; x=1705582636;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :x-spam-checked-in-group:list-id:mailing-list:precedence
         :x-original-sender:mime-version:subject:references:in-reply-to
         :message-id:to:from:date:x-beenthere:x-gm-message-state:sender:from
         :to:cc:subject:date:message-id:reply-to;
        bh=/Pk2F+Sit3t8qWkKHXB3aqbXm41UNCofTW/O1h5Y0vE=;
        b=vJhqyZkrFTSl1UMJu8FeUP/P/0W3PNCcKm5IMW7h3pcFFr0f9yR2Oo761I1T1Nm/mr
         Z77bfOJNHr9LIt3CMZT3AkbrX26jUjKDVaLRCAQG9NF21XGOczvAbNqN4VQQ0AX1O+6E
         JPMRknFVjObJn3LQw+6TMpmzdr5MqOeyKu2Zkwry9BqQKjnhoEReFLWkO5G6t6zg9kli
         NugbrTDDZH3zcSXWl0+6GIZ2jtA7FEMGPjuGXqib5OW308qKuR9nvR1wLffTHvraa4Dx
         /qNNVcyYtPtYl9rUZHj5cK1+ddBpdkahGFASxBvlXl8KiqrNoG//Ac5UT5hFj3Khkp14
         JpYw==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AOJu0YxHcqhhRLWeJZklWInSfIAER29xekSAKfpdKT63n1wly4jUJL43
	c2xryep80dGHllJDJeHYU/g=
X-Google-Smtp-Source: AGHT+IERBHOcS4xbMAbL8FTcgxwD619JuKHOnsrrI2MlVNTJFgFgcK0/8gl7tAbRJDn2jFmnRm5dtQ==
X-Received: by 2002:a25:6b06:0:b0:dbe:d45a:85d7 with SMTP id g6-20020a256b06000000b00dbed45a85d7mr376456ybc.19.1704977836038;
        Thu, 11 Jan 2024 04:57:16 -0800 (PST)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a25:df0a:0:b0:dbd:728a:87b4 with SMTP id w10-20020a25df0a000000b00dbd728a87b4ls261619ybg.1.-pod-prod-00-us;
 Thu, 11 Jan 2024 04:57:14 -0800 (PST)
X-Received: by 2002:a81:410f:0:b0:5f7:49b7:a57d with SMTP id o15-20020a81410f000000b005f749b7a57dmr117798ywa.1.1704977834340;
        Thu, 11 Jan 2024 04:57:14 -0800 (PST)
Date: Thu, 11 Jan 2024 04:57:13 -0800 (PST)
From: =?UTF-8?Q?Michele_Pescap=C3=A8?= <mic.pescape@gmail.com>
To: Jailhouse <jailhouse-dev@googlegroups.com>
Message-Id: <23a9c30e-5507-449e-9589-697904becac4n@googlegroups.com>
In-Reply-To: <e4aef5c1-45fa-49f2-8b6c-04f36d7f556d@oth-regensburg.de>
References: <824bacc4-b7ae-47c9-878e-7203214b4fc3n@googlegroups.com>
 <d36e18a4-dd64-4f9c-b2cf-89b02b1a0469@oth-regensburg.de>
 <c9dad4f3-f856-4f25-b6ad-41ec63cf2c64n@googlegroups.com>
 <219b013e-4970-4bb3-969f-bb0d7bae3ab7n@googlegroups.com>
 <2202bf30-5b2c-45ea-9f9f-699daf338843n@googlegroups.com>
 <0431cb6c-c2ca-4417-97d4-f0dc9bc3f389@oth-regensburg.de>
 <9a021e3f-caca-4ebe-9351-be2c3e999446n@googlegroups.com>
 <e4aef5c1-45fa-49f2-8b6c-04f36d7f556d@oth-regensburg.de>
Subject: Re: Unable to start non root linux cell
MIME-Version: 1.0
Content-Type: multipart/mixed; 
	boundary="----=_Part_22222_1784686487.1704977833448"
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

------=_Part_22222_1784686487.1704977833448
Content-Type: multipart/alternative; 
	boundary="----=_Part_22223_1355847812.1704977833448"

------=_Part_22223_1355847812.1704977833448
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi,

after changing the virt_start to match the phys_start for that memory=20
region I got an invalid argument error when starting the cell

Traceback (most recent call last):
  File "/usr/local/libexec/jailhouse/jailhouse-cell-linux", line 739, in=20
<module>
    cell.load(arch.kernel_image, arch.kernel_address())
  File "/usr/local/lib/python3.10/dist-packages/pyjailhouse/cell.py", line=
=20
44, in load
    fcntl.ioctl(self.dev, self.JAILHOUSE_CELL_LOAD, load)
OSError: [Errno 22] Invalid argument

Printing the arch.kernel_address() returned 16760320 (should be 0xffbe00),=
=20
so I thought that the bzImage was too big for the low ram region.
I increased the size to .size =3D 0x04000000 and shifted the virt and=20
phys_start of the other two regions to match the change (virt_start =3D=20
0x04000000 for the comm region and virt=3Dphys_start =3D 0x46000000 for the=
=20
third region) .=20
No issues were reported by config check but after starting the cell i got=
=20
no output even using earlyprintk.

I also tried using an initrd but I got a similar issue, invalid argument=20
when starting the cell, this time it was the arch.ramdisk_address() which=
=20
was 107327488 (0x665b000).=20
So i tried increasing even more the size of the first region to size =3D=20
0x0a000000 (comm region now starts at .virt_start =3D 0x0a000000, and the=
=20
third region starts at  virt=3D.phys_start =3D 0x4c000000 with size =3D=20
0x6000000).=20
Again, no config check issues so I started it but no output again, the=20
hypervisor only reports:

Created cell "linux-1"
Page pool usage after cell creation: mem 268/32211, remap 16392/131072
Cell "linux-1" can be loaded
CPU 5 received SIPI, vector 100
CPU 4 received SIPI, vector 100
Started cell "linux-1"

My bzImage is 12,9MB and the rootfs.cpio is 23.1MB if that matters.

Thanks,
Michele



Il giorno mercoled=C3=AC 10 gennaio 2024 alle 20:58:03 UTC+1 Ralf Ramsauer =
ha=20
scritto:

> Hi Michele,
>
> On 10/01/2024 17:40, Michele Pescap=C3=A8 wrote:
> > Hi,
> >=20
> > I'm attaching the configurations I'm currently using. I'll try disablin=
g=20
> > KASLR.
>
> [=E2=80=A6]
> /* high RAM */
> {
> .phys_start =3D 0x42100000,
> .virt_start =3D 0x00101000,
> .size =3D 0x8000000,
> [=E2=80=A6]
>
> Alignment of your high ram is odd. Virt & Phys should have the same=20
> alignment. Try to use .phys=3D.virt=3D0x42100000, I guess that should hel=
p.
>
> Thanks,
> Ralf
>
>
> >=20
> > Thank you for your help,
> > Michele
> >=20
> > Il giorno mercoled=C3=AC 10 gennaio 2024 alle 17:24:35 UTC+1 Ralf Ramsa=
uer ha=20
> > scritto:
> >=20
> > Hi,
> >=20
> > On 09/01/2024 19:58, Michele Pescap=C3=A8 wrote:
> > > Hi,
> > >
> > > Just an update, I was able to get the following output by adding -c
> > > "earlyprintk=3DttyS0,115200" to the command line:
> > >
> > > Started cell "linux-1"
> > >
> > >
> > > Invalid physical address chosen!
> >=20
> > could you please share your system and non-root cell configuration?
> >=20
> > It smells like you have an overlap with the communication region. You
> > can check that with tools/jailhouse-config-check.
> >=20
> > >
> > >
> > >
> > >
> > > Physical KASLR disabled: no suitable memory region!
> >=20
> > Disable KASLR in your kernel for the moment. You don't need it while
> > ramping up your system.
> >=20
> > Thanks,
> > Ralf
> >=20
> > >
> > > [    0.000000] Linux version 6.2.0-rc3 (root@mp-LINUX-DESKTOP)
> > > (x86_64-buildroot-linux-gnu-gcc.br_real (Buildroot 2023.11)
> > 12.3.0, GNU
> > > ld (GNU Binutils) 2.40) #2 SMP PREEMPT_DYNAMIC Sun Jan  7
> > 18:35:23 CET 2024
> > > [    0.000000] Command line: earlyprintk=3DttyS0,115200
> > > [    0.000000] KERNEL supported cpus:
> > > [    0.000000]   Intel GenuineIntel
> > > [    0.000000]   AMD AuthenticAMD
> > > [    0.000000] x86/fpu: Supporting XSAVE feature 0x001: 'x87
> > floating
> > > point registers'
> > > [    0.000000] x86/fpu: Supporting XSAVE feature 0x002: 'SSE
> > registers'
> > > [    0.000000] x86/fpu: Supporting XSAVE feature 0x004: 'AVX
> > registers'
> > > [    0.000000] x86/fpu: xstate_offset[2]:  576, xstate_sizes[2]:
> >  256
> > > [    0.000000] x86/fpu: Enabled xstate features 0x7, context size
> > is 832
> > > bytes, using 'compacted' format.
> > > [    0.000000] signal: max sigframe size: 1776
> > > [    0.000000] BIOS-provided physical RAM map:
> > > [    0.000000] BIOS-e801: [mem
> > 0x0000000000000000-0x000000000009efff] usable
> > > [    0.000000] printk: bootconsole [earlyser0] enabled
> > > [    0.000000] NX (Execute Disable) protection: active
> > > [    0.000000] extended physical RAM map:
> > > [    0.000000] reserve setup_data: [mem
> > > 0x0000000000000000-0x0000000000001fff] usable
> > > [    0.000000] reserve setup_data: [mem
> > > 0x0000000000002000-0x000000000000212b] usable
> > > [    0.000000] reserve setup_data: [mem
> > > 0x000000000000212c-0x000000000009efff] usable
> > > [    0.000000] DMI not present or invalid.
> > > [    0.000000] Hypervisor detected: Jailhouse
> > > [    0.000000] tsc: Detected 3393.624 MHz processor
> > > [    0.000019] .text .data .bss are not marked as E820_TYPE_RAM!
> > > [    0.005751] last_pfn =3D 0x3630 max_arch_pfn =3D 0x400000000
> > > [    0.011039] x86/PAT: Configuration [0-7]: WB  WC  UC- UC  WB
> >  WP  UC- WT
> > > Memory KASLR using RDRAND RDTSC...
> > > [    0.032374] Using GB pages for direct mapping
> > > [    0.036743] Kernel panic - not syncing: alloc_low_pages: can not
> > > alloc memory
> > > [    0.043712] CPU: 0 PID: 0 Comm: swapper Not tainted 6.2.0-rc3 #2
> > > [    0.049702] Call Trace:
> > > [    0.052134]  <TASK>
> > > [    0.054219]  dump_stack_lvl+0x3a/0x58
> > > [    0.057865]  dump_stack+0x10/0x18
> > > [    0.061162]  panic+0x15c/0x308
> > > [    0.064205]  alloc_low_pages+0x7d/0x1c0
> > > [    0.068024]  phys_pmd_init+0x1f2/0x2eb
> > > [    0.071758]  phys_pud_init+0x114/0x2d5
> > > [    0.075493]  phys_p4d_init+0x4c/0x269
> > > [    0.079135]  ?
> > __raw_callee_save___native_queued_spin_unlock+0x15/0x30
> > > [    0.085649]  __kernel_physical_mapping_init+0x11e/0x29a
> > > [    0.090859]  kernel_physical_mapping_init+0xf/0x20
> > > [    0.095631]  init_memory_mapping+0x273/0x410
> > > [    0.099890]  init_range_memory_mapping+0xec/0x150
> > > [    0.104574]  init_mem_mapping+0x268/0x2e7
> > > [    0.108567]  setup_arch+0x839/0xdcf
> > > [    0.112039]  ? lockdown_lsm_init+0x21/0x2f
> > > [    0.116120]  start_kernel+0x6e/0x997
> > > [    0.119680]  x86_64_start_reservations+0x24/0x2c
> > > [    0.124281]  x86_64_start_kernel+0xec/0xff
> > > [    0.128360]  secondary_startup_64_no_verify+0xe5/0xeb
> > > [    0.133400]  </TASK>
> > > [    0.135570] ---[ end Kernel panic - not syncing:
> > alloc_low_pages: can
> > > not alloc memory ]---
> > > Closing cell "linux-1"
> > > Page pool usage after cell destruction: mem 254/32211, remap
> > 16392/131072
> > > CPU 4 received SIPI, vector 96
> > > CPU 5 received SIPI, vector 96
> > >
> > > This happens both with and without the initrd in the command,
> > i'll try
> > > to solve this and see what happens.
> > >
> > > By the way, is it possible that the new cell starts transmitting
> > with a
> > > baud rate different than the root cell? Without specifying the
> > speed in
> > > the command above the serial console stopped receiving anything
> > until I
> > > disabled and re-enabled the hypervisor. If not I may have something
> > > wrong on my end to solve
> > >
> > > Il giorno marted=C3=AC 9 gennaio 2024 alle 17:37:48 UTC+1 Michele
> > Pescap=C3=A8 ha
> > > scritto:
> > >
> > > I stand corrected, the freeze happens when i do not set
> > > JAILHOUSE_CELL_PASSIVE_COMMREG in the inmate
> > >
> > > Il giorno marted=C3=AC 9 gennaio 2024 alle 17:26:57 UTC+1 Michele Pes=
cap=C3=A8
> > > ha scritto:
> > >
> > > Hi, thank you for replying.
> > >
> > > ttyS0 is indeed whitelisted in the inmate and the number of
> > > pio_regions is set accordingly.
> > >
> > > As for the crash after disable/shutdown, I think it was related
> > > to the PCI device, after commenting that and the corresponding
> > > regions out I no longer get that freeze. CONFIG_JAILHOUSE_GUEST and
> > > CONFIG_JAILHOUSE_DBCON were already set in the kernel
> > > configuration I'm using for the non root linux; still, I
> > > recompiled it just in case.
> > >
> > > Michele
> > >
> > > Il giorno marted=C3=AC 9 gennaio 2024 alle 14:14:33 UTC+1 Ralf
> > > Ramsauer ha scritto:
> > >
> > > Hi,
> > >
> > > On 08/01/2024 23:56, Michele Pescap=C3=A8 wrote:
> > > > Hi all,
> > > >
> > > > I have an AMD Ryzen 2600 on a b450 motherboard. My goal
> > > is to run two
> > > > non root linux cells, however, as of right now, I'm not
> > > able to start
> > > > any non root linux cells.
> > > > First of all I don't receive an output from the cell (I
> > > do get output
> > > > from the apic-demo though), therefore I don't really know
> > > if they're
> > > > even crashing or not; this is the output I get from the
> > > hypervisor after
> > > > enabling the root cell and issuing the following command:
> > > >
> > > > sudo jailhouse cell linux configs/x86/linux_guest1.cell
> > > > ../buildroot-2023.11/output/images/bzImage -i
> > > > ../buildroot-2023.11/output/images/rootfs.cpio
> > >
> > > for the first few tries, simply don't load a ramdisk. Try to
> > > get the
> > > kernel booting. It will crash with "cannot mount rootfs". If
> > > we get so
> > > far, then you can continue specifying the ramdisk. But
> > > first, we have to
> > > get that far.
> > >
> > > >
> > > > Adding PCI device ff:1f.7 to cell "linux-x86-demo"
> > > > Created cell "linux-x86-demo"
> > > > Page pool usage after cell creation: mem 336/32211, remap
> > > 16392/131072
> > > > Cell "linux-x86-demo" can be loaded
> > > > CPU 4 received SIPI, vector 100
> > > > CPU 3 received SIPI, vector 100
> > > > Started cell "linux-x86-demo"
> > > >
> > > > After this the cell appears to be running in cell list,
> > > however I can't
> > > > seem to get any output to confirm that (I even set
> > > > JAILHOUSE_CELL_VIRTUAL_CONSOLE_ACTIVE, but nothing
> > > appears on the vrtual
> > > > console accessed via "jailhouse console -f"). I also
> > > tried adding -c
> > > > "console=3DttyS0,115200".
> > >
> > > ttyS0, i.e., x86 Port 0x3f8 is whitelisted in the cell
> > > configuration?
> > > Actually, your cmdline is correct.
> > >
> > > > At this point if I try to disable/shutdown the cell, the
> > > system freezes
> > > > requiring a hard reset.
> > >
> > > Okay, is the guest Linux compiled with Jailhouse guest
> > > support? Please
> > > ensure that non-root Linux is compiled with
> > > CONFIG_JAILHOUSE_GUEST and
> > > CONFIG_JAILHOUSE_DBCON. The first one is mandatory for x86
> > > Linux guests.
> > >
> > > >
> > > > Also, there seems to be a mismatch between the PCI bdf
> > > value in the log
> > > > above and the one in the cell's configuration. In both
> > > root and non root
> > > > cells i set .bdf =3D (0x0f << 3) for the IVSHMEM net device
> > > and the Root
> > > > cell correctly reports that ("Adding virtual PCI device
> > > 00:0f.0 to cell
> > > > "RootCell"").
> > >
> > > First things first. Let's try to get Linux kicked off before
> > > diving into
> > > PCI. Comment it out for the moment, let's do that later.
> > >
> > > Ralf
> > >
> > > >
> > > > If I understood correctly, once the cell works properly I
> > > won't need to
> > > > set the console anymore as I can assign an ip (-c "ip
> > > x.x.x.x" in the
> > > > cell linux command) and ssh to the cell, right?
> > > >
> > > > I attach the root and non root cells' configurations in
> > > case they're
> > > > needed. I can provide both the root and non root cell's
> > > kernel .conf and
> > > > the buildroot configuration I used if needed.
> > > >
> > > > Thank you for your time,
> > > > Michele
> > > >
> > > > --
> > > > You received this message because you are subscribed to
> > > the Google
> > > > Groups "Jailhouse" group.
> > > > To unsubscribe from this group and stop receiving emails
> > > from it, send
> > > > an email to jailhouse-de...@googlegroups.com
> > > > <mailto:jailhouse-de...@googlegroups.com>.
> > > > To view this discussion on the web visit
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
> https://groups.google.com/d/msgid/jailhouse-dev/2202bf30-5b2c-45ea-9f9f-6=
99daf338843n%40googlegroups.com=20
> <
> https://groups.google.com/d/msgid/jailhouse-dev/2202bf30-5b2c-45ea-9f9f-6=
99daf338843n%40googlegroups.com>=20
> <
> https://groups.google.com/d/msgid/jailhouse-dev/2202bf30-5b2c-45ea-9f9f-6=
99daf338843n%40googlegroups.com?utm_medium=3Demail&utm_source=3Dfooter=20
> <
> https://groups.google.com/d/msgid/jailhouse-dev/2202bf30-5b2c-45ea-9f9f-6=
99daf338843n%40googlegroups.com?utm_medium=3Demail&utm_source=3Dfooter
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
> https://groups.google.com/d/msgid/jailhouse-dev/9a021e3f-caca-4ebe-9351-b=
e2c3e999446n%40googlegroups.com=20
> <
> https://groups.google.com/d/msgid/jailhouse-dev/9a021e3f-caca-4ebe-9351-b=
e2c3e999446n%40googlegroups.com?utm_medium=3Demail&utm_source=3Dfooter
> >.
>

--=20
You received this message because you are subscribed to the Google Groups "=
Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/=
jailhouse-dev/23a9c30e-5507-449e-9589-697904becac4n%40googlegroups.com.

------=_Part_22223_1355847812.1704977833448
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi,<br /><br />after changing the virt_start to match the phys_start for th=
at memory region I got an invalid argument error when starting the cell<br =
/><br />Traceback (most recent call last):<br />=C2=A0 File "/usr/local/lib=
exec/jailhouse/jailhouse-cell-linux", line 739, in &lt;module&gt;<br />=C2=
=A0 =C2=A0 cell.load(arch.kernel_image, arch.kernel_address())<br />=C2=A0 =
File "/usr/local/lib/python3.10/dist-packages/pyjailhouse/cell.py", line 44=
, in load<br />=C2=A0 =C2=A0 fcntl.ioctl(self.dev, self.JAILHOUSE_CELL_LOAD=
, load)<br />OSError: [Errno 22] Invalid argument<br /><br />Printing the a=
rch.kernel_address() returned 16760320 (should be 0xffbe00), so I thought t=
hat the bzImage was too big for the low ram region.<br /> I increased the s=
ize to .size =3D 0x04000000 and shifted the virt and phys_start of the othe=
r two regions to match the change (virt_start =3D 0x04000000 for the comm r=
egion and virt=3Dphys_start =3D 0x46000000 for the third region) . <br />No=
 issues were reported by config check but after starting the cell i got no =
output even using earlyprintk.<br /><br />I also tried using an initrd but =
I got a similar issue, invalid argument when starting the cell, this time i=
t was the arch.ramdisk_address() which was 107327488 (0x665b000). <br />So =
i tried increasing even more the size of the first region to size =3D 0x0a0=
00000 (comm region now starts at .virt_start =3D 0x0a000000, and the third =
region starts at=C2=A0 virt=3D.phys_start =3D 0x4c000000 with size =3D 0x60=
00000). <br />Again, no config check issues so I started it but no output a=
gain, the hypervisor only reports:<br /><br />Created cell "linux-1"<br />P=
age pool usage after cell creation: mem 268/32211, remap 16392/131072<br />=
Cell "linux-1" can be loaded<br />CPU 5 received SIPI, vector 100<br />CPU =
4 received SIPI, vector 100<br />Started cell "linux-1"<br /><br />My bzIma=
ge is 12,9MB and the rootfs.cpio is 23.1MB if that matters.<br /><br />Than=
ks,<br />Michele<br /><br /><br /><br /><div class=3D"gmail_quote"><div dir=
=3D"auto" class=3D"gmail_attr">Il giorno mercoled=C3=AC 10 gennaio 2024 all=
e 20:58:03 UTC+1 Ralf Ramsauer ha scritto:<br/></div><blockquote class=3D"g=
mail_quote" style=3D"margin: 0 0 0 0.8ex; border-left: 1px solid rgb(204, 2=
04, 204); padding-left: 1ex;">Hi Michele,
<br>
<br>On 10/01/2024 17:40, Michele Pescap=C3=A8 wrote:
<br>&gt; Hi,
<br>&gt;=20
<br>&gt; I&#39;m attaching the configurations I&#39;m currently using. I&#3=
9;ll try disabling=20
<br>&gt; KASLR.
<br>
<br>[=E2=80=A6]
<br>                 /* high RAM */
<br>                 {
<br>                         .phys_start =3D 0x42100000,
<br>                         .virt_start =3D 0x00101000,
<br>                         .size =3D 0x8000000,
<br>[=E2=80=A6]
<br>
<br>Alignment of your high ram is odd. Virt &amp; Phys should have the same=
=20
<br>alignment. Try to use .phys=3D.virt=3D0x42100000, I guess that should h=
elp.
<br>
<br>Thanks,
<br>   Ralf
<br>
<br>
<br>&gt;=20
<br>&gt; Thank you for your help,
<br>&gt; Michele
<br>&gt;=20
<br>&gt; Il giorno mercoled=C3=AC 10 gennaio 2024 alle 17:24:35 UTC+1 Ralf =
Ramsauer ha=20
<br>&gt; scritto:
<br>&gt;=20
<br>&gt;     Hi,
<br>&gt;=20
<br>&gt;     On 09/01/2024 19:58, Michele Pescap=C3=A8 wrote:
<br>&gt;      &gt; Hi,
<br>&gt;      &gt;
<br>&gt;      &gt; Just an update, I was able to get the following output b=
y adding -c
<br>&gt;      &gt; &quot;earlyprintk=3DttyS0,115200&quot; to the command li=
ne:
<br>&gt;      &gt;
<br>&gt;      &gt; Started cell &quot;linux-1&quot;
<br>&gt;      &gt;
<br>&gt;      &gt;
<br>&gt;      &gt; Invalid physical address chosen!
<br>&gt;=20
<br>&gt;     could you please share your system and non-root cell configura=
tion?
<br>&gt;=20
<br>&gt;     It smells like you have an overlap with the communication regi=
on. You
<br>&gt;     can check that with tools/jailhouse-config-check.
<br>&gt;=20
<br>&gt;      &gt;
<br>&gt;      &gt;
<br>&gt;      &gt;
<br>&gt;      &gt;
<br>&gt;      &gt; Physical KASLR disabled: no suitable memory region!
<br>&gt;=20
<br>&gt;     Disable KASLR in your kernel for the moment. You don&#39;t nee=
d it while
<br>&gt;     ramping up your system.
<br>&gt;=20
<br>&gt;     Thanks,
<br>&gt;     Ralf
<br>&gt;=20
<br>&gt;      &gt;
<br>&gt;      &gt; [ =C2=A0 =C2=A00.000000] Linux version 6.2.0-rc3 (root@m=
p-LINUX-DESKTOP)
<br>&gt;      &gt; (x86_64-buildroot-linux-gnu-gcc.br_real (Buildroot 2023.=
11)
<br>&gt;     12.3.0, GNU
<br>&gt;      &gt; ld (GNU Binutils) 2.40) #2 SMP PREEMPT_DYNAMIC Sun Jan =
=C2=A07
<br>&gt;     18:35:23 CET 2024
<br>&gt;      &gt; [ =C2=A0 =C2=A00.000000] Command line: earlyprintk=3Dtty=
S0,115200
<br>&gt;      &gt; [ =C2=A0 =C2=A00.000000] KERNEL supported cpus:
<br>&gt;      &gt; [ =C2=A0 =C2=A00.000000] =C2=A0 Intel GenuineIntel
<br>&gt;      &gt; [ =C2=A0 =C2=A00.000000] =C2=A0 AMD AuthenticAMD
<br>&gt;      &gt; [ =C2=A0 =C2=A00.000000] x86/fpu: Supporting XSAVE featu=
re 0x001: &#39;x87
<br>&gt;     floating
<br>&gt;      &gt; point registers&#39;
<br>&gt;      &gt; [ =C2=A0 =C2=A00.000000] x86/fpu: Supporting XSAVE featu=
re 0x002: &#39;SSE
<br>&gt;     registers&#39;
<br>&gt;      &gt; [ =C2=A0 =C2=A00.000000] x86/fpu: Supporting XSAVE featu=
re 0x004: &#39;AVX
<br>&gt;     registers&#39;
<br>&gt;      &gt; [ =C2=A0 =C2=A00.000000] x86/fpu: xstate_offset[2]: =C2=
=A0576, xstate_sizes[2]:
<br>&gt;      =C2=A0256
<br>&gt;      &gt; [ =C2=A0 =C2=A00.000000] x86/fpu: Enabled xstate feature=
s 0x7, context size
<br>&gt;     is 832
<br>&gt;      &gt; bytes, using &#39;compacted&#39; format.
<br>&gt;      &gt; [ =C2=A0 =C2=A00.000000] signal: max sigframe size: 1776
<br>&gt;      &gt; [ =C2=A0 =C2=A00.000000] BIOS-provided physical RAM map:
<br>&gt;      &gt; [ =C2=A0 =C2=A00.000000] BIOS-e801: [mem
<br>&gt;     0x0000000000000000-0x000000000009efff] usable
<br>&gt;      &gt; [ =C2=A0 =C2=A00.000000] printk: bootconsole [earlyser0]=
 enabled
<br>&gt;      &gt; [ =C2=A0 =C2=A00.000000] NX (Execute Disable) protection=
: active
<br>&gt;      &gt; [ =C2=A0 =C2=A00.000000] extended physical RAM map:
<br>&gt;      &gt; [ =C2=A0 =C2=A00.000000] reserve setup_data: [mem
<br>&gt;      &gt; 0x0000000000000000-0x0000000000001fff] usable
<br>&gt;      &gt; [ =C2=A0 =C2=A00.000000] reserve setup_data: [mem
<br>&gt;      &gt; 0x0000000000002000-0x000000000000212b] usable
<br>&gt;      &gt; [ =C2=A0 =C2=A00.000000] reserve setup_data: [mem
<br>&gt;      &gt; 0x000000000000212c-0x000000000009efff] usable
<br>&gt;      &gt; [ =C2=A0 =C2=A00.000000] DMI not present or invalid.
<br>&gt;      &gt; [ =C2=A0 =C2=A00.000000] Hypervisor detected: Jailhouse
<br>&gt;      &gt; [ =C2=A0 =C2=A00.000000] tsc: Detected 3393.624 MHz proc=
essor
<br>&gt;      &gt; [ =C2=A0 =C2=A00.000019] .text .data .bss are not marked=
 as E820_TYPE_RAM!
<br>&gt;      &gt; [ =C2=A0 =C2=A00.005751] last_pfn =3D 0x3630 max_arch_pf=
n =3D 0x400000000
<br>&gt;      &gt; [ =C2=A0 =C2=A00.011039] x86/PAT: Configuration [0-7]: W=
B =C2=A0WC =C2=A0UC- UC =C2=A0WB
<br>&gt;      =C2=A0WP =C2=A0UC- WT
<br>&gt;      &gt; Memory KASLR using RDRAND RDTSC...
<br>&gt;      &gt; [ =C2=A0 =C2=A00.032374] Using GB pages for direct mappi=
ng
<br>&gt;      &gt; [ =C2=A0 =C2=A00.036743] Kernel panic - not syncing: all=
oc_low_pages: can not
<br>&gt;      &gt; alloc memory
<br>&gt;      &gt; [ =C2=A0 =C2=A00.043712] CPU: 0 PID: 0 Comm: swapper Not=
 tainted 6.2.0-rc3 #2
<br>&gt;      &gt; [ =C2=A0 =C2=A00.049702] Call Trace:
<br>&gt;      &gt; [ =C2=A0 =C2=A00.052134] =C2=A0&lt;TASK&gt;
<br>&gt;      &gt; [ =C2=A0 =C2=A00.054219] =C2=A0dump_stack_lvl+0x3a/0x58
<br>&gt;      &gt; [ =C2=A0 =C2=A00.057865] =C2=A0dump_stack+0x10/0x18
<br>&gt;      &gt; [ =C2=A0 =C2=A00.061162] =C2=A0panic+0x15c/0x308
<br>&gt;      &gt; [ =C2=A0 =C2=A00.064205] =C2=A0alloc_low_pages+0x7d/0x1c=
0
<br>&gt;      &gt; [ =C2=A0 =C2=A00.068024] =C2=A0phys_pmd_init+0x1f2/0x2eb
<br>&gt;      &gt; [ =C2=A0 =C2=A00.071758] =C2=A0phys_pud_init+0x114/0x2d5
<br>&gt;      &gt; [ =C2=A0 =C2=A00.075493] =C2=A0phys_p4d_init+0x4c/0x269
<br>&gt;      &gt; [ =C2=A0 =C2=A00.079135] =C2=A0?
<br>&gt;     __raw_callee_save___native_queued_spin_unlock+0x15/0x30
<br>&gt;      &gt; [ =C2=A0 =C2=A00.085649] =C2=A0__kernel_physical_mapping=
_init+0x11e/0x29a
<br>&gt;      &gt; [ =C2=A0 =C2=A00.090859] =C2=A0kernel_physical_mapping_i=
nit+0xf/0x20
<br>&gt;      &gt; [ =C2=A0 =C2=A00.095631] =C2=A0init_memory_mapping+0x273=
/0x410
<br>&gt;      &gt; [ =C2=A0 =C2=A00.099890] =C2=A0init_range_memory_mapping=
+0xec/0x150
<br>&gt;      &gt; [ =C2=A0 =C2=A00.104574] =C2=A0init_mem_mapping+0x268/0x=
2e7
<br>&gt;      &gt; [ =C2=A0 =C2=A00.108567] =C2=A0setup_arch+0x839/0xdcf
<br>&gt;      &gt; [ =C2=A0 =C2=A00.112039] =C2=A0? lockdown_lsm_init+0x21/=
0x2f
<br>&gt;      &gt; [ =C2=A0 =C2=A00.116120] =C2=A0start_kernel+0x6e/0x997
<br>&gt;      &gt; [ =C2=A0 =C2=A00.119680] =C2=A0x86_64_start_reservations=
+0x24/0x2c
<br>&gt;      &gt; [ =C2=A0 =C2=A00.124281] =C2=A0x86_64_start_kernel+0xec/=
0xff
<br>&gt;      &gt; [ =C2=A0 =C2=A00.128360] =C2=A0secondary_startup_64_no_v=
erify+0xe5/0xeb
<br>&gt;      &gt; [ =C2=A0 =C2=A00.133400] =C2=A0&lt;/TASK&gt;
<br>&gt;      &gt; [ =C2=A0 =C2=A00.135570] ---[ end Kernel panic - not syn=
cing:
<br>&gt;     alloc_low_pages: can
<br>&gt;      &gt; not alloc memory ]---
<br>&gt;      &gt; Closing cell &quot;linux-1&quot;
<br>&gt;      &gt; Page pool usage after cell destruction: mem 254/32211, r=
emap
<br>&gt;     16392/131072
<br>&gt;      &gt; CPU 4 received SIPI, vector 96
<br>&gt;      &gt; CPU 5 received SIPI, vector 96
<br>&gt;      &gt;
<br>&gt;      &gt; This happens both with and without the initrd in the com=
mand,
<br>&gt;     i&#39;ll try
<br>&gt;      &gt; to solve this and see what happens.
<br>&gt;      &gt;
<br>&gt;      &gt; By the way, is it possible that the new cell starts tran=
smitting
<br>&gt;     with a
<br>&gt;      &gt; baud rate different than the root cell? Without specifyi=
ng the
<br>&gt;     speed in
<br>&gt;      &gt; the command above the serial console stopped receiving a=
nything
<br>&gt;     until I
<br>&gt;      &gt; disabled and re-enabled the hypervisor. If not I may hav=
e something
<br>&gt;      &gt; wrong on my end to solve
<br>&gt;      &gt;
<br>&gt;      &gt; Il giorno marted=C3=AC 9 gennaio 2024 alle 17:37:48 UTC+=
1 Michele
<br>&gt;     Pescap=C3=A8 ha
<br>&gt;      &gt; scritto:
<br>&gt;      &gt;
<br>&gt;      &gt; I stand corrected, the freeze happens when i do not set
<br>&gt;      &gt; JAILHOUSE_CELL_PASSIVE_COMMREG in the inmate
<br>&gt;      &gt;
<br>&gt;      &gt; Il giorno marted=C3=AC 9 gennaio 2024 alle 17:26:57 UTC+=
1 Michele Pescap=C3=A8
<br>&gt;      &gt; ha scritto:
<br>&gt;      &gt;
<br>&gt;      &gt; Hi, thank you for replying.
<br>&gt;      &gt;
<br>&gt;      &gt; ttyS0 is indeed whitelisted in the inmate and the number=
 of
<br>&gt;      &gt; pio_regions is set accordingly.
<br>&gt;      &gt;
<br>&gt;      &gt; As for the crash after disable/shutdown, I think it was =
related
<br>&gt;      &gt; to the PCI device, after commenting that and the corresp=
onding
<br>&gt;      &gt; regions out I no longer get that freeze. CONFIG_JAILHOUS=
E_GUEST and
<br>&gt;      &gt; CONFIG_JAILHOUSE_DBCON were already set in the kernel
<br>&gt;      &gt; configuration I&#39;m using for the non root linux; stil=
l, I
<br>&gt;      &gt; recompiled it just in case.
<br>&gt;      &gt;
<br>&gt;      &gt; Michele
<br>&gt;      &gt;
<br>&gt;      &gt; Il giorno marted=C3=AC 9 gennaio 2024 alle 14:14:33 UTC+=
1 Ralf
<br>&gt;      &gt; Ramsauer ha scritto:
<br>&gt;      &gt;
<br>&gt;      &gt; Hi,
<br>&gt;      &gt;
<br>&gt;      &gt; On 08/01/2024 23:56, Michele Pescap=C3=A8 wrote:
<br>&gt;      &gt; &gt; Hi all,
<br>&gt;      &gt; &gt;
<br>&gt;      &gt; &gt; I have an AMD Ryzen 2600 on a b450 motherboard. My =
goal
<br>&gt;      &gt; is to run two
<br>&gt;      &gt; &gt; non root linux cells, however, as of right now, I&#=
39;m not
<br>&gt;      &gt; able to start
<br>&gt;      &gt; &gt; any non root linux cells.
<br>&gt;      &gt; &gt; First of all I don&#39;t receive an output from the=
 cell (I
<br>&gt;      &gt; do get output
<br>&gt;      &gt; &gt; from the apic-demo though), therefore I don&#39;t r=
eally know
<br>&gt;      &gt; if they&#39;re
<br>&gt;      &gt; &gt; even crashing or not; this is the output I get from=
 the
<br>&gt;      &gt; hypervisor after
<br>&gt;      &gt; &gt; enabling the root cell and issuing the following co=
mmand:
<br>&gt;      &gt; &gt;
<br>&gt;      &gt; &gt; sudo jailhouse cell linux configs/x86/linux_guest1.=
cell
<br>&gt;      &gt; &gt; ../buildroot-2023.11/output/images/bzImage -i
<br>&gt;      &gt; &gt; ../buildroot-2023.11/output/images/rootfs.cpio
<br>&gt;      &gt;
<br>&gt;      &gt; for the first few tries, simply don&#39;t load a ramdisk=
. Try to
<br>&gt;      &gt; get the
<br>&gt;      &gt; kernel booting. It will crash with &quot;cannot mount ro=
otfs&quot;. If
<br>&gt;      &gt; we get so
<br>&gt;      &gt; far, then you can continue specifying the ramdisk. But
<br>&gt;      &gt; first, we have to
<br>&gt;      &gt; get that far.
<br>&gt;      &gt;
<br>&gt;      &gt; &gt;
<br>&gt;      &gt; &gt; Adding PCI device ff:1f.7 to cell &quot;linux-x86-d=
emo&quot;
<br>&gt;      &gt; &gt; Created cell &quot;linux-x86-demo&quot;
<br>&gt;      &gt; &gt; Page pool usage after cell creation: mem 336/32211,=
 remap
<br>&gt;      &gt; 16392/131072
<br>&gt;      &gt; &gt; Cell &quot;linux-x86-demo&quot; can be loaded
<br>&gt;      &gt; &gt; CPU 4 received SIPI, vector 100
<br>&gt;      &gt; &gt; CPU 3 received SIPI, vector 100
<br>&gt;      &gt; &gt; Started cell &quot;linux-x86-demo&quot;
<br>&gt;      &gt; &gt;
<br>&gt;      &gt; &gt; After this the cell appears to be running in cell l=
ist,
<br>&gt;      &gt; however I can&#39;t
<br>&gt;      &gt; &gt; seem to get any output to confirm that (I even set
<br>&gt;      &gt; &gt; JAILHOUSE_CELL_VIRTUAL_CONSOLE_ACTIVE, but nothing
<br>&gt;      &gt; appears on the vrtual
<br>&gt;      &gt; &gt; console accessed via &quot;jailhouse console -f&quo=
t;). I also
<br>&gt;      &gt; tried adding -c
<br>&gt;      &gt; &gt; &quot;console=3DttyS0,115200&quot;.
<br>&gt;      &gt;
<br>&gt;      &gt; ttyS0, i.e., x86 Port 0x3f8 is whitelisted in the cell
<br>&gt;      &gt; configuration?
<br>&gt;      &gt; Actually, your cmdline is correct.
<br>&gt;      &gt;
<br>&gt;      &gt; &gt; At this point if I try to disable/shutdown the cell=
, the
<br>&gt;      &gt; system freezes
<br>&gt;      &gt; &gt; requiring a hard reset.
<br>&gt;      &gt;
<br>&gt;      &gt; Okay, is the guest Linux compiled with Jailhouse guest
<br>&gt;      &gt; support? Please
<br>&gt;      &gt; ensure that non-root Linux is compiled with
<br>&gt;      &gt; CONFIG_JAILHOUSE_GUEST and
<br>&gt;      &gt; CONFIG_JAILHOUSE_DBCON. The first one is mandatory for x=
86
<br>&gt;      &gt; Linux guests.
<br>&gt;      &gt;
<br>&gt;      &gt; &gt;
<br>&gt;      &gt; &gt; Also, there seems to be a mismatch between the PCI =
bdf
<br>&gt;      &gt; value in the log
<br>&gt;      &gt; &gt; above and the one in the cell&#39;s configuration. =
In both
<br>&gt;      &gt; root and non root
<br>&gt;      &gt; &gt; cells i set .bdf =3D (0x0f &lt;&lt; 3) for the IVSH=
MEM net device
<br>&gt;      &gt; and the Root
<br>&gt;      &gt; &gt; cell correctly reports that (&quot;Adding virtual P=
CI device
<br>&gt;      &gt; 00:0f.0 to cell
<br>&gt;      &gt; &gt; &quot;RootCell&quot;&quot;).
<br>&gt;      &gt;
<br>&gt;      &gt; First things first. Let&#39;s try to get Linux kicked of=
f before
<br>&gt;      &gt; diving into
<br>&gt;      &gt; PCI. Comment it out for the moment, let&#39;s do that la=
ter.
<br>&gt;      &gt;
<br>&gt;      &gt; Ralf
<br>&gt;      &gt;
<br>&gt;      &gt; &gt;
<br>&gt;      &gt; &gt; If I understood correctly, once the cell works prop=
erly I
<br>&gt;      &gt; won&#39;t need to
<br>&gt;      &gt; &gt; set the console anymore as I can assign an ip (-c &=
quot;ip
<br>&gt;      &gt; x.x.x.x&quot; in the
<br>&gt;      &gt; &gt; cell linux command) and ssh to the cell, right?
<br>&gt;      &gt; &gt;
<br>&gt;      &gt; &gt; I attach the root and non root cells&#39; configura=
tions in
<br>&gt;      &gt; case they&#39;re
<br>&gt;      &gt; &gt; needed. I can provide both the root and non root ce=
ll&#39;s
<br>&gt;      &gt; kernel .conf and
<br>&gt;      &gt; &gt; the buildroot configuration I used if needed.
<br>&gt;      &gt; &gt;
<br>&gt;      &gt; &gt; Thank you for your time,
<br>&gt;      &gt; &gt; Michele
<br>&gt;      &gt; &gt;
<br>&gt;      &gt; &gt; --
<br>&gt;      &gt; &gt; You received this message because you are subscribe=
d to
<br>&gt;      &gt; the Google
<br>&gt;      &gt; &gt; Groups &quot;Jailhouse&quot; group.
<br>&gt;      &gt; &gt; To unsubscribe from this group and stop receiving e=
mails
<br>&gt;      &gt; from it, send
<br>&gt;      &gt; &gt; an email to <a href data-email-masked rel=3D"nofoll=
ow">jailhouse-de...@googlegroups.com</a>
<br>&gt;      &gt; &gt; &lt;mailto:<a href data-email-masked rel=3D"nofollo=
w">jailhouse-de...@googlegroups.com</a>&gt;.
<br>&gt;      &gt; &gt; To view this discussion on the web visit
<br>&gt;      &gt; &gt;
<br>&gt;      &gt;
<br>&gt;     <a href=3D"https://groups.google.com/d/msgid/jailhouse-dev/824=
bacc4-b7ae-47c9-878e-7203214b4fc3n%40googlegroups.com" target=3D"_blank" re=
l=3D"nofollow" data-saferedirecturl=3D"https://www.google.com/url?hl=3Dit&a=
mp;q=3Dhttps://groups.google.com/d/msgid/jailhouse-dev/824bacc4-b7ae-47c9-8=
78e-7203214b4fc3n%2540googlegroups.com&amp;source=3Dgmail&amp;ust=3D1705062=
245736000&amp;usg=3DAOvVaw3OLsQTk3FxTkMDtZRUIRpJ">https://groups.google.com=
/d/msgid/jailhouse-dev/824bacc4-b7ae-47c9-878e-7203214b4fc3n%40googlegroups=
.com</a> &lt;<a href=3D"https://groups.google.com/d/msgid/jailhouse-dev/824=
bacc4-b7ae-47c9-878e-7203214b4fc3n%40googlegroups.com" target=3D"_blank" re=
l=3D"nofollow" data-saferedirecturl=3D"https://www.google.com/url?hl=3Dit&a=
mp;q=3Dhttps://groups.google.com/d/msgid/jailhouse-dev/824bacc4-b7ae-47c9-8=
78e-7203214b4fc3n%2540googlegroups.com&amp;source=3Dgmail&amp;ust=3D1705062=
245736000&amp;usg=3DAOvVaw3OLsQTk3FxTkMDtZRUIRpJ">https://groups.google.com=
/d/msgid/jailhouse-dev/824bacc4-b7ae-47c9-878e-7203214b4fc3n%40googlegroups=
.com</a>&gt; &lt;<a href=3D"https://groups.google.com/d/msgid/jailhouse-dev=
/824bacc4-b7ae-47c9-878e-7203214b4fc3n%40googlegroups.com" target=3D"_blank=
" rel=3D"nofollow" data-saferedirecturl=3D"https://www.google.com/url?hl=3D=
it&amp;q=3Dhttps://groups.google.com/d/msgid/jailhouse-dev/824bacc4-b7ae-47=
c9-878e-7203214b4fc3n%2540googlegroups.com&amp;source=3Dgmail&amp;ust=3D170=
5062245736000&amp;usg=3DAOvVaw3OLsQTk3FxTkMDtZRUIRpJ">https://groups.google=
.com/d/msgid/jailhouse-dev/824bacc4-b7ae-47c9-878e-7203214b4fc3n%40googlegr=
oups.com</a> &lt;<a href=3D"https://groups.google.com/d/msgid/jailhouse-dev=
/824bacc4-b7ae-47c9-878e-7203214b4fc3n%40googlegroups.com" target=3D"_blank=
" rel=3D"nofollow" data-saferedirecturl=3D"https://www.google.com/url?hl=3D=
it&amp;q=3Dhttps://groups.google.com/d/msgid/jailhouse-dev/824bacc4-b7ae-47=
c9-878e-7203214b4fc3n%2540googlegroups.com&amp;source=3Dgmail&amp;ust=3D170=
5062245736000&amp;usg=3DAOvVaw3OLsQTk3FxTkMDtZRUIRpJ">https://groups.google=
.com/d/msgid/jailhouse-dev/824bacc4-b7ae-47c9-878e-7203214b4fc3n%40googlegr=
oups.com</a>&gt;&gt; &lt;<a href=3D"https://groups.google.com/d/msgid/jailh=
ouse-dev/824bacc4-b7ae-47c9-878e-7203214b4fc3n%40googlegroups.com?utm_mediu=
m=3Demail&amp;utm_source=3Dfooter" target=3D"_blank" rel=3D"nofollow" data-=
saferedirecturl=3D"https://www.google.com/url?hl=3Dit&amp;q=3Dhttps://group=
s.google.com/d/msgid/jailhouse-dev/824bacc4-b7ae-47c9-878e-7203214b4fc3n%25=
40googlegroups.com?utm_medium%3Demail%26utm_source%3Dfooter&amp;source=3Dgm=
ail&amp;ust=3D1705062245736000&amp;usg=3DAOvVaw0YERzU8zVu5S7IUXMu23IH">http=
s://groups.google.com/d/msgid/jailhouse-dev/824bacc4-b7ae-47c9-878e-7203214=
b4fc3n%40googlegroups.com?utm_medium=3Demail&amp;utm_source=3Dfooter</a> &l=
t;<a href=3D"https://groups.google.com/d/msgid/jailhouse-dev/824bacc4-b7ae-=
47c9-878e-7203214b4fc3n%40googlegroups.com?utm_medium=3Demail&amp;utm_sourc=
e=3Dfooter" target=3D"_blank" rel=3D"nofollow" data-saferedirecturl=3D"http=
s://www.google.com/url?hl=3Dit&amp;q=3Dhttps://groups.google.com/d/msgid/ja=
ilhouse-dev/824bacc4-b7ae-47c9-878e-7203214b4fc3n%2540googlegroups.com?utm_=
medium%3Demail%26utm_source%3Dfooter&amp;source=3Dgmail&amp;ust=3D170506224=
5736000&amp;usg=3DAOvVaw0YERzU8zVu5S7IUXMu23IH">https://groups.google.com/d=
/msgid/jailhouse-dev/824bacc4-b7ae-47c9-878e-7203214b4fc3n%40googlegroups.c=
om?utm_medium=3Demail&amp;utm_source=3Dfooter</a>&gt; &lt;<a href=3D"https:=
//groups.google.com/d/msgid/jailhouse-dev/824bacc4-b7ae-47c9-878e-7203214b4=
fc3n%40googlegroups.com?utm_medium=3Demail&amp;utm_source=3Dfooter" target=
=3D"_blank" rel=3D"nofollow" data-saferedirecturl=3D"https://www.google.com=
/url?hl=3Dit&amp;q=3Dhttps://groups.google.com/d/msgid/jailhouse-dev/824bac=
c4-b7ae-47c9-878e-7203214b4fc3n%2540googlegroups.com?utm_medium%3Demail%26u=
tm_source%3Dfooter&amp;source=3Dgmail&amp;ust=3D1705062245736000&amp;usg=3D=
AOvVaw0YERzU8zVu5S7IUXMu23IH">https://groups.google.com/d/msgid/jailhouse-d=
ev/824bacc4-b7ae-47c9-878e-7203214b4fc3n%40googlegroups.com?utm_medium=3Dem=
ail&amp;utm_source=3Dfooter</a> &lt;<a href=3D"https://groups.google.com/d/=
msgid/jailhouse-dev/824bacc4-b7ae-47c9-878e-7203214b4fc3n%40googlegroups.co=
m?utm_medium=3Demail&amp;utm_source=3Dfooter" target=3D"_blank" rel=3D"nofo=
llow" data-saferedirecturl=3D"https://www.google.com/url?hl=3Dit&amp;q=3Dht=
tps://groups.google.com/d/msgid/jailhouse-dev/824bacc4-b7ae-47c9-878e-72032=
14b4fc3n%2540googlegroups.com?utm_medium%3Demail%26utm_source%3Dfooter&amp;=
source=3Dgmail&amp;ust=3D1705062245736000&amp;usg=3DAOvVaw0YERzU8zVu5S7IUXM=
u23IH">https://groups.google.com/d/msgid/jailhouse-dev/824bacc4-b7ae-47c9-8=
78e-7203214b4fc3n%40googlegroups.com?utm_medium=3Demail&amp;utm_source=3Dfo=
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
<br>&gt;     <a href=3D"https://groups.google.com/d/msgid/jailhouse-dev/220=
2bf30-5b2c-45ea-9f9f-699daf338843n%40googlegroups.com" target=3D"_blank" re=
l=3D"nofollow" data-saferedirecturl=3D"https://www.google.com/url?hl=3Dit&a=
mp;q=3Dhttps://groups.google.com/d/msgid/jailhouse-dev/2202bf30-5b2c-45ea-9=
f9f-699daf338843n%2540googlegroups.com&amp;source=3Dgmail&amp;ust=3D1705062=
245736000&amp;usg=3DAOvVaw2YgDenW1z2boQpPSRjBv-m">https://groups.google.com=
/d/msgid/jailhouse-dev/2202bf30-5b2c-45ea-9f9f-699daf338843n%40googlegroups=
.com</a> &lt;<a href=3D"https://groups.google.com/d/msgid/jailhouse-dev/220=
2bf30-5b2c-45ea-9f9f-699daf338843n%40googlegroups.com" target=3D"_blank" re=
l=3D"nofollow" data-saferedirecturl=3D"https://www.google.com/url?hl=3Dit&a=
mp;q=3Dhttps://groups.google.com/d/msgid/jailhouse-dev/2202bf30-5b2c-45ea-9=
f9f-699daf338843n%2540googlegroups.com&amp;source=3Dgmail&amp;ust=3D1705062=
245736000&amp;usg=3DAOvVaw2YgDenW1z2boQpPSRjBv-m">https://groups.google.com=
/d/msgid/jailhouse-dev/2202bf30-5b2c-45ea-9f9f-699daf338843n%40googlegroups=
.com</a>&gt; &lt;<a href=3D"https://groups.google.com/d/msgid/jailhouse-dev=
/2202bf30-5b2c-45ea-9f9f-699daf338843n%40googlegroups.com?utm_medium=3Demai=
l&amp;utm_source=3Dfooter" target=3D"_blank" rel=3D"nofollow" data-saferedi=
recturl=3D"https://www.google.com/url?hl=3Dit&amp;q=3Dhttps://groups.google=
.com/d/msgid/jailhouse-dev/2202bf30-5b2c-45ea-9f9f-699daf338843n%2540google=
groups.com?utm_medium%3Demail%26utm_source%3Dfooter&amp;source=3Dgmail&amp;=
ust=3D1705062245736000&amp;usg=3DAOvVaw3T7i7vm2DVs7haJs_xrYFR">https://grou=
ps.google.com/d/msgid/jailhouse-dev/2202bf30-5b2c-45ea-9f9f-699daf338843n%4=
0googlegroups.com?utm_medium=3Demail&amp;utm_source=3Dfooter</a> &lt;<a hre=
f=3D"https://groups.google.com/d/msgid/jailhouse-dev/2202bf30-5b2c-45ea-9f9=
f-699daf338843n%40googlegroups.com?utm_medium=3Demail&amp;utm_source=3Dfoot=
er" target=3D"_blank" rel=3D"nofollow" data-saferedirecturl=3D"https://www.=
google.com/url?hl=3Dit&amp;q=3Dhttps://groups.google.com/d/msgid/jailhouse-=
dev/2202bf30-5b2c-45ea-9f9f-699daf338843n%2540googlegroups.com?utm_medium%3=
Demail%26utm_source%3Dfooter&amp;source=3Dgmail&amp;ust=3D1705062245736000&=
amp;usg=3DAOvVaw3T7i7vm2DVs7haJs_xrYFR">https://groups.google.com/d/msgid/j=
ailhouse-dev/2202bf30-5b2c-45ea-9f9f-699daf338843n%40googlegroups.com?utm_m=
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
<br>&gt; <a href=3D"https://groups.google.com/d/msgid/jailhouse-dev/9a021e3=
f-caca-4ebe-9351-be2c3e999446n%40googlegroups.com" target=3D"_blank" rel=3D=
"nofollow" data-saferedirecturl=3D"https://www.google.com/url?hl=3Dit&amp;q=
=3Dhttps://groups.google.com/d/msgid/jailhouse-dev/9a021e3f-caca-4ebe-9351-=
be2c3e999446n%2540googlegroups.com&amp;source=3Dgmail&amp;ust=3D17050622457=
36000&amp;usg=3DAOvVaw1EtXYjp8713DxJXm54vqrZ">https://groups.google.com/d/m=
sgid/jailhouse-dev/9a021e3f-caca-4ebe-9351-be2c3e999446n%40googlegroups.com=
</a> &lt;<a href=3D"https://groups.google.com/d/msgid/jailhouse-dev/9a021e3=
f-caca-4ebe-9351-be2c3e999446n%40googlegroups.com?utm_medium=3Demail&amp;ut=
m_source=3Dfooter" target=3D"_blank" rel=3D"nofollow" data-saferedirecturl=
=3D"https://www.google.com/url?hl=3Dit&amp;q=3Dhttps://groups.google.com/d/=
msgid/jailhouse-dev/9a021e3f-caca-4ebe-9351-be2c3e999446n%2540googlegroups.=
com?utm_medium%3Demail%26utm_source%3Dfooter&amp;source=3Dgmail&amp;ust=3D1=
705062245736000&amp;usg=3DAOvVaw3gyXIQouP6Vrk5bdstVJc2">https://groups.goog=
le.com/d/msgid/jailhouse-dev/9a021e3f-caca-4ebe-9351-be2c3e999446n%40google=
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
om/d/msgid/jailhouse-dev/23a9c30e-5507-449e-9589-697904becac4n%40googlegrou=
ps.com?utm_medium=3Demail&utm_source=3Dfooter">https://groups.google.com/d/=
msgid/jailhouse-dev/23a9c30e-5507-449e-9589-697904becac4n%40googlegroups.co=
m</a>.<br />

------=_Part_22223_1355847812.1704977833448--

------=_Part_22222_1784686487.1704977833448--
