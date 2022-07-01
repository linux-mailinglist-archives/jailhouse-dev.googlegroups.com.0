Return-Path: <jailhouse-dev+bncBDDZR3MZ3QKBBW4O7SKQMGQEXIBPYIY@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-qt1-x838.google.com (mail-qt1-x838.google.com [IPv6:2607:f8b0:4864:20::838])
	by mail.lfdr.de (Postfix) with ESMTPS id 10AE15635EF
	for <lists+jailhouse-dev@lfdr.de>; Fri,  1 Jul 2022 16:40:29 +0200 (CEST)
Received: by mail-qt1-x838.google.com with SMTP id q21-20020ac84115000000b0031bf60d9b35sf490059qtl.4
        for <lists+jailhouse-dev@lfdr.de>; Fri, 01 Jul 2022 07:40:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20210112;
        h=sender:date:from:to:message-id:in-reply-to:references:subject
         :mime-version:x-original-sender:precedence:mailing-list:list-id
         :list-post:list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=9nfNQFxHS5nBvvex4+sRUR6roOluCyTAnDJHNdamG2w=;
        b=NmpkdFV9pZ2TIaPIfoex2HNqV3Wng0d1JMIJLvTVlkpD2uBNnRomQEvDlKoyy5HeQt
         p9QZk0NFeY6T7kY3v0dJUWpDtlOopVmSTkzGBSGHVocAte4WYcIHfZWpkBLb7erR6LNy
         chO2Ag2ArNpHTHBSD/zWDMqJSm7KG7Pj0jTj9rxUEmSV9djzzgsRoiMnayPOX9JgnXIt
         sLBH+BiRxT+gWnxM1XzEp6a4MUDF94YuvEUqfRsFWxBCJMXad24X7oVSkH24DaKpueUQ
         GjIBRCK8h5+5ZgU6LDs/nH23IbPQkhhyBUCvODA8BohTI4Ov0ssjBWW0cCZM+IH8I8IO
         Qf3Q==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=devlabs-pro.20210112.gappssmtp.com; s=20210112;
        h=date:from:to:message-id:in-reply-to:references:subject:mime-version
         :x-original-sender:precedence:mailing-list:list-id:list-post
         :list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=9nfNQFxHS5nBvvex4+sRUR6roOluCyTAnDJHNdamG2w=;
        b=4GDa8Sw/ZS7Y9qy1N047Xanm5ouv0xdazfm5Y4MGE3038V+Tzk36W+b1gS+9YGjhkH
         4rj7biyHJFSkLG44RFtKoEMchO9cO+FPO7OhzhI4jsJzntaIzTbOyZx+GUD2NWt6I5Cl
         tz6S838YCDc93cIs1j2gkmoM59WmLvqNrLLDCIoNYVgJTC3WZ1isK2SISvPRF3vsqe4q
         yViZAsBrhYmdAaQ3Yr734AzyrVROzyEf18n1lkO2TeJAwIv+bb961vUnZxCvZXWt5nGR
         QvpRZUgusvDw0iviwsZzVVrCQX7v4H9eVMRVHRmA73TkEGv0WDxqWX5PeCJyPy+F/akU
         8o+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=sender:x-gm-message-state:date:from:to:message-id:in-reply-to
         :references:subject:mime-version:x-original-sender:precedence
         :mailing-list:list-id:x-spam-checked-in-group:list-post:list-help
         :list-archive:list-subscribe:list-unsubscribe;
        bh=9nfNQFxHS5nBvvex4+sRUR6roOluCyTAnDJHNdamG2w=;
        b=34PkgvtwFJ5ICNyVjN2M+3TMZH5/D5YV+nHDlN9GC80QCXhr71gGHOFrq979pHEJ6k
         gHjxIQnKUbwJ/SmSkiQtNAjGBLYvfPmup5k5t7u/CbYto4zOBSWLr69jFk5qho71PrsD
         C8jkroPtjocY3ZqcgVuZ3tDzNeh6uoSfcJWJ0mI822iSZtKXWmoyS3KLNHplshqhyfq4
         EP+JCnH++LFWiqRw5wvh9t8neDbv8c2U8datrHqD4Xq1Mgu+XAtz+7p6LoGtizP6M2Ni
         8goScxIEoBvR1eYuV6bCG014QsVxprnggCRR2jABSNlGHWgK23JtyzJ9u+QZ1PH+Be29
         P63A==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AJIora8barimAevkKa0x6wrctyQW/qJXGalKpPXLiIY8G/jnDni0yHHM
	uVEn+13BLXUdCjcZVTLloZI=
