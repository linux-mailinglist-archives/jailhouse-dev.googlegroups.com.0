Return-Path: <jailhouse-dev+bncBDIJ36FET4JRBDEHROWQMGQEOIWZZII@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-yw1-x113e.google.com (mail-yw1-x113e.google.com [IPv6:2607:f8b0:4864:20::113e])
	by mail.lfdr.de (Postfix) with ESMTPS id D4A5182CDD3
	for <lists+jailhouse-dev@lfdr.de>; Sat, 13 Jan 2024 18:08:30 +0100 (CET)
Received: by mail-yw1-x113e.google.com with SMTP id 00721157ae682-5eba564eb3fsf137425157b3.1
        for <lists+jailhouse-dev@lfdr.de>; Sat, 13 Jan 2024 09:08:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20230601; t=1705165709; x=1705770509; darn=lfdr.de;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:x-original-sender:mime-version
         :subject:references:in-reply-to:message-id:to:from:date:sender:from
         :to:cc:subject:date:message-id:reply-to;
        bh=OdASEzRk5wLYC64anixOT29VxAlavsZz3rAPVUYuDY0=;
        b=xIifUjFm3ga0vtFevk/GbNx0p0hGLfMKf11UZTao4O7HjScEVsmSU3+aD8Ce1emgbu
         MFqxBh0C4/YRJLZLUnsGJCy948KNz+5ELIpN6X6V5hnfEGC7VphjQbhUlCcLaEkZnGP8
         PvytZ7nmVzqKpFl7s2XeYtfRpc9BVlA62VEfmY6eqCExvvF7qOd9L6qvTN+bNmm8wxVd
         1Pl0o9dr+j2ve20WkGRanBxRJprTwk9j6OYODKCDHgj4hbSjHeD5PNz3y72U3g6teIt0
         3V3SxuACxHTSd20rfM4rKUVJfZE1voQ6nRT7A6ZtciT4Hz5Iw0LtIR4b4nhNzL9FaB41
         lrmg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1705165709; x=1705770509; darn=lfdr.de;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:x-original-sender:mime-version
         :subject:references:in-reply-to:message-id:to:from:date:from:to:cc
         :subject:date:message-id:reply-to;
        bh=OdASEzRk5wLYC64anixOT29VxAlavsZz3rAPVUYuDY0=;
        b=X4OWzT9/RxoFaK7L2Evb4XOxUoFUnc0adp+an4MkfpqPL3v20y/xGfTh5JCd7NhRcT
         R/uuHrtf1G0CgVBE8COZBpj6zsZPHBmZ1mViwIgnxYRBkNAIfQz8gOfVPw0CFI+UxKCC
         cFSkg4t1ha+YOQkOKYEdLmgjaQJpQx5I94Zb6c6aUqAc1tHF7vzsyS0NISVEa/6k8yYf
         N3k6sQqnAYefr8zaQUat1fTEBf2SVLELoO5vkLB9UpbVbcVQPehO1VtDc1BEQWNclr6s
         F4XVY1f7MSkh10clendFuMNFamBtTSpqbcbVEnBs9+jNvQRA6NNLd8UfKZ5NWi5AQ61q
         ontg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1705165709; x=1705770509;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :x-spam-checked-in-group:list-id:mailing-list:precedence
         :x-original-sender:mime-version:subject:references:in-reply-to
         :message-id:to:from:date:x-beenthere:x-gm-message-state:sender:from
         :to:cc:subject:date:message-id:reply-to;
        bh=OdASEzRk5wLYC64anixOT29VxAlavsZz3rAPVUYuDY0=;
        b=n7lQcnetzSmFAxsbw8OFf36Htad8PtNYLcuqnXfNKPXEB6hgjcpBrYUTMPIC5QeIKu
         GUAPu83H/usflZ/a/w7RYVt6hcKx+3cJHHQS40QTb1yxnVuQUSrWCfW9fcIi4m17Rcin
         wjcY5YCUmVKvILl4Hhws9ujtGcvOOn7pFug3ygCFTYvEVwe2uXsIjYloxNCUFoiktS1E
         W3/wRd+u2/J33IHaVjPO0pxg6D5yU5wupotec2hc49B7z7qS2qwcx7HKdF6wqmI7ZUEI
         akBfBML/ZncGixVxcJnQxCmzdaA6XnU70hTRoCnUDZzhyZeItazPXQIBM0xJx6fHPdFP
         PVWw==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AOJu0YzOrCU6K5WOQM8XLLSJgoyd+4K+9nHm3oz+47J3nkqx0kcvbEJD
	6ObEOvRuexBp1Y0DeeztgvU=
