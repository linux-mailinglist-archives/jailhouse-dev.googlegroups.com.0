Return-Path: <jailhouse-dev+bncBCQ7HUU4XULBBDX3VDYAKGQED3RU5FY@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-oi1-x239.google.com (mail-oi1-x239.google.com [IPv6:2607:f8b0:4864:20::239])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E52012D32F
	for <lists+jailhouse-dev@lfdr.de>; Mon, 30 Dec 2019 19:10:24 +0100 (CET)
Received: by mail-oi1-x239.google.com with SMTP id x75sf14373368oix.3
        for <lists+jailhouse-dev@lfdr.de>; Mon, 30 Dec 2019 10:10:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:date:from:to:message-id:subject:mime-version
         :x-original-sender:precedence:mailing-list:list-id:list-post
         :list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=CYOJPLaAh046rb327DbG+NODE5gUz0rSEXgt1GSsQXg=;
        b=c3GQkmH5gvLPyXTG+WaLLM3VrUEQ7MzJjf7hHO1ef9Pb/TMVR34eftejawkBvtWkNO
         CbdAsbIuymrjJPw0KznYBkwlFL2jZbyJ03mSa3lcWMp8iGBb2DkLvNslitrYzGQ4KJSi
         8I1dl5RclJg3e786HXJzxAKflRrCx1QTEC6dmKwysQytVeTuBYx3lHGof7nYDFLyNtsL
         uPjXVLNXOojnECjGz2uHqBLwIQlR85f0ki4vfunPOeja2wm+SIOwV2GJINMuJgFVXB1e
         p8+FwA2P+TNtPSLF/+++MhunsIKIePU1gSlI8mipyvnWL6m2XEjLaoAat2T/Vlk1LD+P
         XpEA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:message-id:subject:mime-version:x-original-sender
         :precedence:mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=CYOJPLaAh046rb327DbG+NODE5gUz0rSEXgt1GSsQXg=;
        b=WlXPrsfJ6K4Hako5e77NOb9Cl5Jl9niATVkaKZsGVGG23qN90eqJeOwlLFtLTmm3/5
         f6NatatBES8RM5BeoQSXApxDSoeguetzgG2UAITpPixfBiEaNpQPVN5qy7zpK2CwYtgZ
         IYvbPWcfQgtJI9us05ckcgWJaTAYp+eSVLUjS91SVpQxANdqHgzngAyzUQ+2N+gLfrsi
         tWLI10YMd+5hEZwY7ws1py6+FbKQdB5kv0RppCOIw95p8OKSi/KKbu0BGBoh0iEkts9i
         cnAwPpCakagHmb/2J89yrAcWs7lRVTtx1FKKBJC23sqoqwdWPRELa4zmtzwkgaAKMvJk
         y3nA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:date:from:to:message-id:subject
         :mime-version:x-original-sender:precedence:mailing-list:list-id
         :x-spam-checked-in-group:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=CYOJPLaAh046rb327DbG+NODE5gUz0rSEXgt1GSsQXg=;
        b=Gq7XkZCxwfDnH0q8oSHROQHtSyj079D9eDCjfivq84F2xrtdrVWihka+EUFDrAc7T0
         xGRGCfzR8e12GZrAW0Cq4+aqDefJlbkq+hdyQAyGKkSKbDENIkDVaJpFNimKrBAc5nZ8
         GTX9yxDRT9L4uKiRgH5JBPypQ1pU0p/IBdYBTgAzk1OzIIUn9j8zSE7x6dReE5k3oXmq
         9BDfytTdmLyDG+U+ZrERNpDLbuVcXO2BLqu4O3YrLv/e+T7PfgkxQjpWlX0kpgyQ4/tO
         mBjVohvChxOwcWAQKA+BeNBRoW3S0etRKnem8DURh8znnBiAn+M3j7e1DQb8LnHS1ZT3
         vugQ==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: APjAAAUt0OHjjUfiFBY9h81lZH+KBKU5wP9sfNHuuA9qCaVI/87ep4hf
	eTO9Nrgt7WjluODxhrWwfqk=
X-Google-Smtp-Source: APXvYqxYWfowMjH9uzc93t0bTWRSnv3JiOZcYHvwE2VSkmFRVLLymQp8xrnOVMk2O5YcExuY3TNUYg==
X-Received: by 2002:a05:6830:147:: with SMTP id j7mr76755024otp.44.1577729422825;
        Mon, 30 Dec 2019 10:10:22 -0800 (PST)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:aca:895:: with SMTP id 143ls1463393oii.1.gmail; Mon, 30 Dec
 2019 10:10:22 -0800 (PST)
X-Received: by 2002:aca:568f:: with SMTP id k137mr137834oib.63.1577729422191;
        Mon, 30 Dec 2019 10:10:22 -0800 (PST)
Date: Mon, 30 Dec 2019 10:10:21 -0800 (PST)
From: Saroj Sapkota <samirroj2016@gmail.com>
To: Jailhouse <jailhouse-dev@googlegroups.com>
Message-Id: <bb275f41-32a7-4ed0-96ba-c37bdd951a23@googlegroups.com>
Subject: installing jailhouse
MIME-Version: 1.0
Content-Type: multipart/mixed; 
	boundary="----=_Part_2717_1281604849.1577729421532"
X-Original-Sender: samirroj2016@gmail.com
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

------=_Part_2717_1281604849.1577729421532
Content-Type: multipart/alternative; 
	boundary="----=_Part_2718_1874153703.1577729421532"

------=_Part_2718_1874153703.1577729421532
Content-Type: text/plain; charset="UTF-8"

I download jailhouse 0.11 and try to make it by running command make and 
there is no .cell and .bin file for arm 64 the output of command is listed 
below.  Also running command for QEMU/KVM arm 64 it displays no linux image 
file. Can you help me fix this issue.
sarojs@engee-e121-d08:~/Downloads/jailhouse-0.11$ make
  CHK     
/home/sarojs/Downloads/jailhouse-0.11/hypervisor/include/generated/config.mk
  UPD     
