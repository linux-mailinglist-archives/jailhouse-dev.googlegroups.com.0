Return-Path: <jailhouse-dev+bncBCZKRDGF7APRB47A774AKGQE4NZRJTA@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-pf1-x440.google.com (mail-pf1-x440.google.com [IPv6:2607:f8b0:4864:20::440])
	by mail.lfdr.de (Postfix) with ESMTPS id C3024230693
	for <lists+jailhouse-dev@lfdr.de>; Tue, 28 Jul 2020 11:31:33 +0200 (CEST)
Received: by mail-pf1-x440.google.com with SMTP id y20sf2441900pfr.1
        for <lists+jailhouse-dev@lfdr.de>; Tue, 28 Jul 2020 02:31:33 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1595928692; cv=pass;
        d=google.com; s=arc-20160816;
        b=Sg9MccPNQnBEL/W0N7ui23l0jYTuo0nPcxDl1kmZul49CGloL4o/JbWhLmjO78/EOt
         WyiUIUh0aGj/rn9TKGhm8Z5EfiUiKZgu8SkL9Kg4xyC7+Sd/IdNJ5B3zp76DxSSNJ54r
         OiiAzyJ6VrYlI0jtofEHC2jERnX2PbJuH4wmJlMel3bNKk9ztxg6ToMZcK/1GBjq5w8y
         TAvFHKDMEkTo95mco36y8OwIqjiZE5E1hNenZZIMP7v1YBzRiL1m6BsHOAihsaQSxOIl
         9LWBJI5Nf2GMtZqa+xV0JW0NY4qbUGPn2qAngRG5k8M5XEIwF3sJqqBP/HPU/ucXDmfs
         jJug==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:to:subject:message-id:date:from
         :mime-version:sender:dkim-signature;
        bh=U1oVLx5HiPsxeogt50OzKpapkKXPm/Mg3w+90gdHVJo=;
        b=n1yeiMWWi7LEcZRBwC0a18FlQ2nq0dONBu43CqJdgQuImi+Ux8jzQbWKDaummu8ap6
         UHMlv9WBZJVCT/xe4sCGjm7vF8hdiZ4I2BH0HYAsCwyLg6bVM5Eu0M1ELXGkmauXcVtG
         UC5mR+lkjTgUOZl4sBgoIxpDyWxNoutiCSBy/vMbTBbtpFUpY3tVqp3KF019eOuonmQQ
         my2x8EUT4L+yk7NODjQvkKfhDpjC3hK0Zta1KMZqEpoNTLsJTgQGq9lCyKAe/SZsQf0o
         6Y5mLletP4ONccu2FIZcJySzW7qi9qT1Uk76wCGLVg2oeu3dAiPI6n6hw1e+8av5A5SL
         ghuw==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass header.i=@luzny-cz.20150623.gappssmtp.com header.s=20150623 header.b=wEwHyV95;
       spf=neutral (google.com: 2607:f8b0:4864:20::242 is neither permitted nor denied by best guess record for domain of jakub@luzny.cz) smtp.mailfrom=jakub@luzny.cz
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:mime-version:from:date:message-id:subject:to
         :x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=U1oVLx5HiPsxeogt50OzKpapkKXPm/Mg3w+90gdHVJo=;
        b=dlC86yOSz0jjdgEeAucKcQHoWXn7+SRqgqe87ETJa1COJhQ3xEEBhRuc4w+CaTl5QT
         eEIuFKvXHu1ibdbLrYjuZCzxgsEFhC0KNRI+/YVabsABEJHw1RFDpISXx8/Pb0uRvmyS
         Uj8cBzpFfryjqdfL0DNwlrkKeoQNx2Li1WW+Kr8zRrCGnIJlRD9vJoDvmx0eMn8uIZXT
         MxuAutE+MOFeji3CFED4rHISTO1Deyz+cs5Pjt3dssB2d2bRXge7ctLqXU4zqckL3rmy
         7oQNq0bpq/BUdHQh7A38lYcv3SlJYYnjjsseGJULDZtYa5cSp+n1PaswTn5lvBsf13Jg
         KBqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:mime-version:from:date:message-id:subject
         :to:x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:x-spam-checked-in-group:list-post:list-help
         :list-archive:list-subscribe:list-unsubscribe;
        bh=U1oVLx5HiPsxeogt50OzKpapkKXPm/Mg3w+90gdHVJo=;
        b=R4Oua4V07IaH9PAX9so/vxVOu16XWyJnNx6426SqfjvbUKuazFVfpeJ5o6VnSfzhb1
         M4LD+Nwn3QFEmN91ERSD6b5UXHg99tmZ/cT8EnKkjKpbLMfZO7TABAihpg/8hHX8wOBN
         7p/NKcaiVCCQ3f6riEdrzB6SR9GQkMtyyLvBqwzku8FQ6CQZooTq64KRYd4D+jYGYv9E
         wVhpmc/JbZP/79e7H3Fg+0TS3LcXqIgYUR83CzMnO83KV2Gu2DunsmS649H31M8dJFub
         RqG6avtJykflNkOlXD/WLHfvXTsW5lxTMalpNbZ5ihZawlCf4ZPxjf4asZunrGiMovV+
         eIPw==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AOAM5309eYGUWWda30HMt46PpAzgSqo2MEfAhlS5KlVmTzQ+ruuant+L
	Nx5OEEthvi7UYtfVpgp6uDo=
