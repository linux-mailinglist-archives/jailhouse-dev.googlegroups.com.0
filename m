Return-Path: <jailhouse-dev+bncBDDZR3MZ3QKBBLNU62KQMGQEUXRYEEY@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-qv1-xf40.google.com (mail-qv1-xf40.google.com [IPv6:2607:f8b0:4864:20::f40])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A4D4561A8D
	for <lists+jailhouse-dev@lfdr.de>; Thu, 30 Jun 2022 14:42:23 +0200 (CEST)
Received: by mail-qv1-xf40.google.com with SMTP id q36-20020a0c9127000000b00461e3828064sf18269418qvq.12
        for <lists+jailhouse-dev@lfdr.de>; Thu, 30 Jun 2022 05:42:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20210112;
        h=sender:date:from:to:message-id:subject:mime-version
         :x-original-sender:precedence:mailing-list:list-id:list-post
         :list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=CqfI3tlE6MSDw5aFlWn0Nav28sJ8YUDq4BqrjRwwb/A=;
        b=QR+YHM9clgUabVg1xTx9l3uwt5RYVCicoCQZiyhKPOzo3wExzVhZQ2/69H5tS0EKcp
         xuL5aJdOaYmcW7NPbgCXBdFqYrIQvHegn4xSWqV/1qTbh1AoWYd+XWplPNcDa9biCKQH
         +vjEQa3906ygt+dwd8S0WiGp3pzX8Ao+6eD+QBWNZrz8sWabJfsOrWVPFzBNrbGlb3Aa
         AmTuMLVR3GqCMtHGidken8DL6Z2Tcw+BnkpU6eTlZaV1BnmbKSx/6H+Yz+xWWzIMFw1e
         aszX7vd3bcJG6HpDxoQuiHrfHeQ7A0XGzgMp9lK7UXyAsOOp4fBH1Dn7lmiQXgCKzjQd
         WNUA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=devlabs-pro.20210112.gappssmtp.com; s=20210112;
        h=date:from:to:message-id:subject:mime-version:x-original-sender
         :precedence:mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=CqfI3tlE6MSDw5aFlWn0Nav28sJ8YUDq4BqrjRwwb/A=;
        b=GG4kW/ZdMIGKQANTPh83ZC8YLIgL36vWI3GV1aCO33st5BfVNX0qhKLMCpOeN43rEX
         YulLquHe4uIw63PEKLEsNVP2bU5Bo77eRPPewV6dleI8JofeXZopkeiHSUvPgvZGugiv
         LQQZU+D3F3AYEUJpq//iyYW98wkFdNu0/xn7vM1JfQAXc9qeYQ9Z+H1yw7Kn0gU0pQmY
         QgasEt/M5MrSHxwmnHkGvlk7V8MG/jpTqjw1MvkDfk8PoN4vT6m2lk+vruTIJpUhFeqm
         6JOrQ0tUDEdXgjtms3RHXHVgv98JRm70O5g6CWtLi9UYBRHkslenUgbOf8nIAEDn741H
         /lsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=sender:x-gm-message-state:date:from:to:message-id:subject
         :mime-version:x-original-sender:precedence:mailing-list:list-id
         :x-spam-checked-in-group:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=CqfI3tlE6MSDw5aFlWn0Nav28sJ8YUDq4BqrjRwwb/A=;
        b=FZzb7OMisZRRUG6gJ3zURFkF4sJiAmOtXqPBqh4FdS0epCZ3EeUcXqehEz0gdlPkzP
         heEsDPqwTa5yTfY/3lYrJ+L7rr/IYc5RIrdY2rS7lAZiJ0i1yaeZdIr6g8CVudmvWmVP
         tAB/P5mLBjHBtkM76UqtIog/ra9n5RbTi+iYd6HXBNkaYlMzi8dB9T1eStTDId9TUBG8
         SwIq16Diq8lFF5U80JpqfdoKafNhJZUaMhw55gULO2ODUdxJ9/gf7CngbHWJAoqTppJL
         g8oyZkiKaJBUiLkN9TbFDEekQWewB0DSonqnWIK92PmDX621B3NsbP9oUW18WphQ5qsH
         ACpw==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AJIora+dyD0la1q9+eoq41qNPLPIKrkzCPMIrPWw//w5RdEFVns5hfeM
	jz8H2VGFNpTzn5lnwp7/Uic=
