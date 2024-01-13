Return-Path: <jailhouse-dev+bncBDIJ36FET4JRBSXHRGWQMGQE3OEH64A@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-oa1-x40.google.com (mail-oa1-x40.google.com [IPv6:2001:4860:4864:20::40])
	by mail.lfdr.de (Postfix) with ESMTPS id 2157E82CC7C
	for <lists+jailhouse-dev@lfdr.de>; Sat, 13 Jan 2024 12:28:12 +0100 (CET)
Received: by mail-oa1-x40.google.com with SMTP id 586e51a60fabf-2040eff6ec1sf2078391fac.0
        for <lists+jailhouse-dev@lfdr.de>; Sat, 13 Jan 2024 03:28:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20230601; t=1705145291; x=1705750091; darn=lfdr.de;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:x-original-sender:mime-version
         :subject:references:in-reply-to:message-id:to:from:date:sender:from
         :to:cc:subject:date:message-id:reply-to;
        bh=2c5jsweQUgdW9gWRKuQE2E+EehR6HFWBf1OBS1zyLB8=;
        b=w0NHhZz1TMWtJO3xgWGtAicuGiPQZ39E7Nd7SUPfH2fg+re+l5MqilAjvfmt3MwS1i
         vXTNq0GvXIV266AUmITBoy28Ag3OU3WG15dwcCg2FoyM7HWKYSqec2Vob6BxBWgyvMf8
         M1DXZ0bWHwk6aiWtIG7ESXtBcDbv+lP89sCjRdTvfb9xZPvIdYgI199KfQtYXXL2BTYw
         daXLr3lVYZvfDkjN0FbV//Qsfqz5/nt5EBza2DJsgIifW+p6FcHcrryD0gDvGG1Mekx6
         PSTma+O0rPyNsrGOdXWhF7r+/XXzu7Ze7CQA+19uBpxxoMbEvCmSWYv/yS2kVDxyUjRx
         /Xcw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1705145291; x=1705750091; darn=lfdr.de;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:x-original-sender:mime-version
         :subject:references:in-reply-to:message-id:to:from:date:from:to:cc
         :subject:date:message-id:reply-to;
        bh=2c5jsweQUgdW9gWRKuQE2E+EehR6HFWBf1OBS1zyLB8=;
        b=ZYSSZJ3YAS1KT4+eOTJnELI2MVWot/JefRRimYZ/YfE3fkZKNHfVY4UyqzaOvzHadN
         S24UTLYH+yndff6fOfvjrpZQnalUUEzVtO9WBbQZKkhgCvDddu4r6S+S3u6od+OpH+iC
         XeTGXFOfpUjMW1Ap0WW944xwKb+4sI0u7SDGkChSb0NnFSkg829o0C4MnnBB/Rj1nxix
         +RVb4J5GmwTiklGO59mJQgcGIVH3YtB2HaGqzhYd8h+Ve2lSzyWO7KNcE7BrPKcoI78Q
         hif9PkRFDIOJZu1pkLrynWxbB687ssH+cxbfj8TKAZfoMIyZsjl2+3o+Hd5i5TOvdTe9
         FJBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1705145291; x=1705750091;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :x-spam-checked-in-group:list-id:mailing-list:precedence
         :x-original-sender:mime-version:subject:references:in-reply-to
         :message-id:to:from:date:x-beenthere:x-gm-message-state:sender:from
         :to:cc:subject:date:message-id:reply-to;
        bh=2c5jsweQUgdW9gWRKuQE2E+EehR6HFWBf1OBS1zyLB8=;
        b=Y41/ClX500q/50fUEBtA6tLI8XU3D3C9/nBeeHjAR/oxpLTLZbqRntBpQ3QQrGwTqx
         /FaACk4JII8JvW/fik8mwbw087FgXCRwA6hSDtdbqbc45+pkRqVR4sGASxzCJ9wKLq/9
         6KQNBnMnj8OOp48qYsmAaD4GIjaVytqICopyDLHlfd3shl7fIj+C+R/HgaHK9DZrtfnv
         cov35lFAPltGl82+kpJoR8Dxkm3RtX6KnZ0vfhfA7y7RtrMl/RNKCX1CqgG14dUFSldj
         cA6x++sl+z1UnKWgPsUEtqkGTz2SdQtLyxM0HcfC5+5KtaAD4fCSppERFV02mzG1B9u8
         jbnQ==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AOJu0Yz3xMfkKCe3Xdhr5cByYRe4x+NS5HMxiILAzubWKrjXaAmAuNpZ
	cu7xtfKfbEppK10McHjqrWA=
