Return-Path: <jailhouse-dev+bncBD67Z5PJ5EBRBF4Q3HVQKGQEQZHLOSQ@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-ot1-x339.google.com (mail-ot1-x339.google.com [IPv6:2607:f8b0:4864:20::339])
	by mail.lfdr.de (Postfix) with ESMTPS id 8299EAD92D
	for <lists+jailhouse-dev@lfdr.de>; Mon,  9 Sep 2019 14:39:53 +0200 (CEST)
Received: by mail-ot1-x339.google.com with SMTP id x20sf6324116otk.0
        for <lists+jailhouse-dev@lfdr.de>; Mon, 09 Sep 2019 05:39:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:date:from:to:message-id:subject:mime-version
         :x-original-sender:precedence:mailing-list:list-id:list-post
         :list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=qbAPw15kGG8wtWUZr6RYur1FXF12h9uOs1ZBOo6GcKY=;
        b=UAkRvtQgL0R+21iGnxakucox80yi/6wS3zNMO5PjbWKlTTIQknIhk12f1TiSD8OX7c
         4BlKg/F/VY2kE7iTkArljQDkyTND0vd4Jxrehc87/UB/VyW+FI0bLLa27ANpBLF3EUj3
         fHGds63kmh0rtCAW0hoP5g79gcqs/kMcAQOimczmuvsJWG6d0BAgPMSiwMTbnDaE4AqZ
         TaAKyTKc4CoSOMCzlPf5/8D+47RVguv4Y7P9dClX8MfflMUd0rq+zhV70IuR96VRNvRu
         HrvyIndSimph43fyywO3IGtcV9i3t+mFKw2TqeqrYN5ainL2DA3kj0LyFHhmweFW79XP
         rLkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:date:from:to:message-id:subject
         :mime-version:x-original-sender:precedence:mailing-list:list-id
         :x-spam-checked-in-group:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=qbAPw15kGG8wtWUZr6RYur1FXF12h9uOs1ZBOo6GcKY=;
        b=Be8/K4z8aVxdl06Pqf6QMD/VVB40DFHiFXGYXXMqIh5NXKcEePyt0KDf3WVp6laZhP
         NxJr7C0CidGzH8NwNMBoiFb0qyKKi4jOVDLHnvPl5vlPvaEC1yjZY9ck6oWP1Zo3Jn8A
         jsKaijA61chk3WWhOW8lGKDRUi8TW/QcuADVaDxbuN7NUPYsUk6pt0E2jBreTjpcbdmS
         OLsf0zYQTVimMs3vrYTXFM8VEoANT/bh+Qreq/0vXrBgDy2OXaCXKvges7TAJ3HZ6TqX
         qBlQ2iNO8wrTQqgxNS7DwJwbeEvf0ESDSamcCfUAs7BDeotsQqqv8tqpN48p6FsyozxI
         Eg7A==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: APjAAAWHoWQ2oIt3qobdUHuQye7+UgvdGi1KoT/gASpIZBxFF2LyzuD3
	W3z7CU+fMnw1/kULaEPlY90=
X-Google-Smtp-Source: APXvYqw6Lwcwbm47h/6X4C2WWOxp2ieNEIdGCKHJwrFU3KjkT5GQ8rDQcSooa117jghtxyQsvLxSmA==
X-Received: by 2002:a05:6808:48a:: with SMTP id z10mr17332392oid.129.1568032791950;
        Mon, 09 Sep 2019 05:39:51 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:aca:4fcd:: with SMTP id d196ls698431oib.16.gmail; Mon, 09
 Sep 2019 05:39:51 -0700 (PDT)
X-Received: by 2002:aca:b583:: with SMTP id e125mr1637969oif.2.1568032791002;
        Mon, 09 Sep 2019 05:39:51 -0700 (PDT)
Date: Mon, 9 Sep 2019 05:39:50 -0700 (PDT)
From: Yanqiang Liu <oai@sjtu.edu.cn>
To: Jailhouse <jailhouse-dev@googlegroups.com>
Message-Id: <05ee0f95-c64e-4b3f-a0df-1ce0ddc26d53@googlegroups.com>
Subject: Using android as root cell facing ESR_EC_IABT_LOW issue
MIME-Version: 1.0
Content-Type: multipart/mixed; 
	boundary="----=_Part_1467_919143771.1568032790452"
X-Original-Sender: oai@sjtu.edu.cn
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

------=_Part_1467_919143771.1568032790452
Content-Type: multipart/alternative; 
	boundary="----=_Part_1468_1403741828.1568032790452"

------=_Part_1468_1403741828.1568032790452
Content-Type: text/plain; charset="UTF-8"

Hi,
I am working to enable jailhouse as android being the root cell on imx8mq 
platform. 
When it comes back to android after the initialization of the hypervisor, I 
get the error code 0x20.
Is there any advice for me on debugging?

Initializing Jailhouse hypervisor v0.10 (66-g22170297-dirty) on CPU 0
Code location: 0x0000ffffc0200800
Page pool usage after early setup: mem 39/994, remap 0/131072
Initializing processors:
 CPU 0... OK
 CPU 1... OK
 CPU 3... OK
 CPU 2... OK
Initializing unit: irqchip
Initializing unit: ARM SMMU
No SMMU
Initializing unit: PCI
Adding virtual PCI device 00:00.0 to cell "imx8mq"
iommu_config_commit imx8mq
Page pool usage after late setup: mem 61/994, remap 144/131072
Activating hypervisor
FATAL: instruction abort at 0xf7ffe094