X-Google-Smtp-Source: AGHT+IFhQGF14elprd7faJJUkHjfu409JfPG9RKjps4wcCMgngAMINGrtImchfGA/vOi+RmpHodtzA==
X-Received: by 2002:a25:dcc5:0:b0:dbe:32a8:12b2 with SMTP id y188-20020a25dcc5000000b00dbe32a812b2mr1550613ybe.106.1705165709203;
        Sat, 13 Jan 2024 09:08:29 -0800 (PST)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a25:d743:0:b0:dbf:3bab:286c with SMTP id o64-20020a25d743000000b00dbf3bab286cls2096693ybg.2.-pod-prod-09-us;
 Sat, 13 Jan 2024 09:08:27 -0800 (PST)
X-Received: by 2002:a25:d688:0:b0:dbd:f0c7:8926 with SMTP id n130-20020a25d688000000b00dbdf0c78926mr1153945ybg.7.1705165707474;
        Sat, 13 Jan 2024 09:08:27 -0800 (PST)
Date: Sat, 13 Jan 2024 09:08:26 -0800 (PST)
From: =?UTF-8?Q?Michele_Pescap=C3=A8?= <mic.pescape@gmail.com>
To: Jailhouse <jailhouse-dev@googlegroups.com>
Message-Id: <860c1e75-c28f-4157-9212-a3d87ad25b27n@googlegroups.com>
In-Reply-To: <b4520b71-86ba-48e7-b9ad-c720c4f6cb42@oth-regensburg.de>
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
Subject: Re: Unable to start non root linux cell
MIME-Version: 1.0
Content-Type: multipart/mixed; 
	boundary="----=_Part_13990_779768704.1705165706647"
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

------=_Part_13990_779768704.1705165706647
Content-Type: multipart/alternative; 
	boundary="----=_Part_13991_1367638801.1705165706647"

------=_Part_13991_1367638801.1705165706647
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi,

The problem was that the ram regions in the non root configuration weren't=
=20
detected as such because of the missing JAILHOUSE_MEM_DMA flag. After=20
adding that, I also had to add two pio_regions because the non root linux=
=20
was crashing because of two ports which aren't present in /proc/ioports.=20
I also had to add mce=3Doff to the command line because i had an unhandled=
=20
MSR error, I'll have to disable that in the kernel config.
At this point the non root linux seems to start, I see the boot log. No way=
=20
of interacting with it as there is not a login prompt or anything, I think=
=20
I need to ssh to the cell at this point, right?
That means I'll now need to work on those ivshmem net devices.

Thanks,
Michele

Il giorno sabato 13 gennaio 2024 alle 15:13:12 UTC+1 Ralf Ramsauer ha=20
scritto:

> Hi,
>
> On 13/01/2024 12:28, Michele Pescap=C3=A8 wrote:
> > Hi,
> >=20
> > You are right, I got confused about those addresses, my bad. At least=
=20
> > now I know that config is the correct one and I don't have to tinker=20
> > with it.
> > I'm back to a kernel panic from the inmate when booting the cell. It's=
=20
> > similar to the one I had earlier, not sure yet of what the problem may=
=20
> be.
>
> Great, we're a step further.
>
> >=20
> > Created cell "linux-2"
> > Page pool usage after cell creation: mem 406/32211, remap 16392/131072
> > Cell "linux-2" can be loaded
> > CPU 9 received SIPI, vector 100
> > Started cell "linux-2"
> > CPU 8 received SIPI, vector 100
> > No EFI environment detected.
> > early console in extract_kernel
> > input_data: 0x000000000275c308
> > input_len: 0x00000000008b0981
> > output: 0x0000000001000000
> > output_len: 0x0000000001fccb30
> > kernel_total_size: 0x0000000001e28000
> > needed_size: 0x0000000002000000
> > trampoline_32bit: 0x000000000009d000
> >=20
> > Decompressing Linux... Parsing ELF... done.
> > Booting the kernel.
> > [    0.000000] Linux version 6.2.0-rc3 (root@mp-LINUX-DESKTOP)=20
> > (x86_64-buildroot       -linux-gnu-gcc.br_real (Buildroot 2023.11)=20
> > 12.3.0, GNU ld (GNU Binutils) 2.40) #       2 SMP PREEMPT_DYNAMIC Fri=
=20
> > Jan 12 17:36:57 CET 2024
> > [    0.000000] Command line: earlyprintk=3DttyS0,115200
> > [    0.000000] KERNEL supported cpus:
> > [    0.000000]   Intel GenuineIntel
> > [    0.000000]   AMD AuthenticAMD
> > [    0.000000] x86/fpu: Supporting XSAVE feature 0x001: 'x87 floating=
=20
> > point regi       sters'
> > [    0.000000] x86/fpu: Supporting XSAVE feature 0x002: 'SSE registers'
> > [    0.000000] x86/fpu: Supporting XSAVE feature 0x004: 'AVX registers'
> > [    0.000000] x86/fpu: xstate_offset[2]:  576, xstate_sizes[2]:  256
> > [    0.000000] x86/fpu: Enabled xstate features 0x7, context size is 83=
2=20
> > bytes,        using 'compacted' format.
> > [    0.000000] signal: max sigframe size: 1360
> > [    0.000000] BIOS-provided physical RAM map:
> > [    0.000000] BIOS-e801: [mem 0x0000000000000000-0x000000000009efff]=
=20
> usable
>
> Okay, here should be all memory regions listed. My non-root Linux in my=
=20
> Qemu VM, for example, shows here:
>
> [ 0.000000] BIOS-provided physical RAM map:
> [ 0.000000] BIOS-e820: [mem 0x0000000000000000-0x00000000000fffff] usable
> [ 0.000000] BIOS-e820: [mem 0x0000000000100000-0x0000000000100fff]=20
> reserved
> [ 0.000000] BIOS-e820: [mem 0x0000000000200000-0x00000000048fffff] usable
>
> Are you absolutely sure, that you have no further modifications in=20
> Jailhouse or the Linux loader?
>
> Actually, in your case, there should be e820 as well (instead of e801).=
=20
> Go to the Linux kernel sources, have a look at arch/x86/kernel/e820.c:127=
9
>
> and Jailhouse's jailhouse-cell-linux:638.
>
> jailhouse-cell-linux fills information of all memory regions into the=20
> zero page. Would you please instrument code (Linux/Jailhouse) to see=20
> where those regions are not parsed?
>
> > [    0.000000] printk: bootconsole [earlyser0] enabled
> > [    0.000000] NX (Execute Disable) protection: active
> > [    0.000000] extended physical RAM map:
> > [    0.000000] reserve setup_data: [mem=20
> > 0x0000000000000000-0x0000000000001fff] u       sable
> > [    0.000000] reserve setup_data: [mem=20
> > 0x0000000000002000-0x000000000000212b] u       sable
> > [    0.000000] reserve setup_data: [mem=20
> > 0x000000000000212c-0x000000000009efff] u       sable
> > [    0.000000] DMI not present or invalid.
> > [    0.000000] Hypervisor detected: Jailhouse
>
> Just guessing loud: Hmm, you have guest support enabled, that's not the=
=20
> issue.
>
> > [    0.000000] tsc: Detected 3393.624 MHz processor
> > [    0.000017] .text .data .bss are not marked as E820_TYPE_RAM!
>
> Here's the next error that makes me curious, why you system falls back=20
> to E801...
>
> > [    0.005745] last_pfn =3D 0x2e28 max_arch_pfn =3D 0x400000000
> > [    0.011025] x86/PAT: PAT support disabled because CONFIG_X86_PAT is=
=20
> > disabled        in the kernel.
>
> Please enable CONFIG_X86_PAT and MTRR in your kernel.
>
> > [    0.019362] x86/PAT: Configuration [0-7]: WB  WT  UC- UC  WB  WT  UC=
-=20
> UC
> > [    0.034867] Using GB pages for direct mapping
> > [    0.039193] Kernel panic - not syncing: alloc_low_pages: can not=20
> > alloc memory
>
> Yeah, that's the logical aftereffect after the errors above.
>
> Thanks,
> Ralf
>
> > [    0.046183] CPU: 0 PID: 0 Comm: swapper Not tainted 6.2.0-rc3 #2
> > [    0.052176] Call Trace:
> > [    0.054606]  <TASK>
> > [    0.056691]  ? dump_stack_lvl+0x33/0x4e
> > [    0.060510]  ? panic+0x157/0x303
> > [    0.063723]  ? sprintf+0x56/0x80
> > [    0.066936]  ? alloc_low_pages+0x70/0x1a0
> > [    0.070930]  ? phys_pmd_init+0x1fc/0x2eb
> > [    0.074839]  ? phys_pud_init+0x116/0x2d3
> > [    0.078744]  ? __kernel_physical_mapping_init+0x11a/0x290
> > [    0.084128]  ? init_memory_mapping+0x25e/0x3b0
> > [    0.088558]  ? init_range_memory_mapping+0xe7/0x145
> > [    0.093417]  ? init_mem_mapping+0x242/0x298
> > [    0.097585]  ? setup_arch+0x74e/0xcbd
> > [    0.101231]  ? start_kernel+0x66/0x8b7
> > [    0.104965]  ? load_ucode_bsp+0x43/0x11b
> > [    0.108873]  ? secondary_startup_64_no_verify+0xe0/0xeb
> > [    0.114085]  </TASK>
> > [    0.116255] ---[ end Kernel panic - not syncing: alloc_low_pages: ca=
n=20
> > not all       oc memory ]---
> >=20
> >=20
> > Thank you for your continuous support,
> > Michele
> >=20
> > Il giorno sabato 13 gennaio 2024 alle 00:05:43 UTC+1 Ralf Ramsauer ha=
=20
> > scritto:
> >=20
> > Hi Michele,
> >=20
> > On 12/01/2024 14:07, Michele Pescap=C3=A8 wrote:
> > > jailhouse cell load linux-2 linux-loader.bin -a 0x0
> > > ../buildroot-2023.11/output/images/bzImage -a 0xffbe00 parameters
> > -a 0x1000
> > > jailhouse cell start linux-2
> > >
> > > I take it the kernel is loaded at 0xffbe00 which is right at the
> > edge of
> > > the low ram region. In fact after issuing the cell load command and
> > > adjusting the path for the loader I get JAILHOUSE_CELL_LOAD: Invalid
> > > argument.
> >=20
> > Just tested cell-linux in a qemu machine, there it works, with pretty
> > similar addresses, which got me confused.
> >=20
> > After double-checking it: 0xffb.e00 is *not* at the edge of low mem:
> >=20
> > Low mem is 0x000.000 -- 0x0ff.fff
> > Comm region is 0x100.000 -- 0x100.fff
> >=20
> > 0xffb.e00 is (obviously) way above.
> >=20
> > Please try to set your high mem's .virt_start to 0x200000. Then,
> > 0xffbe00 is offsetted ~16MB inside your highmem, and it should work!
> >=20
> > IOW:
> >=20
> > /* high RAM */
> > {
> > .phys_start =3D 0x42300000,
> > .virt_start =3D 0x200000,
> > .size =3D 0x11000000,
> > .flags =3D JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
> > JAILHOUSE_MEM_EXECUTE |
> > JAILHOUSE_MEM_LOADABLE,
> > },
> >=20
> > Thanks
> > Ralf
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
> https://groups.google.com/d/msgid/jailhouse-dev/6712361a-eaef-49cc-8a72-7=
9da2c434169n%40googlegroups.com=20
> <
> https://groups.google.com/d/msgid/jailhouse-dev/6712361a-eaef-49cc-8a72-7=
9da2c434169n%40googlegroups.com?utm_medium=3Demail&utm_source=3Dfooter
> >.
>

