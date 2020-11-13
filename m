Return-Path: <jailhouse-dev+bncBCJ2NIVKYUNBBKNQXH6QKGQE3R3VA4I@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-qv1-xf3f.google.com (mail-qv1-xf3f.google.com [IPv6:2607:f8b0:4864:20::f3f])
	by mail.lfdr.de (Postfix) with ESMTPS id E2CBA2B18AC
	for <lists+jailhouse-dev@lfdr.de>; Fri, 13 Nov 2020 10:55:54 +0100 (CET)
Received: by mail-qv1-xf3f.google.com with SMTP id v8sf5688822qvq.12
        for <lists+jailhouse-dev@lfdr.de>; Fri, 13 Nov 2020 01:55:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:date:from:to:message-id:in-reply-to:references:subject
         :mime-version:x-original-sender:precedence:mailing-list:list-id
         :list-post:list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=inFMVDZi2tjVYYaH8Za5eoXSppwBKTp2Y1ZY4hSAeXM=;
        b=Vr5nJtAtuyBN7TcQPdbDnGv+YpPDia9oUX4kHf1pldmPBtipLzdTdmjHihdFUGWUNg
         4GuUruvoRTa4RmYZmICpsThQ7jttdLkdDRPsI1UlDe1O3Xt5xuznBtrcXrq5wC0xwMQ5
         8E5PGrGL49wcBZrnjdiTGFmUazSXIdCEADB0qeA4cYSPAWIV3QYNA2EvlVf4JMtZmo7P
         h2Q5DQvg+dzZJTeMGghuxmM9UCcYXGWk/uh9FVDPKfGcaT4pl5mSaej+hamsy5OA1iY1
         HNxqcLrTYC9yBJnsZwEkAhf0ZpncHUxTOQ85CIpp+8GWk7hdXF06FMiVkMBTqQjU5ICF
         izYg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:message-id:in-reply-to:references:subject:mime-version
         :x-original-sender:precedence:mailing-list:list-id:list-post
         :list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=inFMVDZi2tjVYYaH8Za5eoXSppwBKTp2Y1ZY4hSAeXM=;
        b=eKPJHNbEyT+24eC0dml/Tt9iYfluZc6f39/YVhWuDaCT/kxLRpBM7zCWI3E6StR1c5
         wOJ6lrL3lgL8up9/bqOjNbLc2I8byrQ9uIaqewHk9Q1jSVWYOi7dX4mlTN9JqBf7nqTW
         LwGoH9x3lkLPL+EhNOQu5XhZPgmrUU3+uKFB7pukyPpEBDbgt228qt8gCKK0aBOL/QTy
         CNz5F51eEn/AXPveYii2DD7e7BJc0HP7zZlfxvkk7qixCG6XrIIH2wyg/j8lxV2XCRxn
         h8oYo2SO83SXinJccav5/+0HuarIpFXRjyAyTpbOvI6GjcCwbnUob1aBgT0TBYBRTeol
         Pnxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:date:from:to:message-id:in-reply-to
         :references:subject:mime-version:x-original-sender:precedence
         :mailing-list:list-id:x-spam-checked-in-group:list-post:list-help
         :list-archive:list-subscribe:list-unsubscribe;
        bh=inFMVDZi2tjVYYaH8Za5eoXSppwBKTp2Y1ZY4hSAeXM=;
        b=DD10bvy+rwxMpC3qs3GV4ytMxa7g39qkaNMQZZv4PM4gjwbRsKZYhVqz1hpAjNk1cn
         bd+SwpnYy1Xfl+nVyZYcX245wqY+gBqT5lkIGjUR76RVClTIhu/hjDorXQbk+ewry1tL
         Tw9DtlwGaWKQlZGFglNN0x9ZXmyqWnU7CB7uHnV+v9UMkVHxhQ+8lvv7YMhVetlOdIBQ
         CGvLFIs1UoPYkNCKqrG4JUv7e+uGfi8tI3P6hZ5k2oRoxsomMrX3nfQYdxcSR5ENHtdh
         HXk8O2WA1/lrnPeyjAoH1yDKpeNl1YhqQroFG1SBFS+djnbaR266X54RvADxQ+Jk4/Or
         IWgg==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AOAM533ijOab/6VnmouszcXbKyiP9R3l+A/voUjbYSafxWjREyWJREV+
	5VJyqsWy9wA0EXEYf5flRqw=
