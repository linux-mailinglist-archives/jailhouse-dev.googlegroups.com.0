Return-Path: <jailhouse-dev+bncBCWJRXUWVQPBB5OVRSHAMGQEY4FZU6A@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-qt1-x838.google.com (mail-qt1-x838.google.com [IPv6:2607:f8b0:4864:20::838])
	by mail.lfdr.de (Postfix) with ESMTPS id CF36F47D31D
	for <lists+jailhouse-dev@lfdr.de>; Wed, 22 Dec 2021 14:41:10 +0100 (CET)
Received: by mail-qt1-x838.google.com with SMTP id b7-20020ac85bc7000000b002b65aee118bsf1440754qtb.13
        for <lists+jailhouse-dev@lfdr.de>; Wed, 22 Dec 2021 05:41:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20210112;
        h=sender:date:from:to:message-id:in-reply-to:references:subject
         :mime-version:x-original-sender:precedence:mailing-list:list-id
         :list-post:list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=1QE6zWo9GYGszu9Xb6qWVqTMDNGjGlOqZq7XhHLemHY=;
        b=bNF7yb9zN/7NtOMAP1iMnLHrriZ21t9D7tQYyEwVMB0Anr00VI/48pBKwolKLcgk1R
         XVRjJaA5HtIvp0pv3L9Dg++H39EPQhNub2JYwYj6qeBw5lgOaOetrcZZYEzwnnQplAW/
         r/g6TCplwAPt/WYlaceQClfa2FRnx1XsNNMURU+cjNkZ/bx3u1e2G/CHKRlrNHlABB4o
         VzJkYBeeuhpbNoisLYtcs952rX0hYTcoJ6QIbd+me0HS6XeqipBJ3PYFi5RUUR/zsq13
         CslygVO7a6jrzuhoGfdI10JABtkFy78nJJhuznLHHD7erXKC9aCr1EbsJ7NWj06Tc285
         NHzQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=date:from:to:message-id:in-reply-to:references:subject:mime-version
         :x-original-sender:precedence:mailing-list:list-id:list-post
         :list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=1QE6zWo9GYGszu9Xb6qWVqTMDNGjGlOqZq7XhHLemHY=;
        b=WUhEki+4hVYZhnK8fXCyj3EOE+kgxNEX19bCi1gK7354Ow8uOBClxIANF0eD90QGjn
         LMeL5yarPPStrz+onQ2YAPGgvov8qG6Sa02WtB8o6YMTkBt9j7M2eUDHWehTKpCBqXq/
         1bpFV72ZVGhXfv2MEFxwx7EmzeKIJ4FLFBIDoebMnjyD3qaFZXkqKtmZK8RaHv2NUp1L
         oISHkBjtGbRjaDjVD5PH+yq1MsFcP+6Vm0Cswcs6YGKrOqEWUu4My62KVZJoyYz0YjDB
         jkTnytt2YyyN/veJsbqjrNzzUGoslzk0moNl2tfiYzbb4qu67HulEfxx4+jeiswhWuMT
         XluA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=sender:x-gm-message-state:date:from:to:message-id:in-reply-to
         :references:subject:mime-version:x-original-sender:precedence
         :mailing-list:list-id:x-spam-checked-in-group:list-post:list-help
         :list-archive:list-subscribe:list-unsubscribe;
        bh=1QE6zWo9GYGszu9Xb6qWVqTMDNGjGlOqZq7XhHLemHY=;
        b=jitXG+qVG6XxoNHXBO6TxqRRyU++LMjOxz8Rqwgul414d0miEBGpZTeffVF6GIPgl3
         Ezju7EwK2sbfI8FcuzITP0b8/Voed0KRwD8D4HISsrSnlQVO13IQUKhg/vdq0+DUbMXN
         889vxOHXz+7djcOgiuCvhF1ncAzBKdQPaBC5lh353ABZcTHZWnHw8LZ2g1h6QJywXNeP
         I40NbyiWSHr4aBe7ow5BnSNnTniZGDxrW9CGg4+FiHZoyGKXRP2Jm456xgf3M3H1Jahx
         3F3sU9xZWvPL+ckFB0uapZLsF5EMdR3HaYTLOu70Y9Zh+oRQqRfHDltJq56JOqTySn9K
         lQVg==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AOAM533oVq+8O9a8mmVtXHVeGlQ2UOQYXZz5j2bWlZDG4Yf6VrtNEUcx
	iewK/qllm417d8yaTun1vBI=
