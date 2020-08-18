Return-Path: <jailhouse-dev+bncBDD4NVERQQMBBAOT534QKGQEDZOQUMA@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-qk1-x73f.google.com (mail-qk1-x73f.google.com [IPv6:2607:f8b0:4864:20::73f])
	by mail.lfdr.de (Postfix) with ESMTPS id 583FF2482A6
	for <lists+jailhouse-dev@lfdr.de>; Tue, 18 Aug 2020 12:12:19 +0200 (CEST)
Received: by mail-qk1-x73f.google.com with SMTP id v188sf12775122qkb.17
        for <lists+jailhouse-dev@lfdr.de>; Tue, 18 Aug 2020 03:12:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:date:from:to:message-id:subject:mime-version
         :x-original-sender:precedence:mailing-list:list-id:list-post
         :list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=aRFKp+wVTGcYyoT70cx0pTGURrX2szeKZdErXn3N2xs=;
        b=Y8IluUHY6PSXsLpexowNZ9gaxLh24trEshJjSB0ZN3I4GAqEUUjnqPs4LY6XGtkoY8
         PhMOGgW9QhM9cmbgrxkdyOezWNqpsbAdfBGJRlE816uccFmlCfT/y2kFVkvABPyJTGw9
         of/YvnQ2ms4mi5BZFGP5JA2a9YMLzdSRPzx2T+lBdKNPYPNftu5weyrDxIw3aWROZ7E4
         M+mGe6cc7NmIEoTGpHCHo07VATK7h3509/aQ3PAroEa97tgcIG2TwLNFGqUBvvFk2OVw
         G6jvlBAZ0ktY4RWyYmmsnNM4zNz8SBZOWIbnQI7ic2j5O/NYPO70xOPe4vnLJLdbtuuD
         BNTw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:message-id:subject:mime-version:x-original-sender
         :precedence:mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=aRFKp+wVTGcYyoT70cx0pTGURrX2szeKZdErXn3N2xs=;
        b=PIQICL/xgSIDZNrMkv5cPzpXTj2hZNwtxI98C9yfl3+B7D1DgL0HKXY8IhM9AAX6pI
         d3vIb92rkQ1HRySvKEW8gXjm6gLtSHUz7mkZqrtzIUC59DkuvV9hVZJDUl6GUclaikq4
         fMwpu+i0xqnnsGKjJaxq1XelHJixcxk/GVHmroQI29xEPjYyAVeH0Nn0qX/Vxq7lLlQS
         cf6Ryxj/4R4FbXqKGeeUDQ4jEgv0bUMKZvyHui2Qk10ARQ0wNqj0YvGm0SOzucywpIsb
         ZBpZ/ycv65SB8ZZBVJ2/uH+pfMkn72PbcZO8aKoWLi1GM4UpjAFgX5YdrWiDGuCn9Vxv
         OTsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:date:from:to:message-id:subject
         :mime-version:x-original-sender:precedence:mailing-list:list-id
         :x-spam-checked-in-group:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=aRFKp+wVTGcYyoT70cx0pTGURrX2szeKZdErXn3N2xs=;
        b=G0vw8sE8gLqlk1fiIR1FmSJoG+8utUe5LLiOcTM8TJjXZozummPiLPsX2CeSH9EQ5y
         PV0L9FuIOfGfyr8WHMiGDszOjP/KVxtgyO9N+YXehufX1JC4Jg+6ti1aICk5bR6JJcGc
         WMXjEv0kfoAH9j25aCC2ofJXVrYfv6y9yST5DOYDV35TvSLZXumw0Feo17w09/dxZC7w
         FXwQsh7Xe/CR561cVFVsNrUFI4QLV0EUXXQ8d/WL2yv1ruWnFXqca7iUEVdO74mEyrmh
         ++jt82PeD983fksYht+O0iUCXdfT8KZSzGsp304pIl66mfJ5oVakMIUU9/bHfg3KEZ8v
         Rm1Q==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AOAM533xnaWhSHluvFSIKB3CC1qAncz+p6cd/2OA5c+i+u5gWgYAY9p1
	Ro2yijDgZhR0i3KEyIluqoI=
X-Google-Smtp-Source: ABdhPJyNdV0NBgoJBaZPOvTuw0CFjbBsPKb980ccEPV+PB0rUMthrQD3Hp9e0zr8CZBhORvF7t0a+A==
X-Received: by 2002:ac8:3894:: with SMTP id f20mr17395573qtc.243.1597745538117;
        Tue, 18 Aug 2020 03:12:18 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:ac8:141a:: with SMTP id k26ls7714651qtj.4.gmail; Tue, 18 Aug
 2020 03:12:17 -0700 (PDT)
X-Received: by 2002:ac8:714d:: with SMTP id h13mr17374560qtp.388.1597745537351;
        Tue, 18 Aug 2020 03:12:17 -0700 (PDT)
Date: Tue, 18 Aug 2020 03:12:16 -0700 (PDT)
From: Julian Stehling <julian.stehling@gmail.com>
To: Jailhouse <jailhouse-dev@googlegroups.com>
Message-Id: <7c62da68-5d6e-49dc-8c4c-ea8eb8d56e1ao@googlegroups.com>
Subject: Non-root Linux on the Jetson TX2-board
MIME-Version: 1.0
Content-Type: multipart/mixed; 
	boundary="----=_Part_1100_1559196538.1597745536876"
