Return-Path: <jailhouse-dev+bncBCJI7SMNV4NBBJHHQTVAKGQEFA6KG2I@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-ed1-x538.google.com (mail-ed1-x538.google.com [IPv6:2a00:1450:4864:20::538])
	by mail.lfdr.de (Postfix) with ESMTPS id BFEB27B994
	for <lists+jailhouse-dev@lfdr.de>; Wed, 31 Jul 2019 08:22:28 +0200 (CEST)
Received: by mail-ed1-x538.google.com with SMTP id y3sf41702543edm.21
        for <lists+jailhouse-dev@lfdr.de>; Tue, 30 Jul 2019 23:22:28 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1564554148; cv=pass;
        d=google.com; s=arc-20160816;
        b=wrKXiG9H5Uiif/w8fvBjcm8LD/nMQKA6JCfVMyp9qTN1leZVklfPR7HfM3DGT57QCu
         TVoEY5/keVJLleeYVDITtQzf+hCRZATUsklRjd7zC+kywwohU9A3y4MLnDas9YMwtZD3
         EE/c11FWr8/WtHvw87uEuQb5OEZmFzS/wxvRxEEDbERjP3stwc34WvsAa8LJb2qw1y+1
         73xb6U7cPkYPtlt+vQRKWvbQew7Rc6oHRRFsgaD77Dx8CNYWSrqkvHpfz+TGmuttu2CI
         pyfCB/ISwbbKddIYSwps3ylkNxtTngmgqxjMcvpkuC+ZhJN8n1d7QJhonbaDIm5UvvuL
         StWA==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject:sender:dkim-signature;
        bh=/nW+UQ0gNhU5M3CbATdpxXmuZTSDWV/5SRpCaYEPDPc=;
        b=ymi/qXkCtUoz6mYrjQq7kkwSgikrIGtRZRsPYac+spi0UhxqsVm6CzjKq6NdJP2a8X
         e1lTc/cZzX7nUaYnxbL7clc0OrW0lh4S8RS+XDq8pgxOtjDBmb5O/W46onJ8mddqjeCM
         nhgw8T7C0o80mN868aiyTMD8Rjgxhpc7UDpo3+xyDtZaUhT6gXEXBZtuZOI7k5pU+lHc
         GWvFx+GVG0M2Z8YkWqF0meIlMlHm4oW9CAZKYngJ1Z06mrHTu6qR8SLZMGE1KX1OEYC6
         RMCFDO6c2A+/m2vPCTRnnw+8GdxkX6nXwD9Xh+cKVzxgh9M9+QBESKumxGN7TPSEorKE
         k/7Q==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.2 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:subject:to:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding
         :x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=/nW+UQ0gNhU5M3CbATdpxXmuZTSDWV/5SRpCaYEPDPc=;
        b=UPQL7WVYvpb8orOjwSruVcaccKfaCcx1K0VhYTgjv4OUg13DIGEe/Cn2ch624tahmR
         /FHse91UmFJUlpJ/3WHfsnSG36l+yR3Eg8whWYagyfsA8jXtVCvM5cN0BLp+hRAjZVd7
         /YAuPDr+v0mEwSZbJhPUEmSaZLLNKRepmpTamedNZF3RPJyfLsohvjClhXcHXOr1wPsT
         7qhO1F+3B3OAAXVbFFQulCtTpyGPWLeWCD4m9ft/IBhnzSaejlYSOq1VJNs/ZvDEUV3e
         xFU7z0tddxRV2t+O4ePtCOCXcwwd4icPe+WIgGSijx5fgGlv77h7EgbrAkxepgiZQ+gf
         4S1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:subject:to:references:from:message-id
         :date:user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :x-spam-checked-in-group:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=/nW+UQ0gNhU5M3CbATdpxXmuZTSDWV/5SRpCaYEPDPc=;
        b=bAWT1kOpsoQhP9JJXHJ/IYT1FaE75f6rxHUv7GuzjP6NGfUbpy50i8YIbCR0wQYFlG
         JbnYnj/H1GmAJ45Xe5cOuegFuHfonIQj5oG3v0e754yBtEXXTE7xD6Icn5min01pOF8K
         8PoAiS678tQnurCGvOrqVF9z2oPyD6E+qLvCXb0+sUry2iCRDeNynkB7/aZQkRj/PQr5
         HthL5vFw5uNrkjieVNbZbHO9ZatWuwGH9jB7cyExpSewss0Qj3GtnOKUroEUgje+/3hs
         IlOJ8kDXvB61EP7eo+yGQnRjVfJ63owa+3JMDcPzapSDJcU7qOjqtU2Hl3rOG7ZaGEq/
         hZXw==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: APjAAAWkPZdma9Vt7hg1VN7uQxmF8gCYCmy2g7OQqEUJg98bLksS2Vz2
	wct8HIkv69xfcXAxIxHvM2M=
