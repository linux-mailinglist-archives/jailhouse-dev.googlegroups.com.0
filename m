Return-Path: <jailhouse-dev+bncBD7236HKXYJRBREN43YAKGQEAWYGCDQ@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-ot1-x33e.google.com (mail-ot1-x33e.google.com [IPv6:2607:f8b0:4864:20::33e])
	by mail.lfdr.de (Postfix) with ESMTPS id 310C7137C56
	for <lists+jailhouse-dev@lfdr.de>; Sat, 11 Jan 2020 09:26:46 +0100 (CET)
Received: by mail-ot1-x33e.google.com with SMTP id d16sf2549388otq.19
        for <lists+jailhouse-dev@lfdr.de>; Sat, 11 Jan 2020 00:26:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:date:from:to:message-id:subject:mime-version
         :x-original-sender:precedence:mailing-list:list-id:list-post
         :list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=KmjgqIxXfyz1jTIOfeliS+BuffTICYO0GUGRzlfq8cA=;
        b=reBu+dUwS+/mRg2DCpNuxuWHFa7qyno7K2f/LJV9UgXfF8YEJGFqfba+mWh/xqJjy+
         4OEE90q0c/ZO61RXaFdw4Lurub9BYgOZiPlQEravXHBrXH1YSm6N5MpWfkcjee+6oxQm
         H/a/BJIPnHUnAabL8lzaOp/xDL28c2rHQ9yrAOq2Hy8fha8QKhaaprS/uO7ST6qQ4AuG
         25/LPJUI2H/1IJ+5NWja8EYugghq6o1w76NJlUYgrHeL9RHgLeTdlV3pO47bD1KcYiWZ
         0sOPeteGhUBgUwVsF6ljOgitVIXaHlaNAneWgKjxC7oIVQEXSBC985GU/xMlBxYTM2EA
         jsxA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:message-id:subject:mime-version:x-original-sender
         :precedence:mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=KmjgqIxXfyz1jTIOfeliS+BuffTICYO0GUGRzlfq8cA=;
        b=bPPYD7Jv0yeEis3zQ5kmvVccaybS+uftyq8CXfeayxrg7nFsJORttOrCl7GEJT4tXt
         sIK4yIwnvx88NcQfGT3nGn24rFd96TuaZ4CdKS2RjjR6jdQIwYVzITqzOdOyFr4SsJrx
         lyRur1B+vfskws7ZsyWxEGSlZEj8PbuLB5KMbltLAfdF6Iw7i5c8NCliWeYxoe+ckaHw
         sZT6aYfo33RHavzzXfI+KB2aILAZrRdE6dq1cEYexSnH9Y6Ld5uQXtkRSU4qh+VHZ0bj
         MtRgVos5o++0s0qyXQmG+SlAuViwApH1WjnLYXgo2Ezj08wF8EpNDrQBXmB5Gio/vI0n
         rEJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:date:from:to:message-id:subject
         :mime-version:x-original-sender:precedence:mailing-list:list-id
         :x-spam-checked-in-group:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=KmjgqIxXfyz1jTIOfeliS+BuffTICYO0GUGRzlfq8cA=;
        b=uHKmuX7Ti8x4HlFWRbd7Toh+yKtJYhb/EgkKTMWIf53xXowhuLH5SB06tR7xRDQhO5
         swTwRnt6aehe86LXXk7hkGofVGMCl2k90/cFfxHANxkZG1GZ32wBCyJ8QWlDhYWI16SH
         4NyOlMdYvqNQzRxdgfpYy2xLyGy345V0twemKHsBZa3LWfIdCu4RhVlb7tcBLSNaH0jO
         S/S8fF8g3I3NjLXvVpgsTW2fizMxo5kJ1PzLKEwRaWuSFvBNsFKXMxE5ZXt3bpd/2nSK
         Q/BfIxseY0wuVqic3RceWLp+GLGGDh2xkIEtl5SBBRr+VgIB1I77luLifuzjs1eILwwP
         xZ/w==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: APjAAAWXISmkHNNkZmbigQ8KT1hFv3I2Fj8QvpdfV1ERWW6i3m/zE/NW
	auzASCWfaJEV1JRFIP1ETWA=