X-Original-Sender: Julian.Stehling@gmail.com
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

------=_Part_1100_1559196538.1597745536876
Content-Type: multipart/alternative; 
	boundary="----=_Part_1101_704408909.1597745536876"

------=_Part_1101_704408909.1597745536876
Content-Type: text/plain; charset="UTF-8"

I am currently trying to make a non-root Linux-cell work on the Jetson 
TX2-board. I have created a new jetson-tx2-linux-demo.c file and have made 
a inmate-jetson-tx2.dts file according to the other ARM examples given.

When i try to start the cell with

 sudo jailhouse cell linux 
> ~/linux-jailhouse-jetson/configs/arm64/jetson-tx2-linux-demo.cell 
> /boot/Image --dtb 
> ~/linux-jailhouse-jetson/configs/arm64/dts/inmate-jetson-tx2.dtb -i 
> /boot/initrd


i get the following error:

Traceback (most recent call last):

  File "/usr/local/libexec/jailhouse/jailhouse-cell-linux", line 846, in 
> <module>

    arch.setup(args, config)

  File "/usr/local/libexec/jailhouse/jailhouse-cell-linux", line 378, in 
> setup

    reg += struct.pack(reg_format, region.virt_start, region.size)

struct.error: 'I' format requires 0 <= number <= 4294967295


My jetson-tx2-demo-linux.c looks like this:

 

#include <jailhouse/types.h>

#include <jailhouse/cell-config.h>


> #define ARRAY_SIZE(a) sizeof(a) / sizeof(a[0])


> struct {

struct jailhouse_cell_desc cell;

__u64 cpus[1];

struct jailhouse_memory mem_regions[5];

struct jailhouse_irqchip irqchips[1];

struct jailhouse_pci_device pci_devices[1];

} __attribute__((packed)) config = {

.cell = {

.signature = JAILHOUSE_CELL_DESC_SIGNATURE,

.revision = JAILHOUSE_CONFIG_REVISION,

.name = "jetson-tx2-linux-demo",

.flags = JAILHOUSE_CELL_PASSIVE_COMMREG |

JAILHOUSE_CELL_DEBUG_CONSOLE,


> .cpu_set_size = sizeof(config.cpus),

.num_memory_regions = ARRAY_SIZE(config.mem_regions),

.num_irqchips = ARRAY_SIZE(config.irqchips),

.num_pci_devices = ARRAY_SIZE(config.pci_devices),

.vpci_irq_base = 300,

},


> .cpus = {

0x18,

},


> .mem_regions = {

/* UART */ {

.phys_start = 0x3100000,

.virt_start = 0x3100000,

.size = 0x1000,

.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |

JAILHOUSE_MEM_IO | JAILHOUSE_MEM_ROOTSHARED,

},

/* RAM */ {

.phys_start = 0x270000000,

.virt_start = 0x0,

.size = 0x10000,

.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |

JAILHOUSE_MEM_EXECUTE | JAILHOUSE_MEM_DMA |

JAILHOUSE_MEM_LOADABLE,

},

/* RAM */ {

.phys_start = 0x255310000,

.virt_start = 0x255310000,

.size = 0x1acf0000,

.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |

JAILHOUSE_MEM_EXECUTE | JAILHOUSE_MEM_DMA |

JAILHOUSE_MEM_LOADABLE,

},

/* communication region */ {

.virt_start = 0x80000000,

.size = 0x00001000,

.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |

JAILHOUSE_MEM_COMM_REGION,

},


> /* IVHSMEM  1*/ {

                        .phys_start = 0x27f000000,

                        .virt_start = 0x27f000000,

                        .size = 0x1000,

                        .flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE 

                        | JAILHOUSE_MEM_ROOTSHARED,


>                 },


>               

},


> .irqchips = { 

/* GIC */

{

.address = 0x03881000,

.pin_base = 288,

.pin_bitmap = {

0,

1 << (330 - 320) /* irq 330 */

},

},

},


> .pci_devices = {

                {

                        .type = JAILHOUSE_PCI_TYPE_IVSHMEM,

                        .bdf = 0x0,

                        .bar_mask = {

                                0xffffff00, 0xffffffff, 0x00000000,

                                0x00000000, 0x00000000, 0x00000000,

                        },

.shmem_region = 3,

                        .shmem_protocol = JAILHOUSE_SHMEM_PROTO_UNDEFINED,

                        .domain = 0x0,

                },


>                 

        },


> };


So my question is, whrere to search for the error, since the defined memory 
regions are in bounds of the value given by the error message.

Thanks for any advice

Julian



-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/7c62da68-5d6e-49dc-8c4c-ea8eb8d56e1ao%40googlegroups.com.

------=_Part_1101_704408909.1597745536876
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">I am currently trying to make a non-root Linux-cell work o=
n the Jetson TX2-board. I have created a new jetson-tx2-linux-demo.c file a=
nd have made a inmate-jetson-tx2.dts file according to the other ARM exampl=
es given.<div><br></div><div>When i try to start the cell with</div><div><b=
r></div><blockquote class=3D"gmail_quote" style=3D"margin: 0px 0px 0px 0.8e=
x; border-left: 1px solid rgb(204, 204, 204); padding-left: 1ex;">=C2=A0sud=
o jailhouse cell linux ~/linux-jailhouse-jetson/configs/arm64/jetson-tx2-li=
nux-demo.cell /boot/Image --dtb ~/linux-jailhouse-jetson/configs/arm64/dts/=
inmate-jetson-tx2.dtb -i /boot/initrd</blockquote><div><br></div><div>i get=
 the following error:</div><div><br></div><blockquote class=3D"gmail_quote"=
 style=3D"margin: 0px 0px 0px 0.8ex; border-left: 1px solid rgb(204, 204, 2=
