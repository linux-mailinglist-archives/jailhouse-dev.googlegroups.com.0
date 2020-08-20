Return-Path: <jailhouse-dev+bncBCI7XTXZ6ADBBYHO7L4QKGQEB3XV3BA@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-qt1-x83e.google.com (mail-qt1-x83e.google.com [IPv6:2607:f8b0:4864:20::83e])
	by mail.lfdr.de (Postfix) with ESMTPS id 37E0424C4D0
	for <lists+jailhouse-dev@lfdr.de>; Thu, 20 Aug 2020 19:48:18 +0200 (CEST)
Received: by mail-qt1-x83e.google.com with SMTP id w15sf2061200qtv.11
        for <lists+jailhouse-dev@lfdr.de>; Thu, 20 Aug 2020 10:48:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:date:from:to:message-id:subject:mime-version
         :x-original-sender:precedence:mailing-list:list-id:list-post
         :list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=B9TboIJQtvtbeB2sn83/NmMs+TzhQ3S1fIsjmIh36xU=;
        b=qF++y1I65QwbCiL9Ovcf7z2sPUjCS1szGypsB8LRK4LFzHeVT9YIY+41U54t1Q0inx
         5xQM8LNj92W6RjOl/e8k1bRAMpsUng+LmNRwSznWkGDqO8wGkCNx/jkyIXqiV5KzGz4f
         C+xRlDh7mHBLoNlpSZdgb702RdAKjurS1QHssrmUL/wfzo9pMtCq64NJ45AnNrkPEP00
         CNalEfhfzBCcrRKS6bGgA/SnCXYlSGWK/9fUJVMiLPrBv4q52V2xR7Iv31PCGAhs9KTl
         XILS1rnuCx7j+GRpcIMFInIQvYJd9QtLAs4qmJ8GR/azwFR5YnTsyIAAyY9zIJ/C53+V
         kBGA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:message-id:subject:mime-version:x-original-sender
         :precedence:mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=B9TboIJQtvtbeB2sn83/NmMs+TzhQ3S1fIsjmIh36xU=;
        b=OJZAdV/YTFYBu9M6RyyJiYgE3eAVv+pHKR2ldj9amvMoo7kbmV/XFyn3RF8I1VjB5l
         6cqlTrew5O4qEPX+liv7pNmZZYON1nZAvchkfKTpzE9KBs/y/RfQg6XHUCcrNDyvsE3x
         eSwJ0b/xHHqo7uIIxyrPH0w7rtNUFiDgpuWVG/oLweOzwQGDNf/JIP3NAIkiJpvCzdPz
         TPIqj2H5UQfhRjJEfW7yQwLEX6qLtcyoN+YHLBjr5DI1CLDwPvNxOV43GmI2hFGcPUnb
         +39b42rohi/SCihQCP+7dRCdlRkQf54IBc7zogIPhjJOMtwD/wxPSKQDqp8XJL+9r1Sa
         RwXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:date:from:to:message-id:subject
         :mime-version:x-original-sender:precedence:mailing-list:list-id
         :x-spam-checked-in-group:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=B9TboIJQtvtbeB2sn83/NmMs+TzhQ3S1fIsjmIh36xU=;
        b=WKcAYUHI7UllExdgVOzLATam5WQLZfbQKL2vO9zHyoCAowPy+F4cuhxAMur5SWtZde
         DIOQ1PDwFRgMo2S/INETvdEfxWlkbqJ0qPJQtZUVoLh+u/XBJxjXF1I4n9zYjxv8i1NX
         +/mkJ0J0i5lihucjV4Leb7aqS5z3+iucdMQw1GMHpQCWri9Rz6RKU2yCxEUYqO+6Jw8N
         moGtL/Zja81/tpMfCicYhMuwTAtYRyG262wuivEko08ONudIm3QIbv8hJSaN28ghyzoY
         m0HBED+UfU1nMwdWyMKgpLkAlvAWwEhYvRJU79/kfgBvM29CuTWjCMkPxAyw6CSC2JvX
         Fs7Q==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AOAM531Cd0D9+Kl2fPn8Me2rUZ3LHj6phVYiezyhFaL0vVy8BTsWHYHk
	1sFG3v0e8naFNQsohGKZatY=
