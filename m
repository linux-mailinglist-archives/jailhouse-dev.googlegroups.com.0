Return-Path: <jailhouse-dev+bncBD2OND5J24FBBFNS7KPAMGQEGSQZW7Q@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-yw1-x1138.google.com (mail-yw1-x1138.google.com [IPv6:2607:f8b0:4864:20::1138])
	by mail.lfdr.de (Postfix) with ESMTPS id B061E68ABB5
	for <lists+jailhouse-dev@lfdr.de>; Sat,  4 Feb 2023 18:42:47 +0100 (CET)
Received: by mail-yw1-x1138.google.com with SMTP id 00721157ae682-50fe0b4495csf81191607b3.14
        for <lists+jailhouse-dev@lfdr.de>; Sat, 04 Feb 2023 09:42:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20210112;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:x-original-sender:mime-version
         :subject:references:in-reply-to:message-id:to:from:date:sender:from
         :to:cc:subject:date:message-id:reply-to;
        bh=LEPIsP5P/VeLuQaVavTlTt89fdfwDSqP1QzQ2yvLoUM=;
        b=irdtcGx3ecfBD6B6OPdvGlkpWLmF69y3Jpw8bZRwwapBvSNdKwm3i+NIYHEH9Xc3df
         5ndaSBz4VnSQNm8p82IT8RlPmsb1EFzZp8mDChoWfD0Ni4aFiY/Hvf3FipuFhggaTwOd
         UiugEk3lPFzSvi5uklvWUOhuHoHSSDNIEovie8E6oL/Z+Ry9rm4grY8dcEBugbJ4kYzZ
         xC1WNuu/o41YMA82uWgc/AWefdLsbk62NAVKuHhEfOMIrUTaBD9/FiS22F4rw9wBf+Na
         pFniBIrxTvnEPBVtJIjXHB54QDGN7KOTaInubQpaP+MqHykTOUSQ5lWVdxWqbh1cxaW+
         Bd8Q==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:x-original-sender:mime-version
         :subject:references:in-reply-to:message-id:to:from:date:from:to:cc
         :subject:date:message-id:reply-to;
        bh=LEPIsP5P/VeLuQaVavTlTt89fdfwDSqP1QzQ2yvLoUM=;
        b=bxP8wY+zgpKQBuFkAXI8EqbSKKkwueg1Wmz5gSC81Da05sdCywRBEtD40I5TSNwqyZ
         lh22X07cfz2LgTNwJScJeRt65CnIG4qoAKugxgdGhkM7M7DoFRudpObuotrFEbi6BX0G
         JvK8Wh5yuATCab1cmV8hlrGT4Dwn4796z2HitErVSas8orl/xliQ4pPFPwfwe69hMG54
         z7bDBqKiV45QJ5wHzb1fP1eiJMAfNN/ghZ480EL6u2L4IOLzQXTZY6p+k8sDuFRX5C/1
         HWg8h7EPcWNn9i852wX3rWNXWaReP977SnzJFYKu+Nz/CQVCbw1BCScYFNCLRGZ898E3
         0JEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :x-spam-checked-in-group:list-id:mailing-list:precedence
         :x-original-sender:mime-version:subject:references:in-reply-to
         :message-id:to:from:date:x-gm-message-state:sender:from:to:cc
         :subject:date:message-id:reply-to;
        bh=LEPIsP5P/VeLuQaVavTlTt89fdfwDSqP1QzQ2yvLoUM=;
        b=Qq6lr12T+ho7u5m79MshdMYJRCsWIMZQjgMOSDe86BTWTwwqP0Y33Y3jjNPHtTVaDY
         DGZgWSLDUJp0ghgHtEeR7LtoaBQJZhj/c/mH5Cz+F2SuVlxN39QsYZnyoQ62mEQnkJCc
         KFS9Wh1aeRssFIm/uyq1x3DzscHhj8PCa38B/hMccjUhs3XMzdZFA4f3ms+OXXtKy1yL
         CJbM1exzypMCeEg9VCIVTA+p21Y9d/ZwGd0uromIbJWOw7uqlda9R9XUEcHnQIm/iI7A
         T1wcEKet0+/pSLjev27ynvJLmAGhlf8TFzjH11quoHE59oQ0J2KQptTPtCq2tlGG7dOX
         fm3A==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AO0yUKUnS6m0Z6FyQ3o7Rw3MYTmbC+uIH3Q03GN4ndjSMvVXNNCsU4Le
	l37UPbxTnrVJxnVceemvO7A=
X-Google-Smtp-Source: AK7set+Fo97R9UKNPBuEI+vKCsp9ttEZYGnGf/l9Dfkp/FIn3lisX5uv57QLvOIkAzOOnnE4wGj4JQ==
X-Received: by 2002:a25:d0c1:0:b0:85c:7850:d9c5 with SMTP id h184-20020a25d0c1000000b0085c7850d9c5mr964426ybg.400.1675532566311;
        Sat, 04 Feb 2023 09:42:46 -0800 (PST)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a05:690c:fd6:b0:506:52c5:3798 with SMTP id
 dg22-20020a05690c0fd600b0050652c53798ls4231502ywb.9.-pod-prod-gmail; Sat, 04
 Feb 2023 09:42:45 -0800 (PST)