X-Google-Smtp-Source: APXvYqxs9oddWAHDPqJI8Fw67KDQav+H8SMMnVdclC302Wp0SCE99uzuGtBBKjzOCsS0aZgH4BF5Tw==
X-Received: by 2002:aa7:d30d:: with SMTP id p13mr106831171edq.292.1564554148466;
        Tue, 30 Jul 2019 23:22:28 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a17:906:f189:: with SMTP id gs9ls14189866ejb.0.gmail; Tue,
 30 Jul 2019 23:22:27 -0700 (PDT)
X-Received: by 2002:a17:906:340e:: with SMTP id c14mr94935293ejb.170.1564554147762;
        Tue, 30 Jul 2019 23:22:27 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1564554147; cv=none;
        d=google.com; s=arc-20160816;
        b=R63hgsprfh6ASE2Zs45giQtFDh7O5u3uMXp48jkdNxFNw2vjb/G4icsm1mxoX2NIMF
         dr8qJ7v3HvQUZcobyjfHT8ywJCQ6WjMhopQPyZjaVVWg+5N4YGzSPle+ZsX/MDOFRW2F
         XWq4/roExT7OBR8a3kyXg8DEspZHIhLL0Zxq88ZVPVI/JSgN4rF0CUTsE0eodtRV0op+
         WQjsO4yc42ADqpTMsllwJDyrGCAC4BpRI6UjrVcKOmxCfOhQxEV+WWLCQIYVG00Ipnql
         OFVaEDyo5+ob+BcoH7yKE5r1CvVM9YYFtCHGm2SkmBDIdh4kcbD/HCPI3TMaTVJgeuS7
         QCEg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:to:subject;
        bh=OroZGeUxrsmUo8dDfViF7LkqShVzZSYChwS/stDv7rA=;
        b=XCTbfHweMBNwhkM2Lz7JFo2Lpcd6Yu/DCV3WQO5AU5ZUeRIn8fuYuQL7cJHCl5t55w
         8XcuPYmCVgO5GqQUi8HtHcEJZpkMFATcBSH9Rh+RVMFO2t2KZo87eP0Atz9XR1M4zckg
         2Inen5ArPjBq3tYheDjigu+A1AgTVq7u3HHsusWu0c9MzfqkYyKNg0zlS04uR66N80s4
         DMyRcatmLEwRJRUncVOlaUnTURIwfMY2eBAFrGxg9BZqmN9jmEj7qt/zuqCFjp4QvPXx
         fOgZr2AsWHg+xnAErV06vNv5fBYxglJ6+OPlL4Yk5XqjMH3jJN1ydIkEkyVm8ILUiqDs
         yjNA==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.2 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
Received: from thoth.sbs.de (thoth.sbs.de. [192.35.17.2])
        by gmr-mx.google.com with ESMTPS id s30si355678eda.4.2019.07.30.23.22.27
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 30 Jul 2019 23:22:27 -0700 (PDT)
Received-SPF: pass (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.2 as permitted sender) client-ip=192.35.17.2;
Received: from mail2.sbs.de (mail2.sbs.de [192.129.41.66])
	by thoth.sbs.de (8.15.2/8.15.2) with ESMTPS id x6V6MQd6011692
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 31 Jul 2019 08:22:26 +0200
Received: from [167.87.3.59] ([167.87.3.59])
	by mail2.sbs.de (8.15.2/8.15.2) with ESMTP id x6V6MQaQ016546;
	Wed, 31 Jul 2019 08:22:26 +0200
Subject: Re: Problem with IVSHMEM on Bananapi
To: dianaramos007@gmail.com, Jailhouse <jailhouse-dev@googlegroups.com>
References: <15e809ef-6d04-4df6-a706-7fa43e7deee3@googlegroups.com>
 <f6e7c240-8686-aeff-1167-a8350e0cb03f@siemens.com>
 <0d5266f5-700e-4002-bd8d-4f3f6f65677e@googlegroups.com>
From: Jan Kiszka <jan.kiszka@siemens.com>
Message-ID: <64ec235d-fe28-e181-7c7b-c00956fea706@siemens.com>
Date: Wed, 31 Jul 2019 08:22:26 +0200
User-Agent: Mozilla/5.0 (X11; U; Linux i686 (x86_64); de; rv:1.8.1.12)
 Gecko/20080226 SUSE/2.0.0.12-1.1 Thunderbird/2.0.0.12 Mnenhy/0.7.5.666
