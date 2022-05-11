Return-Path: <jailhouse-dev+bncBCH5DAO5VMDRB7E756JQMGQE6VOASGI@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-qt1-x838.google.com (mail-qt1-x838.google.com [IPv6:2607:f8b0:4864:20::838])
	by mail.lfdr.de (Postfix) with ESMTPS id AC9BA523698
	for <lists+jailhouse-dev@lfdr.de>; Wed, 11 May 2022 17:02:21 +0200 (CEST)
Received: by mail-qt1-x838.google.com with SMTP id a24-20020ac81098000000b002e1e06a72aesf1790993qtj.6
        for <lists+jailhouse-dev@lfdr.de>; Wed, 11 May 2022 08:02:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20210112;
        h=sender:date:from:to:message-id:in-reply-to:references:subject
         :mime-version:x-original-sender:precedence:mailing-list:list-id
         :list-post:list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=RHXSrNWT1Wka/LQz21dzrk8cxp1CF7eUzCxUar3LEaY=;
        b=rxR7xvaTv/T1ulWhTTKVPANEDGow4Y2OgUGANt58QaCf1Lt590HliLSQAK4ab+SxuU
         5d/jt3Th5Lq8laEX20F6d8fgv5jzQe+haH4/UY+N5vWrRF3SxpKl9MgsyHAOPEYRYNmS
         rtVQRBY67N2ri49Aap/uG+ioqx9LlCAuIQXXoU4Flxpb3F5GBA+9ufwwyCtLIC5lJO1h
         w80a3GkeUfGF8JZm769dhF+mdexoevpTIi2PTFbA7+HJk4hkvNyCW0FCx/qrYfgHUVwb
         X8uca9VFEDoJQgJcuLien+M4cgxZEa+S6Gn3PKrLSJRLNPXtw/MguXZ/ow63A5L3F/WD
         BUWw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=date:from:to:message-id:in-reply-to:references:subject:mime-version
         :x-original-sender:precedence:mailing-list:list-id:list-post
         :list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=RHXSrNWT1Wka/LQz21dzrk8cxp1CF7eUzCxUar3LEaY=;
        b=az2oZVb64eUpxKa5qHfUDZvLwXUOQyAD+BY1a9SRiLHpR0YpyOwhP+17tNEZLuJmP8
         zKcuwUdy+0atFRuvJ+hBNlpocjFkp2fTbNgrEy1p3M70RKFVuMa3nXNCVxrcZtkYqqKQ
         qhr6NDbN08IPC1K3wk5CxlymnxpwH9PnksDWY9wF2GcIqLMO5tn0tGJD2KIY9+2z4Non
         yMYaEPTX6CixMH+TTea6TMDoaQY/8K7rO1LdUJ8hffGRZT+nC/Vwvavn6+hMiBmELhJc
         lMtEPNL7VqnijnoFc89CJO16+NcdDBkw03M5ChckqfIPd3XjL5uQ9QshppDhxD3MaSFE
         G+Mg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=sender:x-gm-message-state:date:from:to:message-id:in-reply-to
         :references:subject:mime-version:x-original-sender:precedence
         :mailing-list:list-id:x-spam-checked-in-group:list-post:list-help
         :list-archive:list-subscribe:list-unsubscribe;
        bh=RHXSrNWT1Wka/LQz21dzrk8cxp1CF7eUzCxUar3LEaY=;
        b=09Bm0ggbMndS13HP+lOUILWsWcBv3rfPULRcfRcEK7rfXRYh4XuU1G/H6lWv6Hc7tX
         BGZBXPRSwY8tGoHpPlDTxTA9J7cRMWi5xb8BARTCGiD3CIsFPv5tQNuCC1/b8HGwhkiO
         5zT7reezdkCG0+JWHBu+PiE78Vtn1tfV6UquYboxVdnIjY07Y2fGosGPWAdPV/CxuZTO
         NU25v9yvLP3aEJk9yzun9b6PX68SPOvLSRXUUN+fSXXjT4TR0EjhcGdBObCxnA48CYOK
         o6GaDoXXZ9+Xmc+zv2UhVrVaOfxFLAeABpmD4QfJA2mZFOe8vwVXu0yfNpVbYYWewdUv
         kx2w==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AOAM5316uARmhyDXMTwbgWEL0180ussVYVUjUTv5maKSn67pmrkdTIZj
	sTWGy9q7KOxHRZ7XFmvjjmg=