X-Google-Smtp-Source: ABdhPJyHojpMKsuo5Gnd/Te2UG4y427Y0Qb8Fv+/wSpVfDvfedrB+3lbap3Lzgso47oUW39jQmaD5w==
X-Received: by 2002:a05:6214:42f:: with SMTP id a15mr1453610qvy.59.1605261353879;
        Fri, 13 Nov 2020 01:55:53 -0800 (PST)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a05:6214:152:: with SMTP id x18ls1367508qvs.10.gmail; Fri,
 13 Nov 2020 01:55:53 -0800 (PST)
X-Received: by 2002:a05:6214:612:: with SMTP id z18mr1470382qvw.41.1605261352898;
        Fri, 13 Nov 2020 01:55:52 -0800 (PST)
Date: Fri, 13 Nov 2020 01:55:52 -0800 (PST)
From: Peter pan <peter.panjf@gmail.com>
To: Jailhouse <jailhouse-dev@googlegroups.com>
Message-Id: <650b2d0f-b721-44a4-9572-28c2a88a7559n@googlegroups.com>
In-Reply-To: <7552cacf-519e-9cde-ba5a-c2e2121c5a54@siemens.com>
References: <e223356c-fc2c-4c3b-98c3-6d27fba1099an@googlegroups.com>
 <7552cacf-519e-9cde-ba5a-c2e2121c5a54@siemens.com>
Subject: Re: one question about MSI-X support for vPCI
MIME-Version: 1.0
Content-Type: multipart/mixed; 
	boundary="----=_Part_494_246487720.1605261352168"
X-Original-Sender: peter.panjf@gmail.com
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

------=_Part_494_246487720.1605261352168
Content-Type: multipart/alternative; 
	boundary="----=_Part_495_1170911725.1605261352168"

------=_Part_495_1170911725.1605261352168
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Thanks Jan, now it works with INTx.

Jiafei.

=E5=9C=A82020=E5=B9=B411=E6=9C=8812=E6=97=A5=E6=98=9F=E6=9C=9F=E5=9B=9B UTC=
+8 =E4=B8=8B=E5=8D=889:05:15<j.kiszka...@gmail.com> =E5=86=99=E9=81=93=EF=
=BC=9A

