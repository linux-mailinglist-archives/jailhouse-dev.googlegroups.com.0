Return-Path: <jailhouse-dev+bncBDIJ36FET4JRBTXMRSWQMGQELE2UCRI@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-qt1-x83d.google.com (mail-qt1-x83d.google.com [IPv6:2607:f8b0:4864:20::83d])
	by mail.lfdr.de (Postfix) with ESMTPS id C042982CF70
	for <lists+jailhouse-dev@lfdr.de>; Sun, 14 Jan 2024 02:18:08 +0100 (CET)
Received: by mail-qt1-x83d.google.com with SMTP id d75a77b69052e-429c7bfb94bsf44237941cf.2
        for <lists+jailhouse-dev@lfdr.de>; Sat, 13 Jan 2024 17:18:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20230601; t=1705195087; x=1705799887; darn=lfdr.de;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:x-original-sender:mime-version
         :subject:references:in-reply-to:message-id:to:from:date:sender:from
         :to:cc:subject:date:message-id:reply-to;
        bh=TdOSHk9TaDpdB12bzKWRmXuAFVpd7F96k2Z5bvb+UL8=;
        b=YkcDzqjJirWgVPN8QCTUW/olVib3Qy1ohpMUqlNWBK47VDpVmme0t0GZUVIQ+aFwsv
         S1Z+3+tAshO/w39akwmBQu1Dkz0JqemGCXjQq7vDPRDSbR9c2Qk/Vp3Z/WObZUCLpYPf
         +c99OykM3fjl7QpCOZsIKf1XA9SCb2zvtNK/Tc3AxOwv2zowUKyPXOvy5beoc3A6sPYA
         GywKwfCPA5Ob7tBEcIkaN/muxZWoVCvW3IFduY/jno2SB7FcJQas6P1WjEi8aPZvVX29
         x6moUx64RrIx0tOKAiraalV5UDb5M2Brt0gd+Nnq5T2hxAGuKYYzh2LzwX8+9S9XCZ+5
         BX/w==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1705195087; x=1705799887; darn=lfdr.de;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:x-original-sender:mime-version
         :subject:references:in-reply-to:message-id:to:from:date:from:to:cc
         :subject:date:message-id:reply-to;
        bh=TdOSHk9TaDpdB12bzKWRmXuAFVpd7F96k2Z5bvb+UL8=;
        b=crB7JnPL+2HHdIxCeF86f4l2a+TqLHNSgvwrwztZbANqVkd+bby6ufagbSSHx1GuS1
         xx3N/pL5F/8REHQ3rbBFXT/dwy0LfhMZdAvkClZVb79rfpxP0XnDXZIhOvSIS0CQDaK5
         0zslnuEnbzbPKqTIWrIM+x/zo/mEBh4p5ZtoMQfAxuGY/5Ya9rbc+ubs8EDzyDY+jxxP
         wn5dMz6dC52sjwVyRc+mP5o8ENwwK5INPWsVOGLs7s0cp0WsCFF5eP5Pl3C6eiLNExwg
         /1Ks9iGrfceyuvrFw+kpE8s9wrA05oEQdU0bWS+kRpdomuiDpviC2Iy3HI3IEAWTODfE
         t+ig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1705195087; x=1705799887;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :x-spam-checked-in-group:list-id:mailing-list:precedence
         :x-original-sender:mime-version:subject:references:in-reply-to
         :message-id:to:from:date:x-beenthere:x-gm-message-state:sender:from
         :to:cc:subject:date:message-id:reply-to;
        bh=TdOSHk9TaDpdB12bzKWRmXuAFVpd7F96k2Z5bvb+UL8=;
        b=fE+rWZ3tIUSVdR2ueCBTgK5PS5RntfTeejRyj+Zz2pjTrbw0PQCZFv0CskSUq0FCbG
         mvf8bg1GlH13vLHc2MAJpaHuQlhBJtmnXtReu3m/8iszRLoc18/K1VYCGHo3aFHWSnqY
         ZSM7/jdCQaOrVw3KAz40XefBBkUnaDgFWsfvErElgjeFr6ZMItQkwzN7NgxZkYCjBTsE
         xSQJl1g7/mUztdcGLOJGEdRzQGMqP1gA56MBa8mKjPuAv0A+pDep3VbuKKyEHpLEmk+n
         Bu81RnKz2QgaiWKP3/3aYKzqowsRwMEZYePur44+YS8F9mPUbQmSH+tupnZPYHgqnlAD
         a1/g==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AOJu0YyUblwN+ALO3EEN+jmqo9IV6GihJjYIUA5DdKR8vjUJR84O4pwY
	thKslf90ZVotjgF2OOifMO8=
X-Google-Smtp-Source: AGHT+IEFCQyWzEIHBF8gGfW2tUDBUE8DK+SYwDAxYmj2MAH7JPiu69GQa4cmuLsUYGUhIGvsq+yoOg==
X-Received: by 2002:a05:622a:1a10:b0:429:7ca6:5b32 with SMTP id f16-20020a05622a1a1000b004297ca65b32mr4959513qtb.95.1705195087423;
        Sat, 13 Jan 2024 17:18:07 -0800 (PST)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a25:e015:0:b0:dbd:4bb9:7eaa with SMTP id x21-20020a25e015000000b00dbd4bb97eaals2142826ybg.0.-pod-prod-09-us;
 Sat, 13 Jan 2024 17:18:06 -0800 (PST)
X-Received: by 2002:a25:d688:0:b0:dbd:f0c7:8926 with SMTP id n130-20020a25d688000000b00dbdf0c78926mr1396445ybg.7.1705195085948;
        Sat, 13 Jan 2024 17:18:05 -0800 (PST)
