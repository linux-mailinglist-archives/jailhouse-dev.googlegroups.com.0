Return-Path: <jailhouse-dev+bncBCR7PPMN34DRBXXAQLVAKGQEJXUZMCI@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-oi1-x23b.google.com (mail-oi1-x23b.google.com [IPv6:2607:f8b0:4864:20::23b])
	by mail.lfdr.de (Postfix) with ESMTPS id 982FE7B4B7
	for <lists+jailhouse-dev@lfdr.de>; Tue, 30 Jul 2019 23:02:24 +0200 (CEST)
Received: by mail-oi1-x23b.google.com with SMTP id a198sf25363828oii.15
        for <lists+jailhouse-dev@lfdr.de>; Tue, 30 Jul 2019 14:02:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:date:from:to:message-id:in-reply-to:references:subject
         :mime-version:x-original-sender:precedence:mailing-list:list-id
         :list-post:list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=ybVj0qcKmFJyqEZXPl7lIpUGDwN/YM7SbAdSDnXK8IY=;
        b=HiDkAiCZnZvKOMy5ya+ngN7powwpc2BuerGBjloGVFbFM9n6gvYfCRRAGWg+Ailpuo
         HjDtdzUd/H1xKhx9PBSdE3nNpWnVL30utVJyorYoVz/EekMSMGOUNnfmLf8s08vDhE+E
         +FXmBJ8DbHEhmuB7oAMIFyLTl9HCod/+cS/OmihNNhbXsHzbdB/cvEVv1rLXo5TbIm0L
         oekShJHHk+LsjMJmQsRiIXmppCrJnhn7jFjZ/bLVxfwpCRapPxxSpGk7T2lJkSI4X4Jy
         ayNycfj3OR4YMS7jh8Ya2GE8SWPW14gGEjO/yBKoETHjT8yaw8hAfZDdeT8KIVUrJEN5
         ccXQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:message-id:in-reply-to:references:subject:mime-version
         :x-original-sender:precedence:mailing-list:list-id:list-post
         :list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=ybVj0qcKmFJyqEZXPl7lIpUGDwN/YM7SbAdSDnXK8IY=;
        b=E1U41tPtayT7+QwaoaEhL9RRNoCnpscoCjS3AhLy5sDSN+nwfIf/e5Pli0dcuBX5CD
         EqykDFUIoqy4yb2KndyHK57cI/hep7mVN9f08tsk0nOGw9jzif+SAatXEaVtCCM1a9P6
         hiLgmro2o2NH/Zp1d2lOHy1faFKjhOAEMAHeT4xjA9v0stuSb66R84DcsOcOwrKPuXZN
         HN2Uh83ddUByUJUGNLRXHH0kpU3prLJwtON/p/XmNakGkhYN1s+BhknMjCaJ2EO/lFLL
         ZxGLHYrZsFcvL9c9ZlpuTvRW7pJYpcpDUVGWjzxg37vh1POZvOPcgsy7dbRfXWFbdhnb
         Vjcw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:date:from:to:message-id:in-reply-to
         :references:subject:mime-version:x-original-sender:precedence
         :mailing-list:list-id:x-spam-checked-in-group:list-post:list-help
         :list-archive:list-subscribe:list-unsubscribe;
        bh=ybVj0qcKmFJyqEZXPl7lIpUGDwN/YM7SbAdSDnXK8IY=;
        b=TkatiV/YKzgkL/e2toGqJLTP1LQW81upGUoj790T2bo/7gtzh33YKblfIGksciO/tj
         8NOFDX5OS968FoB7R5nUAEutKnLLeKMhsZWt2oiosk6JmfEKzRV5tv5b5qgtMt+iBJWF
         xF2rlRqkqU/yYKrx0m0m8b3RDCNMex4pQhCBVsjjeaQdfgE5tt3rA7OqBlpaoFCYQFyl
         v2GInII1AhlDTN9wJ1uk+dk2/DPBJ8+g1OVA1Avnx89b7ueHrBwdDh3BASOpTxeyQ7k3
         Si26fTwoP02/9O1sI4Efn+4vfYODHCQVqkNg1rBaIR+xys4FPUEsa1IkykprYnR3vLPC
         +dNg==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: APjAAAURz67mTjdOhPjWYH4t7IhsYxPkj7cwELFyrXJShrpCfuh8F2qK
	Pkx3KZM9cym6uLV+EoULqno=