/home/sarojs/Downloads/jailhouse-0.11/hypervisor/include/generated/config.mk
  CC      /home/sarojs/Downloads/jailhouse-0.11/configs/x86/apic-demo.o
  OBJCOPY /home/sarojs/Downloads/jailhouse-0.11/configs/x86/apic-demo.cell
  CC      /home/sarojs/Downloads/jailhouse-0.11/configs/x86/e1000-demo.o
  OBJCOPY /home/sarojs/Downloads/jailhouse-0.11/configs/x86/e1000-demo.cell
  CC      /home/sarojs/Downloads/jailhouse-0.11/configs/x86/f2a88xm-hd3.o
  OBJCOPY /home/sarojs/Downloads/jailhouse-0.11/configs/x86/f2a88xm-hd3.cell
  CC      /home/sarojs/Downloads/jailhouse-0.11/configs/x86/imb-a180.o
  OBJCOPY /home/sarojs/Downloads/jailhouse-0.11/configs/x86/imb-a180.cell
  CC      /home/sarojs/Downloads/jailhouse-0.11/configs/x86/ioapic-demo.o
  OBJCOPY /home/sarojs/Downloads/jailhouse-0.11/configs/x86/ioapic-demo.cell
  CC      /home/sarojs/Downloads/jailhouse-0.11/configs/x86/ivshmem-demo.o
  OBJCOPY 
/home/sarojs/Downloads/jailhouse-0.11/configs/x86/ivshmem-demo.cell
  CC      /home/sarojs/Downloads/jailhouse-0.11/configs/x86/linux-x86-demo.o
  OBJCOPY 
/home/sarojs/Downloads/jailhouse-0.11/configs/x86/linux-x86-demo.cell
  CC      /home/sarojs/Downloads/jailhouse-0.11/configs/x86/pci-demo.o
  OBJCOPY /home/sarojs/Downloads/jailhouse-0.11/configs/x86/pci-demo.cell
  CC      /home/sarojs/Downloads/jailhouse-0.11/configs/x86/qemu-x86.o
  OBJCOPY /home/sarojs/Downloads/jailhouse-0.11/configs/x86/qemu-x86.cell
  CC      /home/sarojs/Downloads/jailhouse-0.11/configs/x86/smp-demo.o
  OBJCOPY /home/sarojs/Downloads/jailhouse-0.11/configs/x86/smp-demo.cell
  CC      /home/sarojs/Downloads/jailhouse-0.11/configs/x86/tiny-demo.o
  OBJCOPY /home/sarojs/Downloads/jailhouse-0.11/configs/x86/tiny-demo.cell
  CHK     
/home/sarojs/Downloads/jailhouse-0.11/hypervisor/include/generated/version.h
  UPD     
/home/sarojs/Downloads/jailhouse-0.11/hypervisor/include/generated/version.h
  CC [M]  /home/sarojs/Downloads/jailhouse-0.11/driver/cell.o
  CC [M]  /home/sarojs/Downloads/jailhouse-0.11/driver/main.o
  CC [M]  /home/sarojs/Downloads/jailhouse-0.11/driver/sysfs.o
  CC [M]  /home/sarojs/Downloads/jailhouse-0.11/driver/pci.o
  LD [M]  /home/sarojs/Downloads/jailhouse-0.11/driver/jailhouse.o
  CC      
/home/sarojs/Downloads/jailhouse-0.11/hypervisor/arch/x86/asm-defines.s
  GEN     
/home/sarojs/Downloads/jailhouse-0.11/hypervisor/arch/x86/include/generated/asm/asm-defines.h
  CC      /home/sarojs/Downloads/jailhouse-0.11/hypervisor/arch/x86/svm.o
  CC      
/home/sarojs/Downloads/jailhouse-0.11/hypervisor/arch/x86/amd_iommu.o
  AS      
/home/sarojs/Downloads/jailhouse-0.11/hypervisor/arch/x86/svm-vmexit.o
  CC      /home/sarojs/Downloads/jailhouse-0.11/hypervisor/arch/x86/apic.o
  CC      
/home/sarojs/Downloads/jailhouse-0.11/hypervisor/arch/x86/dbg-write.o
  AS      /home/sarojs/Downloads/jailhouse-0.11/hypervisor/arch/x86/entry.o
  CC      /home/sarojs/Downloads/jailhouse-0.11/hypervisor/arch/x86/setup.o
  CC      
/home/sarojs/Downloads/jailhouse-0.11/hypervisor/arch/x86/control.o
  CC      /home/sarojs/Downloads/jailhouse-0.11/hypervisor/arch/x86/mmio.o
  CC      /home/sarojs/Downloads/jailhouse-0.11/hypervisor/arch/x86/iommu.o
  CC      /home/sarojs/Downloads/jailhouse-0.11/hypervisor/arch/x86/paging.o
  CC      /home/sarojs/Downloads/jailhouse-0.11/hypervisor/arch/x86/pci.o
  CC      /home/sarojs/Downloads/jailhouse-0.11/hypervisor/arch/x86/i8042.o
  CC      /home/sarojs/Downloads/jailhouse-0.11/hypervisor/arch/x86/vcpu.o
  CC      /home/sarojs/Downloads/jailhouse-0.11/hypervisor/arch/x86/efifb.o
  CC      
/home/sarojs/Downloads/jailhouse-0.11/hypervisor/arch/x86/ivshmem.o
  CC      /home/sarojs/Downloads/jailhouse-0.11/hypervisor/arch/x86/ioapic.o
  AR      
/home/sarojs/Downloads/jailhouse-0.11/hypervisor/arch/x86/lib-amd.a
  CC      /home/sarojs/Downloads/jailhouse-0.11/hypervisor/arch/x86/vmx.o
  CC      /home/sarojs/Downloads/jailhouse-0.11/hypervisor/arch/x86/vtd.o
  AS      
/home/sarojs/Downloads/jailhouse-0.11/hypervisor/arch/x86/vmx-vmexit.o
  CC      /home/sarojs/Downloads/jailhouse-0.11/hypervisor/arch/x86/cat.o
  AR      
/home/sarojs/Downloads/jailhouse-0.11/hypervisor/arch/x86/lib-intel.a
  LDS     /home/sarojs/Downloads/jailhouse-0.11/hypervisor/hypervisor.lds
  CC      /home/sarojs/Downloads/jailhouse-0.11/hypervisor/setup.o
  CC      /home/sarojs/Downloads/jailhouse-0.11/hypervisor/printk.o
  CC      /home/sarojs/Downloads/jailhouse-0.11/hypervisor/paging.o
  CC      /home/sarojs/Downloads/jailhouse-0.11/hypervisor/control.o
  CC      /home/sarojs/Downloads/jailhouse-0.11/hypervisor/lib.o
  CC      /home/sarojs/Downloads/jailhouse-0.11/hypervisor/mmio.o
  CC      /home/sarojs/Downloads/jailhouse-0.11/hypervisor/pci.o
  CC      /home/sarojs/Downloads/jailhouse-0.11/hypervisor/ivshmem.o
  CC      /home/sarojs/Downloads/jailhouse-0.11/hypervisor/uart.o
  CC      /home/sarojs/Downloads/jailhouse-0.11/hypervisor/uart-8250.o
  LD      /home/sarojs/Downloads/jailhouse-0.11/hypervisor/hypervisor-amd.o
  OBJCOPY /home/sarojs/Downloads/jailhouse-0.11/hypervisor/jailhouse-amd.bin
  LD      