X-Google-Smtp-Source: AGRyM1vJ4nhpoyi9GdcIRfjGbPvMmldRzI/g7WkRYAF/2glLn+a5z91+2BO7BLzX9tk2wNnkaObDXw==
X-Received: by 2002:a37:b706:0:b0:6af:3802:e92f with SMTP id h6-20020a37b706000000b006af3802e92fmr10765520qkf.386.1656686427827;
        Fri, 01 Jul 2022 07:40:27 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a0c:b21a:0:b0:470:597b:bdaa with SMTP id x26-20020a0cb21a000000b00470597bbdaals12736528qvd.10.gmail;
 Fri, 01 Jul 2022 07:40:26 -0700 (PDT)
X-Received: by 2002:ad4:5aaf:0:b0:470:3f54:e0f5 with SMTP id u15-20020ad45aaf000000b004703f54e0f5mr16610892qvg.32.1656686426595;
        Fri, 01 Jul 2022 07:40:26 -0700 (PDT)
Date: Fri, 1 Jul 2022 07:40:26 -0700 (PDT)
From: lpfeifhofer <lpfeifhofer@devlabs.pro>
To: Jailhouse <jailhouse-dev@googlegroups.com>
Message-Id: <94f659ad-bfe9-4eda-8dfe-8d2296cea4e9n@googlegroups.com>
In-Reply-To: <515276d4-6a49-4734-92f9-8fcae109edd3n@googlegroups.com>
References: <515276d4-6a49-4734-92f9-8fcae109edd3n@googlegroups.com>
Subject: Re: Root cell configuration for new arm64 target (interrupt
 controller)
MIME-Version: 1.0
Content-Type: multipart/mixed; 
	boundary="----=_Part_6218_663279452.1656686426069"
X-Original-Sender: lpfeifhofer@devlabs.pro
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

------=_Part_6218_663279452.1656686426069
Content-Type: multipart/alternative; 
	boundary="----=_Part_6219_916337188.1656686426069"

------=_Part_6219_916337188.1656686426069
Content-Type: text/plain; charset="UTF-8"

After revisiting some documentation/tutorial video I realized that there 
were significant misconceptions on my side.
I now placed the hypervisor memory outside of the linux memory defined in 
mem_regions and also added all regions used by the peripherals shown in 
/proc/iomem.

However, unfortunately the board still is stuck after enabling and there is 
no output (CONFIG_TRACE_ERROR is enabled).

#include <jailhouse/types.h>
#include <jailhouse/cell-config.h>