X-Google-Smtp-Source: ABdhPJyB4PJKo/tlcGEfYjVvzFMcPwQTAzEeLfvMy1b/eHQNtbDi/5+BQv3BmJcjpmvTON3kwkF+tA==
X-Received: by 2002:a17:90b:1812:: with SMTP id lw18mr3838920pjb.70.1595928691664;
        Tue, 28 Jul 2020 02:31:31 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a62:8306:: with SMTP id h6ls6144995pfe.1.gmail; Tue, 28 Jul
 2020 02:31:31 -0700 (PDT)
X-Received: by 2002:a63:4b44:: with SMTP id k4mr18063846pgl.305.1595928690965;
        Tue, 28 Jul 2020 02:31:30 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1595928690; cv=none;
        d=google.com; s=arc-20160816;
        b=Lacx9VL5tTcpa4w7GYyczQ6NmtOKHaHFv5bd16EU+Jd4Tt5VvSeDC3EqMtdPBTjGwd
         u/KE4VY0T+zCirQKGHCAU4fp4xGqQq44tSh7GjimFmvc1Ge/5SRsIavDhmYDZpbFEQ9u
         KvVrVQfprvAX22c7UhPWtFWyGmeyLf9lKiO2EJSZjgOjt8gfb7bBDHbh0tOWB9i1twtk
         txRu9Erni79PEHgbGGMhMFu65ETflkEV52f7XfZ1t8qd2BU15p+WTtua6ldLPNl8nHSP
         g/EGIudXkHbOw39m8FVqus9kBAXvlB+j59NF7a3R/WwDDKKZtcXcGsRXqvJNEVXsyZaB
         aDGw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=to:subject:message-id:date:from:mime-version:dkim-signature;
        bh=iBZmMdrinkjf3LjRPUc4SuXBwFTPj95RCRoQlDMYpug=;
        b=ebuxS43KWUXhCkRCzikazd3wSGyBl7yyFdKZrAArWmD9xQ8Ow6M/D1/JEk2WG5QVRX
         z0ZhW9Ht3UAdwsNLObMzaveCM3Z8F0FjsbgrhYDa6WQiWJPP0tBjcvjqABlZMIGVZzTh
         OnJTiqxGxiAUZqeq7gwD/D6t69QzXGQhO/KAsdmvaR6nbQLrb5nHGZpXwL+XtYPUEzNu
         9XYRZynnEi7JAj4y30taa7i/J0Js5wvu/HZaih5SI74S3Y5xRnudVmXheWBQAKvkW2dU
         Qy9rLUZOaKIyDnBherU2PHck/mQuafKU2mUs0PW4PHFhhEfSLIe1XeafB4DvzE767rFQ
         XpNg==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       dkim=pass header.i=@luzny-cz.20150623.gappssmtp.com header.s=20150623 header.b=wEwHyV95;
       spf=neutral (google.com: 2607:f8b0:4864:20::242 is neither permitted nor denied by best guess record for domain of jakub@luzny.cz) smtp.mailfrom=jakub@luzny.cz
Received: from mail-oi1-x242.google.com (mail-oi1-x242.google.com. [2607:f8b0:4864:20::242])
        by gmr-mx.google.com with ESMTPS id o6si72508pfu.3.2020.07.28.02.31.30
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 28 Jul 2020 02:31:30 -0700 (PDT)
Received-SPF: neutral (google.com: 2607:f8b0:4864:20::242 is neither permitted nor denied by best guess record for domain of jakub@luzny.cz) client-ip=2607:f8b0:4864:20::242;
Received: by mail-oi1-x242.google.com with SMTP id l84so4345531oig.10
        for <jailhouse-dev@googlegroups.com>; Tue, 28 Jul 2020 02:31:30 -0700 (PDT)
