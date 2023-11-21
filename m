Return-Path: <jailhouse-dev+bncBD4MLPEEWIHBB3PE6CVAMGQELS5VYHI@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-pl1-x639.google.com (mail-pl1-x639.google.com [IPv6:2607:f8b0:4864:20::639])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B9957F24D4
	for <lists+jailhouse-dev@lfdr.de>; Tue, 21 Nov 2023 05:30:40 +0100 (CET)
Received: by mail-pl1-x639.google.com with SMTP id d9443c01a7336-1cc23aa0096sf63146115ad.2
        for <lists+jailhouse-dev@lfdr.de>; Mon, 20 Nov 2023 20:30:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20230601; t=1700541039; x=1701145839; darn=lfdr.de;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:x-original-sender:mime-version
         :subject:references:in-reply-to:message-id:to:from:date:sender:from
         :to:cc:subject:date:message-id:reply-to;
        bh=kbOsbfE30TssqSe4FDdMsnrfr0t3+0tcGDNcEmhj/K0=;
        b=fTgQ2wCDPd7Ofy59cNhzgxb4s0DSIvk2+k0G+q6UcE2kz8l9iXibro+St4WsSSJOpk
         fb3TEz0ijO70Bev2ZSp6IVgyuPxzxkjI9ajgQoOGviQ+JNN/aEpeWcSHrGfVvU5mqRFL
         I3ROviIx6g/zbu/XFGeKRvDFf+NPVgL27jkoJ9msa46ByunrKKgczilojffgi5BilNj5
         9CPSX2efF1+6LxoOd581cTTu57+jCBVK2DS5tgM5lwBke3CMONe1ZoVXQaPUihGjZPQX
         XJHxe3bY/+HFb8MP3yQN3QiAPa+CmoGPltNYBtKPAU5wCRwSwJOqtvgOlHz18I/d8KRa
         HyPA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1700541039; x=1701145839; darn=lfdr.de;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:x-original-sender:mime-version
         :subject:references:in-reply-to:message-id:to:from:date:from:to:cc
         :subject:date:message-id:reply-to;
        bh=kbOsbfE30TssqSe4FDdMsnrfr0t3+0tcGDNcEmhj/K0=;
        b=Ar++SmoWeh+7llDf59is4OEpYJNTSxzsajtoZnLhvK8GSpa+9Mz0TRnh1gFFL5Qzzx
         NzOtYAo8g2sxUnX9Avq7Ur2X4byrdxY1qxH5roahlob0KyNwY5pqCb+rLU3OYmYAyUWO
         cziKAFvBpk+QrkblgAdUnf+aIXfIgEgIdemb6reT1iOJN3dZm1aGkcDBYSQ/Eej+kmrj
         XozG4AawUjsRu4dZLC8Pc056gyonThX9yookQ2mwZwisMKpRYad/UYsF+hQZ0JxW+SkC
         hFkazfr0w4XkRYOBt8DqX1PqFBiX5bokBHP6M7zI2XQfZ/x3rpTaBKT0mlIbOEoFsFq+
         iUVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700541039; x=1701145839;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :x-spam-checked-in-group:list-id:mailing-list:precedence
         :x-original-sender:mime-version:subject:references:in-reply-to
         :message-id:to:from:date:x-beenthere:x-gm-message-state:sender:from
         :to:cc:subject:date:message-id:reply-to;
        bh=kbOsbfE30TssqSe4FDdMsnrfr0t3+0tcGDNcEmhj/K0=;
        b=b42mEycgAwDXjisZINFJzvCPiU5gG3tmmvdDEs04VA0BrRzzX9rj2X7cs/BVmtt4Fm
         jd43qwhu6NX6MwzbMd3L7Lg64oQfMCjMQWLhYkg3v+d7F8dXEBoUuJC756tjjJCFGnuC
         vuGDoAaE4DtgVBsyVxNc64fIXFY9yRhvo9DjuExYl2b/NQ2OV1h5TNWIFJ+FXq/yFTBs
         WFPgSZtbK8QoC8XaygWfkM3RW6tF7Pl8aMd6FYw7NQcDRFcMCke2TpGiCopyTVKRkhsK
         guPtm0sBAsVc7/YTtQ6WvD+F6U9RUw+II8meGqfOOOp7ajXS3NIdfK0pJGT+ZHGQdaDx
         LWLw==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AOJu0Yzq6qi5VAw4Tzc2Ig3c6vEeCvKKR6M1MQxvFmJ0Ox5FH34bGqjZ
	rEu/n0K7DknjYrgITBKY/ws=
