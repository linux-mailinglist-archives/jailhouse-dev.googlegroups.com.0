Return-Path: <jailhouse-dev+bncBCP5TCG4SYBBBDE73CKAMGQEYTYQ23Q@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-qv1-xf3f.google.com (mail-qv1-xf3f.google.com [IPv6:2607:f8b0:4864:20::f3f])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E426539123
	for <lists+jailhouse-dev@lfdr.de>; Tue, 31 May 2022 14:52:30 +0200 (CEST)
Received: by mail-qv1-xf3f.google.com with SMTP id u17-20020a0ced31000000b004645738eff6sf2740302qvq.8
        for <lists+jailhouse-dev@lfdr.de>; Tue, 31 May 2022 05:52:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20210112;
        h=sender:date:from:to:message-id:subject:mime-version
         :x-original-sender:precedence:mailing-list:list-id:list-post
         :list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=DqIcVw53Oe7AWMFpOxYP7OQv1SpXCp4W0p85/d6BrSs=;
        b=slPI42dnldjOR5MT0+QVbH7RnITth9xOdK1+Ly5iyH1R96C/yP/86Q8y0gpoaI45+F
         G2B6J2SccYGg1LWZ3HcDk3gjGL981/Ue5YY/IkOBQ5UuCau9BMXj0/NZppP4JTjHOA3c
         0fBQNUtKExRd+n+SwNBMHWADdKUkzzHHd94nuQDVZw7z42hM7xpSKezhQO15zcs5j26i
         58Bc2PeudKf4aLtW3aNVxT6EGiAx/Q2U6K4pNUx5NVKv/0Z8XsSZKrhsLrEfawzBpTLX
         9ysIAAovjGCFlYdFrwjdvp5OexSR0GJyos/D7clqbRUzFxfJWllgmbHmikCLbB7yB+y+
         HCEQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=date:from:to:message-id:subject:mime-version:x-original-sender
         :precedence:mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=DqIcVw53Oe7AWMFpOxYP7OQv1SpXCp4W0p85/d6BrSs=;
        b=nNXkSJYt5gFfWhmIPP3sq3hC6gINzrQvx2VT9ZjRzSB4YTBsp5u5XnBUxeMWdVLArj
         7YH5mN4znqKgotu51lZ9c2xnyfZczrkPdZ59t2V7VNjkneONhXFUc4hsvZ7KCQKd8Wgy
         W8+930ONadUPpqt0W1mzK7fp7QOZDU/329rmKeKF2Z0/DACjqp1xBbZY9sgsgzgxJqoU
         tCvPBsoAqq3ulEhcBPvg3E+Q8LRdvmR0iw9VpbNkAY2Gmdmg3h/oxy0MyQxqPB43vzJt
         9n8ESRA75tnkbByCs6Ro22hNgiXOMgL8JIXQZL0ePxhl8i8tUa+z7lA/OlQRW60vF214
         myAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=sender:x-gm-message-state:date:from:to:message-id:subject
         :mime-version:x-original-sender:precedence:mailing-list:list-id
         :x-spam-checked-in-group:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=DqIcVw53Oe7AWMFpOxYP7OQv1SpXCp4W0p85/d6BrSs=;
        b=ANzQ0m4a+rKvay2ZovA0HGfNvsFzfI9k/4D3srPQcQ83HBmrJmAfFsSCXG4Xja2gn/
         bmJ9SRQDQ44YoME6l76srktTHJElQfIeTq0ir80HmYyz23gT5viYflL/pOXMqIyOFyXh
         /Cf7S0Ac79t60f5HA5aRGv91afbWs/Z7p6G2+2k1nn+YhIOhlooH6S+JWnlT47ro3qOR
         Od2aRtaip+b4PK6J2/0n6X+7sNuNakbNgzzuIg0rJJGrB7FbmGy34W/Cle7hhDcHIBaW
         S1r32UaAkHh/eky7lPYdOWT6T2Z56/zrPWdm9O77fOeO2TltiUwDmq5ABwT7ZTeFYFAh
         SBwg==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AOAM530LlqUo7oIxnyhHVubhN7OFBmdHS7yI/Q5/u1N29TFwrWr/8pem
	EPvAz8PaQgfWYhn5txnNbFA=