X-Google-Smtp-Source: APXvYqwIKUzGFyuSKgSxsJ/W3GxteTjq5I4raGq910Wp0VuIPVgIH62GUOaCRRvzAoOt1fFsAgxcVA==
X-Received: by 2002:a05:6808:64d:: with SMTP id z13mr5754863oih.104.1578731204624;
        Sat, 11 Jan 2020 00:26:44 -0800 (PST)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a9d:4e14:: with SMTP id p20ls1455600otf.4.gmail; Sat, 11 Jan
 2020 00:26:44 -0800 (PST)
X-Received: by 2002:a9d:4f0a:: with SMTP id d10mr6114361otl.85.1578731203858;
        Sat, 11 Jan 2020 00:26:43 -0800 (PST)
Date: Sat, 11 Jan 2020 00:26:43 -0800 (PST)
From: Thorsten Schulz <contact.thorsten@gmail.com>
To: Jailhouse <jailhouse-dev@googlegroups.com>
Message-Id: <46455211-7834-4791-b623-6c7278584b83@googlegroups.com>
Subject: jailhouse-images/wip/update does not build (incomplete commit(?) /
 rt-version broken)
MIME-Version: 1.0
Content-Type: multipart/mixed; 
	boundary="----=_Part_998_1169982278.1578731203287"
X-Original-Sender: contact.thorsten@gmail.com
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

------=_Part_998_1169982278.1578731203287
Content-Type: multipart/alternative; 
	boundary="----=_Part_999_1029473544.1578731203287"

------=_Part_999_1029473544.1578731203287
Content-Type: text/plain; charset="UTF-8"

Hej,

looking forward into trying out the ivshmem updates, however, I cannot 
build the (qemu-x86-64) image. 

First issue: recipes-kernel/linux/linux-jailhouse-rt_5.4.5.bb seems missing 
after latest commit 
<https://github.com/siemens/jailhouse-images/commit/359f3b6>. So 
`./build-images.sh` results in:

[..]

> ERROR: Nothing PROVIDES 'linux-image-jailhouse' (but 
> mc:qemu-amd64-jailhouse-demo:/repo/recipes-core/images/demo-image.bb, 
> mc:qemu-amd64-jailhouse-demo:/repo/recipes-jailhouse/jailhouse/jailhouse_0.11.bb 
> DEPENDS on or otherwise requires it). Close matches:
>   linux-image-jailhouse-rt
>   linux-jailhouse-rt
>   linux-headers-jailhouse-rt
>
[..]

If I go for `./build-images.sh --rt` to get the preemt-rt build, the 
kernel-build log throws:

ERROR: mc:qemu-amd64-jailhouse-demo:jailhouse-jailhouse-rt-0.11-r0 
do_dpkg_build: Error executing a python function in exec_python_func() 
autogenerated:
[..]

