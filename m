Return-Path: <jailhouse-dev+bncBDIJ36FET4JRBUXH6WWAMGQEHH33WKI@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-yb1-xb3d.google.com (mail-yb1-xb3d.google.com [IPv6:2607:f8b0:4864:20::b3d])
	by mail.lfdr.de (Postfix) with ESMTPS id 1526F8289F1
	for <lists+jailhouse-dev@lfdr.de>; Tue,  9 Jan 2024 17:27:01 +0100 (CET)
Received: by mail-yb1-xb3d.google.com with SMTP id 3f1490d57ef6-dbed375def6sf3991161276.0
        for <lists+jailhouse-dev@lfdr.de>; Tue, 09 Jan 2024 08:27:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20230601; t=1704817620; x=1705422420; darn=lfdr.de;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:x-original-sender:mime-version
         :subject:references:in-reply-to:message-id:to:from:date:sender:from
         :to:cc:subject:date:message-id:reply-to;
        bh=NK7AOVqBMlFaa0KJ9sgSbEoLeFNZuT+cOb6RmB3wD8o=;
        b=OsUr4NbjuyMd+FrAltqHzgZBmFIWORuM4aDmkNnexOv1LonW7i4DrRCmeZegMTDJIm
         XTP3cqFS10xKTicjfxmuMEAGNbUGtRmPq7n8QPJvAUYS48ougp5ZOPc4d1hEGps9LDrq
         XZuoMXBNC2Rm3VlnVk5hIkVFUxCiBQV07qrUpS6o0H7THla2rzz2ISvYsOldrqMzoegk
         YNl4o0iiDY5ZCTgiYURRxiiDSt/5ayQuACgnJ1D8A0whc2QD7RMFEcvfE/FltibdpBP6
         3HV5z5/gRn3fqmoXjc+9RHR/dxVp04gvKdL7op+BNAgRoiO22B1ZjkI8u4oApp4fthey
         Dx0A==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1704817620; x=1705422420; darn=lfdr.de;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:x-original-sender:mime-version
         :subject:references:in-reply-to:message-id:to:from:date:from:to:cc
         :subject:date:message-id:reply-to;
        bh=NK7AOVqBMlFaa0KJ9sgSbEoLeFNZuT+cOb6RmB3wD8o=;
        b=XtIvG8s1zaH9wZZ0ns5l4eIsUAK5XtEc25qBu2xVQXJq5uhy7Z23Ddg6yZZN3cA8zW
         SKXAskPfGFMUti45uoMKT5Ippiub5mnXqw1xw3ERpMUJjnJGmg9dfjHx5Mqlm8GIC6Xh
         ryjojOyklUEL7PsvxXHtz4ms1f4Fjw23OV8rSImt+VNmMm2RUbwOL0DbwajpfQ6zDxXg
         kQ7GMpNg+aPm+i1peBhrDj+rQBpTjicfjpw3E2tdTeK34wAWAwiablRMXYBUuDROCpEg
         wQJ6iH9XUODJfmDNve+aaWL2AN1/csQU5Km+6LhR/6hPVOMnloCZgZbGC6A3mN1/2IbA
         8gWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1704817620; x=1705422420;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :x-spam-checked-in-group:list-id:mailing-list:precedence
         :x-original-sender:mime-version:subject:references:in-reply-to
         :message-id:to:from:date:x-beenthere:x-gm-message-state:sender:from
         :to:cc:subject:date:message-id:reply-to;
        bh=NK7AOVqBMlFaa0KJ9sgSbEoLeFNZuT+cOb6RmB3wD8o=;
        b=mdSmQfYguq6me36poApgeNuSgjgF4Fe1FYw8X/5u9VOKC3ZmnCl3VSI4MEUkRzM9qr
         FoMn5AxBt3PVGNbUcabKxAaS1iGQBMS06xpzFBe0KKrDyraYBC6wanxEc9yD4aykRJ6K
         LaPDTRIUZ8SLneDuloT5UMtLdH2bCXSN/pCPcCodGGyqqfawemusJheMvrDNqciY5m7P
         wF3b1IZqkuvYa5ReC15miD+5DWPaeJKxOSrDuztzxiAbSD7634PJ4akLGliGfWccDGeE
         vl5N66DmMJAz+qFo6H8DmfWtHr/qQJhshjPtkRASGAE1AoAyBslbqZ6chLs52GIofwM8
         t2DA==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AOJu0YzAH0zDM7J/WVo8wiiHPp/zszW/Y1j+sfHTi2lAyNh785AA6Sny
	elsjwq+uVToNHFGxNYaiuKE=
