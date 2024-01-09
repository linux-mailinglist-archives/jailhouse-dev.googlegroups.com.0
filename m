Return-Path: <jailhouse-dev+bncBDIJ36FET4JRBVVO62WAMGQEWCF7O6I@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-yb1-xb3f.google.com (mail-yb1-xb3f.google.com [IPv6:2607:f8b0:4864:20::b3f])
	by mail.lfdr.de (Postfix) with ESMTPS id B0C98828CF3
	for <lists+jailhouse-dev@lfdr.de>; Tue,  9 Jan 2024 19:58:32 +0100 (CET)
Received: by mail-yb1-xb3f.google.com with SMTP id 3f1490d57ef6-dbe868fdc33sf4102589276.0
        for <lists+jailhouse-dev@lfdr.de>; Tue, 09 Jan 2024 10:58:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20230601; t=1704826711; x=1705431511; darn=lfdr.de;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:x-original-sender:mime-version
         :subject:references:in-reply-to:message-id:to:from:date:sender:from
         :to:cc:subject:date:message-id:reply-to;
        bh=biHlnzNXOXGU3jJxZXoBQbd9TTceHr7p/xzyCMwbnvM=;
        b=N25k8H4kLKS6Mtwfj4Gfdw6k9Je9k1j5/rcXZHBaHuPqFXxRUC0y+qbXZKfl9WYoJR
         dw121T3KHKcH7VX9c2YmKuLUVYY61/GpHRpMEaP4nyk8xqEOMLfgHpMu/tfA5g1JGMwJ
         2mrywowug0aMXEOLj7vXwuuoIIWzJWynYACoMwoF2CI944tQZz8u/UZyOUjeltFbhjZY
         B1zxcSVH3yAXNIx06M2tdVk1xc0IE4BiyQjNnq4bBTpNT82PbhoRQqPzzcxEF6XykfhC
         ejET4uv9aM1oaCYe3mMILmP37MJZhIPR/94JAy++IOCvvHBAqQdm3EtUnUom9qnLYg9L
         MsLA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1704826711; x=1705431511; darn=lfdr.de;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:x-original-sender:mime-version
         :subject:references:in-reply-to:message-id:to:from:date:from:to:cc
         :subject:date:message-id:reply-to;
        bh=biHlnzNXOXGU3jJxZXoBQbd9TTceHr7p/xzyCMwbnvM=;
        b=d0SEMRWhkKpj/zZwUJueduDHnzWa8C2q8vYnhpNkRMbYe0R285PgjsO+m+1HJszuk5
         BC04tJLM6XRFnTuTu41l4x9FYTvNwtI+K9ULBCcZ41+ruM+kydWl5wZjE55YQG4OBeGL
         yxV2Re7sy3xXtRkizQ4SCvGzJQu+v+K6YUUiOQ6/PUubvEjyGby+y5CD/TfjlR2X6fTF
         RZXLIjEVmPvYsyKefR9EvLBiCkycSh+pvc9OvYL5DvmESL+MN7oSCgDv+vpwcQ32wEVi
         nkF9AAT9/Y3tuOiHhClU1RtJ7B0x4Sj3Nb5u6ae+cPZohDtkFnWigC0MkoTtEYXeh4OT
         M8hQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1704826711; x=1705431511;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :x-spam-checked-in-group:list-id:mailing-list:precedence
         :x-original-sender:mime-version:subject:references:in-reply-to
         :message-id:to:from:date:x-beenthere:x-gm-message-state:sender:from
         :to:cc:subject:date:message-id:reply-to;
        bh=biHlnzNXOXGU3jJxZXoBQbd9TTceHr7p/xzyCMwbnvM=;
        b=MTmBawkkrRa5IZO5htyhIUpRSgaJnWDUR+r+zv39eP4Kr8OKch6KrwKO8bzD9HsiT8
         LeWDlP8e4VSNw/pmulThL1a+IhUZ8EQ+9LUGnSnXT+7CFSM/eIOj0Nye95XrWQQKQlSz
         O3DNX/G4r/4u0haka6oZRJXlWpvOoIc7OnnHhJW1O0pozToALMaopNKhCtTOt1KERZkd
         PCdbrp+ab3yQKTU4gyOt9+KQ7bcaetCXNELSsnCK1lXvwng3NhfkD2623xXOLTS/V1QC
         Lvew//9/2sphne0ri+/sYnTu/5WMUqdZj1Ah6FCdjUMipeX8Le7sT8svkokYvLBGCh/o
         bjkQ==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AOJu0Yy3ZtQ5ZTX4Q6lksSMKaChexU3riTwqQ5G5njLrCogfbwwvKc9f
	UoA6h50uhQt2MzjDnPf7Swo=