/home/sarojs/Downloads/jailhouse-0.11/hypervisor/hypervisor-intel.o
  OBJCOPY 
/home/sarojs/Downloads/jailhouse-0.11/hypervisor/jailhouse-intel.bin
  CC      /home/sarojs/Downloads/jailhouse-0.11/inmates/lib/x86/../alloc.o
  CC      /home/sarojs/Downloads/jailhouse-0.11/inmates/lib/x86/../cmdline.o
  CC      /home/sarojs/Downloads/jailhouse-0.11/inmates/lib/x86/../pci.o
  CC      /home/sarojs/Downloads/jailhouse-0.11/inmates/lib/x86/../printk.o
  CC      /home/sarojs/Downloads/jailhouse-0.11/inmates/lib/x86/../setup.o
  CC      /home/sarojs/Downloads/jailhouse-0.11/inmates/lib/x86/../string.o
  CC      /home/sarojs/Downloads/jailhouse-0.11/inmates/lib/x86/../test.o
  CC      
/home/sarojs/Downloads/jailhouse-0.11/inmates/lib/x86/../uart-8250.o
  CC      
/home/sarojs/Downloads/jailhouse-0.11/inmates/lib/x86/cpu-features.o
  CC      /home/sarojs/Downloads/jailhouse-0.11/inmates/lib/x86/excp.o
  AS      /home/sarojs/Downloads/jailhouse-0.11/inmates/lib/x86/header-64.o
  AS      
/home/sarojs/Downloads/jailhouse-0.11/inmates/lib/x86/header-common.o
  CC      /home/sarojs/Downloads/jailhouse-0.11/inmates/lib/x86/int.o
  CC      /home/sarojs/Downloads/jailhouse-0.11/inmates/lib/x86/ioapic.o
  CC      /home/sarojs/Downloads/jailhouse-0.11/inmates/lib/x86/mem.o
  CC      /home/sarojs/Downloads/jailhouse-0.11/inmates/lib/x86/pci.o
  CC      /home/sarojs/Downloads/jailhouse-0.11/inmates/lib/x86/printk.o
  CC      /home/sarojs/Downloads/jailhouse-0.11/inmates/lib/x86/setup.o
  CC      /home/sarojs/Downloads/jailhouse-0.11/inmates/lib/x86/smp.o
  CC      /home/sarojs/Downloads/jailhouse-0.11/inmates/lib/x86/timing.o
  CC      /home/sarojs/Downloads/jailhouse-0.11/inmates/lib/x86/uart.o
  AR      /home/sarojs/Downloads/jailhouse-0.11/inmates/lib/x86/lib.a
  CC      
/home/sarojs/Downloads/jailhouse-0.11/inmates/lib/x86/cpu-features-32.o
  CC      /home/sarojs/Downloads/jailhouse-0.11/inmates/lib/x86/excp-32.o
  AS      
/home/sarojs/Downloads/jailhouse-0.11/inmates/lib/x86/header-common-32.o
  CC      /home/sarojs/Downloads/jailhouse-0.11/inmates/lib/x86/int-32.o
  CC      /home/sarojs/Downloads/jailhouse-0.11/inmates/lib/x86/ioapic-32.o
  CC      /home/sarojs/Downloads/jailhouse-0.11/inmates/lib/x86/printk-32.o
  CC      /home/sarojs/Downloads/jailhouse-0.11/inmates/lib/x86/setup-32.o
  CC      /home/sarojs/Downloads/jailhouse-0.11/inmates/lib/x86/uart-32.o
  CC      
/home/sarojs/Downloads/jailhouse-0.11/inmates/lib/x86/../alloc-32.o
  CC      /home/sarojs/Downloads/jailhouse-0.11/inmates/lib/x86/../pci-32.o
  CC      
/home/sarojs/Downloads/jailhouse-0.11/inmates/lib/x86/../string-32.o
  CC      
/home/sarojs/Downloads/jailhouse-0.11/inmates/lib/x86/../cmdline-32.o
  CC      
/home/sarojs/Downloads/jailhouse-0.11/inmates/lib/x86/../setup-32.o
  CC      /home/sarojs/Downloads/jailhouse-0.11/inmates/lib/x86/../test-32.o
  CC      
/home/sarojs/Downloads/jailhouse-0.11/inmates/lib/x86/../uart-8250-32.o
  CC      
/home/sarojs/Downloads/jailhouse-0.11/inmates/lib/x86/../printk-32.o
  AS      /home/sarojs/Downloads/jailhouse-0.11/inmates/lib/x86/header-32.o
  AR      /home/sarojs/Downloads/jailhouse-0.11/inmates/lib/x86/lib32.a
  CC      
/home/sarojs/Downloads/jailhouse-0.11/inmates/demos/x86/tiny-demo.o
  LD      
/home/sarojs/Downloads/jailhouse-0.11/inmates/demos/x86/tiny-demo-linked.o
  OBJCOPY 
/home/sarojs/Downloads/jailhouse-0.11/inmates/demos/x86/tiny-demo.bin
  CC      
/home/sarojs/Downloads/jailhouse-0.11/inmates/demos/x86/apic-demo.o
  LD      
/home/sarojs/Downloads/jailhouse-0.11/inmates/demos/x86/apic-demo-linked.o
  OBJCOPY 
/home/sarojs/Downloads/jailhouse-0.11/inmates/demos/x86/apic-demo.bin
  CC      
/home/sarojs/Downloads/jailhouse-0.11/inmates/demos/x86/ioapic-demo.o
  LD      
/home/sarojs/Downloads/jailhouse-0.11/inmates/demos/x86/ioapic-demo-linked.o
  OBJCOPY 
/home/sarojs/Downloads/jailhouse-0.11/inmates/demos/x86/ioapic-demo.bin
  CC      
/home/sarojs/Downloads/jailhouse-0.11/inmates/demos/x86/32-bit-demo.o
  LD      