X-Received: by 2002:aca:7555:: with SMTP id q82mr2659459oic.4.1595928689469;
 Tue, 28 Jul 2020 02:31:29 -0700 (PDT)
MIME-Version: 1.0
From: =?UTF-8?B?SmFrdWIgTHXFvm7DvQ==?= <jakub@luzny.cz>
Date: Tue, 28 Jul 2020 11:31:18 +0200
Message-ID: <CAGdCPwuLnZQSPxaj7j_iZwY16d+dN+FTo8H50Jjog6T_-Yz0Gg@mail.gmail.com>
Subject: GSoC Report: Week 8
To: jailhouse-dev@googlegroups.com
Content-Type: multipart/alternative; boundary="0000000000009f7c9705ab7d1a58"
X-Original-Sender: jakub@luzny.cz
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass
 header.i=@luzny-cz.20150623.gappssmtp.com header.s=20150623
 header.b=wEwHyV95;       spf=neutral (google.com: 2607:f8b0:4864:20::242 is
 neither permitted nor denied by best guess record for domain of
 jakub@luzny.cz) smtp.mailfrom=jakub@luzny.cz
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

--0000000000009f7c9705ab7d1a58
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Week 8: Jailhouse & RPi4 with more than 1G of memory

This week I was working on enabling Jailhouse to use more than 1 GiB of
memory on the Raspberry Pi 4. However, with little success so far.

Jailhouse comes with a configuration that is made for the 1 GiB variant of
the RPi4 (that is actually not even sold anymore). It also works on the
variants with more memory, but then it stays limited to 1 GiB. To
illustrate how the memory layout of the Raspberry Pi looks like, I took the
following map from the BCM2711 ARM Peripherals documentation
<https://www.raspberrypi.org/documentation/hardware/raspberrypi/bcm2711/rpi=
_DATA_2711_1p0.pdf>.
I took the address map in the =E2=80=9CLow Peripheral=E2=80=9D mode, as it =
seems to reflect
the configuration supplied with Jailhouse. Note the memory regions are not
in scale.

[image: Raspberry Pi 4 memory layout]

In the default configuration
<https://github.com/siemens/jailhouse/blob/master/configs/arm64/rpi4.c>,
Jailhouse allocates the memory range 0x0 - 0x3fa10000 (~1018M) for the
cells. The rest of the first 0x40000000 (1024M) long memory space is used
for the hypervisor itself and various shared memory regions. To avoid the
Linux kernel using all of the memory, mem=3D768M kernel parameter is used
<https://github.com/siemens/jailhouse-images/blob/master/recipes-bsp/rpi-fi=
rmware/files/cmdline.txt>.
That makes the memory above 768M available for the non-root cells.
Regarding the GPU memory, the gpu_mem parameter in Raspberry=E2=80=99s conf=
ig.txt is
not set
<https://github.com/siemens/jailhouse-images/blob/master/recipes-bsp/rpi-fi=
rmware/files/config.txt>,
so it defaults to 64M. Then, the area of 0x3b400000 (948M) - 0x40000000
(1024M) is reserved by the Raspberry firmware. I don=E2=80=99t know how the=
y make
sure that Jailhouse=E2=80=99s shared memory regions don=E2=80=99t interfere=
 with the GPU,
but it seems that they know what they=E2=80=99re doing.

To extend the support to the 4GiB version, I added a section describing the
additional memory region to the Jailhouse configuration:

/* RAM (1024M-4032M) */ {
	.phys_start =3D 0x40000000,
	.virt_start =3D 0x40000000,
	.size =3D 0xbc000000,
	.flags =3D JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
		JAILHOUSE_MEM_EXECUTE,
},

To simulate the behavior of the previous mem=3D768M kernel parameter, I
decided to reserve the memory area of 0x30000000 (768M) - 0x40000000
(1024M). At first, I tried that by using the memmap kernel parameter, but I
found out it=E2=80=99s x86 only and I have to define the reservation in the=
 device
tree. So I had to make my own device tree overlay (DTBO). After some time
of figuring out the actual format, this one is doing what I want:

// Reserved memory for Jailhouse use
/dts-v1/;
/plugin/;

/ {
	compatible =3D "brcm,bcm2835";

	fragment@0 {
	    target-path =3D "/";
	    __overlay__ {
			reserved-memory {		=09
			    #address-cells =3D <2>;
			    #size-cells =3D <1>;
			    ranges;

			    jailhouse_reserved: jailhouse@30000000 {
					reg =3D <0x0 0x30000000 0x10000000>;
				    no-map;
			    };
		    };
	    };
    };
};

However, even after all of this, I can=E2=80=99t get Jailhouse to work with=
 this
additional memory. When I run jailhouse enable with this modified
configuration, it crashes immediately:

root@demo:~# jailhouse enable rpi4-4g.cell

Initializing Jailhouse hypervisor v0.12 (59-g4ce7658d) on CPU 3
Code location: 0x0000ffffc0200800
Page pool usage after early setup: mem 39/994, remap 0/131072
Initializing processors:
CPU 3... OK
CPU 0... OK
CPU 2... OK
CPU 1... OK
Initializing unit: irqchip
Initializing unit: ARM SMMU v3
Initializing unit: PVU IOMMU
Initializing unit: PCI
Adding virtual PCI device 00:00.0 to cell "Raspberry-Pi4 4G"
Adding virtual PCI device 00:01.0 to cell "Raspberry-Pi4 4G"
Page pool usage after late setup: mem 61/994, remap 5/131072
FATAL: instruction abort at 0xfbfff7c0

FATAL: forbidden access (exception class 0x20)
Cell state before exception:
pc: ffffffc0089fd7c0   lr: ffffffc0089fd7c0 spsr: 20000085     EL1
sp: ffffffc01000bef0  esr: 20 1 0000086
x0: 0000000000000000   x1: 0000000000000000   x2: 0000000000000000
x3: 0000000000000000   x4: 0000000000000000   x5: 0000000000000000
x6: 0000000000000000   x7: 0000000000000000   x8: 0000000000000000
x9: 0000000000000000  x10: 0000000000000000  x11: 0000000000000000
x12: 0000000000000000  x13: 0000000000000000  x14: 0000000000000000
x15: 0000000000000000  x16: 0000000000000000  x17: 0000000000000000
x18: 0000000000000000  x19: ffffffc008a04c28  x20: ffffffc014800000
x21: 0000000000000000  x22: 0000000000000001  x23: 0000000000000000
x24: 0000000000000001  x25: 0000000000000001  x26: ffffffc010fe3dc0
x27: 0000000000000000  x28: ffffff80f6da5940  x29: ffffffc01000bef0

Parking CPU 1 (Cell: "Raspberry-Pi4 4G")

The address 0xfbfff7c0 of the instruction abort is 0x840 (2112) bytes
before the end of the defined memory region and the start of the peripheral
space. When I limit the kernel memory by using the mem=3D kernel parameter,
e.g. mem=3D2G, the address moves, but it stays at the same offset from the
end of the memory space. I can=E2=80=99t figure out why it=E2=80=99s crashi=
ng. I tried to
ask in the jailhouse-dev mailing list
<https://groups.google.com/g/jailhouse-dev/c/iY84ebxz2hI>, but I haven=E2=
=80=99t
got any answers.

In the meanwhile, my meta-agl-jailhouse layer was accepted into
meta-agl-devel
<https://gerrit.automotivelinux.org/gerrit/c/AGL/meta-agl-devel/+/25034>.
In the next week, while trying to figure out this issue, I want to make a
recipe for compiling additional cell configurations independently from the
jailhouse recipe.
Jakub

--=20
You received this message because you are subscribed to the Google Groups "=
Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/=
jailhouse-dev/CAGdCPwuLnZQSPxaj7j_iZwY16d%2BdN%2BFTo8H50Jjog6T_-Yz0Gg%40mai=
l.gmail.com.