X-Google-Smtp-Source: AGHT+IFqvSDgw2owk5gkvuTbEqHPror1J/gq+ni+YxszcPfQANsBkGXiS/PkH39ZSuTaUpDcKqTAUw==
X-Received: by 2002:a25:c5c7:0:b0:dbe:9d1a:da04 with SMTP id v190-20020a25c5c7000000b00dbe9d1ada04mr3032351ybe.84.1704826711218;
        Tue, 09 Jan 2024 10:58:31 -0800 (PST)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a25:7441:0:b0:dbd:97bc:c37f with SMTP id p62-20020a257441000000b00dbd97bcc37fls717308ybc.0.-pod-prod-02-us;
 Tue, 09 Jan 2024 10:58:29 -0800 (PST)
X-Received: by 2002:a05:690c:88a:b0:5df:4a9b:fb6c with SMTP id cd10-20020a05690c088a00b005df4a9bfb6cmr2166045ywb.3.1704826709575;
        Tue, 09 Jan 2024 10:58:29 -0800 (PST)
Date: Tue, 9 Jan 2024 10:58:28 -0800 (PST)
From: =?UTF-8?Q?Michele_Pescap=C3=A8?= <mic.pescape@gmail.com>
To: Jailhouse <jailhouse-dev@googlegroups.com>
Message-Id: <2202bf30-5b2c-45ea-9f9f-699daf338843n@googlegroups.com>
In-Reply-To: <219b013e-4970-4bb3-969f-bb0d7bae3ab7n@googlegroups.com>
References: <824bacc4-b7ae-47c9-878e-7203214b4fc3n@googlegroups.com>
 <d36e18a4-dd64-4f9c-b2cf-89b02b1a0469@oth-regensburg.de>
 <c9dad4f3-f856-4f25-b6ad-41ec63cf2c64n@googlegroups.com>
 <219b013e-4970-4bb3-969f-bb0d7bae3ab7n@googlegroups.com>
Subject: Re: Unable to start non root linux cell
MIME-Version: 1.0
Content-Type: multipart/mixed; 
	boundary="----=_Part_108551_1489231994.1704826708756"
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

------=_Part_108551_1489231994.1704826708756
Content-Type: multipart/alternative; 
	boundary="----=_Part_108552_1099512277.1704826708756"

------=_Part_108552_1099512277.1704826708756
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi,=20

Just an update, I was able to get the following output by adding -c=20
"earlyprintk=3DttyS0,115200" to the command line:

Started cell "linux-1"


Invalid physical address chosen!




Physical KASLR disabled: no suitable memory region!