Date: Sat, 13 Jan 2024 17:18:05 -0800 (PST)
From: =?UTF-8?Q?Michele_Pescap=C3=A8?= <mic.pescape@gmail.com>
To: Jailhouse <jailhouse-dev@googlegroups.com>
Message-Id: <6146e208-1e8c-4335-abaf-9a2be8c85be5n@googlegroups.com>
In-Reply-To: <b13f671c-b870-48b1-8f39-d5eae43c7a5b@oth-regensburg.de>
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
Subject: Re: Unable to start non root linux cell
MIME-Version: 1.0
Content-Type: multipart/mixed; 
	boundary="----=_Part_65710_172135626.1705195085223"
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

------=_Part_65710_172135626.1705195085223
Content-Type: multipart/alternative; 
	boundary="----=_Part_65711_821933419.1705195085223"

------=_Part_65711_821933419.1705195085223
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi,

There were PIO writes to ports 4e,4f,2e and 2f, each of size 1 and each one=
=20
on subsequent restarts. I'm not sure how to figure out what they belong to.

CONFIG_ISA_DMA_API is already disabled.

I missed the irqchip for the uart. However as of right now I just copied=20
the whole fragment from the root configuration which means I could be=20
taking away other interrupts from the root cell, I still have to figure out=
=20
how to tune that

/* IOAPIC 13, GSI base 0 */
{
.address =3D 0xfec00000,
.id =3D 0xa0,
.pin_bitmap =3D {
0xffffffff, 0xffffffff, 0xffffffff, 0xffffffff
},
},

Still, now I can finally login into the non root linux.

Thanks,
Michele

Il giorno sabato 13 gennaio 2024 alle 21:09:28 UTC+1 Ralf Ramsauer ha=20
scritto:

> Hi Michele,
>
> On 13/01/2024 18:08, Michele Pescap=C3=A8 wrote:
> > Hi,
> >=20
> > The problem was that the ram regions in the non root configuration=20
> > weren't detected as such because of the missing JAILHOUSE_MEM_DMA flag.=
=20
>
> Yikes, makes sense.
>
> > After adding that, I also had to add two pio_regions because the non=20
> > root linux was crashing because of two ports which aren't present in=20
> > /proc/ioports.
>
> Uhm - which PIO ports? Don't simply assign PIO ports. There must be a=20
> reason for them. What ports did crash?
>
> Did you disable(!) CONFIG_ISA_DMA_API? Please disable it. Therefore, you=
=20
> have to activate CONFIG_EXPERT first.
>
> I *bet* it was i8237=E2=80=A6
>
> > I also had to add mce=3Doff to the command line because i had an unhand=
led=20
>
> or disable CONFIG_X86_MCE.
>
> > MSR error, I'll have to disable that in the kernel config.
> > At this point the non root linux seems to start, I see the boot log. No=
=20
>
> Excellent!
>
> > way of interacting with it as there is not a login prompt or anything, =
I=20
> > think I need to ssh to the cell at this point, right?
>
> Was the initramdisk loaded correctly?
>
> Did you assign - in your non-root cell config - the irqchip and the=20
> corresponding interrupts of the uart?
>
> > That means I'll now need to work on those ivshmem net devices.
>
> If you need ivshmem, then this would be the next step.
>
> Ralf
>
> >=20
> > Thanks,
> > Michele
> >=20
> > Il giorno sabato 13 gennaio 2024 alle 15:13:12 UTC+1 Ralf Ramsauer ha=
=20
> > scritto:
> >=20
> > Hi,
> >=20
> > On 13/01/2024 12:28, Michele Pescap=C3=A8 wrote:
> > > Hi,
> > >
> > > You are right, I got confused about those addresses, my bad. At
> > least
> > > now I know that config is the correct one and I don't have to tinker
> > > with it.
> > > I'm back to a kernel panic from the inmate when booting the cell.
> > It's
> > > similar to the one I had earlier, not sure yet of what the
> > problem may be.
> >=20
> > Great, we're a step further.
> >=20
> > >
> > > Created cell "linux-2"
> > > Page pool usage after cell creation: mem 406/32211, remap
> > 16392/131072
> > > Cell "linux-2" can be loaded
> > > CPU 9 received SIPI, vector 100
> > > Started cell "linux-2"
> > > CPU 8 received SIPI, vector 100
> > > No EFI environment detected.
> > > early console in extract_kernel
> > > input_data: 0x000000000275c308
> > > input_len: 0x00000000008b0981
> > > output: 0x0000000001000000
> > > output_len: 0x0000000001fccb30
> > > kernel_total_size: 0x0000000001e28000
> > > needed_size: 0x0000000002000000
> > > trampoline_32bit: 0x000000000009d000
> > >
> > > Decompressing Linux... Parsing ELF... done.
> > > Booting the kernel.
> > > [    0.000000] Linux version 6.2.0-rc3 (root@mp-LINUX-DESKTOP)
> > > (x86_64-buildroot       -linux-gnu-gcc.br_real (Buildroot 2023.11)
> > > 12.3.0, GNU ld (GNU Binutils) 2.40) #       2 SMP PREEMPT_DYNAMIC
> > Fri
> > > Jan 12 17:36:57 CET 2024
> > > [    0.000000] Command line: earlyprintk=3DttyS0,115200
> > > [    0.000000] KERNEL supported cpus:
> > > [    0.000000]   Intel GenuineIntel
> > > [    0.000000]   AMD AuthenticAMD
> > > [    0.000000] x86/fpu: Supporting XSAVE feature 0x001: 'x87
> > floating
> > > point regi       sters'
> > > [    0.000000] x86/fpu: Supporting XSAVE feature 0x002: 'SSE
> > registers'
> > > [    0.000000] x86/fpu: Supporting XSAVE feature 0x004: 'AVX
> > registers'
> > > [    0.000000] x86/fpu: xstate_offset[2]:  576, xstate_sizes[2]:
> >  256
> > > [    0.000000] x86/fpu: Enabled xstate features 0x7, context size
> > is 832
> > > bytes,        using 'compacted' format.
> > > [    0.000000] signal: max sigframe size: 1360
> > > [    0.000000] BIOS-provided physical RAM map:
> > > [    0.000000] BIOS-e801: [mem
> > 0x0000000000000000-0x000000000009efff] usable
> >=20
> > Okay, here should be all memory regions listed. My non-root Linux in my
> > Qemu VM, for example, shows here:
> >=20
> > [ 0.000000] BIOS-provided physical RAM map:
> > [ 0.000000] BIOS-e820: [mem 0x0000000000000000-0x00000000000fffff]
> > usable
> > [ 0.000000] BIOS-e820: [mem 0x0000000000100000-0x0000000000100fff]
> > reserved
> > [ 0.000000] BIOS-e820: [mem 0x0000000000200000-0x00000000048fffff]
> > usable
> >=20
> > Are you absolutely sure, that you have no further modifications in
> > Jailhouse or the Linux loader?
> >=20
> > Actually, in your case, there should be e820 as well (instead of e801).
> > Go to the Linux kernel sources, have a look at
> > arch/x86/kernel/e820.c:1279
> >=20
> > and Jailhouse's jailhouse-cell-linux:638.
> >=20
> > jailhouse-cell-linux fills information of all memory regions into the
> > zero page. Would you please instrument code (Linux/Jailhouse) to see
> > where those regions are not parsed?
> >=20
> > > [    0.000000] printk: bootconsole [earlyser0] enabled
> > > [    0.000000] NX (Execute Disable) protection: active
> > > [    0.000000] extended physical RAM map:
> > > [    0.000000] reserve setup_data: [mem
> > > 0x0000000000000000-0x0000000000001fff] u       sable
> > > [    0.000000] reserve setup_data: [mem
> > > 0x0000000000002000-0x000000000000212b] u       sable
> > > [    0.000000] reserve setup_data: [mem
> > > 0x000000000000212c-0x000000000009efff] u       sable
> > > [    0.000000] DMI not present or invalid.
> > > [    0.000000] Hypervisor detected: Jailhouse
> >=20
> > Just guessing loud: Hmm, you have guest support enabled, that's not the
> > issue.
> >=20
> > > [    0.000000] tsc: Detected 3393.624 MHz processor
> > > [    0.000017] .text .data .bss are not marked as E820_TYPE_RAM!
> >=20
> > Here's the next error that makes me curious, why you system falls back
> > to E801...
> >=20
> > > [    0.005745] last_pfn =3D 0x2e28 max_arch_pfn =3D 0x400000000
> > > [    0.011025] x86/PAT: PAT support disabled because
> > CONFIG_X86_PAT is
> > > disabled        in the kernel.
> >=20
> > Please enable CONFIG_X86_PAT and MTRR in your kernel.
> >=20
> > > [    0.019362] x86/PAT: Configuration [0-7]: WB  WT  UC- UC  WB
> >  WT  UC- UC
> > > [    0.034867] Using GB pages for direct mapping
> > > [    0.039193] Kernel panic - not syncing: alloc_low_pages: can not
> > > alloc memory
> >=20
> > Yeah, that's the logical aftereffect after the errors above.
> >=20
> > Thanks,
> > Ralf
> >=20
> > > [    0.046183] CPU: 0 PID: 0 Comm: swapper Not tainted 6.2.0-rc3 #2
> > > [    0.052176] Call Trace:
> > > [    0.054606]  <TASK>
> > > [    0.056691]  ? dump_stack_lvl+0x33/0x4e
> > > [    0.060510]  ? panic+0x157/0x303
> > > [    0.063723]  ? sprintf+0x56/0x80
> > > [    0.066936]  ? alloc_low_pages+0x70/0x1a0
> > > [    0.070930]  ? phys_pmd_init+0x1fc/0x2eb
> > > [    0.074839]  ? phys_pud_init+0x116/0x2d3
> > > [    0.078744]  ? __kernel_physical_mapping_init+0x11a/0x290
> > > [    0.084128]  ? init_memory_mapping+0x25e/0x3b0
> > > [    0.088558]  ? init_range_memory_mapping+0xe7/0x145
> > > [    0.093417]  ? init_mem_mapping+0x242/0x298
> > > [    0.097585]  ? setup_arch+0x74e/0xcbd
> > > [    0.101231]  ? start_kernel+0x66/0x8b7
> > > [    0.104965]  ? load_ucode_bsp+0x43/0x11b
> > > [    0.108873]  ? secondary_startup_64_no_verify+0xe0/0xeb
> > > [    0.114085]  </TASK>
> > > [    0.116255] ---[ end Kernel panic - not syncing:
> > alloc_low_pages: can
> > > not all       oc memory ]---
> > >
> > >
> > > Thank you for your continuous support,
> > > Michele
> > >
> > > Il giorno sabato 13 gennaio 2024 alle 00:05:43 UTC+1 Ralf
> > Ramsauer ha
> > > scritto:
> > >
> > > Hi Michele,
> > >
> > > On 12/01/2024 14:07, Michele Pescap=C3=A8 wrote:
> > > > jailhouse cell load linux-2 linux-loader.bin -a 0x0
> > > > ../buildroot-2023.11/output/images/bzImage -a 0xffbe00 parameters
> > > -a 0x1000
> > > > jailhouse cell start linux-2
> > > >
> > > > I take it the kernel is loaded at 0xffbe00 which is right at the
> > > edge of
> > > > the low ram region. In fact after issuing the cell load command
> > and
> > > > adjusting the path for the loader I get JAILHOUSE_CELL_LOAD:
> > Invalid
> > > > argument.
> > >
> > > Just tested cell-linux in a qemu machine, there it works, with
> > pretty
> > > similar addresses, which got me confused.
> > >
> > > After double-checking it: 0xffb.e00 is *not* at the edge of low mem:
> > >
> > > Low mem is 0x000.000 -- 0x0ff.fff
> > > Comm region is 0x100.000 -- 0x100.fff
> > >
> > > 0xffb.e00 is (obviously) way above.
> > >
> > > Please try to set your high mem's .virt_start to 0x200000. Then,
> > > 0xffbe00 is offsetted ~16MB inside your highmem, and it should work!
> > >
> > > IOW:
> > >
> > > /* high RAM */
> > > {
> > > .phys_start =3D 0x42300000,
> > > .virt_start =3D 0x200000,
> > > .size =3D 0x11000000,
> > > .flags =3D JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
> > > JAILHOUSE_MEM_EXECUTE |
> > > JAILHOUSE_MEM_LOADABLE,
> > > },
> > >
> > > Thanks
> > > Ralf
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
> https://groups.google.com/d/msgid/jailhouse-dev/6712361a-eaef-49cc-8a72-7=
9da2c434169n%40googlegroups.com=20
> <
> https://groups.google.com/d/msgid/jailhouse-dev/6712361a-eaef-49cc-8a72-7=
9da2c434169n%40googlegroups.com>=20
> <
> https://groups.google.com/d/msgid/jailhouse-dev/6712361a-eaef-49cc-8a72-7=
9da2c434169n%40googlegroups.com?utm_medium=3Demail&utm_source=3Dfooter=20
> <
> https://groups.google.com/d/msgid/jailhouse-dev/6712361a-eaef-49cc-8a72-7=
9da2c434169n%40googlegroups.com?utm_medium=3Demail&utm_source=3Dfooter
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
> https://groups.google.com/d/msgid/jailhouse-dev/860c1e75-c28f-4157-9212-a=
3d87ad25b27n%40googlegroups.com=20
> <
> https://groups.google.com/d/msgid/jailhouse-dev/860c1e75-c28f-4157-9212-a=
3d87ad25b27n%40googlegroups.com?utm_medium=3Demail&utm_source=3Dfooter
> >.
>