--=20
You received this message because you are subscribed to the Google Groups "=
Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/=
jailhouse-dev/860c1e75-c28f-4157-9212-a3d87ad25b27n%40googlegroups.com.

------=_Part_13991_1367638801.1705165706647
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi,<br /><br />The problem was that the ram regions in the non root configu=
ration weren't detected as such because of the missing=C2=A0JAILHOUSE_MEM_D=
MA flag. After adding that, I also had to add two pio_regions because the n=
on root linux was crashing because of two ports which aren't present in /pr=
oc/ioports. <br />I also had to add mce=3Doff to the command line because i=
 had an unhandled MSR error, I'll have to disable that in the kernel config=
.<br />At this point the non root linux seems to start, I see the boot log.=
 No way of interacting with it as there is not a login prompt or anything, =
I think I need to ssh to the cell at this point, right?<br />That means I'l=
l now need to work on those ivshmem net devices.<br /><br />Thanks,<br />Mi=
chele<br /><br /><div class=3D"gmail_quote"><div dir=3D"auto" class=3D"gmai=
l_attr">Il giorno sabato 13 gennaio 2024 alle 15:13:12 UTC+1 Ralf Ramsauer =
ha scritto:<br/></div><blockquote class=3D"gmail_quote" style=3D"margin: 0 =
0 0 0.8ex; border-left: 1px solid rgb(204, 204, 204); padding-left: 1ex;">H=
i,
<br>
<br>On 13/01/2024 12:28, Michele Pescap=C3=A8 wrote:
<br>&gt; Hi,
<br>&gt;=20
<br>&gt; You are right, I got confused about those addresses, my bad. At le=
ast=20
<br>&gt; now I know that config is the correct one and I don&#39;t have to =
tinker=20
<br>&gt; with it.
<br>&gt; I&#39;m back to a kernel panic from the inmate when booting the ce=
ll. It&#39;s=20
<br>&gt; similar to the one I had earlier, not sure yet of what the problem=
 may be.