X-Google-Smtp-Source: ABdhPJwDX202Z+0QVFdAEl8RDIGDnrBNbsL+F0nnbSHWqIN/8389ZOgZDvJLa0Wi1dWHiMfn1aXDhQ==
X-Received: by 2002:a05:620a:1588:b0:6a3:5a44:5ff5 with SMTP id d8-20020a05620a158800b006a35a445ff5mr35708213qkk.556.1654001549022;
        Tue, 31 May 2022 05:52:29 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a0c:ee64:0:b0:461:e7c0:a4bb with SMTP id n4-20020a0cee64000000b00461e7c0a4bbls15675460qvs.3.gmail;
 Tue, 31 May 2022 05:52:28 -0700 (PDT)
X-Received: by 2002:a05:6214:f2e:b0:461:f264:ba5 with SMTP id iw14-20020a0562140f2e00b00461f2640ba5mr49613998qvb.124.1654001548067;
        Tue, 31 May 2022 05:52:28 -0700 (PDT)
Date: Tue, 31 May 2022 05:52:27 -0700 (PDT)
From: Prabhakar Lad <prabhakar.csengg@gmail.com>
To: Jailhouse <jailhouse-dev@googlegroups.com>
Message-Id: <94bae287-eaf2-4ae2-bcdd-fc87342256e5n@googlegroups.com>
Subject: Linux imate unhandled read
MIME-Version: 1.0
Content-Type: multipart/mixed; 
	boundary="----=_Part_3338_858904513.1654001547458"
X-Original-Sender: prabhakar.csengg@gmail.com
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

------=_Part_3338_858904513.1654001547458
Content-Type: multipart/alternative; 
	boundary="----=_Part_3339_1621151853.1654001547458"

------=_Part_3339_1621151853.1654001547458
Content-Type: text/plain; charset="UTF-8"

Hi,

Blow is my setup details:

>>I have the below RAM:

    memory@48000000 {
        device_type = "memory";
        /* first 128MB is reserved for secure area. */
        reg = <0x0 0x48000000 0x0 0x78000000>;
    };

    memory@600000000 {
        device_type = "memory";
        reg = <0x6 0x00000000 0x0 0x80000000>;
    };

>>I have the below configuration for Linux in DTS to reserve the memory for 
Jailhouse,

    reserved-memory {
        #address-cells = <2>;
        #size-cells = <2>;
        ranges;

        jailhouse: jailhouse@58000000 {
            reg = <0x0 0x58000000 0x0 0x1000000>;
            no-map;
            status = "okay";
        };

        jh_inmate@59000000 {
            status = "okay";
            no-map;
            reg = <0x00 0x59000000 0x00 0x20000000>;
        };
    };

>>In the root cell configuration I have the RAM regions as below:

    .mem_regions = {
        /* RAM */ {
            .phys_start = 0x48000000,
            .virt_start = 0x48000000,
            .size = 0x10000000,
            .flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
                JAILHOUSE_MEM_EXECUTE,
        },
        /* Leave hole for hypervisor */
        /* RAM */ {
            .phys_start = 0x79000000,
            .virt_start = 0x79000000,
            .size = 0x47000000,
            .flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
                JAILHOUSE_MEM_EXECUTE,
        },
        /* RAM */ {
            .phys_start = 0x600000000,
            .virt_start = 0x600000000,
            .size = 0x80000000,
            .flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
                JAILHOUSE_MEM_EXECUTE,
        },
....
}

>>And for the Linux inmate I have the memory regions as,

    .mem_regions = {
        /* RAM */ {
            .phys_start = 0x59000000,
            .virt_start = CONFIG_INMATE_BASE,
            .size = 0x20000000,
            .flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
                JAILHOUSE_MEM_EXECUTE | JAILHOUSE_MEM_DMA |
                JAILHOUSE_MEM_LOADABLE,
        },
........
}