FATAL: forbidden access (exception class 0x20)
Cell state before exception:
 pc: ffff000001468094   lr: ffff000001468094 spsr: 200001c5     EL1
 sp: ffff00000801bf00  esr: 20 1 0000086
 x0: 0000000000000000   x1: 0000000000000000   x2: 0000000000000000
 x3: 0000000000000000   x4: 0000000000000000   x5: 0000000000000000
 x6: 0000000000000000   x7: 0000000000000000   x8: 0000000000000000
 x9: 0000000000000000  x10: 0000000000000000  x11: 0000000000000000
x12: 0000000000000000  x13: 0000000000000000  x14: 0000000000000000
x15: 0000000000000000  x16: 0000000000000000  x17: 0000000000000000
x18: 0000000000000000  x19: ffff00000146cc18  x20: 0000000000000000
x21: 0000000000000000  x22: 0000000000000001  x23: 0000000000000000
x24: ffff0000114c3a60  x25: ffff00000949bf48  x26: ffff00000801c000
x27: ffff000009851000  x28: ffff8000774cd400  x29: ffff00000801bf00

Parking CPU 3 (Cell: "imx8mq")

Sincerely,
Yanqiang Liu

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/05ee0f95-c64e-4b3f-a0df-1ce0ddc26d53%40googlegroups.com.

------=_Part_1468_1403741828.1568032790452
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Hi,<div>I am working to enable jailhouse as android being =
the root cell on imx8mq platform.=C2=A0</div><div>When it comes back to and=
roid after the initialization of the hypervisor, I get the error code 0x20.=
</div><div>Is there any advice for me on debugging?</div><div><br></div><di=
v><div>Initializing Jailhouse hypervisor v0.10 (66-g22170297-dirty) on CPU =
0</div><div>Code location: 0x0000ffffc0200800</div><div>Page pool usage aft=
er early setup: mem 39/994, remap 0/131072</div><div>Initializing processor=
s:</div><div>=C2=A0CPU 0... OK</div><div>=C2=A0CPU 1... OK</div><div>=C2=A0=
CPU 3... OK</div><div>=C2=A0CPU 2... OK</div><div>Initializing unit: irqchi=
p</div><div>Initializing unit: ARM SMMU</div><div>No SMMU</div><div>Initial=
izing unit: PCI</div><div>Adding virtual PCI device 00:00.0 to cell &quot;i=
mx8mq&quot;</div><div>iommu_config_commit imx8mq</div><div>Page pool usage =
after late setup: mem 61/994, remap 144/131072</div><div>Activating hypervi=
sor</div><div>FATAL: instruction abort at 0xf7ffe094</div><div><br></div><d=
iv>FATAL: forbidden access (exception class 0x20)</div><div>Cell state befo=
re exception:</div><div>=C2=A0pc: ffff000001468094=C2=A0 =C2=A0lr: ffff0000=
01468094 spsr: 200001c5=C2=A0 =C2=A0 =C2=A0EL1</div><div>=C2=A0sp: ffff0000=
0801bf00=C2=A0 esr: 20 1 0000086</div><div>=C2=A0x0: 0000000000000000=C2=A0=
 =C2=A0x1: 0000000000000000=C2=A0 =C2=A0x2: 0000000000000000</div><div>=C2=
=A0x3: 0000000000000000=C2=A0 =C2=A0x4: 0000000000000000=C2=A0 =C2=A0x5: 00=
00000000000000</div><div>=C2=A0x6: 0000000000000000=C2=A0 =C2=A0x7: 0000000=
000000000=C2=A0 =C2=A0x8: 0000000000000000</div><div>=C2=A0x9: 000000000000=
0000=C2=A0 x10: 0000000000000000=C2=A0 x11: 0000000000000000</div><div>x12:=
 0000000000000000=C2=A0 x13: 0000000000000000=C2=A0 x14: 0000000000000000</=
div><div>x15: 0000000000000000=C2=A0 x16: 0000000000000000=C2=A0 x17: 00000=
00000000000</div><div>x18: 0000000000000000=C2=A0 x19: ffff00000146cc18=C2=
=A0 x20: 0000000000000000</div><div>x21: 0000000000000000=C2=A0 x22: 000000=
0000000001=C2=A0 x23: 0000000000000000</div><div>x24: ffff0000114c3a60=C2=
=A0 x25: ffff00000949bf48=C2=A0 x26: ffff00000801c000</div><div>x27: ffff00=
0009851000=C2=A0 x28: ffff8000774cd400=C2=A0 x29: ffff00000801bf00</div><di=
v><br></div><div>Parking CPU 3 (Cell: &quot;imx8mq&quot;)</div><div><br></d=
iv></div><div>Sincerely,</div><div>Yanqiang Liu</div></div>

<p></p>

-- <br />
You received this message because you are subscribed to the Google Groups &=
quot;Jailhouse&quot; group.<br />
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to <a href=3D"mailto:jailhouse-dev+unsubscribe@googlegroups.com">jailh=
ouse-dev+unsubscribe@googlegroups.com</a>.<br />
To view this discussion on the web visit <a href=3D"https://groups.google.c=
om/d/msgid/jailhouse-dev/05ee0f95-c64e-4b3f-a0df-1ce0ddc26d53%40googlegroup=
s.com?utm_medium=3Demail&utm_source=3Dfooter">https://groups.google.com/d/m=
sgid/jailhouse-dev/05ee0f95-c64e-4b3f-a0df-1ce0ddc26d53%40googlegroups.com<=
/a>.<br />

------=_Part_1468_1403741828.1568032790452--

------=_Part_1467_919143771.1568032790452--