/home/sarojs/Downloads/jailhouse-0.11/inmates/demos/x86/32-bit-demo-linked.o
  OBJCOPY 
/home/sarojs/Downloads/jailhouse-0.11/inmates/demos/x86/32-bit-demo.bin
  CC      /home/sarojs/Downloads/jailhouse-0.11/inmates/demos/x86/pci-demo.o
  LD      
/home/sarojs/Downloads/jailhouse-0.11/inmates/demos/x86/pci-demo-linked.o
  OBJCOPY 
/home/sarojs/Downloads/jailhouse-0.11/inmates/demos/x86/pci-demo.bin
  CC      
/home/sarojs/Downloads/jailhouse-0.11/inmates/demos/x86/e1000-demo.o
  LD      
/home/sarojs/Downloads/jailhouse-0.11/inmates/demos/x86/e1000-demo-linked.o
  OBJCOPY 
/home/sarojs/Downloads/jailhouse-0.11/inmates/demos/x86/e1000-demo.bin
  CC      
/home/sarojs/Downloads/jailhouse-0.11/inmates/demos/x86/ivshmem-demo.o
  LD      
/home/sarojs/Downloads/jailhouse-0.11/inmates/demos/x86/ivshmem-demo-linked.o
  OBJCOPY 
/home/sarojs/Downloads/jailhouse-0.11/inmates/demos/x86/ivshmem-demo.bin
  CC      /home/sarojs/Downloads/jailhouse-0.11/inmates/demos/x86/smp-demo.o
  LD      
/home/sarojs/Downloads/jailhouse-0.11/inmates/demos/x86/smp-demo-linked.o
  OBJCOPY 
/home/sarojs/Downloads/jailhouse-0.11/inmates/demos/x86/smp-demo.bin
  CC      
/home/sarojs/Downloads/jailhouse-0.11/inmates/tests/x86/mmio-access.o
  LD      
/home/sarojs/Downloads/jailhouse-0.11/inmates/tests/x86/mmio-access-linked.o
  OBJCOPY 
/home/sarojs/Downloads/jailhouse-0.11/inmates/tests/x86/mmio-access.bin
  CC      
/home/sarojs/Downloads/jailhouse-0.11/inmates/tests/x86/mmio-access-32.o
  LD      
/home/sarojs/Downloads/jailhouse-0.11/inmates/tests/x86/mmio-access-32-linked.o
  OBJCOPY 
/home/sarojs/Downloads/jailhouse-0.11/inmates/tests/x86/mmio-access-32.bin
  CC      /home/sarojs/Downloads/jailhouse-0.11/inmates/tests/x86/sse-demo.o
  LD      
/home/sarojs/Downloads/jailhouse-0.11/inmates/tests/x86/sse-demo-linked.o
  OBJCOPY 
/home/sarojs/Downloads/jailhouse-0.11/inmates/tests/x86/sse-demo.bin
  CC      
/home/sarojs/Downloads/jailhouse-0.11/inmates/tests/x86/sse-demo-32.o
  LD      
/home/sarojs/Downloads/jailhouse-0.11/inmates/tests/x86/sse-demo-32-linked.o
  OBJCOPY 
/home/sarojs/Downloads/jailhouse-0.11/inmates/tests/x86/sse-demo-32.bin
  CC      
/home/sarojs/Downloads/jailhouse-0.11/inmates/tools/x86/linux-loader.o
  LD      
/home/sarojs/Downloads/jailhouse-0.11/inmates/tools/x86/linux-loader-linked.o
  OBJCOPY 
/home/sarojs/Downloads/jailhouse-0.11/inmates/tools/x86/linux-loader.bin
  GEN     /home/sarojs/Downloads/jailhouse-0.11/pyjailhouse/pci_defs.py
  CC      /home/sarojs/Downloads/jailhouse-0.11/tools/jailhouse.o
  LD      /home/sarojs/Downloads/jailhouse-0.11/tools/jailhouse
  GEN     
/home/sarojs/Downloads/jailhouse-0.11/tools/jailhouse-config-collect
  CC      
/home/sarojs/Downloads/jailhouse-0.11/tools/jailhouse-gcov-extract.o
  LD      /home/sarojs/Downloads/jailhouse-0.11/tools/jailhouse-gcov-extract
  GEN     /home/sarojs/Downloads/jailhouse-0.11/tools/jailhouse.8
  GEN     /home/sarojs/Downloads/jailhouse-0.11/tools/jailhouse-cell.8
  GEN     /home/sarojs/Downloads/jailhouse-0.11/tools/jailhouse-enable.8
  Building modules, stage 2.
  MODPOST 1 modules
  CC      /home/sarojs/Downloads/jailhouse-0.11/driver/jailhouse.mod.o
  LD [M]  /home/sarojs/Downloads/jailhouse-0.11/driver/jailhouse.ko


sarojs@engee-e121-d08:~/Downloads$ qemu-system-aarch64 -cpu cortex-a57 -smp 
16 -m 1G \
>     -machine virt,gic-version=3,virtualization=on -nographic \
>     -netdev user,id=net -device virtio-net-device,netdev=net \
>     -drive 
file=LinuxInstallation.img,format=raw|qcow2|...,id=disk,if=none \
>     -device virtio-blk-device,drive=disk \
>     -kernel /path/to/kernel-image -append "root=/dev/vda1 mem=768M"
qcow2: command not found
...,id=disk,if=none: command not found
qemu-system-aarch64: -drive file=LinuxInstallation.img,format=raw: Could 
not open 'LinuxInstallation.img': No such file or directory
sarojs@engee-e121-d08:~/Downloads$ 

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/bb275f41-32a7-4ed0-96ba-c37bdd951a23%40googlegroups.com.

