Return-Path: <jailhouse-dev+bncBDLLFRUURMIBBTWU26DAMGQEKTNZ45Q@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-qv1-xf3e.google.com (mail-qv1-xf3e.google.com [IPv6:2607:f8b0:4864:20::f3e])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A0103B45E2
	for <lists+jailhouse-dev@lfdr.de>; Fri, 25 Jun 2021 16:38:08 +0200 (CEST)
Received: by mail-qv1-xf3e.google.com with SMTP id p5-20020a0ccb850000b029025849db65e9sf9921595qvk.23
        for <lists+jailhouse-dev@lfdr.de>; Fri, 25 Jun 2021 07:38:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:date:from:to:message-id:subject:mime-version
         :x-original-sender:precedence:mailing-list:list-id:list-post
         :list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=VNDZZ0QNe1hCj9xTcnjziibEY88t1w1Cl+DgZiawn8c=;
        b=a03qFDC16M1HfIJiwCd/X9Vpa6wfIZYCybFGwMnhq9DSvsiVWZ5n2oYpX8uSratJEr
         Sm0zXwDzzyr313zOSLm5pQXu5xbTdqpi+wz9i38M/2gPFRA0xfBQ7gH+o8ZCG27iqmBJ
         1kXseddG65VMB7xwcOVsDyFOS6Bpj+nWBKniORWrqM8yY0ZlwTR99TPVNkO+RnXNrgNb
         ZTOXGgAKwnSmJk1KZ0qsBhySghCosjqBgF/b2icAhHPxnWpxGRU/UrqweWR5MpLRD7ul
         rT7EdI3/ba/0sJgVeDj37K2z+ciYwCLq+z0wORyUKz0ioIo+GHQzusalxuaDbnoaikSh
         QyDw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:message-id:subject:mime-version:x-original-sender
         :precedence:mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=VNDZZ0QNe1hCj9xTcnjziibEY88t1w1Cl+DgZiawn8c=;
        b=a4zQJDKvx1Th/P2eUcYYnsvMhHEz915kokvIugmuvsOuFokrjZe0WCfhx52NBMXflc
         mLgMZ1O5SSlWpgCrUTx12xr9IrnSOjjj/3E15Apykj5Oq+xUOvDq3R8H/wZcbl5T+OS9
         Kf02knJPzMMXeiLTH10e+5HKeFgOIu/CBCgqbPfsA3dWMulVaRXOaOIqYY898GzRNKVl
         yuCnbjONXtg6wTBXScv+3W0BGu062Wmthk6bEZSfTteGlcYwk5btpbISjmQiGbh0MbXY
         hgaIYz0kQOt83zhyaI2sJXnwR26Pd7pfGmITEQZSZv4YAlLXannHzWXTLoR/4u1rzVRL
         W2bQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:date:from:to:message-id:subject
         :mime-version:x-original-sender:precedence:mailing-list:list-id
         :x-spam-checked-in-group:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=VNDZZ0QNe1hCj9xTcnjziibEY88t1w1Cl+DgZiawn8c=;
        b=puGW8hgOmZVisXDnUPEcZ7Azwk5YYT1HKcSwcPGtIHLGI70S8C0MiqhrVak5N3H2ws
         dSugm2ppn6WkawSdyeAbwRHOEwst2Mkd7F7OrQhU7EJ3LaTizBQji4WwJMY1zs/kr8ZU
         u8ebc6YFhbYYKzZZgzrWJz+ugMr61Z+X362FZfwFKZv7l5JzVlinpztE8vvlcI0/b0s9
         dyoJHQHotw/Xj7jh+a77BzyihoxJRcI2s0PbtS/tyi/gKQx+OI+BmaEPn4fTYu8Jg5yl
         69mrIdq6PPaasay7nFnbj7Z0t7xTe4GlhoXthi87cmjcIbwKLtruBDxao24rG+i1Ji7X
         3QZQ==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AOAM532/Dg0/vb+HPT4ycYe0QXcNIkht/LRunh3yBSsri94fN/r1qRxp
	/Mx8H2LJrPub4wTzTLxw1oQ=
X-Google-Smtp-Source: ABdhPJzsYCGnE0Vsmll3Jl8O5SjEgAe6tLXK1kPKI4mb+YNsRi2oZBE0QHVVhk4v9fu+oahANmSzuA==
X-Received: by 2002:ac8:5a81:: with SMTP id c1mr10126160qtc.194.1624631887019;
        Fri, 25 Jun 2021 07:38:07 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a37:bd85:: with SMTP id n127ls6271172qkf.8.gmail; Fri, 25
 Jun 2021 07:38:06 -0700 (PDT)