> Exception: bb.process.ExecutionError: Execution of 
> '/work/build/tmp/work/jailhouse-demo-amd64/jailhouse-jailhouse-rt/0.11-r0/temp/run.dpkg_runbuild.517003' 
> failed with exit code 2:
> dpkg-buildpackage: info: source package jailhouse-jailhouse-rt
> dpkg-buildpackage: info: source version 0.11
> dpkg-buildpackage: info: source distribution UNRELEASED
> dpkg-buildpackage: info: source changed by Unknown maintainer 
> <unknown@example.com>
>  dpkg-source -I --before-build .
> dpkg-buildpackage: info: host architecture amd64
>  fakeroot debian/rules clean
> CFLAGS= LDFLAGS= dh clean --parallel --with python2
>    dh_auto_clean -O--parallel
>     make -j8 clean
> make[1]: Entering directory '/home/builder/jailhouse-jailhouse-rt/git'
> make[1]: Leaving directory '/home/builder/jailhouse-jailhouse-rt/git'
>    dh_clean -O--parallel
>  dpkg-source -I -b .
> dpkg-source: warning: no source format specified in debian/source/format, 
> see dpkg-source(1)
> dpkg-source: warning: source directory 'git' is not 
> <sourcepackage>-<upstreamversion> 'jailhouse-jailhouse-rt-0.11'
> dpkg-source: info: using source format '1.0'
> dpkg-source: info: building jailhouse-jailhouse-rt in 
> jailhouse-jailhouse-rt_0.11.tar.gz
> dpkg-source: info: building jailhouse-jailhouse-rt in 
> jailhouse-jailhouse-rt_0.11.dsc
>  debian/rules build
> CFLAGS= LDFLAGS= dh build --parallel --with python2
>    dh_update_autotools_config -O--parallel
>    dh_auto_configure -O--parallel
>    dh_auto_build -O--parallel
>     make -j8
> make[1]: Entering directory '/home/builder/jailhouse-jailhouse-rt/git'
>   GEN     /home/builder/jailhouse-jailhouse-rt/git/pyjailhouse/pci_defs.py
>   UPD     
> /home/builder/jailhouse-jailhouse-rt/git/hypervisor/include/generated/config.mk
>   CC      
> /home/builder/jailhouse-jailhouse-rt/git/inmates/lib/x86/../alloc.o
>   CC      
> /home/builder/jailhouse-jailhouse-rt/git/inmates/lib/x86/../cmdline.o
>   CC      /home/builder/jailhouse-jailhouse-rt/git/inmates/lib/x86/../pci.o
>   CC      
> /home/builder/jailhouse-jailhouse-rt/git/inmates/lib/x86/../printk.o
>   CC      
> /home/builder/jailhouse-jailhouse-rt/git/inmates/lib/x86/../setup.o
>   CC      /home/builder/jailhouse-jailhouse-rt/git/configs/x86/apic-demo.o
>   UPD     
> /home/builder/jailhouse-jailhouse-rt/git/hypervisor/include/generated/version.h
>   CC      
> /home/builder/jailhouse-jailhouse-rt/git/inmates/lib/x86/../string.o
>   CC      /home/builder/jailhouse-jailhouse-rt/git/configs/x86/e1000-demo.o
>   CC      
> /home/builder/jailhouse-jailhouse-rt/git/inmates/lib/x86/../test.o
>   CC      
> /home/builder/jailhouse-jailhouse-rt/git/inmates/lib/x86/../uart-8250.o
>   CC      
> /home/builder/jailhouse-jailhouse-rt/git/configs/x86/f2a88xm-hd3.o
>   CC      
> /home/builder/jailhouse-jailhouse-rt/git/inmates/lib/x86/cpu-features.o
>   CC      /home/builder/jailhouse-jailhouse-rt/git/configs/x86/imb-a180.o
>   CC      
> /home/builder/jailhouse-jailhouse-rt/git/configs/x86/ioapic-demo.o
>   AS      
> /home/builder/jailhouse-jailhouse-rt/git/inmates/lib/x86/header-64.o
>   CC      /home/builder/jailhouse-jailhouse-rt/git/inmates/lib/x86/excp.o
> scripts/Makefile.build:57: 
> '/home/builder/jailhouse-jailhouse-rt/git/driver/jailhouse.ko' will not be 
> built even though obj-m is specified.
> scripts/Makefile.build:58: You cannot use subdir-y/m to visit a module 
> Makefile. Use obj-y/m instead.
>   CC [M]  /home/builder/jailhouse-jailhouse-rt/git/driver/cell.o
>   AS      
> /home/builder/jailhouse-jailhouse-rt/git/inmates/lib/x86/header-common.o
>   CC      
> /home/builder/jailhouse-jailhouse-rt/git/configs/x86/ivshmem-demo.o
>   CC      
> /home/builder/jailhouse-jailhouse-rt/git/hypervisor/arch/x86/asm-defines.s
>   LDS     
> /home/builder/jailhouse-jailhouse-rt/git/hypervisor/hypervisor.lds
>   CC      /home/builder/jailhouse-jailhouse-rt/git/hypervisor/setup.o
>   CC      /home/builder/jailhouse-jailhouse-rt/git/hypervisor/printk.o
>   CC      /home/builder/jailhouse-jailhouse-rt/git/inmates/lib/x86/int.o
>   CC      
> /home/builder/jailhouse-jailhouse-rt/git/configs/x86/linux-nuc6cay-demo.o
>   CC      
> /home/builder/jailhouse-jailhouse-rt/git/configs/x86/linux-x86-demo.o
>   CC      /home/builder/jailhouse-jailhouse-rt/git/inmates/lib/x86/ioapic.o
>   CC [M]  /home/builder/jailhouse-jailhouse-rt/git/driver/main.o
>   CC [M]  /home/builder/jailhouse-jailhouse-rt/git/driver/sysfs.o
>   CC      /home/builder/jailhouse-jailhouse-rt/git/configs/x86/nuc6cay.o
> /home/builder/jailhouse-jailhouse-rt/git/configs/x86/nuc6cay.c:39: 
> warning: "ARRAY_SIZE" redefined
>  #define ARRAY_SIZE(a) (sizeof(a) / sizeof((a)[0]))
>  
> In file included from 
> /home/builder/jailhouse-jailhouse-rt/git/configs/x86/nuc6cay.c:37:
> /home/builder/jailhouse-jailhouse-rt/git/configs/../include/jailhouse/cell-config.h:46: 
> note: this is the location of the previous definition
>  #define ARRAY_SIZE(a) sizeof(a) / sizeof(a[0])
>  
>   CC      /home/builder/jailhouse-jailhouse-rt/git/inmates/lib/x86/mem.o
>   CC      /home/builder/jailhouse-jailhouse-rt/git/configs/x86/pci-demo.o
>   CC      /home/builder/jailhouse-jailhouse-rt/git/hypervisor/paging.o
>   CC      /home/builder/jailhouse-jailhouse-rt/git/inmates/lib/x86/pci.o
>   CC      /home/builder/jailhouse-jailhouse-rt/git/inmates/lib/x86/printk.o
>   CC      /home/builder/jailhouse-jailhouse-rt/git/configs/x86/qemu-x86.o
>   CC      /home/builder/jailhouse-jailhouse-rt/git/inmates/lib/x86/setup.o
>   CC      /home/builder/jailhouse-jailhouse-rt/git/hypervisor/control.o
>   CC      /home/builder/jailhouse-jailhouse-rt/git/configs/x86/smp-demo.o
>   CC      /home/builder/jailhouse-jailhouse-rt/git/inmates/lib/x86/smp.o
>   CC      /home/builder/jailhouse-jailhouse-rt/git/configs/x86/tiny-demo.o
>   CC      /home/builder/jailhouse-jailhouse-rt/git/inmates/lib/x86/timing.o
>   OBJCOPY 
> /home/builder/jailhouse-jailhouse-rt/git/configs/x86/apic-demo.cell
>   OBJCOPY 
> /home/builder/jailhouse-jailhouse-rt/git/configs/x86/e1000-demo.cell
>   OBJCOPY 
> /home/builder/jailhouse-jailhouse-rt/git/configs/x86/f2a88xm-hd3.cell
>   OBJCOPY 
> /home/builder/jailhouse-jailhouse-rt/git/configs/x86/imb-a180.cell
>   OBJCOPY 
> /home/builder/jailhouse-jailhouse-rt/git/configs/x86/ioapic-demo.cell
>   OBJCOPY 
> /home/builder/jailhouse-jailhouse-rt/git/configs/x86/ivshmem-demo.cell
>   OBJCOPY 
> /home/builder/jailhouse-jailhouse-rt/git/configs/x86/linux-nuc6cay-demo.cell
>   OBJCOPY 
> /home/builder/jailhouse-jailhouse-rt/git/configs/x86/linux-x86-demo.cell
>   OBJCOPY /home/builder/jailhouse-jailhouse-rt/git/configs/x86/nuc6cay.cell
>   OBJCOPY 
> /home/builder/jailhouse-jailhouse-rt/git/configs/x86/pci-demo.cell
>   OBJCOPY 
> /home/builder/jailhouse-jailhouse-rt/git/configs/x86/qemu-x86.cell
>   OBJCOPY 
> /home/builder/jailhouse-jailhouse-rt/git/configs/x86/smp-demo.cell
>   OBJCOPY 
> /home/builder/jailhouse-jailhouse-rt/git/configs/x86/tiny-demo.cell
>   CC      /home/builder/jailhouse-jailhouse-rt/git/hypervisor/lib.o
>   CC      /home/builder/jailhouse-jailhouse-rt/git/hypervisor/mmio.o
>   CC      /home/builder/jailhouse-jailhouse-rt/git/inmates/lib/x86/uart.o
>   CC      /home/builder/jailhouse-jailhouse-rt/git/hypervisor/pci.o
>   CC      
> /home/builder/jailhouse-jailhouse-rt/git/inmates/lib/x86/cpu-features-32.o
> /home/builder/jailhouse-jailhouse-rt/git/driver/main.c:103:15: error: 
> 'lapic_timer_frequency' undeclared here (not in a function); did you mean 
> 'lapic_timer_period'?
>  static typeof(lapic_timer_frequency) *lapic_timer_frequency_sym;
>                ^~~~~~~~~~~~~~~~~~~~~
>                lapic_timer_period
>   CC [M]  /home/builder/jailhouse-jailhouse-rt/git/driver/pci.o
> make[4]: *** [scripts/Makefile.build:266: 
> /home/builder/jailhouse-jailhouse-rt/git/driver/main.o] Error 1
>
[..]
...fails