X-Google-Smtp-Source: AGHT+IFAlXpuLGT45Ma9+/Qu8W+VdaJv6ptn2yvC49jiKLQaR8ei9JIuxFONpvF48mKfbItqGtmsmA==
X-Received: by 2002:a17:903:22c3:b0:1cf:6453:b268 with SMTP id y3-20020a17090322c300b001cf6453b268mr4156029plg.53.1700541038468;
        Mon, 20 Nov 2023 20:30:38 -0800 (PST)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a17:902:f78d:b0:1cf:6945:758e with SMTP id
 q13-20020a170902f78d00b001cf6945758els955013pln.0.-pod-prod-04-us; Mon, 20
 Nov 2023 20:30:37 -0800 (PST)
X-Received: by 2002:a17:902:b491:b0:1cc:281a:8463 with SMTP id y17-20020a170902b49100b001cc281a8463mr2469861plr.7.1700541036774;
        Mon, 20 Nov 2023 20:30:36 -0800 (PST)
Date: Mon, 20 Nov 2023 20:30:35 -0800 (PST)
From: Paresh Bhagat <pareshbhagat29@gmail.com>
To: Jailhouse <jailhouse-dev@googlegroups.com>
Message-Id: <261c0edb-f0a7-4384-a300-8a0567c16f8dn@googlegroups.com>
In-Reply-To: <2847752b-a183-418c-9c42-42641c6ffe20n@googlegroups.com>
References: <2847752b-a183-418c-9c42-42641c6ffe20n@googlegroups.com>
Subject: Re: Jailhouse enable pci error
MIME-Version: 1.0
Content-Type: multipart/mixed; 
	boundary="----=_Part_47283_1827035519.1700541035338"
X-Original-Sender: pareshbhagat29@gmail.com
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

------=_Part_47283_1827035519.1700541035338
Content-Type: multipart/alternative; 
	boundary="----=_Part_47284_393324100.1700541035338"

------=_Part_47284_393324100.1700541035338
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Update. Got the jailhouse enabled but still getting the pci error.

nitializing Jailhouse hypervisor v0.12 (324-ge57d1eff-dirty) on CPU 3
Code location: 0x0000ffffc0200800
Page pool usage after early setup: mem 39/993, remap 0/131072
Initializing processors:
 CPU 3... OK
 CPU 2... OK
 CPU 0... OK
 CPU 1... OK
Initializing unit: irqchip
Initializing unit: ARM SMMU v3
Initializing unit: ARM SMMU
Initializing unit: PVU IOMMU
Initializing unit: PCI
Adding virtual PCI device 00:00.0 to cell "k3-am62p5-sk"
Adding virtual PCI device 00:01.0 to cell "k3-am62p5-sk"
Page pool usage after late setup: mem 79/993, remap 144/131072
Activating hypervisor
[  332.417442] pci-host-generic 76000000.pci: host bridge /pci@0 ranges:
[  332.417476] pci-host-generic 76000000.pci:      MEM=20
0x0076100000..0x0076103fff -> 0x0076100000
[  332.417572] pci-host-generic 76000000.pci: ECAM at [mem=20
0x76000000-0x760fffff] for [bus 00]
[  332.417732] pci-host-generic 76000000.pci: PCI host bridge to bus 0001:0=
0
[  332.417741] pci_bus 0001:00: root bus resource [bus 00]
[  332.417748] pci_bus 0001:00: root bus resource [mem=20
0x76100000-0x76103fff]
[  332.417793] pci 0001:00:00.0: [110a:4106] type 00 class 0xff0000
[  332.417819] pci 0001:00:00.0: reg 0x10: [mem 0x00000000-0x0000ffff]
[  332.418103] pci 0001:00:01.0: [110a:4106] type 00 class 0xff0001
[  332.418127] pci 0001:00:01.0: reg 0x10: [mem 0x00000000-0x0000ffff]
[  332.420175] pci 0001:00:00.0: BAR 0: no space for [mem size 0x00010000]
[  332.420195] pci 0001:00:00.0: BAR 0: failed to assign [mem size=20
0x00010000]
[  332.420203] pci 0001:00:01.0: BAR 0: no space for [mem size 0x00010000]
[  332.420209] pci 0001:00:01.0: BAR 0: failed to assign [mem size=20
0x00010000]
[  332.420916] The Jailhouse is opening.
[  332.531915] psci: CPU1 killed (polled 0 ms)
[  332.579879] psci: CPU2 killed (polled 0 ms)
[  332.631860] psci: CPU3 killed (polled 0 ms)