X-Google-Smtp-Source: APXvYqxHuNlifhYahmv3aQovCpJFZ3i0cjQAI2XIKdwec5JGoglNnlwZYX0nrQiAq8RJV1nynGX88A==
X-Received: by 2002:a05:6830:8a:: with SMTP id a10mr56800447oto.167.1564520543012;
        Tue, 30 Jul 2019 14:02:23 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a9d:3e45:: with SMTP id h5ls3747855otg.11.gmail; Tue, 30 Jul
 2019 14:02:22 -0700 (PDT)
X-Received: by 2002:a9d:7f0f:: with SMTP id j15mr27711855otq.156.1564520542279;
        Tue, 30 Jul 2019 14:02:22 -0700 (PDT)
Date: Tue, 30 Jul 2019 14:02:21 -0700 (PDT)
From: =?UTF-8?Q?Jo=C3=A3o_Reis?= <jpagsreis@gmail.com>
To: Jailhouse <jailhouse-dev@googlegroups.com>
Message-Id: <4d77d0ed-87d3-4b4e-b0fe-e16e50fd668f@googlegroups.com>
In-Reply-To: <c30da773-76bd-3691-3828-e8f7ed592d52@siemens.com>
References: <885a6592-84d9-43f4-a037-10ce73f968ab@googlegroups.com>
 <fe00f482-c82c-4f93-8a0e-f73dc955888d@googlegroups.com>
 <b4e7dbee-58cd-3126-ce6b-7b54ee0ef241@siemens.com>
 <211205da-9e38-4178-895a-3ba80f214aa9@googlegroups.com>
 <6abaf77f-e4a7-7a9a-2ae9-8d1d8f1388bf@siemens.com>
 <1726f6bd-680a-46ac-a7f3-937cbba84208@googlegroups.com>
 <19e76b74-6d6e-010d-952a-5a36e606091b@web.de>
 <a5b27da1-b2aa-4ce0-863f-d9503a22b886@googlegroups.com>
 <885b4c3e-8d69-e516-aff4-46f2e50cb622@web.de>
 <edf7dab3-2c32-43bb-b13b-fce8bc452418@googlegroups.com>
 <4f76dc91-7542-40b8-a0d9-eea52e1dd92a@siemens.com>
 <e5c36ed1-98a5-4a76-aca0-6589cf9c3108@googlegroups.com>
 <ef7a124c-e5e3-f61b-8ed0-aebf585c65d6@siemens.com>
 <dde1cd0e-407e-45b3-ae32-97c445100824@googlegroups.com>
 <2f6c0983-78e1-73e0-183c-3983dd757ee8@siemens.com>
 <39b83770-5562-437f-a25b-415d85dc7c3b@googlegroups.com>
 <94e3009c-aa34-e8f1-b503-d3a8b138d9a9@siemens.com>
 <43d8fdde-153f-40ec-8974-4388efab8315@googlegroups.com>
 <c30da773-76bd-3691-3828-e8f7ed592d52@siemens.com>
Subject: Re: Colored Linux as inmate
MIME-Version: 1.0
Content-Type: multipart/mixed; 
	boundary="----=_Part_9010_1489753512.1564520541555"
X-Original-Sender: jpagsreis@gmail.com
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

------=_Part_9010_1489753512.1564520541555
Content-Type: multipart/alternative; 
	boundary="----=_Part_9011_654094043.1564520541556"

------=_Part_9011_654094043.1564520541556
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Yes, that solved the problem, but it still keeps me giving errors on root=
=20
side:

Created cell "non-root"
Page pool usage after cell creation: mem 75/995, remap 5/131072
[   45.383078] Created Jailhouse cell "non-root"
Cell "non-root" can be loaded
Unhandled data write at 0x90280000(1)
FATAL: unhandled trap (exception class 0x24)
Cell state before exception:
 pc: ffffff8008a168b0   lr: ffffff8000ae0b48 spsr: 20000145     EL1
 sp: ffffff800d5abd30  esr: 24 1 0000045
 x0: ffffff8010000000   x1: 0000007f85ab0050   x2: 00000000055c3980
 x3: 0000000000000000   x4: 0000000000000000   x5: ffffff80155c3a00
 x6: ffffff8010000000   x7: 1424ffff91005a4d   x8: 0000000000080000
 x9: 00000000057c8000  x10: 000000000000000a  x11: 0000000000000000
x12: 0000000000000000  x13: 0000000000000000  x14: 00000040644d5241
x15: 0000007f90dbbc10  x16: ffffff80081aee70  x17: 0000007f90d65e90
x18: 0000000000000000  x19: 0000000000000000  x20: 0000007fe60fd228
x21: 00000000055c3a00  x22: ffffffc043525c80  x23: 0000000000000001
x24: 0000000000000000  x25: ffffff800d5abda0  x26: ffffff8010000000
x27: ffffff8010000000  x28: ffffff80098fd028  x29: ffffff800d5abd30

Parking CPU 0 (Cell: "root")


ter=C3=A7a-feira, 30 de Julho de 2019 =C3=A0s 18:00:59 UTC+1, Jan Kiszka es=
creveu:
>
> On 30.07.19 17:54, Jo=C3=A3o Reis wrote:=20
> > Ok, so i realized i was declaring, on non root cell, a memory region=20
> that=20
> > belonged to non-reserved memory from root cell(3fd00000-5fffffff :=20
> System RAM).=20
> > I've changed the memory region to reserved memory (address 0x90000000),=
=20
> because=20
> > on u-boot the memory reservation argument is mem=3D1536M, which equals =
to=20
> top=20
> > address 0x5fffffff.=20
> >=20
> > /* RAM */ {=20
> > .phys_start =3D 0x90000000,=20
> > .virt_start =3D 0x90000000,=20
> > .size =3D 0x20000000, =20
> > .flags =3D JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |=20
> > JAILHOUSE_MEM_EXECUTE | JAILHOUSE_MEM_LOADABLE |=20
> > JAILHOUSE_MEM_DMA,=20
> > },=20
>
> Do you also still have a small region at guest virtual address 0, to put=
=20
> the=20
> loader there?=20
>
> >=20
> > After issuing "jailhouse cell linux ultra96-linux-demo2.cell Image -d=
=20
> > inmate-zynqmp.dtb -i rootfs.cpio -c "console=3DttyS0, 115200" -k 4"=20
> >=20
> > The following error appears:=20
> >=20
> > [   82.987144] Created Jailhouse cell "non-root"=20
> > Cell "non-root" can be loaded=20
> >=20
> > Traceback (most recent call last):=20
> >   File "/usr/local/libexec/jailhouse/jailhouse-cell-linux", line 826, i=
n=20
> <module>=20
> >     cell.load(open(linux_loader, mode=3D'rb').read(),=20
> arch.loader_address())=20
> >   File "/usr/local/lib/python2.7/dist-packages/pyjailhouse/cell.py",=20
> line 44, in=20
> > load=20
> >     fcntl.ioctl(self.dev, self.JAILHOUSE_CELL_LOAD, load)=20
> > IOError: [Errno 22] Invalid argument=20
>
> Does the hypervisor report that "Cell "XXX" can be loaded"? Then the erro=
r=20
> is=20
> reported by the driver module, load_image(). And I would bet on a missing=
=20
> region=20
> at address 0.=20
>
> Jan=20
>
> --=20
> Siemens AG, Corporate Technology, CT RDA IOT SES-DE=20
> Corporate Competence Center Embedded Linux=20
>

--=20
You received this message because you are subscribed to the Google Groups "=
Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/=
jailhouse-dev/4d77d0ed-87d3-4b4e-b0fe-e16e50fd668f%40googlegroups.com.

------=_Part_9011_654094043.1564520541556
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Yes, that solved the problem, but it still keeps me giving=
 errors on root side:<div><br></div><div><div>Created cell &quot;non-root&q=