--0000000000009f7c9705ab7d1a58
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><h1 class=3D"gmail-post-title gmail-p-name" style=3D"margi=
n:0px 0px 15px;padding:0px;font-weight:400;letter-spacing:-1px;line-height:=
1;color:rgb(17,17,17);font-family:-apple-system,BlinkMacSystemFont,&quot;Se=
goe UI&quot;,Roboto,Helvetica,Arial,sans-serif,&quot;Apple Color Emoji&quot=
;,&quot;Segoe UI Emoji&quot;,&quot;Segoe UI Symbol&quot;;background-color:r=
gb(253,253,253)"><font size=3D"4">Week 8: Jailhouse &amp; RPi4 with more th=
an 1G of memory</font></h1><div><p style=3D"margin:0px 0px 15px;padding:0px=
;color:rgb(17,17,17);font-family:-apple-system,BlinkMacSystemFont,&quot;Seg=
oe UI&quot;,Roboto,Helvetica,Arial,sans-serif,&quot;Apple Color Emoji&quot;=
,&quot;Segoe UI Emoji&quot;,&quot;Segoe UI Symbol&quot;;background-color:rg=
b(253,253,253)">This week I was working on enabling Jailhouse to use more t=
han 1 GiB of memory on the Raspberry Pi 4. However, with little success so =
far.</p><p style=3D"margin:0px 0px 15px;padding:0px;color:rgb(17,17,17);fon=
t-family:-apple-system,BlinkMacSystemFont,&quot;Segoe UI&quot;,Roboto,Helve=
tica,Arial,sans-serif,&quot;Apple Color Emoji&quot;,&quot;Segoe UI Emoji&qu=
ot;,&quot;Segoe UI Symbol&quot;;background-color:rgb(253,253,253)">Jailhous=
e comes with a configuration that is made for the 1 GiB variant of the RPi4=
 (that is actually not even sold anymore). It also works on the variants wi=
th more memory, but then it stays limited to 1 GiB. To illustrate how the m=
emory layout of the Raspberry Pi looks like, I took the following map from =
the=C2=A0<a href=3D"https://www.raspberrypi.org/documentation/hardware/rasp=
berrypi/bcm2711/rpi_DATA_2711_1p0.pdf" style=3D"color:rgb(23,86,169);text-d=
ecoration-line:none">BCM2711 ARM Peripherals documentation</a>. I took the =
address map in the =E2=80=9CLow Peripheral=E2=80=9D mode, as it seems to re=
flect the configuration supplied with Jailhouse. Note the memory regions ar=
e not in scale.</p><p style=3D"margin:0px 0px 15px;padding:0px;color:rgb(17=
,17,17);font-family:-apple-system,BlinkMacSystemFont,&quot;Segoe UI&quot;,R=
oboto,Helvetica,Arial,sans-serif,&quot;Apple Color Emoji&quot;,&quot;Segoe =
UI Emoji&quot;,&quot;Segoe UI Symbol&quot;;background-color:rgb(253,253,253=
)"><img src=3D"http://localhost:4000/gsoc20-blog/assets/img/rpi4-memlayout.=
png" alt=3D"Raspberry Pi 4 memory layout" style=3D"max-width: 100%; vertica=
l-align: middle;"></p><p style=3D"margin:0px 0px 15px;padding:0px;color:rgb=
(17,17,17);font-family:-apple-system,BlinkMacSystemFont,&quot;Segoe UI&quot=
;,Roboto,Helvetica,Arial,sans-serif,&quot;Apple Color Emoji&quot;,&quot;Seg=
oe UI Emoji&quot;,&quot;Segoe UI Symbol&quot;;background-color:rgb(253,253,=
253)">In the=C2=A0<a href=3D"https://github.com/siemens/jailhouse/blob/mast=
er/configs/arm64/rpi4.c" style=3D"color:rgb(23,86,169);text-decoration-line=
:none">default configuration</a>, Jailhouse allocates the memory range 0x0 =
- 0x3fa10000 (~1018M) for the cells. The rest of the first 0x40000000 (1024=
M) long memory space is used for the hypervisor itself and various shared m=
emory regions. To avoid the Linux kernel using all of the memory,=C2=A0<cod=
e class=3D"gmail-language-plaintext gmail-highlighter-rouge" style=3D"borde=
r:1px solid rgb(232,232,232);border-radius:3px;background-color:rgb(238,238=
,255);padding:1px 5px">mem=3D768M</code>=C2=A0kernel parameter=C2=A0<a href=
=3D"https://github.com/siemens/jailhouse-images/blob/master/recipes-bsp/rpi=
-firmware/files/cmdline.txt" style=3D"color:rgb(23,86,169);text-decoration-=
line:none">is used</a>. That makes the memory above 768M available for the =
non-root cells. Regarding the GPU memory, the=C2=A0<code class=3D"gmail-lan=
guage-plaintext gmail-highlighter-rouge" style=3D"border:1px solid rgb(232,=
232,232);border-radius:3px;background-color:rgb(238,238,255);padding:1px 5p=
x">gpu_mem</code>=C2=A0parameter in Raspberry=E2=80=99s config.txt=C2=A0<a =
href=3D"https://github.com/siemens/jailhouse-images/blob/master/recipes-bsp=
/rpi-firmware/files/config.txt" style=3D"color:rgb(23,86,169);text-decorati=
on-line:none">is not set</a>, so it defaults to 64M. Then, the area of 0x3b=
400000 (948M) - 0x40000000 (1024M) is reserved by the Raspberry firmware. I=
 don=E2=80=99t know how they make sure that Jailhouse=E2=80=99s shared memo=