[    0.000000] Linux version 6.2.0-rc3 (root@mp-LINUX-DESKTOP)=20
(x86_64-buildroot-linux-gnu-gcc.br_real (Buildroot 2023.11) 12.3.0, GNU ld=
=20
(GNU Binutils) 2.40) #2 SMP PREEMPT_DYNAMIC Sun Jan  7 18:35:23 CET 2024
[    0.000000] Command line: earlyprintk=3DttyS0,115200
[    0.000000] KERNEL supported cpus:
[    0.000000]   Intel GenuineIntel
[    0.000000]   AMD AuthenticAMD
[    0.000000] x86/fpu: Supporting XSAVE feature 0x001: 'x87 floating point=
=20
registers'
[    0.000000] x86/fpu: Supporting XSAVE feature 0x002: 'SSE registers'
[    0.000000] x86/fpu: Supporting XSAVE feature 0x004: 'AVX registers'
[    0.000000] x86/fpu: xstate_offset[2]:  576, xstate_sizes[2]:  256
[    0.000000] x86/fpu: Enabled xstate features 0x7, context size is 832=20
bytes, using 'compacted' format.
[    0.000000] signal: max sigframe size: 1776
[    0.000000] BIOS-provided physical RAM map:
[    0.000000] BIOS-e801: [mem 0x0000000000000000-0x000000000009efff] usabl=
e
[    0.000000] printk: bootconsole [earlyser0] enabled
[    0.000000] NX (Execute Disable) protection: active
[    0.000000] extended physical RAM map:
[    0.000000] reserve setup_data: [mem 0x0000000000000000-0x0000000000001f=
ff]=20
usable
[    0.000000] reserve setup_data: [mem 0x0000000000002000-0x00000000000021=
2b]=20
usable
[    0.000000] reserve setup_data: [mem 0x000000000000212c-0x000000000009ef=
ff]=20
usable
[    0.000000] DMI not present or invalid.
[    0.000000] Hypervisor detected: Jailhouse
[    0.000000] tsc: Detected 3393.624 MHz processor
[    0.000019] .text .data .bss are not marked as E820_TYPE_RAM!
[    0.005751] last_pfn =3D 0x3630 max_arch_pfn =3D 0x400000000
[    0.011039] x86/PAT: Configuration [0-7]: WB  WC  UC- UC  WB  WP  UC- WT
Memory KASLR using RDRAND RDTSC...
[    0.032374] Using GB pages for direct mapping
[    0.036743] Kernel panic - not syncing: alloc_low_pages: can not alloc=
=20
memory
[    0.043712] CPU: 0 PID: 0 Comm: swapper Not tainted 6.2.0-rc3 #2
[    0.049702] Call Trace:
[    0.052134]  <TASK>
[    0.054219]  dump_stack_lvl+0x3a/0x58
[    0.057865]  dump_stack+0x10/0x18
[    0.061162]  panic+0x15c/0x308
[    0.064205]  alloc_low_pages+0x7d/0x1c0
[    0.068024]  phys_pmd_init+0x1f2/0x2eb
[    0.071758]  phys_pud_init+0x114/0x2d5
[    0.075493]  phys_p4d_init+0x4c/0x269
[    0.079135]  ? __raw_callee_save___native_queued_spin_unlock+0x15/0x30
[    0.085649]  __kernel_physical_mapping_init+0x11e/0x29a
[    0.090859]  kernel_physical_mapping_init+0xf/0x20
[    0.095631]  init_memory_mapping+0x273/0x410
[    0.099890]  init_range_memory_mapping+0xec/0x150
[    0.104574]  init_mem_mapping+0x268/0x2e7
[    0.108567]  setup_arch+0x839/0xdcf
[    0.112039]  ? lockdown_lsm_init+0x21/0x2f
[    0.116120]  start_kernel+0x6e/0x997
[    0.119680]  x86_64_start_reservations+0x24/0x2c
[    0.124281]  x86_64_start_kernel+0xec/0xff
[    0.128360]  secondary_startup_64_no_verify+0xe5/0xeb
[    0.133400]  </TASK>
[    0.135570] ---[ end Kernel panic - not syncing: alloc_low_pages: can=20
not alloc memory ]---
Closing cell "linux-1"
Page pool usage after cell destruction: mem 254/32211, remap 16392/131072
CPU 4 received SIPI, vector 96
CPU 5 received SIPI, vector 96

This happens both with and without the initrd in the command, i'll try to=
=20
solve this and see what happens.

By the way, is it possible that the new cell starts transmitting with a=20
baud rate different than the root cell? Without specifying the speed in the=
=20
command above the serial console stopped receiving anything until I=20
disabled and re-enabled the hypervisor. If not I may have something wrong=
=20
on my end to solve

Il giorno marted=C3=AC 9 gennaio 2024 alle 17:37:48 UTC+1 Michele Pescap=C3=
=A8 ha=20
scritto:

> I stand corrected, the freeze happens when i do not set=20
> JAILHOUSE_CELL_PASSIVE_COMMREG in the inmate
>
> Il giorno marted=C3=AC 9 gennaio 2024 alle 17:26:57 UTC+1 Michele Pescap=
=C3=A8 ha=20
> scritto:
>
>> Hi, thank you for replying.
>>
>> ttyS0 is indeed whitelisted in the inmate and the number of pio_regions=
=20
>> is set accordingly.=20
>>
>> As for the crash after disable/shutdown, I think it was related to the=
=20
>> PCI device, after commenting that and the corresponding regions out I no=
=20
>> longer get that freeze. CONFIG_JAILHOUSE_GUEST and=20
>> CONFIG_JAILHOUSE_DBCON were already set in the kernel configuration I'm=
=20
>> using for the non root linux; still, I recompiled it just in case.
>>
>> Michele
>>
>> Il giorno marted=C3=AC 9 gennaio 2024 alle 14:14:33 UTC+1 Ralf Ramsauer =
ha=20
>> scritto:
>>
>> Hi,=20
>>
>> On 08/01/2024 23:56, Michele Pescap=C3=A8 wrote:=20
>> > Hi all,=20
>> >=20
>> > I have an AMD Ryzen 2600 on a b450 motherboard. My goal is to run two=
=20
>> > non root linux cells, however, as of right now, I'm not able to start=
=20
>> > any non root linux cells.=20
>> > First of all I don't receive an output from the cell (I do get output=
=20
>> > from the apic-demo though), therefore I don't really know if they're=
=20
>> > even crashing or not; this is the output I get from the hypervisor=20
>> after=20
>> > enabling the root cell and issuing the following command:=20
>> >=20
>> > sudo jailhouse cell linux configs/x86/linux_guest1.cell=20
>> > ../buildroot-2023.11/output/images/bzImage -i=20
>> > ../buildroot-2023.11/output/images/rootfs.cpio=20
>>
>> for the first few tries, simply don't load a ramdisk. Try to get the=20
>> kernel booting. It will crash with "cannot mount rootfs". If we get so=
=20
>> far, then you can continue specifying the ramdisk. But first, we have to=
=20
>> get that far.=20
>>
>> >=20
>> > Adding PCI device ff:1f.7 to cell "linux-x86-demo"=20
>> > Created cell "linux-x86-demo"=20
>> > Page pool usage after cell creation: mem 336/32211, remap 16392/131072=
=20
>> > Cell "linux-x86-demo" can be loaded=20
>> > CPU 4 received SIPI, vector 100=20
>> > CPU 3 received SIPI, vector 100=20
>> > Started cell "linux-x86-demo"=20
>> >=20
>> > After this the cell appears to be running in cell list, however I can'=
t=20
>> > seem to get any output to confirm that (I even set=20
>> > JAILHOUSE_CELL_VIRTUAL_CONSOLE_ACTIVE, but nothing appears on the=20
>> vrtual=20
>> > console accessed via "jailhouse console -f"). I also tried adding -c=
=20
>> > "console=3DttyS0,115200".=20
>>
>> ttyS0, i.e., x86 Port 0x3f8 is whitelisted in the cell configuration?=20
>> Actually, your cmdline is correct.=20
>>
>> > At this point if I try to disable/shutdown the cell, the system freeze=
s=20
>> > requiring a hard reset.=20
>>
>> Okay, is the guest Linux compiled with Jailhouse guest support? Please=
=20
>> ensure that non-root Linux is compiled with CONFIG_JAILHOUSE_GUEST and=
=20
>> CONFIG_JAILHOUSE_DBCON. The first one is mandatory for x86 Linux guests.=
=20
>>
>> >=20
>> > Also, there seems to be a mismatch between the PCI bdf value in the lo=
g=20
>> > above and the one in the cell's configuration. In both root and non=20
>> root=20
>> > cells i set .bdf =3D (0x0f << 3) for the IVSHMEM net device and the Ro=
ot=20
>> > cell correctly reports that ("Adding virtual PCI device 00:0f.0 to cel=
l=20
>> > "RootCell"").=20
>>
>> First things first. Let's try to get Linux kicked off before diving into=
=20
>> PCI. Comment it out for the moment, let's do that later.=20
>>
>> Ralf=20
>>
>> >=20
>> > If I understood correctly, once the cell works properly I won't need t=
o=20
>> > set the console anymore as I can assign an ip (-c "ip x.x.x.x" in the=
=20
>> > cell linux command) and ssh to the cell, right?=20
>> >=20
>> > I attach the root and non root cells' configurations in case they're=
=20
>> > needed. I can provide both the root and non root cell's kernel .conf=
=20
>> and=20
>> > the buildroot configuration I used if needed.=20
>> >=20
>> > Thank you for your time,=20
>> > Michele=20
>> >=20
>> > --=20
>> > You received this message because you are subscribed to the Google=20
>> > Groups "Jailhouse" group.=20
>> > To unsubscribe from this group and stop receiving emails from it, send=
=20
>> > an email to jailhouse-de...@googlegroups.com=20
>> > <mailto:jailhouse-de...@googlegroups.com>.=20
>> > To view this discussion on the web visit=20
>> >=20
>> https://groups.google.com/d/msgid/jailhouse-dev/824bacc4-b7ae-47c9-878e-=
7203214b4fc3n%40googlegroups.com=20
>> <
>> https://groups.google.com/d/msgid/jailhouse-dev/824bacc4-b7ae-47c9-878e-=
7203214b4fc3n%40googlegroups.com?utm_medium=3Demail&utm_source=3Dfooter>.=
=20
>>
>>
>>

--=20
You received this message because you are subscribed to the Google Groups "=
Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/=
jailhouse-dev/2202bf30-5b2c-45ea-9f9f-699daf338843n%40googlegroups.com.

------=_Part_108552_1099512277.1704826708756
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi, <br /><br />Just an update, I was able to get the following output by a=
dding -c "earlyprintk=3DttyS0,115200" to the command line:<br /><br />Start=
ed cell "linux-1"<br /><br /><br />Invalid physical address chosen!<br /><b=
r /><br /><br /><br />Physical KASLR disabled: no suitable memory region!<b=
r /><br />[
 =C2=A0 =C2=A00.000000] Linux version 6.2.0-rc3 (root@mp-LINUX-DESKTOP)=20
(x86_64-buildroot-linux-gnu-gcc.br_real (Buildroot=20
2023.11) 12.3.0, GNU ld (GNU Binutils) 2.40) #2 SMP=20
PREEMPT_DYNAMIC Sun Jan =C2=A07 18:35:23 CET 2024<br />[ =C2=A0 =C2=A00.000=
000] Command line: earlyprintk=3DttyS0,115200<br />[ =C2=A0 =C2=A00.000000]=
 KERNEL supported cpus:<br />[ =C2=A0 =C2=A00.000000] =C2=A0 Intel GenuineI=
ntel<br />[ =C2=A0 =C2=A00.000000] =C2=A0 AMD AuthenticAMD<br />[ =C2=A0 =
=C2=A00.000000] x86/fpu: Supporting XSAVE feature 0x001: 'x87 floating poin=
t registers'<br />[ =C2=A0 =C2=A00.000000] x86/fpu: Supporting XSAVE featur=
e 0x002: 'SSE registers'<br />[ =C2=A0 =C2=A00.000000] x86/fpu: Supporting =
XSAVE feature 0x004: 'AVX registers'<br />[ =C2=A0 =C2=A00.000000] x86/fpu:=
 xstate_offset[2]: =C2=A0576, xstate_sizes[2]: =C2=A0256<br />[ =C2=A0 =C2=
=A00.000000] x86/fpu: Enabled xstate features 0x7, context size is 832 byte=
s, using 'compacted' format.<br />[ =C2=A0 =C2=A00.000000] signal: max sigf=
rame size: 1776<br />[ =C2=A0 =C2=A00.000000] BIOS-provided physical RAM ma=
p:<br />[ =C2=A0 =C2=A00.000000] BIOS-e801: [mem 0x0000000000000000-<span><=
/span>0x000000000009efff] usable<br />[ =C2=A0 =C2=A00.000000] printk: boot=
console [earlyser0] enabled<br />[ =C2=A0 =C2=A00.000000] NX (Execute Disab=
le) protection: active<br />[ =C2=A0 =C2=A00.000000] extended physical RAM =
map:<br />[ =C2=A0 =C2=A00.000000] reserve setup_data: [mem 0x0000000000000=
000-<span></span>0x0000000000001fff] usable<br />[ =C2=A0 =C2=A00.000000] r=
eserve setup_data: [mem 0x0000000000002000-<span></span>0x000000000000212b]=
 usable<br />[ =C2=A0 =C2=A00.000000] reserve setup_data: [mem 0x0000000000=
00212c-<span></span>0x000000000009efff] usable<br />[ =C2=A0 =C2=A00.000000=
] DMI not present or invalid.<br />[ =C2=A0 =C2=A00.000000] Hypervisor dete=
cted: Jailhouse<br />[ =C2=A0 =C2=A00.000000] tsc: Detected 3393.624 MHz pr=
ocessor<br />[ =C2=A0 =C2=A00.000019] .text .data .bss are not marked as E8=
20_TYPE_RAM!<br />[ =C2=A0 =C2=A00.005751] last_pfn =3D 0x3630 max_arch_pfn=
 =3D 0x400000000<br />[ =C2=A0 =C2=A00.011039] x86/PAT: Configuration [0-7]=
: WB =C2=A0WC =C2=A0UC- UC =C2=A0WB =C2=A0WP =C2=A0UC- WT<br />Memory KASLR=
 using RDRAND RDTSC...<br />[ =C2=A0 =C2=A00.032374] Using GB pages for dir=
ect mapping<br />[ =C2=A0 =C2=A00.036743] Kernel panic - not syncing: alloc=
_low_pages: can not alloc memory<br />[ =C2=A0 =C2=A00.043712] CPU: 0 PID: =
0 Comm: swapper Not tainted 6.2.0-rc3 #2<br />[ =C2=A0 =C2=A00.049702] Call=
 Trace:<br />[ =C2=A0 =C2=A00.052134] =C2=A0&lt;TASK&gt;<br />[ =C2=A0 =C2=
=A00.054219] =C2=A0dump_stack_lvl+0x3a/0x58<br />[ =C2=A0 =C2=A00.057865] =
=C2=A0dump_stack+0x10/0x18<br />[ =C2=A0 =C2=A00.061162] =C2=A0panic+0x15c/=
0x308<br />[ =C2=A0 =C2=A00.064205] =C2=A0alloc_low_pages+0x7d/0x1c0<br />[=
 =C2=A0 =C2=A00.068024] =C2=A0phys_pmd_init+0x1f2/0x2eb<br />[ =C2=A0 =C2=
=A00.071758] =C2=A0phys_pud_init+0x114/0x2d5<br />[ =C2=A0 =C2=A00.075493] =
=C2=A0phys_p4d_init+0x4c/0x269<br />[ =C2=A0 =C2=A00.079135] =C2=A0? __raw_=
callee_save___native_<span></span>queued_spin_unlock+0x15/0x30<br />[ =C2=
=A0 =C2=A00.085649] =C2=A0__kernel_physical_mapping_<span></span>init+0x11e=
/0x29a<br />[ =C2=A0 =C2=A00.090859] =C2=A0kernel_physical_mapping_init+<sp=
an></span>0xf/0x20<br />[ =C2=A0 =C2=A00.095631] =C2=A0init_memory_mapping+=
0x273/<span></span>0x410<br />[ =C2=A0 =C2=A00.099890] =C2=A0init_range_mem=
ory_mapping+<span></span>0xec/0x150<br />[ =C2=A0 =C2=A00.104574] =C2=A0ini=
t_mem_mapping+0x268/0x2e7<br />[ =C2=A0 =C2=A00.108567] =C2=A0setup_arch+0x=
839/0xdcf<br />[ =C2=A0 =C2=A00.112039] =C2=A0? lockdown_lsm_init+0x21/0x2f=
<br />[ =C2=A0 =C2=A00.116120] =C2=A0start_kernel+0x6e/0x997<br />[ =C2=A0 =
=C2=A00.119680] =C2=A0x86_64_start_reservations+<span></span>0x24/0x2c<br /=
>[ =C2=A0 =C2=A00.124281] =C2=A0x86_64_start_kernel+0xec/0xff<br />[ =C2=A0=
 =C2=A00.128360] =C2=A0secondary_startup_64_no_<span></span>verify+0xe5/0xe=
b<br />[ =C2=A0 =C2=A00.133400] =C2=A0&lt;/TASK&gt;<br />[ =C2=A0 =C2=A00.1=
35570] ---[ end Kernel panic - not syncing: alloc_low_pages: can not alloc =
memory ]---<br />Closing cell "linux-1"<br />Page pool usage after cell des=
truction: mem 254/32211, remap 16392/131072<br />CPU 4 received SIPI, vecto=
r 96<br />CPU 5 received SIPI, vector 96<font color=3D"#888888"><br /></fon=
t><br />This happens both with and without the initrd in the command, i'll =
try to solve this and see what happens.<br /><br />By the way, is it possib=
le that the new cell starts transmitting with a baud rate different than th=
e root cell? Without specifying the speed in the command above the serial c=
onsole stopped receiving anything until I disabled and re-enabled the hyper=
visor. If not I may have something wrong on my end to solve<br /><br /><div=
 class=3D"gmail_quote"><div dir=3D"auto" class=3D"gmail_attr">Il giorno mar=
ted=C3=AC 9 gennaio 2024 alle 17:37:48 UTC+1 Michele Pescap=C3=A8 ha scritt=
o:<br/></div><blockquote class=3D"gmail_quote" style=3D"margin: 0 0 0 0.8ex=
; border-left: 1px solid rgb(204, 204, 204); padding-left: 1ex;">I stand co=
rrected, the freeze happens when i do not set JAILHOUSE_CELL_PASSIVE_COMMRE=
G in the inmate<br><br><div class=3D"gmail_quote"><div dir=3D"auto" class=
=3D"gmail_attr">Il giorno marted=C3=AC 9 gennaio 2024 alle 17:26:57 UTC+1 M=
ichele Pescap=C3=A8 ha scritto:<br></div><blockquote class=3D"gmail_quote" =
style=3D"margin:0 0 0 0.8ex;border-left:1px solid rgb(204,204,204);padding-=
left:1ex">Hi, thank you for replying.<br><br>ttyS0 is indeed whitelisted in=
 the inmate and the number of pio_regions is set accordingly. <br><br>As fo=
r the crash after disable/shutdown, I think it was related to the PCI devic=
e, after commenting that and the corresponding regions out I no longer get =
that freeze. CONFIG_JAILHOUSE_GUEST and=20
<br>CONFIG_JAILHOUSE_DBCON were already set in the kernel configuration I&#=
39;m using for the non root linux; still, I recompiled it just in case.<br>=
<br>Michele<br><br><div><div dir=3D"auto">Il giorno marted=C3=AC 9 gennaio =
2024 alle 14:14:33 UTC+1 Ralf Ramsauer ha scritto:<br></div><blockquote sty=
le=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);paddi=
ng-left:1ex">Hi,
<br>
<br>On 08/01/2024 23:56, Michele Pescap=C3=A8 wrote:
<br>&gt; Hi all,
<br>&gt;=20
<br>&gt; I have an AMD Ryzen 2600 on a b450 motherboard. My goal is to run =
two=20
<br>&gt; non root linux cells, however, as of right now, I&#39;m not able t=
o start=20
<br>&gt; any non root linux cells.
<br>&gt; First of all I don&#39;t receive an output from the cell (I do get=
 output=20