> On 12.11.20 09:50, Peter pan wrote:
> > Dear Jailhouse Community,
> >=20
> > I am runing Jailhouse on kernel v5.4, and port some ivshmem patches
> > from http://git.kiszka.org/?p=3Dlinux.git;a=3Dsummary
> > <http://git.kiszka.org/?p=3Dlinux.git;a=3Dsummary>
> >=20
> > The issue I have is uio_shmem and ivshmem-net will probe failed when I
> > use MSI-X mode for vPCI after I run Jailhouse enable command.  Please
> > find the folowing log:
> >=20
> > [   21.581019] jailhouse: loading out-of-tree module taints kernel.
> >=20
> > [   30.000988] pci-host-generic fb500000.pci: host bridge /pci@0 ranges=
:
> >=20
> > [   30.000997] pci-host-generic fb500000.pci:   MEM
> > 0xfb600000..0xfb603fff -> 0xfb600000
> >=20
> > [   30.001028] pci-host-generic fb500000.pci: ECAM at [mem
> > 0xfb500000-0xfb5fffff] for [bus 00]
> >=20
> > [   30.001081] pci-host-generic fb500000.pci: PCI host bridge to bus=20
> 0003:00
> >=20
> > [   30.001085] pci_bus 0003:00: root bus resource [bus 00]
> >=20
> > [   30.001087] pci_bus 0003:00: root bus resource [mem
> > 0xfb600000-0xfb603fff]
> >=20
> > [   30.001105] pci 0003:00:00.0: [110a:4106] type 00 class 0xff0000
> >=20
> > [   30.001128] pci 0003:00:00.0: reg 0x10: [mem 0x00000000-0x00000fff]
> >=20
> > [   30.001136] pci 0003:00:00.0: reg 0x14: [mem 0x00000000-0x000001ff]
> >=20
> > [   30.001340] pci 0003:00:01.0: [110a:4106] type 00 class 0xff0001
> >=20
> > [   30.001359] pci 0003:00:01.0: reg 0x10: [mem 0x00000000-0x00000fff]
> >=20
> > [   30.001368] pci 0003:00:01.0: reg 0x14: [mem 0x00000000-0x000001ff]
> >=20
> > [   30.002389] pci 0003:00:00.0: BAR 0: assigned [mem=20
> 0xfb600000-0xfb600fff]
> >=20
> > [   30.002397] pci 0003:00:01.0: BAR 0: assigned [mem=20
> 0xfb601000-0xfb601fff]
> >=20
> > [   30.002403] pci 0003:00:00.0: BAR 1: assigned [mem=20
> 0xfb602000-0xfb6021ff]
> >=20
> > [   30.002409] pci 0003:00:01.0: BAR 1: assigned [mem=20
> 0xfb602200-0xfb6023ff]
> >=20
> > [   30.002478] uio_ivshmem 0003:00:00.0: enabling device (0000 -> 0002)
> >=20
> > [   30.002505] uio_ivshmem 0003:00:00.0: state_table at
> > 0x00000000fb700000, size 0x0000000000001000
> >=20
> > [   30.002512] uio_ivshmem 0003:00:00.0: rw_section at
> > 0x00000000fb701000, size 0x0000000000009000
> >=20
> > [   30.002520] uio_ivshmem 0003:00:00.0: input_sections at
> > 0x00000000fb70a000, size 0x0000000000006000
> >=20
> > [   30.002524] uio_ivshmem 0003:00:00.0: output_section at
> > 0x00000000fb70a000, size 0x0000000000002000
> >=20
> > [   30.002576] uio_ivshmem: probe of 0003:00:00.0 failed with error -28
> >=20
> > [   30.002620] ivshmem-net 0003:00:01.0: enabling device (0000 -> 0002)
> >=20
> > [   30.002664] ivshmem-net 0003:00:01.0: TX memory at
> > 0x00000000fb801000, size 0x000000000007f000
> >=20
> > [   30.002667] ivshmem-net 0003:00:01.0: RX memory at
> > 0x00000000fb880000, size 0x000000000007f000
> >=20
> > [   30.047630] ivshmem-net: probe of 0003:00:01.0 failed with error -28
> >=20
> > [   30.047714] The Jailhouse is opening.
> >=20
> >=20
> > After some investigation I found the dts node of vPIC is added to root
> > cell by using vpci_template.dts,  the Jailhouse
> > driver create_vpci_of_overlay() in driver/pci.c can't add the handler o=
f
> > "msi-parent" to this PCI node,  but the kernel driver of the virtual PC=
I
> > device use the following function=20
> > ret =3D pci_alloc_irq_vectors(pdev, 1, 2, PCI_IRQ_LEGACY | PCI_IRQ_MSIX=
);
> > So the  driver will probe MSIX irq for the device, because there is no
> > msi controller is speficied to vPCI, the result is no irq-domain is
> > provided to this PCI and irq allocated failed.
> >=20
> > so how to fix such issue? Appreciate any comments and suggestions,=20
> thanks.
>
> The vPCI support in Jailhouse injects interrupts as legacy INTx. For
> that, you need to provide up to 4 (less if you have less ivshmem
> devices) consecutive SPIs that are not in use by real devices (in any
> cell). See other arm64 configs, specifically look for vpci_irq_base.
>
> Jan
> --=20
> Siemens AG, T RDA IOT
> Corporate Competence Center Embedded Linux
>
>

--=20
You received this message because you are subscribed to the Google Groups "=
Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/=
jailhouse-dev/650b2d0f-b721-44a4-9572-28c2a88a7559n%40googlegroups.com.