<br>
<br>Great, we&#39;re a step further.
<br>
<br>&gt;=20
<br>&gt; Created cell &quot;linux-2&quot;
<br>&gt; Page pool usage after cell creation: mem 406/32211, remap 16392/13=
1072
<br>&gt; Cell &quot;linux-2&quot; can be loaded
<br>&gt; CPU 9 received SIPI, vector 100
<br>&gt; Started cell &quot;linux-2&quot;
<br>&gt; CPU 8 received SIPI, vector 100
<br>&gt; No EFI environment detected.
<br>&gt; early console in extract_kernel
<br>&gt; input_data: 0x000000000275c308
<br>&gt; input_len: 0x00000000008b0981
<br>&gt; output: 0x0000000001000000
<br>&gt; output_len: 0x0000000001fccb30
<br>&gt; kernel_total_size: 0x0000000001e28000
<br>&gt; needed_size: 0x0000000002000000
<br>&gt; trampoline_32bit: 0x000000000009d000
<br>&gt;=20
<br>&gt; Decompressing Linux... Parsing ELF... done.
<br>&gt; Booting the kernel.
<br>&gt; [ =C2=A0 =C2=A00.000000] Linux version 6.2.0-rc3 (root@mp-LINUX-DE=
SKTOP)=20
<br>&gt; (x86_64-buildroot =C2=A0 =C2=A0 =C2=A0 -linux-gnu-gcc.br_real (Bui=
ldroot 2023.11)=20
<br>&gt; 12.3.0, GNU ld (GNU Binutils) 2.40) # =C2=A0 =C2=A0 =C2=A0 2 SMP P=
REEMPT_DYNAMIC Fri=20
<br>&gt; Jan 12 17:36:57 CET 2024
<br>&gt; [ =C2=A0 =C2=A00.000000] Command line: earlyprintk=3DttyS0,115200
<br>&gt; [ =C2=A0 =C2=A00.000000] KERNEL supported cpus:
<br>&gt; [ =C2=A0 =C2=A00.000000] =C2=A0 Intel GenuineIntel
<br>&gt; [ =C2=A0 =C2=A00.000000] =C2=A0 AMD AuthenticAMD
<br>&gt; [ =C2=A0 =C2=A00.000000] x86/fpu: Supporting XSAVE feature 0x001: =
&#39;x87 floating=20
<br>&gt; point regi =C2=A0 =C2=A0 =C2=A0 sters&#39;
<br>&gt; [ =C2=A0 =C2=A00.000000] x86/fpu: Supporting XSAVE feature 0x002: =
&#39;SSE registers&#39;
<br>&gt; [ =C2=A0 =C2=A00.000000] x86/fpu: Supporting XSAVE feature 0x004: =
&#39;AVX registers&#39;
<br>&gt; [ =C2=A0 =C2=A00.000000] x86/fpu: xstate_offset[2]: =C2=A0576, xst=
ate_sizes[2]: =C2=A0256
<br>&gt; [ =C2=A0 =C2=A00.000000] x86/fpu: Enabled xstate features 0x7, con=
text size is 832=20
<br>&gt; bytes, =C2=A0 =C2=A0 =C2=A0 =C2=A0using &#39;compacted&#39; format=
.
<br>&gt; [ =C2=A0 =C2=A00.000000] signal: max sigframe size: 1360
<br>&gt; [ =C2=A0 =C2=A00.000000] BIOS-provided physical RAM map:
<br>&gt; [ =C2=A0 =C2=A00.000000] BIOS-e801: [mem 0x0000000000000000-0x0000=
00000009efff] usable
<br>
<br>Okay, here should be all memory regions listed. My non-root Linux in my=
=20
<br>Qemu VM, for example, shows here:
<br>
<br>[    0.000000] BIOS-provided physical RAM map:
<br>[    0.000000] BIOS-e820: [mem 0x0000000000000000-0x00000000000fffff] u=
sable
<br>[    0.000000] BIOS-e820: [mem 0x0000000000100000-0x0000000000100fff]=
=20
<br>reserved
<br>[    0.000000] BIOS-e820: [mem 0x0000000000200000-0x00000000048fffff] u=
sable
<br>
<br>Are you absolutely sure, that you have no further modifications in=20
<br>Jailhouse or the Linux loader?
<br>
<br>Actually, in your case, there should be e820 as well (instead of e801).=
=20
<br>Go to the Linux kernel sources, have a look at arch/x86/kernel/e820.c:1=
279
<br>
<br>and Jailhouse&#39;s jailhouse-cell-linux:638.
<br>
<br>jailhouse-cell-linux fills information of all memory regions into the=
=20
<br>zero page. Would you please instrument code (Linux/Jailhouse) to see=20
<br>where those regions are not parsed?
<br>
<br>&gt; [ =C2=A0 =C2=A00.000000] printk: bootconsole [earlyser0] enabled
<br>&gt; [ =C2=A0 =C2=A00.000000] NX (Execute Disable) protection: active
<br>&gt; [ =C2=A0 =C2=A00.000000] extended physical RAM map:
<br>&gt; [ =C2=A0 =C2=A00.000000] reserve setup_data: [mem=20
<br>&gt; 0x0000000000000000-0x0000000000001fff] u =C2=A0 =C2=A0 =C2=A0 sabl=
e
<br>&gt; [ =C2=A0 =C2=A00.000000] reserve setup_data: [mem=20
<br>&gt; 0x0000000000002000-0x000000000000212b] u =C2=A0 =C2=A0 =C2=A0 sabl=
e
<br>&gt; [ =C2=A0 =C2=A00.000000] reserve setup_data: [mem=20
<br>&gt; 0x000000000000212c-0x000000000009efff] u =C2=A0 =C2=A0 =C2=A0 sabl=
e
<br>&gt; [ =C2=A0 =C2=A00.000000] DMI not present or invalid.
<br>&gt; [ =C2=A0 =C2=A00.000000] Hypervisor detected: Jailhouse
<br>
<br>Just guessing loud: Hmm, you have guest support enabled, that&#39;s not=
 the=20