struct {
    struct jailhouse_system header;
    __u64 cpus[1];
    struct jailhouse_memory mem_regions[3];
    struct jailhouse_irqchip irqchips[1];
} __attribute__((packed)) config = {
    .header = {
        .signature = JAILHOUSE_SYSTEM_SIGNATURE,
        .revision = JAILHOUSE_CONFIG_REVISION,
        .flags = JAILHOUSE_SYS_VIRTUAL_DEBUG_CONSOLE,
        .hypervisor_memory = {
            .phys_start = 0x09000000,
            .size =       0x00400000,
        },
        .debug_console = {
            .flags = JAILHOUSE_CON_TYPE_NONE,
        },
        .platform_info = {
            .arm = {
                .gic_version = 2,
                .gicd_base = 0xffc01000,
                .gicc_base = 0xffc02000,
                .gich_base = 0xffc04000,
                .gicv_base = 0xffc06000,
                .maintenance_irq = 25,
            },
        },
        .root_cell = {
            .name = "a113x",
            .cpu_set_size = sizeof(config.cpus),
            .num_memory_regions = ARRAY_SIZE(config.mem_regions),
            .num_irqchips = ARRAY_SIZE(config.irqchips),
        },
    },

    .cpus = {
        0b1111,
    },

    .mem_regions = {
        {
                        .phys_start = 0xff3f0000,
                        .virt_start = 0xff3f0000,
                        .size = 0x419038,
                        .flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
                                JAILHOUSE_MEM_IO,
        },
        {
                        .phys_start = 0xffd13000,
                        .virt_start = 0xffd13000,
                        .size = 0x2C07FF,
                        .flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
                                JAILHOUSE_MEM_IO,
        },
        /* System RAM */ {
            .phys_start = 0x00000000,
            .virt_start = 0x00000000,
            .size = 0x08000000,
            .flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
                JAILHOUSE_MEM_EXECUTE,
        },
    },

    .irqchips = {
        /* GIC */ {
            .address = 0xffc01000,
            .pin_base = 32,
            .pin_bitmap = {
                0xffffffff, 0xffffffff, 0xffffffff, 0xffffffff,
            },
        },
    },
};


lpfeifhofer schrieb am Donnerstag, 30. Juni 2022 um 14:42:20 UTC+2:

> Hi, I am currently trying to get jailhouse running on a new arm64 target 
> (Cortex-A53). I am trying to get a minimal root cell configuration working 
> but at the moment when enabling it it just immediately crashes the board 
> (stuck without any output).
>
> The physical memory on the board seems to be available from 
> 00000000-1fffffff (/proc/iomem) and initially I reduced the memory for 
> Linux using mem=128M to be able to place jailhouse into the upper regions 
> (see below, starting at 0x08000000).
>
> Following that I tried to make sense on how the GIC needs to be set up. 
> From what I know the device uses a GIC v2 with base address 0xffc01000. 
> This can be found in the linux device tree here: 
> https://github.com/khadas/linux/blob/khadas-vims-5.4.y/arch/arm64/boot/dts/amlogic/mesont7.dtsi#L285
>
> However, there it only features 2 entries, and in all v2 configurations 
> found in the jailhouse repo 4 addresses are used. (GIC v3 seems to use only 
> two).
>
> In addition I am not sure what the purpose of irqchips is and how that 
> should look like. Is this to communicate to jailhouse what interrupts it 
> can make use of?
>
> It would be great to get some feedback if I correctly configured the GIC 
> (and memory) and if what I am seeing could be related to a incorrect 
> configuration on my side. (I might also have to extend this configuration, 
> I assumed what I have is enough for a minimal setup.)
>
> struct {
>     struct jailhouse_system header;
>     __u64 cpus[1];
>     struct jailhouse_memory mem_regions[1];
>     struct jailhouse_irqchip irqchips[1];
>     struct jailhouse_pci_device pci_devices[0];
> } __attribute__((packed)) config = {
>     .header = {
>         .signature = JAILHOUSE_SYSTEM_SIGNATURE,
>         .revision = JAILHOUSE_CONFIG_REVISION,
>         .flags = JAILHOUSE_SYS_VIRTUAL_DEBUG_CONSOLE,
>         .hypervisor_memory = {
>             .phys_start = 0x08000000,
>             .size =       0x04000000,
>         },
>         .debug_console = {
>             .flags = JAILHOUSE_CON_TYPE_NONE,
>         },
>         .platform_info = {
>             .pci_mmconfig_base = 0x0C000000,
>             .pci_mmconfig_end_bus = 0,
>             .pci_is_virtual = 1,
>             .arm = {
>                 .gic_version = 2,
>                 .gicd_base = 0xffc01000,
>                 .gicc_base = 0xffc02000,
>                 .gich_base = 0xffc04000,
>                 .gicv_base = 0xffc06000,
>                 .maintenance_irq = 25,
>             },
>         },
>         .root_cell = {
>             .name = "AM113",
>
>             .cpu_set_size = sizeof(config.cpus),
>             .num_memory_regions = ARRAY_SIZE(config.mem_regions),
>             .num_irqchips = ARRAY_SIZE(config.irqchips),
>             .num_pci_devices = ARRAY_SIZE(config.pci_devices),
>
>             .vpci_irq_base = 108,
>         },
>     },
>
>     .cpus = {
>         0b1111,
>     },
>
>     .mem_regions = {
>         /* System RAM */ {
>             .phys_start = 0x08000000,
>             .virt_start = 0x08000000,
>             .size = 0x04000000,
>             .flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
>                 JAILHOUSE_MEM_EXECUTE,
>         },
>     },
>
>     .irqchips = {
>         /* GIC */ {
>             .address = 0xffc01000,
>             .pin_base = 32,
>             .pin_bitmap = {
>                 0xffffffff, 0xffffffff, 0xffffffff, 0xffffffff,
>             },
>         },
>     },
>
>     .pci_devices = {
>
>     },
> };
>
>
> # cat /proc/iomem 
> 00000000-07ffffff : System RAM
>   03000000-03e3ffff : Kernel code
>   04030000-04bcbfff : Kernel data
> ff3f0000-ff3fffff : /ethernet@0xff3f0000
> ff500000-ff507fff : /dwc3@ff500000
>   ff500000-ff507fff : /dwc3@ff500000
> ff50c100-ff5fffff : /dwc3@ff500000
> ff634018-ff63401b : /rng
> ff634430-ff63446b : gpio
> ff634480-ff6344bf : mux
> ff6344e8-ff6344fb : pull
> ff634520-ff634533 : pull-enable
> ff634540-ff634547 : /ethernet@0xff3f0000
> ff63c400-ff63c44b : /mhu@c883c400
> ff642000-ff643fff : /soc/audiobus@0xff642000
> ff800014-ff80001b : mux
> ff800024-ff80002b : gpio
> ff80002c-ff80002f : pull
> ff803000-ff803017 : ff803000.serial
> ff805000-ff80501f : /soc/aobus@ff800000/i2c@5000
> ff809000-ff809037 : /saradc
> ffd13000-ffd1303b : /spi@ffd130000
> ffd1e000-ffd1e01f : /soc/cbus@ffd00000/i2c@1e000
> ffd23000-ffd23017 : ffd23000.serial
> ffe05000-ffe06fff : /sdio@ffe05000
> ffe07800-ffe079ff : ffe07800.mtd_nand
> ffe09000-ffe0907f : /usb2phy@ffe09000
> ffe09080-ffe0909f : /usb3phy@ffe09080
> fffd3000-fffd37ff : /mhu@c883c400
>
>
>

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/94f659ad-bfe9-4eda-8dfe-8d2296cea4e9n%40googlegroups.com.

------=_Part_6219_916337188.1656686426069
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div>After revisiting some documentation/tutorial video I realized that the=
re were significant misconceptions on my side.</div><div>I
 now placed the hypervisor memory outside of the linux memory defined in
 mem_regions and also added all regions used by the peripherals shown in=20