On Tuesday, November 21, 2023 at 12:50:49=E2=80=AFAM UTC+5:30 Paresh Bhagat=
 wrote:

> Any fix for the following error while trying to enable jailhouse ?=20
> something wrong with the memory allocation?=20
>
> Initializing Jailhouse hypervisor v0.12 (324-ge57d1eff-dirty) on CPU 0
> Code location: 0x0000ffffc0200800
> Page pool usage after early setup: mem 39/993, remap 0/131072
> Initializing processors:
>  CPU 0... OK
>  CPU 2... OK
>  CPU 1... OK
>  CPU 3... OK
> Initializing unit: irqchip
> Initializing unit: ARM SMMU v3
> Initializing unit: ARM SMMU
> Initializing unit: PVU IOMMU
> Initializing unit: PCI
> Adding virtual PCI device 00:00.0 to cell "k3-am62p5-sk"
> Adding virtual PCI device 00:01.0 to cell "k3-am62p5-sk"
> Page pool usage after late setup: mem 78/993, remap 144/131072
> Activating hypervisor
> [  122.542841] pci-host-generic 76000000.pci: host bridge /pci@0 ranges:
> [  122.542873] pci-host-generic 76000000.pci:      MEM=20
> 0x0076100000..0x0076103fff -> 0x0076100000
> [  122.542947] pci-host-generic 76000000.pci: ECAM at [mem=20
> 0x76000000-0x760fffff] for [bus 00]
> [  122.543103] pci-host-generic 76000000.pci: PCI host bridge to bus=20
> 0001:00
> [  122.543112] pci_bus 0001:00: root bus resource [bus 00]
> [  122.543119] pci_bus 0001:00: root bus resource [mem=20
> 0x76100000-0x76103fff]
> root@am62pxx-evm:/usr/share/jailhouse# [  122.543161] pci 0001:00:00.0:=
=20
> [110a:4106] type 00 class 0xff0000
> [  122.543187] pci 0001:00:00.0: reg 0x10: [mem 0x00000000-0x0000ffff]
> [  122.543455] pci 0001:00:01.0: [110a:4106] type 00 class 0xff0001
> [  122.543481] pci 0001:00:01.0: reg 0x10: [mem 0x00000000-0x0000ffff]
> [  122.545437] pci 0001:00:00.0: BAR 0: no space for [mem size 0x00010000=
]
> [  122.545458] pci 0001:00:00.0: BAR 0: failed to assign [mem size=20
> 0x00010000]
> [  122.545466] pci 0001:00:01.0: BAR 0: no space for [mem size 0x00010000=
]
> [  122.545471] pci 0001:00:01.0: BAR 0: failed to assign [mem size=20
> 0x00010000]
> [  122.545896] The Jailhouse is opening.
> Unhandled data read at 0xb00328(4)
> FATAL: unhandled trap (exception class 0x24)
>
> i have attached root cell config and output of cat /proc/iomem for=20
> referrence.
>
> Thanks
>

--=20
You received this message because you are subscribed to the Google Groups "=
Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/=
jailhouse-dev/261c0edb-f0a7-4384-a300-8a0567c16f8dn%40googlegroups.com.

------=_Part_47284_393324100.1700541035338
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Update. Got the jailhouse enabled but still getting the pci error.<br /><br=
 />nitializing Jailhouse hypervisor v0.12 (324-ge57d1eff-dirty) on CPU 3<br=
 />Code location: 0x0000ffffc0200800<br />Page pool usage after early setup=
: mem 39/993, remap 0/131072<br />Initializing processors:<br />=C2=A0CPU 3=
... OK<br />=C2=A0CPU 2... OK<br />=C2=A0CPU 0... OK<br />=C2=A0CPU 1... OK=
<br />Initializing unit: irqchip<br />Initializing unit: ARM SMMU v3<br />I=
nitializing unit: ARM SMMU<br />Initializing unit: PVU IOMMU<br />Initializ=
ing unit: PCI<br />Adding virtual PCI device 00:00.0 to cell "k3-am62p5-sk"=
<br />Adding virtual PCI device 00:01.0 to cell "k3-am62p5-sk"<br />Page po=
ol usage after late setup: mem 79/993, remap 144/131072<br />Activating hyp=
ervisor<br />[ =C2=A0332.417442] pci-host-generic 76000000.pci: host bridge=
 /pci@0 ranges:<br />[ =C2=A0332.417476] pci-host-generic 76000000.pci: =C2=