I have not yet looked deeper into the cause of the latter issue, because 
jailhose/next builds fine on my 5.3 Linux

cheers, Thorsten

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/46455211-7834-4791-b623-6c7278584b83%40googlegroups.com.

------=_Part_999_1029473544.1578731203287
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>Hej,</div><div><br></div><div>looking forward into tr=
ying out the ivshmem updates, however, I cannot build the (qemu-x86-64) ima=
ge. <br></div><div><br></div><div>First issue:=20
      recipes-kernel/linux/linux-jailhouse-rt_5.4.5.bb seems missing after =
<a href=3D"https://github.com/siemens/jailhouse-images/commit/359f3b6">late=
st commit</a>. So `./build-images.sh` results in:</div><div><br></div><div>=
[..]</div><div><blockquote class=3D"gmail_quote" style=3D"margin: 0px 0px 0=
px 0.8ex; border-left: 1px solid rgb(204, 204, 204); padding-left: 1ex;">ER=
ROR: Nothing PROVIDES &#39;linux-image-jailhouse&#39; (but mc:qemu-amd64-ja=
ilhouse-demo:/repo/recipes-core/images/demo-image.bb, mc:qemu-amd64-jailhou=
se-demo:/repo/recipes-jailhouse/jailhouse/jailhouse_0.11.bb DEPENDS on or o=
therwise requires it). Close matches:<br>=C2=A0 linux-image-jailhouse-rt<br=
>=C2=A0 linux-jailhouse-rt<br>=C2=A0 linux-headers-jailhouse-rt<br></blockq=
uote>[..]</div><div><br></div><div>If I go for `./build-images.sh --rt` to =
get the preemt-rt build, the kernel-build log throws:</div><div><br></div><=
div>ERROR: mc:qemu-amd64-jailhouse-demo:jailhouse-jailhouse-rt-0.11-r0 do_d=
pkg_build: Error executing a python function in exec_python_func() autogene=
rated:<br>[..]</div><div><blockquote class=3D"gmail_quote" style=3D"margin:=
 0px 0px 0px 0.8ex; border-left: 1px solid rgb(204, 204, 204); padding-left=