X-Received: by 2002:a81:6a83:0:b0:527:9d23:f6d7 with SMTP id f125-20020a816a83000000b005279d23f6d7mr186098ywc.48.1675532565064;
        Sat, 04 Feb 2023 09:42:45 -0800 (PST)
Date: Sat, 4 Feb 2023 09:42:44 -0800 (PST)
From: Michele Spina <michelespina99@gmail.com>
To: Jailhouse <jailhouse-dev@googlegroups.com>
Message-Id: <b2e87b15-57d6-46ed-8c3f-696b758f8d99n@googlegroups.com>
In-Reply-To: <a354454a-17c1-418c-b8b4-2ce1cdee4419@googlegroups.com>
References: <44ff1ebc-92fd-45f3-8db7-30b7124b74a7@googlegroups.com>
 <40f0e5a3-b38f-4dd5-b4c4-2af01638559d@googlegroups.com>
 <20180404105637.2133f7a3@mmd1pvb1c.ad001.siemens.net>
 <834df96e-8751-4f20-917b-b11d48e5a3db@googlegroups.com>
 <cec22d8d-3711-4ea9-aea0-55fb80252c96@googlegroups.com>
 <a354454a-17c1-418c-b8b4-2ce1cdee4419@googlegroups.com>
Subject: Re: Share memory among cells on arm64
MIME-Version: 1.0
Content-Type: multipart/mixed; 
	boundary="----=_Part_3768_1496007547.1675532564142"
X-Original-Sender: michelespina99@gmail.com
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

------=_Part_3768_1496007547.1675532564142
Content-Type: multipart/alternative; 
	boundary="----=_Part_3769_576232662.1675532564142"

------=_Part_3769_576232662.1675532564142
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Giovani!
I'm facing the same challenge with a ZCU104.
May you please share your test code?

Thank you!
MS


Il giorno luned=C3=AC 24 dicembre 2018 alle 07:02:06 UTC+1 JJZhu ha scritto=
:

> =E5=9C=A8 2018=E5=B9=B44=E6=9C=8810=E6=97=A5=E6=98=9F=E6=9C=9F=E4=BA=8C U=
TC+8=E4=B8=8B=E5=8D=8810:39:18=EF=BC=8CGiovani Gracioli=E5=86=99=E9=81=93=
=EF=BC=9A
> > Updating:
> >=20
> > I added=20
> >=20
> > .num_msix_vectors =3D 1,
> > .iommu =3D 1,=20
> >=20
> > to the root cell .pci_devices config, wrote a simple linux program to=
=20
> write to the shared memory (0x800500000) and a simple inmate cell code to=
=20
> read from the shared memory. It was able to read the values that were=20
> written.
> >=20
> > The next step is how to generate interrupts among the cells. I tried to=
=20
> use the pci functions (the same used in the ivshmem-demo) on the arm64 bu=
t=20
> got an error. The lib/pci.c is not compiled by arm64.
> >=20
> > How should I discover the pci device and send/receive interrupts on=20
> arm64?
> >=20
> > Thanks
> > Giovani
> >=20
> > > Thanks for the answers.
> > >=20
> > > So, I have changed the config. In the root cell I have the following=
=20
> now:
> > >=20
> > > /* IVSHMEM shared memory region for 00:00.0 */ {
> > > .phys_start =3D 0x800400000,
> > > .virt_start =3D 0x800400000,
> > > .size =3D 0x100000,
> > > .flags =3D JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |=20
> JAILHOUSE_MEM_ROOTSHARED, //added MEM_ROOTSHARED
> > > },
> > >=20
> > > .pci_devices =3D {
> > > /* 00:00.0 */ {
> > > .type =3D JAILHOUSE_PCI_TYPE_IVSHMEM,
> > > .bdf =3D 0 << 3,
> > > .bar_mask =3D {
> > > 0xffffff00, 0xffffffff, 0x00000000,
> > > 0x00000000, 0x00000000, 0x00000000,
> > > },
> > > .shmem_region =3D 3,
> > > .shmem_protocol =3D JAILHOUSE_SHMEM_PROTO_UNDEFINED, //changed from=
=20
> JAILHOUSE_SHMEM_PROTO_VETH to JAILHOUSE_SHMEM_PROTO_UNDEFINED
> > > },
> > > },
> > >=20
> > > In the inmate cell, I have the following:
> > >=20
> > > .mem_regions =3D {
> > > ......
> > > .....
> > > /* IVSHMEM shared memory region for 00:00.0 */ {
> > > .phys_start =3D 0x800400000,
> > > .virt_start =3D 0x800400000,
> > > .size =3D 0x100000,
> > > .flags =3D JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |=20
> JAILHOUSE_MEM_ROOTSHARED, //added JAILHOUSE_MEM_ROOTSHARED
> > > },
> > > },
> > >=20
> > > Considering just the configuration of the cells, are they correct?
> > >=20
> > > So correct me if I am wrong. I will need to write a driver in the=20
> root-cell (Linux) to send and receive interrupts to/from the shared ivshm=
em=20
> region. The mapped vpci region contains only the registers of the device:
> > >=20
> > > 00:00.0 Unassigned class [ff00]: Red Hat, Inc Inter-VM shared memory
> > > Subsystem: Red Hat, Inc Inter-VM shared memory
> > > Flags: fast devsel, IRQ 38
> > > Memory at fc100000 (64-bit, non-prefetchable) [size=3D256]
> > >=20
> > > In this case, the address 0xfc100000.
> > >=20
> > > Is the address (0x800400000) that I configured in the cell config fil=
e=20
> actually the payload memory region?
> > >=20
> > > Also, in the another inmate, how can I access the mapped region? I=20
> noticed that there is an ivshmem-demo for x86, but there isn't for arm64.=
=20
> > >=20
> > > Thanks
> > >=20
> > > > Hi,
> > > >=20
> > > > what you see there are the registers of the ivshmem device, not the
> > > > payload memory region. You will have to map the paddr you have in=
=20
> your
> > > > cell-config. That paddr can be found in the config space as well, i=
s
> > > > just not a regular PCI BAR.
> > > >=20
> > > > I would suggest to write a uio driver and base it on
> > > >=20
> https://github.com/henning-schild-work/ivshmem-guest-code/tree/jailhouse
> > > >=20
> > > > Here is the bit that finds the region
> > > >=20
> https://github.com/henning-schild-work/ivshmem-guest-code/blob/jailhouse/=
kernel_module/uio/uio_ivshmem.c#L96
> > > >=20
> > > > Also see:
> > > >=20
> https://github.com/henning-schild-work/ivshmem-guest-code/blob/jailhouse/=
README.jailhouse
> > > >=20
> > > > And you should not use JAILHOUSE_SHMEM_PROTO_VETH because you are n=
ot
> > > > running a network-device on top of your shmem. Use _UNDEFINED or
> > > > _CUSTOM instead.
> > > >=20
> > > > Henning
> > > >=20
> > > > Am Tue, 3 Apr 2018 10:47:31 -0700
> > > > schrieb Giovani Gracioli <>:
> > > >=20
> > > > > Just another info, after enabling the root cell, I can see the
> > > > > virtual pci devices with lspci -v:
> > > > >=20
> > > > > 00:00.0 Unassigned class [ff01]: Red Hat, Inc Inter-VM shared=20
> memory
> > > > > Subsystem: Red Hat, Inc Inter-VM shared memory
> > > > > Flags: fast devsel
> > > > > Memory at fc100000 (64-bit, non-prefetchable) [disabled]
> > > > > [size=3D256] Memory at <unassigned> (64-bit, non-prefetchable)
> > > > > [disabled] Capabilities: [50] MSI-X: Enable- Count=3D1 Masked-
> > > > >=20
> > > > > 00:01.0 Unassigned class [ff01]: Red Hat, Inc Inter-VM shared=20
> memory
> > > > > Subsystem: Red Hat, Inc Inter-VM shared memory
> > > > > Flags: fast devsel
> > > > > Memory at fc100100 (64-bit, non-prefetchable) [disabled]
> > > > > [size=3D256]
> > > > >=20
> > > > >=20
> > > > >=20
> > > > > > Hello,
> > > > > >=20
> > > > > > I would like to share buffers among cells on arm64 (Xilinx
> > > > > > ultrascale+). The documentation suggests the use of the ivshmem=
.
> > > > > >=20
> > > > > > In order to use ivshmem, I changed the root cell config as=20
> follows
> > > > > > (it is based on the zynqmp-zcu102.c original file):
> > > > > >=20
> > > > > > - In the .mem_regions:
> > > > > >=20
> > > > > > /* IVSHMEM shared memory region for 00:00.0 */ {
> > > > > > .phys_start =3D 0x800400000,
> > > > > > .virt_start =3D 0x800400000,
> > > > > > .size =3D 0x100000,
> > > > > > .flags =3D JAILHOUSE_MEM_READ |
> > > > > > JAILHOUSE_MEM_WRITE | JAILHOUSE_MEM_ROOTSHARED, //added
> > > > > > JAILHOUSE_MEM_ROOTSHARED },
> > > > > >=20
> > > > > > - In the .pci_devices:
> > > > > >=20
> > > > > > /* 00:00.0 */ {
> > > > > > .type =3D JAILHOUSE_PCI_TYPE_IVSHMEM,
> > > > > > .bdf =3D 0 << 3,
> > > > > > .bar_mask =3D {
> > > > > > 0xffffff00, 0xffffffff, 0x00000000,
> > > > > > 0x00000000, 0x00000000, 0x00000000,
> > > > > > },
> > > > > > .shmem_region =3D 3,
> > > > > > .shmem_protocol =3D
> > > > > > JAILHOUSE_SHMEM_PROTO_VETH, .num_msix_vectors =3D 1,
> > > > > > .iommu =3D 1,
> > > > > > },
> > > > > >=20
> > > > > > Then, I load the cell:
> > > > > >=20
> > > > > > jailhouse enable zynqmp-zcu102-ivshmem.cell=20
> > > > > >=20
> > > > > > Initializing Jailhouse hypervisor v0.8 (37-g1fa9001) on CPU 1
> > > > > > Code location: 0x0000ffffc0200060
> > > > > > Page pool usage after early setup: mem 33/995, remap 64/131072
> > > > > > Initializing processors:
> > > > > > CPU 1... OK
> > > > > > CPU 2... OK
> > > > > > CPU 0... OK
> > > > > > CPU 3... OK
> > > > > > Adding virtual PCI device 00:00.0 to cell "ZynqMP-ZCU102"
> > > > > > Adding virtual PCI device 00:01.0 to cell "ZynqMP-ZCU102"
> > > > > > Page pool usage after late setup: mem 42/995, remap 69/131072
> > > > > > Activating hypervisor
> > > > > >=20
> > > > > > Then, I wrote a simple user-space program that maps the virtual=
=20
> PCI
> > > > > > ivshmem region to user using mmap:
> > > > > >=20
> > > > > > memfd =3D open("/dev/mem", O_RDWR | O_SYNC);
> > > > > >=20
> > > > > > mapped_base =3D mmap(0, MEM_SIZE, PROT_READ | PROT_WRITE,=20
> MAP_SHARED,
> > > > > > memfd, 0xfc100000 & ~MEM_MASK);
> > > > > >=20
> > > > > > mapped_dev_base =3D mapped_base + (dev_base & MEM_MASK);
> > > > > >=20
> > > > > > for(int i =3D 0; i < 8; i +=3D 4) {
> > > > > > *((volatile unsigned int *) (mapped_dev_base + i)) =3D 1;
> > > > > > printf("Address: %p, Read valeu =3D %d\n", (void
> > > > > > *)(mapped_dev_base + i), *((unsigned int *) (mapped_dev_base +
> > > > > > i))); }
> > > > > >=20
> > > > > > When I ran this program in the root cell, I got the following
> > > > > > Unhandled trap:
> > > > > >=20
> > > > > > ./ivshmem_test=20
> > > > > > /dev/mem opened.
> > > > > > Memory mapped at address 0x7f8dd87000.
> > > > > > Unhandled data write at 0xfc100000(4)
> > > > > >=20
> > > > > > FATAL: unhandled trap (exception class 0x24)
> > > > > > Cell state before exception:
> > > > > > pc: 0000000000400904 lr: 00000000004008d8 spsr: 80000000 EL0
> > > > > > sp: 0000007fceff8df0 esr: 24 1 1810046
> > > > > > x0: 0000007f8dd87000 x1: 0000000000000001 x2: 0000000000000001
> > > > > > x3: 0000000000000000 x4: 0000000040100401 x5: 5404000000000000
> > > > > > x6: 000000001aec1037 x7: 0000000000000000 x8: 0000000000000040
> > > > > > x9: ffffff80ffffffc8 x10: 0000007fceff8df0 x11: 0000007fceff8df=
0
> > > > > > x12: 00000000000003f3 x13: 0000000000000000 x14: 00000000000000=
00
> > > > > > x15: 0000007f8dd8ecc0 x16: 0000000000000000 x17: 0000007f8dc532=
40
> > > > > > x18: 0000000000000a03 x19: 00000000004009a8 x20: 00000000000000=
00
> > > > > > x21: 0000000000000000 x22: 0000000000000000 x23: 00000000000000=
00
> > > > > > x24: 0000000000000000 x25: 0000000000000000 x26: 00000000000000=
00
> > > > > > x27: 0000000000000000 x28: 0000000000000000 x29: 0000007fceff8d=
f0
> > > > > >=20
> > > > > > Parking CPU 2 (Cell: "ZynqMP-ZCU102")
> > > > > >=20
> > > > > > Does that make sense? Am I missing something in the root cell
> > > > > > config or the user-space program is wrong?
> > > > > >=20
> > > > > > Best regards=20
> > > > >
>
> Hello Giovani,
>
> I am now also trying to use the shm on ZYNQ UltraScale+. Is your inmates =
a=20
> baremetal application or Linux? Could you share the simple code of access=
=20
> the shm? Thank you!