------=_Part_2718_1874153703.1577729421532
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>I download jailhouse 0.11 and try to make it by runni=
ng command make and there is no .cell and .bin file for arm 64 the output o=
f command is listed below.=C2=A0 Also running command for QEMU/KVM arm 64 i=
t displays no linux image file. Can you help me fix this issue.<br></div><d=
iv>sarojs@engee-e121-d08:~/Downloads/jailhouse-0.11$ make</div>=C2=A0 CHK=
=C2=A0=C2=A0=C2=A0=C2=A0 /home/sarojs/Downloads/jailhouse-0.11/hypervisor/i=
nclude/generated/config.mk<br>=C2=A0 UPD=C2=A0=C2=A0=C2=A0=C2=A0 /home/saro=
js/Downloads/jailhouse-0.11/hypervisor/include/generated/config.mk<br>=C2=
=A0 CC=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 /home/sarojs/Downloads/jailhouse-0.11/=
configs/x86/apic-demo.o<br>=C2=A0 OBJCOPY /home/sarojs/Downloads/jailhouse-=
0.11/configs/x86/apic-demo.cell<br>=C2=A0 CC=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 =
/home/sarojs/Downloads/jailhouse-0.11/configs/x86/e1000-demo.o<br>=C2=A0 OB=
JCOPY /home/sarojs/Downloads/jailhouse-0.11/configs/x86/e1000-demo.cell<br>=
=C2=A0 CC=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 /home/sarojs/Downloads/jailhouse-0.=
11/configs/x86/f2a88xm-hd3.o<br>=C2=A0 OBJCOPY /home/sarojs/Downloads/jailh=
ouse-0.11/configs/x86/f2a88xm-hd3.cell<br>=C2=A0 CC=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0 /home/sarojs/Downloads/jailhouse-0.11/configs/x86/imb-a180.o<br>=C2=
=A0 OBJCOPY /home/sarojs/Downloads/jailhouse-0.11/configs/x86/imb-a180.cell=
<br>=C2=A0 CC=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 /home/sarojs/Downloads/jailhous=
e-0.11/configs/x86/ioapic-demo.o<br>=C2=A0 OBJCOPY /home/sarojs/Downloads/j=
ailhouse-0.11/configs/x86/ioapic-demo.cell<br>=C2=A0 CC=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 /home/sarojs/Downloads/jailhouse-0.11/configs/x86/ivshmem-demo=
.o<br>=C2=A0 OBJCOPY /home/sarojs/Downloads/jailhouse-0.11/configs/x86/ivsh=
mem-demo.cell<br>=C2=A0 CC=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 /home/sarojs/Downl=
oads/jailhouse-0.11/configs/x86/linux-x86-demo.o<br>=C2=A0 OBJCOPY /home/sa=
rojs/Downloads/jailhouse-0.11/configs/x86/linux-x86-demo.cell<br>=C2=A0 CC=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 /home/sarojs/Downloads/jailhouse-0.11/config=
s/x86/pci-demo.o<br>=C2=A0 OBJCOPY /home/sarojs/Downloads/jailhouse-0.11/co=
nfigs/x86/pci-demo.cell<br>=C2=A0 CC=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 /home/sa=
rojs/Downloads/jailhouse-0.11/configs/x86/qemu-x86.o<br>=C2=A0 OBJCOPY /hom=
e/sarojs/Downloads/jailhouse-0.11/configs/x86/qemu-x86.cell<br>=C2=A0 CC=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0 /home/sarojs/Downloads/jailhouse-0.11/configs/x=
86/smp-demo.o<br>=C2=A0 OBJCOPY /home/sarojs/Downloads/jailhouse-0.11/confi=
gs/x86/smp-demo.cell<br>=C2=A0 CC=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 /home/saroj=
s/Downloads/jailhouse-0.11/configs/x86/tiny-demo.o<br>=C2=A0 OBJCOPY /home/=
sarojs/Downloads/jailhouse-0.11/configs/x86/tiny-demo.cell<br>=C2=A0 CHK=C2=
=A0=C2=A0=C2=A0=C2=A0 /home/sarojs/Downloads/jailhouse-0.11/hypervisor/incl=
ude/generated/version.h<br>=C2=A0 UPD=C2=A0=C2=A0=C2=A0=C2=A0 /home/sarojs/=
Downloads/jailhouse-0.11/hypervisor/include/generated/version.h<br>=C2=A0 C=
C [M]=C2=A0 /home/sarojs/Downloads/jailhouse-0.11/driver/cell.o<br>=C2=A0 C=
C [M]=C2=A0 /home/sarojs/Downloads/jailhouse-0.11/driver/main.o<br>=C2=A0 C=
C [M]=C2=A0 /home/sarojs/Downloads/jailhouse-0.11/driver/sysfs.o<br>=C2=A0 =
CC [M]=C2=A0 /home/sarojs/Downloads/jailhouse-0.11/driver/pci.o<br>=C2=A0 L=
D [M]=C2=A0 /home/sarojs/Downloads/jailhouse-0.11/driver/jailhouse.o<br>=C2=
=A0 CC=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 /home/sarojs/Downloads/jailhouse-0.11/=
hypervisor/arch/x86/asm-defines.s<br>=C2=A0 GEN=C2=A0=C2=A0=C2=A0=C2=A0 /ho=
me/sarojs/Downloads/jailhouse-0.11/hypervisor/arch/x86/include/generated/as=
m/asm-defines.h<br>=C2=A0 CC=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 /home/sarojs/Dow=
nloads/jailhouse-0.11/hypervisor/arch/x86/svm.o<br>=C2=A0 CC=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 /home/sarojs/Downloads/jailhouse-0.11/hypervisor/arch/x86/a=
md_iommu.o<br>=C2=A0 AS=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 /home/sarojs/Download=
s/jailhouse-0.11/hypervisor/arch/x86/svm-vmexit.o<br>=C2=A0 CC=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0 /home/sarojs/Downloads/jailhouse-0.11/hypervisor/arch/x8=
6/apic.o<br>=C2=A0 CC=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 /home/sarojs/Downloads/=
jailhouse-0.11/hypervisor/arch/x86/dbg-write.o<br>=C2=A0 AS=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 /home/sarojs/Downloads/jailhouse-0.11/hypervisor/arch/x86/e=
ntry.o<br>=C2=A0 CC=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 /home/sarojs/Downloads/ja=
ilhouse-0.11/hypervisor/arch/x86/setup.o<br>=C2=A0 CC=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 /home/sarojs/Downloads/jailhouse-0.11/hypervisor/arch/x86/control=
.o<br>=C2=A0 CC=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 /home/sarojs/Downloads/jailho=
use-0.11/hypervisor/arch/x86/mmio.o<br>=C2=A0 CC=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 /home/sarojs/Downloads/jailhouse-0.11/hypervisor/arch/x86/iommu.o<br>=
=C2=A0 CC=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 /home/sarojs/Downloads/jailhouse-0.=
11/hypervisor/arch/x86/paging.o<br>=C2=A0 CC=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 =
/home/sarojs/Downloads/jailhouse-0.11/hypervisor/arch/x86/pci.o<br>=C2=A0 C=
C=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 /home/sarojs/Downloads/jailhouse-0.11/hyper=
visor/arch/x86/i8042.o<br>=C2=A0 CC=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 /home/sar=
ojs/Downloads/jailhouse-0.11/hypervisor/arch/x86/vcpu.o<br>=C2=A0 CC=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0 /home/sarojs/Downloads/jailhouse-0.11/hypervisor/a=
rch/x86/efifb.o<br>=C2=A0 CC=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 /home/sarojs/Dow=
nloads/jailhouse-0.11/hypervisor/arch/x86/ivshmem.o<br>=C2=A0 CC=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0 /home/sarojs/Downloads/jailhouse-0.11/hypervisor/arch=
/x86/ioapic.o<br>=C2=A0 AR=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 /home/sarojs/Downl=
oads/jailhouse-0.11/hypervisor/arch/x86/lib-amd.a<br>=C2=A0 CC=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0 /home/sarojs/Downloads/jailhouse-0.11/hypervisor/arch/x8=
6/vmx.o<br>=C2=A0 CC=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 /home/sarojs/Downloads/j=
ailhouse-0.11/hypervisor/arch/x86/vtd.o<br>=C2=A0 AS=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 /home/sarojs/Downloads/jailhouse-0.11/hypervisor/arch/x86/vmx-vme=
xit.o<br>=C2=A0 CC=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 /home/sarojs/Downloads/jai=
lhouse-0.11/hypervisor/arch/x86/cat.o<br>=C2=A0 AR=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0 /home/sarojs/Downloads/jailhouse-0.11/hypervisor/arch/x86/lib-intel.=
a<br>=C2=A0 LDS=C2=A0=C2=A0=C2=A0=C2=A0 /home/sarojs/Downloads/jailhouse-0.=
11/hypervisor/hypervisor.lds<br>=C2=A0 CC=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 /ho=
me/sarojs/Downloads/jailhouse-0.11/hypervisor/setup.o<br>=C2=A0 CC=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0 /home/sarojs/Downloads/jailhouse-0.11/hypervisor/prin=
tk.o<br>=C2=A0 CC=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 /home/sarojs/Downloads/jail=
house-0.11/hypervisor/paging.o<br>=C2=A0 CC=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 /=
home/sarojs/Downloads/jailhouse-0.11/hypervisor/control.o<br>=C2=A0 CC=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0 /home/sarojs/Downloads/jailhouse-0.11/hyperviso=
r/lib.o<br>=C2=A0 CC=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 /home/sarojs/Downloads/j=
ailhouse-0.11/hypervisor/mmio.o<br>=C2=A0 CC=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 =
/home/sarojs/Downloads/jailhouse-0.11/hypervisor/pci.o<br>=C2=A0 CC=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0 /home/sarojs/Downloads/jailhouse-0.11/hypervisor/i=
vshmem.o<br>=C2=A0 CC=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 /home/sarojs/Downloads/=
jailhouse-0.11/hypervisor/uart.o<br>=C2=A0 CC=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
 /home/sarojs/Downloads/jailhouse-0.11/hypervisor/uart-8250.o<br>=C2=A0 LD=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 /home/sarojs/Downloads/jailhouse-0.11/hyperv=