: 1ex;">Exception: bb.process.ExecutionError: Execution of &#39;/work/build=
/tmp/work/jailhouse-demo-amd64/jailhouse-jailhouse-rt/0.11-r0/temp/run.dpkg=
_runbuild.517003&#39; failed with exit code 2:<br>dpkg-buildpackage: info: =
source package jailhouse-jailhouse-rt<br>dpkg-buildpackage: info: source ve=
rsion 0.11<br>dpkg-buildpackage: info: source distribution UNRELEASED<br>dp=
kg-buildpackage: info: source changed by Unknown maintainer &lt;unknown@exa=
mple.com&gt;<br>=C2=A0dpkg-source -I --before-build .<br>dpkg-buildpackage:=
 info: host architecture amd64<br>=C2=A0fakeroot debian/rules clean<br>CFLA=
GS=3D LDFLAGS=3D dh clean --parallel --with python2<br>=C2=A0=C2=A0 dh_auto=
_clean -O--parallel<br>=C2=A0=C2=A0=C2=A0 make -j8 clean<br>make[1]: Enteri=
ng directory &#39;/home/builder/jailhouse-jailhouse-rt/git&#39;<br>make[1]:=
 Leaving directory &#39;/home/builder/jailhouse-jailhouse-rt/git&#39;<br>=