X-Google-Smtp-Source: AGHT+IHQFSyYL4WKqqt8U3NEFm2qwwvM7bLqcSTgB7JDATnEzkGYcrtTCVyRP0eBi+pPLk/W0fYCVA==
X-Received: by 2002:a25:ac68:0:b0:dbe:e422:1800 with SMTP id r40-20020a25ac68000000b00dbee4221800mr634065ybd.43.1704817619825;
        Tue, 09 Jan 2024 08:26:59 -0800 (PST)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a25:d7cc:0:b0:dbd:c1d9:dbc0 with SMTP id o195-20020a25d7cc000000b00dbdc1d9dbc0ls459239ybg.2.-pod-prod-00-us;
 Tue, 09 Jan 2024 08:26:58 -0800 (PST)
X-Received: by 2002:a25:664d:0:b0:dbe:d0a9:2be3 with SMTP id z13-20020a25664d000000b00dbed0a92be3mr337770ybm.3.1704817617845;
        Tue, 09 Jan 2024 08:26:57 -0800 (PST)
Date: Tue, 9 Jan 2024 08:26:57 -0800 (PST)
From: =?UTF-8?Q?Michele_Pescap=C3=A8?= <mic.pescape@gmail.com>
To: Jailhouse <jailhouse-dev@googlegroups.com>
Message-Id: <c9dad4f3-f856-4f25-b6ad-41ec63cf2c64n@googlegroups.com>
In-Reply-To: <d36e18a4-dd64-4f9c-b2cf-89b02b1a0469@oth-regensburg.de>
References: <824bacc4-b7ae-47c9-878e-7203214b4fc3n@googlegroups.com>
 <d36e18a4-dd64-4f9c-b2cf-89b02b1a0469@oth-regensburg.de>
Subject: Re: Unable to start non root linux cell
MIME-Version: 1.0
Content-Type: multipart/mixed; 
	boundary="----=_Part_131321_2041927760.1704817617096"
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

------=_Part_131321_2041927760.1704817617096
Content-Type: multipart/alternative; 
	boundary="----=_Part_131322_252328938.1704817617096"

------=_Part_131322_252328938.1704817617096
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi, thank you for replying.

ttyS0 is indeed whitelisted in the inmate and the number of pio_regions is=
=20
set accordingly.=20

As for the crash after disable/shutdown, I think it was related to the PCI=
=20
device, after commenting that and the corresponding regions out I no longer=
=20
get that freeze. CONFIG_JAILHOUSE_GUEST and=20
CONFIG_JAILHOUSE_DBCON were already set in the kernel configuration I'm=20
using for the non root linux; still, I recompiled it just in case.

Michele

Il giorno marted=C3=AC 9 gennaio 2024 alle 14:14:33 UTC+1 Ralf Ramsauer ha=
=20
scritto:

Hi,=20

On 08/01/2024 23:56, Michele Pescap=C3=A8 wrote:=20
> Hi all,=20
>=20
> I have an AMD Ryzen 2600 on a b450 motherboard. My goal is to run two=20
> non root linux cells, however, as of right now, I'm not able to start=20
> any non root linux cells.=20
> First of all I don't receive an output from the cell (I do get output=20
> from the apic-demo though), therefore I don't really know if they're=20
> even crashing or not; this is the output I get from the hypervisor after=
=20
> enabling the root cell and issuing the following command:=20
>=20
> sudo jailhouse cell linux configs/x86/linux_guest1.cell=20
> ../buildroot-2023.11/output/images/bzImage -i=20
> ../buildroot-2023.11/output/images/rootfs.cpio=20

for the first few tries, simply don't load a ramdisk. Try to get the=20
kernel booting. It will crash with "cannot mount rootfs". If we get so=20
far, then you can continue specifying the ramdisk. But first, we have to=20
get that far.=20

>=20
> Adding PCI device ff:1f.7 to cell "linux-x86-demo"=20
> Created cell "linux-x86-demo"=20
> Page pool usage after cell creation: mem 336/32211, remap 16392/131072=20
> Cell "linux-x86-demo" can be loaded=20
> CPU 4 received SIPI, vector 100=20
> CPU 3 received SIPI, vector 100=20
> Started cell "linux-x86-demo"=20
>=20
> After this the cell appears to be running in cell list, however I can't=
=20
> seem to get any output to confirm that (I even set=20
> JAILHOUSE_CELL_VIRTUAL_CONSOLE_ACTIVE, but nothing appears on the vrtual=
=20
> console accessed via "jailhouse console -f"). I also tried adding -c=20
> "console=3DttyS0,115200".=20

ttyS0, i.e., x86 Port 0x3f8 is whitelisted in the cell configuration?=20
Actually, your cmdline is correct.=20

> At this point if I try to disable/shutdown the cell, the system freezes=
=20
> requiring a hard reset.=20

Okay, is the guest Linux compiled with Jailhouse guest support? Please=20
ensure that non-root Linux is compiled with CONFIG_JAILHOUSE_GUEST and=20
CONFIG_JAILHOUSE_DBCON. The first one is mandatory for x86 Linux guests.=20