X-Google-Smtp-Source: ABdhPJzo3OGTo1hm2ZPkADoQrUASe1EEXoYK1zq5cXXBKFsLijf2WvUawciNj4bbNRKw2VC3Fv9v6A==
X-Received: by 2002:a05:620a:424e:b0:67e:4c1b:c214 with SMTP id w14-20020a05620a424e00b0067e4c1bc214mr19738429qko.651.1652281340463;
        Wed, 11 May 2022 08:02:20 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a05:620a:2698:b0:699:facb:954e with SMTP id
 c24-20020a05620a269800b00699facb954els1376915qkp.7.gmail; Wed, 11 May 2022
 08:02:19 -0700 (PDT)
X-Received: by 2002:a37:aa87:0:b0:6a0:6596:a367 with SMTP id t129-20020a37aa87000000b006a06596a367mr13941132qke.507.1652281339271;
        Wed, 11 May 2022 08:02:19 -0700 (PDT)
Date: Wed, 11 May 2022 08:02:18 -0700 (PDT)
From: Daniele Ottaviano <danieleottaviano97@gmail.com>
To: Jailhouse <jailhouse-dev@googlegroups.com>
Message-Id: <9806b760-e030-4183-8d18-7bc6349a027dn@googlegroups.com>
In-Reply-To: <9a81cc8e-3064-cad8-b66f-0711c2705111@siemens.com>
References: <9baeea16-0fdd-4be9-a227-ff94d1ae5e82n@googlegroups.com>
 <9a81cc8e-3064-cad8-b66f-0711c2705111@siemens.com>
Subject: Re: Jailhouse over ZCU-104
MIME-Version: 1.0
Content-Type: multipart/mixed; 
	boundary="----=_Part_848_557180963.1652281338656"
X-Original-Sender: Danieleottaviano97@gmail.com
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

------=_Part_848_557180963.1652281338656
Content-Type: multipart/alternative; 
	boundary="----=_Part_849_1605198334.1652281338656"

------=_Part_849_1605198334.1652281338656
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable


Hi, thank you for your reply.=20
I prefer, if possible, to use petalinux as a baseline to test also other=20
mechanisms such as OpenAMP and kernel configurations such as the Linux=20
Preempt-RT patch.=20
Anyway, you were right, there was a problem in the petalinux build that=20
luckily I managed to resolve. Now I'm able to boot the system but when I=20
try to enable jailhouse I have the following error:

root@xilinx-zcu104-2019_1:~# jailhouse enable /zynqmp-zcu104-root.cell

Initializing Jailhouse hypervisor v0.12 on CPU 3
Code location: 0x0000ffffc0200800
Page pool usage after early setup: mem 39/994, remap 0/131072
Initializing processors:
 CPU 3... OK
 CPU 1... OK
 CPU 0... OK
 CPU 2... OK
Initializing unit: irqchip
Initializing unit: ARM SMMU v3
Initializing unit: PVU IOMMU
Initializing unit: PCI
Adding virtual PCI device 00:00.0 to cell "ZCU104-root"
/home/user/jailhouse/hypervisor/ivshmem.c:407: returning error -EINVAL
JAILHOUSE_ENABLE: Invalid argument

I used a configuration file for zcu104 that I found in a mailing list=20
conversation https://groups.google.com/g/jailhouse-dev/c/vMTEE3pYyPg/m/Ueeq=
cdOhBgAJ=20
(It is a modified version of the Ultra96 file):
/*
 * Configuration for the ZCU104 root cell. Copied from ultra96.c
 * and changed where necessary.
 */

#include <jailhouse/types.h>
#include <jailhouse/cell-config.h>