=C2=A0=C2=A0 dh_clean -O--parallel<br>=C2=A0dpkg-source -I -b .<br>dpkg-sou=
rce: warning: no source format specified in debian/source/format, see dpkg-=
source(1)<br>dpkg-source: warning: source directory &#39;git&#39; is not &l=
t;sourcepackage&gt;-&lt;upstreamversion&gt; &#39;jailhouse-jailhouse-rt-0.1=
1&#39;<br>dpkg-source: info: using source format &#39;1.0&#39;<br>dpkg-sour=
ce: info: building jailhouse-jailhouse-rt in jailhouse-jailhouse-rt_0.11.ta=
r.gz<br>dpkg-source: info: building jailhouse-jailhouse-rt in jailhouse-jai=
lhouse-rt_0.11.dsc<br>=C2=A0debian/rules build<br>CFLAGS=3D LDFLAGS=3D dh b=
uild --parallel --with python2<br>=C2=A0=C2=A0 dh_update_autotools_config -=
O--parallel<br>=C2=A0=C2=A0 dh_auto_configure -O--parallel<br>=C2=A0=C2=A0 =
dh_auto_build -O--parallel<br>=C2=A0=C2=A0=C2=A0 make -j8<br>make[1]: Enter=
ing directory &#39;/home/builder/jailhouse-jailhouse-rt/git&#39;<br>=C2=A0 =
GEN=C2=A0=C2=A0=C2=A0=C2=A0 /home/builder/jailhouse-jailhouse-rt/git/pyjail=
house/pci_defs.py<br>=C2=A0 UPD=C2=A0=C2=A0=C2=A0=C2=A0 /home/builder/jailh=
ouse-jailhouse-rt/git/hypervisor/include/generated/config.mk<br>=C2=A0 CC=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 /home/builder/jailhouse-jailhouse-rt/git/inm=
ates/lib/x86/../alloc.o<br>=C2=A0 CC=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 /home/bu=
ilder/jailhouse-jailhouse-rt/git/inmates/lib/x86/../cmdline.o<br>=C2=A0 CC=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 /home/builder/jailhouse-jailhouse-rt/git/inm=
ates/lib/x86/../pci.o<br>=C2=A0 CC=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 /home/buil=
der/jailhouse-jailhouse-rt/git/inmates/lib/x86/../printk.o<br>=C2=A0 CC=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0 /home/builder/jailhouse-jailhouse-rt/git/inmate=
s/lib/x86/../setup.o<br>=C2=A0 CC=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 /home/build=
er/jailhouse-jailhouse-rt/git/configs/x86/apic-demo.o<br>=C2=A0 UPD=C2=A0=
=C2=A0=C2=A0=C2=A0 /home/builder/jailhouse-jailhouse-rt/git/hypervisor/incl=
ude/generated/version.h<br>=C2=A0 CC=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 /home/bu=
ilder/jailhouse-jailhouse-rt/git/inmates/lib/x86/../string.o<br>=C2=A0 CC=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 /home/builder/jailhouse-jailhouse-rt/git/con=
figs/x86/e1000-demo.o<br>=C2=A0 CC=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 /home/buil=
der/jailhouse-jailhouse-rt/git/inmates/lib/x86/../test.o<br>=C2=A0 CC=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0 /home/builder/jailhouse-jailhouse-rt/git/inmates/l=
ib/x86/../uart-8250.o<br>=C2=A0 CC=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 /home/buil=
der/jailhouse-jailhouse-rt/git/configs/x86/f2a88xm-hd3.o<br>=C2=A0 CC=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0 /home/builder/jailhouse-jailhouse-rt/git/inmates/l=
ib/x86/cpu-features.o<br>=C2=A0 CC=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 /home/buil=
der/jailhouse-jailhouse-rt/git/configs/x86/imb-a180.o<br>=C2=A0 CC=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0 /home/builder/jailhouse-jailhouse-rt/git/configs/x86/=
ioapic-demo.o<br>=C2=A0 AS=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 /home/builder/jail=
house-jailhouse-rt/git/inmates/lib/x86/header-64.o<br>=C2=A0 CC=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0 /home/builder/jailhouse-jailhouse-rt/git/inmates/lib/x86=
/excp.o<br>scripts/Makefile.build:57: &#39;/home/builder/jailhouse-jailhous=
e-rt/git/driver/jailhouse.ko&#39; will not be built even though obj-m is sp=
ecified.<br>scripts/Makefile.build:58: You cannot use subdir-y/m to visit a=
 module Makefile. Use obj-y/m instead.<br>=C2=A0 CC [M]=C2=A0 /home/builder=