isor/hypervisor-amd.o<br>=C2=A0 OBJCOPY /home/sarojs/Downloads/jailhouse-0.=
11/hypervisor/jailhouse-amd.bin<br>=C2=A0 LD=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 =
/home/sarojs/Downloads/jailhouse-0.11/hypervisor/hypervisor-intel.o<br>=C2=
=A0 OBJCOPY /home/sarojs/Downloads/jailhouse-0.11/hypervisor/jailhouse-inte=
l.bin<br>=C2=A0 CC=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 /home/sarojs/Downloads/jai=
lhouse-0.11/inmates/lib/x86/../alloc.o<br>=C2=A0 CC=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0 /home/sarojs/Downloads/jailhouse-0.11/inmates/lib/x86/../cmdline.o<b=
r>=C2=A0 CC=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 /home/sarojs/Downloads/jailhouse-=
0.11/inmates/lib/x86/../pci.o<br>=C2=A0 CC=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 /h=
ome/sarojs/Downloads/jailhouse-0.11/inmates/lib/x86/../printk.o<br>=C2=A0 C=
C=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 /home/sarojs/Downloads/jailhouse-0.11/inmat=
es/lib/x86/../setup.o<br>=C2=A0 CC=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 /home/saro=
js/Downloads/jailhouse-0.11/inmates/lib/x86/../string.o<br>=C2=A0 CC=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0 /home/sarojs/Downloads/jailhouse-0.11/inmates/lib/=
x86/../test.o<br>=C2=A0 CC=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 /home/sarojs/Downl=
oads/jailhouse-0.11/inmates/lib/x86/../uart-8250.o<br>=C2=A0 CC=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0 /home/sarojs/Downloads/jailhouse-0.11/inmates/lib/x86/cp=
u-features.o<br>=C2=A0 CC=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 /home/sarojs/Downlo=
ads/jailhouse-0.11/inmates/lib/x86/excp.o<br>=C2=A0 AS=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 /home/sarojs/Downloads/jailhouse-0.11/inmates/lib/x86/header-64.o=
<br>=C2=A0 AS=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 /home/sarojs/Downloads/jailhous=
e-0.11/inmates/lib/x86/header-common.o<br>=C2=A0 CC=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0 /home/sarojs/Downloads/jailhouse-0.11/inmates/lib/x86/int.o<br>=C2=
=A0 CC=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 /home/sarojs/Downloads/jailhouse-0.11/=
inmates/lib/x86/ioapic.o<br>=C2=A0 CC=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 /home/s=
arojs/Downloads/jailhouse-0.11/inmates/lib/x86/mem.o<br>=C2=A0 CC=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0 /home/sarojs/Downloads/jailhouse-0.11/inmates/lib/x86=
/pci.o<br>=C2=A0 CC=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 /home/sarojs/Downloads/ja=
ilhouse-0.11/inmates/lib/x86/printk.o<br>=C2=A0 CC=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0 /home/sarojs/Downloads/jailhouse-0.11/inmates/lib/x86/setup.o<br>=C2=
=A0 CC=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 /home/sarojs/Downloads/jailhouse-0.11/=
inmates/lib/x86/smp.o<br>=C2=A0 CC=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 /home/saro=
js/Downloads/jailhouse-0.11/inmates/lib/x86/timing.o<br>=C2=A0 CC=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0 /home/sarojs/Downloads/jailhouse-0.11/inmates/lib/x86=
/uart.o<br>=C2=A0 AR=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 /home/sarojs/Downloads/j=
ailhouse-0.11/inmates/lib/x86/lib.a<br>=C2=A0 CC=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 /home/sarojs/Downloads/jailhouse-0.11/inmates/lib/x86/cpu-features-32.o=
<br>=C2=A0 CC=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 /home/sarojs/Downloads/jailhous=
e-0.11/inmates/lib/x86/excp-32.o<br>=C2=A0 AS=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
 /home/sarojs/Downloads/jailhouse-0.11/inmates/lib/x86/header-common-32.o<b=