<br>&gt; from the apic-demo though), therefore I don&#39;t really know if t=
hey&#39;re=20
<br>&gt; even crashing or not; this is the output I get from the hypervisor=
 after=20
<br>&gt; enabling the root cell and issuing the following command:
<br>&gt;=20
<br>&gt; sudo jailhouse cell linux configs/x86/linux_guest1.cell=20
<br>&gt; ../buildroot-2023.11/output/images/bzImage -i=20
<br>&gt; ../buildroot-2023.11/output/images/rootfs.cpio
<br>
<br>for the first few tries, simply don&#39;t load a ramdisk. Try to get th=
e=20
<br>kernel booting. It will crash with &quot;cannot mount rootfs&quot;. If =
we get so=20
<br>far, then you can continue specifying the ramdisk. But first, we have t=
o=20
<br>get that far.
<br>
<br>&gt;=20
<br>&gt; Adding PCI device ff:1f.7 to cell &quot;linux-x86-demo&quot;
<br>&gt; Created cell &quot;linux-x86-demo&quot;
<br>&gt; Page pool usage after cell creation: mem 336/32211, remap 16392/13=
1072
<br>&gt; Cell &quot;linux-x86-demo&quot; can be loaded
<br>&gt; CPU 4 received SIPI, vector 100
<br>&gt; CPU 3 received SIPI, vector 100
<br>&gt; Started cell &quot;linux-x86-demo&quot;
<br>&gt;=20
<br>&gt; After this the cell appears to be running in cell list, however I =
can&#39;t=20
<br>&gt; seem to get any output to confirm that (I even set=20
<br>&gt; JAILHOUSE_CELL_VIRTUAL_CONSOLE_ACTIVE, but nothing appears on the =
vrtual=20
<br>&gt; console accessed via &quot;jailhouse console -f&quot;). I also tri=
ed adding -c=20
<br>&gt; &quot;console=3DttyS0,115200&quot;.
<br>
<br>ttyS0, i.e., x86 Port 0x3f8 is whitelisted in the cell configuration?=
=20
<br>Actually, your cmdline is correct.
<br>
<br>&gt; At this point if I try to disable/shutdown the cell, the system fr=
eezes=20
<br>&gt; requiring a hard reset.
<br>
<br>Okay, is the guest Linux compiled with Jailhouse guest support? Please=
=20
<br>ensure that non-root Linux is compiled with CONFIG_JAILHOUSE_GUEST and=
=20
<br>CONFIG_JAILHOUSE_DBCON. The first one is mandatory for x86 Linux guests=
.
<br>
<br>&gt;=20
<br>&gt; Also, there seems to be a mismatch between the PCI bdf value in th=
e log=20
<br>&gt; above and the one in the cell&#39;s configuration. In both root an=
d non root=20
<br>&gt; cells i set .bdf =3D (0x0f &lt;&lt; 3) for the IVSHMEM net device =
and the Root=20
<br>&gt; cell correctly reports that (&quot;Adding virtual PCI device 00:0f=
.0 to cell=20
<br>&gt; &quot;RootCell&quot;&quot;).
<br>
<br>First things first. Let&#39;s try to get Linux kicked off before diving=
 into=20