struct {
    struct jailhouse_system header;
    __u64 cpus[1];
    struct jailhouse_memory mem_regions[3];
    struct jailhouse_irqchip irqchips[1];
    struct jailhouse_pci_device pci_devices[1];
} __attribute__((packed)) config =3D {
    .header =3D {
        .signature =3D JAILHOUSE_SYSTEM_SIGNATURE,
        .revision =3D JAILHOUSE_CONFIG_REVISION,
        .flags =3D JAILHOUSE_SYS_VIRTUAL_DEBUG_CONSOLE,
        .hypervisor_memory =3D {
            .phys_start =3D 0x7fc00000,
            .size =3D       0x00400000,
        },
        .debug_console =3D {
            .address =3D 0xff000000,
            .size =3D 0x1000,
            .type =3D JAILHOUSE_CON_TYPE_XUARTPS,
            .flags =3D JAILHOUSE_CON_ACCESS_MMIO |
                 JAILHOUSE_CON_REGDIST_4,
        },
        .platform_info =3D {
            .pci_mmconfig_base =3D 0xfc000000,
            .pci_mmconfig_end_bus =3D 0,
            .pci_is_virtual =3D 1,
            .arm =3D {
                .gic_version =3D 2,
                .gicd_base =3D 0xf9010000, /*GIC distributor register base*=
/
                .gicc_base =3D 0xf902f000, /*GIC cpu interface register bas=
e*/
                .gich_base =3D 0xf9040000, /*GIC virtual interface control=
=20
register base*/
                .gicv_base =3D 0xf906f000, /*GIC virtual cpu interface=20
register base*/
                .maintenance_irq =3D 25,
            },
        },
        .root_cell =3D {
            .name =3D "ZCU104-root",

            .cpu_set_size =3D sizeof(config.cpus),
            .num_memory_regions =3D ARRAY_SIZE(config.mem_regions),
            .num_irqchips =3D ARRAY_SIZE(config.irqchips),
            .num_pci_devices =3D ARRAY_SIZE(config.pci_devices),

            .vpci_irq_base =3D 136-32,
        },
    },

    .cpus =3D {
        0xf,
    },

    .mem_regions =3D {
        /* MMIO (permissive) */ {
            .phys_start =3D 0xfd000000,
            .virt_start =3D 0xfd000000,
            .size =3D          0x03000000,
            .flags =3D JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
                JAILHOUSE_MEM_IO,
        },
        /* RAM */ {
            .phys_start =3D 0x00000000,
            .virt_start =3D 0x00000000,
            .size =3D       0x7fb00000,
            .flags =3D JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
                JAILHOUSE_MEM_EXECUTE,
        },
        /* IVSHMEM shared memory region for 00:00.0 */ {
            .phys_start =3D 0x7fb00000,
            .virt_start =3D 0x7fb00000,
            .size =3D       0x00100000,
            .flags =3D JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE,
        },
    },

    .irqchips =3D {
        /* GIC */ {
            .address =3D 0xf9010000,
            .pin_base =3D 32,
            .pin_bitmap =3D {
                0xffffffff, 0xffffffff, 0xffffffff, 0xffffffff,
            },
        },
    },

    .pci_devices =3D {
        /* 0000:00:00.0 */ {
            .type =3D JAILHOUSE_PCI_TYPE_IVSHMEM,
            .domain =3D 0,
            .bdf =3D 0x00 << 3,
            .bar_mask =3D {
                0xffffff00, 0xffffffff, 0x00000000,
                0x00000000, 0x00000000, 0x00000000,
            },
            .shmem_region =3D 2,
            .shmem_protocol =3D JAILHOUSE_SHMEM_PROTO_UNDEFINED,
        },
    },
};

Do you have any clues about this problem?  Maybe there are errors in the=20
".pci_devices" field.=20

Il giorno mercoled=C3=AC 11 maggio 2022 alle 16:24:22 UTC+2=20
j.kiszka...@gmail.com ha scritto:

> On 10.05.22 16:07, Daniele Ottaviano wrote:
> > Hi,
> > I'm trying to run Jailhouse over Zynq Ultrascale+ ZCU104. I have found =
a
> > guide showing the setup for ZCU102 but it doesn't work for me:
> >=20
> https://github.com/siemens/jailhouse/blob/master/Documentation/setup-on-z=
ynqmp-zcu102.md
> =20
> >=20
> > First I tried to compile jailhouse on a build created with petalinux
> > 2022 but it fails.=20
> > So I decided to use the old release of petalinux 2019.1 because it work=
s
> > according to this guide:
> >=20
> https://www.erika-enterprise.com/wiki/index.php/Xilinx_ZCU102#Setup_of_th=
e_GNU_Compiler_for_aarch64
> .
> >=20
> > In this case, I'm able to compile Jailhouse but when I start the board
> > the process stops at boot time.
>
> Before even enabling Jailhouse? Then it's a Petalinux topic, I assume.
>
> >=20
> > Has anyone successfully ported Jailhouse to zcu104 yet?
>
> Conceptually, it should be close to the Ultra96, thus the integration
> done in jailhouse-images - unless you really want or have to use
> petalinux as baseline. But even then, looking at configs can be helpful.
>
> Jan
>
> --=20
> Siemens AG, Technology
> Competence Center Embedded Linux
>

--=20
You received this message because you are subscribed to the Google Groups "=
Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/=
jailhouse-dev/9806b760-e030-4183-8d18-7bc6349a027dn%40googlegroups.com.