X-Received: by 2002:a37:8306:: with SMTP id f6mr12194948qkd.82.1624631886322;
        Fri, 25 Jun 2021 07:38:06 -0700 (PDT)
Date: Fri, 25 Jun 2021 07:38:05 -0700 (PDT)
From: Anmol karn <anmol.karan123@gmail.com>
To: Jailhouse <jailhouse-dev@googlegroups.com>
Message-Id: <c07e7f82-2a69-44e6-bbba-aa270d60917en@googlegroups.com>
Subject: Help needed regarding AGL with Jailhouse
MIME-Version: 1.0
Content-Type: multipart/mixed; 
	boundary="----=_Part_1522_1635956487.1624631885616"
X-Original-Sender: anmol.karan123@gmail.com
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

------=_Part_1522_1635956487.1624631885616
Content-Type: multipart/alternative; 
	boundary="----=_Part_1523_883706918.1624631885616"

------=_Part_1523_883706918.1624631885616
Content-Type: text/plain; charset="UTF-8"

Hi,

I am currently working on a GSoC'21 project "VirtIO-blk implementation with 
AGL on Jailhouse".

I am new to the Jailhouse and trying to get jailhouse(v0.12) work with 
QEmu(x86-64) with a custom agl-image.

I have been using a 5.4 kernel(jailhouse-enabling/5.4).

We are getting Kernel panics and unknown failures with 
`jailhouse-enabling/5.4`, so we decided to shift to `queues/jailhouse` 
(452bfd9102265f67afd5818024ca2664aa3afa60), and then we somehow managed to 
QEmulate it without kernel panics, but now it's showing some unknown 
behaviors, and also not booting properly:

Log:
[    0.007617] [Firmware Bug]: TSC_DEADLINE disabled due to Errata; please 
update microcode to version: 0xb2 (or later)
[    0.525808] kvm: already loaded the other module
[    0.567138] hdaudio hdaudioC0D0: Unable to bind the codec

Automotive Grade Linux 11.91.0 qemux86-64 ttyS0

qemux86-64 login: [   27.731494] virtio_gpu virtio0: [drm] *ERROR* fbdev: 
Failed to setup generic emulation (ret=-22)
[   27.841660] Out of memory: Killed process 161 (systemd-udevd) 
total-vm:12276kB, anon-rss:556kB, file-rss:0kB, shmem-rss:0kB, UID:0 
pgtables:64kB oom_score_adj:0

qemux86-64 login: 
qemux86-64 login: 
qemux86-64 login: root

^C^C^C^C^C

[  236.927354] Out of memory: Killed process 167 ((agetty)) 
total-vm:8260kB, anon-rss:1488kB, file-rss:0kB, shmem-rss:0kB, UID:0 
pgtables:48kB oom_score_adj:0
[  437.781132] Out of memory: Killed process 166 (systemd-udevd) 
total-vm:13548kB, anon-rss:1500kB, file-rss:0kB, shmem-rss:0kB, UID:0 
pgtables:64kB oom_score_adj:0
[  457.378023] Out of memory: Killed process 170 ((agetty)) 
total-vm:8260kB, anon-rss:1488kB, file-rss:0kB, shmem-rss:0kB, UID:0 
pgtables:48kB oom_score_adj:0
[  516.062574] Out of memory: Killed process 171 ((agetty)) 
total-vm:8260kB, anon-rss:1488kB, file-rss:0kB, shmem-rss:0kB, UID:0 
pgtables:48kB oom_score_adj:0
QEMU 4.2.0 monitor - type 'help' for more information
(qemu) q


Questions: 
- Is there any solution for the 5.4.x(jailhouse-enabling/5.4) kernel with 
some patchset.
- Any hints to get it working properly with the "queues/jailhouse" branch.

It would be great if I can get any hints about this problem.

Thanks and Regards,
Anmol

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/c07e7f82-2a69-44e6-bbba-aa270d60917en%40googlegroups.com.