X-Google-Smtp-Source: ABdhPJwyLxX9eStAVoEh4Q71zIkb34EBYJfnxkLL4vS3UT01aTpqEASZ2Ju4/3hJTi2hLFRy2hHaUg==
X-Received: by 2002:ad4:414b:: with SMTP id z11mr3965549qvp.116.1597945696965;
        Thu, 20 Aug 2020 10:48:16 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:ac8:34dd:: with SMTP id x29ls126376qtb.6.gmail; Thu, 20 Aug
 2020 10:48:16 -0700 (PDT)
X-Received: by 2002:ac8:fc2:: with SMTP id f2mr3661808qtk.342.1597945696304;
        Thu, 20 Aug 2020 10:48:16 -0700 (PDT)
Date: Thu, 20 Aug 2020 10:48:15 -0700 (PDT)
From: stranzjanmarc@gmail.com
To: Jailhouse <jailhouse-dev@googlegroups.com>
Message-Id: <bccfc16d-0fb3-47e7-8a25-9c85ebf4b5e6o@googlegroups.com>
Subject: Build jailhouse on embedded target
MIME-Version: 1.0
Content-Type: multipart/mixed; 
	boundary="----=_Part_2023_331759789.1597945695388"
X-Original-Sender: stranzjanmarc@gmail.com
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

------=_Part_2023_331759789.1597945695388
Content-Type: multipart/alternative; 
	boundary="----=_Part_2024_448205311.1597945695389"

------=_Part_2024_448205311.1597945695389
Content-Type: text/plain; charset="UTF-8"

I have an "embedded" target with a dual core Q7 CPU module.
For this target I created a BSP (Linux kernel, root FS incl. compiler, 
kernel sources) with the help of Yocto.
(make: 4.2.1, gcc: 8.3.0, linux kernel: 4.14.111)

If I run "make -k", I get the following errors:

...
make[3]: *** No rule to make target 
'/gins/data/Jailhouse/jailhouse.git/driver/cell.o', needed by 
'/gins/data/Jailhouse/jailhouse.git/driver/jailhouse.o'.
make[3]: *** No rule to make target 
'/gins/data/Jailhouse/jailhouse.git/driver/main.o', needed by 
'/gins/data/Jailhouse/jailhouse.git/driver/jailhouse.o'.
make[3]: *** No rule to make target 
'/gins/data/Jailhouse/jailhouse.git/driver/sysfs.o', needed by 
'/gins/data/Jailhouse/jailhouse.git/driver/jailhouse.o'.
make[3]: *** No rule to make target 
'/gins/data/Jailhouse/jailhouse.git/driver/pci.o', needed by 
'/gins/data/Jailhouse/jailhouse.git/driver/jailhouse.o'.
make[3]: Target '__build' not remade because of errors.
make[2]: *** [scripts/Makefile.build:585: 
/gins/data/Jailhouse/jailhouse.git/driver] Error 2
...

I think that somehow concerns the topic "build kernel module out of tree".

The build process works fine on a Linux PC with Ubuntu.
So there must be something missing in the root FS ...

Unfortunately, I am not so familiar with this topic, hence my question for 
a hint.

Jan.

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/bccfc16d-0fb3-47e7-8a25-9c85ebf4b5e6o%40googlegroups.com.