ry regions don=E2=80=99t interfere with the GPU, but it seems that they kno=
w what they=E2=80=99re doing.</p><p style=3D"margin:0px 0px 15px;padding:0p=
x;color:rgb(17,17,17);font-family:-apple-system,BlinkMacSystemFont,&quot;Se=
goe UI&quot;,Roboto,Helvetica,Arial,sans-serif,&quot;Apple Color Emoji&quot=
;,&quot;Segoe UI Emoji&quot;,&quot;Segoe UI Symbol&quot;;background-color:r=
gb(253,253,253)">To extend the support to the 4GiB version, I added a secti=
on describing the additional memory region to the Jailhouse configuration:<=
/p><div class=3D"gmail-language-plaintext gmail-highlighter-rouge" style=3D=
"color:rgb(17,17,17);font-family:-apple-system,BlinkMacSystemFont,&quot;Seg=
oe UI&quot;,Roboto,Helvetica,Arial,sans-serif,&quot;Apple Color Emoji&quot;=
,&quot;Segoe UI Emoji&quot;,&quot;Segoe UI Symbol&quot;;background-color:rg=
b(253,253,253)"><div class=3D"gmail-highlight" style=3D"margin-bottom:15px;=
background:rgb(238,238,255)"><pre class=3D"gmail-highlight" style=3D"margin=
-top:0px;margin-bottom:15px;padding:8px 12px;border:1px solid rgb(232,232,2=
32);border-radius:3px;background-image:initial;background-position:initial;=
background-size:initial;background-repeat:initial;background-origin:initial=
;background-clip:initial;overflow-x:auto"><code style=3D"border:0px;border-=
radius:3px;padding:1px 0px">/* RAM (1024M-4032M) */ {
	.phys_start =3D 0x40000000,
	.virt_start =3D 0x40000000,
	.size =3D 0xbc000000,
	.flags =3D JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
		JAILHOUSE_MEM_EXECUTE,
},
</code></pre></div></div><p style=3D"margin:0px 0px 15px;padding:0px;color:=
rgb(17,17,17);font-family:-apple-system,BlinkMacSystemFont,&quot;Segoe UI&q=
uot;,Roboto,Helvetica,Arial,sans-serif,&quot;Apple Color Emoji&quot;,&quot;=
Segoe UI Emoji&quot;,&quot;Segoe UI Symbol&quot;;background-color:rgb(253,2=
53,253)">To simulate the behavior of the previous=C2=A0<code class=3D"gmail=
-language-plaintext gmail-highlighter-rouge" style=3D"border:1px solid rgb(=
232,232,232);border-radius:3px;background-color:rgb(238,238,255);padding:1p=
x 5px">mem=3D768M</code>=C2=A0kernel parameter, I decided to reserve the me=
mory area of 0x30000000 (768M) - 0x40000000 (1024M). At first, I tried that=
 by using the=C2=A0<code class=3D"gmail-language-plaintext gmail-highlighte=
r-rouge" style=3D"border:1px solid rgb(232,232,232);border-radius:3px;backg=
round-color:rgb(238,238,255);padding:1px 5px">memmap</code>=C2=A0kernel par=
ameter, but I found out it=E2=80=99s x86 only and I have to define the rese=
rvation in the device tree. So I had to make my own device tree overlay (DT=
BO). After some time of figuring out the actual format, this one is doing w=
hat I want:</p><div class=3D"gmail-language-plaintext gmail-highlighter-rou=
ge" style=3D"color:rgb(17,17,17);font-family:-apple-system,BlinkMacSystemFo=
nt,&quot;Segoe UI&quot;,Roboto,Helvetica,Arial,sans-serif,&quot;Apple Color=
 Emoji&quot;,&quot;Segoe UI Emoji&quot;,&quot;Segoe UI Symbol&quot;;backgro=