--=20
You received this message because you are subscribed to the Google Groups "=
Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/=
jailhouse-dev/b2e87b15-57d6-46ed-8c3f-696b758f8d99n%40googlegroups.com.

------=_Part_3769_576232662.1675532564142
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Giovani!<br />I'm facing the same challenge with a ZCU104.<div>May you p=
lease share your test code?</div><div><br /></div><div>Thank you!<br />MS</=
div><div><br /></div><div><br /></div><div class=3D"gmail_quote"><div dir=
=3D"auto" class=3D"gmail_attr">Il giorno luned=C3=AC 24 dicembre 2018 alle =
07:02:06 UTC+1 JJZhu ha scritto:<br/></div><blockquote class=3D"gmail_quote=
" style=3D"margin: 0 0 0 0.8ex; border-left: 1px solid rgb(204, 204, 204); =
padding-left: 1ex;">=E5=9C=A8 2018=E5=B9=B44=E6=9C=8810=E6=97=A5=E6=98=9F=
=E6=9C=9F=E4=BA=8C UTC+8=E4=B8=8B=E5=8D=8810:39:18=EF=BC=8CGiovani Gracioli=
=E5=86=99=E9=81=93=EF=BC=9A
<br>&gt; Updating:
<br>&gt;=20
<br>&gt; I added=20
<br>&gt;=20
<br>&gt; .num_msix_vectors =3D 1,
<br>&gt; .iommu =3D 1,=20
<br>&gt;=20
<br>&gt; to the root cell .pci_devices config, wrote a simple linux program=
 to write to the shared memory (0x800500000) and a simple inmate cell code =