04); padding-left: 1ex;">Traceback (most recent call last):</blockquote><bl=
ockquote class=3D"gmail_quote" style=3D"margin: 0px 0px 0px 0.8ex; border-l=
eft: 1px solid rgb(204, 204, 204); padding-left: 1ex;">=C2=A0 File &quot;/u=
sr/local/libexec/jailhouse/jailhouse-cell-linux&quot;, line 846, in &lt;mod=
ule&gt;</blockquote><blockquote class=3D"gmail_quote" style=3D"margin: 0px =
0px 0px 0.8ex; border-left: 1px solid rgb(204, 204, 204); padding-left: 1ex=
;">=C2=A0 =C2=A0 arch.setup(args, config)</blockquote><blockquote class=3D"=
gmail_quote" style=3D"margin: 0px 0px 0px 0.8ex; border-left: 1px solid rgb=
(204, 204, 204); padding-left: 1ex;">=C2=A0 File &quot;/usr/local/libexec/j=
ailhouse/jailhouse-cell-linux&quot;, line 378, in setup</blockquote><blockq=
uote class=3D"gmail_quote" style=3D"margin: 0px 0px 0px 0.8ex; border-left:=
 1px solid rgb(204, 204, 204); padding-left: 1ex;">=C2=A0 =C2=A0 reg +=3D s=
truct.pack(reg_format, region.virt_start, region.size)</blockquote><blockqu=
ote class=3D"gmail_quote" style=3D"margin: 0px 0px 0px 0.8ex; border-left: =
1px solid rgb(204, 204, 204); padding-left: 1ex;">struct.error: &#39;I&#39;=
 format requires 0 &lt;=3D number &lt;=3D 4294967295</blockquote><div><br><=
/div><div>My jetson-tx2-demo-linux.c looks like this:</div><div><br></div><=
blockquote class=3D"gmail_quote" style=3D"margin: 0px 0px 0px 0.8ex; border=
-left: 1px solid rgb(204, 204, 204); padding-left: 1ex;">=C2=A0</blockquote=
><blockquote class=3D"gmail_quote" style=3D"margin: 0px 0px 0px 0.8ex; bord=
er-left: 1px solid rgb(204, 204, 204); padding-left: 1ex;">#include &lt;jai=
lhouse/types.h&gt;</blockquote><blockquote class=3D"gmail_quote" style=3D"m=
argin: 0px 0px 0px 0.8ex; border-left: 1px solid rgb(204, 204, 204); paddin=
g-left: 1ex;">#include &lt;jailhouse/cell-config.h&gt;</blockquote><blockqu=
ote class=3D"gmail_quote" style=3D"margin: 0px 0px 0px 0.8ex; border-left: =
1px solid rgb(204, 204, 204); padding-left: 1ex;"><br></blockquote><blockqu=
ote class=3D"gmail_quote" style=3D"margin: 0px 0px 0px 0.8ex; border-left: =
1px solid rgb(204, 204, 204); padding-left: 1ex;">#define ARRAY_SIZE(a) siz=
eof(a) / sizeof(a[0])</blockquote><blockquote class=3D"gmail_quote" style=
=3D"margin: 0px 0px 0px 0.8ex; border-left: 1px solid rgb(204, 204, 204); p=
adding-left: 1ex;"><br></blockquote><blockquote class=3D"gmail_quote" style=
=3D"margin: 0px 0px 0px 0.8ex; border-left: 1px solid rgb(204, 204, 204); p=
adding-left: 1ex;">struct {</blockquote><blockquote class=3D"gmail_quote" s=
tyle=3D"margin: 0px 0px 0px 0.8ex; border-left: 1px solid rgb(204, 204, 204=
); padding-left: 1ex;"><span style=3D"white-space:pre">	</span>struct jailh=
ouse_cell_desc cell;</blockquote><blockquote class=3D"gmail_quote" style=3D=
"margin: 0px 0px 0px 0.8ex; border-left: 1px solid rgb(204, 204, 204); padd=
ing-left: 1ex;"><span style=3D"white-space:pre">	</span>__u64 cpus[1];</blo=
ckquote><blockquote class=3D"gmail_quote" style=3D"margin: 0px 0px 0px 0.8e=
x; border-left: 1px solid rgb(204, 204, 204); padding-left: 1ex;"><span sty=
le=3D"white-space:pre">	</span>struct jailhouse_memory mem_regions[5];</blo=
ckquote><blockquote class=3D"gmail_quote" style=3D"margin: 0px 0px 0px 0.8e=
x; border-left: 1px solid rgb(204, 204, 204); padding-left: 1ex;"><span sty=
le=3D"white-space:pre">	</span>struct jailhouse_irqchip irqchips[1];</block=
quote><blockquote class=3D"gmail_quote" style=3D"margin: 0px 0px 0px 0.8ex;=
 border-left: 1px solid rgb(204, 204, 204); padding-left: 1ex;"><span style=