/proc/iomem.</div><div><br></div><div>However, unfortunately the board stil=
l is stuck after enabling and there is no output (CONFIG_TRACE_ERROR is ena=
bled).</div><div><br></div><div>#include &lt;jailhouse/types.h&gt;<br>#incl=
ude &lt;jailhouse/cell-config.h&gt;<br><br>struct {<br>&nbsp; &nbsp; struct=
 jailhouse_system header;<br>&nbsp; &nbsp; __u64 cpus[1];<br>&nbsp; &nbsp; =
struct jailhouse_memory mem_regions[3];<br>&nbsp; &nbsp; struct jailhouse_i=
rqchip irqchips[1];<br>} __attribute__((packed)) config =3D {<br>&nbsp; &nb=
sp; .header =3D {<br>&nbsp; &nbsp; &nbsp; &nbsp; .signature =3D JAILHOUSE_S=
YSTEM_SIGNATURE,<br>&nbsp; &nbsp; &nbsp; &nbsp; .revision =3D JAILHOUSE_CON=
FIG_REVISION,<br>&nbsp; &nbsp; &nbsp; &nbsp; .flags =3D JAILHOUSE_SYS_VIRTU=
AL_DEBUG_CONSOLE,<br>&nbsp; &nbsp; &nbsp; &nbsp; .hypervisor_memory =3D {<b=
r>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; .phys_start =3D 0x09000000,<br>=
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; .size =3D &nbsp; &nbsp; &nbsp; 0x=
00400000,<br>&nbsp; &nbsp; &nbsp; &nbsp; },<br>&nbsp; &nbsp; &nbsp; &nbsp; =
.debug_console =3D {<br>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; .flags =
=3D JAILHOUSE_CON_TYPE_NONE,<br>&nbsp; &nbsp; &nbsp; &nbsp; },<br>&nbsp; &n=
bsp; &nbsp; &nbsp; .platform_info =3D {<br>&nbsp; &nbsp; &nbsp; &nbsp; &nbs=
p; &nbsp; .arm =3D {<br>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &n=
bsp; .gic_version =3D 2,<br>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp=
; &nbsp; .gicd_base =3D 0xffc01000,<br>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &=
nbsp; &nbsp; &nbsp; .gicc_base =3D 0xffc02000,<br>&nbsp; &nbsp; &nbsp; &nbs=
p; &nbsp; &nbsp; &nbsp; &nbsp; .gich_base =3D 0xffc04000,<br>&nbsp; &nbsp; =
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; .gicv_base =3D 0xffc06000,<br>&nb=
sp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; .maintenance_irq =3D 2=
5,<br>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; },<br>&nbsp; &nbsp; &nbsp; =
&nbsp; },<br>&nbsp; &nbsp; &nbsp; &nbsp; .root_cell =3D {<br>&nbsp; &nbsp; =
&nbsp; &nbsp; &nbsp; &nbsp; .name =3D "a113x",<br>&nbsp; &nbsp; &nbsp; &nbs=
p; &nbsp; &nbsp; .cpu_set_size =3D sizeof(config.cpus),<br>&nbsp; &nbsp; &n=
bsp; &nbsp; &nbsp; &nbsp; .num_memory_regions =3D ARRAY_SIZE(config.mem_reg=
ions),<br>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; .num_irqchips =3D ARRAY=
_SIZE(config.irqchips),<br>&nbsp; &nbsp; &nbsp; &nbsp; },<br>&nbsp; &nbsp; =
},<br><br>&nbsp; &nbsp; .cpus =3D {<br>&nbsp; &nbsp; &nbsp; &nbsp; 0b1111,<=
br>&nbsp; &nbsp; },<br><br>&nbsp; &nbsp; .mem_regions =3D {<br>&nbsp; &nbsp=
; &nbsp; &nbsp; {<br>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp=
; &nbsp; &nbsp; &nbsp; &nbsp; .phys_start =3D 0xff3f0000,<br>&nbsp; &nbsp; =
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; .virt=
_start =3D 0xff3f0000,<br>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; =
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; .size =3D 0x419038,<br>&nbsp; &nbsp; &nb=
sp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; .flags =
=3D JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |<br>&nbsp; &nbsp; &nbsp; &nbs=
p; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &n=
bsp; &nbsp; JAILHOUSE_MEM_IO,<br>&nbsp; &nbsp; &nbsp; &nbsp; },<br>&nbsp; &=
nbsp; &nbsp; &nbsp; {<br>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &=
nbsp; &nbsp; &nbsp; &nbsp; &nbsp; .phys_start =3D 0xffd13000,<br>&nbsp; &nb=
sp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; .=
virt_start =3D 0xffd13000,<br>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nb=
sp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; .size =3D 0x2C07FF,<br>&nbsp; &nbsp;=
 &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; .fla=
gs =3D JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |<br>&nbsp; &nbsp; &nbsp; &=
nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;=
 &nbsp; &nbsp; JAILHOUSE_MEM_IO,<br>&nbsp; &nbsp; &nbsp; &nbsp; },<br>&nbsp=
; &nbsp; &nbsp; &nbsp; /* System RAM */ {<br>&nbsp; &nbsp; &nbsp; &nbsp; &n=
bsp; &nbsp; .phys_start =3D 0x00000000,<br>&nbsp; &nbsp; &nbsp; &nbsp; &nbs=
p; &nbsp; .virt_start =3D 0x00000000,<br>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;=
 &nbsp; .size =3D 0x08000000,<br>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; =
.flags =3D JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |<br>&nbsp; &nbsp; &nbs=
p; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; JAILHOUSE_MEM_EXECUTE,<br>&nbsp; &nbs=
p; &nbsp; &nbsp; },<br>&nbsp; &nbsp; },<br><br>&nbsp; &nbsp; .irqchips =3D =
{<br>&nbsp; &nbsp; &nbsp; &nbsp; /* GIC */ {<br>&nbsp; &nbsp; &nbsp; &nbsp;=
 &nbsp; &nbsp; .address =3D 0xffc01000,<br>&nbsp; &nbsp; &nbsp; &nbsp; &nbs=
p; &nbsp; .pin_base =3D 32,<br>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; .p=
in_bitmap =3D {<br>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; =
0xffffffff, 0xffffffff, 0xffffffff, 0xffffffff,<br>&nbsp; &nbsp; &nbsp; &nb=
sp; &nbsp; &nbsp; },<br>&nbsp; &nbsp; &nbsp; &nbsp; },<br>&nbsp; &nbsp; },<=
br>};</div><br><br><div class=3D"gmail_quote"><div dir=3D"auto" class=3D"gm=
ail_attr">lpfeifhofer schrieb am Donnerstag, 30. Juni 2022 um 14:42:20 UTC+=
2:<br/></div><blockquote class=3D"gmail_quote" style=3D"margin: 0 0 0 0.8ex=
; border-left: 1px solid rgb(204, 204, 204); padding-left: 1ex;"><div>Hi, I=
 am currently trying to get jailhouse running on a new arm64 target (Cortex=
-A53).
 I am trying to get a minimal root cell configuration working but at the
 moment when enabling it it just immediately crashes the board (stuck=20
without any output).</div><div><br></div><div><span> The physical memory on=
 the board seems to be available from 00000000-1fffffff (/proc/iomem) and i=