to read from the shared memory. It was able to read the values that were wr=
itten.
<br>&gt;=20
<br>&gt; The next step is how to generate interrupts among the cells. I tri=
ed to use the pci functions (the same used in the ivshmem-demo) on the arm6=
4 but got an error. The lib/pci.c is not compiled by arm64.
<br>&gt;=20
<br>&gt; How should I discover the pci device and send/receive interrupts o=
n arm64?
<br>&gt;=20
<br>&gt; Thanks
<br>&gt; Giovani
<br>&gt;=20
<br>&gt; &gt; Thanks for the answers.
<br>&gt; &gt;=20
<br>&gt; &gt; So, I have changed the config. In the root cell I have the fo=
llowing now:
<br>&gt; &gt;=20
<br>&gt; &gt; /* IVSHMEM shared memory region for 00:00.0 */ {
<br>&gt; &gt; 			.phys_start =3D 0x800400000,
<br>&gt; &gt; 			.virt_start =3D 0x800400000,
<br>&gt; &gt; 			.size =3D 0x100000,
<br>&gt; &gt; 			.flags =3D JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE | JAIL=
HOUSE_MEM_ROOTSHARED, //added MEM_ROOTSHARED
<br>&gt; &gt; 		},
<br>&gt; &gt;=20
<br>&gt; &gt; .pci_devices =3D {
<br>&gt; &gt; 		/* 00:00.0 */ {
<br>&gt; &gt; 			.type =3D JAILHOUSE_PCI_TYPE_IVSHMEM,
<br>&gt; &gt; 			.bdf =3D 0 &lt;&lt; 3,
<br>&gt; &gt; 			.bar_mask =3D {
<br>&gt; &gt; 				0xffffff00, 0xffffffff, 0x00000000,
<br>&gt; &gt; 				0x00000000, 0x00000000, 0x00000000,
<br>&gt; &gt; 			},
<br>&gt; &gt; 			.shmem_region =3D 3,
<br>&gt; &gt; 			.shmem_protocol =3D JAILHOUSE_SHMEM_PROTO_UNDEFINED, //cha=
nged from JAILHOUSE_SHMEM_PROTO_VETH to JAILHOUSE_SHMEM_PROTO_UNDEFINED
<br>&gt; &gt; 		},
<br>&gt; &gt;    },
<br>&gt; &gt;=20
<br>&gt; &gt; In the inmate cell, I have the following:
<br>&gt; &gt;=20
<br>&gt; &gt; .mem_regions =3D {
<br>&gt; &gt; 		......
<br>&gt; &gt;                 .....
<br>&gt; &gt;         /* IVSHMEM shared memory region for 00:00.0 */ {
<br>&gt; &gt; 			.phys_start =3D 0x800400000,
<br>&gt; &gt; 			.virt_start =3D 0x800400000,
<br>&gt; &gt; 			.size =3D 0x100000,
<br>&gt; &gt; 			.flags =3D JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE | JAIL=
HOUSE_MEM_ROOTSHARED, //added JAILHOUSE_MEM_ROOTSHARED
<br>&gt; &gt; 		},
<br>&gt; &gt; 	},
<br>&gt; &gt;=20
<br>&gt; &gt; Considering just the configuration of the cells, are they cor=
rect?
<br>&gt; &gt;=20
<br>&gt; &gt; So correct me if I am wrong. I will need to write a driver in=
 the root-cell (Linux) to send and receive interrupts to/from the shared iv=
shmem region. The mapped vpci region contains only the registers of the dev=
ice:
<br>&gt; &gt;=20
<br>&gt; &gt; 00:00.0 Unassigned class [ff00]: Red Hat, Inc Inter-VM shared=
 memory
<br>&gt; &gt;         Subsystem: Red Hat, Inc Inter-VM shared memory
<br>&gt; &gt;         Flags: fast devsel, IRQ 38
<br>&gt; &gt;         Memory at fc100000 (64-bit, non-prefetchable) [size=
=3D256]
<br>&gt; &gt;=20
<br>&gt; &gt; In this case, the address 0xfc100000.
<br>&gt; &gt;=20
<br>&gt; &gt; Is the address (0x800400000) that I configured in the cell co=
nfig file actually the payload memory region?
<br>&gt; &gt;=20
<br>&gt; &gt; Also, in the another inmate, how can I access the mapped regi=
on? I noticed that there is an ivshmem-demo for x86, but there isn&#39;t fo=
r arm64.=20
<br>&gt; &gt;=20
<br>&gt; &gt; Thanks
<br>&gt; &gt;=20
<br>&gt; &gt; &gt; Hi,
<br>&gt; &gt; &gt;=20
<br>&gt; &gt; &gt; what you see there are the registers of the ivshmem devi=
ce, not the
<br>&gt; &gt; &gt; payload memory region. You will have to map the paddr yo=
u have in your
<br>&gt; &gt; &gt; cell-config. That paddr can be found in the config space=
 as well, is