und-color:rgb(253,253,253)"><div class=3D"gmail-highlight" style=3D"margin-=
bottom:15px;background:rgb(238,238,255)"><pre class=3D"gmail-highlight" sty=
le=3D"margin-top:0px;margin-bottom:15px;padding:8px 12px;border:1px solid r=
gb(232,232,232);border-radius:3px;background-image:initial;background-posit=
ion:initial;background-size:initial;background-repeat:initial;background-or=
igin:initial;background-clip:initial;overflow-x:auto"><code style=3D"border=
:0px;border-radius:3px;padding:1px 0px">// Reserved memory for Jailhouse us=
e
/dts-v1/;
/plugin/;

/ {
	compatible =3D &quot;brcm,bcm2835&quot;;

	fragment@0 {
	    target-path =3D &quot;/&quot;;
	    __overlay__ {
			reserved-memory {		=09
			    #address-cells =3D &lt;2&gt;;
			    #size-cells =3D &lt;1&gt;;
			    ranges;

			    jailhouse_reserved: jailhouse@30000000 {
					reg =3D &lt;0x0 0x30000000 0x10000000&gt;;
				    no-map;
			    };
		    };
	    };
    };
};
</code></pre></div></div><p style=3D"margin:0px 0px 15px;padding:0px;color:=
rgb(17,17,17);font-family:-apple-system,BlinkMacSystemFont,&quot;Segoe UI&q=
uot;,Roboto,Helvetica,Arial,sans-serif,&quot;Apple Color Emoji&quot;,&quot;=
Segoe UI Emoji&quot;,&quot;Segoe UI Symbol&quot;;background-color:rgb(253,2=
53,253)">However, even after all of this, I can=E2=80=99t get Jailhouse to =
work with this additional memory. When I run=C2=A0<code class=3D"gmail-lang=
uage-plaintext gmail-highlighter-rouge" style=3D"border:1px solid rgb(232,2=
32,232);border-radius:3px;background-color:rgb(238,238,255);padding:1px 5px=
">jailhouse enable</code>=C2=A0with this modified configuration, it crashes=
 immediately:</p><div class=3D"gmail-language-plaintext gmail-highlighter-r=
ouge" style=3D"color:rgb(17,17,17);font-family:-apple-system,BlinkMacSystem=
Font,&quot;Segoe UI&quot;,Roboto,Helvetica,Arial,sans-serif,&quot;Apple Col=
or Emoji&quot;,&quot;Segoe UI Emoji&quot;,&quot;Segoe UI Symbol&quot;;backg=
round-color:rgb(253,253,253)"><div class=3D"gmail-highlight" style=3D"margi=
n-bottom:15px;background:rgb(238,238,255)"><pre class=3D"gmail-highlight" s=
tyle=3D"margin-top:0px;margin-bottom:15px;padding:8px 12px;border:1px solid=
 rgb(232,232,232);border-radius:3px;background-image:initial;background-pos=
ition:initial;background-size:initial;background-repeat:initial;background-=
origin:initial;background-clip:initial;overflow-x:auto"><code style=3D"bord=
er:0px;border-radius:3px;padding:1px 0px">root@demo:~# jailhouse enable rpi=
4-4g.cell =20

Initializing Jailhouse hypervisor v0.12 (59-g4ce7658d) on CPU 3
Code location: 0x0000ffffc0200800
Page pool usage after early setup: mem 39/994, remap 0/131072
Initializing processors:
CPU 3... OK
CPU 0... OK
CPU 2... OK
CPU 1... OK
Initializing unit: irqchip
Initializing unit: ARM SMMU v3
Initializing unit: PVU IOMMU
Initializing unit: PCI
Adding virtual PCI device 00:00.0 to cell &quot;Raspberry-Pi4 4G&quot;
Adding virtual PCI device 00:01.0 to cell &quot;Raspberry-Pi4 4G&quot;
Page pool usage after late setup: mem 61/994, remap 5/131072
FATAL: instruction abort at 0xfbfff7c0