r>=C2=A0 CC=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 /home/sarojs/Downloads/jailhouse-=
0.11/inmates/lib/x86/int-32.o<br>=C2=A0 CC=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 /h=
ome/sarojs/Downloads/jailhouse-0.11/inmates/lib/x86/ioapic-32.o<br>=C2=A0 C=
C=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 /home/sarojs/Downloads/jailhouse-0.11/inmat=
es/lib/x86/printk-32.o<br>=C2=A0 CC=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 /home/sar=
ojs/Downloads/jailhouse-0.11/inmates/lib/x86/setup-32.o<br>=C2=A0 CC=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0 /home/sarojs/Downloads/jailhouse-0.11/inmates/lib/=
x86/uart-32.o<br>=C2=A0 CC=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 /home/sarojs/Downl=
oads/jailhouse-0.11/inmates/lib/x86/../alloc-32.o<br>=C2=A0 CC=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0 /home/sarojs/Downloads/jailhouse-0.11/inmates/lib/x86/..=
/pci-32.o<br>=C2=A0 CC=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 /home/sarojs/Downloads=
/jailhouse-0.11/inmates/lib/x86/../string-32.o<br>=C2=A0 CC=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 /home/sarojs/Downloads/jailhouse-0.11/inmates/lib/x86/../cm=
dline-32.o<br>=C2=A0 CC=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 /home/sarojs/Download=
s/jailhouse-0.11/inmates/lib/x86/../setup-32.o<br>=C2=A0 CC=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 /home/sarojs/Downloads/jailhouse-0.11/inmates/lib/x86/../te=
st-32.o<br>=C2=A0 CC=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 /home/sarojs/Downloads/j=
ailhouse-0.11/inmates/lib/x86/../uart-8250-32.o<br>=C2=A0 CC=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 /home/sarojs/Downloads/jailhouse-0.11/inmates/lib/x86/../pr=
intk-32.o<br>=C2=A0 AS=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 /home/sarojs/Downloads=
/jailhouse-0.11/inmates/lib/x86/header-32.o<br>=C2=A0 AR=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 /home/sarojs/Downloads/jailhouse-0.11/inmates/lib/x86/lib32.a<=
br>=C2=A0 CC=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 /home/sarojs/Downloads/jailhouse=
-0.11/inmates/demos/x86/tiny-demo.o<br>=C2=A0 LD=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 /home/sarojs/Downloads/jailhouse-0.11/inmates/demos/x86/tiny-demo-linke=
d.o<br>=C2=A0 OBJCOPY /home/sarojs/Downloads/jailhouse-0.11/inmates/demos/x=
86/tiny-demo.bin<br>=C2=A0 CC=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 /home/sarojs/Do=
wnloads/jailhouse-0.11/inmates/demos/x86/apic-demo.o<br>=C2=A0 LD=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0 /home/sarojs/Downloads/jailhouse-0.11/inmates/demos/x=
86/apic-demo-linked.o<br>=C2=A0 OBJCOPY /home/sarojs/Downloads/jailhouse-0.=
11/inmates/demos/x86/apic-demo.bin<br>=C2=A0 CC=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 /home/sarojs/Downloads/jailhouse-0.11/inmates/demos/x86/ioapic-demo.o<b=
r>=C2=A0 LD=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 /home/sarojs/Downloads/jailhouse-=
0.11/inmates/demos/x86/ioapic-demo-linked.o<br>=C2=A0 OBJCOPY /home/sarojs/=
Downloads/jailhouse-0.11/inmates/demos/x86/ioapic-demo.bin<br>=C2=A0 CC=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0 /home/sarojs/Downloads/jailhouse-0.11/inmates/d=
emos/x86/32-bit-demo.o<br>=C2=A0 LD=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 /home/sar=
ojs/Downloads/jailhouse-0.11/inmates/demos/x86/32-bit-demo-linked.o<br>=C2=
=A0 OBJCOPY /home/sarojs/Downloads/jailhouse-0.11/inmates/demos/x86/32-bit-=
demo.bin<br>=C2=A0 CC=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 /home/sarojs/Downloads/=
jailhouse-0.11/inmates/demos/x86/pci-demo.o<br>=C2=A0 LD=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 /home/sarojs/Downloads/jailhouse-0.11/inmates/demos/x86/pci-de=
mo-linked.o<br>=C2=A0 OBJCOPY /home/sarojs/Downloads/jailhouse-0.11/inmates=
/demos/x86/pci-demo.bin<br>=C2=A0 CC=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 /home/sa=
rojs/Downloads/jailhouse-0.11/inmates/demos/x86/e1000-demo.o<br>=C2=A0 LD=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 /home/sarojs/Downloads/jailhouse-0.11/inmate=
s/demos/x86/e1000-demo-linked.o<br>=C2=A0 OBJCOPY /home/sarojs/Downloads/ja=
ilhouse-0.11/inmates/demos/x86/e1000-demo.bin<br>=C2=A0 CC=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 /home/sarojs/Downloads/jailhouse-0.11/inmates/demos/x86/ivs=
hmem-demo.o<br>=C2=A0 LD=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 /home/sarojs/Downloa=
ds/jailhouse-0.11/inmates/demos/x86/ivshmem-demo-linked.o<br>=C2=A0 OBJCOPY=
 /home/sarojs/Downloads/jailhouse-0.11/inmates/demos/x86/ivshmem-demo.bin<b=