/jailhouse-jailhouse-rt/git/driver/cell.o<br>=C2=A0 AS=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 /home/builder/jailhouse-jailhouse-rt/git/inmates/lib/x86/header-c=
ommon.o<br>=C2=A0 CC=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 /home/builder/jailhouse-=
jailhouse-rt/git/configs/x86/ivshmem-demo.o<br>=C2=A0 CC=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 /home/builder/jailhouse-jailhouse-rt/git/hypervisor/arch/x86/a=
sm-defines.s<br>=C2=A0 LDS=C2=A0=C2=A0=C2=A0=C2=A0 /home/builder/jailhouse-=
jailhouse-rt/git/hypervisor/hypervisor.lds<br>=C2=A0 CC=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 /home/builder/jailhouse-jailhouse-rt/git/hypervisor/setup.o<br=
>=C2=A0 CC=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 /home/builder/jailhouse-jailhouse-=
rt/git/hypervisor/printk.o<br>=C2=A0 CC=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 /home=
/builder/jailhouse-jailhouse-rt/git/inmates/lib/x86/int.o<br>=C2=A0 CC=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0 /home/builder/jailhouse-jailhouse-rt/git/config=
s/x86/linux-nuc6cay-demo.o<br>=C2=A0 CC=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 /home=
/builder/jailhouse-jailhouse-rt/git/configs/x86/linux-x86-demo.o<br>=C2=A0 =
CC=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 /home/builder/jailhouse-jailhouse-rt/git/i=
nmates/lib/x86/ioapic.o<br>=C2=A0 CC [M]=C2=A0 /home/builder/jailhouse-jail=
house-rt/git/driver/main.o<br>=C2=A0 CC [M]=C2=A0 /home/builder/jailhouse-j=
ailhouse-rt/git/driver/sysfs.o<br>=C2=A0 CC=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 /=
home/builder/jailhouse-jailhouse-rt/git/configs/x86/nuc6cay.o<br>/home/buil=
der/jailhouse-jailhouse-rt/git/configs/x86/nuc6cay.c:39: warning: &quot;ARR=
AY_SIZE&quot; redefined<br>=C2=A0#define ARRAY_SIZE(a) (sizeof(a) / sizeof(=
(a)[0]))<br>=C2=A0<br>In file included from /home/builder/jailhouse-jailhou=
se-rt/git/configs/x86/nuc6cay.c:37:<br>/home/builder/jailhouse-jailhouse-rt=
/git/configs/../include/jailhouse/cell-config.h:46: note: this is the locat=
ion of the previous definition<br>=C2=A0#define ARRAY_SIZE(a) sizeof(a) / s=
izeof(a[0])<br>=C2=A0<br>=C2=A0 CC=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 /home/buil=
der/jailhouse-jailhouse-rt/git/inmates/lib/x86/mem.o<br>=C2=A0 CC=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0 /home/builder/jailhouse-jailhouse-rt/git/configs/x86/=
pci-demo.o<br>=C2=A0 CC=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 /home/builder/jailhou=
se-jailhouse-rt/git/hypervisor/paging.o<br>=C2=A0 CC=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 /home/builder/jailhouse-jailhouse-rt/git/inmates/lib/x86/pci.o<br=
>=C2=A0 CC=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 /home/builder/jailhouse-jailhouse-=
rt/git/inmates/lib/x86/printk.o<br>=C2=A0 CC=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 =
/home/builder/jailhouse-jailhouse-rt/git/configs/x86/qemu-x86.o<br>=C2=A0 C=
C=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 /home/builder/jailhouse-jailhouse-rt/git/in=
mates/lib/x86/setup.o<br>=C2=A0 CC=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 /home/buil=
der/jailhouse-jailhouse-rt/git/hypervisor/control.o<br>=C2=A0 CC=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0 /home/builder/jailhouse-jailhouse-rt/git/configs/x86/=
smp-demo.o<br>=C2=A0 CC=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 /home/builder/jailhou=
se-jailhouse-rt/git/inmates/lib/x86/smp.o<br>=C2=A0 CC=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 /home/builder/jailhouse-jailhouse-rt/git/configs/x86/tiny-demo.o<=
br>=C2=A0 CC=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 /home/builder/jailhouse-jailhous=
e-rt/git/inmates/lib/x86/timing.o<br>=C2=A0 OBJCOPY /home/builder/jailhouse=
-jailhouse-rt/git/configs/x86/apic-demo.cell<br>=C2=A0 OBJCOPY /home/builde=
r/jailhouse-jailhouse-rt/git/configs/x86/e1000-demo.cell<br>=C2=A0 OBJCOPY =
/home/builder/jailhouse-jailhouse-rt/git/configs/x86/f2a88xm-hd3.cell<br>=
=C2=A0 OBJCOPY /home/builder/jailhouse-jailhouse-rt/git/configs/x86/imb-a18=
0.cell<br>=C2=A0 OBJCOPY /home/builder/jailhouse-jailhouse-rt/git/configs/x=
86/ioapic-demo.cell<br>=C2=A0 OBJCOPY /home/builder/jailhouse-jailhouse-rt/=
git/configs/x86/ivshmem-demo.cell<br>=C2=A0 OBJCOPY /home/builder/jailhouse=
-jailhouse-rt/git/configs/x86/linux-nuc6cay-demo.cell<br>=C2=A0 OBJCOPY /ho=
me/builder/jailhouse-jailhouse-rt/git/configs/x86/linux-x86-demo.cell<br>=
=C2=A0 OBJCOPY /home/builder/jailhouse-jailhouse-rt/git/configs/x86/nuc6cay=
.cell<br>=C2=A0 OBJCOPY /home/builder/jailhouse-jailhouse-rt/git/configs/x8=
6/pci-demo.cell<br>=C2=A0 OBJCOPY /home/builder/jailhouse-jailhouse-rt/git/=
configs/x86/qemu-x86.cell<br>=C2=A0 OBJCOPY /home/builder/jailhouse-jailhou=
se-rt/git/configs/x86/smp-demo.cell<br>=C2=A0 OBJCOPY /home/builder/jailhou=
se-jailhouse-rt/git/configs/x86/tiny-demo.cell<br>=C2=A0 CC=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 /home/builder/jailhouse-jailhouse-rt/git/hypervisor/lib.o<b=
r>=C2=A0 CC=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 /home/builder/jailhouse-jailhouse=
-rt/git/hypervisor/mmio.o<br>=C2=A0 CC=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 /home/=
builder/jailhouse-jailhouse-rt/git/inmates/lib/x86/uart.o<br>=C2=A0 CC=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0 /home/builder/jailhouse-jailhouse-rt/git/hyperv=
isor/pci.o<br>=C2=A0 CC=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 /home/builder/jailhou=
se-jailhouse-rt/git/inmates/lib/x86/cpu-features-32.o<br>/home/builder/jail=
house-jailhouse-rt/git/driver/main.c:103:15: error: &#39;lapic_timer_freque=
ncy&#39; undeclared here (not in a function); did you mean &#39;lapic_timer=
_period&#39;?<br>=C2=A0static typeof(lapic_timer_frequency) *lapic_timer_fr=
equency_sym;<br>=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0 ^~~~~~~~~~~~~~~~~~~~~<br>=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 lapic_timer=
_period<br>=C2=A0 CC [M]=C2=A0 /home/builder/jailhouse-jailhouse-rt/git/dri=
ver/pci.o<br>make[4]: *** [scripts/Makefile.build:266: /home/builder/jailho=
use-jailhouse-rt/git/driver/main.o] Error 1<br></blockquote>[..]</div><div>=
...fails</div><div><br></div><div>I have not yet looked deeper into the cau=
se of the latter issue, because jailhose/next builds fine on my 5.3 Linux<b=
r></div><div><br></div><div>cheers, Thorsten<br></div></div>

<p></p>

-- <br />
You received this message because you are subscribed to the Google Groups &=
quot;Jailhouse&quot; group.<br />
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to <a href=3D"mailto:jailhouse-dev+unsubscribe@googlegroups.com">jailh=
ouse-dev+unsubscribe@googlegroups.com</a>.<br />
To view this discussion on the web visit <a href=3D"https://groups.google.c=
om/d/msgid/jailhouse-dev/46455211-7834-4791-b623-6c7278584b83%40googlegroup=
s.com?utm_medium=3Demail&utm_source=3Dfooter">https://groups.google.com/d/m=
sgid/jailhouse-dev/46455211-7834-4791-b623-6c7278584b83%40googlegroups.com<=
/a>.<br />

------=_Part_999_1029473544.1578731203287--

------=_Part_998_1169982278.1578731203287--