>=20
> Also, there seems to be a mismatch between the PCI bdf value in the log=
=20
> above and the one in the cell's configuration. In both root and non root=
=20
> cells i set .bdf =3D (0x0f << 3) for the IVSHMEM net device and the Root=
=20
> cell correctly reports that ("Adding virtual PCI device 00:0f.0 to cell=
=20
> "RootCell"").=20

First things first. Let's try to get Linux kicked off before diving into=20
PCI. Comment it out for the moment, let's do that later.=20

Ralf=20

>=20
> If I understood correctly, once the cell works properly I won't need to=
=20
> set the console anymore as I can assign an ip (-c "ip x.x.x.x" in the=20
> cell linux command) and ssh to the cell, right?=20
>=20
> I attach the root and non root cells' configurations in case they're=20
> needed. I can provide both the root and non root cell's kernel .conf and=
=20
> the buildroot configuration I used if needed.=20
>=20
> Thank you for your time,=20
> Michele=20
>=20
> --=20
> You received this message because you are subscribed to the Google=20
> Groups "Jailhouse" group.=20
> To unsubscribe from this group and stop receiving emails from it, send=20
> an email to jailhouse-de...@googlegroups.com=20
> <mailto:jailhouse-de...@googlegroups.com>.=20
> To view this discussion on the web visit=20
>=20
https://groups.google.com/d/msgid/jailhouse-dev/824bacc4-b7ae-47c9-878e-720=
3214b4fc3n%40googlegroups.com=20
<
https://groups.google.com/d/msgid/jailhouse-dev/824bacc4-b7ae-47c9-878e-720=
3214b4fc3n%40googlegroups.com?utm_medium=3Demail&utm_source=3Dfooter>.=20


--=20
You received this message because you are subscribed to the Google Groups "=
Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/=
jailhouse-dev/c9dad4f3-f856-4f25-b6ad-41ec63cf2c64n%40googlegroups.com.

------=_Part_131322_252328938.1704817617096
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi, thank you for replying.<br /><br />ttyS0 is indeed whitelisted in the i=
nmate and the number of pio_regions is set accordingly. <br /><br />As for =
the crash after disable/shutdown, I think it was related to the PCI device,=
 after commenting that and the corresponding regions out I no longer get th=
at freeze. CONFIG_JAILHOUSE_GUEST and=20
<br />CONFIG_JAILHOUSE_DBCON were already set in the kernel configuration I=
'm using for the non root linux; still, I recompiled it just in case.<br />=
<br />Michele<br /><br /><div><div dir=3D"auto">Il giorno marted=C3=AC 9 ge=
nnaio 2024 alle 14:14:33 UTC+1 Ralf Ramsauer ha scritto:<br /></div><blockq=
uote style=3D"margin: 0px 0px 0px 0.8ex; border-left: 1px solid rgb(204, 20=
4, 204); padding-left: 1ex;">Hi,
<br />
<br />On 08/01/2024 23:56, Michele Pescap=C3=A8 wrote:
<br />&gt; Hi all,
<br />&gt;=20
<br />&gt; I have an AMD Ryzen 2600 on a b450 motherboard. My goal is to ru=
n two=20
<br />&gt; non root linux cells, however, as of right now, I'm not able to =
start=20
<br />&gt; any non root linux cells.
<br />&gt; First of all I don't receive an output from the cell (I do get o=
utput=20
<br />&gt; from the apic-demo though), therefore I don't really know if the=
y're=20
<br />&gt; even crashing or not; this is the output I get from the hypervis=
or after=20
<br />&gt; enabling the root cell and issuing the following command:
<br />&gt;=20
<br />&gt; sudo jailhouse cell linux configs/x86/linux_guest1.cell=20
<br />&gt; ../buildroot-2023.11/output/images/bzImage -i=20
<br />&gt; ../buildroot-2023.11/output/images/rootfs.cpio
<br />
<br />for the first few tries, simply don't load a ramdisk. Try to get the=
=20
<br />kernel booting. It will crash with "cannot mount rootfs". If we get s=
o=20
<br />far, then you can continue specifying the ramdisk. But first, we have=
 to=20