r>=C2=A0 CC=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 /home/sarojs/Downloads/jailhouse-=
0.11/inmates/demos/x86/smp-demo.o<br>=C2=A0 LD=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 /home/sarojs/Downloads/jailhouse-0.11/inmates/demos/x86/smp-demo-linked=
.o<br>=C2=A0 OBJCOPY /home/sarojs/Downloads/jailhouse-0.11/inmates/demos/x8=
6/smp-demo.bin<br>=C2=A0 CC=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 /home/sarojs/Down=
loads/jailhouse-0.11/inmates/tests/x86/mmio-access.o<br>=C2=A0 LD=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0 /home/sarojs/Downloads/jailhouse-0.11/inmates/tests/x=
86/mmio-access-linked.o<br>=C2=A0 OBJCOPY /home/sarojs/Downloads/jailhouse-=
0.11/inmates/tests/x86/mmio-access.bin<br>=C2=A0 CC=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0 /home/sarojs/Downloads/jailhouse-0.11/inmates/tests/x86/mmio-access-=
32.o<br>=C2=A0 LD=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 /home/sarojs/Downloads/jail=
house-0.11/inmates/tests/x86/mmio-access-32-linked.o<br>=C2=A0 OBJCOPY /hom=
e/sarojs/Downloads/jailhouse-0.11/inmates/tests/x86/mmio-access-32.bin<br>=
=C2=A0 CC=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 /home/sarojs/Downloads/jailhouse-0.=
11/inmates/tests/x86/sse-demo.o<br>=C2=A0 LD=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 =
/home/sarojs/Downloads/jailhouse-0.11/inmates/tests/x86/sse-demo-linked.o<b=
r>=C2=A0 OBJCOPY /home/sarojs/Downloads/jailhouse-0.11/inmates/tests/x86/ss=
e-demo.bin<br>=C2=A0 CC=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 /home/sarojs/Download=
s/jailhouse-0.11/inmates/tests/x86/sse-demo-32.o<br>=C2=A0 LD=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0 /home/sarojs/Downloads/jailhouse-0.11/inmates/tests/x86/=
sse-demo-32-linked.o<br>=C2=A0 OBJCOPY /home/sarojs/Downloads/jailhouse-0.1=
1/inmates/tests/x86/sse-demo-32.bin<br>=C2=A0 CC=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 /home/sarojs/Downloads/jailhouse-0.11/inmates/tools/x86/linux-loader.o<=
br>=C2=A0 LD=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 /home/sarojs/Downloads/jailhouse=
-0.11/inmates/tools/x86/linux-loader-linked.o<br>=C2=A0 OBJCOPY /home/saroj=
s/Downloads/jailhouse-0.11/inmates/tools/x86/linux-loader.bin<br>=C2=A0 GEN=
=C2=A0=C2=A0=C2=A0=C2=A0 /home/sarojs/Downloads/jailhouse-0.11/pyjailhouse/=
pci_defs.py<br>=C2=A0 CC=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 /home/sarojs/Downloa=
ds/jailhouse-0.11/tools/jailhouse.o<br>=C2=A0 LD=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 /home/sarojs/Downloads/jailhouse-0.11/tools/jailhouse<br>=C2=A0 GEN=C2=
=A0=C2=A0=C2=A0=C2=A0 /home/sarojs/Downloads/jailhouse-0.11/tools/jailhouse=
-config-collect<br>=C2=A0 CC=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 /home/sarojs/Dow=
nloads/jailhouse-0.11/tools/jailhouse-gcov-extract.o<br>=C2=A0 LD=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0 /home/sarojs/Downloads/jailhouse-0.11/tools/jailhouse=
-gcov-extract<br>=C2=A0 GEN=C2=A0=C2=A0=C2=A0=C2=A0 /home/sarojs/Downloads/=
jailhouse-0.11/tools/jailhouse.8<br>=C2=A0 GEN=C2=A0=C2=A0=C2=A0=C2=A0 /hom=
e/sarojs/Downloads/jailhouse-0.11/tools/jailhouse-cell.8<br>=C2=A0 GEN=C2=
=A0=C2=A0=C2=A0=C2=A0 /home/sarojs/Downloads/jailhouse-0.11/tools/jailhouse=
-enable.8<br>=C2=A0 Building modules, stage 2.<br>=C2=A0 MODPOST 1 modules<=
br>=C2=A0 CC=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 /home/sarojs/Downloads/jailhouse=
-0.11/driver/jailhouse.mod.o<br>=C2=A0 LD [M]=C2=A0 /home/sarojs/Downloads/=
jailhouse-0.11/driver/jailhouse.ko<br><div><br></div><div><br></div><div>sa=
rojs@engee-e121-d08:~/Downloads$ qemu-system-aarch64 -cpu cortex-a57 -smp 1=
6 -m 1G \<br>&gt;=C2=A0=C2=A0=C2=A0=C2=A0 -machine virt,gic-version=3D3,vir=
tualization=3Don -nographic \<br>&gt;=C2=A0=C2=A0=C2=A0=C2=A0 -netdev user,=
id=3Dnet -device virtio-net-device,netdev=3Dnet \<br>&gt;=C2=A0=C2=A0=C2=A0=
=C2=A0 -drive file=3DLinuxInstallation.img,format=3Draw|qcow2|...,id=3Ddisk=
,if=3Dnone \<br>&gt;=C2=A0=C2=A0=C2=A0=C2=A0 -device virtio-blk-device,driv=
e=3Ddisk \<br>&gt;=C2=A0=C2=A0=C2=A0=C2=A0 -kernel /path/to/kernel-image -a=
ppend &quot;root=3D/dev/vda1 mem=3D768M&quot;<br>qcow2: command not found<b=
r>...,id=3Ddisk,if=3Dnone: command not found<br>qemu-system-aarch64: -drive=
 file=3DLinuxInstallation.img,format=3Draw: Could not open &#39;LinuxInstal=
lation.img&#39;: No such file or directory<br>sarojs@engee-e121-d08:~/Downl=
oads$ <br></div><br></div>

<p></p>

-- <br />
You received this message because you are subscribed to the Google Groups &=
quot;Jailhouse&quot; group.<br />
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to <a href=3D"mailto:jailhouse-dev+unsubscribe@googlegroups.com">jailh=
ouse-dev+unsubscribe@googlegroups.com</a>.<br />
To view this discussion on the web visit <a href=3D"https://groups.google.c=
om/d/msgid/jailhouse-dev/bb275f41-32a7-4ed0-96ba-c37bdd951a23%40googlegroup=
s.com?utm_medium=3Demail&utm_source=3Dfooter">https://groups.google.com/d/m=
sgid/jailhouse-dev/bb275f41-32a7-4ed0-96ba-c37bdd951a23%40googlegroups.com<=
/a>.<br />

------=_Part_2718_1874153703.1577729421532--

------=_Part_2717_1281604849.1577729421532--