X-Google-Smtp-Source: AGHT+IEdS9qGUc2GPS7leWjYgfyz4PNzYqIzJG3U8rUcZvn9Yj9tKaq6yLgMu0VJPWOMvA7f/o4vHQ==
X-Received: by 2002:a05:6359:a0f:b0:175:d136:10e6 with SMTP id el15-20020a0563590a0f00b00175d13610e6mr2199035rwb.0.1705145290817;
        Sat, 13 Jan 2024 03:28:10 -0800 (PST)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a25:d0ca:0:b0:dbd:5572:cb2e with SMTP id h193-20020a25d0ca000000b00dbd5572cb2els1284708ybg.0.-pod-prod-07-us;
 Sat, 13 Jan 2024 03:28:09 -0800 (PST)
X-Received: by 2002:a25:6b0e:0:b0:db5:f536:17d4 with SMTP id g14-20020a256b0e000000b00db5f53617d4mr909989ybc.11.1705145289079;
        Sat, 13 Jan 2024 03:28:09 -0800 (PST)
Date: Sat, 13 Jan 2024 03:28:07 -0800 (PST)
From: =?UTF-8?Q?Michele_Pescap=C3=A8?= <mic.pescape@gmail.com>
To: Jailhouse <jailhouse-dev@googlegroups.com>
Message-Id: <6712361a-eaef-49cc-8a72-79da2c434169n@googlegroups.com>
In-Reply-To: <0aa4c10d-a635-4a37-bf51-2b9863beb2a0@oth-regensburg.de>
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
Subject: Re: Unable to start non root linux cell
MIME-Version: 1.0
Content-Type: multipart/mixed; 
	boundary="----=_Part_55604_1455652267.1705145287999"
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

------=_Part_55604_1455652267.1705145287999
Content-Type: multipart/alternative; 
	boundary="----=_Part_55605_944288728.1705145287999"

------=_Part_55605_944288728.1705145287999
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi,

You are right, I got confused about those addresses, my bad. At least now I=
=20
know that config is the correct one and I don't have to tinker with it.
I'm back to a kernel panic from the inmate when booting the cell. It's=20
similar to the one I had earlier, not sure yet of what the problem may be.=
=20

Created cell "linux-2"
Page pool usage after cell creation: mem 406/32211, remap 16392/131072
Cell "linux-2" can be loaded
CPU 9 received SIPI, vector 100
Started cell "linux-2"
CPU 8 received SIPI, vector 100
No EFI environment detected.
early console in extract_kernel
input_data: 0x000000000275c308
input_len: 0x00000000008b0981
output: 0x0000000001000000
output_len: 0x0000000001fccb30
kernel_total_size: 0x0000000001e28000
needed_size: 0x0000000002000000
trampoline_32bit: 0x000000000009d000