nitially </span>I reduced the memory for Linux using <span>mem=3D128M to be=
 able to place jailhouse into the upper regions (see below, starting at <sp=
an>0x08000000)</span>.</span></div><div><span><br></span></div><div><span>F=
ollowing that I tried to make sense on how the GIC needs to be set up. From=
 what I know the device uses a GIC<span> v2</span> with base address <span>=
0xffc01000. This can be found in the linux device tree here: <a href=3D"htt=
ps://github.com/khadas/linux/blob/khadas-vims-5.4.y/arch/arm64/boot/dts/aml=
ogic/mesont7.dtsi#L285" target=3D"_blank" rel=3D"nofollow" data-saferedirec=
turl=3D"https://www.google.com/url?hl=3Dde&amp;q=3Dhttps://github.com/khada=
s/linux/blob/khadas-vims-5.4.y/arch/arm64/boot/dts/amlogic/mesont7.dtsi%23L=
285&amp;source=3Dgmail&amp;ust=3D1656771999628000&amp;usg=3DAOvVaw1I_zT5j0Q=
cy38cimDciTRv">https://github.com/khadas/linux/blob/khadas-vims-5.4.y/arch/=
arm64/boot/dts/amlogic/mesont7.dtsi#L285</a></span></span></div><div><span>=
<br></span></div><div><span>However,
 there it only features 2 entries, and in all v2 configurations found in
 the jailhouse repo 4 addresses are used. (GIC v3 seems to use only=20
two).</span></div><div><span><br></span></div><div><span>In addition I am n=
ot sure what the purpose of <span>irqchips is and how that should look like=
. Is this to communicate to jailhouse what interrupts it can make use of?<b=
r></span></span></div><div><span><span><br></span></span></div><div><span><=
span>It
 would be great to get some feedback if I correctly configured the GIC (and=
=20
memory) and if what I am seeing could be related to a incorrect=20
configuration on my side. (I might also have to extend this configuration, =
I assumed what I have is enough for a minimal setup.)<br></span></span></di=
v><div><span><br></span></div><div><span>struct {<br>=C2=A0 =C2=A0 struct j=
ailhouse_system header;<br>=C2=A0 =C2=A0 __u64 cpus[1];<br>=C2=A0 =C2=A0 st=
ruct jailhouse_memory mem_regions[1];<br>=C2=A0 =C2=A0 struct jailhouse_irq=
chip irqchips[1];<br>=C2=A0 =C2=A0 struct jailhouse_pci_device pci_devices[=
0];<br>} __attribute__((packed)) config =3D {<br>=C2=A0 =C2=A0 .header =3D =
{<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 .signature =3D JAILHOUSE_SYSTEM_SIGNATURE,=
<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 .revision =3D JAILHOUSE_CONFIG_REVISION,<br=
>=C2=A0 =C2=A0 =C2=A0 =C2=A0 .flags =3D JAILHOUSE_SYS_VIRTUAL_DEBUG_CONSOLE=
,<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 .hypervisor_memory =3D {<br>=C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 .phys_start =3D 0x08000000,<br>=C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 .size =3D =C2=A0 =C2=A0 =C2=A0 0x04000000,<br>=
=C2=A0 =C2=A0 =C2=A0 =C2=A0 },<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 .debug_consol=
e =3D {<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 .flags =3D JAILHOUSE_C=
ON_TYPE_NONE,<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 },<br>=C2=A0 =C2=A0 =C2=A0 =C2=
=A0 .platform_info =3D {<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 .pci_=
mmconfig_base =3D 0x0C000000,<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
.pci_mmconfig_end_bus =3D 0,<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 .=
pci_is_virtual =3D 1,<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 .arm =3D=
 {<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 .gic_version =
=3D 2,<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 .gicd_bas=
e =3D 0xffc01000,<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 .gicc_base =3D 0xffc02000,<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 .gich_base =3D 0xffc04000,<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 .gicv_base =3D 0xffc06000,<br>=C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 .maintenance_irq =3D 25,<br>=C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 },<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 },<br>=
=C2=A0 =C2=A0 =C2=A0 =C2=A0 .root_cell =3D {<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 .name =3D &quot;AM113&quot;,<br><br>=C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 .cpu_set_size =3D sizeof(config.cpus),<br>=C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 .num_memory_regions =3D ARRAY_SIZE(config.mem_r=
egions),<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 .num_irqchips =3D ARR=
AY_SIZE(config.irqchips),<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 .num=
_pci_devices =3D ARRAY_SIZE(config.pci_devices),<br><br>=C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 .vpci_irq_base =3D 108,<br>=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 },<br>=C2=A0 =C2=A0 },<br><br>=C2=A0 =C2=A0 .cpus =3D {<br>=C2=A0 =
=C2=A0 =C2=A0 =C2=A0 0b1111,<br>=C2=A0 =C2=A0 },<br><br>=C2=A0 =C2=A0 .mem_=
regions =3D {<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 /* System RAM */ {<br>=C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 .phys_start =3D 0x08000000,<br>=C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 .virt_start =3D 0x08000000,<br>=C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 .size =3D 0x04000000,<br>=C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 .flags =3D JAILHOUSE_MEM_READ | JAILHOUSE_MEM_W=
RITE |<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 JAILHOUSE=
_MEM_EXECUTE,<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 },<br>=C2=A0 =C2=A0 },<br><br>=
=C2=A0 =C2=A0 .irqchips =3D {<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 /* GIC */ {<br=
>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 .address =3D 0xffc01000,<br>=C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 .pin_base =3D 32,<br>=C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 .pin_bitmap =3D {<br>=C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 0xffffffff, 0xffffffff, 0xffffffff, 0xfffff=
fff,<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 },<br>=C2=A0 =C2=A0 =C2=
=A0 =C2=A0 },<br>=C2=A0 =C2=A0 },<br><br>=C2=A0 =C2=A0 .pci_devices =3D {<b=
r><br>=C2=A0 =C2=A0 },<br>};</span></div><div><span><br></span></div><div><=
span><br></span></div><div><span># cat /proc/iomem <br>00000000-07ffffff : =
System RAM<br>=C2=A0 03000000-03e3ffff : Kernel code<br>=C2=A0 04030000-04b=
cbfff : Kernel data<br>ff3f0000-ff3fffff : /ethernet@0xff3f0000<br>ff500000=
-ff507fff : /dwc3@ff500000<br>=C2=A0 ff500000-ff507fff : /dwc3@ff500000<br>=
ff50c100-ff5fffff : /dwc3@ff500000<br>ff634018-ff63401b : /rng<br>ff634430-=
ff63446b : gpio<br>ff634480-ff6344bf : mux<br>ff6344e8-ff6344fb : pull<br>f=
f634520-ff634533 : pull-enable<br>ff634540-ff634547 : /ethernet@0xff3f0000<=
br>ff63c400-ff63c44b : /mhu@c883c400<br>ff642000-ff643fff : /soc/audiobus@0=
xff642000<br>ff800014-ff80001b : mux<br>ff800024-ff80002b : gpio<br>ff80002=
c-ff80002f : pull<br>ff803000-ff803017 : ff803000.serial<br>ff805000-ff8050=
1f : /soc/aobus@ff800000/i2c@5000<br>ff809000-ff809037 : /saradc<br>ffd1300=
0-ffd1303b : /spi@ffd130000<br>ffd1e000-ffd1e01f : /soc/cbus@ffd00000/i2c@1=
e000<br>ffd23000-ffd23017 : ffd23000.serial<br>ffe05000-ffe06fff : /sdio@ff=
e05000<br>ffe07800-ffe079ff : ffe07800.mtd_nand<br>ffe09000-ffe0907f : /usb=
2phy@ffe09000<br>ffe09080-ffe0909f : /usb3phy@ffe09080<br>fffd3000-fffd37ff=
 : /mhu@c883c400</span></div><br><br></blockquote></div>

<p></p>

-- <br />
You received this message because you are subscribed to the Google Groups &=
quot;Jailhouse&quot; group.<br />
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to <a href=3D"mailto:jailhouse-dev+unsubscribe@googlegroups.com">jailh=
ouse-dev+unsubscribe@googlegroups.com</a>.<br />
To view this discussion on the web visit <a href=3D"https://groups.google.c=
om/d/msgid/jailhouse-dev/94f659ad-bfe9-4eda-8dfe-8d2296cea4e9n%40googlegrou=
ps.com?utm_medium=3Demail&utm_source=3Dfooter">https://groups.google.com/d/=
msgid/jailhouse-dev/94f659ad-bfe9-4eda-8dfe-8d2296cea4e9n%40googlegroups.co=
m</a>.<br />

------=_Part_6219_916337188.1656686426069--

------=_Part_6218_663279452.1656686426069--