--=20
You received this message because you are subscribed to the Google Groups "=
Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/=
jailhouse-dev/6146e208-1e8c-4335-abaf-9a2be8c85be5n%40googlegroups.com.

------=_Part_65711_821933419.1705195085223
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi,<br /><br />There were PIO writes to ports 4e,4f,2e and 2f, each of size=
 1 and each one on subsequent restarts. I'm not sure how to figure out what=
 they belong to.<br /><br />CONFIG_ISA_DMA_API is already disabled.<br /><b=
r />I missed the irqchip for the uart. However as of right now I just copie=
d the whole fragment from the root configuration which means I could be tak=
ing away other interrupts from the root cell, I still have to figure out ho=
w to tune that<br /><br />/* IOAPIC 13, GSI base 0 */<br />{<br /><span sty=
le=3D"white-space: pre;">	</span>.address =3D 0xfec00000,<br /><span style=
=3D"white-space: pre;">	</span>.id =3D 0xa0,<br /><span style=3D"white-spac=
e: pre;">	</span>.pin_bitmap =3D {<br /><span style=3D"white-space: pre;">	=
	</span>0xffffffff, 0xffffffff, 0xffffffff, 0xffffffff<br /><span style=3D"=
white-space: pre;">	</span>},<br />},<br /><br />Still, now I can finally l=
ogin into the non root linux.<br /><br />Thanks,<br />Michele<br /><br /><d=
iv class=3D"gmail_quote"><div dir=3D"auto" class=3D"gmail_attr">Il giorno s=
abato 13 gennaio 2024 alle 21:09:28 UTC+1 Ralf Ramsauer ha scritto:<br/></d=
iv><blockquote class=3D"gmail_quote" style=3D"margin: 0 0 0 0.8ex; border-l=
eft: 1px solid rgb(204, 204, 204); padding-left: 1ex;">Hi Michele,
<br>
<br>On 13/01/2024 18:08, Michele Pescap=C3=A8 wrote:
<br>&gt; Hi,
<br>&gt;=20
<br>&gt; The problem was that the ram regions in the non root configuration=
=20
<br>&gt; weren&#39;t detected as such because of the missing=C2=A0JAILHOUSE=
_MEM_DMA flag.=20
<br>
<br>Yikes, makes sense.
<br>
<br>&gt; After adding that, I also had to add two pio_regions because the n=
on=20
<br>&gt; root linux was crashing because of two ports which aren&#39;t pres=
ent in=20
<br>&gt; /proc/ioports.
<br>
<br>Uhm - which PIO ports? Don&#39;t simply assign PIO ports. There must be=
 a=20
<br>reason for them. What ports did crash?
<br>
<br>Did you disable(!) CONFIG_ISA_DMA_API? Please disable it. Therefore, yo=
u=20
<br>have to activate CONFIG_EXPERT first.
<br>
<br>I *bet* it was i8237=E2=80=A6
<br>
<br>&gt; I also had to add mce=3Doff to the command line because i had an u=
nhandled=20
<br>
<br>or disable CONFIG_X86_MCE.
<br>
<br>&gt; MSR error, I&#39;ll have to disable that in the kernel config.
<br>&gt; At this point the non root linux seems to start, I see the boot lo=
g. No=20
<br>
<br>Excellent!
<br>
<br>&gt; way of interacting with it as there is not a login prompt or anyth=
ing, I=20
<br>&gt; think I need to ssh to the cell at this point, right?
<br>
<br>Was the initramdisk loaded correctly?
<br>
<br>Did you assign - in your non-root cell config - the irqchip and the=20
<br>corresponding interrupts of the uart?
<br>
<br>&gt; That means I&#39;ll now need to work on those ivshmem net devices.
<br>
<br>If you need ivshmem, then this would be the next step.
<br>
<br>   Ralf
<br>
<br>&gt;=20
<br>&gt; Thanks,
<br>&gt; Michele
<br>&gt;=20
<br>&gt; Il giorno sabato 13 gennaio 2024 alle 15:13:12 UTC+1 Ralf Ramsauer=
 ha=20
<br>&gt; scritto:
<br>&gt;=20
<br>&gt;     Hi,
<br>&gt;=20
<br>&gt;     On 13/01/2024 12:28, Michele Pescap=C3=A8 wrote:
<br>&gt;      &gt; Hi,
<br>&gt;      &gt;
<br>&gt;      &gt; You are right, I got confused about those addresses, my =
bad. At
<br>&gt;     least
<br>&gt;      &gt; now I know that config is the correct one and I don&#39;=
t have to tinker
<br>&gt;      &gt; with it.
<br>&gt;      &gt; I&#39;m back to a kernel panic from the inmate when boot=
ing the cell.
<br>&gt;     It&#39;s
<br>&gt;      &gt; similar to the one I had earlier, not sure yet of what t=
he
<br>&gt;     problem may be.
<br>&gt;=20
<br>&gt;     Great, we&#39;re a step further.
<br>&gt;=20
<br>&gt;      &gt;
<br>&gt;      &gt; Created cell &quot;linux-2&quot;
<br>&gt;      &gt; Page pool usage after cell creation: mem 406/32211, rema=
p
<br>&gt;     16392/131072
<br>&gt;      &gt; Cell &quot;linux-2&quot; can be loaded
<br>&gt;      &gt; CPU 9 received SIPI, vector 100
<br>&gt;      &gt; Started cell &quot;linux-2&quot;
<br>&gt;      &gt; CPU 8 received SIPI, vector 100
<br>&gt;      &gt; No EFI environment detected.
<br>&gt;      &gt; early console in extract_kernel
<br>&gt;      &gt; input_data: 0x000000000275c308
<br>&gt;      &gt; input_len: 0x00000000008b0981
<br>&gt;      &gt; output: 0x0000000001000000
<br>&gt;      &gt; output_len: 0x0000000001fccb30
<br>&gt;      &gt; kernel_total_size: 0x0000000001e28000
<br>&gt;      &gt; needed_size: 0x0000000002000000
<br>&gt;      &gt; trampoline_32bit: 0x000000000009d000
<br>&gt;      &gt;
<br>&gt;      &gt; Decompressing Linux... Parsing ELF... done.
<br>&gt;      &gt; Booting the kernel.
<br>&gt;      &gt; [ =C2=A0 =C2=A00.000000] Linux version 6.2.0-rc3 (root@m=
p-LINUX-DESKTOP)
<br>&gt;      &gt; (x86_64-buildroot =C2=A0 =C2=A0 =C2=A0 -linux-gnu-gcc.br=
_real (Buildroot 2023.11)
<br>&gt;      &gt; 12.3.0, GNU ld (GNU Binutils) 2.40) # =C2=A0 =C2=A0 =C2=
=A0 2 SMP PREEMPT_DYNAMIC
<br>&gt;     Fri
<br>&gt;      &gt; Jan 12 17:36:57 CET 2024
<br>&gt;      &gt; [ =C2=A0 =C2=A00.000000] Command line: earlyprintk=3Dtty=
S0,115200
<br>&gt;      &gt; [ =C2=A0 =C2=A00.000000] KERNEL supported cpus:
<br>&gt;      &gt; [ =C2=A0 =C2=A00.000000] =C2=A0 Intel GenuineIntel
<br>&gt;      &gt; [ =C2=A0 =C2=A00.000000] =C2=A0 AMD AuthenticAMD
<br>&gt;      &gt; [ =C2=A0 =C2=A00.000000] x86/fpu: Supporting XSAVE featu=
re 0x001: &#39;x87
<br>&gt;     floating
<br>&gt;      &gt; point regi =C2=A0 =C2=A0 =C2=A0 sters&#39;
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
<br>&gt;      &gt; bytes, =C2=A0 =C2=A0 =C2=A0 =C2=A0using &#39;compacted&#=
39; format.
<br>&gt;      &gt; [ =C2=A0 =C2=A00.000000] signal: max sigframe size: 1360
<br>&gt;      &gt; [ =C2=A0 =C2=A00.000000] BIOS-provided physical RAM map:
<br>&gt;      &gt; [ =C2=A0 =C2=A00.000000] BIOS-e801: [mem
<br>&gt;     0x0000000000000000-0x000000000009efff] usable
<br>&gt;=20
<br>&gt;     Okay, here should be all memory regions listed. My non-root Li=
nux in my
<br>&gt;     Qemu VM, for example, shows here:
<br>&gt;=20
<br>&gt;     [ 0.000000] BIOS-provided physical RAM map:
<br>&gt;     [ 0.000000] BIOS-e820: [mem 0x0000000000000000-0x00000000000ff=
fff]
<br>&gt;     usable
<br>&gt;     [ 0.000000] BIOS-e820: [mem 0x0000000000100000-0x0000000000100=
fff]
<br>&gt;     reserved
<br>&gt;     [ 0.000000] BIOS-e820: [mem 0x0000000000200000-0x00000000048ff=
fff]
<br>&gt;     usable
<br>&gt;=20
<br>&gt;     Are you absolutely sure, that you have no further modification=
s in
<br>&gt;     Jailhouse or the Linux loader?
<br>&gt;=20
<br>&gt;     Actually, in your case, there should be e820 as well (instead =
of e801).
<br>&gt;     Go to the Linux kernel sources, have a look at
<br>&gt;     arch/x86/kernel/e820.c:1279
<br>&gt;=20
<br>&gt;     and Jailhouse&#39;s jailhouse-cell-linux:638.
<br>&gt;=20
<br>&gt;     jailhouse-cell-linux fills information of all memory regions i=
nto the
<br>&gt;     zero page. Would you please instrument code (Linux/Jailhouse) =
to see
<br>&gt;     where those regions are not parsed?
<br>&gt;=20
<br>&gt;      &gt; [ =C2=A0 =C2=A00.000000] printk: bootconsole [earlyser0]=
 enabled
<br>&gt;      &gt; [ =C2=A0 =C2=A00.000000] NX (Execute Disable) protection=
: active
<br>&gt;      &gt; [ =C2=A0 =C2=A00.000000] extended physical RAM map:
<br>&gt;      &gt; [ =C2=A0 =C2=A00.000000] reserve setup_data: [mem
<br>&gt;      &gt; 0x0000000000000000-0x0000000000001fff] u =C2=A0 =C2=A0 =
=C2=A0 sable
<br>&gt;      &gt; [ =C2=A0 =C2=A00.000000] reserve setup_data: [mem
<br>&gt;      &gt; 0x0000000000002000-0x000000000000212b] u =C2=A0 =C2=A0 =
=C2=A0 sable
<br>&gt;      &gt; [ =C2=A0 =C2=A00.000000] reserve setup_data: [mem
<br>&gt;      &gt; 0x000000000000212c-0x000000000009efff] u =C2=A0 =C2=A0 =
=C2=A0 sable
<br>&gt;      &gt; [ =C2=A0 =C2=A00.000000] DMI not present or invalid.
<br>&gt;      &gt; [ =C2=A0 =C2=A00.000000] Hypervisor detected: Jailhouse
<br>&gt;=20
<br>&gt;     Just guessing loud: Hmm, you have guest support enabled, that&=
#39;s not the
<br>&gt;     issue.
<br>&gt;=20
<br>&gt;      &gt; [ =C2=A0 =C2=A00.000000] tsc: Detected 3393.624 MHz proc=
essor
<br>&gt;      &gt; [ =C2=A0 =C2=A00.000017] .text .data .bss are not marked=
 as E820_TYPE_RAM!
<br>&gt;=20
<br>&gt;     Here&#39;s the next error that makes me curious, why you syste=
m falls back
<br>&gt;     to E801...
<br>&gt;=20
<br>&gt;      &gt; [ =C2=A0 =C2=A00.005745] last_pfn =3D 0x2e28 max_arch_pf=
n =3D 0x400000000
<br>&gt;      &gt; [ =C2=A0 =C2=A00.011025] x86/PAT: PAT support disabled b=
ecause
<br>&gt;     CONFIG_X86_PAT is
<br>&gt;      &gt; disabled =C2=A0 =C2=A0 =C2=A0 =C2=A0in the kernel.
<br>&gt;=20
<br>&gt;     Please enable CONFIG_X86_PAT and MTRR in your kernel.
<br>&gt;=20
<br>&gt;      &gt; [ =C2=A0 =C2=A00.019362] x86/PAT: Configuration [0-7]: W=
B =C2=A0WT =C2=A0UC- UC =C2=A0WB
<br>&gt;      =C2=A0WT =C2=A0UC- UC
<br>&gt;      &gt; [ =C2=A0 =C2=A00.034867] Using GB pages for direct mappi=
ng
<br>&gt;      &gt; [ =C2=A0 =C2=A00.039193] Kernel panic - not syncing: all=
oc_low_pages: can not
<br>&gt;      &gt; alloc memory
<br>&gt;=20
<br>&gt;     Yeah, that&#39;s the logical aftereffect after the errors abov=
e.
<br>&gt;=20
<br>&gt;     Thanks,
<br>&gt;     Ralf
<br>&gt;=20
<br>&gt;      &gt; [ =C2=A0 =C2=A00.046183] CPU: 0 PID: 0 Comm: swapper Not=
 tainted 6.2.0-rc3 #2
<br>&gt;      &gt; [ =C2=A0 =C2=A00.052176] Call Trace:
<br>&gt;      &gt; [ =C2=A0 =C2=A00.054606] =C2=A0&lt;TASK&gt;
<br>&gt;      &gt; [ =C2=A0 =C2=A00.056691] =C2=A0? dump_stack_lvl+0x33/0x4=
e
<br>&gt;      &gt; [ =C2=A0 =C2=A00.060510] =C2=A0? panic+0x157/0x303
<br>&gt;      &gt; [ =C2=A0 =C2=A00.063723] =C2=A0? sprintf+0x56/0x80
<br>&gt;      &gt; [ =C2=A0 =C2=A00.066936] =C2=A0? alloc_low_pages+0x70/0x=
1a0
<br>&gt;      &gt; [ =C2=A0 =C2=A00.070930] =C2=A0? phys_pmd_init+0x1fc/0x2=
eb
<br>&gt;      &gt; [ =C2=A0 =C2=A00.074839] =C2=A0? phys_pud_init+0x116/0x2=
d3
<br>&gt;      &gt; [ =C2=A0 =C2=A00.078744] =C2=A0? __kernel_physical_mappi=
ng_init+0x11a/0x290
<br>&gt;      &gt; [ =C2=A0 =C2=A00.084128] =C2=A0? init_memory_mapping+0x2=
5e/0x3b0
<br>&gt;      &gt; [ =C2=A0 =C2=A00.088558] =C2=A0? init_range_memory_mappi=
ng+0xe7/0x145
<br>&gt;      &gt; [ =C2=A0 =C2=A00.093417] =C2=A0? init_mem_mapping+0x242/=
0x298
<br>&gt;      &gt; [ =C2=A0 =C2=A00.097585] =C2=A0? setup_arch+0x74e/0xcbd
<br>&gt;      &gt; [ =C2=A0 =C2=A00.101231] =C2=A0? start_kernel+0x66/0x8b7
<br>&gt;      &gt; [ =C2=A0 =C2=A00.104965] =C2=A0? load_ucode_bsp+0x43/0x1=
1b
<br>&gt;      &gt; [ =C2=A0 =C2=A00.108873] =C2=A0? secondary_startup_64_no=
_verify+0xe0/0xeb
<br>&gt;      &gt; [ =C2=A0 =C2=A00.114085] =C2=A0&lt;/TASK&gt;
<br>&gt;      &gt; [ =C2=A0 =C2=A00.116255] ---[ end Kernel panic - not syn=
cing:
<br>&gt;     alloc_low_pages: can
<br>&gt;      &gt; not all =C2=A0 =C2=A0 =C2=A0 oc memory ]---
<br>&gt;      &gt;
<br>&gt;      &gt;
<br>&gt;      &gt; Thank you for your continuous support,
<br>&gt;      &gt; Michele
<br>&gt;      &gt;
<br>&gt;      &gt; Il giorno sabato 13 gennaio 2024 alle 00:05:43 UTC+1 Ral=
f
<br>&gt;     Ramsauer ha
<br>&gt;      &gt; scritto:
<br>&gt;      &gt;
<br>&gt;      &gt; Hi Michele,
<br>&gt;      &gt;
<br>&gt;      &gt; On 12/01/2024 14:07, Michele Pescap=C3=A8 wrote:
<br>&gt;      &gt; &gt; jailhouse cell load linux-2 linux-loader.bin -a 0x0
<br>&gt;      &gt; &gt; ../buildroot-2023.11/output/images/bzImage -a 0xffb=
e00 parameters
<br>&gt;      &gt; -a 0x1000
<br>&gt;      &gt; &gt; jailhouse cell start linux-2
<br>&gt;      &gt; &gt;
<br>&gt;      &gt; &gt; I take it the kernel is loaded at 0xffbe00 which is=
 right at the
<br>&gt;      &gt; edge of
<br>&gt;      &gt; &gt; the low ram region. In fact after issuing the cell =
load command
<br>&gt;     and
<br>&gt;      &gt; &gt; adjusting the path for the loader I get JAILHOUSE_C=
ELL_LOAD:
<br>&gt;     Invalid
<br>&gt;      &gt; &gt; argument.
<br>&gt;      &gt;
<br>&gt;      &gt; Just tested cell-linux in a qemu machine, there it works=
, with
<br>&gt;     pretty
<br>&gt;      &gt; similar addresses, which got me confused.
<br>&gt;      &gt;
<br>&gt;      &gt; After double-checking it: 0xffb.e00 is *not* at the edge=
 of low mem:
<br>&gt;      &gt;
<br>&gt;      &gt; Low mem is 0x000.000 -- 0x0ff.fff
<br>&gt;      &gt; Comm region is 0x100.000 -- 0x100.fff
<br>&gt;      &gt;
<br>&gt;      &gt; 0xffb.e00 is (obviously) way above.
<br>&gt;      &gt;
<br>&gt;      &gt; Please try to set your high mem&#39;s .virt_start to 0x2=
00000. Then,
<br>&gt;      &gt; 0xffbe00 is offsetted ~16MB inside your highmem, and it =
should work!
<br>&gt;      &gt;
<br>&gt;      &gt; IOW:
<br>&gt;      &gt;
<br>&gt;      &gt; /* high RAM */
<br>&gt;      &gt; {
<br>&gt;      &gt; .phys_start =3D 0x42300000,
<br>&gt;      &gt; .virt_start =3D 0x200000,
<br>&gt;      &gt; .size =3D 0x11000000,
<br>&gt;      &gt; .flags =3D JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
<br>&gt;      &gt; JAILHOUSE_MEM_EXECUTE |
<br>&gt;      &gt; JAILHOUSE_MEM_LOADABLE,
<br>&gt;      &gt; },
<br>&gt;      &gt;
<br>&gt;      &gt; Thanks
<br>&gt;      &gt; Ralf
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
<br>&gt;     <a href=3D"https://groups.google.com/d/msgid/jailhouse-dev/671=
2361a-eaef-49cc-8a72-79da2c434169n%40googlegroups.com" target=3D"_blank" re=
l=3D"nofollow" data-saferedirecturl=3D"https://www.google.com/url?hl=3Dit&a=
mp;q=3Dhttps://groups.google.com/d/msgid/jailhouse-dev/6712361a-eaef-49cc-8=
a72-79da2c434169n%2540googlegroups.com&amp;source=3Dgmail&amp;ust=3D1705270=
308836000&amp;usg=3DAOvVaw1riurtSWSoi6S32fTJhLpA">https://groups.google.com=
/d/msgid/jailhouse-dev/6712361a-eaef-49cc-8a72-79da2c434169n%40googlegroups=
.com</a> &lt;<a href=3D"https://groups.google.com/d/msgid/jailhouse-dev/671=
2361a-eaef-49cc-8a72-79da2c434169n%40googlegroups.com" target=3D"_blank" re=
l=3D"nofollow" data-saferedirecturl=3D"https://www.google.com/url?hl=3Dit&a=
mp;q=3Dhttps://groups.google.com/d/msgid/jailhouse-dev/6712361a-eaef-49cc-8=
a72-79da2c434169n%2540googlegroups.com&amp;source=3Dgmail&amp;ust=3D1705270=
308836000&amp;usg=3DAOvVaw1riurtSWSoi6S32fTJhLpA">https://groups.google.com=
/d/msgid/jailhouse-dev/6712361a-eaef-49cc-8a72-79da2c434169n%40googlegroups=
.com</a>&gt; &lt;<a href=3D"https://groups.google.com/d/msgid/jailhouse-dev=
/6712361a-eaef-49cc-8a72-79da2c434169n%40googlegroups.com?utm_medium=3Demai=
l&amp;utm_source=3Dfooter" target=3D"_blank" rel=3D"nofollow" data-saferedi=
recturl=3D"https://www.google.com/url?hl=3Dit&amp;q=3Dhttps://groups.google=
.com/d/msgid/jailhouse-dev/6712361a-eaef-49cc-8a72-79da2c434169n%2540google=
groups.com?utm_medium%3Demail%26utm_source%3Dfooter&amp;source=3Dgmail&amp;=
ust=3D1705270308837000&amp;usg=3DAOvVaw3GVm2Cnfc6OEpT6WNOcw6c">https://grou=
ps.google.com/d/msgid/jailhouse-dev/6712361a-eaef-49cc-8a72-79da2c434169n%4=
0googlegroups.com?utm_medium=3Demail&amp;utm_source=3Dfooter</a> &lt;<a hre=
f=3D"https://groups.google.com/d/msgid/jailhouse-dev/6712361a-eaef-49cc-8a7=
2-79da2c434169n%40googlegroups.com?utm_medium=3Demail&amp;utm_source=3Dfoot=
er" target=3D"_blank" rel=3D"nofollow" data-saferedirecturl=3D"https://www.=
google.com/url?hl=3Dit&amp;q=3Dhttps://groups.google.com/d/msgid/jailhouse-=
dev/6712361a-eaef-49cc-8a72-79da2c434169n%2540googlegroups.com?utm_medium%3=
Demail%26utm_source%3Dfooter&amp;source=3Dgmail&amp;ust=3D1705270308837000&=
amp;usg=3DAOvVaw3GVm2Cnfc6OEpT6WNOcw6c">https://groups.google.com/d/msgid/j=
ailhouse-dev/6712361a-eaef-49cc-8a72-79da2c434169n%40googlegroups.com?utm_m=
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
<br>&gt; <a href=3D"https://groups.google.com/d/msgid/jailhouse-dev/860c1e7=
5-c28f-4157-9212-a3d87ad25b27n%40googlegroups.com" target=3D"_blank" rel=3D=
"nofollow" data-saferedirecturl=3D"https://www.google.com/url?hl=3Dit&amp;q=
=3Dhttps://groups.google.com/d/msgid/jailhouse-dev/860c1e75-c28f-4157-9212-=
a3d87ad25b27n%2540googlegroups.com&amp;source=3Dgmail&amp;ust=3D17052703088=
37000&amp;usg=3DAOvVaw2jjEFJs2YXUOl6_sQ3NZgV">https://groups.google.com/d/m=
sgid/jailhouse-dev/860c1e75-c28f-4157-9212-a3d87ad25b27n%40googlegroups.com=
</a> &lt;<a href=3D"https://groups.google.com/d/msgid/jailhouse-dev/860c1e7=
5-c28f-4157-9212-a3d87ad25b27n%40googlegroups.com?utm_medium=3Demail&amp;ut=
m_source=3Dfooter" target=3D"_blank" rel=3D"nofollow" data-saferedirecturl=
=3D"https://www.google.com/url?hl=3Dit&amp;q=3Dhttps://groups.google.com/d/=
msgid/jailhouse-dev/860c1e75-c28f-4157-9212-a3d87ad25b27n%2540googlegroups.=
com?utm_medium%3Demail%26utm_source%3Dfooter&amp;source=3Dgmail&amp;ust=3D1=
705270308837000&amp;usg=3DAOvVaw1JpVdhFAQLs5xqbk5_qqTy">https://groups.goog=
le.com/d/msgid/jailhouse-dev/860c1e75-c28f-4157-9212-a3d87ad25b27n%40google=
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
om/d/msgid/jailhouse-dev/6146e208-1e8c-4335-abaf-9a2be8c85be5n%40googlegrou=
ps.com?utm_medium=3Demail&utm_source=3Dfooter">https://groups.google.com/d/=
msgid/jailhouse-dev/6146e208-1e8c-4335-abaf-9a2be8c85be5n%40googlegroups.co=
m</a>.<br />

------=_Part_65711_821933419.1705195085223--

------=_Part_65710_172135626.1705195085223--