When I try and load the Linux image I am getting unhandled reads at the DDR 
location (0x59000000):

root@hihope-rzg2m:~# jailhouse cell linux renesas-r8a774a1-linux-demo.cell 
Image.gz -d inmate-r8a774a1-hihope.dtb -c "clk_ignore_unused rootwait rw"
Cell "renesas-r8a774a1-linux-demo" can be loaded
Unhandled data write at 0x59000000(1)

FATAL: unhandled trap (exception class 0x24)
Cell state before exception:
 pc: ffff8000104762f0   lr: ffff800008b10e64 spsr: 20000005     EL1
 sp: ffff8000118ebd40  elr: ffff8000104762f0  esr: 24 1 0000046
 x0: ffff800011640000   x1: 00000000016278c0   x2: 0000000000003440
 x3: 0000ffffffffffff   x4: 0000000000000000   x5: ffff8000116434c0
 x6: ffff800011640000   x7: d518c00058007c40   x8: 9100001f58007c40
 x9: d5181040d2a00600  x10: d5033fdfd51b423f  x11: d10403ff14000cb0
x12: a9010fe2a90007e0  x13: a9031fe6a90217e4  x14: a9052feaa90427e8
x15: 0000000000000000  x16: 0000000000000000  x17: 0000000000000000
x18: 0000000000000000  x19: ffff800011640000  x20: 00000000000034c0
x21: 0000ffffd57f1b28  x22: ffff800011109000  x23: 0000000000000000
x24: 00ffffd57f1b4800  x25: ffff8000118ebda8  x26: 0000000000000000
x27: ffff800011640000  x28: 00ffffd57f1b2800  x29: ffff8000118ebd40