MIME-Version: 1.0
In-Reply-To: <0d5266f5-700e-4002-bd8d-4f3f6f65677e@googlegroups.com>
Content-Type: text/plain; charset="UTF-8"
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable
X-Original-Sender: jan.kiszka@siemens.com
X-Original-Authentication-Results: gmr-mx.google.com;       spf=pass
 (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.2 as
 permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;       dmarc=pass
 (p=NONE sp=NONE dis=NONE) header.from=siemens.com
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

On 31.07.19 00:18, dianaramos007@gmail.com wrote:
>     What does the kernel log say about the uio driver setup? Probing migh=
t have
>     gone
>     wrong.
>=20
> When I check the kernel log with "cat /var/log/kern.log | grep ivshmem", =
the
> following appears:
>=20
> =C2=A0
>=20
> bananapi kernel: [=C2=A0 147.781315] uio_ivshmem 0000:00:00.0: enabling d=
evice (0000
> -> 0002)
> bananapi kernel: [=C2=A0 151.007596] Created Jailhouse cell "bananapi-gic=
-ivshmem-demo"
>=20
> =C2=A0
>=20
> And when checking with "cat /var/log/kern.log | grep uio", the following =
appears:
>=20
> =C2=A0
>=20
> bananapi kernel: [=C2=A0 147.781315] uio_ivshmem 0000:00:00.0: enabling d=
evice (0000
> -> 0002)
> =C2=A0

Reads like the driver must be active. No idea what goes wrong here.

>=20
>     And which uio_ivshmem driver revision from
>     https://github.com/henning-schild-work/ivshmem-guest-code
>     <https://github.com/henning-schild-work/ivshmem-guest-code> did you u=
se?
>     Sometime,
>     people check out the wrong branch.
>=20
> I=C2=A0checkout the jailhouse branch.
> =C2=A0
>=20
>     Also note that there is now a wip/ivshmem2 branch in jailhouse with a=
 reworked
>     device and a queues/jailhouse-ivshmem2 on http://git.kiszka.org/linux=
.git/
>     <http://git.kiszka.org/linux.git/> with
>     a rewritten uio driver as part of the queue. Maybe that is actually e=
asier to
>     set up.
>=20
> I followed this approach and encountered a problem when I enabled the
> hypervisor. The output is the following:
>=20
>=20
> Initializing Jailhouse hypervisor v0.11 (36-g7c49bb4-dirty) on CPU 0
> Code location: 0xf0000040
> Page pool usage after early setup: mem 56/16362, remap 0/131072
> Initializing processors:
> =C2=A0CPU 0... OK
> =C2=A0CPU 1... OK
> Initializing unit: irqchip
> Initializing unit: PCI
> Adding virtual PCI device 00:00.0 to cell "Banana-Pi"
> Page pool usage after late setup: mem 68/16362, remap 5/131072
> Activating hypervisor
> [=C2=A0 136.721403] pci-host-generic 2000000.pci: host bridge /pci@0 rang=
es:
> [=C2=A0 136.728079] pci-host-generic 2000000.pci:=C2=A0=C2=A0 MEM 0x02100=
000..0x02101fff ->
> 0x02100000
> [=C2=A0 136.736164] pci-host-generic 2000000.pci: ECAM at [mem 0x02000000=
-0x020fffff]
> for [bus 00]
> [=C2=A0 136.744954] pci-host-generic 2000000.pci: PCI host bridge to bus =
0000:00
> [=C2=A0 136.751852] pci_bus 0000:00: root bus resource [bus 00]
> [=C2=A0 136.757299] pci_bus 0000:00: root bus resource [mem 0x02100000-0x=
02101fff]
> [=C2=A0 136.764411] pci 0000:00:00.0: [4a48:4a48] type 00 class 0xff0000
> [=C2=A0 136.770627] pci 0000:00:00.0: reg 0x10: [mem 0x00000000-0x00000ff=
f]
> [=C2=A0 136.779618] PCI: bus0: Fast back to back transfers disabled
> [=C2=A0 136.785453] pci 0000:00:00.0: BAR 0: assigned [mem 0x02100000-0x0=
2100fff]
> [=C2=A0 136.792889] uio_ivshm 0000:00:00.0: enabling device (0400 -> 0402=
)
> [=C2=A0 136.799370] uio_ivshm 0000:00:00.0: state_table at 0x7bf00000, si=
ze 0x00001000
> [=C2=A0 136.806802] uio_ivshm 0000:00:00.0: input_sections at 0x7bf02000,=
 size 0x000fe000
> [=C2=A0 136.814451] uio_ivshm 0000:00:00.0: output_section at 0x7bf02000,=
 size 0x0007f000
> [=C2=A0 136.823397] The Jailhouse is opening.
> Unhandled data read at 0x1c25014(4)

Your kernel is now accessing a device that is not configured in the origina=
l
bananapi.cell, likely because that config was for a classic banana pi, your=
s is
an M1. Adjust the config, adding at least a region to cover the 0x100 bytes=
 at
0x01c25000, and things should work better.

> FATAL: unhandled trap (exception class 0x24)
> pc=3D0xc0543d64 cpsr=3D0xa00f0193 hsr=3D0x93850007
> r0=3D0x00000030 r1=3D0xde074840 r2=3D0x00000000 r3=3D0xe0037000
> r4=3D0xde074840 r5=3D0xde8a6068 r6=3D0x00000000 r7=3D0xc0a01eb8
> r8=3D0x00000030 r9=3D0xde8a6000 r10=3D0xc0a69bbc r11=3D0xc07f905c
> r12=3D0x1e6fe000 r13=3D0xc0a01e68 r14=3D0xc0163764
> Parking CPU 0 (Cell: "Banana-Pi")
> Unhandled data read at 0x1c1600c(4)
> FATAL: unhandled trap (exception class 0x24)
> pc=3D0xc0473924 cpsr=3D0x200f0013 hsr=3D0x93830007
> r0=3D0xef60ff16 r1=3D0x00000021 r2=3D0xfffffff8 r3=3D0xe0029000
> r4=3D0x0d2e6416 r5=3D0x00000022 r6=3D0xde854040 r7=3D0xc0a04c48
> r8=3D0xde068000 r9=3D0xde0680dc r10=3D0xde854040 r11=3D0x00000001
> r12=3D0x00000018 r13=3D0xde109e98 r14=3D0x29aaaaab
> Parking CPU 1 (Cell: "Banana-Pi")
>=20
>=20
> The output for cat /proc/iomem is:
>=20
>=20
> 01c00000-01c0002f : 1c00000.system-control
> 01c00030-01c0003b : interrupt-controller@1c00030
> 01c02000-01c02fff : 1c02000.dma-controller
> 01c05000-01c05fff : 1c05000.spi
> 01c0c000-01c0cfff : 1c0c000.lcd-controller
> 01c0d000-01c0dfff : 1c0d000.lcd-controller
> 01c0f000-01c0ffff : 1c0f000.mmc
> 01c13000-01c133ff : usb@1c13000
> =C2=A0 01c13000-01c133ff : musb-hdrc.1.auto
> 01c13400-01c1340f : 1c13400.phy
> 01c14000-01c140ff : 1c14000.usb
> 01c14400-01c144ff : 1c14400.usb
> 01c14800-01c14803 : 1c13400.phy
> 01c15000-01c15fff : 1c15000.crypto-engine
> 01c16000-01c16fff : 1c16000.hdmi
> 01c18000-01c18fff : 1c18000.sata
> 01c1c000-01c1c0ff : 1c1c000.usb
> 01c1c400-01c1c4ff : 1c1c400.usb
> 01c1c800-01c1c803 : 1c13400.phy
> 01c20000-01c203ff : clock@1c20000
> 01c20800-01c20bff : 1c20800.pinctrl
> 01c20c90-01c20c9f : 1c20c90.watchdog
> 01c20d00-01c20d1f : 1c20d00.rtc
> 01c21800-01c2183f : 1c21800.ir
> 01c22c00-01c22c3f : 1c22c00.codec
> 01c23800-01c239ff : 1c23800.eeprom
> 01c25000-01c250ff : 1c25000.rtp
> 01c28000-01c2801f : serial
> 01c28c00-01c28c1f : serial
> 01c29c00-01c29c1f : serial
> 01c2ac00-01c2afff : 1c2ac00.i2c
> 01c2b400-01c2b7ff : 1c2b400.i2c
> 01c50000-01c5ffff : 1c50000.ethernet
> 01c60000-01c60fff : hstimer@1c60000
> 01e00000-01e1ffff : 1e00000.display-frontend
> 01e20000-01e3ffff : 1e20000.display-frontend
> 01e40000-01e4ffff : 1e40000.display-backend
> 01e60000-01e6ffff : 1e60000.display-backend
> 40000000-7a3fffff : System RAM
> =C2=A0 40008000-409fffff : Kernel code
> =C2=A0 40b00000-40bac397 : Kernel data
>=20
> The bananapi.c config has a memory region for "Ints", which ranges
> between=C2=A00x01c20400=C2=A0and=C2=A00x01c207ff (with size of 0x400) and=
 I can't find it in
> /proc/iomem.=C2=A0
> How can I solve this?
> Am I going on the right path? My only goal is to have IVSHMEM communicati=
on
> working between 2 cells in BananaPi-M1.=C2=A0
>=20

See above: There must be some difference in the resource layout of the clas=
sic
vs. M1 Banana Pi. Adjust your config (or create a dedicated M1 config) to
address them.

Jan

--=20
Siemens AG, Corporate Technology, CT RDA IOT SES-DE
Corporate Competence Center Embedded Linux

--=20
You received this message because you are subscribed to the Google Groups "=
Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/=
jailhouse-dev/64ec235d-fe28-e181-7c7b-c00956fea706%40siemens.com.