<br>&gt; &gt; &gt; just not a regular PCI BAR.
<br>&gt; &gt; &gt;=20
<br>&gt; &gt; &gt; I would suggest to write a uio driver and base it on
<br>&gt; &gt; &gt; <a href=3D"https://github.com/henning-schild-work/ivshme=
m-guest-code/tree/jailhouse" target=3D"_blank" rel=3D"nofollow" data-safere=
directurl=3D"https://www.google.com/url?hl=3Dit&amp;q=3Dhttps://github.com/=
henning-schild-work/ivshmem-guest-code/tree/jailhouse&amp;source=3Dgmail&am=
p;ust=3D1675616266105000&amp;usg=3DAOvVaw1jRysLaGlR9DqnnH1jjYrY">https://gi=
thub.com/henning-schild-work/ivshmem-guest-code/tree/jailhouse</a>
<br>&gt; &gt; &gt;=20
<br>&gt; &gt; &gt; Here is the bit that finds the region
<br>&gt; &gt; &gt; <a href=3D"https://github.com/henning-schild-work/ivshme=
m-guest-code/blob/jailhouse/kernel_module/uio/uio_ivshmem.c#L96" target=3D"=
_blank" rel=3D"nofollow" data-saferedirecturl=3D"https://www.google.com/url=
?hl=3Dit&amp;q=3Dhttps://github.com/henning-schild-work/ivshmem-guest-code/=
blob/jailhouse/kernel_module/uio/uio_ivshmem.c%23L96&amp;source=3Dgmail&amp=
;ust=3D1675616266105000&amp;usg=3DAOvVaw2gO3mhG3yzufXkb5_x8ceE">https://git=
hub.com/henning-schild-work/ivshmem-guest-code/blob/jailhouse/kernel_module=
/uio/uio_ivshmem.c#L96</a>
<br>&gt; &gt; &gt;=20
<br>&gt; &gt; &gt; Also see:
<br>&gt; &gt; &gt; <a href=3D"https://github.com/henning-schild-work/ivshme=
m-guest-code/blob/jailhouse/README.jailhouse" target=3D"_blank" rel=3D"nofo=
llow" data-saferedirecturl=3D"https://www.google.com/url?hl=3Dit&amp;q=3Dht=
tps://github.com/henning-schild-work/ivshmem-guest-code/blob/jailhouse/READ=
ME.jailhouse&amp;source=3Dgmail&amp;ust=3D1675616266105000&amp;usg=3DAOvVaw=
1Valu7_QFnWBxc66SlAYca">https://github.com/henning-schild-work/ivshmem-gues=
t-code/blob/jailhouse/README.jailhouse</a>
<br>&gt; &gt; &gt;=20
<br>&gt; &gt; &gt; And you should not use JAILHOUSE_SHMEM_PROTO_VETH becaus=
e you are not
<br>&gt; &gt; &gt; running a network-device on top of your shmem. Use _UNDE=
FINED or
<br>&gt; &gt; &gt; _CUSTOM instead.
<br>&gt; &gt; &gt;=20
<br>&gt; &gt; &gt; Henning
<br>&gt; &gt; &gt;=20
<br>&gt; &gt; &gt; Am Tue, 3 Apr 2018 10:47:31 -0700
<br>&gt; &gt; &gt; schrieb Giovani Gracioli &lt;&gt;:
<br>&gt; &gt; &gt;=20
<br>&gt; &gt; &gt; &gt; Just another info, after enabling the root cell, I =
can see the
<br>&gt; &gt; &gt; &gt; virtual pci devices with lspci -v:
<br>&gt; &gt; &gt; &gt;=20
<br>&gt; &gt; &gt; &gt; 00:00.0 Unassigned class [ff01]: Red Hat, Inc Inter=
-VM shared memory
<br>&gt; &gt; &gt; &gt;         Subsystem: Red Hat, Inc Inter-VM shared mem=
ory
<br>&gt; &gt; &gt; &gt;         Flags: fast devsel
<br>&gt; &gt; &gt; &gt;         Memory at fc100000 (64-bit, non-prefetchabl=
e) [disabled]
<br>&gt; &gt; &gt; &gt; [size=3D256] Memory at &lt;unassigned&gt; (64-bit, =
non-prefetchable)
<br>&gt; &gt; &gt; &gt; [disabled] Capabilities: [50] MSI-X: Enable- Count=
=3D1 Masked-
<br>&gt; &gt; &gt; &gt;=20
<br>&gt; &gt; &gt; &gt; 00:01.0 Unassigned class [ff01]: Red Hat, Inc Inter=
-VM shared memory
<br>&gt; &gt; &gt; &gt;         Subsystem: Red Hat, Inc Inter-VM shared mem=
ory
<br>&gt; &gt; &gt; &gt;         Flags: fast devsel
<br>&gt; &gt; &gt; &gt;         Memory at fc100100 (64-bit, non-prefetchabl=
e) [disabled]
<br>&gt; &gt; &gt; &gt; [size=3D256]
<br>&gt; &gt; &gt; &gt;=20
<br>&gt; &gt; &gt; &gt;=20
<br>&gt; &gt; &gt; &gt;=20
<br>&gt; &gt; &gt; &gt; &gt; Hello,
<br>&gt; &gt; &gt; &gt; &gt;=20
<br>&gt; &gt; &gt; &gt; &gt; I would like to share buffers among cells on a=
rm64 (Xilinx
<br>&gt; &gt; &gt; &gt; &gt; ultrascale+). The documentation suggests the u=
se of the ivshmem.
<br>&gt; &gt; &gt; &gt; &gt;=20
<br>&gt; &gt; &gt; &gt; &gt; In order to use ivshmem, I changed the root ce=
ll config as follows
<br>&gt; &gt; &gt; &gt; &gt; (it is based on the zynqmp-zcu102.c original f=
ile):
<br>&gt; &gt; &gt; &gt; &gt;=20
<br>&gt; &gt; &gt; &gt; &gt; - In the .mem_regions:
<br>&gt; &gt; &gt; &gt; &gt;=20
<br>&gt; &gt; &gt; &gt; &gt; /* IVSHMEM shared memory region for 00:00.0 */=
 {
<br>&gt; &gt; &gt; &gt; &gt; 			.phys_start =3D 0x800400000,
<br>&gt; &gt; &gt; &gt; &gt; 			.virt_start =3D 0x800400000,
<br>&gt; &gt; &gt; &gt; &gt; 			.size =3D 0x100000,
<br>&gt; &gt; &gt; &gt; &gt; 			.flags =3D JAILHOUSE_MEM_READ |
<br>&gt; &gt; &gt; &gt; &gt; JAILHOUSE_MEM_WRITE | JAILHOUSE_MEM_ROOTSHARED=
, //added
<br>&gt; &gt; &gt; &gt; &gt; JAILHOUSE_MEM_ROOTSHARED },
<br>&gt; &gt; &gt; &gt; &gt;=20
<br>&gt; &gt; &gt; &gt; &gt; - In the .pci_devices:
<br>&gt; &gt; &gt; &gt; &gt;=20
<br>&gt; &gt; &gt; &gt; &gt; /* 00:00.0 */ {
<br>&gt; &gt; &gt; &gt; &gt; 			.type =3D JAILHOUSE_PCI_TYPE_IVSHMEM,
<br>&gt; &gt; &gt; &gt; &gt; 			.bdf =3D 0 &lt;&lt; 3,
<br>&gt; &gt; &gt; &gt; &gt; 			.bar_mask =3D {
<br>&gt; &gt; &gt; &gt; &gt; 				0xffffff00, 0xffffffff, 0x00000000,
<br>&gt; &gt; &gt; &gt; &gt; 				0x00000000, 0x00000000, 0x00000000,
<br>&gt; &gt; &gt; &gt; &gt; 			},
<br>&gt; &gt; &gt; &gt; &gt; 			.shmem_region =3D 3,
<br>&gt; &gt; &gt; &gt; &gt; 			.shmem_protocol =3D
<br>&gt; &gt; &gt; &gt; &gt; JAILHOUSE_SHMEM_PROTO_VETH, .num_msix_vectors =
=3D 1,
<br>&gt; &gt; &gt; &gt; &gt;             .iommu =3D 1,
<br>&gt; &gt; &gt; &gt; &gt; 		},
<br>&gt; &gt; &gt; &gt; &gt;=20
<br>&gt; &gt; &gt; &gt; &gt; Then, I load the cell:
<br>&gt; &gt; &gt; &gt; &gt;=20
<br>&gt; &gt; &gt; &gt; &gt; jailhouse enable zynqmp-zcu102-ivshmem.cell=20
<br>&gt; &gt; &gt; &gt; &gt;=20
<br>&gt; &gt; &gt; &gt; &gt; Initializing Jailhouse hypervisor v0.8 (37-g1f=
a9001) on CPU 1
<br>&gt; &gt; &gt; &gt; &gt; Code location: 0x0000ffffc0200060
<br>&gt; &gt; &gt; &gt; &gt; Page pool usage after early setup: mem 33/995,=
 remap 64/131072