uot;</div><div>Page pool usage after cell creation: mem 75/995, remap 5/131=
072</div><div>[=C2=A0 =C2=A045.383078] Created Jailhouse cell &quot;non-roo=
t&quot;</div><div>Cell &quot;non-root&quot; can be loaded</div><div>Unhandl=
ed data write at 0x90280000(1)</div><div>FATAL: unhandled trap (exception c=
lass 0x24)</div><div>Cell state before exception:</div><div>=C2=A0pc: fffff=
f8008a168b0=C2=A0 =C2=A0lr: ffffff8000ae0b48 spsr: 20000145=C2=A0 =C2=A0 =
=C2=A0EL1</div><div>=C2=A0sp: ffffff800d5abd30=C2=A0 esr: 24 1 0000045</div=
><div>=C2=A0x0: ffffff8010000000=C2=A0 =C2=A0x1: 0000007f85ab0050=C2=A0 =C2=
=A0x2: 00000000055c3980</div><div>=C2=A0x3: 0000000000000000=C2=A0 =C2=A0x4=
: 0000000000000000=C2=A0 =C2=A0x5: ffffff80155c3a00</div><div>=C2=A0x6: fff=
fff8010000000=C2=A0 =C2=A0x7: 1424ffff91005a4d=C2=A0 =C2=A0x8: 000000000008=
0000<br></div><div>=C2=A0x9: 00000000057c8000=C2=A0 x10: 000000000000000a=
=C2=A0 x11: 0000000000000000<br></div><div>x12: 0000000000000000=C2=A0 x13:=
 0000000000000000=C2=A0 x14: 00000040644d5241<br></div><div>x15: 0000007f90=
dbbc10=C2=A0 x16: ffffff80081aee70=C2=A0 x17: 0000007f90d65e90<br></div><di=
v>x18: 0000000000000000=C2=A0 x19: 0000000000000000=C2=A0 x20: 0000007fe60f=
d228<br></div><div>x21: 00000000055c3a00=C2=A0 x22: ffffffc043525c80=C2=A0 =
x23: 0000000000000001<br></div><div>x24: 0000000000000000=C2=A0 x25: ffffff=
800d5abda0=C2=A0 x26: ffffff8010000000<br></div><div>x27: ffffff8010000000=
=C2=A0 x28: ffffff80098fd028=C2=A0 x29: ffffff800d5abd30<br></div><div><br>=
</div><div>Parking CPU 0 (Cell: &quot;root&quot;)<br></div><div><br></div><=
br>ter=C3=A7a-feira, 30 de Julho de 2019 =C3=A0s 18:00:59 UTC+1, Jan Kiszka=
 escreveu:<blockquote class=3D"gmail_quote" style=3D"margin: 0;margin-left:=
 0.8ex;border-left: 1px #ccc solid;padding-left: 1ex;">On 30.07.19 17:54, J=
o=C3=A3o Reis wrote:
<br>&gt; Ok, so i realized i was declaring, on non root cell,=C2=A0a memory=
 region that
<br>&gt; belonged to non-reserved memory from root cell(3fd00000-5fffffff :=
 System RAM).