Decompressing Linux... Parsing ELF... done.
Booting the kernel.
[    0.000000] Linux version 6.2.0-rc3 (root@mp-LINUX-DESKTOP)=20
(x86_64-buildroot       -linux-gnu-gcc.br_real (Buildroot 2023.11) 12.3.0,=
=20
GNU ld (GNU Binutils) 2.40) #       2 SMP PREEMPT_DYNAMIC Fri Jan 12=20
17:36:57 CET 2024
[    0.000000] Command line: earlyprintk=3DttyS0,115200
[    0.000000] KERNEL supported cpus:
[    0.000000]   Intel GenuineIntel
[    0.000000]   AMD AuthenticAMD
[    0.000000] x86/fpu: Supporting XSAVE feature 0x001: 'x87 floating point=
=20
regi       sters'
[    0.000000] x86/fpu: Supporting XSAVE feature 0x002: 'SSE registers'
[    0.000000] x86/fpu: Supporting XSAVE feature 0x004: 'AVX registers'
[    0.000000] x86/fpu: xstate_offset[2]:  576, xstate_sizes[2]:  256
[    0.000000] x86/fpu: Enabled xstate features 0x7, context size is 832=20
bytes,        using 'compacted' format.
[    0.000000] signal: max sigframe size: 1360
[    0.000000] BIOS-provided physical RAM map:
[    0.000000] BIOS-e801: [mem 0x0000000000000000-0x000000000009efff] usabl=
e
[    0.000000] printk: bootconsole [earlyser0] enabled
[    0.000000] NX (Execute Disable) protection: active
[    0.000000] extended physical RAM map:
[    0.000000] reserve setup_data: [mem=20
0x0000000000000000-0x0000000000001fff] u       sable
[    0.000000] reserve setup_data: [mem=20
0x0000000000002000-0x000000000000212b] u       sable
[    0.000000] reserve setup_data: [mem=20
0x000000000000212c-0x000000000009efff] u       sable
[    0.000000] DMI not present or invalid.
[    0.000000] Hypervisor detected: Jailhouse
[    0.000000] tsc: Detected 3393.624 MHz processor
[    0.000017] .text .data .bss are not marked as E820_TYPE_RAM!
[    0.005745] last_pfn =3D 0x2e28 max_arch_pfn =3D 0x400000000
[    0.011025] x86/PAT: PAT support disabled because CONFIG_X86_PAT is=20
disabled        in the kernel.
[    0.019362] x86/PAT: Configuration [0-7]: WB  WT  UC- UC  WB  WT  UC- UC
[    0.034867] Using GB pages for direct mapping
[    0.039193] Kernel panic - not syncing: alloc_low_pages: can not alloc=
=20
memory
[    0.046183] CPU: 0 PID: 0 Comm: swapper Not tainted 6.2.0-rc3 #2
[    0.052176] Call Trace:
[    0.054606]  <TASK>
[    0.056691]  ? dump_stack_lvl+0x33/0x4e
[    0.060510]  ? panic+0x157/0x303
[    0.063723]  ? sprintf+0x56/0x80
[    0.066936]  ? alloc_low_pages+0x70/0x1a0
[    0.070930]  ? phys_pmd_init+0x1fc/0x2eb
[    0.074839]  ? phys_pud_init+0x116/0x2d3
[    0.078744]  ? __kernel_physical_mapping_init+0x11a/0x290
[    0.084128]  ? init_memory_mapping+0x25e/0x3b0
[    0.088558]  ? init_range_memory_mapping+0xe7/0x145
[    0.093417]  ? init_mem_mapping+0x242/0x298
[    0.097585]  ? setup_arch+0x74e/0xcbd
[    0.101231]  ? start_kernel+0x66/0x8b7
[    0.104965]  ? load_ucode_bsp+0x43/0x11b
[    0.108873]  ? secondary_startup_64_no_verify+0xe0/0xeb
[    0.114085]  </TASK>
[    0.116255] ---[ end Kernel panic - not syncing: alloc_low_pages: can=20
not all       oc memory ]---


Thank you for your continuous support,
Michele

Il giorno sabato 13 gennaio 2024 alle 00:05:43 UTC+1 Ralf Ramsauer ha=20
scritto:

> Hi Michele,
>
> On 12/01/2024 14:07, Michele Pescap=C3=A8 wrote:
> > jailhouse cell load linux-2 linux-loader.bin -a 0x0=20
> > ../buildroot-2023.11/output/images/bzImage -a 0xffbe00 parameters -a=20
> 0x1000
> > jailhouse cell start linux-2
> >=20
> > I take it the kernel is loaded at 0xffbe00 which is right at the edge o=
f=20
> > the low ram region. In fact after issuing the cell load command and=20
> > adjusting the path for the loader I get JAILHOUSE_CELL_LOAD: Invalid=20
> > argument.
>
> Just tested cell-linux in a qemu machine, there it works, with pretty=20
> similar addresses, which got me confused.
>
> After double-checking it: 0xffb.e00 is *not* at the edge of low mem:
>
> Low mem is 0x000.000 -- 0x0ff.fff
> Comm region is 0x100.000 -- 0x100.fff
>
> 0xffb.e00 is (obviously) way above.
>
> Please try to set your high mem's .virt_start to 0x200000. Then,=20
> 0xffbe00 is offsetted ~16MB inside your highmem, and it should work!
>
> IOW:
>
> /* high RAM */
> {
> .phys_start =3D 0x42300000,
> .virt_start =3D 0x200000,
> .size =3D 0x11000000,
> .flags =3D JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
> JAILHOUSE_MEM_EXECUTE |
> JAILHOUSE_MEM_LOADABLE,
> },
>
> Thanks
> Ralf
>

--=20
You received this message because you are subscribed to the Google Groups "=
Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/=
jailhouse-dev/6712361a-eaef-49cc-8a72-79da2c434169n%40googlegroups.com.

------=_Part_55605_944288728.1705145287999
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi,<br /><br />You are right, I got confused about those addresses, my bad.=
 At least now I know that config is the correct one and I don't have to tin=
ker with it.<br />I'm back to a kernel panic from the inmate when booting t=
he cell. It's similar to the one I had earlier, not sure yet of what the pr=
oblem may be. <br /><br />Created cell "linux-2"<br />Page pool usage after=
 cell creation: mem 406/32211, remap 16392/131072<br />Cell "linux-2" can b=
e loaded<br />CPU 9 received SIPI, vector 100<br />Started cell "linux-2"<b=
r />CPU 8 received SIPI, vector 100<br />No EFI environment detected.<br />=
early console in extract_kernel<br />input_data: 0x000000000275c308<br />in=
put_len: 0x00000000008b0981<br />output: 0x0000000001000000<br />output_len=
: 0x0000000001fccb30<br />kernel_total_size: 0x0000000001e28000<br />needed=
_size: 0x0000000002000000<br />trampoline_32bit: 0x000000000009d000<br /><b=
r />Decompressing Linux... Parsing ELF... done.<br />Booting the kernel.<br=
 />[ =C2=A0 =C2=A00.000000] Linux version 6.2.0-rc3 (root@mp-LINUX-DESKTOP)=
 (x86_64-buildroot =C2=A0 =C2=A0 =C2=A0 -linux-gnu-gcc.br_real (Buildroot 2=
023.11) 12.3.0, GNU ld (GNU Binutils) 2.40) # =C2=A0 =C2=A0 =C2=A0 2 SMP PR=
EEMPT_DYNAMIC Fri Jan 12 17:36:57 CET 2024<br />[ =C2=A0 =C2=A00.000000] Co=
mmand line: earlyprintk=3DttyS0,115200<br />[ =C2=A0 =C2=A00.000000] KERNEL=
 supported cpus:<br />[ =C2=A0 =C2=A00.000000] =C2=A0 Intel GenuineIntel<br=
 />[ =C2=A0 =C2=A00.000000] =C2=A0 AMD AuthenticAMD<br />[ =C2=A0 =C2=A00.0=
00000] x86/fpu: Supporting XSAVE feature 0x001: 'x87 floating point regi =
=C2=A0 =C2=A0 =C2=A0 sters'<br />[ =C2=A0 =C2=A00.000000] x86/fpu: Supporti=
ng XSAVE feature 0x002: 'SSE registers'<br />[ =C2=A0 =C2=A00.000000] x86/f=
pu: Supporting XSAVE feature 0x004: 'AVX registers'<br />[ =C2=A0 =C2=A00.0=
00000] x86/fpu: xstate_offset[2]: =C2=A0576, xstate_sizes[2]: =C2=A0256<br =
/>[ =C2=A0 =C2=A00.000000] x86/fpu: Enabled xstate features 0x7, context si=
ze is 832 bytes, =C2=A0 =C2=A0 =C2=A0 =C2=A0using 'compacted' format.<br />=
[ =C2=A0 =C2=A00.000000] signal: max sigframe size: 1360<br />[ =C2=A0 =C2=
=A00.000000] BIOS-provided physical RAM map:<br />[ =C2=A0 =C2=A00.000000] =
BIOS-e801: [mem 0x0000000000000000-0x000000000009efff] usable<br />[ =C2=A0=
 =C2=A00.000000] printk: bootconsole [earlyser0] enabled<br />[ =C2=A0 =C2=
=A00.000000] NX (Execute Disable) protection: active<br />[ =C2=A0 =C2=A00.=
000000] extended physical RAM map:<br />[ =C2=A0 =C2=A00.000000] reserve se=
tup_data: [mem 0x0000000000000000-0x0000000000001fff] u =C2=A0 =C2=A0 =C2=
=A0 sable<br />[ =C2=A0 =C2=A00.000000] reserve setup_data: [mem 0x00000000=
00002000-0x000000000000212b] u =C2=A0 =C2=A0 =C2=A0 sable<br />[ =C2=A0 =C2=
=A00.000000] reserve setup_data: [mem 0x000000000000212c-0x000000000009efff=
] u =C2=A0 =C2=A0 =C2=A0 sable<br />[ =C2=A0 =C2=A00.000000] DMI not presen=
t or invalid.<br />[ =C2=A0 =C2=A00.000000] Hypervisor detected: Jailhouse<=
br />[ =C2=A0 =C2=A00.000000] tsc: Detected 3393.624 MHz processor<br />[ =
=C2=A0 =C2=A00.000017] .text .data .bss are not marked as E820_TYPE_RAM!<br=
 />[ =C2=A0 =C2=A00.005745] last_pfn =3D 0x2e28 max_arch_pfn =3D 0x40000000=