<br>&gt; &gt; &gt; &gt; &gt; Initializing processors:
<br>&gt; &gt; &gt; &gt; &gt;  CPU 1... OK
<br>&gt; &gt; &gt; &gt; &gt;  CPU 2... OK
<br>&gt; &gt; &gt; &gt; &gt;  CPU 0... OK
<br>&gt; &gt; &gt; &gt; &gt;  CPU 3... OK
<br>&gt; &gt; &gt; &gt; &gt; Adding virtual PCI device 00:00.0 to cell &quo=
t;ZynqMP-ZCU102&quot;
<br>&gt; &gt; &gt; &gt; &gt; Adding virtual PCI device 00:01.0 to cell &quo=
t;ZynqMP-ZCU102&quot;
<br>&gt; &gt; &gt; &gt; &gt; Page pool usage after late setup: mem 42/995, =
remap 69/131072
<br>&gt; &gt; &gt; &gt; &gt; Activating hypervisor
<br>&gt; &gt; &gt; &gt; &gt;=20
<br>&gt; &gt; &gt; &gt; &gt; Then, I wrote a simple user-space program that=
 maps the virtual PCI
<br>&gt; &gt; &gt; &gt; &gt; ivshmem region to user using mmap:
<br>&gt; &gt; &gt; &gt; &gt;=20
<br>&gt; &gt; &gt; &gt; &gt; memfd =3D open(&quot;/dev/mem&quot;, O_RDWR | =
O_SYNC);
<br>&gt; &gt; &gt; &gt; &gt;=20
<br>&gt; &gt; &gt; &gt; &gt; mapped_base =3D mmap(0, MEM_SIZE, PROT_READ | =
PROT_WRITE, MAP_SHARED,
<br>&gt; &gt; &gt; &gt; &gt; memfd, 0xfc100000 &amp; ~MEM_MASK);
<br>&gt; &gt; &gt; &gt; &gt;=20
<br>&gt; &gt; &gt; &gt; &gt; mapped_dev_base =3D mapped_base + (dev_base &a=
mp; MEM_MASK);
<br>&gt; &gt; &gt; &gt; &gt;=20
<br>&gt; &gt; &gt; &gt; &gt; for(int i =3D 0; i &lt; 8; i +=3D 4) {
<br>&gt; &gt; &gt; &gt; &gt;         *((volatile unsigned int *) (mapped_de=
v_base + i)) =3D 1;
<br>&gt; &gt; &gt; &gt; &gt;         printf(&quot;Address: %p, Read valeu =
=3D %d\n&quot;, (void
<br>&gt; &gt; &gt; &gt; &gt; *)(mapped_dev_base + i), *((unsigned int *) (m=
apped_dev_base +
<br>&gt; &gt; &gt; &gt; &gt; i))); }
<br>&gt; &gt; &gt; &gt; &gt;=20
<br>&gt; &gt; &gt; &gt; &gt; When I ran this program in the root cell, I go=
t the following
<br>&gt; &gt; &gt; &gt; &gt; Unhandled trap:
<br>&gt; &gt; &gt; &gt; &gt;=20
<br>&gt; &gt; &gt; &gt; &gt; ./ivshmem_test=20
<br>&gt; &gt; &gt; &gt; &gt; /dev/mem opened.
<br>&gt; &gt; &gt; &gt; &gt; Memory mapped at address 0x7f8dd87000.
<br>&gt; &gt; &gt; &gt; &gt; Unhandled data write at 0xfc100000(4)
<br>&gt; &gt; &gt; &gt; &gt;=20
<br>&gt; &gt; &gt; &gt; &gt; FATAL: unhandled trap (exception class 0x24)
<br>&gt; &gt; &gt; &gt; &gt; Cell state before exception:
<br>&gt; &gt; &gt; &gt; &gt;  pc: 0000000000400904   lr: 00000000004008d8 s=
psr: 80000000     EL0
<br>&gt; &gt; &gt; &gt; &gt;  sp: 0000007fceff8df0  esr: 24 1 1810046
<br>&gt; &gt; &gt; &gt; &gt;  x0: 0000007f8dd87000   x1: 0000000000000001  =
 x2: 0000000000000001