<br />get that far.
<br />
<br />&gt;=20
<br />&gt; Adding PCI device ff:1f.7 to cell "linux-x86-demo"
<br />&gt; Created cell "linux-x86-demo"
<br />&gt; Page pool usage after cell creation: mem 336/32211, remap 16392/=
131072
<br />&gt; Cell "linux-x86-demo" can be loaded
<br />&gt; CPU 4 received SIPI, vector 100
<br />&gt; CPU 3 received SIPI, vector 100
<br />&gt; Started cell "linux-x86-demo"
<br />&gt;=20
<br />&gt; After this the cell appears to be running in cell list, however =
I can't=20
<br />&gt; seem to get any output to confirm that (I even set=20
<br />&gt; JAILHOUSE_CELL_VIRTUAL_CONSOLE_ACTIVE, but nothing appears on th=
e vrtual=20
<br />&gt; console accessed via "jailhouse console -f"). I also tried addin=
g -c=20
<br />&gt; "console=3DttyS0,115200".
<br />
<br />ttyS0, i.e., x86 Port 0x3f8 is whitelisted in the cell configuration?=
=20
<br />Actually, your cmdline is correct.
<br />
<br />&gt; At this point if I try to disable/shutdown the cell, the system =
freezes=20
<br />&gt; requiring a hard reset.
<br />
<br />Okay, is the guest Linux compiled with Jailhouse guest support? Pleas=
e=20
<br />ensure that non-root Linux is compiled with CONFIG_JAILHOUSE_GUEST an=
d=20
<br />CONFIG_JAILHOUSE_DBCON. The first one is mandatory for x86 Linux gues=
ts.
<br />
<br />&gt;=20
<br />&gt; Also, there seems to be a mismatch between the PCI bdf value in =
the log=20
<br />&gt; above and the one in the cell's configuration. In both root and =
non root=20
<br />&gt; cells i set .bdf =3D (0x0f &lt;&lt; 3) for the IVSHMEM net devic=
e and the Root=20
<br />&gt; cell correctly reports that ("Adding virtual PCI device 00:0f.0 =
to cell=20
<br />&gt; "RootCell"").
<br />
<br />First things first. Let's try to get Linux kicked off before diving i=
nto=20
<br />PCI. Comment it out for the moment, let's do that later.
<br />
<br />   Ralf
<br />
<br />&gt;=20
<br />&gt; If I understood correctly, once the cell works properly I won't =
need to=20
<br />&gt; set the console anymore as I can assign an ip (-c "ip x.x.x.x" i=
n the=20
<br />&gt; cell linux command) and ssh to the cell, right?
<br />&gt;=20
<br />&gt; I attach the root and non root cells' configurations in case the=
y're=20
<br />&gt; needed. I can provide both the root and non root cell's kernel .=
conf and=20
<br />&gt; the buildroot configuration I used if needed.
<br />&gt;=20
<br />&gt; Thank you for your time,
<br />&gt; Michele
<br />&gt;=20
<br />&gt; --=20
<br />&gt; You received this message because you are subscribed to the Goog=
le=20
<br />&gt; Groups "Jailhouse" group.
<br />&gt; To unsubscribe from this group and stop receiving emails from it=
, send=20
<br />&gt; an email to <a href=3D"" rel=3D"nofollow">jailhouse-de...@google=
groups.com</a>=20
<br />&gt; &lt;mailto:<a href=3D"" rel=3D"nofollow">jailhouse-de...@googleg=
roups.com</a>&gt;.
<br />&gt; To view this discussion on the web visit=20
<br />&gt; <a href=3D"https://groups.google.com/d/msgid/jailhouse-dev/824ba=
cc4-b7ae-47c9-878e-7203214b4fc3n%40googlegroups.com" target=3D"_blank" rel=
=3D"nofollow">https://groups.google.com/d/msgid/jailhouse-dev/824bacc4-b7ae=
-47c9-878e-7203214b4fc3n%40googlegroups.com</a> &lt;<a href=3D"https://grou=
ps.google.com/d/msgid/jailhouse-dev/824bacc4-b7ae-47c9-878e-7203214b4fc3n%4=
0googlegroups.com?utm_medium=3Demail&amp;utm_source=3Dfooter" target=3D"_bl=
ank" rel=3D"nofollow">https://groups.google.com/d/msgid/jailhouse-dev/824ba=
cc4-b7ae-47c9-878e-7203214b4fc3n%40googlegroups.com?utm_medium=3Demail&amp;=
utm_source=3Dfooter</a>&gt;.
<br /></blockquote></div>

<p></p>

-- <br />
You received this message because you are subscribed to the Google Groups &=
quot;Jailhouse&quot; group.<br />
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to <a href=3D"mailto:jailhouse-dev+unsubscribe@googlegroups.com">jailh=
ouse-dev+unsubscribe@googlegroups.com</a>.<br />
To view this discussion on the web visit <a href=3D"https://groups.google.c=
om/d/msgid/jailhouse-dev/c9dad4f3-f856-4f25-b6ad-41ec63cf2c64n%40googlegrou=
ps.com?utm_medium=3Demail&utm_source=3Dfooter">https://groups.google.com/d/=
msgid/jailhouse-dev/c9dad4f3-f856-4f25-b6ad-41ec63cf2c64n%40googlegroups.co=
m</a>.<br />

------=_Part_131322_252328938.1704817617096--

------=_Part_131321_2041927760.1704817617096--