FATAL: forbidden access (exception class 0x20)
Cell state before exception:
pc: ffffffc0089fd7c0   lr: ffffffc0089fd7c0 spsr: 20000085     EL1
sp: ffffffc01000bef0  esr: 20 1 0000086
x0: 0000000000000000   x1: 0000000000000000   x2: 0000000000000000
x3: 0000000000000000   x4: 0000000000000000   x5: 0000000000000000
x6: 0000000000000000   x7: 0000000000000000   x8: 0000000000000000
x9: 0000000000000000  x10: 0000000000000000  x11: 0000000000000000
x12: 0000000000000000  x13: 0000000000000000  x14: 0000000000000000
x15: 0000000000000000  x16: 0000000000000000  x17: 0000000000000000
x18: 0000000000000000  x19: ffffffc008a04c28  x20: ffffffc014800000
x21: 0000000000000000  x22: 0000000000000001  x23: 0000000000000000
x24: 0000000000000001  x25: 0000000000000001  x26: ffffffc010fe3dc0
x27: 0000000000000000  x28: ffffff80f6da5940  x29: ffffffc01000bef0

Parking CPU 1 (Cell: &quot;Raspberry-Pi4 4G&quot;)
</code></pre></div></div><p style=3D"margin:0px 0px 15px;padding:0px;color:=
rgb(17,17,17);font-family:-apple-system,BlinkMacSystemFont,&quot;Segoe UI&q=
uot;,Roboto,Helvetica,Arial,sans-serif,&quot;Apple Color Emoji&quot;,&quot;=
Segoe UI Emoji&quot;,&quot;Segoe UI Symbol&quot;;background-color:rgb(253,2=
53,253)">The address 0xfbfff7c0 of the instruction abort is 0x840 (2112) by=
tes before the end of the defined memory region and the start of the periph=
eral space. When I limit the kernel memory by using the=C2=A0<code class=3D=
"gmail-language-plaintext gmail-highlighter-rouge" style=3D"border:1px soli=
d rgb(232,232,232);border-radius:3px;background-color:rgb(238,238,255);padd=
ing:1px 5px">mem=3D</code>=C2=A0kernel parameter, e.g.=C2=A0<code class=3D"=
gmail-language-plaintext gmail-highlighter-rouge" style=3D"border:1px solid=
 rgb(232,232,232);border-radius:3px;background-color:rgb(238,238,255);paddi=
ng:1px 5px">mem=3D2G</code>, the address moves, but it stays at the same of=
fset from the end of the memory space. I can=E2=80=99t figure out why it=E2=
=80=99s crashing. I tried=C2=A0<a href=3D"https://groups.google.com/g/jailh=
ouse-dev/c/iY84ebxz2hI" style=3D"color:rgb(23,86,169);text-decoration-line:=
none">to ask in the jailhouse-dev mailing list</a>, but I haven=E2=80=99t g=
ot any answers.</p><p style=3D"margin:0px 0px 15px;padding:0px;color:rgb(17=
,17,17);font-family:-apple-system,BlinkMacSystemFont,&quot;Segoe UI&quot;,R=
oboto,Helvetica,Arial,sans-serif,&quot;Apple Color Emoji&quot;,&quot;Segoe =
UI Emoji&quot;,&quot;Segoe UI Symbol&quot;;background-color:rgb(253,253,253=
)">In the meanwhile, my meta-agl-jailhouse layer=C2=A0<a href=3D"https://ge=
rrit.automotivelinux.org/gerrit/c/AGL/meta-agl-devel/+/25034" style=3D"colo=
r:rgb(23,86,169);text-decoration-line:none">was accepted into meta-agl-deve=
l</a>. In the next week, while trying to figure out this issue, I want to m=
ake a recipe for compiling additional cell configurations independently fro=
m the jailhouse recipe.</p></div>Jakub</div>

<p></p>

-- <br />
You received this message because you are subscribed to the Google Groups &=
quot;Jailhouse&quot; group.<br />
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to <a href=3D"mailto:jailhouse-dev+unsubscribe@googlegroups.com">jailh=
ouse-dev+unsubscribe@googlegroups.com</a>.<br />
To view this discussion on the web visit <a href=3D"https://groups.google.c=
om/d/msgid/jailhouse-dev/CAGdCPwuLnZQSPxaj7j_iZwY16d%2BdN%2BFTo8H50Jjog6T_-=
Yz0Gg%40mail.gmail.com?utm_medium=3Demail&utm_source=3Dfooter">https://grou=
ps.google.com/d/msgid/jailhouse-dev/CAGdCPwuLnZQSPxaj7j_iZwY16d%2BdN%2BFTo8=
H50Jjog6T_-Yz0Gg%40mail.gmail.com</a>.<br />

--0000000000009f7c9705ab7d1a58--