------=_Part_2024_448205311.1597945695389
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>I have an &quot;embedded&quot; target with a dual cor=
e Q7 CPU module.</div><div>For this target I created a BSP (Linux kernel, r=
oot FS incl. compiler, kernel sources) with the help of Yocto.</div><div><d=
iv>(make: 4.2.1, gcc: 8.3.0, linux kernel: 4.14.111)<br></div><div><br></di=
v></div><div>If I run &quot;make -k&quot;, I get the following errors:</div=
><div><br></div><div><span style=3D"font-family: courier new, monospace;">.=
..<br></span></div><div><span style=3D"font-family: courier new, monospace;=
">make[3]: *** No rule to make target &#39;/gins/data/Jailhouse/jailhouse.g=
it/driver/cell.o&#39;, needed by &#39;/gins/data/Jailhouse/jailhouse.git/dr=
iver/jailhouse.o&#39;.<br>make[3]: *** No rule to make target &#39;/gins/da=
ta/Jailhouse/jailhouse.git/driver/main.o&#39;, needed by &#39;/gins/data/Ja=
ilhouse/jailhouse.git/driver/jailhouse.o&#39;.<br>make[3]: *** No rule to m=
ake target &#39;/gins/data/Jailhouse/jailhouse.git/driver/sysfs.o&#39;, nee=
ded by &#39;/gins/data/Jailhouse/jailhouse.git/driver/jailhouse.o&#39;.<br>=
make[3]: *** No rule to make target &#39;/gins/data/Jailhouse/jailhouse.git=
/driver/pci.o&#39;, needed by &#39;/gins/data/Jailhouse/jailhouse.git/drive=
r/jailhouse.o&#39;.<br>make[3]: Target &#39;__build&#39; not remade because=
 of errors.<br>make[2]: *** [scripts/Makefile.build:585: /gins/data/Jailhou=
se/jailhouse.git/driver] Error 2</span></div><div><span style=3D"font-famil=
y: courier new, monospace;">...<br></span></div><div></div><br><div>I think=
 that somehow concerns the topic &quot;build kernel module out of tree&quot=
;.</div><div><br></div>The build process works fine on a Linux PC with Ubun=
tu.<br><div>So there must be something missing in the root FS ...</div><div=
><br></div><div></div><div><div>Unfortunately, I am not so familiar with th=
is topic, hence my question for a hint.</div><div><br></div><div></div><div=
>Jan.<br><br></div></div></div>

<p></p>

-- <br />
You received this message because you are subscribed to the Google Groups &=
quot;Jailhouse&quot; group.<br />
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to <a href=3D"mailto:jailhouse-dev+unsubscribe@googlegroups.com">jailh=
ouse-dev+unsubscribe@googlegroups.com</a>.<br />
To view this discussion on the web visit <a href=3D"https://groups.google.c=
om/d/msgid/jailhouse-dev/bccfc16d-0fb3-47e7-8a25-9c85ebf4b5e6o%40googlegrou=
ps.com?utm_medium=3Demail&utm_source=3Dfooter">https://groups.google.com/d/=
msgid/jailhouse-dev/bccfc16d-0fb3-47e7-8a25-9c85ebf4b5e6o%40googlegroups.co=
m</a>.<br />

------=_Part_2024_448205311.1597945695389--

------=_Part_2023_331759789.1597945695388
Content-Type: text/plain; charset=US-ASCII; name=make.log
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename=make.log
X-Attachment-Id: 5a89e423-1e4f-4baf-a529-32d3cd8422ff
Content-ID: <5a89e423-1e4f-4baf-a529-32d3cd8422ff>

  CHK     /gins/data/Jailhouse/jailhouse.git/hypervisor/include/generated/config.mk
  UPD     /gins/data/Jailhouse/jailhouse.git/hypervisor/include/generated/config.mk
  CC      /gins/data/Jailhouse/jailhouse.git/configs/x86/apic-demo.o
  OBJCOPY /gins/data/Jailhouse/jailhouse.git/configs/x86/apic-demo.cell
  CC      /gins/data/Jailhouse/jailhouse.git/configs/x86/e1000-demo.o
  OBJCOPY /gins/data/Jailhouse/jailhouse.git/configs/x86/e1000-demo.cell
  CC      /gins/data/Jailhouse/jailhouse.git/configs/x86/f2a88xm-hd3.o
  OBJCOPY /gins/data/Jailhouse/jailhouse.git/configs/x86/f2a88xm-hd3.cell
  CC      /gins/data/Jailhouse/jailhouse.git/configs/x86/imb-a180.o
  OBJCOPY /gins/data/Jailhouse/jailhouse.git/configs/x86/imb-a180.cell
  CC      /gins/data/Jailhouse/jailhouse.git/configs/x86/ioapic-demo.o
  OBJCOPY /gins/data/Jailhouse/jailhouse.git/configs/x86/ioapic-demo.cell
  CC      /gins/data/Jailhouse/jailhouse.git/configs/x86/ivshmem-demo.o
  OBJCOPY /gins/data/Jailhouse/jailhouse.git/configs/x86/ivshmem-demo.cell
  CC      /gins/data/Jailhouse/jailhouse.git/configs/x86/linux-x86-demo.o
  OBJCOPY /gins/data/Jailhouse/jailhouse.git/configs/x86/linux-x86-demo.cell
  CC      /gins/data/Jailhouse/jailhouse.git/configs/x86/pci-demo.o
  OBJCOPY /gins/data/Jailhouse/jailhouse.git/configs/x86/pci-demo.cell
  CC      /gins/data/Jailhouse/jailhouse.git/configs/x86/qemu-x86.o
  OBJCOPY /gins/data/Jailhouse/jailhouse.git/configs/x86/qemu-x86.cell
  CC      /gins/data/Jailhouse/jailhouse.git/configs/x86/smp-demo.o
  OBJCOPY /gins/data/Jailhouse/jailhouse.git/configs/x86/smp-demo.cell
  CC      /gins/data/Jailhouse/jailhouse.git/configs/x86/tiny-demo.o
  OBJCOPY /gins/data/Jailhouse/jailhouse.git/configs/x86/tiny-demo.cell
  CHK     /gins/data/Jailhouse/jailhouse.git/hypervisor/include/generated/version.h
  UPD     /gins/data/Jailhouse/jailhouse.git/hypervisor/include/generated/version.h