X-Google-Smtp-Source: ABdhPJwVH46xA9wWMsRynogu1PUpqh4STx8YTunnyfigniDXMb3+5FhbxDRQ0YOU69M1KkclfvO7+Q==
X-Received: by 2002:a05:620a:40c2:: with SMTP id g2mr2026571qko.570.1640180469885;
        Wed, 22 Dec 2021 05:41:09 -0800 (PST)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a05:620a:318e:: with SMTP id bi14ls1092882qkb.9.gmail; Wed,
 22 Dec 2021 05:41:09 -0800 (PST)
X-Received: by 2002:a05:620a:2796:: with SMTP id g22mr1894090qkp.341.1640180469394;
        Wed, 22 Dec 2021 05:41:09 -0800 (PST)
Date: Wed, 22 Dec 2021 05:41:08 -0800 (PST)
From: jiajun huang <huangjiajun145041@gmail.com>
To: Jailhouse <jailhouse-dev@googlegroups.com>
Message-Id: <667ecb2b-daa0-400f-a92c-8fbc3facf672n@googlegroups.com>
In-Reply-To: <db157b8a-dadc-440b-9385-1278ef5d7097n@googlegroups.com>
References: <db157b8a-dadc-440b-9385-1278ef5d7097n@googlegroups.com>
Subject: Re: FATAL: Unhandled VM-Exit, reason 2
MIME-Version: 1.0
Content-Type: multipart/mixed; 
	boundary="----=_Part_27988_1472028469.1640180468929"
X-Original-Sender: huangjiajun145041@gmail.com
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

------=_Part_27988_1472028469.1640180468929
Content-Type: multipart/alternative; 
	boundary="----=_Part_27989_1310847541.1640180468929"

------=_Part_27989_1310847541.1640180468929
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

nuttx.c

#include <jailhouse/types.h>
#include <jailhouse/cell-config.h>

struct {
struct jailhouse_cell_desc cell;
__u64 cpus[1];
struct jailhouse_memory mem_regions[9];
struct jailhouse_cache cache_regions[1];
struct jailhouse_irqchip irqchips[3];
struct jailhouse_pio pio_regions[3];
struct jailhouse_pci_device pci_devices[2];
struct jailhouse_pci_capability pci_caps[0];

} __attribute__((packed)) config =3D {
.cell =3D {
.signature =3D JAILHOUSE_CELL_DESC_SIGNATURE,
.revision =3D JAILHOUSE_CONFIG_REVISION,
.name =3D "nuttx",
.flags =3D JAILHOUSE_CELL_PASSIVE_COMMREG,
.cpu_set_size =3D sizeof(config.cpus),
.num_memory_regions =3D ARRAY_SIZE(config.mem_regions),
.num_cache_regions =3D ARRAY_SIZE(config.cache_regions),
.num_irqchips =3D ARRAY_SIZE(config.irqchips),
.num_pio_regions =3D ARRAY_SIZE(config.pio_regions),
.num_pci_devices =3D ARRAY_SIZE(config.pci_devices),
.num_pci_caps =3D ARRAY_SIZE(config.pci_caps),
.console =3D {
.type =3D JAILHOUSE_CON_TYPE_8250,
.flags =3D JAILHOUSE_CON_ACCESS_PIO,
.address =3D 0x3f8,
},
},

.cpus =3D {
0x8,
},

.mem_regions =3D {
/* MemRegion: 57a000000-5d9ffffff : JAILHOUSE Inmate Memory */
{
.phys_start =3D 0x57a000000,
.virt_start =3D 0x57a000000,
.size =3D 0x1000,
.flags =3D JAILHOUSE_MEM_READ | JAILHOUSE_MEM_ROOTSHARED,
},
{
.phys_start =3D 0x57a001000,
.virt_start =3D 0,
.size =3D 0x40000000,
.flags =3D JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
JAILHOUSE_MEM_EXECUTE | JAILHOUSE_MEM_LOADABLE |
JAILHOUSE_MEM_ROOTSHARED,
},
{
.phys_start =3D 0x5ba001000,
.virt_start =3D 0x5ba001000,
.size =3D 0x4000,
.flags =3D JAILHOUSE_MEM_READ | JAILHOUSE_MEM_ROOTSHARED,
},
{
.phys_start =3D 0x5ba005000,
.virt_start =3D 0x5ba005000,
.size =3D 0x4000,
.flags =3D JAILHOUSE_MEM_READ| JAILHOUSE_MEM_WRITE | JAILHOUSE_MEM_ROOTSHAR=
ED,
},
/* communication region */ {
.virt_start =3D 0x5ba010000,
.size =3D 0x00001000,
.flags =3D JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
JAILHOUSE_MEM_COMM_REGION,
},
JAILHOUSE_SHMEM_NET_REGIONS(0x5ba205000, 1),
},

.cache_regions =3D {
{
.start =3D 0,
.size =3D 2,
.type =3D JAILHOUSE_CACHE_L3,
},
},

.irqchips =3D {
/* IOAPIC 0, GSI base 0 */
{
.address =3D 0xfec00000,
.id =3D 0x100ff,
.pin_bitmap =3D {
0x000001
},
},
/* IOAPIC 2, GSI base 24 */
{
.address =3D 0xfec01000,
.id =3D 0x1002c,
.pin_bitmap =3D {
0x000000
},
},
/* IOAPIC 3, GSI base 48 */
{
.address =3D 0xfec40000,
.id =3D 0x802c,
.pin_bitmap =3D {
0x000000
},
},
},

.pio_regions =3D {
/* Port I/O: 0020-0021 : pic1 */
PIO_RANGE(0x20, 0x2),
/* Port I/O: 00a0-00a1 : pic2 */
PIO_RANGE(0xa0, 0x2),
/* Port I/O: 03f8-03ff : serial */
PIO_RANGE(0x3f8, 0x8),
},
.pci_devices =3D {
{=20
.type =3D JAILHOUSE_PCI_TYPE_IVSHMEM,
.iommu =3D 1,
.domain =3D 0x0,
.bdf =3D 0x17 << 3,
.bar_mask =3D JAILHOUSE_IVSHMEM_BAR_MASK_MSIX,
.num_msix_vectors =3D 16,
.shmem_regions_start =3D 0,
.shmem_dev_id =3D 1,
.shmem_peers =3D 2,
.shmem_protocol =3D 0x0002,
},
{=20
.type =3D JAILHOUSE_PCI_TYPE_IVSHMEM,
.iommu =3D 1,
.domain =3D 0x0,
.bdf =3D 0x18 << 3,
.bar_mask =3D JAILHOUSE_IVSHMEM_BAR_MASK_MSIX,
.num_msix_vectors =3D 2,
.shmem_regions_start =3D 5,
.shmem_dev_id =3D 1,
.shmem_peers =3D 2,
.shmem_protocol =3D JAILHOUSE_SHMEM_PROTO_VETH,
},
},

.pci_caps =3D {
},
};