<br>&gt; &gt; &gt; &gt; &gt;  x3: 0000000000000000   x4: 0000000040100401  =
 x5: 5404000000000000
<br>&gt; &gt; &gt; &gt; &gt;  x6: 000000001aec1037   x7: 0000000000000000  =
 x8: 0000000000000040
<br>&gt; &gt; &gt; &gt; &gt;  x9: ffffff80ffffffc8  x10: 0000007fceff8df0  =
x11: 0000007fceff8df0
<br>&gt; &gt; &gt; &gt; &gt; x12: 00000000000003f3  x13: 0000000000000000  =
x14: 0000000000000000
<br>&gt; &gt; &gt; &gt; &gt; x15: 0000007f8dd8ecc0  x16: 0000000000000000  =
x17: 0000007f8dc53240
<br>&gt; &gt; &gt; &gt; &gt; x18: 0000000000000a03  x19: 00000000004009a8  =
x20: 0000000000000000
<br>&gt; &gt; &gt; &gt; &gt; x21: 0000000000000000  x22: 0000000000000000  =
x23: 0000000000000000
<br>&gt; &gt; &gt; &gt; &gt; x24: 0000000000000000  x25: 0000000000000000  =
x26: 0000000000000000
<br>&gt; &gt; &gt; &gt; &gt; x27: 0000000000000000  x28: 0000000000000000  =
x29: 0000007fceff8df0
<br>&gt; &gt; &gt; &gt; &gt;=20
<br>&gt; &gt; &gt; &gt; &gt; Parking CPU 2 (Cell: &quot;ZynqMP-ZCU102&quot;=
)
<br>&gt; &gt; &gt; &gt; &gt;=20
<br>&gt; &gt; &gt; &gt; &gt; Does that make sense? Am I missing something i=
n the root cell
<br>&gt; &gt; &gt; &gt; &gt; config or the user-space program is wrong?
<br>&gt; &gt; &gt; &gt; &gt;=20
<br>&gt; &gt; &gt; &gt; &gt; Best regards =20
<br>&gt; &gt; &gt; &gt;
<br>
<br>Hello Giovani,
<br>
<br>I am now also trying to use the shm on ZYNQ UltraScale+. Is your inmate=
s a baremetal application or Linux? Could you share the simple code of acce=
ss the shm? Thank you!</blockquote></div>

<p></p>

-- <br />
You received this message because you are subscribed to the Google Groups &=
quot;Jailhouse&quot; group.<br />
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to <a href=3D"mailto:jailhouse-dev+unsubscribe@googlegroups.com">jailh=
ouse-dev+unsubscribe@googlegroups.com</a>.<br />
To view this discussion on the web visit <a href=3D"https://groups.google.c=
om/d/msgid/jailhouse-dev/b2e87b15-57d6-46ed-8c3f-696b758f8d99n%40googlegrou=
ps.com?utm_medium=3Demail&utm_source=3Dfooter">https://groups.google.com/d/=
msgid/jailhouse-dev/b2e87b15-57d6-46ed-8c3f-696b758f8d99n%40googlegroups.co=
m</a>.<br />

------=_Part_3769_576232662.1675532564142--

------=_Part_3768_1496007547.1675532564142--