------=_Part_1523_883706918.1624631885616
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div>Hi,</div><div><br></div><div>I am currently working on a GSoC'21 proje=
ct "VirtIO-blk implementation with AGL on Jailhouse".</div><div><br></div><=
div>I am new to the Jailhouse and trying to get jailhouse(v0.12) work with =
QEmu(x86-64) with a custom agl-image.</div><div><br></div><div>I have been =
using a 5.4 kernel(jailhouse-enabling/5.4).</div><div><br></div><div>We are=
 getting Kernel panics and unknown failures with `jailhouse-enabling/5.4`, =
so we decided to shift to `queues/jailhouse` (452bfd9102265f67afd5818024ca2=
664aa3afa60), and then we somehow managed to QEmulate it without kernel pan=
ics, but now it's showing some unknown behaviors, and also not booting prop=
erly:</div><div><br></div><div>Log:</div><div><div>[&nbsp; &nbsp; 0.007617]=
 [Firmware Bug]: TSC_DEADLINE disabled due to Errata; please update microco=
de to version: 0xb2 (or later)</div><div>[&nbsp; &nbsp; 0.525808] kvm: alre=
ady loaded the other module</div><div>[&nbsp; &nbsp; 0.567138] hdaudio hdau=
dioC0D0: Unable to bind the codec</div><div><br></div><div>Automotive Grade=
 Linux 11.91.0 qemux86-64 ttyS0</div><div><br></div><div>qemux86-64 login: =
[&nbsp; &nbsp;27.731494] virtio_gpu virtio0: [drm] *ERROR* fbdev: Failed to=
 setup generic emulation (ret=3D-22)</div><div>[&nbsp; &nbsp;27.841660] Out=
 of memory: Killed process 161 (systemd-udevd) total-vm:12276kB, anon-rss:5=
56kB, file-rss:0kB, shmem-rss:0kB, UID:0 pgtables:64kB oom_score_adj:0</div=
><div><br></div><div>qemux86-64 login:&nbsp;</div><div>qemux86-64 login:&nb=
sp;</div><div>qemux86-64 login: root</div><div><br></div><div>^C^C^C^C^C</d=
iv><div><br></div><div>[&nbsp; 236.927354] Out of memory: Killed process 16=
7 ((agetty)) total-vm:8260kB, anon-rss:1488kB, file-rss:0kB, shmem-rss:0kB,=
 UID:0 pgtables:48kB oom_score_adj:0</div><div>[&nbsp; 437.781132] Out of m=
emory: Killed process 166 (systemd-udevd) total-vm:13548kB, anon-rss:1500kB=
, file-rss:0kB, shmem-rss:0kB, UID:0 pgtables:64kB oom_score_adj:0</div><di=
v>[&nbsp; 457.378023] Out of memory: Killed process 170 ((agetty)) total-vm=
:8260kB, anon-rss:1488kB, file-rss:0kB, shmem-rss:0kB, UID:0 pgtables:48kB =
oom_score_adj:0</div><div>[&nbsp; 516.062574] Out of memory: Killed process=
 171 ((agetty)) total-vm:8260kB, anon-rss:1488kB, file-rss:0kB, shmem-rss:0=
kB, UID:0 pgtables:48kB oom_score_adj:0</div><div>QEMU 4.2.0 monitor - type=
 'help' for more information</div><div>(qemu) q</div></div><div><br></div><=
div><br></div><div><div>Questions:&nbsp;</div><div>- Is there any solution =
for the 5.4.x(jailhouse-enabling/5.4) kernel with some patchset.</div><div>=
- Any hints to get it working properly with the "queues/jailhouse" branch.<=
/div><div><br></div><div>It would be great if I can get any hints about thi=
s problem.</div><div><br></div><div>Thanks and Regards,</div><div>Anmol</di=
v></div><div><br></div>

<p></p>

-- <br />
You received this message because you are subscribed to the Google Groups &=
quot;Jailhouse&quot; group.<br />
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to <a href=3D"mailto:jailhouse-dev+unsubscribe@googlegroups.com">jailh=
ouse-dev+unsubscribe@googlegroups.com</a>.<br />
To view this discussion on the web visit <a href=3D"https://groups.google.c=
om/d/msgid/jailhouse-dev/c07e7f82-2a69-44e6-bbba-aa270d60917en%40googlegrou=
ps.com?utm_medium=3Demail&utm_source=3Dfooter">https://groups.google.com/d/=
msgid/jailhouse-dev/c07e7f82-2a69-44e6-bbba-aa270d60917en%40googlegroups.co=
m</a>.<br />

------=_Part_1523_883706918.1624631885616--

------=_Part_1522_1635956487.1624631885616--