make[3]: *** No rule to make target '/gins/data/Jailhouse/jailhouse.git/driver/cell.o', needed by '/gins/data/Jailhouse/jailhouse.git/driver/jailhouse.o'.
make[3]: *** No rule to make target '/gins/data/Jailhouse/jailhouse.git/driver/main.o', needed by '/gins/data/Jailhouse/jailhouse.git/driver/jailhouse.o'.
make[3]: *** No rule to make target '/gins/data/Jailhouse/jailhouse.git/driver/sysfs.o', needed by '/gins/data/Jailhouse/jailhouse.git/driver/jailhouse.o'.
make[3]: *** No rule to make target '/gins/data/Jailhouse/jailhouse.git/driver/pci.o', needed by '/gins/data/Jailhouse/jailhouse.git/driver/jailhouse.o'.
make[3]: Target '__build' not remade because of errors.
make[2]: *** [scripts/Makefile.build:585: /gins/data/Jailhouse/jailhouse.git/driver] Error 2
  CC      /gins/data/Jailhouse/jailhouse.git/hypervisor/arch/x86/asm-defines.s
  GEN     /gins/data/Jailhouse/jailhouse.git/hypervisor/arch/x86/include/generated/asm/asm-defines.h
  CC      /gins/data/Jailhouse/jailhouse.git/hypervisor/arch/x86/svm.o
  CC      /gins/data/Jailhouse/jailhouse.git/hypervisor/arch/x86/amd_iommu.o
  AS      /gins/data/Jailhouse/jailhouse.git/hypervisor/arch/x86/svm-vmexit.o
  CC      /gins/data/Jailhouse/jailhouse.git/hypervisor/arch/x86/apic.o
  CC      /gins/data/Jailhouse/jailhouse.git/hypervisor/arch/x86/dbg-write.o
  AS      /gins/data/Jailhouse/jailhouse.git/hypervisor/arch/x86/entry.o
  CC      /gins/data/Jailhouse/jailhouse.git/hypervisor/arch/x86/setup.o
  CC      /gins/data/Jailhouse/jailhouse.git/hypervisor/arch/x86/control.o
  CC      /gins/data/Jailhouse/jailhouse.git/hypervisor/arch/x86/mmio.o
  CC      /gins/data/Jailhouse/jailhouse.git/hypervisor/arch/x86/iommu.o
  CC      /gins/data/Jailhouse/jailhouse.git/hypervisor/arch/x86/paging.o
  CC      /gins/data/Jailhouse/jailhouse.git/hypervisor/arch/x86/pci.o
  CC      /gins/data/Jailhouse/jailhouse.git/hypervisor/arch/x86/i8042.o
  CC      /gins/data/Jailhouse/jailhouse.git/hypervisor/arch/x86/vcpu.o
  CC      /gins/data/Jailhouse/jailhouse.git/hypervisor/arch/x86/efifb.o
  CC      /gins/data/Jailhouse/jailhouse.git/hypervisor/arch/x86/ivshmem.o
  CC      /gins/data/Jailhouse/jailhouse.git/hypervisor/arch/x86/ioapic.o
  AR      /gins/data/Jailhouse/jailhouse.git/hypervisor/arch/x86/lib-amd.a
  CC      /gins/data/Jailhouse/jailhouse.git/hypervisor/arch/x86/vmx.o
  CC      /gins/data/Jailhouse/jailhouse.git/hypervisor/arch/x86/vtd.o
  AS      /gins/data/Jailhouse/jailhouse.git/hypervisor/arch/x86/vmx-vmexit.o
  CC      /gins/data/Jailhouse/jailhouse.git/hypervisor/arch/x86/cat.o
  AR      /gins/data/Jailhouse/jailhouse.git/hypervisor/arch/x86/lib-intel.a
  LDS     /gins/data/Jailhouse/jailhouse.git/hypervisor/hypervisor.lds
  CC      /gins/data/Jailhouse/jailhouse.git/hypervisor/setup.o
  CC      /gins/data/Jailhouse/jailhouse.git/hypervisor/printk.o
  CC      /gins/data/Jailhouse/jailhouse.git/hypervisor/paging.o
  CC      /gins/data/Jailhouse/jailhouse.git/hypervisor/control.o
  CC      /gins/data/Jailhouse/jailhouse.git/hypervisor/lib.o
  CC      /gins/data/Jailhouse/jailhouse.git/hypervisor/mmio.o
  CC      /gins/data/Jailhouse/jailhouse.git/hypervisor/pci.o
  CC      /gins/data/Jailhouse/jailhouse.git/hypervisor/ivshmem.o
  CC      /gins/data/Jailhouse/jailhouse.git/hypervisor/uart.o
  CC      /gins/data/Jailhouse/jailhouse.git/hypervisor/uart-8250.o
  LD      /gins/data/Jailhouse/jailhouse.git/hypervisor/hypervisor-amd.o
  OBJCOPY /gins/data/Jailhouse/jailhouse.git/hypervisor/jailhouse-amd.bin
  LD      /gins/data/Jailhouse/jailhouse.git/hypervisor/hypervisor-intel.o
  OBJCOPY /gins/data/Jailhouse/jailhouse.git/hypervisor/jailhouse-intel.bin
  CC      /gins/data/Jailhouse/jailhouse.git/inmates/lib/x86/../alloc.o
  CC      /gins/data/Jailhouse/jailhouse.git/inmates/lib/x86/../cmdline.o
  CC      /gins/data/Jailhouse/jailhouse.git/inmates/lib/x86/../pci.o
  CC      /gins/data/Jailhouse/jailhouse.git/inmates/lib/x86/../printk.o
  CC      /gins/data/Jailhouse/jailhouse.git/inmates/lib/x86/../setup.o
  CC      /gins/data/Jailhouse/jailhouse.git/inmates/lib/x86/../string.o
  CC      /gins/data/Jailhouse/jailhouse.git/inmates/lib/x86/../test.o
  CC      /gins/data/Jailhouse/jailhouse.git/inmates/lib/x86/../uart-8250.o
  CC      /gins/data/Jailhouse/jailhouse.git/inmates/lib/x86/cpu-features.o
  CC      /gins/data/Jailhouse/jailhouse.git/inmates/lib/x86/excp.o
  AS      /gins/data/Jailhouse/jailhouse.git/inmates/lib/x86/header-64.o
  AS      /gins/data/Jailhouse/jailhouse.git/inmates/lib/x86/header-common.o
  CC      /gins/data/Jailhouse/jailhouse.git/inmates/lib/x86/ioapic.o
  CC      /gins/data/Jailhouse/jailhouse.git/inmates/lib/x86/irq.o
  CC      /gins/data/Jailhouse/jailhouse.git/inmates/lib/x86/mem.o
  CC      /gins/data/Jailhouse/jailhouse.git/inmates/lib/x86/pci.o
  CC      /gins/data/Jailhouse/jailhouse.git/inmates/lib/x86/printk.o
  CC      /gins/data/Jailhouse/jailhouse.git/inmates/lib/x86/setup.o
  CC      /gins/data/Jailhouse/jailhouse.git/inmates/lib/x86/smp.o
  CC      /gins/data/Jailhouse/jailhouse.git/inmates/lib/x86/timing.o
  CC      /gins/data/Jailhouse/jailhouse.git/inmates/lib/x86/uart.o
  AR      /gins/data/Jailhouse/jailhouse.git/inmates/lib/x86/lib.a
  CC      /gins/data/Jailhouse/jailhouse.git/inmates/lib/x86/cpu-features-32.o
  CC      /gins/data/Jailhouse/jailhouse.git/inmates/lib/x86/excp-32.o
  AS      /gins/data/Jailhouse/jailhouse.git/inmates/lib/x86/header-common-32.o
  CC      /gins/data/Jailhouse/jailhouse.git/inmates/lib/x86/irq-32.o
  CC      /gins/data/Jailhouse/jailhouse.git/inmates/lib/x86/ioapic-32.o
  CC      /gins/data/Jailhouse/jailhouse.git/inmates/lib/x86/printk-32.o
  CC      /gins/data/Jailhouse/jailhouse.git/inmates/lib/x86/setup-32.o
  CC      /gins/data/Jailhouse/jailhouse.git/inmates/lib/x86/uart-32.o
  CC      /gins/data/Jailhouse/jailhouse.git/inmates/lib/x86/../alloc-32.o
  CC      /gins/data/Jailhouse/jailhouse.git/inmates/lib/x86/../pci-32.o
  CC      /gins/data/Jailhouse/jailhouse.git/inmates/lib/x86/../string-32.o
  CC      /gins/data/Jailhouse/jailhouse.git/inmates/lib/x86/../cmdline-32.o
  CC      /gins/data/Jailhouse/jailhouse.git/inmates/lib/x86/../setup-32.o
  CC      /gins/data/Jailhouse/jailhouse.git/inmates/lib/x86/../test-32.o
  CC      /gins/data/Jailhouse/jailhouse.git/inmates/lib/x86/../uart-8250-32.o
  CC      /gins/data/Jailhouse/jailhouse.git/inmates/lib/x86/../printk-32.o
  AS      /gins/data/Jailhouse/jailhouse.git/inmates/lib/x86/header-32.o
  AR      /gins/data/Jailhouse/jailhouse.git/inmates/lib/x86/lib32.a
  CC      /gins/data/Jailhouse/jailhouse.git/inmates/demos/x86/tiny-demo.o
  LD      /gins/data/Jailhouse/jailhouse.git/inmates/demos/x86/tiny-demo-linked.o
  OBJCOPY /gins/data/Jailhouse/jailhouse.git/inmates/demos/x86/tiny-demo.bin
  CC      /gins/data/Jailhouse/jailhouse.git/inmates/demos/x86/apic-demo.o
  LD      /gins/data/Jailhouse/jailhouse.git/inmates/demos/x86/apic-demo-linked.o
  OBJCOPY /gins/data/Jailhouse/jailhouse.git/inmates/demos/x86/apic-demo.bin
  CC      /gins/data/Jailhouse/jailhouse.git/inmates/demos/x86/ioapic-demo.o
  LD      /gins/data/Jailhouse/jailhouse.git/inmates/demos/x86/ioapic-demo-linked.o
  OBJCOPY /gins/data/Jailhouse/jailhouse.git/inmates/demos/x86/ioapic-demo.bin
  CC      /gins/data/Jailhouse/jailhouse.git/inmates/demos/x86/32-bit-demo.o
  LD      /gins/data/Jailhouse/jailhouse.git/inmates/demos/x86/32-bit-demo-linked.o
  OBJCOPY /gins/data/Jailhouse/jailhouse.git/inmates/demos/x86/32-bit-demo.bin
  CC      /gins/data/Jailhouse/jailhouse.git/inmates/demos/x86/pci-demo.o
  LD      /gins/data/Jailhouse/jailhouse.git/inmates/demos/x86/pci-demo-linked.o
  OBJCOPY /gins/data/Jailhouse/jailhouse.git/inmates/demos/x86/pci-demo.bin
  CC      /gins/data/Jailhouse/jailhouse.git/inmates/demos/x86/e1000-demo.o
  LD      /gins/data/Jailhouse/jailhouse.git/inmates/demos/x86/e1000-demo-linked.o
  OBJCOPY /gins/data/Jailhouse/jailhouse.git/inmates/demos/x86/e1000-demo.bin
  CC      /gins/data/Jailhouse/jailhouse.git/inmates/demos/x86/../ivshmem-demo.o
  LD      /gins/data/Jailhouse/jailhouse.git/inmates/demos/x86/ivshmem-demo-linked.o
  OBJCOPY /gins/data/Jailhouse/jailhouse.git/inmates/demos/x86/ivshmem-demo.bin
  CC      /gins/data/Jailhouse/jailhouse.git/inmates/demos/x86/smp-demo.o
  LD      /gins/data/Jailhouse/jailhouse.git/inmates/demos/x86/smp-demo-linked.o
  OBJCOPY /gins/data/Jailhouse/jailhouse.git/inmates/demos/x86/smp-demo.bin
  CC      /gins/data/Jailhouse/jailhouse.git/inmates/tests/x86/mmio-access.o
  LD      /gins/data/Jailhouse/jailhouse.git/inmates/tests/x86/mmio-access-linked.o
  OBJCOPY /gins/data/Jailhouse/jailhouse.git/inmates/tests/x86/mmio-access.bin
  CC      /gins/data/Jailhouse/jailhouse.git/inmates/tests/x86/mmio-access-32.o
  LD      /gins/data/Jailhouse/jailhouse.git/inmates/tests/x86/mmio-access-32-linked.o
  OBJCOPY /gins/data/Jailhouse/jailhouse.git/inmates/tests/x86/mmio-access-32.bin
  CC      /gins/data/Jailhouse/jailhouse.git/inmates/tests/x86/sse-demo.o
  LD      /gins/data/Jailhouse/jailhouse.git/inmates/tests/x86/sse-demo-linked.o
  OBJCOPY /gins/data/Jailhouse/jailhouse.git/inmates/tests/x86/sse-demo.bin
  CC      /gins/data/Jailhouse/jailhouse.git/inmates/tests/x86/sse-demo-32.o
  LD      /gins/data/Jailhouse/jailhouse.git/inmates/tests/x86/sse-demo-32-linked.o
  OBJCOPY /gins/data/Jailhouse/jailhouse.git/inmates/tests/x86/sse-demo-32.bin
  CC      /gins/data/Jailhouse/jailhouse.git/inmates/tools/x86/linux-loader.o
  LD      /gins/data/Jailhouse/jailhouse.git/inmates/tools/x86/linux-loader-linked.o
  OBJCOPY /gins/data/Jailhouse/jailhouse.git/inmates/tools/x86/linux-loader.bin
  GEN     /gins/data/Jailhouse/jailhouse.git/pyjailhouse/pci_defs.py
  CC      /gins/data/Jailhouse/jailhouse.git/tools/jailhouse.o
  LD      /gins/data/Jailhouse/jailhouse.git/tools/jailhouse
  CC      /gins/data/Jailhouse/jailhouse.git/tools/ivshmem-demo.o
  LD      /gins/data/Jailhouse/jailhouse.git/tools/ivshmem-demo
  GEN     /gins/data/Jailhouse/jailhouse.git/tools/jailhouse-config-collect
  CC      /gins/data/Jailhouse/jailhouse.git/tools/jailhouse-gcov-extract.o
  LD      /gins/data/Jailhouse/jailhouse.git/tools/jailhouse-gcov-extract
  GEN     /gins/data/Jailhouse/jailhouse.git/tools/jailhouse.8
  GEN     /gins/data/Jailhouse/jailhouse.git/tools/jailhouse-cell.8
  GEN     /gins/data/Jailhouse/jailhouse.git/tools/jailhouse-enable.8
make[2]: Target '__build' not remade because of errors.
make[1]: *** [Makefile:1535: _module_/gins/data/Jailhouse/jailhouse.git] Error 2
make[1]: Target 'modules' not remade because of errors.
make: *** [Makefile:40: modules] Error 2
make: Target 'all' not remade because of errors.

------=_Part_2023_331759789.1597945695388--