------=_Part_849_1605198334.1652281338656
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<br>Hi, thank you for your reply.&nbsp;<div>I prefer, if possible, to use p=
etalinux as a baseline to test also other mechanisms such as OpenAMP and ke=
rnel configurations such as the Linux Preempt-RT patch.&nbsp;</div><div>Any=
way, you were right, there was a problem in the petalinux build that luckil=
y I managed to resolve. Now I'm able to boot the system but when I try to e=
nable jailhouse I have the following error:</div><div><br></div><div>root@x=
ilinx-zcu104-2019_1:~# jailhouse enable /zynqmp-zcu104-root.cell<br><br>Ini=
tializing Jailhouse hypervisor v0.12 on CPU 3<br>Code location: 0x0000ffffc=
0200800<br>Page pool usage after early setup: mem 39/994, remap 0/131072<br=
>Initializing processors:<br>&nbsp;CPU 3... OK<br>&nbsp;CPU 1... OK<br>&nbs=
p;CPU 0... OK<br>&nbsp;CPU 2... OK<br>Initializing unit: irqchip<br>Initial=
izing unit: ARM SMMU v3<br>Initializing unit: PVU IOMMU<br>Initializing uni=
t: PCI<br>Adding virtual PCI device 00:00.0 to cell "ZCU104-root"<br>/home/=
user/jailhouse/hypervisor/ivshmem.c:407: returning error -EINVAL<br>JAILHOU=
SE_ENABLE: Invalid argument<br></div><div><br></div><div>I used a configura=
tion file for zcu104 that I found in a mailing list conversation&nbsp;https=
://groups.google.com/g/jailhouse-dev/c/vMTEE3pYyPg/m/UeeqcdOhBgAJ (It is a =
modified version of the Ultra96 file):</div><div>/*<br>&nbsp;* Configuratio=
n for the ZCU104 root cell. Copied from ultra96.c<br>&nbsp;* and changed wh=
ere necessary.<br>&nbsp;*/<br><br>#include &lt;jailhouse/types.h&gt;<br>#in=
clude &lt;jailhouse/cell-config.h&gt;<br><br>struct {<br>&nbsp; &nbsp; stru=
ct jailhouse_system header;<br>&nbsp; &nbsp; __u64 cpus[1];<br>&nbsp; &nbsp=
; struct jailhouse_memory mem_regions[3];<br>&nbsp; &nbsp; struct jailhouse=
_irqchip irqchips[1];<br>&nbsp; &nbsp; struct jailhouse_pci_device pci_devi=
ces[1];<br>} __attribute__((packed)) config =3D {<br>&nbsp; &nbsp; .header =
=3D {<br>&nbsp; &nbsp; &nbsp; &nbsp; .signature =3D JAILHOUSE_SYSTEM_SIGNAT=
URE,<br>&nbsp; &nbsp; &nbsp; &nbsp; .revision =3D JAILHOUSE_CONFIG_REVISION=
,<br>&nbsp; &nbsp; &nbsp; &nbsp; .flags =3D JAILHOUSE_SYS_VIRTUAL_DEBUG_CON=
SOLE,<br>&nbsp; &nbsp; &nbsp; &nbsp; .hypervisor_memory =3D {<br>&nbsp; &nb=
sp; &nbsp; &nbsp; &nbsp; &nbsp; .phys_start =3D 0x7fc00000,<br>&nbsp; &nbsp=
; &nbsp; &nbsp; &nbsp; &nbsp; .size =3D &nbsp; &nbsp; &nbsp; 0x00400000,<br=
>&nbsp; &nbsp; &nbsp; &nbsp; },<br>&nbsp; &nbsp; &nbsp; &nbsp; .debug_conso=
le =3D {<br>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; .address =3D 0xff0000=
00,<br>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; .size =3D 0x1000,<br>&nbsp=
; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; .type =3D JAILHOUSE_CON_TYPE_XUARTPS,<=
br>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; .flags =3D JAILHOUSE_CON_ACCES=
S_MMIO |<br>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;J=
AILHOUSE_CON_REGDIST_4,<br>&nbsp; &nbsp; &nbsp; &nbsp; },<br>&nbsp; &nbsp; =
&nbsp; &nbsp; .platform_info =3D {<br>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &n=
bsp; .pci_mmconfig_base =3D 0xfc000000,<br>&nbsp; &nbsp; &nbsp; &nbsp; &nbs=
p; &nbsp; .pci_mmconfig_end_bus =3D 0,<br>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp=
; &nbsp; .pci_is_virtual =3D 1,<br>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp=
; .arm =3D {<br>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; .gi=
c_version =3D 2,<br>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;=
 .gicd_base =3D 0xf9010000, /*GIC distributor register base*/<br>&nbsp; &nb=
sp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; .gicc_base =3D 0xf902f000, /*=
GIC cpu interface register base*/<br>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nb=
sp; &nbsp; &nbsp; .gich_base =3D 0xf9040000, /*GIC virtual interface contro=
l register base*/<br>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp=
; .gicv_base =3D 0xf906f000, /*GIC virtual cpu interface register base*/<br=
>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; .maintenance_irq =
=3D 25,<br>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; },<br>&nbsp; &nbsp; &n=
bsp; &nbsp; },<br>&nbsp; &nbsp; &nbsp; &nbsp; .root_cell =3D {<br>&nbsp; &n=
bsp; &nbsp; &nbsp; &nbsp; &nbsp; .name =3D "ZCU104-root",<br><br>&nbsp; &nb=
sp; &nbsp; &nbsp; &nbsp; &nbsp; .cpu_set_size =3D sizeof(config.cpus),<br>&=
nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; .num_memory_regions =3D ARRAY_SIZE=
(config.mem_regions),<br>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; .num_irq=
chips =3D ARRAY_SIZE(config.irqchips),<br>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp=
; &nbsp; .num_pci_devices =3D ARRAY_SIZE(config.pci_devices),<br><br>&nbsp;=
 &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; .vpci_irq_base =3D 136-32,<br>&nbsp; &n=
bsp; &nbsp; &nbsp; },<br>&nbsp; &nbsp; },<br><br>&nbsp; &nbsp; .cpus =3D {<=
br>&nbsp; &nbsp; &nbsp; &nbsp; 0xf,<br>&nbsp; &nbsp; },<br><br>&nbsp; &nbsp=
; .mem_regions =3D {<br>&nbsp; &nbsp; &nbsp; &nbsp; /* MMIO (permissive) */=
 {<br>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; .phys_start =3D 0xfd000000,=
<br>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; .virt_start =3D 0xfd000000,<b=
r>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; .size =3D &nbsp; &nbsp; &nbsp; =
&nbsp; &nbsp;0x03000000,<br>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; .flag=
s =3D JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |<br>&nbsp; &nbsp; &nbsp; &n=
bsp; &nbsp; &nbsp; &nbsp; &nbsp; JAILHOUSE_MEM_IO,<br>&nbsp; &nbsp; &nbsp; =
&nbsp; },<br>&nbsp; &nbsp; &nbsp; &nbsp; /* RAM */ {<br>&nbsp; &nbsp; &nbsp=
; &nbsp; &nbsp; &nbsp; .phys_start =3D 0x00000000,<br>&nbsp; &nbsp; &nbsp; =
&nbsp; &nbsp; &nbsp; .virt_start =3D 0x00000000,<br>&nbsp; &nbsp; &nbsp; &n=
bsp; &nbsp; &nbsp; .size =3D &nbsp; &nbsp; &nbsp; 0x7fb00000,<br>&nbsp; &nb=
sp; &nbsp; &nbsp; &nbsp; &nbsp; .flags =3D JAILHOUSE_MEM_READ | JAILHOUSE_M=
EM_WRITE |<br>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; JAILH=
OUSE_MEM_EXECUTE,<br>&nbsp; &nbsp; &nbsp; &nbsp; },<br>&nbsp; &nbsp; &nbsp;=
 &nbsp; /* IVSHMEM shared memory region for 00:00.0 */ {<br>&nbsp; &nbsp; &=
nbsp; &nbsp; &nbsp; &nbsp; .phys_start =3D 0x7fb00000,<br>&nbsp; &nbsp; &nb=
sp; &nbsp; &nbsp; &nbsp; .virt_start =3D 0x7fb00000,<br>&nbsp; &nbsp; &nbsp=
; &nbsp; &nbsp; &nbsp; .size =3D &nbsp; &nbsp; &nbsp; 0x00100000,<br>&nbsp;=
 &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; .flags =3D JAILHOUSE_MEM_READ | JAILHOU=
SE_MEM_WRITE,<br>&nbsp; &nbsp; &nbsp; &nbsp; },<br>&nbsp; &nbsp; },<br><br>=
&nbsp; &nbsp; .irqchips =3D {<br>&nbsp; &nbsp; &nbsp; &nbsp; /* GIC */ {<br=
>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; .address =3D 0xf9010000,<br>&nbs=
p; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; .pin_base =3D 32,<br>&nbsp; &nbsp; &n=
bsp; &nbsp; &nbsp; &nbsp; .pin_bitmap =3D {<br>&nbsp; &nbsp; &nbsp; &nbsp; =
&nbsp; &nbsp; &nbsp; &nbsp; 0xffffffff, 0xffffffff, 0xffffffff, 0xffffffff,=
<br>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; },<br>&nbsp; &nbsp; &nbsp; &n=
bsp; },<br>&nbsp; &nbsp; },<br><br>&nbsp; &nbsp; .pci_devices =3D {<br>&nbs=
p; &nbsp; &nbsp; &nbsp; /* 0000:00:00.0 */ {<br>&nbsp; &nbsp; &nbsp; &nbsp;=
 &nbsp; &nbsp; .type =3D JAILHOUSE_PCI_TYPE_IVSHMEM,<br>&nbsp; &nbsp; &nbsp=
; &nbsp; &nbsp; &nbsp; .domain =3D 0,<br>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;=
 &nbsp; .bdf =3D 0x00 &lt;&lt; 3,<br>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nb=
sp; .bar_mask =3D {<br>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nb=
sp; 0xffffff00, 0xffffffff, 0x00000000,<br>&nbsp; &nbsp; &nbsp; &nbsp; &nbs=
p; &nbsp; &nbsp; &nbsp; 0x00000000, 0x00000000, 0x00000000,<br>&nbsp; &nbsp=
; &nbsp; &nbsp; &nbsp; &nbsp; },<br>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbs=
p; .shmem_region =3D 2,<br>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; .shmem=
_protocol =3D JAILHOUSE_SHMEM_PROTO_UNDEFINED,<br>&nbsp; &nbsp; &nbsp; &nbs=
p; },<br>&nbsp; &nbsp; },<br>};<br></div><div><br></div><div>Do you have an=
y clues about this problem?&nbsp; Maybe there are errors in the ".pci_devic=
es" field.&nbsp;</div><div><br></div><div class=3D"gmail_quote"><div dir=3D=
"auto" class=3D"gmail_attr">Il giorno mercoled=C3=AC 11 maggio 2022 alle 16=
:24:22 UTC+2 j.kiszka...@gmail.com ha scritto:<br/></div><blockquote class=
=3D"gmail_quote" style=3D"margin: 0 0 0 0.8ex; border-left: 1px solid rgb(2=
04, 204, 204); padding-left: 1ex;">On 10.05.22 16:07, Daniele Ottaviano wro=
te:
<br>&gt; Hi,
<br>&gt; I&#39;m trying to run Jailhouse over Zynq Ultrascale+ ZCU104. I ha=
ve found a
<br>&gt; guide showing the setup for ZCU102 but it doesn&#39;t work for me:
<br>&gt; <a href=3D"https://github.com/siemens/jailhouse/blob/master/Docume=
ntation/setup-on-zynqmp-zcu102.md" target=3D"_blank" rel=3D"nofollow" data-=
saferedirecturl=3D"https://www.google.com/url?hl=3Dit&amp;q=3Dhttps://githu=
b.com/siemens/jailhouse/blob/master/Documentation/setup-on-zynqmp-zcu102.md=
&amp;source=3Dgmail&amp;ust=3D1652367109560000&amp;usg=3DAOvVaw168L0NvNe3HK=
UtSmTdSD_X">https://github.com/siemens/jailhouse/blob/master/Documentation/=
setup-on-zynqmp-zcu102.md</a>=C2=A0
<br>&gt;=20
<br>&gt; First I tried to compile jailhouse on a build created with petalin=
ux
<br>&gt; 2022 but it fails.=C2=A0
<br>&gt; So I decided to use the old release of petalinux 2019.1 because it=
 works