------=_Part_495_1170911725.1605261352168
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Thanks Jan, now it works with INTx.<div><br></div><div>Jiafei.<br><br></div=
><div class=3D"gmail_quote"><div dir=3D"auto" class=3D"gmail_attr">=E5=9C=
=A82020=E5=B9=B411=E6=9C=8812=E6=97=A5=E6=98=9F=E6=9C=9F=E5=9B=9B UTC+8 =E4=
=B8=8B=E5=8D=889:05:15&lt;j.kiszka...@gmail.com> =E5=86=99=E9=81=93=EF=BC=
=9A<br/></div><blockquote class=3D"gmail_quote" style=3D"margin: 0 0 0 0.8e=
x; border-left: 1px solid rgb(204, 204, 204); padding-left: 1ex;">On 12.11.=
20 09:50, Peter pan wrote:
<br>&gt; Dear Jailhouse Community,
<br>&gt;=20
<br>&gt; I am runing Jailhouse on kernel v5.4, and port some ivshmem patche=
s
<br>&gt; from=C2=A0<a href=3D"http://git.kiszka.org/?p=3Dlinux.git;a=3Dsumm=
ary" target=3D"_blank" rel=3D"nofollow" data-saferedirecturl=3D"https://www=
.google.com/url?hl=3Dzh-CN&amp;q=3Dhttp://git.kiszka.org/?p%3Dlinux.git;a%3=
Dsummary&amp;source=3Dgmail&amp;ust=3D1605347714435000&amp;usg=3DAFQjCNHBX1=
4y7MLFfVWEUGXTWKBs_56Rpw">http://git.kiszka.org/?p=3Dlinux.git;a=3Dsummary<=
/a>
<br>&gt; &lt;<a href=3D"http://git.kiszka.org/?p=3Dlinux.git;a=3Dsummary" t=
arget=3D"_blank" rel=3D"nofollow" data-saferedirecturl=3D"https://www.googl=
e.com/url?hl=3Dzh-CN&amp;q=3Dhttp://git.kiszka.org/?p%3Dlinux.git;a%3Dsumma=
ry&amp;source=3Dgmail&amp;ust=3D1605347714436000&amp;usg=3DAFQjCNFTLOBr5m_l=
3g-pacwzGUcM1T8x8Q">http://git.kiszka.org/?p=3Dlinux.git;a=3Dsummary</a>&gt=
;
<br>&gt;=20
<br>&gt; The issue I have is uio_shmem and ivshmem-net will probe failed wh=
en I
<br>&gt; use MSI-X mode for vPCI after I run Jailhouse enable command.=C2=
=A0 Please
<br>&gt; find the folowing log:
<br>&gt;=20
<br>&gt; [=C2=A0=C2=A0 21.581019] jailhouse: loading out-of-tree module tai=
nts kernel.
<br>&gt;=20
<br>&gt; [=C2=A0=C2=A0 30.000988] pci-host-generic fb500000.pci: host bridg=
e /pci@0 ranges:
<br>&gt;=20
<br>&gt; [=C2=A0=C2=A0 30.000997] pci-host-generic fb500000.pci:=C2=A0=C2=
=A0 MEM
<br>&gt; 0xfb600000..0xfb603fff -&gt; 0xfb600000
<br>&gt;=20
<br>&gt; [=C2=A0=C2=A0 30.001028] pci-host-generic fb500000.pci: ECAM at [m=
em
<br>&gt; 0xfb500000-0xfb5fffff] for [bus 00]
<br>&gt;=20
<br>&gt; [=C2=A0=C2=A0 30.001081] pci-host-generic fb500000.pci: PCI host b=
ridge to bus 0003:00
<br>&gt;=20
<br>&gt; [=C2=A0=C2=A0 30.001085] pci_bus 0003:00: root bus resource [bus 0=
0]
<br>&gt;=20
<br>&gt; [=C2=A0=C2=A0 30.001087] pci_bus 0003:00: root bus resource [mem
<br>&gt; 0xfb600000-0xfb603fff]
<br>&gt;=20
<br>&gt; [=C2=A0=C2=A0 30.001105] pci 0003:00:00.0: [110a:4106] type 00 cla=
ss 0xff0000
<br>&gt;=20
<br>&gt; [=C2=A0=C2=A0 30.001128] pci 0003:00:00.0: reg 0x10: [mem 0x000000=
00-0x00000fff]
<br>&gt;=20
<br>&gt; [=C2=A0=C2=A0 30.001136] pci 0003:00:00.0: reg 0x14: [mem 0x000000=
00-0x000001ff]
<br>&gt;=20
<br>&gt; [=C2=A0=C2=A0 30.001340] pci 0003:00:01.0: [110a:4106] type 00 cla=
ss 0xff0001
<br>&gt;=20
<br>&gt; [=C2=A0=C2=A0 30.001359] pci 0003:00:01.0: reg 0x10: [mem 0x000000=
00-0x00000fff]
<br>&gt;=20
<br>&gt; [=C2=A0=C2=A0 30.001368] pci 0003:00:01.0: reg 0x14: [mem 0x000000=
00-0x000001ff]
<br>&gt;=20
<br>&gt; [=C2=A0=C2=A0 30.002389] pci 0003:00:00.0: BAR 0: assigned [mem 0x=
fb600000-0xfb600fff]
<br>&gt;=20
<br>&gt; [=C2=A0=C2=A0 30.002397] pci 0003:00:01.0: BAR 0: assigned [mem 0x=
fb601000-0xfb601fff]
<br>&gt;=20
<br>&gt; [=C2=A0=C2=A0 30.002403] pci 0003:00:00.0: BAR 1: assigned [mem 0x=
fb602000-0xfb6021ff]
<br>&gt;=20
<br>&gt; [=C2=A0=C2=A0 30.002409] pci 0003:00:01.0: BAR 1: assigned [mem 0x=
fb602200-0xfb6023ff]
<br>&gt;=20
<br>&gt; [=C2=A0=C2=A0 30.002478] uio_ivshmem 0003:00:00.0: enabling device=
 (0000 -&gt; 0002)