<br>issue.
<br>
<br>&gt; [ =C2=A0 =C2=A00.000000] tsc: Detected 3393.624 MHz processor
<br>&gt; [ =C2=A0 =C2=A00.000017] .text .data .bss are not marked as E820_T=
YPE_RAM!
<br>
<br>Here&#39;s the next error that makes me curious, why you system falls b=
ack=20
<br>to E801...
<br>
<br>&gt; [ =C2=A0 =C2=A00.005745] last_pfn =3D 0x2e28 max_arch_pfn =3D 0x40=
0000000
<br>&gt; [ =C2=A0 =C2=A00.011025] x86/PAT: PAT support disabled because CON=
FIG_X86_PAT is=20
<br>&gt; disabled =C2=A0 =C2=A0 =C2=A0 =C2=A0in the kernel.
<br>
<br>Please enable CONFIG_X86_PAT and MTRR in your kernel.
<br>
<br>&gt; [ =C2=A0 =C2=A00.019362] x86/PAT: Configuration [0-7]: WB =C2=A0WT=
 =C2=A0UC- UC =C2=A0WB =C2=A0WT =C2=A0UC- UC
<br>&gt; [ =C2=A0 =C2=A00.034867] Using GB pages for direct mapping
<br>&gt; [ =C2=A0 =C2=A00.039193] Kernel panic - not syncing: alloc_low_pag=
es: can not=20
<br>&gt; alloc memory
<br>
<br>Yeah, that&#39;s the logical aftereffect after the errors above.
<br>
<br>Thanks,
<br>   Ralf
<br>
<br>&gt; [ =C2=A0 =C2=A00.046183] CPU: 0 PID: 0 Comm: swapper Not tainted 6=
.2.0-rc3 #2
<br>&gt; [ =C2=A0 =C2=A00.052176] Call Trace:
<br>&gt; [ =C2=A0 =C2=A00.054606] =C2=A0&lt;TASK&gt;
<br>&gt; [ =C2=A0 =C2=A00.056691] =C2=A0? dump_stack_lvl+0x33/0x4e
<br>&gt; [ =C2=A0 =C2=A00.060510] =C2=A0? panic+0x157/0x303
<br>&gt; [ =C2=A0 =C2=A00.063723] =C2=A0? sprintf+0x56/0x80
<br>&gt; [ =C2=A0 =C2=A00.066936] =C2=A0? alloc_low_pages+0x70/0x1a0
<br>&gt; [ =C2=A0 =C2=A00.070930] =C2=A0? phys_pmd_init+0x1fc/0x2eb
<br>&gt; [ =C2=A0 =C2=A00.074839] =C2=A0? phys_pud_init+0x116/0x2d3
<br>&gt; [ =C2=A0 =C2=A00.078744] =C2=A0? __kernel_physical_mapping_init+0x=
11a/0x290
<br>&gt; [ =C2=A0 =C2=A00.084128] =C2=A0? init_memory_mapping+0x25e/0x3b0
<br>&gt; [ =C2=A0 =C2=A00.088558] =C2=A0? init_range_memory_mapping+0xe7/0x=
145
<br>&gt; [ =C2=A0 =C2=A00.093417] =C2=A0? init_mem_mapping+0x242/0x298
<br>&gt; [ =C2=A0 =C2=A00.097585] =C2=A0? setup_arch+0x74e/0xcbd
<br>&gt; [ =C2=A0 =C2=A00.101231] =C2=A0? start_kernel+0x66/0x8b7
<br>&gt; [ =C2=A0 =C2=A00.104965] =C2=A0? load_ucode_bsp+0x43/0x11b
<br>&gt; [ =C2=A0 =C2=A00.108873] =C2=A0? secondary_startup_64_no_verify+0x=
e0/0xeb
<br>&gt; [ =C2=A0 =C2=A00.114085] =C2=A0&lt;/TASK&gt;
<br>&gt; [ =C2=A0 =C2=A00.116255] ---[ end Kernel panic - not syncing: allo=
c_low_pages: can=20
<br>&gt; not all =C2=A0 =C2=A0 =C2=A0 oc memory ]---
<br>&gt;=20
<br>&gt;=20
<br>&gt; Thank you for your continuous support,
<br>&gt; Michele
<br>&gt;=20
<br>&gt; Il giorno sabato 13 gennaio 2024 alle 00:05:43 UTC+1 Ralf Ramsauer=
 ha=20