=A0 =C2=A0 =C2=A0MEM 0x0076100000..0x0076103fff -&gt; 0x0076100000<br />[ =
=C2=A0332.417572] pci-host-generic 76000000.pci: ECAM at [mem 0x76000000-0x=
760fffff] for [bus 00]<br />[ =C2=A0332.417732] pci-host-generic 76000000.p=
ci: PCI host bridge to bus 0001:00<br />[ =C2=A0332.417741] pci_bus 0001:00=
: root bus resource [bus 00]<br />[ =C2=A0332.417748] pci_bus 0001:00: root=
 bus resource [mem 0x76100000-0x76103fff]<br />[ =C2=A0332.417793] pci 0001=
:00:00.0: [110a:4106] type 00 class 0xff0000<br />[ =C2=A0332.417819] pci 0=
001:00:00.0: reg 0x10: [mem 0x00000000-0x0000ffff]<br />[ =C2=A0332.418103]=
 pci 0001:00:01.0: [110a:4106] type 00 class 0xff0001<br />[ =C2=A0332.4181=
27] pci 0001:00:01.0: reg 0x10: [mem 0x00000000-0x0000ffff]<br />[ =C2=A033=
2.420175] pci 0001:00:00.0: BAR 0: no space for [mem size 0x00010000]<br />=
[ =C2=A0332.420195] pci 0001:00:00.0: BAR 0: failed to assign [mem size 0x0=
0010000]<br />[ =C2=A0332.420203] pci 0001:00:01.0: BAR 0: no space for [me=
m size 0x00010000]<br />[ =C2=A0332.420209] pci 0001:00:01.0: BAR 0: failed=
 to assign [mem size 0x00010000]<br />[ =C2=A0332.420916] The Jailhouse is =
opening.<br />[ =C2=A0332.531915] psci: CPU1 killed (polled 0 ms)<br />[ =
=C2=A0332.579879] psci: CPU2 killed (polled 0 ms)<br />[ =C2=A0332.631860] =
psci: CPU3 killed (polled 0 ms)<br /><div><br /></div><div><br /></div><div=
 class=3D"gmail_quote"><div dir=3D"auto" class=3D"gmail_attr">On Tuesday, N=
ovember 21, 2023 at 12:50:49=E2=80=AFAM UTC+5:30 Paresh Bhagat wrote:<br/><=
/div><blockquote class=3D"gmail_quote" style=3D"margin: 0 0 0 0.8ex; border=
-left: 1px solid rgb(204, 204, 204); padding-left: 1ex;">Any fix for the fo=
llowing error while trying to enable jailhouse ? something wrong with the m=
emory allocation?=C2=A0<br><br>Initializing Jailhouse hypervisor v0.12 (324=
-ge57d1eff-dirty) on CPU 0<br>Code location: 0x0000ffffc0200800<br>Page poo=
l usage after early setup: mem 39/993, remap 0/131072<br>Initializing proce=
ssors:<br>=C2=A0CPU 0... OK<br>=C2=A0CPU 2... OK<br>=C2=A0CPU 1... OK<br>=
=C2=A0CPU 3... OK<br>Initializing unit: irqchip<br>Initializing unit: ARM S=
MMU v3<br>Initializing unit: ARM SMMU<br>Initializing unit: PVU IOMMU<br>In=
itializing unit: PCI<br>Adding virtual PCI device 00:00.0 to cell &quot;k3-=
am62p5-sk&quot;<br>Adding virtual PCI device 00:01.0 to cell &quot;k3-am62p=
5-sk&quot;<br>Page pool usage after late setup: mem 78/993, remap 144/13107=
2<br>Activating hypervisor<br>[ =C2=A0122.542841] pci-host-generic 76000000=
.pci: host bridge /pci@0 ranges:<br>[ =C2=A0122.542873] pci-host-generic 76=
000000.pci: =C2=A0 =C2=A0 =C2=A0MEM 0x0076100000..0x0076103fff -&gt; 0x0076=
100000<br>[ =C2=A0122.542947] pci-host-generic 76000000.pci: ECAM at [mem 0=
x76000000-0x760fffff] for [bus 00]<br>[ =C2=A0122.543103] pci-host-generic =
76000000.pci: PCI host bridge to bus 0001:00<br>[ =C2=A0122.543112] pci_bus=
 0001:00: root bus resource [bus 00]<br>[ =C2=A0122.543119] pci_bus 0001:00=