<br>PCI. Comment it out for the moment, let&#39;s do that later.
<br>
<br>   Ralf
<br>
<br>&gt;=20
<br>&gt; If I understood correctly, once the cell works properly I won&#39;=
t need to=20
<br>&gt; set the console anymore as I can assign an ip (-c &quot;ip x.x.x.x=
&quot; in the=20
<br>&gt; cell linux command) and ssh to the cell, right?
<br>&gt;=20
<br>&gt; I attach the root and non root cells&#39; configurations in case t=
hey&#39;re=20
<br>&gt; needed. I can provide both the root and non root cell&#39;s kernel=
 .conf and=20
<br>&gt; the buildroot configuration I used if needed.
<br>&gt;=20
<br>&gt; Thank you for your time,
<br>&gt; Michele
<br>&gt;=20
<br>&gt; --=20
<br>&gt; You received this message because you are subscribed to the Google=
=20
<br>&gt; Groups &quot;Jailhouse&quot; group.
<br>&gt; To unsubscribe from this group and stop receiving emails from it, =
send=20
<br>&gt; an email to <a rel=3D"nofollow">jailhouse-de...@googlegroups.com</=
a>=20
<br>&gt; &lt;mailto:<a rel=3D"nofollow">jailhouse-de...@googlegroups.com</a=
>&gt;.
<br>&gt; To view this discussion on the web visit=20
<br>&gt; <a href=3D"https://groups.google.com/d/msgid/jailhouse-dev/824bacc=
4-b7ae-47c9-878e-7203214b4fc3n%40googlegroups.com" rel=3D"nofollow" target=
=3D"_blank" data-saferedirecturl=3D"https://www.google.com/url?hl=3Dit&amp;=
q=3Dhttps://groups.google.com/d/msgid/jailhouse-dev/824bacc4-b7ae-47c9-878e=
-7203214b4fc3n%2540googlegroups.com&amp;source=3Dgmail&amp;ust=3D1704912050=
948000&amp;usg=3DAOvVaw39NPXzJlJza5-C9xYEQ9tk">https://groups.google.com/d/=
msgid/jailhouse-dev/824bacc4-b7ae-47c9-878e-7203214b4fc3n%40googlegroups.co=
m</a> &lt;<a href=3D"https://groups.google.com/d/msgid/jailhouse-dev/824bac=
c4-b7ae-47c9-878e-7203214b4fc3n%40googlegroups.com?utm_medium=3Demail&amp;u=
tm_source=3Dfooter" rel=3D"nofollow" target=3D"_blank" data-saferedirecturl=
=3D"https://www.google.com/url?hl=3Dit&amp;q=3Dhttps://groups.google.com/d/=
msgid/jailhouse-dev/824bacc4-b7ae-47c9-878e-7203214b4fc3n%2540googlegroups.=
com?utm_medium%3Demail%26utm_source%3Dfooter&amp;source=3Dgmail&amp;ust=3D1=
704912050948000&amp;usg=3DAOvVaw2VAL5Z3itpH1CvxnVFLF3y">https://groups.goog=
le.com/d/msgid/jailhouse-dev/824bacc4-b7ae-47c9-878e-7203214b4fc3n%40google=
groups.com?utm_medium=3Demail&amp;utm_source=3Dfooter</a>&gt;.
<br></blockquote></div></blockquote></div></blockquote></div>

<p></p>

-- <br />
You received this message because you are subscribed to the Google Groups &=
quot;Jailhouse&quot; group.<br />
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to <a href=3D"mailto:jailhouse-dev+unsubscribe@googlegroups.com">jailh=
ouse-dev+unsubscribe@googlegroups.com</a>.<br />
To view this discussion on the web visit <a href=3D"https://groups.google.c=
om/d/msgid/jailhouse-dev/2202bf30-5b2c-45ea-9f9f-699daf338843n%40googlegrou=
ps.com?utm_medium=3Demail&utm_source=3Dfooter">https://groups.google.com/d/=
msgid/jailhouse-dev/2202bf30-5b2c-45ea-9f9f-699daf338843n%40googlegroups.co=
m</a>.<br />

------=_Part_108552_1099512277.1704826708756--

------=_Part_108551_1489231994.1704826708756--