0<br />[ =C2=A0 =C2=A00.011025] x86/PAT: PAT support disabled because CONFI=
G_X86_PAT is disabled =C2=A0 =C2=A0 =C2=A0 =C2=A0in the kernel.<br />[ =C2=
=A0 =C2=A00.019362] x86/PAT: Configuration [0-7]: WB =C2=A0WT =C2=A0UC- UC =
=C2=A0WB =C2=A0WT =C2=A0UC- UC<br />[ =C2=A0 =C2=A00.034867] Using GB pages=
 for direct mapping<br />[ =C2=A0 =C2=A00.039193] Kernel panic - not syncin=
g: alloc_low_pages: can not alloc memory<br />[ =C2=A0 =C2=A00.046183] CPU:=
 0 PID: 0 Comm: swapper Not tainted 6.2.0-rc3 #2<br />[ =C2=A0 =C2=A00.0521=
76] Call Trace:<br />[ =C2=A0 =C2=A00.054606] =C2=A0&lt;TASK&gt;<br />[ =C2=
=A0 =C2=A00.056691] =C2=A0? dump_stack_lvl+0x33/0x4e<br />[ =C2=A0 =C2=A00.=
060510] =C2=A0? panic+0x157/0x303<br />[ =C2=A0 =C2=A00.063723] =C2=A0? spr=
intf+0x56/0x80<br />[ =C2=A0 =C2=A00.066936] =C2=A0? alloc_low_pages+0x70/0=
x1a0<br />[ =C2=A0 =C2=A00.070930] =C2=A0? phys_pmd_init+0x1fc/0x2eb<br />[=
 =C2=A0 =C2=A00.074839] =C2=A0? phys_pud_init+0x116/0x2d3<br />[ =C2=A0 =C2=
=A00.078744] =C2=A0? __kernel_physical_mapping_init+0x11a/0x290<br />[ =C2=
=A0 =C2=A00.084128] =C2=A0? init_memory_mapping+0x25e/0x3b0<br />[ =C2=A0 =
=C2=A00.088558] =C2=A0? init_range_memory_mapping+0xe7/0x145<br />[ =C2=A0 =
=C2=A00.093417] =C2=A0? init_mem_mapping+0x242/0x298<br />[ =C2=A0 =C2=A00.=
097585] =C2=A0? setup_arch+0x74e/0xcbd<br />[ =C2=A0 =C2=A00.101231] =C2=A0=
? start_kernel+0x66/0x8b7<br />[ =C2=A0 =C2=A00.104965] =C2=A0? load_ucode_=
bsp+0x43/0x11b<br />[ =C2=A0 =C2=A00.108873] =C2=A0? secondary_startup_64_n=
o_verify+0xe0/0xeb<br />[ =C2=A0 =C2=A00.114085] =C2=A0&lt;/TASK&gt;<br />[=
 =C2=A0 =C2=A00.116255] ---[ end Kernel panic - not syncing: alloc_low_page=
s: can not all =C2=A0 =C2=A0 =C2=A0 oc memory ]---<br /><br /><br />Thank y=
ou for your continuous support,<br />Michele<br /><br /><div class=3D"gmail=
_quote"><div dir=3D"auto" class=3D"gmail_attr">Il giorno sabato 13 gennaio =
2024 alle 00:05:43 UTC+1 Ralf Ramsauer ha scritto:<br/></div><blockquote cl=
ass=3D"gmail_quote" style=3D"margin: 0 0 0 0.8ex; border-left: 1px solid rg=
b(204, 204, 204); padding-left: 1ex;">Hi Michele,
<br>
<br>On 12/01/2024 14:07, Michele Pescap=C3=A8 wrote:
<br>&gt; jailhouse cell load linux-2 linux-loader.bin -a 0x0=20
<br>&gt; ../buildroot-2023.11/output/images/bzImage -a 0xffbe00 parameters =
-a 0x1000
<br>&gt; jailhouse cell start linux-2
<br>&gt;=20
<br>&gt; I take it the kernel is loaded at 0xffbe00 which is right at the e=
dge of=20
<br>&gt; the low ram region. In fact after issuing the cell load command an=
d=20
<br>&gt; adjusting the path for the loader I get JAILHOUSE_CELL_LOAD: Inval=
id=20
<br>&gt; argument.
<br>
<br>Just tested cell-linux in a qemu machine, there it works, with pretty=
=20
<br>similar addresses, which got me confused.
<br>
<br>After double-checking it: 0xffb.e00 is *not* at the edge of low mem:
<br>
<br>Low mem is     0x000.000 -- 0x0ff.fff
<br>Comm region is 0x100.000 -- 0x100.fff
<br>
<br>0xffb.e00 is (obviously) way above.
<br>
<br>Please try to set your high mem&#39;s .virt_start to 0x200000. Then,=20
<br>0xffbe00 is offsetted ~16MB inside your highmem, and it should work!
<br>
<br>IOW:
<br>
<br>/* high RAM */
<br>{
<br>         .phys_start =3D 0x42300000,
<br>         .virt_start =3D 0x200000,
<br>         .size =3D 0x11000000,
<br>         .flags =3D JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
<br>                  JAILHOUSE_MEM_EXECUTE |
<br>                  JAILHOUSE_MEM_LOADABLE,
<br>},
<br>
<br>Thanks
<br>   Ralf
<br></blockquote></div>

<p></p>

-- <br />
You received this message because you are subscribed to the Google Groups &=
quot;Jailhouse&quot; group.<br />
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to <a href=3D"mailto:jailhouse-dev+unsubscribe@googlegroups.com">jailh=
ouse-dev+unsubscribe@googlegroups.com</a>.<br />
To view this discussion on the web visit <a href=3D"https://groups.google.c=
om/d/msgid/jailhouse-dev/6712361a-eaef-49cc-8a72-79da2c434169n%40googlegrou=
ps.com?utm_medium=3Demail&utm_source=3Dfooter">https://groups.google.com/d/=
msgid/jailhouse-dev/6712361a-eaef-49cc-8a72-79da2c434169n%40googlegroups.co=
m</a>.<br />

------=_Part_55605_944288728.1705145287999--

------=_Part_55604_1455652267.1705145287999--