: root bus resource [mem 0x76100000-0x76103fff]<br>root@am62pxx-evm:/usr/sh=
are/jailhouse# [ =C2=A0122.543161] pci 0001:00:00.0: [110a:4106] type 00 cl=
ass 0xff0000<br>[ =C2=A0122.543187] pci 0001:00:00.0: reg 0x10: [mem 0x0000=
0000-0x0000ffff]<br>[ =C2=A0122.543455] pci 0001:00:01.0: [110a:4106] type =
00 class 0xff0001<br>[ =C2=A0122.543481] pci 0001:00:01.0: reg 0x10: [mem 0=
x00000000-0x0000ffff]<br>[ =C2=A0122.545437] pci 0001:00:00.0: BAR 0: no sp=
ace for [mem size 0x00010000]<br>[ =C2=A0122.545458] pci 0001:00:00.0: BAR =
0: failed to assign [mem size 0x00010000]<br>[ =C2=A0122.545466] pci 0001:0=
0:01.0: BAR 0: no space for [mem size 0x00010000]<br>[ =C2=A0122.545471] pc=
i 0001:00:01.0: BAR 0: failed to assign [mem size 0x00010000]<br>[ =C2=A012=
2.545896] The Jailhouse is opening.<br>Unhandled data read at 0xb00328(4)<b=
r>FATAL: unhandled trap (exception class 0x24)<br><br>i have attached root =
cell config and output of cat /proc/iomem for referrence.<div><br>Thanks</d=
iv></blockquote></div>

<p></p>

-- <br />
You received this message because you are subscribed to the Google Groups &=
quot;Jailhouse&quot; group.<br />
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to <a href=3D"mailto:jailhouse-dev+unsubscribe@googlegroups.com">jailh=
ouse-dev+unsubscribe@googlegroups.com</a>.<br />
To view this discussion on the web visit <a href=3D"https://groups.google.c=
om/d/msgid/jailhouse-dev/261c0edb-f0a7-4384-a300-8a0567c16f8dn%40googlegrou=
ps.com?utm_medium=3Demail&utm_source=3Dfooter">https://groups.google.com/d/=
msgid/jailhouse-dev/261c0edb-f0a7-4384-a300-8a0567c16f8dn%40googlegroups.co=
m</a>.<br />

------=_Part_47284_393324100.1700541035338--

------=_Part_47283_1827035519.1700541035338
Content-Type: text/x-csrc; charset=US-ASCII; name=k3-am62p5-sk.c
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename=k3-am62p5-sk.c
X-Attachment-Id: 52c481ec-3a09-4e23-91b7-5ff825714012
Content-ID: <52c481ec-3a09-4e23-91b7-5ff825714012>

/*
 * Jailhouse, a Linux-based partitioning hypervisor
 *
 * Copyright (c) 2022 Texas Instruments Incorporated - http://www.ti.com/
 *
 * Configuration for K3 based AM62P5 EVM
 *
 * Authors:
 *  Matt Ranostay <mranostay@ti.com>
 *
 * This work is licensed under the terms of the GNU GPL, version 2.  See
 * the COPYING file in the top-level directory.
 */

#include <jailhouse/types.h>
#include <jailhouse/cell-config.h>