<br>&gt;=20
<br>&gt; [=C2=A0=C2=A0 30.002505] uio_ivshmem 0003:00:00.0: state_table at
<br>&gt; 0x00000000fb700000, size 0x0000000000001000
<br>&gt;=20
<br>&gt; [=C2=A0=C2=A0 30.002512] uio_ivshmem 0003:00:00.0: rw_section at
<br>&gt; 0x00000000fb701000, size 0x0000000000009000
<br>&gt;=20
<br>&gt; [=C2=A0=C2=A0 30.002520] uio_ivshmem 0003:00:00.0: input_sections =
at
<br>&gt; 0x00000000fb70a000, size 0x0000000000006000
<br>&gt;=20
<br>&gt; [=C2=A0=C2=A0 30.002524] uio_ivshmem 0003:00:00.0: output_section =
at
<br>&gt; 0x00000000fb70a000, size 0x0000000000002000
<br>&gt;=20
<br>&gt; [=C2=A0=C2=A0 30.002576] uio_ivshmem: probe of 0003:00:00.0 failed=
 with error -28
<br>&gt;=20
<br>&gt; [=C2=A0=C2=A0 30.002620] ivshmem-net 0003:00:01.0: enabling device=
 (0000 -&gt; 0002)
<br>&gt;=20
<br>&gt; [=C2=A0=C2=A0 30.002664] ivshmem-net 0003:00:01.0: TX memory at
<br>&gt; 0x00000000fb801000, size 0x000000000007f000
<br>&gt;=20
<br>&gt; [=C2=A0=C2=A0 30.002667] ivshmem-net 0003:00:01.0: RX memory at
<br>&gt; 0x00000000fb880000, size 0x000000000007f000
<br>&gt;=20
<br>&gt; [=C2=A0=C2=A0 30.047630] ivshmem-net: probe of 0003:00:01.0 failed=
 with error -28
<br>&gt;=20
<br>&gt; [=C2=A0=C2=A0 30.047714] The Jailhouse is opening.
<br>&gt;=20
<br>&gt;=20
<br>&gt; After some investigation I found the dts node of vPIC is added to =
root
<br>&gt; cell by using vpci_template.dts,=C2=A0 the Jailhouse
<br>&gt; driver=C2=A0create_vpci_of_overlay() in=C2=A0driver/pci.c can&#39;=
t add the handler of
<br>&gt; &quot;msi-parent&quot; to this PCI node,=C2=A0 but the kernel driv=
er of the virtual PCI
<br>&gt; device use the following function=C2=A0
<br>&gt; ret =3D pci_alloc_irq_vectors(pdev, 1, 2, PCI_IRQ_LEGACY | PCI_IRQ=
_MSIX);
<br>&gt; So the=C2=A0 driver will probe MSIX irq for the device, because th=
ere is no
<br>&gt; msi controller is speficied to vPCI, the result is no irq-domain i=
s
<br>&gt; provided to this PCI and irq allocated failed.
<br>&gt;=20
<br>&gt; so how to fix such issue? Appreciate any comments and suggestions,=
 thanks.
<br>
<br>The vPCI support in Jailhouse injects interrupts as legacy INTx. For
<br>that, you need to provide up to 4 (less if you have less ivshmem
<br>devices) consecutive SPIs that are not in use by real devices (in any
<br>cell). See other arm64 configs, specifically look for vpci_irq_base.
<br>
<br>Jan
<br>--=20
<br>Siemens AG, T RDA IOT
<br>Corporate Competence Center Embedded Linux
<br>
<br></blockquote></div>

<p></p>

-- <br />
You received this message because you are subscribed to the Google Groups &=
quot;Jailhouse&quot; group.<br />
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to <a href=3D"mailto:jailhouse-dev+unsubscribe@googlegroups.com">jailh=
ouse-dev+unsubscribe@googlegroups.com</a>.<br />
To view this discussion on the web visit <a href=3D"https://groups.google.c=
om/d/msgid/jailhouse-dev/650b2d0f-b721-44a4-9572-28c2a88a7559n%40googlegrou=
ps.com?utm_medium=3Demail&utm_source=3Dfooter">https://groups.google.com/d/=
msgid/jailhouse-dev/650b2d0f-b721-44a4-9572-28c2a88a7559n%40googlegroups.co=
m</a>.<br />

------=_Part_495_1170911725.1605261352168--

------=_Part_494_246487720.1605261352168--