=E5=9C=A82021=E5=B9=B412=E6=9C=8822=E6=97=A5=E6=98=9F=E6=9C=9F=E4=B8=89 UTC=
+8 21:39:52<jiajun huang> =E5=86=99=E9=81=93=EF=BC=9A

> Dear Jailhouse community=EF=BC=8C
> This bug occurred when I tried to start nuttx on a none-root cell on the=
=20
> server. I added two ivshmem devices for nuttx. Below is my configuration=
=20
> file. I am not sure if there is a problem with the mmio area in the=20
> configuration file. What is the communication area? In addition, if=20
> jailhouse runs in QEMU, can two virtual machines communicate with each=20
> other through ivshmem-net?
>
> Below is my root-cell , nuttx configuration and log output from the port.
>
> Best regards,
>
> Jiajun Huang
>
>

--=20
You received this message because you are subscribed to the Google Groups "=
Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/=
jailhouse-dev/667ecb2b-daa0-400f-a92c-8fbc3facf672n%40googlegroups.com.

------=_Part_27989_1310847541.1640180468929
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div style=3D"white-space: pre;"><div>nuttx.c</div><br><div>#include &lt;ja=
ilhouse/types.h&gt;</div><div>#include &lt;jailhouse/cell-config.h&gt;</div=
><br><div>struct {</div><div>    struct jailhouse_cell_desc cell;</div><div=
>    __u64 cpus[1];</div><div>    struct jailhouse_memory mem_regions[9];</=
div><div>    struct jailhouse_cache cache_regions[1];</div><div>    struct =
jailhouse_irqchip irqchips[3];</div><div>    struct jailhouse_pio pio_regio=
ns[3];</div><div>    struct jailhouse_pci_device pci_devices[2];</div><div>=
    struct jailhouse_pci_capability pci_caps[0];</div><br><div>} __attribut=