<br>&gt; scritto:
<br>&gt;=20
<br>&gt;     Hi Michele,
<br>&gt;=20
<br>&gt;     On 12/01/2024 14:07, Michele Pescap=C3=A8 wrote:
<br>&gt;      &gt; jailhouse cell load linux-2 linux-loader.bin -a 0x0
<br>&gt;      &gt; ../buildroot-2023.11/output/images/bzImage -a 0xffbe00 p=
arameters
<br>&gt;     -a 0x1000
<br>&gt;      &gt; jailhouse cell start linux-2
<br>&gt;      &gt;
<br>&gt;      &gt; I take it the kernel is loaded at 0xffbe00 which is righ=
t at the
<br>&gt;     edge of
<br>&gt;      &gt; the low ram region. In fact after issuing the cell load =
command and
<br>&gt;      &gt; adjusting the path for the loader I get JAILHOUSE_CELL_L=
OAD: Invalid
<br>&gt;      &gt; argument.
<br>&gt;=20
<br>&gt;     Just tested cell-linux in a qemu machine, there it works, with=
 pretty
<br>&gt;     similar addresses, which got me confused.
<br>&gt;=20
<br>&gt;     After double-checking it: 0xffb.e00 is *not* at the edge of lo=
w mem:
<br>&gt;=20
<br>&gt;     Low mem is 0x000.000 -- 0x0ff.fff
<br>&gt;     Comm region is 0x100.000 -- 0x100.fff
<br>&gt;=20
<br>&gt;     0xffb.e00 is (obviously) way above.
<br>&gt;=20
<br>&gt;     Please try to set your high mem&#39;s .virt_start to 0x200000.=
 Then,