Parking CPU 0 (Cell: "Renesas HopeRun HiHope RZ/G2M")
[  970.239415] Unable to handle kernel NULL pointer dereference at virtual 
address 0000000000000000
[  970.248241] Mem abort info:
[  970.251073]   ESR = 0x86000006
[  970.254150]   EC = 0x21: IABT (current EL), IL = 32 bits
[  970.259482]   SET = 0, FnV = 0
[  970.262555]   EA = 0, S1PTW = 0
[  970.265704] user pgtable: 4k pages, 48-bit VAs, pgdp=0000000604241000
[  970.272163] [0000000000000000] pgd=0000000602b44003, 
p4d=0000000602b44003, pud=0000000602b5b003, pmd=0000000000000000
[  970.282807] Internal error: Oops: 86000006 [#1] PREEMPT SMP
[  970.288386] Modules linked in: jailhouse(O)
[  970.292586] CPU: 0 PID: 396 Comm: python3 Tainted: G           O     
 5.10.31+ #36
[  970.300161] Hardware name: HopeRun HiHope RZ/G2M with sub board (DT)
[  970.306521] pstate: 20000005 (nzCv daif -PAN -UAO -TCO BTYPE=--)
[  970.312539] pc : 0x0
[  970.314737] lr : jailhouse_cmd_cell_load+0x2d4/0x3f8 [jailhouse]
[  970.320748] sp : ffff8000118ebd40
[  970.324067] x29: ffff8000118ebd40 x28: 00ffffd57f1b2800
[  970.329388] x27: ffff800011640000 x26: 0000000000000000
[  970.334707] x25: ffff8000118ebda8 x24: 00ffffd57f1b4800
[  970.340026] x23: 0000000000000000 x22: ffff800011109000
[  970.345345] x21: 0000ffffd57f1b28 x20: 00000000000034c0
[  970.350665] x19: ffff800011640000 x18: 0000000000000000
[  970.355984] x17: 0000000000000000 x16: 0000000000000000
[  970.361303] x15: 0000000000000000 x14: a9052feaa90427e8
[  970.366623] x13: a9031fe6a90217e4 x12: a9010fe2a90007e0
[  970.371942] x11: d10403ff14000cb0 x10: d5033fdfd51b423f
[  970.377262] x9 : d5181040d2a00600 x8 : 9100001f58007c40
[  970.382580] x7 : d518c00058007c40 x6 : ffff800011640000
[  970.387900] x5 : ffff8000116434c0 x4 : 0000000000000000
[  970.393220] x3 : 0000ffffffffffff x2 : 0000000000003440
[  970.398540] x1 : 00000000016278c0 x0 : ffff800011640000
[  970.403860] Call trace:
[  970.406313]  0x0
[  970.408161]  jailhouse_ioctl+0xd8/0x100 [jailhouse]
[  970.413053]  __arm64_sys_ioctl+0xac/0xf0
[  970.416985]  el0_svc_common.constprop.3+0x68/0x170
[  970.421782]  do_el0_svc+0x24/0x90
[  970.425105]  el0_svc+0x14/0x20
[  970.428165]  el0_sync_handler+0x90/0xb8
[  970.432008]  el0_sync+0x158/0x180
[  970.435335] Code: bad PC value
[  970.438406] ---[ end trace 23ec5ec9e67e1b67 ]---
[  970.443029] Kernel panic - not syncing: Oops: Fatal exception
[  970.448780] SMP: stopping secondary CPUs
[  970.452722] Kernel Offset: disabled
[  970.456217] CPU features: 0x0040022,21002004
[  970.460493] Memory Limit: none
[  970.463557] ---[ end Kernel panic - not syncing: Oops: Fatal exception 
]---

* Looking at some of the linux inmate  configs there are two regions of RAM 
specified is this a strict requirement?
* For the inmate RAM should the virt_start = CONFIG_INMATE_BASE?

Cheers,
Prabhakar

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/94bae287-eaf2-4ae2-bcdd-fc87342256e5n%40googlegroups.com.

------=_Part_3339_1621151853.1654001547458
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div>Hi,</div><div><br></div><div>Blow is my setup details:</div><div><br><=
/div><div>&gt;&gt;I have the below RAM:</div><div><br></div><div>&nbsp; &nb=
sp; memory@48000000 {<br>&nbsp; &nbsp; &nbsp; &nbsp; device_type =3D "memor=
y";<br>&nbsp; &nbsp; &nbsp; &nbsp; /* first 128MB is reserved for secure ar=
ea. */<br>&nbsp; &nbsp; &nbsp; &nbsp; reg =3D &lt;0x0 0x48000000 0x0 0x7800=
0000&gt;;<br>&nbsp; &nbsp; };<br><br>&nbsp; &nbsp; memory@600000000 {<br>&n=
bsp; &nbsp; &nbsp; &nbsp; device_type =3D "memory";<br>&nbsp; &nbsp; &nbsp;=
 &nbsp; reg =3D &lt;0x6 0x00000000 0x0 0x80000000&gt;;<br>&nbsp; &nbsp; };<=
/div><div><br></div><div>&gt;&gt;I have the below configuration for Linux i=
n DTS to reserve the memory for Jailhouse,<br></div><div><br></div><div>&nb=
sp; &nbsp; reserved-memory {<br>&nbsp; &nbsp; &nbsp; &nbsp; #address-cells =
=3D &lt;2&gt;;<br>&nbsp; &nbsp; &nbsp; &nbsp; #size-cells =3D &lt;2&gt;;<br=
>&nbsp; &nbsp; &nbsp; &nbsp; ranges;<br><br>&nbsp; &nbsp; &nbsp; &nbsp; jai=
lhouse: jailhouse@58000000 {<br>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; r=
eg =3D &lt;0x0 0x58000000 0x0 0x1000000&gt;;<br>&nbsp; &nbsp; &nbsp; &nbsp;=
 &nbsp; &nbsp; no-map;<br>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; status =
=3D "okay";<br>&nbsp; &nbsp; &nbsp; &nbsp; };<br><br>&nbsp; &nbsp; &nbsp; &=
nbsp; jh_inmate@59000000 {<br>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; sta=
tus =3D "okay";<br>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; no-map;<br>&nb=
sp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; reg =3D &lt;0x00 0x59000000 0x00 0x2=
0000000&gt;;<br>&nbsp; &nbsp; &nbsp; &nbsp; };<br>&nbsp; &nbsp; };</div><di=
v><br></div><div>&gt;&gt;In the root cell configuration I have the RAM regi=
ons as below:</div><div><br></div><div>&nbsp; &nbsp; .mem_regions =3D {<br>=
&nbsp; &nbsp; &nbsp; &nbsp; /* RAM */ {<br>&nbsp; &nbsp; &nbsp; &nbsp; &nbs=
p; &nbsp; .phys_start =3D 0x48000000,<br>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;=
 &nbsp; .virt_start =3D 0x48000000,<br>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &=
nbsp; .size =3D 0x10000000,<br>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; .f=
lags =3D JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |<br>&nbsp; &nbsp; &nbsp;=
 &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; JAILHOUSE_MEM_EXECUTE,<br>&nbsp; &nbsp;=
 &nbsp; &nbsp; },<br>&nbsp; &nbsp; &nbsp; &nbsp; /* Leave hole for hypervis=
or */<br>&nbsp; &nbsp; &nbsp; &nbsp; /* RAM */ {<br>&nbsp; &nbsp; &nbsp; &n=
bsp; &nbsp; &nbsp; .phys_start =3D 0x79000000,<br>&nbsp; &nbsp; &nbsp; &nbs=
p; &nbsp; &nbsp; .virt_start =3D 0x79000000,<br>&nbsp; &nbsp; &nbsp; &nbsp;=
 &nbsp; &nbsp; .size =3D 0x47000000,<br>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; =
&nbsp; .flags =3D JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |<br>&nbsp; &nbs=
p; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; JAILHOUSE_MEM_EXECUTE,<br>&nbs=
p; &nbsp; &nbsp; &nbsp; },<br>&nbsp; &nbsp; &nbsp; &nbsp; /* RAM */ {<br>&n=
bsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; .phys_start =3D 0x600000000,<br>&nb=
sp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; .virt_start =3D 0x600000000,<br>&nbs=
p; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; .size =3D 0x80000000,<br>&nbsp; &nbsp=
; &nbsp; &nbsp; &nbsp; &nbsp; .flags =3D JAILHOUSE_MEM_READ | JAILHOUSE_MEM=
_WRITE |<br>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; JAILHOU=
SE_MEM_EXECUTE,<br>&nbsp; &nbsp; &nbsp; &nbsp; },</div><div>....</div><div>=
}</div><div><br></div><div>&gt;&gt;And for the Linux inmate I have the memo=
ry regions as,</div><div><br></div><div>&nbsp; &nbsp; .mem_regions =3D {</d=
iv><div>&nbsp; &nbsp; &nbsp; &nbsp; /* RAM */ {<br>&nbsp; &nbsp; &nbsp; &nb=
sp; &nbsp; &nbsp; .phys_start =3D 0x59000000,<br>&nbsp; &nbsp; &nbsp; &nbsp=
; &nbsp; &nbsp; .virt_start =3D CONFIG_INMATE_BASE,<br>&nbsp; &nbsp; &nbsp;=
 &nbsp; &nbsp; &nbsp; .size =3D 0x20000000,<br>&nbsp; &nbsp; &nbsp; &nbsp; =
&nbsp; &nbsp; .flags =3D JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |<br>&nbs=
p; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; JAILHOUSE_MEM_EXECUTE |=
 JAILHOUSE_MEM_DMA |<br>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &n=
bsp; JAILHOUSE_MEM_LOADABLE,<br>&nbsp; &nbsp; &nbsp; &nbsp; },</div><div>..=
......</div><div>}</div><div><br></div><div>When I try and load the Linux i=
mage I am getting unhandled reads at the DDR location (0x59000000):</div><d=
iv><br></div><div><div><div>root@hihope-rzg2m:~# jailhouse cell linux renes=
as-r8a774a1-linux-demo.cell Image.gz -d inmate-r8a774a1-hihope.dtb -c "clk_=
ignore_unused rootwait rw"<br>Cell "renesas-r8a774a1-linux-demo" can be loa=
ded<br>Unhandled data write at 0x59000000(1)<br><br>FATAL: unhandled trap (=
exception class 0x24)<br>Cell state before exception:<br>&nbsp;pc: ffff8000=
104762f0 &nbsp; lr: ffff800008b10e64 spsr: 20000005 &nbsp; &nbsp; EL1<br>&n=
bsp;sp: ffff8000118ebd40 &nbsp;elr: ffff8000104762f0 &nbsp;esr: 24 1 000004=
6<br>&nbsp;x0: ffff800011640000 &nbsp; x1: 00000000016278c0 &nbsp; x2: 0000=
000000003440<br>&nbsp;x3: 0000ffffffffffff &nbsp; x4: 0000000000000000 &nbs=
p; x5: ffff8000116434c0<br>&nbsp;x6: ffff800011640000 &nbsp; x7: d518c00058=
007c40 &nbsp; x8: 9100001f58007c40<br>&nbsp;x9: d5181040d2a00600 &nbsp;x10:=
 d5033fdfd51b423f &nbsp;x11: d10403ff14000cb0<br>x12: a9010fe2a90007e0 &nbs=
p;x13: a9031fe6a90217e4 &nbsp;x14: a9052feaa90427e8<br>x15: 000000000000000=
0 &nbsp;x16: 0000000000000000 &nbsp;x17: 0000000000000000<br>x18: 000000000=
0000000 &nbsp;x19: ffff800011640000 &nbsp;x20: 00000000000034c0<br>x21: 000=
0ffffd57f1b28 &nbsp;x22: ffff800011109000 &nbsp;x23: 0000000000000000<br>x2=
4: 00ffffd57f1b4800 &nbsp;x25: ffff8000118ebda8 &nbsp;x26: 0000000000000000=
<br>x27: ffff800011640000 &nbsp;x28: 00ffffd57f1b2800 &nbsp;x29: ffff800011=
8ebd40<br><br>Parking CPU 0 (Cell: "Renesas HopeRun HiHope RZ/G2M")<br>[ &n=
bsp;970.239415] Unable to handle kernel NULL pointer dereference at virtual=
 address 0000000000000000<br>[ &nbsp;970.248241] Mem abort info:<br>[ &nbsp=
;970.251073] &nbsp; ESR =3D 0x86000006<br>[ &nbsp;970.254150] &nbsp; EC =3D=
 0x21: IABT (current EL), IL =3D 32 bits<br>[ &nbsp;970.259482] &nbsp; SET =
=3D 0, FnV =3D 0<br>[ &nbsp;970.262555] &nbsp; EA =3D 0, S1PTW =3D 0<br>[ &=
nbsp;970.265704] user pgtable: 4k pages, 48-bit VAs, pgdp=3D000000060424100=
0<br>[ &nbsp;970.272163] [0000000000000000] pgd=3D0000000602b44003, p4d=3D0=
000000602b44003, pud=3D0000000602b5b003, pmd=3D0000000000000000<br>[ &nbsp;=
970.282807] Internal error: Oops: 86000006 [#1] PREEMPT SMP<br>[ &nbsp;970.=
288386] Modules linked in: jailhouse(O)<br>[ &nbsp;970.292586] CPU: 0 PID: =
396 Comm: python3 Tainted: G &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; O &nbsp; &n=
bsp; &nbsp;5.10.31+ #36<br>[ &nbsp;970.300161] Hardware name: HopeRun HiHop=
e RZ/G2M with sub board (DT)<br>[ &nbsp;970.306521] pstate: 20000005 (nzCv =
daif -PAN -UAO -TCO BTYPE=3D--)<br>[ &nbsp;970.312539] pc : 0x0<br>[ &nbsp;=
970.314737] lr : jailhouse_cmd_cell_load+0x2d4/0x3f8 [jailhouse]<br>[ &nbsp=
;970.320748] sp : ffff8000118ebd40<br>[ &nbsp;970.324067] x29: ffff8000118e=
bd40 x28: 00ffffd57f1b2800<br>[ &nbsp;970.329388] x27: ffff800011640000 x26=
: 0000000000000000<br>[ &nbsp;970.334707] x25: ffff8000118ebda8 x24: 00ffff=
d57f1b4800<br>[ &nbsp;970.340026] x23: 0000000000000000 x22: ffff8000111090=
00<br>[ &nbsp;970.345345] x21: 0000ffffd57f1b28 x20: 00000000000034c0<br>[ =
&nbsp;970.350665] x19: ffff800011640000 x18: 0000000000000000<br>[ &nbsp;97=
0.355984] x17: 0000000000000000 x16: 0000000000000000<br>[ &nbsp;970.361303=
] x15: 0000000000000000 x14: a9052feaa90427e8<br>[ &nbsp;970.366623] x13: a=
9031fe6a90217e4 x12: a9010fe2a90007e0<br>[ &nbsp;970.371942] x11: d10403ff1=
4000cb0 x10: d5033fdfd51b423f<br>[ &nbsp;970.377262] x9 : d5181040d2a00600 =
x8 : 9100001f58007c40<br>[ &nbsp;970.382580] x7 : d518c00058007c40 x6 : fff=
f800011640000<br>[ &nbsp;970.387900] x5 : ffff8000116434c0 x4 : 00000000000=
00000<br>[ &nbsp;970.393220] x3 : 0000ffffffffffff x2 : 0000000000003440<br=
>[ &nbsp;970.398540] x1 : 00000000016278c0 x0 : ffff800011640000<br>[ &nbsp=
;970.403860] Call trace:<br>[ &nbsp;970.406313] &nbsp;0x0<br>[ &nbsp;970.40=
8161] &nbsp;jailhouse_ioctl+0xd8/0x100 [jailhouse]<br>[ &nbsp;970.413053] &=
nbsp;__arm64_sys_ioctl+0xac/0xf0<br>[ &nbsp;970.416985] &nbsp;el0_svc_commo=
n.constprop.3+0x68/0x170<br>[ &nbsp;970.421782] &nbsp;do_el0_svc+0x24/0x90<=
br>[ &nbsp;970.425105] &nbsp;el0_svc+0x14/0x20<br>[ &nbsp;970.428165] &nbsp=
;el0_sync_handler+0x90/0xb8<br>[ &nbsp;970.432008] &nbsp;el0_sync+0x158/0x1=
80<br>[ &nbsp;970.435335] Code: bad PC value<br>[ &nbsp;970.438406] ---[ en=
d trace 23ec5ec9e67e1b67 ]---<br>[ &nbsp;970.443029] Kernel panic - not syn=
cing: Oops: Fatal exception<br>[ &nbsp;970.448780] SMP: stopping secondary =
CPUs<br>[ &nbsp;970.452722] Kernel Offset: disabled<br>[ &nbsp;970.456217] =
CPU features: 0x0040022,21002004<br>[ &nbsp;970.460493] Memory Limit: none<=
br>[ &nbsp;970.463557] ---[ end Kernel panic - not syncing: Oops: Fatal exc=
eption ]---</div><div><br></div><div>* Looking at some of the linux inmate&=
nbsp; configs there are two regions of RAM specified is this a strict requi=
rement?</div><div>* For the inmate RAM should the virt_start =3D CONFIG_INM=
ATE_BASE?</div><div><br></div></div></div><div>Cheers,</div><div>Prabhakar<=
br></div>

<p></p>

-- <br />
You received this message because you are subscribed to the Google Groups &=
quot;Jailhouse&quot; group.<br />
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to <a href=3D"mailto:jailhouse-dev+unsubscribe@googlegroups.com">jailh=
ouse-dev+unsubscribe@googlegroups.com</a>.<br />
To view this discussion on the web visit <a href=3D"https://groups.google.c=
om/d/msgid/jailhouse-dev/94bae287-eaf2-4ae2-bcdd-fc87342256e5n%40googlegrou=
ps.com?utm_medium=3Demail&utm_source=3Dfooter">https://groups.google.com/d/=
msgid/jailhouse-dev/94bae287-eaf2-4ae2-bcdd-fc87342256e5n%40googlegroups.co=
m</a>.<br />

------=_Part_3339_1621151853.1654001547458--

------=_Part_3338_858904513.1654001547458--