e__((packed)) config =3D {</div><div>    .cell =3D {</div><div>        .sig=
nature =3D JAILHOUSE_CELL_DESC_SIGNATURE,</div><div>        .revision =3D J=
AILHOUSE_CONFIG_REVISION,</div><div>        .name =3D "nuttx",</div><div>  =
  .flags =3D JAILHOUSE_CELL_PASSIVE_COMMREG,</div><div>        .cpu_set_siz=
e =3D sizeof(config.cpus),</div><div>        .num_memory_regions =3D ARRAY_=
SIZE(config.mem_regions),</div><div>        .num_cache_regions =3D ARRAY_SI=
ZE(config.cache_regions),</div><div>        .num_irqchips =3D ARRAY_SIZE(co=
nfig.irqchips),</div><div>        .num_pio_regions =3D ARRAY_SIZE(config.pi=
o_regions),</div><div>        .num_pci_devices =3D ARRAY_SIZE(config.pci_de=
vices),</div><div>    .num_pci_caps =3D ARRAY_SIZE(config.pci_caps),</div><=
div>        .console =3D {</div><div>            .type =3D JAILHOUSE_CON_TY=
PE_8250,</div><div>            .flags =3D JAILHOUSE_CON_ACCESS_PIO,</div><d=
iv>            .address =3D 0x3f8,</div><div>        },</div><div>    },</d=
iv><br><div>    .cpus =3D {</div><div>        0x8,</div><div>    },</div><b=
r><div>    .mem_regions =3D {</div><div>        /* MemRegion: 57a000000-5d9=
ffffff : JAILHOUSE Inmate Memory */</div><div>        {</div><div>         =
   .phys_start =3D 0x57a000000,</div><div>            .virt_start =3D 0x57a=
000000,</div><div>            .size =3D 0x1000,</div><div>            .flag=
s =3D JAILHOUSE_MEM_READ | JAILHOUSE_MEM_ROOTSHARED,</div><div>        },</=
div><div>        {</div><div>            .phys_start =3D 0x57a001000,</div>=
<div>            .virt_start =3D 0,</div><div>            .size =3D 0x40000=
000,</div><div>            .flags =3D JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WR=
ITE |</div><div>                JAILHOUSE_MEM_EXECUTE | JAILHOUSE_MEM_LOADA=
BLE |</div><div>                JAILHOUSE_MEM_ROOTSHARED,</div><div>       =
 },</div><div>        {</div><div>            .phys_start =3D 0x5ba001000,<=
/div><div>            .virt_start =3D 0x5ba001000,</div><div>            .s=
ize =3D 0x4000,</div><div>            .flags =3D JAILHOUSE_MEM_READ | JAILH=
OUSE_MEM_ROOTSHARED,</div><div>        },</div><div>        {</div><div>   =
         .phys_start =3D 0x5ba005000,</div><div>            .virt_start =3D=
 0x5ba005000,</div><div>            .size =3D 0x4000,</div><div>           =
 .flags =3D JAILHOUSE_MEM_READ| JAILHOUSE_MEM_WRITE | JAILHOUSE_MEM_ROOTSHA=
RED,</div><div>        },</div><div>        /* communication region */ {</d=
iv><div>            .virt_start =3D 0x5ba010000,</div><div>            .siz=
e       =3D 0x00001000,</div><div>            .flags =3D JAILHOUSE_MEM_READ=
 | JAILHOUSE_MEM_WRITE |</div><div>                JAILHOUSE_MEM_COMM_REGIO=
N,</div><div>        },</div><div>        JAILHOUSE_SHMEM_NET_REGIONS(0x5ba=
205000, 1),</div><div>    },</div><br><div>    .cache_regions =3D {</div><d=
iv>        {</div><div>            .start =3D 0,</div><div>            .siz=
e =3D 2,</div><div>            .type =3D JAILHOUSE_CACHE_L3,</div><div>    =
    },</div><div>    },</div><br><div>    .irqchips =3D {</div><div>       =
 /* IOAPIC 0, GSI base 0 */</div><div>        {</div><div>            .addr=
ess =3D 0xfec00000,</div><div>            .id =3D 0x100ff,</div><div>      =
      .pin_bitmap =3D {</div><div>                0x000001</div><div>      =
      },</div><div>        },</div><div>        /* IOAPIC 2, GSI base 24 */=
</div><div>        {</div><div>            .address =3D 0xfec01000,</div><d=
iv>            .id =3D 0x1002c,</div><div>            .pin_bitmap =3D {</di=
v><div>                0x000000</div><div>            },</div><div>        =
},</div><div>        /* IOAPIC 3, GSI base 48 */</div><div>        {</div><=
div>            .address =3D 0xfec40000,</div><div>            .id =3D 0x80=
2c,</div><div>            .pin_bitmap =3D {</div><div>                0x000=
000</div><div>            },</div><div>        },</div><div>    },</div><br=
><div>    .pio_regions =3D {</div><div>        /* Port I/O: 0020-0021 : pic=
1 */</div><div>    PIO_RANGE(0x20, 0x2),</div><div>        /* Port I/O: 00a=
0-00a1 : pic2 */</div><div>    PIO_RANGE(0xa0, 0x2),</div><div>        /* P=
ort I/O: 03f8-03ff : serial */</div><div>        PIO_RANGE(0x3f8, 0x8),</di=
v><div>    },</div><div>    .pci_devices =3D {</div><div>        { </div><d=
iv>            .type =3D JAILHOUSE_PCI_TYPE_IVSHMEM,</div><div>            =
.iommu =3D 1,</div><div>            .domain =3D 0x0,</div><div>            =
.bdf =3D 0x17 &lt;&lt; 3,</div><div>            .bar_mask =3D JAILHOUSE_IVS=
HMEM_BAR_MASK_MSIX,</div><div>            .num_msix_vectors =3D 16,</div><d=
iv>            .shmem_regions_start =3D 0,</div><div>            .shmem_dev=
_id =3D 1,</div><div>            .shmem_peers =3D 2,</div><div>            =
.shmem_protocol =3D 0x0002,</div><div>        },</div><div>        { </div>=
<div>            .type =3D JAILHOUSE_PCI_TYPE_IVSHMEM,</div><div>          =
  .iommu =3D 1,</div><div>            .domain =3D 0x0,</div><div>          =
  .bdf =3D 0x18 &lt;&lt; 3,</div><div>            .bar_mask =3D JAILHOUSE_I=
VSHMEM_BAR_MASK_MSIX,</div><div>            .num_msix_vectors =3D 2,</div><=
div>            .shmem_regions_start =3D 5,</div><div>            .shmem_de=
v_id =3D 1,</div><div>            .shmem_peers =3D 2,</div><div>           =
 .shmem_protocol =3D JAILHOUSE_SHMEM_PROTO_VETH,</div><div>        },</div>=
<div>    },</div><br><div>    .pci_caps =3D {</div><div>        </div><div>=
    },</div><div>};</div><br></div><div class=3D"gmail_quote"><div dir=3D"a=