<br>&gt; according to this guide:
<br>&gt; <a href=3D"https://www.erika-enterprise.com/wiki/index.php/Xilinx_=
ZCU102#Setup_of_the_GNU_Compiler_for_aarch64" target=3D"_blank" rel=3D"nofo=
llow" data-saferedirecturl=3D"https://www.google.com/url?hl=3Dit&amp;q=3Dht=
tps://www.erika-enterprise.com/wiki/index.php/Xilinx_ZCU102%23Setup_of_the_=
GNU_Compiler_for_aarch64&amp;source=3Dgmail&amp;ust=3D1652367109560000&amp;=
usg=3DAOvVaw32a5-wgaxSWeYdxFSq2SIk">https://www.erika-enterprise.com/wiki/i=
ndex.php/Xilinx_ZCU102#Setup_of_the_GNU_Compiler_for_aarch64</a>.
<br>&gt;=20
<br>&gt; In this case, I&#39;m able to compile Jailhouse but when I start t=
he board
<br>&gt; the process stops at boot time.
<br>
<br>Before even enabling Jailhouse? Then it&#39;s a Petalinux topic, I assu=
me.
<br>
<br>&gt;=20
<br>&gt; Has anyone successfully ported Jailhouse to zcu104 yet?
<br>
<br>Conceptually, it should be close to the Ultra96, thus the integration
<br>done in jailhouse-images - unless you really want or have to use
<br>petalinux as baseline. But even then, looking at configs can be helpful=
.
<br>
<br>Jan
<br>
<br>--=20
<br>Siemens AG, Technology
<br>Competence Center Embedded Linux
<br></blockquote></div>

<p></p>

-- <br />
You received this message because you are subscribed to the Google Groups &=
quot;Jailhouse&quot; group.<br />
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to <a href=3D"mailto:jailhouse-dev+unsubscribe@googlegroups.com">jailh=
ouse-dev+unsubscribe@googlegroups.com</a>.<br />
To view this discussion on the web visit <a href=3D"https://groups.google.c=
om/d/msgid/jailhouse-dev/9806b760-e030-4183-8d18-7bc6349a027dn%40googlegrou=
ps.com?utm_medium=3Demail&utm_source=3Dfooter">https://groups.google.com/d/=
msgid/jailhouse-dev/9806b760-e030-4183-8d18-7bc6349a027dn%40googlegroups.co=
m</a>.<br />

------=_Part_849_1605198334.1652281338656--

------=_Part_848_557180963.1652281338656--