X-Google-Smtp-Source: AGRyM1uDvSRnP8fP1Oxp6jpYXuruCXEO/uQ9c/7MgYH80MYpcHWtOUXfTSw28FvdIIuJZ79YfXK5Sg==
X-Received: by 2002:a37:9f4a:0:b0:6ae:e0da:a321 with SMTP id i71-20020a379f4a000000b006aee0daa321mr5894915qke.752.1656592942282;
        Thu, 30 Jun 2022 05:42:22 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:ac8:58cb:0:b0:318:dc4:3e8c with SMTP id u11-20020ac858cb000000b003180dc43e8cls8952229qta.7.gmail;
 Thu, 30 Jun 2022 05:42:21 -0700 (PDT)
X-Received: by 2002:ac8:5851:0:b0:317:cd4c:e7f2 with SMTP id h17-20020ac85851000000b00317cd4ce7f2mr7267890qth.580.1656592940538;
        Thu, 30 Jun 2022 05:42:20 -0700 (PDT)
Date: Thu, 30 Jun 2022 05:42:19 -0700 (PDT)
From: lpfeifhofer <l.pfeifhofer@devlabs.pro>
To: Jailhouse <jailhouse-dev@googlegroups.com>
Message-Id: <515276d4-6a49-4734-92f9-8fcae109edd3n@googlegroups.com>
Subject: Root cell configuration for new arm64 target (interrupt controller)
MIME-Version: 1.0
Content-Type: multipart/mixed; 
	boundary="----=_Part_508_730802160.1656592939880"
X-Original-Sender: l.pfeifhofer@devlabs.pro
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

------=_Part_508_730802160.1656592939880
Content-Type: multipart/alternative; 
	boundary="----=_Part_509_1197424081.1656592939880"

------=_Part_509_1197424081.1656592939880
Content-Type: text/plain; charset="UTF-8"

Hi, I am currently trying to get jailhouse running on a new arm64 target 
(Cortex-A53). I am trying to get a minimal root cell configuration working 
but at the moment when enabling it it just immediately crashes the board 
(stuck without any output).

The physical memory on the board seems to be available from 
00000000-1fffffff (/proc/iomem) and initially I reduced the memory for 
Linux using mem=128M to be able to place jailhouse into the upper regions 
(see below, starting at 0x08000000).

Following that I tried to make sense on how the GIC needs to be set up. 
From what I know the device uses a GIC v2 with base address 0xffc01000. 
This can be found in the linux device tree here: 
https://github.com/khadas/linux/blob/khadas-vims-5.4.y/arch/arm64/boot/dts/amlogic/mesont7.dtsi#L285

However, there it only features 2 entries, and in all v2 configurations 
found in the jailhouse repo 4 addresses are used. (GIC v3 seems to use only 
two).

In addition I am not sure what the purpose of irqchips is and how that 
should look like. Is this to communicate to jailhouse what interrupts it 
can make use of?

It would be great to get some feedback if I correctly configured the GIC 
(and memory) and if what I am seeing could be related to a incorrect 
configuration on my side. (I might also have to extend this configuration, 
I assumed what I have is enough for a minimal setup.)