uto" class=3D"gmail_attr">=E5=9C=A82021=E5=B9=B412=E6=9C=8822=E6=97=A5=E6=
=98=9F=E6=9C=9F=E4=B8=89 UTC+8 21:39:52&lt;jiajun huang> =E5=86=99=E9=81=93=
=EF=BC=9A<br/></div><blockquote class=3D"gmail_quote" style=3D"margin: 0 0 =
0 0.8ex; border-left: 1px solid rgb(204, 204, 204); padding-left: 1ex;">Dea=
r Jailhouse community=EF=BC=8C<br><div>This bug occurred when I tried to st=
art nuttx on a none-root cell on the server. I added two ivshmem devices fo=
r nuttx. Below is my configuration file. I am not sure if there is a proble=
m with the mmio area in the configuration file. What is the communication a=
rea? In addition, if jailhouse runs in QEMU, can two virtual machines commu=
nicate with each other through ivshmem-net?<br></div><div><br></div><div>Be=
low is my root-cell , nuttx configuration and log output from the port.<br>=
</div><div><br></div><div><div><div>Best regards,</div><div><br></div><div>=
Jiajun Huang</div></div><div><div><div><br></div></div></div></div></blockq=
uote></div>

<p></p>

-- <br />
You received this message because you are subscribed to the Google Groups &=
quot;Jailhouse&quot; group.<br />
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to <a href=3D"mailto:jailhouse-dev+unsubscribe@googlegroups.com">jailh=
ouse-dev+unsubscribe@googlegroups.com</a>.<br />
To view this discussion on the web visit <a href=3D"https://groups.google.c=
om/d/msgid/jailhouse-dev/667ecb2b-daa0-400f-a92c-8fbc3facf672n%40googlegrou=
ps.com?utm_medium=3Demail&utm_source=3Dfooter">https://groups.google.com/d/=
msgid/jailhouse-dev/667ecb2b-daa0-400f-a92c-8fbc3facf672n%40googlegroups.co=
m</a>.<br />

------=_Part_27989_1310847541.1640180468929--

------=_Part_27988_1472028469.1640180468929--