<br>&gt;     0xffbe00 is offsetted ~16MB inside your highmem, and it should=
 work!
<br>&gt;=20
<br>&gt;     IOW:
<br>&gt;=20
<br>&gt;     /* high RAM */
<br>&gt;     {
<br>&gt;     .phys_start =3D 0x42300000,
<br>&gt;     .virt_start =3D 0x200000,
<br>&gt;     .size =3D 0x11000000,
<br>&gt;     .flags =3D JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
<br>&gt;     JAILHOUSE_MEM_EXECUTE |
<br>&gt;     JAILHOUSE_MEM_LOADABLE,
<br>&gt;     },
<br>&gt;=20
<br>&gt;     Thanks
<br>&gt;     Ralf
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
<br>&gt; <a href=3D"https://groups.google.com/d/msgid/jailhouse-dev/6712361=
a-eaef-49cc-8a72-79da2c434169n%40googlegroups.com" target=3D"_blank" rel=3D=
"nofollow" data-saferedirecturl=3D"https://www.google.com/url?hl=3Dit&amp;q=
=3Dhttps://groups.google.com/d/msgid/jailhouse-dev/6712361a-eaef-49cc-8a72-=
79da2c434169n%2540googlegroups.com&amp;source=3Dgmail&amp;ust=3D17052500859=
14000&amp;usg=3DAOvVaw2L1Rtb84hBvp2v7jsQ0Z0d">https://groups.google.com/d/m=
sgid/jailhouse-dev/6712361a-eaef-49cc-8a72-79da2c434169n%40googlegroups.com=
</a> &lt;<a href=3D"https://groups.google.com/d/msgid/jailhouse-dev/6712361=
a-eaef-49cc-8a72-79da2c434169n%40googlegroups.com?utm_medium=3Demail&amp;ut=
m_source=3Dfooter" target=3D"_blank" rel=3D"nofollow" data-saferedirecturl=
=3D"https://www.google.com/url?hl=3Dit&amp;q=3Dhttps://groups.google.com/d/=
msgid/jailhouse-dev/6712361a-eaef-49cc-8a72-79da2c434169n%2540googlegroups.=
com?utm_medium%3Demail%26utm_source%3Dfooter&amp;source=3Dgmail&amp;ust=3D1=
705250085914000&amp;usg=3DAOvVaw1iEpcBdN2_nMECM6z6gDnx">https://groups.goog=
le.com/d/msgid/jailhouse-dev/6712361a-eaef-49cc-8a72-79da2c434169n%40google=
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
om/d/msgid/jailhouse-dev/860c1e75-c28f-4157-9212-a3d87ad25b27n%40googlegrou=
ps.com?utm_medium=3Demail&utm_source=3Dfooter">https://groups.google.com/d/=
msgid/jailhouse-dev/860c1e75-c28f-4157-9212-a3d87ad25b27n%40googlegroups.co=
m</a>.<br />

------=_Part_13991_1367638801.1705165706647--

------=_Part_13990_779768704.1705165706647--