struct {
    struct jailhouse_system header;
    __u64 cpus[1];
    struct jailhouse_memory mem_regions[1];
    struct jailhouse_irqchip irqchips[1];
    struct jailhouse_pci_device pci_devices[0];
} __attribute__((packed)) config = {
    .header = {
        .signature = JAILHOUSE_SYSTEM_SIGNATURE,
        .revision = JAILHOUSE_CONFIG_REVISION,
        .flags = JAILHOUSE_SYS_VIRTUAL_DEBUG_CONSOLE,
        .hypervisor_memory = {
            .phys_start = 0x08000000,
            .size =       0x04000000,
        },
        .debug_console = {
            .flags = JAILHOUSE_CON_TYPE_NONE,
        },
        .platform_info = {
            .pci_mmconfig_base = 0x0C000000,
            .pci_mmconfig_end_bus = 0,
            .pci_is_virtual = 1,
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
            .name = "AM113",

            .cpu_set_size = sizeof(config.cpus),
            .num_memory_regions = ARRAY_SIZE(config.mem_regions),
            .num_irqchips = ARRAY_SIZE(config.irqchips),
            .num_pci_devices = ARRAY_SIZE(config.pci_devices),

            .vpci_irq_base = 108,
        },
    },

    .cpus = {
        0b1111,
    },

    .mem_regions = {
        /* System RAM */ {
            .phys_start = 0x08000000,
            .virt_start = 0x08000000,
            .size = 0x04000000,
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

    .pci_devices = {

    },
};


# cat /proc/iomem 
00000000-07ffffff : System RAM
  03000000-03e3ffff : Kernel code
  04030000-04bcbfff : Kernel data
ff3f0000-ff3fffff : /ethernet@0xff3f0000
ff500000-ff507fff : /dwc3@ff500000
  ff500000-ff507fff : /dwc3@ff500000
ff50c100-ff5fffff : /dwc3@ff500000
ff634018-ff63401b : /rng
ff634430-ff63446b : gpio
ff634480-ff6344bf : mux
ff6344e8-ff6344fb : pull
ff634520-ff634533 : pull-enable
ff634540-ff634547 : /ethernet@0xff3f0000
ff63c400-ff63c44b : /mhu@c883c400
ff642000-ff643fff : /soc/audiobus@0xff642000
ff800014-ff80001b : mux
ff800024-ff80002b : gpio
ff80002c-ff80002f : pull
ff803000-ff803017 : ff803000.serial
ff805000-ff80501f : /soc/aobus@ff800000/i2c@5000
ff809000-ff809037 : /saradc
ffd13000-ffd1303b : /spi@ffd130000
ffd1e000-ffd1e01f : /soc/cbus@ffd00000/i2c@1e000
ffd23000-ffd23017 : ffd23000.serial
ffe05000-ffe06fff : /sdio@ffe05000
ffe07800-ffe079ff : ffe07800.mtd_nand
ffe09000-ffe0907f : /usb2phy@ffe09000
ffe09080-ffe0909f : /usb3phy@ffe09080
fffd3000-fffd37ff : /mhu@c883c400


-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/515276d4-6a49-4734-92f9-8fcae109edd3n%40googlegroups.com.

------=_Part_509_1197424081.1656592939880
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div>Hi, I am currently trying to get jailhouse running on a new arm64 targ=
et (Cortex-A53).
 I am trying to get a minimal root cell configuration working but at the
 moment when enabling it it just immediately crashes the board (stuck=20
without any output).</div><div><br></div><div><span> The physical memory on=
 the board seems to be available from 00000000-1fffffff (/proc/iomem) and i=
nitially </span>I reduced the memory for Linux using <span>mem=3D128M to be=
 able to place jailhouse into the upper regions (see below, starting at <sp=
an>0x08000000)</span>.</span></div><div><span><br></span></div><div><span>F=
ollowing that I tried to make sense on how the GIC needs to be set up. From=
 what I know the device uses a GIC<span> v2</span> with base address <span>=
0xffc01000. This can be found in the linux device tree here: https://github=
.com/khadas/linux/blob/khadas-vims-5.4.y/arch/arm64/boot/dts/amlogic/mesont=
7.dtsi#L285</span></span></div><div><span><br></span></div><div><span>Howev=
er,
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
v><div><span><br></span></div><div><span>struct {<br>&nbsp; &nbsp; struct j=
ailhouse_system header;<br>&nbsp; &nbsp; __u64 cpus[1];<br>&nbsp; &nbsp; st=
ruct jailhouse_memory mem_regions[1];<br>&nbsp; &nbsp; struct jailhouse_irq=
chip irqchips[1];<br>&nbsp; &nbsp; struct jailhouse_pci_device pci_devices[=
0];<br>} __attribute__((packed)) config =3D {<br>&nbsp; &nbsp; .header =3D =
{<br>&nbsp; &nbsp; &nbsp; &nbsp; .signature =3D JAILHOUSE_SYSTEM_SIGNATURE,=
<br>&nbsp; &nbsp; &nbsp; &nbsp; .revision =3D JAILHOUSE_CONFIG_REVISION,<br=
>&nbsp; &nbsp; &nbsp; &nbsp; .flags =3D JAILHOUSE_SYS_VIRTUAL_DEBUG_CONSOLE=
,<br>&nbsp; &nbsp; &nbsp; &nbsp; .hypervisor_memory =3D {<br>&nbsp; &nbsp; =
&nbsp; &nbsp; &nbsp; &nbsp; .phys_start =3D 0x08000000,<br>&nbsp; &nbsp; &n=
bsp; &nbsp; &nbsp; &nbsp; .size =3D &nbsp; &nbsp; &nbsp; 0x04000000,<br>&nb=
sp; &nbsp; &nbsp; &nbsp; },<br>&nbsp; &nbsp; &nbsp; &nbsp; .debug_console =
=3D {<br>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; .flags =3D JAILHOUSE_CON=
_TYPE_NONE,<br>&nbsp; &nbsp; &nbsp; &nbsp; },<br>&nbsp; &nbsp; &nbsp; &nbsp=
; .platform_info =3D {<br>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; .pci_mm=
config_base =3D 0x0C000000,<br>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; .p=
ci_mmconfig_end_bus =3D 0,<br>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; .pc=
i_is_virtual =3D 1,<br>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; .arm =3D {=
<br>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; .gic_version =
=3D 2,<br>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; .gicd_bas=
e =3D 0xffc01000,<br>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp=
; .gicc_base =3D 0xffc02000,<br>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &=
nbsp; &nbsp; .gich_base =3D 0xffc04000,<br>&nbsp; &nbsp; &nbsp; &nbsp; &nbs=
p; &nbsp; &nbsp; &nbsp; .gicv_base =3D 0xffc06000,<br>&nbsp; &nbsp; &nbsp; =
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; .maintenance_irq =3D 25,<br>&nbsp; &nbsp=
; &nbsp; &nbsp; &nbsp; &nbsp; },<br>&nbsp; &nbsp; &nbsp; &nbsp; },<br>&nbsp=
; &nbsp; &nbsp; &nbsp; .root_cell =3D {<br>&nbsp; &nbsp; &nbsp; &nbsp; &nbs=
p; &nbsp; .name =3D "AM113",<br><br>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbs=
p; .cpu_set_size =3D sizeof(config.cpus),<br>&nbsp; &nbsp; &nbsp; &nbsp; &n=
bsp; &nbsp; .num_memory_regions =3D ARRAY_SIZE(config.mem_regions),<br>&nbs=
p; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; .num_irqchips =3D ARRAY_SIZE(config.i=
rqchips),<br>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; .num_pci_devices =3D=
 ARRAY_SIZE(config.pci_devices),<br><br>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; =
&nbsp; .vpci_irq_base =3D 108,<br>&nbsp; &nbsp; &nbsp; &nbsp; },<br>&nbsp; =
&nbsp; },<br><br>&nbsp; &nbsp; .cpus =3D {<br>&nbsp; &nbsp; &nbsp; &nbsp; 0=
b1111,<br>&nbsp; &nbsp; },<br><br>&nbsp; &nbsp; .mem_regions =3D {<br>&nbsp=
; &nbsp; &nbsp; &nbsp; /* System RAM */ {<br>&nbsp; &nbsp; &nbsp; &nbsp; &n=
bsp; &nbsp; .phys_start =3D 0x08000000,<br>&nbsp; &nbsp; &nbsp; &nbsp; &nbs=
p; &nbsp; .virt_start =3D 0x08000000,<br>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;=
 &nbsp; .size =3D 0x04000000,<br>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; =
.flags =3D JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |<br>&nbsp; &nbsp; &nbs=
p; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; JAILHOUSE_MEM_EXECUTE,<br>&nbsp; &nbs=
p; &nbsp; &nbsp; },<br>&nbsp; &nbsp; },<br><br>&nbsp; &nbsp; .irqchips =3D =
{<br>&nbsp; &nbsp; &nbsp; &nbsp; /* GIC */ {<br>&nbsp; &nbsp; &nbsp; &nbsp;=
 &nbsp; &nbsp; .address =3D 0xffc01000,<br>&nbsp; &nbsp; &nbsp; &nbsp; &nbs=
p; &nbsp; .pin_base =3D 32,<br>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; .p=
in_bitmap =3D {<br>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; =
0xffffffff, 0xffffffff, 0xffffffff, 0xffffffff,<br>&nbsp; &nbsp; &nbsp; &nb=
sp; &nbsp; &nbsp; },<br>&nbsp; &nbsp; &nbsp; &nbsp; },<br>&nbsp; &nbsp; },<=
br><br>&nbsp; &nbsp; .pci_devices =3D {<br><br>&nbsp; &nbsp; },<br>};</span=
></div><div><span><br></span></div><div><span><br></span></div><div><span>#=
 cat /proc/iomem <br>00000000-07ffffff : System RAM<br>&nbsp; 03000000-03e3=
ffff : Kernel code<br>&nbsp; 04030000-04bcbfff : Kernel data<br>ff3f0000-ff=
3fffff : /ethernet@0xff3f0000<br>ff500000-ff507fff : /dwc3@ff500000<br>&nbs=
p; ff500000-ff507fff : /dwc3@ff500000<br>ff50c100-ff5fffff : /dwc3@ff500000=
<br>ff634018-ff63401b : /rng<br>ff634430-ff63446b : gpio<br>ff634480-ff6344=
bf : mux<br>ff6344e8-ff6344fb : pull<br>ff634520-ff634533 : pull-enable<br>=
ff634540-ff634547 : /ethernet@0xff3f0000<br>ff63c400-ff63c44b : /mhu@c883c4=
00<br>ff642000-ff643fff : /soc/audiobus@0xff642000<br>ff800014-ff80001b : m=
ux<br>ff800024-ff80002b : gpio<br>ff80002c-ff80002f : pull<br>ff803000-ff80=
3017 : ff803000.serial<br>ff805000-ff80501f : /soc/aobus@ff800000/i2c@5000<=
br>ff809000-ff809037 : /saradc<br>ffd13000-ffd1303b : /spi@ffd130000<br>ffd=
1e000-ffd1e01f : /soc/cbus@ffd00000/i2c@1e000<br>ffd23000-ffd23017 : ffd230=
00.serial<br>ffe05000-ffe06fff : /sdio@ffe05000<br>ffe07800-ffe079ff : ffe0=
7800.mtd_nand<br>ffe09000-ffe0907f : /usb2phy@ffe09000<br>ffe09080-ffe0909f=
 : /usb3phy@ffe09080<br>fffd3000-fffd37ff : /mhu@c883c400</span></div><br><=
br>

<p></p>

-- <br />
You received this message because you are subscribed to the Google Groups &=
quot;Jailhouse&quot; group.<br />
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to <a href=3D"mailto:jailhouse-dev+unsubscribe@googlegroups.com">jailh=
ouse-dev+unsubscribe@googlegroups.com</a>.<br />
To view this discussion on the web visit <a href=3D"https://groups.google.c=
om/d/msgid/jailhouse-dev/515276d4-6a49-4734-92f9-8fcae109edd3n%40googlegrou=
ps.com?utm_medium=3Demail&utm_source=3Dfooter">https://groups.google.com/d/=
msgid/jailhouse-dev/515276d4-6a49-4734-92f9-8fcae109edd3n%40googlegroups.co=
m</a>.<br />

------=_Part_509_1197424081.1656592939880--

------=_Part_508_730802160.1656592939880--