struct {
	struct jailhouse_system header;
	__u64 cpus[1];
	struct jailhouse_memory mem_regions[31];
	struct jailhouse_irqchip irqchips[5];
	struct jailhouse_pci_device pci_devices[2];
} __attribute__((packed)) config = {
	.header = {
		.signature = JAILHOUSE_SYSTEM_SIGNATURE,
		.revision = JAILHOUSE_CONFIG_REVISION,
		.architecture = JAILHOUSE_ARM64,
		.flags = JAILHOUSE_SYS_VIRTUAL_DEBUG_CONSOLE,
		.hypervisor_memory = {
			.phys_start = 0x9dfc00000,
			.size = 0x400000,
		},
		.debug_console = {
			.address = 0x02800000,
			.size = 0x1000,
			.type = JAILHOUSE_CON_TYPE_8250,
			.flags = JAILHOUSE_CON_ACCESS_MMIO |
				 JAILHOUSE_CON_REGDIST_4,
		},
		.platform_info = {
			.pci_mmconfig_base = 0x76000000,
			.pci_mmconfig_end_bus = 0,
			.pci_is_virtual = 1,
			.pci_domain = 1,
			.arm = {
				.gic_version = 3,
				.gicd_base = 0x01800000,
				.gicr_base = 0x01880000,
				.maintenance_irq = 25,
			},
		},
		.root_cell = {
			.name = "k3-am62p5-sk",

			.cpu_set_size = sizeof(config.cpus),
			.num_memory_regions = ARRAY_SIZE(config.mem_regions),
			.num_irqchips = ARRAY_SIZE(config.irqchips),
			.num_pci_devices = ARRAY_SIZE(config.pci_devices),
			.vpci_irq_base = 180 - 32,
		},
	},

	.cpus = {
		0xf,
	},

	.mem_regions = {
		/* IVSHMEM shared memory regions for 00:00.0 (demo) */
		{
			.phys_start = 0x9dfa00000,
			.virt_start = 0x9dfa00000,
			.size = 0x10000,
			.flags = JAILHOUSE_MEM_READ,
		},
		{
			.phys_start = 0x9dfa10000,
			.virt_start = 0x9dfa10000,
			.size = 0x10000,
			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE,
		},
		/* Peer 0 */ {
			.phys_start = 0x9dfa20000,
			.virt_start = 0x9dfa20000,
			.size = 0x10000,
			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE,
		},
		/* Peer 1 */ {
			.phys_start = 0x9dfa30000,
			.virt_start = 0x9dfa30000,
			.size = 0x10000,
			.flags = JAILHOUSE_MEM_READ,
		},
		/* Peer 2 */ {
			.phys_start = 0x9dfa40000,
			.virt_start = 0x9dfa40000,
			.size = 0x10000,
			.flags = JAILHOUSE_MEM_READ,
		},
		/* IVSHMEM shared memory region for 00:01.0 */
		JAILHOUSE_SHMEM_NET_REGIONS(0x9dfb00000, 0),
		{
			.phys_start = 0x01810000,
			.virt_start = 0x01810000,
			.size = 0x00070000,
			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
				JAILHOUSE_MEM_IO,
		},
		{
			.phys_start = 0x018a0000,
			.virt_start = 0x018a0000,
			.size = 0x00060000,
			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
				JAILHOUSE_MEM_IO,
		},
		/* RAM */ {
			.phys_start = 0x80000000,
			.virt_start = 0x80000000,
			.size = 0x80000000,
			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
				JAILHOUSE_MEM_EXECUTE,
		},
		/* RAM */ {
			.phys_start = 0x880000000,
			.virt_start = 0x880000000,
			.size = 0x15fa00000,
			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
				JAILHOUSE_MEM_EXECUTE,
		},
		/* RAM. Reserved for inmates */ {
			.phys_start = 0x9e0000000,
			.virt_start = 0x9e0000000,
			.size = 0x20000000,
			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
				JAILHOUSE_MEM_EXECUTE,
		},
		/* ctrl mmr */ {
			.phys_start = 0x000f0000,
			.virt_start = 0x000f0000,
			.size = 0x00030000,
			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
				JAILHOUSE_MEM_IO,
		},
		/* GPIO */ {
			.phys_start = 0x00600000,
			.virt_start = 0x00600000,
			.size = 0x00002000,
			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
				JAILHOUSE_MEM_IO,
		},
		/* temp */ {
			.phys_start = 0x00b00000,
			.virt_start = 0x00b00000,
			.size = 0x00020000,
			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
	            JAILHOUSE_MEM_IO,
		},
		/* GPU */ {
			.phys_start = 0x0fd00000,
			.virt_start = 0x0fd00000,
			.size = 0x00020000,
			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
				JAILHOUSE_MEM_IO,
		},
		/* First peripheral window, 1 of 2 */ {
			.phys_start = 0x01000000,
			.virt_start = 0x01000000,
			.size = 0x00800000,
			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
				JAILHOUSE_MEM_IO,
		},
		/* First peripheral window, 2 of 2 */ {
			.phys_start = 0x01900000,
			.virt_start = 0x01900000,
			.size = 0x01229000,
			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
				JAILHOUSE_MEM_IO,
		},
		/* Second peripheral window */ {
			.phys_start = 0x0e000000,
			.virt_start = 0x0e000000,
			.size = 0x01d00000,
			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
				JAILHOUSE_MEM_IO,
		},
		/* Third peripheral window */ {
			.phys_start = 0x20000000,
			.virt_start = 0x20000000,
			.size = 0x0a008000,
			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
				JAILHOUSE_MEM_IO,
		},
		/* OCSRAM */ {
			.phys_start = 0x70000000,
			.virt_start = 0x70000000,
			.size = 0x00010000,
			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
				JAILHOUSE_MEM_IO,
		},
		/* DSS */ {
			.phys_start = 0x30200000,
			.virt_start = 0x30200000,
			.size = 0x00010000,
			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
				JAILHOUSE_MEM_IO,
		},
		/* DMSS */ {
			.phys_start = 0x48000000,
			.virt_start = 0x48000000,
			.size = 0x06400000,
			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
				JAILHOUSE_MEM_IO,
		},
		/* USB */ {
			.phys_start = 0x31000000,
			.virt_start = 0x31000000,
			.size = 0x00050000,
			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
				JAILHOUSE_MEM_IO,
		},
		/* USB */ {
			.phys_start = 0x31100000,
			.virt_start = 0x31100000,
			.size = 0x00050000,
			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
				JAILHOUSE_MEM_IO,
		},
		/* CPSW */ {
			.phys_start = 0x08000000,
			.virt_start = 0x08000000,
			.size = 0x00200000,
			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
				JAILHOUSE_MEM_IO,
		},
		/* First Wake Up Domain */ {
			.phys_start = 0x2b000000,
			.virt_start = 0x2b000000,
			.size = 0x00301000,
			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
				JAILHOUSE_MEM_IO,
		},
		/* Second Wake Up Domain */ {
			.phys_start = 0x43000000,
			.virt_start = 0x43000000,
			.size = 0x00020000,
			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
				JAILHOUSE_MEM_IO,
		},
		/* MCU Domain Range */ {
			.phys_start = 0x04000000,
			.virt_start = 0x04000000,
			.size = 0x01ff2000,
			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
				JAILHOUSE_MEM_IO,
		},
	},

	.irqchips = {
		{
			.address = 0x01800000,
			.pin_base = 32,
			.pin_bitmap = {
				0xffffffff, 0xffffffff, 0xffffffff, 0xffffffff,
			},
		},
		{
			.address = 0x01800000,
			.pin_base = 160,
			.pin_bitmap = {
				0xffffffff, 0xffffffff, 0xffffffff, 0xffffffff,
			},
		},
		{
			.address = 0x01800000,
			.pin_base = 288,
			.pin_bitmap = {
				0xffffffff, 0xffffffff, 0xffffffff, 0xffffffff,
			},
		},
		{
			.address = 0x01800000,
			.pin_base = 416,
			.pin_bitmap = {
				0xffffffff, 0xffffffff, 0xffffffff, 0xffffffff,
			},
		},
		{
			.address = 0x01800000,
			.pin_base = 544,
			.pin_bitmap = {
				0xffffffff, 0xffffffff, 0xffffffff, 0xffffffff,
			},
		},
	},

	.pci_devices = {
		/* 0001:00:00.0 */ {
			.type = JAILHOUSE_PCI_TYPE_IVSHMEM,
			.domain = 1,
			.bdf = 0 << 3,
			.bar_mask = JAILHOUSE_IVSHMEM_BAR_MASK_INTX_64K,
			.shmem_regions_start = 0,
			.shmem_dev_id = 0,
			.shmem_peers = 3,
			.shmem_protocol = JAILHOUSE_SHMEM_PROTO_UNDEFINED,
		},
		/* 0001:00:01.0 */ {
			.type = JAILHOUSE_PCI_TYPE_IVSHMEM,
			.domain = 1,
			.bdf = 1 << 3,
			.bar_mask = JAILHOUSE_IVSHMEM_BAR_MASK_INTX_64K,
			.shmem_regions_start = 5,
			.shmem_dev_id = 0,
			.shmem_peers = 2,
			.shmem_protocol = JAILHOUSE_SHMEM_PROTO_VETH,
		},
	},
};

------=_Part_47283_1827035519.1700541035338--