<br>&gt; I&#39;ve changed the memory region to reserved memory (address 0x9=
0000000), because
<br>&gt; on u-boot the memory reservation argument is mem=3D1536M, which eq=
uals to top
<br>&gt; address 0x5fffffff.
<br>&gt;=20
<br>&gt; /* RAM */ {
<br>&gt; .phys_start =3D 0x90000000,
<br>&gt; .virt_start =3D 0x90000000,
<br>&gt; .size =3D 0x20000000,=C2=A0
<br>&gt; .flags =3D JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
<br>&gt; JAILHOUSE_MEM_EXECUTE | JAILHOUSE_MEM_LOADABLE |
<br>&gt; JAILHOUSE_MEM_DMA,
<br>&gt; },
<br>
<br>Do you also still have a small region at guest virtual address 0, to pu=
t the
<br>loader there?
<br>
<br>&gt;=20
<br>&gt; After issuing &quot;jailhouse cell linux ultra96-linux-demo2.cell =
Image -d
<br>&gt; inmate-zynqmp.dtb -i rootfs.cpio -c &quot;console=3DttyS0, 115200&=
quot; -k 4&quot;
<br>&gt;=20
<br>&gt; The following error appears:
<br>&gt;=20
<br>&gt; [=C2=A0 =C2=A082.987144] Created Jailhouse cell &quot;non-root&quo=
t;
<br>&gt; Cell &quot;non-root&quot; can be loaded
<br>&gt;=20
<br>&gt; Traceback (most recent call last):
<br>&gt; =C2=A0 File &quot;/usr/local/libexec/jailhouse/<wbr>jailhouse-cell=
-linux&quot;, line 826, in &lt;module&gt;
<br>&gt; =C2=A0 =C2=A0 cell.load(open(linux_loader, mode=3D&#39;rb&#39;).re=
ad(), arch.loader_address())
<br>&gt; =C2=A0 File &quot;/usr/local/lib/python2.7/<wbr>dist-packages/pyja=
ilhouse/<wbr>cell.py&quot;, line 44, in
<br>&gt; load
<br>&gt; =C2=A0 =C2=A0 fcntl.ioctl(<a href=3D"http://self.dev" target=3D"_b=
lank" rel=3D"nofollow" onmousedown=3D"this.href=3D&#39;http://www.google.co=
m/url?q\x3dhttp%3A%2F%2Fself.dev\x26sa\x3dD\x26sntz\x3d1\x26usg\x3dAFQjCNH9=
hLWbeS0NEb_1KzthAtPBQE9BRg&#39;;return true;" onclick=3D"this.href=3D&#39;h=
ttp://www.google.com/url?q\x3dhttp%3A%2F%2Fself.dev\x26sa\x3dD\x26sntz\x3d1=
\x26usg\x3dAFQjCNH9hLWbeS0NEb_1KzthAtPBQE9BRg&#39;;return true;">self.dev</=
a>, self.JAILHOUSE_CELL_LOAD, load)
<br>&gt; IOError: [Errno 22] Invalid argument
<br>
<br>Does the hypervisor report that &quot;Cell &quot;XXX&quot; can be loade=
d&quot;? Then the error is
<br>reported by the driver module, load_image(). And I would bet on a missi=
ng region
<br>at address 0.
<br>
<br>Jan
<br>
<br>--=20
<br>Siemens AG, Corporate Technology, CT RDA IOT SES-DE
<br>Corporate Competence Center Embedded Linux
<br></blockquote></div></div>

<p></p>

-- <br />
You received this message because you are subscribed to the Google Groups &=
quot;Jailhouse&quot; group.<br />
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to <a href=3D"mailto:jailhouse-dev+unsubscribe@googlegroups.com">jailh=
ouse-dev+unsubscribe@googlegroups.com</a>.<br />
To view this discussion on the web visit <a href=3D"https://groups.google.c=
om/d/msgid/jailhouse-dev/4d77d0ed-87d3-4b4e-b0fe-e16e50fd668f%40googlegroup=
s.com?utm_medium=3Demail&utm_source=3Dfooter">https://groups.google.com/d/m=
sgid/jailhouse-dev/4d77d0ed-87d3-4b4e-b0fe-e16e50fd668f%40googlegroups.com<=
/a>.<br />

------=_Part_9011_654094043.1564520541556--

------=_Part_9010_1489753512.1564520541555
Content-Type: text/x-csrc; charset=UTF-8; name=ultra96-linux-demo2.c
Content-Transfer-Encoding: quoted-printable
Content-Disposition: attachment; filename=ultra96-linux-demo2.c
X-Attachment-Id: bd79aa5b-6b20-4b98-863c-28e7133b865e
Content-ID: <bd79aa5b-6b20-4b98-863c-28e7133b865e>

/*
 * Jailhouse, a Linux-based partitioning hypervisor
 *
 * Configuration for linux-demo inmate on Avnet Ultra96 board:
 * 2 CPUs, 128M RAM, serial port 2
 *
 * Copyright (c) Siemens AG, 2014-2019
 *
 * Authors:
 *  Jan Kiszka <jan.kiszka@siemens.com>
 *
 * This work is licensed under the terms of the GNU GPL, version 2.  See
 * the COPYING file in the top-level directory.
 */

#include <jailhouse/types.h>
#include <jailhouse/cell-config.h>

struct {
=09struct jailhouse_cell_desc cell;
=09__u64 cpus[1];
=09struct jailhouse_memory mem_regions[6];
=09struct jailhouse_irqchip irqchips[1];
=09struct jailhouse_pci_device pci_devices[1];
} __attribute__((packed)) config =3D {
=09.cell =3D {
=09=09.signature =3D JAILHOUSE_CELL_DESC_SIGNATURE,
=09=09.revision =3D JAILHOUSE_CONFIG_REVISION,
=09=09.name =3D "non-root",
=09=09.flags =3D JAILHOUSE_CELL_PASSIVE_COMMREG,/* |
=09=09JAILHOUSE_CELL_VIRTUAL_CONSOLE_ACTIVE,*/

=09=09.cpu_set_size =3D sizeof(config.cpus),
=09=09.num_memory_regions =3D ARRAY_SIZE(config.mem_regions),
=09=09.num_irqchips =3D ARRAY_SIZE(config.irqchips),
=09=09.num_pci_devices =3D ARRAY_SIZE(config.pci_devices),

=09=09.vpci_irq_base =3D 140-32,

=09=09.console =3D {
=09=09=09.address =3D 0xff010000, /*UART1*/
=09=09=09//.address =3D 0xff000000, /*UART0*/ //se eu meter uart0 da erro u=
nhandled trap
=09=09=09.type=3D JAILHOUSE_CON_TYPE_XUARTPS,
=09=09=09.flags =3D JAILHOUSE_CON_ACCESS_MMIO |
=09=09=09=09 JAILHOUSE_CON_REGDIST_4,
=09=09},
=09},

=09.cpus =3D {
=09=09//0xe, //1110
=09=09//0x8, //1000 - fica com cpu3
=09=090xc, //1100
=09},

=09.mem_regions =3D {
=09=09/* UART */ {
=09=09=09.phys_start =3D 0xff010000,
=09=09=09.virt_start =3D 0xff010000,
=09=09=09/*.phys_start =3D 0xff000000,
=09=09=09.virt_start =3D 0xff000000,*/
=09=09=09.size =3D 0x1000,
=09=09=09.flags =3D JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
=09=09=09=09JAILHOUSE_MEM_IO | JAILHOUSE_MEM_ROOTSHARED,
=09=09},
=09=09/* RAM */ {
=09=09=09.phys_start =3D 0x90000000,
=09=09=09.virt_start =3D 0x90000000,
=09=09=09.size =3D 0x20000000, //must be page size aligned
=09=09=09.flags =3D JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
=09=09=09=09JAILHOUSE_MEM_EXECUTE | JAILHOUSE_MEM_LOADABLE |
=09=09=09=09JAILHOUSE_MEM_DMA,/* |
=09=09=09=09JAILHOUSE_MEM_ROOTSHARED,*/ //se tirar JAILHOUSE_MEM_ROOTSHARED=
 da exception fault 0x20
=09=09},
=09=09/* RAM for loader*/ {
=09=09=09.phys_start =3D 0x7bef0000,
=09=09=09.virt_start =3D 0, //needs to start at 0 for loader
=09=09=09.size =3D 0x10000,
=09=09=09.flags =3D JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
=09=09=09=09JAILHOUSE_MEM_EXECUTE | JAILHOUSE_MEM_LOADABLE,
=09=09},
=09=09/* RAM */ {
=09=09=09.phys_start =3D 0x74000000,
=09=09=09.virt_start =3D 0x74000000,
=09=09=09.size =3D 0x7ef0000,
=09=09=09.flags =3D JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
=09=09=09=09JAILHOUSE_MEM_EXECUTE | JAILHOUSE_MEM_DMA |
=09=09=09=09JAILHOUSE_MEM_LOADABLE,
=09=09},
=09=09/* IVSHMEM shared memory region */ {
=09=09=09.phys_start =3D 0x7bf00000,
=09=09=09.virt_start =3D 0x7bf00000,
=09=09=09.size =3D 0x100000,
=09=09=09.flags =3D JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
=09=09=09=09JAILHOUSE_MEM_ROOTSHARED,
=09=09},
=09=09/* communication region */ {
=09=09=09.virt_start =3D 0x80000000,
=09=09=09.size =3D 0x00001000,
=09=09=09.flags =3D JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
=09=09=09=09JAILHOUSE_MEM_COMM_REGION,
=09=09},
=09},
=09=09

=09.irqchips =3D {
=09=09/* GIC */ {
=09=09=09.address =3D 0xf9010000, /* GICD base address - Display controller=
 */
=09=09=09.pin_base =3D 32, /* The first irqchip starts at .pin_base=3D32 as=
 the first 32 interrupts are=20
reserved for SGIs and PPIs. */
=09=09=09.pin_bitmap =3D {
=09=09=09=09//1 << (54 - 32),
=09=09=09=091 << (53 - 32), // cat /proc/interrupts interrupt da UART0 AQUI=
 ESTA A DIFEREN=C3=87A
=09=09=09=090,
=09=09=09=090,
=09=09=09=09(1 << (140 - 128)) | (1 << (142 - 128)) //PL to PS interrupt si=
gnals 8 to 15.
=09=09=09},
=09=09},
=09},

=09.pci_devices =3D {
=09=09/* 00:00.0 */ {
=09=09=09.type =3D JAILHOUSE_PCI_TYPE_IVSHMEM,
=09=09=09.bdf =3D 0 << 3, // 00:00.0
=09=09=09.iommu =3D 1,//
=09=09=09.bar_mask =3D {
=09=09=09=090xffffff00, 0xffffffff, 0x00000000,
=09=09=09=090x00000000, 0x00000000, 0x00000000,
=09=09=09},
=09=09=09.shmem_region =3D 4,
=09=09=09//.shmem_protocol =3D JAILHOUSE_SHMEM_PROTO_VETH,
=09=09=09//.shmem_protocol =3D JAILHOUSE_SHMEM_PROTO_CUSTOM,
=09=09=09.shmem_protocol =3D JAILHOUSE_SHMEM_PROTO_UNDEFINED,
=09=09=09//.num_msix_vectors =3D 1,
=09=09},
=09},
};

------=_Part_9010_1489753512.1564520541555
Content-Type: text/x-csrc; charset=UTF-8; name=ultra96.c
Content-Transfer-Encoding: quoted-printable
Content-Disposition: attachment; filename=ultra96.c
X-Attachment-Id: 52518fe8-eda1-455b-a40d-1a94ea11d2ab
Content-ID: <52518fe8-eda1-455b-a40d-1a94ea11d2ab>

/*
 * Jailhouse, a Linux-based partitioning hypervisor
 *
 * Configuration for Avnet Ultra96 board
 *
 * Copyright (c) Siemens AG, 2016-2019
 *
 * Authors:
 *  Jan Kiszka <jan.kiszka@siemens.com>
 *
 * This work is licensed under the terms of the GNU GPL, version 2.  See
 * the COPYING file in the top-level directory.
 */

#include <jailhouse/types.h>
#include <jailhouse/cell-config.h>

struct {
=09struct jailhouse_system header;
=09__u64 cpus[1];
=09struct jailhouse_memory mem_regions[3];
=09struct jailhouse_irqchip irqchips[1];
=09struct jailhouse_pci_device pci_devices[1];
} __attribute__((packed)) config =3D {
=09.header =3D {
=09=09.signature =3D JAILHOUSE_SYSTEM_SIGNATURE,
=09=09.revision =3D JAILHOUSE_CONFIG_REVISION,
=09=09.flags =3D JAILHOUSE_SYS_VIRTUAL_DEBUG_CONSOLE,
=09=09.hypervisor_memory =3D {
=09=09=09.phys_start =3D 0x7c000000,
=09=09=09.size =3D       0x00400000,
=09=09},
=09=09.debug_console =3D {
=09=09=09.address =3D 0xff010000,
=09=09=09.size =3D 0x1000,
=09=09=09.type =3D JAILHOUSE_CON_TYPE_XUARTPS,
=09=09=09.flags =3D JAILHOUSE_CON_ACCESS_MMIO |
=09=09=09=09 JAILHOUSE_CON_REGDIST_4,
=09=09},
=09=09.platform_info =3D {
=09=09=09.pci_mmconfig_base =3D 0xfc000000,
=09=09=09.pci_mmconfig_end_bus =3D 0,
=09=09=09.pci_is_virtual =3D 1,
=09=09=09.arm =3D {
=09=09=09=09.gic_version =3D 2,
=09=09=09=09.gicd_base =3D 0xf9010000,
=09=09=09=09.gicc_base =3D 0xf902f000,
=09=09=09=09.gich_base =3D 0xf9040000,
=09=09=09=09.gicv_base =3D 0xf906f000,
=09=09=09=09.maintenance_irq =3D 25,
=09=09=09},
=09=09},
=09=09.root_cell =3D {
=09=09=09.name =3D "root",

=09=09=09.cpu_set_size =3D sizeof(config.cpus),
=09=09=09.num_memory_regions =3D ARRAY_SIZE(config.mem_regions),
=09=09=09.num_irqchips =3D ARRAY_SIZE(config.irqchips),
=09=09=09.num_pci_devices =3D ARRAY_SIZE(config.pci_devices),

=09=09=09.vpci_irq_base =3D 136-32,
=09=09},
=09},

=09.cpus =3D {
=09=090xf,
=09},

=09.mem_regions =3D {
=09=09/* MMIO (permissive) */ {
=09=09=09.phys_start =3D 0xfd000000,
=09=09=09.virt_start =3D 0xfd000000,
=09=09=09.size =3D=09      0x03000000,
=09=09=09.flags =3D JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
=09=09=09=09JAILHOUSE_MEM_IO,
=09=09},
=09=09/* RAM */ {
=09=09=09.phys_start =3D 0x0,
=09=09=09.virt_start =3D 0x0,
=09=09=09.size =3D 0x7c000000,
=09=09=09.flags =3D JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
=09=09=09=09JAILHOUSE_MEM_EXECUTE,
=09=09},
=09=09/* IVSHMEM shared memory region for 00:00.0 */ {
=09=09=09.phys_start =3D 0x7bf00000,
=09=09=09.virt_start =3D 0x7bf00000,
=09=09=09.size =3D 0x100000,
=09=09=09.flags =3D JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE,
=09=09},
=09},

=09.irqchips =3D {
=09=09/* GIC */ {
=09=09=09.address =3D 0xf9010000,
=09=09=09.pin_base =3D 32,
=09=09=09.pin_bitmap =3D {
=09=09=09=090xffffffff, 0xffffffff, 0xffffffff, 0xffffffff,
=09=09=09},
=09=09},
=09},

=09.pci_devices =3D {
=09=09/* 0001:00:00.0 */ {
=09=09=09.type =3D JAILHOUSE_PCI_TYPE_IVSHMEM,
=09=09=09.iommu =3D 1,//
=09=09=09//.domain =3D 1,
=09=09=09.bdf =3D 0 << 3,
=09=09=09.bar_mask =3D {
=09=09=09=090xffffff00, 0xffffffff, 0x00000000,
=09=09=09=090x00000000, 0x00000000, 0x00000000,
=09=09=09},
=09=09=09.shmem_region =3D 2,
=09=09=09//.shmem_protocol =3D JAILHOUSE_SHMEM_PROTO_VETH,
=09=09=09//.shmem_protocol =3D JAILHOUSE_SHMEM_PROTO_CUSTOM,
=09=09=09.shmem_protocol =3D JAILHOUSE_SHMEM_PROTO_UNDEFINED,=20
=09=09=09//.num_msix_vectors =3D 1,//se colocar isto, qd fa=C3=A7o insmod u=
io_ivshmem.ko ele n diz "using jailhouse mode" e dps n existe /dev/uio1
=09=09},
=09},
};

------=_Part_9010_1489753512.1564520541555--