=3D"white-space:pre">	</span>struct jailhouse_pci_device pci_devices[1];</b=
lockquote><blockquote class=3D"gmail_quote" style=3D"margin: 0px 0px 0px 0.=
8ex; border-left: 1px solid rgb(204, 204, 204); padding-left: 1ex;">} __att=
ribute__((packed)) config =3D {</blockquote><blockquote class=3D"gmail_quot=
e" style=3D"margin: 0px 0px 0px 0.8ex; border-left: 1px solid rgb(204, 204,=
 204); padding-left: 1ex;"><span style=3D"white-space:pre">	</span>.cell =
=3D {</blockquote><blockquote class=3D"gmail_quote" style=3D"margin: 0px 0p=
x 0px 0.8ex; border-left: 1px solid rgb(204, 204, 204); padding-left: 1ex;"=
><span style=3D"white-space:pre">		</span>.signature =3D JAILHOUSE_CELL_DES=
C_SIGNATURE,</blockquote><blockquote class=3D"gmail_quote" style=3D"margin:=
 0px 0px 0px 0.8ex; border-left: 1px solid rgb(204, 204, 204); padding-left=
: 1ex;"><span style=3D"white-space:pre">		</span>.revision =3D JAILHOUSE_CO=
NFIG_REVISION,</blockquote><blockquote class=3D"gmail_quote" style=3D"margi=
n: 0px 0px 0px 0.8ex; border-left: 1px solid rgb(204, 204, 204); padding-le=
ft: 1ex;"><span style=3D"white-space:pre">		</span>.name =3D &quot;jetson-t=
x2-linux-demo&quot;,</blockquote><blockquote class=3D"gmail_quote" style=3D=
"margin: 0px 0px 0px 0.8ex; border-left: 1px solid rgb(204, 204, 204); padd=
ing-left: 1ex;"><span style=3D"white-space:pre">		</span>.flags =3D JAILHOU=
SE_CELL_PASSIVE_COMMREG |</blockquote><blockquote class=3D"gmail_quote" sty=
le=3D"margin: 0px 0px 0px 0.8ex; border-left: 1px solid rgb(204, 204, 204);=
 padding-left: 1ex;"><span style=3D"white-space:pre">			</span> JAILHOUSE_C=
ELL_DEBUG_CONSOLE,</blockquote><blockquote class=3D"gmail_quote" style=3D"m=
argin: 0px 0px 0px 0.8ex; border-left: 1px solid rgb(204, 204, 204); paddin=
g-left: 1ex;"><br></blockquote><blockquote class=3D"gmail_quote" style=3D"m=
argin: 0px 0px 0px 0.8ex; border-left: 1px solid rgb(204, 204, 204); paddin=
g-left: 1ex;"><span style=3D"white-space:pre">		</span>.cpu_set_size =3D si=
zeof(config.cpus),</blockquote><blockquote class=3D"gmail_quote" style=3D"m=
argin: 0px 0px 0px 0.8ex; border-left: 1px solid rgb(204, 204, 204); paddin=
g-left: 1ex;"><span style=3D"white-space:pre">		</span>.num_memory_regions =
=3D ARRAY_SIZE(config.mem_regions),</blockquote><blockquote class=3D"gmail_=
quote" style=3D"margin: 0px 0px 0px 0.8ex; border-left: 1px solid rgb(204, =
204, 204); padding-left: 1ex;"><span style=3D"white-space:pre">		</span>.nu=
m_irqchips =3D ARRAY_SIZE(config.irqchips),</blockquote><blockquote class=
=3D"gmail_quote" style=3D"margin: 0px 0px 0px 0.8ex; border-left: 1px solid=
 rgb(204, 204, 204); padding-left: 1ex;"><span style=3D"white-space:pre">		=
</span>.num_pci_devices =3D ARRAY_SIZE(config.pci_devices),</blockquote><bl=
ockquote class=3D"gmail_quote" style=3D"margin: 0px 0px 0px 0.8ex; border-l=
eft: 1px solid rgb(204, 204, 204); padding-left: 1ex;"><span style=3D"white=
-space:pre">		</span>.vpci_irq_base =3D 300,</blockquote><blockquote class=
=3D"gmail_quote" style=3D"margin: 0px 0px 0px 0.8ex; border-left: 1px solid=
 rgb(204, 204, 204); padding-left: 1ex;"><span style=3D"white-space:pre">		=
</span></blockquote><blockquote class=3D"gmail_quote" style=3D"margin: 0px =
0px 0px 0.8ex; border-left: 1px solid rgb(204, 204, 204); padding-left: 1ex=
;"><span style=3D"white-space:pre">	</span>},</blockquote><blockquote class=
=3D"gmail_quote" style=3D"margin: 0px 0px 0px 0.8ex; border-left: 1px solid=
 rgb(204, 204, 204); padding-left: 1ex;"><br></blockquote><blockquote class=
=3D"gmail_quote" style=3D"margin: 0px 0px 0px 0.8ex; border-left: 1px solid=
 rgb(204, 204, 204); padding-left: 1ex;"><span style=3D"white-space:pre">	<=
/span>.cpus =3D {</blockquote><blockquote class=3D"gmail_quote" style=3D"ma=
rgin: 0px 0px 0px 0.8ex; border-left: 1px solid rgb(204, 204, 204); padding=
-left: 1ex;"><span style=3D"white-space:pre">		</span>0x18,</blockquote><bl=
ockquote class=3D"gmail_quote" style=3D"margin: 0px 0px 0px 0.8ex; border-l=
eft: 1px solid rgb(204, 204, 204); padding-left: 1ex;"><span style=3D"white=
-space:pre">	</span>},</blockquote><blockquote class=3D"gmail_quote" style=
=3D"margin: 0px 0px 0px 0.8ex; border-left: 1px solid rgb(204, 204, 204); p=
adding-left: 1ex;"><br></blockquote><blockquote class=3D"gmail_quote" style=
=3D"margin: 0px 0px 0px 0.8ex; border-left: 1px solid rgb(204, 204, 204); p=
adding-left: 1ex;"><span style=3D"white-space:pre">	</span>.mem_regions =3D=
 {</blockquote><blockquote class=3D"gmail_quote" style=3D"margin: 0px 0px 0=
px 0.8ex; border-left: 1px solid rgb(204, 204, 204); padding-left: 1ex;"><s=
pan style=3D"white-space:pre">		</span>/* UART */ {</blockquote><blockquote=
 class=3D"gmail_quote" style=3D"margin: 0px 0px 0px 0.8ex; border-left: 1px=
 solid rgb(204, 204, 204); padding-left: 1ex;"><span style=3D"white-space:p=
re">			</span>.phys_start =3D 0x3100000,</blockquote><blockquote class=3D"g=
mail_quote" style=3D"margin: 0px 0px 0px 0.8ex; border-left: 1px solid rgb(=
204, 204, 204); padding-left: 1ex;"><span style=3D"white-space:pre">			</sp=
an>.virt_start =3D 0x3100000,</blockquote><blockquote class=3D"gmail_quote"=
 style=3D"margin: 0px 0px 0px 0.8ex; border-left: 1px solid rgb(204, 204, 2=
04); padding-left: 1ex;"><span style=3D"white-space:pre">			</span>.size =
=3D 0x1000,</blockquote><blockquote class=3D"gmail_quote" style=3D"margin: =
0px 0px 0px 0.8ex; border-left: 1px solid rgb(204, 204, 204); padding-left:=
 1ex;"><span style=3D"white-space:pre">			</span>.flags =3D JAILHOUSE_MEM_R=
EAD | JAILHOUSE_MEM_WRITE |</blockquote><blockquote class=3D"gmail_quote" s=
tyle=3D"margin: 0px 0px 0px 0.8ex; border-left: 1px solid rgb(204, 204, 204=
); padding-left: 1ex;"><span style=3D"white-space:pre">				</span>JAILHOUSE=
_MEM_IO | JAILHOUSE_MEM_ROOTSHARED,</blockquote><blockquote class=3D"gmail_=
quote" style=3D"margin: 0px 0px 0px 0.8ex; border-left: 1px solid rgb(204, =
204, 204); padding-left: 1ex;"><span style=3D"white-space:pre">		</span>},<=
/blockquote><blockquote class=3D"gmail_quote" style=3D"margin: 0px 0px 0px =
0.8ex; border-left: 1px solid rgb(204, 204, 204); padding-left: 1ex;"><span=
 style=3D"white-space:pre">		</span>/* RAM */ {</blockquote><blockquote cla=
ss=3D"gmail_quote" style=3D"margin: 0px 0px 0px 0.8ex; border-left: 1px sol=
id rgb(204, 204, 204); padding-left: 1ex;"><span style=3D"white-space:pre">=
			</span>.phys_start =3D 0x270000000,</blockquote><blockquote class=3D"gma=
il_quote" style=3D"margin: 0px 0px 0px 0.8ex; border-left: 1px solid rgb(20=
4, 204, 204); padding-left: 1ex;"><span style=3D"white-space:pre">			</span=
>.virt_start =3D 0x0,</blockquote><blockquote class=3D"gmail_quote" style=
=3D"margin: 0px 0px 0px 0.8ex; border-left: 1px solid rgb(204, 204, 204); p=
adding-left: 1ex;"><span style=3D"white-space:pre">			</span>.size =3D 0x10=
000,</blockquote><blockquote class=3D"gmail_quote" style=3D"margin: 0px 0px=
 0px 0.8ex; border-left: 1px solid rgb(204, 204, 204); padding-left: 1ex;">=
<span style=3D"white-space:pre">			</span>.flags =3D JAILHOUSE_MEM_READ | J=
AILHOUSE_MEM_WRITE |</blockquote><blockquote class=3D"gmail_quote" style=3D=
"margin: 0px 0px 0px 0.8ex; border-left: 1px solid rgb(204, 204, 204); padd=
ing-left: 1ex;"><span style=3D"white-space:pre">				</span>JAILHOUSE_MEM_EX=
ECUTE | JAILHOUSE_MEM_DMA |</blockquote><blockquote class=3D"gmail_quote" s=
tyle=3D"margin: 0px 0px 0px 0.8ex; border-left: 1px solid rgb(204, 204, 204=
); padding-left: 1ex;"><span style=3D"white-space:pre">				</span>JAILHOUSE=
_MEM_LOADABLE,</blockquote><blockquote class=3D"gmail_quote" style=3D"margi=
n: 0px 0px 0px 0.8ex; border-left: 1px solid rgb(204, 204, 204); padding-le=
ft: 1ex;"><span style=3D"white-space:pre">		</span>},</blockquote><blockquo=
te class=3D"gmail_quote" style=3D"margin: 0px 0px 0px 0.8ex; border-left: 1=
px solid rgb(204, 204, 204); padding-left: 1ex;"><span style=3D"white-space=
:pre">		</span>/* RAM */ {</blockquote><blockquote class=3D"gmail_quote" st=
yle=3D"margin: 0px 0px 0px 0.8ex; border-left: 1px solid rgb(204, 204, 204)=
; padding-left: 1ex;"><span style=3D"white-space:pre">			</span>.phys_start=
 =3D 0x255310000,</blockquote><blockquote class=3D"gmail_quote" style=3D"ma=
rgin: 0px 0px 0px 0.8ex; border-left: 1px solid rgb(204, 204, 204); padding=
-left: 1ex;"><span style=3D"white-space:pre">			</span>.virt_start =3D 0x25=
5310000,</blockquote><blockquote class=3D"gmail_quote" style=3D"margin: 0px=
 0px 0px 0.8ex; border-left: 1px solid rgb(204, 204, 204); padding-left: 1e=
x;"><span style=3D"white-space:pre">			</span>.size =3D 0x1acf0000,</blockq=
uote><blockquote class=3D"gmail_quote" style=3D"margin: 0px 0px 0px 0.8ex; =
border-left: 1px solid rgb(204, 204, 204); padding-left: 1ex;"><span style=
=3D"white-space:pre">			</span>.flags =3D JAILHOUSE_MEM_READ | JAILHOUSE_ME=
M_WRITE |</blockquote><blockquote class=3D"gmail_quote" style=3D"margin: 0p=
x 0px 0px 0.8ex; border-left: 1px solid rgb(204, 204, 204); padding-left: 1=
ex;"><span style=3D"white-space:pre">				</span>JAILHOUSE_MEM_EXECUTE | JAI=
LHOUSE_MEM_DMA |</blockquote><blockquote class=3D"gmail_quote" style=3D"mar=
gin: 0px 0px 0px 0.8ex; border-left: 1px solid rgb(204, 204, 204); padding-=
left: 1ex;"><span style=3D"white-space:pre">				</span>JAILHOUSE_MEM_LOADAB=
LE,</blockquote><blockquote class=3D"gmail_quote" style=3D"margin: 0px 0px =
0px 0.8ex; border-left: 1px solid rgb(204, 204, 204); padding-left: 1ex;"><=
span style=3D"white-space:pre">		</span>},</blockquote><blockquote class=3D=
"gmail_quote" style=3D"margin: 0px 0px 0px 0.8ex; border-left: 1px solid rg=
b(204, 204, 204); padding-left: 1ex;"><span style=3D"white-space:pre">		</s=
pan>/* communication region */ {</blockquote><blockquote class=3D"gmail_quo=
te" style=3D"margin: 0px 0px 0px 0.8ex; border-left: 1px solid rgb(204, 204=
, 204); padding-left: 1ex;"><span style=3D"white-space:pre">			</span>.virt=
_start =3D 0x80000000,</blockquote><blockquote class=3D"gmail_quote" style=
=3D"margin: 0px 0px 0px 0.8ex; border-left: 1px solid rgb(204, 204, 204); p=
adding-left: 1ex;"><span style=3D"white-space:pre">			</span>.size =3D 0x00=
001000,</blockquote><blockquote class=3D"gmail_quote" style=3D"margin: 0px =
0px 0px 0.8ex; border-left: 1px solid rgb(204, 204, 204); padding-left: 1ex=
;"><span style=3D"white-space:pre">			</span>.flags =3D JAILHOUSE_MEM_READ =
| JAILHOUSE_MEM_WRITE |</blockquote><blockquote class=3D"gmail_quote" style=
=3D"margin: 0px 0px 0px 0.8ex; border-left: 1px solid rgb(204, 204, 204); p=
adding-left: 1ex;"><span style=3D"white-space:pre">				</span>JAILHOUSE_MEM=
_COMM_REGION,</blockquote><blockquote class=3D"gmail_quote" style=3D"margin=
: 0px 0px 0px 0.8ex; border-left: 1px solid rgb(204, 204, 204); padding-lef=
t: 1ex;"><span style=3D"white-space:pre">		</span>},</blockquote><blockquot=
e class=3D"gmail_quote" style=3D"margin: 0px 0px 0px 0.8ex; border-left: 1p=
x solid rgb(204, 204, 204); padding-left: 1ex;"><br></blockquote><blockquot=
e class=3D"gmail_quote" style=3D"margin: 0px 0px 0px 0.8ex; border-left: 1p=
x solid rgb(204, 204, 204); padding-left: 1ex;"><span style=3D"white-space:=
pre">		</span>/* IVHSMEM=C2=A0 1*/ {</blockquote><blockquote class=3D"gmail=
_quote" style=3D"margin: 0px 0px 0px 0.8ex; border-left: 1px solid rgb(204,=
 204, 204); padding-left: 1ex;">=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 .phys_start =3D 0x27f000000,</blo=
ckquote><blockquote class=3D"gmail_quote" style=3D"margin: 0px 0px 0px 0.8e=
x; border-left: 1px solid rgb(204, 204, 204); padding-left: 1ex;">=C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 .virt_start =3D 0x27f000000,</blockquote><blockquote class=3D"gmail_quo=
te" style=3D"margin: 0px 0px 0px 0.8ex; border-left: 1px solid rgb(204, 204=
, 204); padding-left: 1ex;">=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 .size =3D 0x1000,</blockquote><block=
quote class=3D"gmail_quote" style=3D"margin: 0px 0px 0px 0.8ex; border-left=
: 1px solid rgb(204, 204, 204); padding-left: 1ex;">=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 .flags =3D J=
AILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE=C2=A0</blockquote><blockquote class=
=3D"gmail_quote" style=3D"margin: 0px 0px 0px 0.8ex; border-left: 1px solid=
 rgb(204, 204, 204); padding-left: 1ex;">=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 | JAILHOUSE_MEM_ROOTSHARE=
D,</blockquote><blockquote class=3D"gmail_quote" style=3D"margin: 0px 0px 0=
px 0.8ex; border-left: 1px solid rgb(204, 204, 204); padding-left: 1ex;"><b=
r></blockquote><blockquote class=3D"gmail_quote" style=3D"margin: 0px 0px 0=
px 0.8ex; border-left: 1px solid rgb(204, 204, 204); padding-left: 1ex;">=
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 },</blockquote><blo=
ckquote class=3D"gmail_quote" style=3D"margin: 0px 0px 0px 0.8ex; border-le=
ft: 1px solid rgb(204, 204, 204); padding-left: 1ex;"><br></blockquote><blo=
ckquote class=3D"gmail_quote" style=3D"margin: 0px 0px 0px 0.8ex; border-le=
ft: 1px solid rgb(204, 204, 204); padding-left: 1ex;">=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0=C2=A0</blockquote><blockquote class=3D"gmail_qu=
ote" style=3D"margin: 0px 0px 0px 0.8ex; border-left: 1px solid rgb(204, 20=
4, 204); padding-left: 1ex;"><span style=3D"white-space:pre">	</span>},</bl=
ockquote><blockquote class=3D"gmail_quote" style=3D"margin: 0px 0px 0px 0.8=
ex; border-left: 1px solid rgb(204, 204, 204); padding-left: 1ex;"><br></bl=
ockquote><blockquote class=3D"gmail_quote" style=3D"margin: 0px 0px 0px 0.8=
ex; border-left: 1px solid rgb(204, 204, 204); padding-left: 1ex;"><span st=
yle=3D"white-space:pre">	</span>.irqchips =3D {=C2=A0</blockquote><blockquo=
te class=3D"gmail_quote" style=3D"margin: 0px 0px 0px 0.8ex; border-left: 1=
px solid rgb(204, 204, 204); padding-left: 1ex;"><span style=3D"white-space=
:pre">		</span>/* GIC */</blockquote><blockquote class=3D"gmail_quote" styl=
e=3D"margin: 0px 0px 0px 0.8ex; border-left: 1px solid rgb(204, 204, 204); =
padding-left: 1ex;"><span style=3D"white-space:pre">		</span>{</blockquote>=
<blockquote class=3D"gmail_quote" style=3D"margin: 0px 0px 0px 0.8ex; borde=
r-left: 1px solid rgb(204, 204, 204); padding-left: 1ex;"><span style=3D"wh=
ite-space:pre">			</span>.address =3D 0x03881000,</blockquote><blockquote c=
lass=3D"gmail_quote" style=3D"margin: 0px 0px 0px 0.8ex; border-left: 1px s=
olid rgb(204, 204, 204); padding-left: 1ex;"><span style=3D"white-space:pre=
">			</span>.pin_base =3D 288,</blockquote><blockquote class=3D"gmail_quote=
" style=3D"margin: 0px 0px 0px 0.8ex; border-left: 1px solid rgb(204, 204, =
204); padding-left: 1ex;"><span style=3D"white-space:pre">			</span>.pin_bi=
tmap =3D {</blockquote><blockquote class=3D"gmail_quote" style=3D"margin: 0=
px 0px 0px 0.8ex; border-left: 1px solid rgb(204, 204, 204); padding-left: =
1ex;"><span style=3D"white-space:pre">				</span>0,</blockquote><blockquote=
 class=3D"gmail_quote" style=3D"margin: 0px 0px 0px 0.8ex; border-left: 1px=
 solid rgb(204, 204, 204); padding-left: 1ex;"><span style=3D"white-space:p=
re">				</span>1 &lt;&lt; (330 - 320) /* irq 330 */</blockquote><blockquote=
 class=3D"gmail_quote" style=3D"margin: 0px 0px 0px 0.8ex; border-left: 1px=
 solid rgb(204, 204, 204); padding-left: 1ex;"><span style=3D"white-space:p=
re">			</span>},</blockquote><blockquote class=3D"gmail_quote" style=3D"mar=
gin: 0px 0px 0px 0.8ex; border-left: 1px solid rgb(204, 204, 204); padding-=
left: 1ex;"><span style=3D"white-space:pre">		</span>},</blockquote><blockq=
uote class=3D"gmail_quote" style=3D"margin: 0px 0px 0px 0.8ex; border-left:=
 1px solid rgb(204, 204, 204); padding-left: 1ex;"><span style=3D"white-spa=
ce:pre">	</span>},</blockquote><blockquote class=3D"gmail_quote" style=3D"m=
argin: 0px 0px 0px 0.8ex; border-left: 1px solid rgb(204, 204, 204); paddin=
g-left: 1ex;"><br></blockquote><blockquote class=3D"gmail_quote" style=3D"m=
argin: 0px 0px 0px 0.8ex; border-left: 1px solid rgb(204, 204, 204); paddin=
g-left: 1ex;"><span style=3D"white-space:pre">	</span>.pci_devices =3D {</b=
lockquote><blockquote class=3D"gmail_quote" style=3D"margin: 0px 0px 0px 0.=
8ex; border-left: 1px solid rgb(204, 204, 204); padding-left: 1ex;">=C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 {</blockquote><blockquote =
class=3D"gmail_quote" style=3D"margin: 0px 0px 0px 0.8ex; border-left: 1px =
solid rgb(204, 204, 204); padding-left: 1ex;">=C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 .type =3D JAILHOUSE=
_PCI_TYPE_IVSHMEM,</blockquote><blockquote class=3D"gmail_quote" style=3D"m=
argin: 0px 0px 0px 0.8ex; border-left: 1px solid rgb(204, 204, 204); paddin=
g-left: 1ex;">=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 .bdf =3D 0x0,</blockquote><blockquote class=3D"gma=
il_quote" style=3D"margin: 0px 0px 0px 0.8ex; border-left: 1px solid rgb(20=
4, 204, 204); padding-left: 1ex;">=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 .bar_mask =3D {</blockquote><blo=
ckquote class=3D"gmail_quote" style=3D"margin: 0px 0px 0px 0.8ex; border-le=
ft: 1px solid rgb(204, 204, 204); padding-left: 1ex;">=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 0xffffff00, 0xffffffff, 0x00000000,</blockquote><blockquo=
te class=3D"gmail_quote" style=3D"margin: 0px 0px 0px 0.8ex; border-left: 1=
px solid rgb(204, 204, 204); padding-left: 1ex;">=C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 0x00000000, 0x00000000, 0x00000000,</blockquote><blockquote c=
lass=3D"gmail_quote" style=3D"margin: 0px 0px 0px 0.8ex; border-left: 1px s=
olid rgb(204, 204, 204); padding-left: 1ex;">=C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 },</blockquote><blo=
ckquote class=3D"gmail_quote" style=3D"margin: 0px 0px 0px 0.8ex; border-le=
ft: 1px solid rgb(204, 204, 204); padding-left: 1ex;"><span style=3D"white-=
space:pre">						</span>.shmem_region =3D 3,</blockquote><blockquote class=
=3D"gmail_quote" style=3D"margin: 0px 0px 0px 0.8ex; border-left: 1px solid=
 rgb(204, 204, 204); padding-left: 1ex;">=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 .shmem_protocol =3D JAILH=
OUSE_SHMEM_PROTO_UNDEFINED,</blockquote><blockquote class=3D"gmail_quote" s=
tyle=3D"margin: 0px 0px 0px 0.8ex; border-left: 1px solid rgb(204, 204, 204=
); padding-left: 1ex;">=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 .domain =3D 0x0,</blockquote><blockquote cl=
ass=3D"gmail_quote" style=3D"margin: 0px 0px 0px 0.8ex; border-left: 1px so=
lid rgb(204, 204, 204); padding-left: 1ex;">=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 },</blockquote><blockquote class=3D"gmail_quote" s=
tyle=3D"margin: 0px 0px 0px 0.8ex; border-left: 1px solid rgb(204, 204, 204=
); padding-left: 1ex;"><br></blockquote><blockquote class=3D"gmail_quote" s=
tyle=3D"margin: 0px 0px 0px 0.8ex; border-left: 1px solid rgb(204, 204, 204=
); padding-left: 1ex;">=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0=C2=A0</blockquote><blockquote class=3D"gmail_quote" style=3D"margin: 0p=
x 0px 0px 0.8ex; border-left: 1px solid rgb(204, 204, 204); padding-left: 1=
ex;">=C2=A0 =C2=A0 =C2=A0 =C2=A0 },</blockquote><blockquote class=3D"gmail_=
quote" style=3D"margin: 0px 0px 0px 0.8ex; border-left: 1px solid rgb(204, =
204, 204); padding-left: 1ex;"><br></blockquote><blockquote class=3D"gmail_=
quote" style=3D"margin: 0px 0px 0px 0.8ex; border-left: 1px solid rgb(204, =
204, 204); padding-left: 1ex;">};</blockquote><div><br></div><div>So my que=
stion is, whrere to search for the error, since the defined memory regions =
are in bounds of the value given by the error message.</div><div><br></div>=
<div>Thanks for any advice</div><div><br></div><div>Julian</div><div><br></=
div><div><br></div><div><br></div></div>

<p></p>

-- <br />
You received this message because you are subscribed to the Google Groups &=
quot;Jailhouse&quot; group.<br />
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to <a href=3D"mailto:jailhouse-dev+unsubscribe@googlegroups.com">jailh=
ouse-dev+unsubscribe@googlegroups.com</a>.<br />
To view this discussion on the web visit <a href=3D"https://groups.google.c=
om/d/msgid/jailhouse-dev/7c62da68-5d6e-49dc-8c4c-ea8eb8d56e1ao%40googlegrou=
ps.com?utm_medium=3Demail&utm_source=3Dfooter">https://groups.google.com/d/=
msgid/jailhouse-dev/7c62da68-5d6e-49dc-8c4c-ea8eb8d56e1ao%40googlegroups.co=
m</a>.<br />

------=_Part_1101_704408909.1597745536876--

------=_Part_1100_1559196538.1597745536876--
