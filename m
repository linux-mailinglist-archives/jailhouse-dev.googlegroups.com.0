Return-Path: <jailhouse-dev+bncBC7PTOEB2ALRB3U6T2CQMGQEA7MTR6Y@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-qt1-x83b.google.com (mail-qt1-x83b.google.com [IPv6:2607:f8b0:4864:20::83b])
	by mail.lfdr.de (Postfix) with ESMTPS id D22DF38C533
	for <lists+jailhouse-dev@lfdr.de>; Fri, 21 May 2021 12:46:07 +0200 (CEST)
Received: by mail-qt1-x83b.google.com with SMTP id 69-20020aed304b0000b02901c6d87aed7fsf14973626qte.21
        for <lists+jailhouse-dev@lfdr.de>; Fri, 21 May 2021 03:46:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:date:from:to:message-id:in-reply-to:references:subject
         :mime-version:x-original-sender:precedence:mailing-list:list-id
         :list-post:list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=I5t6azBZIj2kkHb022bO4rSEc43rqCDr/W1gKUcyK+c=;
        b=YJCVFVzDOd2dwxsmVvKs/T5xmV7/nzfqiL72g9zFZdsLI2n6LmsanzUA6GiHWtSsAH
         dD+lhfVNV5fDD0MCa7lCnkKuvHqnxZ5ZX8Hqhq/Jkav3eaL05xTtSRm9gW77k3mOINd2
         zVcBQCiiUH+nR2mkwbLpVKf4nZhjB0ozcWgCl6iFVtzNvlKDT6Q2DJfPj+dy7sVTYot2
         59MK1sdGJ8Ah7bAgAwX9pM2rIuO7DPiIEcoenanrFjj7F7RUuNQ3gq8pPz/v8mWPY5Qi
         Ej2L1J1LJeSWZxJVCt/PZqB3wFNDs5oldk0aLT3BHLOgGHJNsngcZ71Rs+32bu4W1Jv9
         e0xA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:message-id:in-reply-to:references:subject:mime-version
         :x-original-sender:precedence:mailing-list:list-id:list-post
         :list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=I5t6azBZIj2kkHb022bO4rSEc43rqCDr/W1gKUcyK+c=;
        b=o8ZOz5voj2ebcJHT0JFIkdcSGDu2yAeBJ7ADL+HQQw9kFYmIzxqOyij5HfFmSoHT1c
         hnAoUMeSp9UIXvHOyk1uyyzE2/+Df8CGKW+UaVp2eEZKfoLt3X8lH/uN5CSW29hOc/z8
         mmgZ3Stt1CxjqJaDAjVIWNZK7rOv5MCGgbZrYzdAxN2zREPwLisUt0wDviO5vC6D1EVR
         Moav96xPuU7DuGNgCVcW0lh3MwrETBzYS7HauzjMfMa5LPtPDBxI7SxJFN6vyCzbHOMh
         UbJU2vSsJQdc1yscjq5JRGgOU530GfL26Cs/CblbTti2YDL98uZ0ZJhh3sgWqrCUq3vY
         CDZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:date:from:to:message-id:in-reply-to
         :references:subject:mime-version:x-original-sender:precedence
         :mailing-list:list-id:x-spam-checked-in-group:list-post:list-help
         :list-archive:list-subscribe:list-unsubscribe;
        bh=I5t6azBZIj2kkHb022bO4rSEc43rqCDr/W1gKUcyK+c=;
        b=XD4Pb1/qzcChog9opECiH3PeHyCDFfmfjMrH3u+iKxf1dUN9TpKMGd8p2MzJ9zGJks
         dA8xAqNkwRO3FYcU6dsuLZwfJCWNkSx+jGSvP4Dea8Sh66gX+WI4HzlzOTEnID23+mMN
         EE4Xz0TzjsZgDSLZBbvuSe6psCIFu74TTpUYkXflQdwBCNfXtKFKBxJpaRO4To8rdcib
         9Dm2eBVr52ADo4pAMzlCNJw+Z5BffMKWfzBcJDGK2o3QNpMQqnErFErIyuJy/ZYSFb8w
         h3dN5Wa4UWntLd2I59H9r9ogTycadSGDW8/7BsGUV1IDOQK8WTv0FLwSSyIOwHcdvCJc
         IFJg==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AOAM532y4/SFhoqApfBj+e9O28B5RApA4NR6rYYicIJciTtu0kMoIr9l
	h+e0vo2EwZvbv9HRMNbhS/Y=
X-Google-Smtp-Source: ABdhPJwjezCCQTQtOFGdSudGJpOdVU9wQ/Eseo7mEu/kq/tLdtNeAS1Ib8ZLKLMVABLlzF8ay+hjzQ==
X-Received: by 2002:ae9:c002:: with SMTP id u2mr11321039qkk.41.1621593966684;
        Fri, 21 May 2021 03:46:06 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:ac8:72cd:: with SMTP id o13ls103859qtp.0.gmail; Fri, 21 May
 2021 03:46:06 -0700 (PDT)
X-Received: by 2002:ac8:7d15:: with SMTP id g21mr10197129qtb.351.1621593966026;
        Fri, 21 May 2021 03:46:06 -0700 (PDT)
Date: Fri, 21 May 2021 03:46:05 -0700 (PDT)
From: along li <v6543210@gmail.com>
To: Jailhouse <jailhouse-dev@googlegroups.com>
Message-Id: <73b31f17-7d10-4be5-83ec-d65f4522ba9dn@googlegroups.com>
In-Reply-To: <c70b4564-a830-5e40-a7d2-ced34578027e@siemens.com>
References: <CAEoyBwCDWM=+iUXzXtECTpugFprTkMSj-P+goS0R8yOizZTYdg@mail.gmail.com>
 <20210518154123.18b0ba78@md1za8fc.ad001.siemens.net>
 <c70b4564-a830-5e40-a7d2-ced34578027e@siemens.com>
Subject: Re: Installation error in Fedora
MIME-Version: 1.0
Content-Type: multipart/mixed; 
	boundary="----=_Part_1726_565774955.1621593965613"
X-Original-Sender: v6543210@gmail.com
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

------=_Part_1726_565774955.1621593965613
Content-Type: multipart/alternative; 
	boundary="----=_Part_1727_1422119724.1621593965613"

------=_Part_1727_1422119724.1621593965613
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

ERROR: modpost: "lapic_timer_period"=20
[/home/prashant/jailhouse/driver/jailhouse.ko] undefined!
ERROR: modpost: "__get_vm_area_caller"=20
[/home/prashant/jailhouse/driver/jailhouse.ko] undefined!
ERROR: modpost: "ioremap_page_range"=20
[/home/prashant/jailhouse/driver/jailhouse.ko] undefined!

link error.  It's the same in ubuntu 20.04.=20
If you can change the OS, you can try it in ubuntu 18.04.
If not. Please use the linux kernel source in=20
https://github.com/siemens/linux/=20
<https://github.com/siemens/linux/tree/jailhouse-enabling/5.10>=20

It's very easy to compile jailhouse when use the right kernel source.

=E5=9C=A82021=E5=B9=B45=E6=9C=8818=E6=97=A5=E6=98=9F=E6=9C=9F=E4=BA=8C UTC+=
8 =E4=B8=8B=E5=8D=8811:00:29<Florian Bezdeka> =E5=86=99=E9=81=93=EF=BC=9A

> On 18.05.21 15:41, Henning Schild wrote:
> > Am Tue, 18 May 2021 13:32:00 +0530
> > schrieb Prashant Kalikotay <prashantka...@gmail.com>:
> >=20
> >> Hello All,
> >> I am trying to install Jailhouse in Fedora, X86 system.
> >> While running make I run into these errors:
> >> [prashant@fedora jailhouse]$ make
> >> CC [M] /home/prashant/jailhouse/driver/cell.o
> >> CC [M] /home/prashant/jailhouse/driver/main.o
> >> CC [M] /home/prashant/jailhouse/driver/sysfs.o
> >> CC [M] /home/prashant/jailhouse/driver/pci.o
> >> LD [M] /home/prashant/jailhouse/driver/jailhouse.o
> >> CC /home/prashant/jailhouse/configs/x86/apic-demo.o
> >> OBJCOPY /home/prashant/jailhouse/configs/x86/apic-demo.cell
> >> CC /home/prashant/jailhouse/configs/x86/e1000-demo.o
> >> OBJCOPY /home/prashant/jailhouse/configs/x86/e1000-demo.cell
> >> CC /home/prashant/jailhouse/configs/x86/f2a88xm-hd3.o
> >> OBJCOPY /home/prashant/jailhouse/configs/x86/f2a88xm-hd3.cell
> >> CC /home/prashant/jailhouse/configs/x86/imb-a180.o
> >> OBJCOPY /home/prashant/jailhouse/configs/x86/imb-a180.cell
> >> CC /home/prashant/jailhouse/configs/x86/ioapic-demo.o
> >> OBJCOPY /home/prashant/jailhouse/configs/x86/ioapic-demo.cell
> >> CC /home/prashant/jailhouse/configs/x86/ivshmem-demo.o
> >> OBJCOPY /home/prashant/jailhouse/configs/x86/ivshmem-demo.cell
> >> CC /home/prashant/jailhouse/configs/x86/linux-x86-demo.o
> >> OBJCOPY /home/prashant/jailhouse/configs/x86/linux-x86-demo.cell
> >> CC /home/prashant/jailhouse/configs/x86/pci-demo.o
> >> OBJCOPY /home/prashant/jailhouse/configs/x86/pci-demo.cell
> >> CC /home/prashant/jailhouse/configs/x86/qemu-x86.o
> >> OBJCOPY /home/prashant/jailhouse/configs/x86/qemu-x86.cell
> >> CC /home/prashant/jailhouse/configs/x86/smp-demo.o
> >> OBJCOPY /home/prashant/jailhouse/configs/x86/smp-demo.cell
> >> CC /home/prashant/jailhouse/configs/x86/tiny-demo.o
> >> OBJCOPY /home/prashant/jailhouse/configs/x86/tiny-demo.cell
> >> CC /home/prashant/jailhouse/hypervisor/arch/x86/asm-defines.s
> >> GEN
> >>=20
> /home/prashant/jailhouse/hypervisor/arch/x86/include/generated/asm/asm-de=
fines.h
> >> CC /home/prashant/jailhouse/hypervisor/arch/x86/svm.o
> >> CC /home/prashant/jailhouse/hypervisor/arch/x86/amd_iommu.o
> >> AS /home/prashant/jailhouse/hypervisor/arch/x86/svm-vmexit.o
> >> CC /home/prashant/jailhouse/hypervisor/arch/x86/apic.o
> >> CC /home/prashant/jailhouse/hypervisor/arch/x86/dbg-write.o
> >> AS /home/prashant/jailhouse/hypervisor/arch/x86/entry.o
> >> CC /home/prashant/jailhouse/hypervisor/arch/x86/setup.o
> >> CC /home/prashant/jailhouse/hypervisor/arch/x86/control.o
> >> CC /home/prashant/jailhouse/hypervisor/arch/x86/mmio.o
> >> CC /home/prashant/jailhouse/hypervisor/arch/x86/iommu.o
> >> CC /home/prashant/jailhouse/hypervisor/arch/x86/paging.o
> >> CC /home/prashant/jailhouse/hypervisor/arch/x86/pci.o
> >> CC /home/prashant/jailhouse/hypervisor/arch/x86/i8042.o
> >> CC /home/prashant/jailhouse/hypervisor/arch/x86/vcpu.o
> >> /home/prashant/jailhouse/hypervisor/arch/x86/vcpu.c: In function
> >> =E2=80=98vcpu_reset=E2=80=99:
> >> /home/prashant/jailhouse/hypervisor/arch/x86/vcpu.c:429:9: warning:
> >> =E2=80=98memset=E2=80=99 offset [0, 127] is out of the bounds [0, 0] [=
-Warray-bounds]
> >> 429 | memset(&cpu_data->guest_regs, 0,
> >> sizeof(cpu_data->guest_regs));
> >> |
> >> ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>
> This is a warning and treated as error due to -Wall.
>
> This warning is GCC 11 specific, the code compiles with GCC 10, but
> fails with GCC 11.
>
> I looked into that a few days ago and considered that as gcc bug. In my
> eyes the array boundarys are not correctly "detected" by gcc and that
> might be the reason for the warning. Not sure if it was already reported
> upstream to the gcc guys.
>
> >> CC /home/prashant/jailhouse/hypervisor/arch/x86/efifb.o
> >> CC /home/prashant/jailhouse/hypervisor/arch/x86/ivshmem.o
> >> CC /home/prashant/jailhouse/hypervisor/arch/x86/ioapic.o
> >> AR /home/prashant/jailhouse/hypervisor/arch/x86/lib-amd.a
> >> CC /home/prashant/jailhouse/hypervisor/arch/x86/vmx.o
> >> CC /home/prashant/jailhouse/hypervisor/arch/x86/vtd.o
> >> AS /home/prashant/jailhouse/hypervisor/arch/x86/vmx-vmexit.o
> >> CC /home/prashant/jailhouse/hypervisor/arch/x86/cat.o
> >> AR /home/prashant/jailhouse/hypervisor/arch/x86/lib-intel.a
> >> LDS /home/prashant/jailhouse/hypervisor/hypervisor.lds
> >> CC /home/prashant/jailhouse/hypervisor/setup.o
> >> CC /home/prashant/jailhouse/hypervisor/printk.o
> >> CC /home/prashant/jailhouse/hypervisor/paging.o
> >> CC /home/prashant/jailhouse/hypervisor/control.o
> >> CC /home/prashant/jailhouse/hypervisor/lib.o
> >> CC /home/prashant/jailhouse/hypervisor/mmio.o
> >> CC /home/prashant/jailhouse/hypervisor/pci.o
> >> CC /home/prashant/jailhouse/hypervisor/ivshmem.o
> >> CC /home/prashant/jailhouse/hypervisor/uart.o
> >> CC /home/prashant/jailhouse/hypervisor/uart-8250.o
> >> LD /home/prashant/jailhouse/hypervisor/hypervisor-amd.o
> >> OBJCOPY /home/prashant/jailhouse/hypervisor/jailhouse-amd.bin
> >> LD /home/prashant/jailhouse/hypervisor/hypervisor-intel.o
> >> OBJCOPY /home/prashant/jailhouse/hypervisor/jailhouse-intel.bin
> >> CC /home/prashant/jailhouse/inmates/lib/x86/../alloc.o
> >> CC /home/prashant/jailhouse/inmates/lib/x86/../cmdline.o
> >> CC /home/prashant/jailhouse/inmates/lib/x86/../pci.o
> >> CC /home/prashant/jailhouse/inmates/lib/x86/../printk.o
> >> CC /home/prashant/jailhouse/inmates/lib/x86/../setup.o
> >> CC /home/prashant/jailhouse/inmates/lib/x86/../string.o
> >> CC /home/prashant/jailhouse/inmates/lib/x86/../test.o
> >> CC /home/prashant/jailhouse/inmates/lib/x86/../uart-8250.o
> >> CC /home/prashant/jailhouse/inmates/lib/x86/cpu-features.o
> >> CC /home/prashant/jailhouse/inmates/lib/x86/excp.o
> >> AS /home/prashant/jailhouse/inmates/lib/x86/header-64.o
> >> AS /home/prashant/jailhouse/inmates/lib/x86/header-common.o
> >> CC /home/prashant/jailhouse/inmates/lib/x86/ioapic.o
> >> CC /home/prashant/jailhouse/inmates/lib/x86/irq.o
> >> CC /home/prashant/jailhouse/inmates/lib/x86/mem.o
> >> CC /home/prashant/jailhouse/inmates/lib/x86/pci.o
> >> CC /home/prashant/jailhouse/inmates/lib/x86/printk.o
> >> CC /home/prashant/jailhouse/inmates/lib/x86/setup.o
> >> CC /home/prashant/jailhouse/inmates/lib/x86/smp.o
> >> CC /home/prashant/jailhouse/inmates/lib/x86/timing.o
> >> CC /home/prashant/jailhouse/inmates/lib/x86/uart.o
> >> AR /home/prashant/jailhouse/inmates/lib/x86/lib.a
> >> CC /home/prashant/jailhouse/inmates/lib/x86/cpu-features-32.o
> >> CC /home/prashant/jailhouse/inmates/lib/x86/excp-32.o
> >> AS /home/prashant/jailhouse/inmates/lib/x86/header-common-32.o
> >> CC /home/prashant/jailhouse/inmates/lib/x86/irq-32.o
> >> CC /home/prashant/jailhouse/inmates/lib/x86/ioapic-32.o
> >> CC /home/prashant/jailhouse/inmates/lib/x86/printk-32.o
> >> CC /home/prashant/jailhouse/inmates/lib/x86/setup-32.o
> >> CC /home/prashant/jailhouse/inmates/lib/x86/uart-32.o
> >> CC /home/prashant/jailhouse/inmates/lib/x86/../alloc-32.o
> >> CC /home/prashant/jailhouse/inmates/lib/x86/../pci-32.o
> >> CC /home/prashant/jailhouse/inmates/lib/x86/../string-32.o
> >> CC /home/prashant/jailhouse/inmates/lib/x86/../cmdline-32.o
> >> CC /home/prashant/jailhouse/inmates/lib/x86/../setup-32.o
> >> CC /home/prashant/jailhouse/inmates/lib/x86/../test-32.o
> >> CC /home/prashant/jailhouse/inmates/lib/x86/../uart-8250-32.o
> >> CC /home/prashant/jailhouse/inmates/lib/x86/../printk-32.o
> >> AS /home/prashant/jailhouse/inmates/lib/x86/header-32.o
> >> AR /home/prashant/jailhouse/inmates/lib/x86/lib32.a
> >> CC /home/prashant/jailhouse/inmates/demos/x86/tiny-demo.o
> >> LD
> >> /home/prashant/jailhouse/inmates/demos/x86/tiny-demo-linked.o OBJCOPY
> >> /home/prashant/jailhouse/inmates/demos/x86/tiny-demo.bin CC
> >> /home/prashant/jailhouse/inmates/demos/x86/apic-demo.o LD
> >> /home/prashant/jailhouse/inmates/demos/x86/apic-demo-linked.o OBJCOPY
> >> /home/prashant/jailhouse/inmates/demos/x86/apic-demo.bin CC
> >> /home/prashant/jailhouse/inmates/demos/x86/ioapic-demo.o LD
> >> /home/prashant/jailhouse/inmates/demos/x86/ioapic-demo-linked.o
> >> OBJCOPY /home/prashant/jailhouse/inmates/demos/x86/ioapic-demo.bin CC
> >> /home/prashant/jailhouse/inmates/demos/x86/32-bit-demo.o LD
> >> /home/prashant/jailhouse/inmates/demos/x86/32-bit-demo-linked.o
> >> OBJCOPY /home/prashant/jailhouse/inmates/demos/x86/32-bit-demo.bin CC
> >> /home/prashant/jailhouse/inmates/demos/x86/pci-demo.o LD
> >> /home/prashant/jailhouse/inmates/demos/x86/pci-demo-linked.o OBJCOPY
> >> /home/prashant/jailhouse/inmates/demos/x86/pci-demo.bin CC
> >> /home/prashant/jailhouse/inmates/demos/x86/e1000-demo.o LD
> >> /home/prashant/jailhouse/inmates/demos/x86/e1000-demo-linked.o
> >> OBJCOPY /home/prashant/jailhouse/inmates/demos/x86/e1000-demo.bin CC
> >> /home/prashant/jailhouse/inmates/demos/x86/../ivshmem-demo.o LD
> >> /home/prashant/jailhouse/inmates/demos/x86/ivshmem-demo-linked.o
> >> OBJCOPY /home/prashant/jailhouse/inmates/demos/x86/ivshmem-demo.bin
> >> CC /home/prashant/jailhouse/inmates/demos/x86/smp-demo.o LD
> >> /home/prashant/jailhouse/inmates/demos/x86/smp-demo-linked.o OBJCOPY
> >> /home/prashant/jailhouse/inmates/demos/x86/smp-demo.bin CC
> >> /home/prashant/jailhouse/inmates/demos/x86/cache-timings.o LD
> >> /home/prashant/jailhouse/inmates/demos/x86/cache-timings-linked.o
> >> OBJCOPY /home/prashant/jailhouse/inmates/demos/x86/cache-timings.bin
> >> CC /home/prashant/jailhouse/inmates/tests/x86/mmio-access.o LD
> >> /home/prashant/jailhouse/inmates/tests/x86/mmio-access-linked.o
> >> OBJCOPY /home/prashant/jailhouse/inmates/tests/x86/mmio-access.bin CC
> >> /home/prashant/jailhouse/inmates/tests/x86/mmio-access-32.o LD
> >> /home/prashant/jailhouse/inmates/tests/x86/mmio-access-32-linked.o
> >> OBJCOPY /home/prashant/jailhouse/inmates/tests/x86/mmio-access-32.bin
> >> CC /home/prashant/jailhouse/inmates/tests/x86/sse-demo.o LD
> >> /home/prashant/jailhouse/inmates/tests/x86/sse-demo-linked.o OBJCOPY
> >> /home/prashant/jailhouse/inmates/tests/x86/sse-demo.bin CC
> >> /home/prashant/jailhouse/inmates/tests/x86/sse-demo-32.o LD
> >> /home/prashant/jailhouse/inmates/tests/x86/sse-demo-32-linked.o
> >> OBJCOPY /home/prashant/jailhouse/inmates/tests/x86/sse-demo-32.bin CC
> >> /home/prashant/jailhouse/inmates/tools/x86/linux-loader.o LD
> >> /home/prashant/jailhouse/inmates/tools/x86/linux-loader-linked.o
> >> OBJCOPY /home/prashant/jailhouse/inmates/tools/x86/linux-loader.bin
> >> GEN /home/prashant/jailhouse/pyjailhouse/pci_defs.py CC
> >> /home/prashant/jailhouse/tools/jailhouse.o LD
> >> /home/prashant/jailhouse/tools/jailhouse CC
> >> /home/prashant/jailhouse/tools/demos/ivshmem-demo.o LD
> >> /home/prashant/jailhouse/tools/demos/ivshmem-demo CC
> >> /home/prashant/jailhouse/tools/demos/cache-timings.o LD
> >> /home/prashant/jailhouse/tools/demos/cache-timings GEN
> >> /home/prashant/jailhouse/tools/jailhouse-config-collect CC
> >> /home/prashant/jailhouse/tools/jailhouse-gcov-extract.o LD
> >> /home/prashant/jailhouse/tools/jailhouse-gcov-extract GEN
> >> /home/prashant/jailhouse/tools/jailhouse.8 GEN
> >> /home/prashant/jailhouse/tools/jailhouse-cell.8 GEN
> >> /home/prashant/jailhouse/tools/jailhouse-enable.8 MODPOST
> >> /home/prashant/jailhouse/Module.symvers ERROR: modpost:
> >> "lapic_timer_period" [/home/prashant/jailhouse/driver/jailhouse.ko]
> >> undefined! ERROR: modpost: "__get_vm_area_caller"
> >> [/home/prashant/jailhouse/driver/jailhouse.ko] undefined!
> >> ERROR: modpost: "ioremap_page_range"
> >> [/home/prashant/jailhouse/driver/jailhouse.ko] undefined!
> >> make[2]: *** [scripts/Makefile.modpost:111:
> >> /home/prashant/jailhouse/Module.symvers] Error 1
> >> make[2]: *** Deleting file '/home/prashant/jailhouse/Module.symvers'
> >> make[1]: *** [Makefile:1714: modules] Error 2
> >> make: *** [Makefile:40: modules] Error 2
> >> [prashant@fedora jailhouse]$
> >>
> >> I could see the issue is with the kernel. Could I get necessary steps
> >> to fix this? How to apply patches if I have? Pointing to any resource
> >> also might be very helpful.
> >> Thank you
> >=20
> > On x86 we used to get away without patching the kernel, i think with
> > more recent 5.x kernels that luxury is gone. Check out
> >=20
> https://eur01.safelinks.protection.outlook.com/?url=3Dhttps%3A%2F%2Fgithu=
b.com%2Fsiemens%2Flinux%2Ftree%2Fjailhouse-enabling%2F5.10&amp;data=3D04%7C=
01%7Cflorian.bezdeka%40siemens.com%7C74ce6e998d594fed802908d91a032725%7C38a=
e3bcd95794fd4addab42e1495d55a%7C1%7C0%7C637569423110710081%7CUnknown%7CTWFp=
bGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%=
7C1000&amp;sdata=3DlM97dJOoqAwpgSrhyxCsFs5AOS%2F%2Fik2nkNjCVZ6aiW8%3D&amp;r=
eserved=3D0
>
> That is exactly what I did a few days ago. Using one of the JH
> "prepared" Linux trees solved the compilation error.
>
> It looks like some of the necessary symbols are not visible anymore for
> out of tree builds, but I did not check it yet.
>
> >=20
> > There are other jailhouse-enabling branches as well. Find one that is
> > close to your distro kernel and compile a custom kernel.
> >=20
> > regards,
> > Henning
> >=20
> >=20
>
>
> --=20
> Siemens AG, T RDA IOT
> Corporate Competence Center Embedded Linux
>

--=20
You received this message because you are subscribed to the Google Groups "=
Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/=
jailhouse-dev/73b31f17-7d10-4be5-83ec-d65f4522ba9dn%40googlegroups.com.

------=_Part_1727_1422119724.1621593965613
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

ERROR: modpost: "lapic_timer_period" [/home/prashant/jailhouse/driver/jailh=
ouse.ko] undefined!<br>ERROR: modpost: "__get_vm_area_caller" [/home/prasha=
nt/jailhouse/driver/jailhouse.ko] undefined!<br>ERROR: modpost: "ioremap_pa=
ge_range" [/home/prashant/jailhouse/driver/jailhouse.ko] undefined!<br><br>=
<div>link error.&nbsp; It's the same in ubuntu 20.04.&nbsp;</div><div>If yo=
u can change the OS, you can try it in ubuntu 18.04.</div><div>If not. Plea=
se use the linux kernel source in&nbsp;<a href=3D"https://github.com/siemen=
s/linux/tree/jailhouse-enabling/5.10">https://github.com/siemens/linux/</a>=
&nbsp;</div><div><br></div><div>It's very easy to compile jailhouse when us=
e the right kernel source.</div><div><br></div><div class=3D"gmail_quote"><=
div dir=3D"auto" class=3D"gmail_attr">=E5=9C=A82021=E5=B9=B45=E6=9C=8818=E6=
=97=A5=E6=98=9F=E6=9C=9F=E4=BA=8C UTC+8 =E4=B8=8B=E5=8D=8811:00:29&lt;Flori=
an Bezdeka> =E5=86=99=E9=81=93=EF=BC=9A<br/></div><blockquote class=3D"gmai=
l_quote" style=3D"margin: 0 0 0 0.8ex; border-left: 1px solid rgb(204, 204,=
 204); padding-left: 1ex;">On 18.05.21 15:41, Henning Schild wrote:
<br>&gt; Am Tue, 18 May 2021 13:32:00 +0530
<br>&gt; schrieb Prashant Kalikotay &lt;<a href data-email-masked rel=3D"no=
follow">prashantka...@gmail.com</a>&gt;:
<br>&gt;=20
<br>&gt;&gt; Hello All,
<br>&gt;&gt;               I am trying to install Jailhouse in Fedora, X86 =
system.
<br>&gt;&gt; While running make I run into these errors:
<br>&gt;&gt; [prashant@fedora jailhouse]$ make
<br>&gt;&gt;   CC [M]  /home/prashant/jailhouse/driver/cell.o
<br>&gt;&gt;   CC [M]  /home/prashant/jailhouse/driver/main.o
<br>&gt;&gt;   CC [M]  /home/prashant/jailhouse/driver/sysfs.o
<br>&gt;&gt;   CC [M]  /home/prashant/jailhouse/driver/pci.o
<br>&gt;&gt;   LD [M]  /home/prashant/jailhouse/driver/jailhouse.o
<br>&gt;&gt;   CC      /home/prashant/jailhouse/configs/x86/apic-demo.o
<br>&gt;&gt;   OBJCOPY /home/prashant/jailhouse/configs/x86/apic-demo.cell
<br>&gt;&gt;   CC      /home/prashant/jailhouse/configs/x86/e1000-demo.o
<br>&gt;&gt;   OBJCOPY /home/prashant/jailhouse/configs/x86/e1000-demo.cell
<br>&gt;&gt;   CC      /home/prashant/jailhouse/configs/x86/f2a88xm-hd3.o
<br>&gt;&gt;   OBJCOPY /home/prashant/jailhouse/configs/x86/f2a88xm-hd3.cel=
l
<br>&gt;&gt;   CC      /home/prashant/jailhouse/configs/x86/imb-a180.o
<br>&gt;&gt;   OBJCOPY /home/prashant/jailhouse/configs/x86/imb-a180.cell
<br>&gt;&gt;   CC      /home/prashant/jailhouse/configs/x86/ioapic-demo.o
<br>&gt;&gt;   OBJCOPY /home/prashant/jailhouse/configs/x86/ioapic-demo.cel=
l
<br>&gt;&gt;   CC      /home/prashant/jailhouse/configs/x86/ivshmem-demo.o
<br>&gt;&gt;   OBJCOPY /home/prashant/jailhouse/configs/x86/ivshmem-demo.ce=
ll
<br>&gt;&gt;   CC      /home/prashant/jailhouse/configs/x86/linux-x86-demo.=
o
<br>&gt;&gt;   OBJCOPY /home/prashant/jailhouse/configs/x86/linux-x86-demo.=
cell
<br>&gt;&gt;   CC      /home/prashant/jailhouse/configs/x86/pci-demo.o
<br>&gt;&gt;   OBJCOPY /home/prashant/jailhouse/configs/x86/pci-demo.cell
<br>&gt;&gt;   CC      /home/prashant/jailhouse/configs/x86/qemu-x86.o
<br>&gt;&gt;   OBJCOPY /home/prashant/jailhouse/configs/x86/qemu-x86.cell
<br>&gt;&gt;   CC      /home/prashant/jailhouse/configs/x86/smp-demo.o
<br>&gt;&gt;   OBJCOPY /home/prashant/jailhouse/configs/x86/smp-demo.cell
<br>&gt;&gt;   CC      /home/prashant/jailhouse/configs/x86/tiny-demo.o
<br>&gt;&gt;   OBJCOPY /home/prashant/jailhouse/configs/x86/tiny-demo.cell
<br>&gt;&gt;   CC      /home/prashant/jailhouse/hypervisor/arch/x86/asm-def=
ines.s
<br>&gt;&gt;   GEN
<br>&gt;&gt; /home/prashant/jailhouse/hypervisor/arch/x86/include/generated=
/asm/asm-defines.h
<br>&gt;&gt;   CC      /home/prashant/jailhouse/hypervisor/arch/x86/svm.o
<br>&gt;&gt;   CC      /home/prashant/jailhouse/hypervisor/arch/x86/amd_iom=
mu.o
<br>&gt;&gt;   AS      /home/prashant/jailhouse/hypervisor/arch/x86/svm-vme=
xit.o
<br>&gt;&gt;   CC      /home/prashant/jailhouse/hypervisor/arch/x86/apic.o
<br>&gt;&gt;   CC      /home/prashant/jailhouse/hypervisor/arch/x86/dbg-wri=
te.o
<br>&gt;&gt;   AS      /home/prashant/jailhouse/hypervisor/arch/x86/entry.o
<br>&gt;&gt;   CC      /home/prashant/jailhouse/hypervisor/arch/x86/setup.o
<br>&gt;&gt;   CC      /home/prashant/jailhouse/hypervisor/arch/x86/control=
.o
<br>&gt;&gt;   CC      /home/prashant/jailhouse/hypervisor/arch/x86/mmio.o
<br>&gt;&gt;   CC      /home/prashant/jailhouse/hypervisor/arch/x86/iommu.o
<br>&gt;&gt;   CC      /home/prashant/jailhouse/hypervisor/arch/x86/paging.=
o
<br>&gt;&gt;   CC      /home/prashant/jailhouse/hypervisor/arch/x86/pci.o
<br>&gt;&gt;   CC      /home/prashant/jailhouse/hypervisor/arch/x86/i8042.o
<br>&gt;&gt;   CC      /home/prashant/jailhouse/hypervisor/arch/x86/vcpu.o
<br>&gt;&gt; /home/prashant/jailhouse/hypervisor/arch/x86/vcpu.c: In functi=
on
<br>&gt;&gt; =E2=80=98vcpu_reset=E2=80=99:
<br>&gt;&gt; /home/prashant/jailhouse/hypervisor/arch/x86/vcpu.c:429:9: war=
ning:
<br>&gt;&gt; =E2=80=98memset=E2=80=99 offset [0, 127] is out of the bounds =
[0, 0] [-Warray-bounds]
<br>&gt;&gt;   429 |         memset(&amp;cpu_data-&gt;guest_regs, 0,
<br>&gt;&gt; sizeof(cpu_data-&gt;guest_regs));
<br>&gt;&gt;       |
<br>&gt;&gt; ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
<br>
<br>This is a warning and treated as error due to -Wall.
<br>
<br>This warning is GCC 11 specific, the code compiles with GCC 10, but
<br>fails with GCC 11.
<br>
<br>I looked into that a few days ago and considered that as gcc bug. In my
<br>eyes the array boundarys are not correctly &quot;detected&quot; by gcc =
and that
<br>might be the reason for the warning. Not sure if it was already reporte=
d
<br>upstream to the gcc guys.
<br>
<br>&gt;&gt;   CC      /home/prashant/jailhouse/hypervisor/arch/x86/efifb.o
<br>&gt;&gt;   CC      /home/prashant/jailhouse/hypervisor/arch/x86/ivshmem=
.o
<br>&gt;&gt;   CC      /home/prashant/jailhouse/hypervisor/arch/x86/ioapic.=
o
<br>&gt;&gt;   AR      /home/prashant/jailhouse/hypervisor/arch/x86/lib-amd=
.a
<br>&gt;&gt;   CC      /home/prashant/jailhouse/hypervisor/arch/x86/vmx.o
<br>&gt;&gt;   CC      /home/prashant/jailhouse/hypervisor/arch/x86/vtd.o
<br>&gt;&gt;   AS      /home/prashant/jailhouse/hypervisor/arch/x86/vmx-vme=
xit.o
<br>&gt;&gt;   CC      /home/prashant/jailhouse/hypervisor/arch/x86/cat.o
<br>&gt;&gt;   AR      /home/prashant/jailhouse/hypervisor/arch/x86/lib-int=
el.a
<br>&gt;&gt;   LDS     /home/prashant/jailhouse/hypervisor/hypervisor.lds
<br>&gt;&gt;   CC      /home/prashant/jailhouse/hypervisor/setup.o
<br>&gt;&gt;   CC      /home/prashant/jailhouse/hypervisor/printk.o
<br>&gt;&gt;   CC      /home/prashant/jailhouse/hypervisor/paging.o
<br>&gt;&gt;   CC      /home/prashant/jailhouse/hypervisor/control.o
<br>&gt;&gt;   CC      /home/prashant/jailhouse/hypervisor/lib.o
<br>&gt;&gt;   CC      /home/prashant/jailhouse/hypervisor/mmio.o
<br>&gt;&gt;   CC      /home/prashant/jailhouse/hypervisor/pci.o
<br>&gt;&gt;   CC      /home/prashant/jailhouse/hypervisor/ivshmem.o
<br>&gt;&gt;   CC      /home/prashant/jailhouse/hypervisor/uart.o
<br>&gt;&gt;   CC      /home/prashant/jailhouse/hypervisor/uart-8250.o
<br>&gt;&gt;   LD      /home/prashant/jailhouse/hypervisor/hypervisor-amd.o
<br>&gt;&gt;   OBJCOPY /home/prashant/jailhouse/hypervisor/jailhouse-amd.bi=
n
<br>&gt;&gt;   LD      /home/prashant/jailhouse/hypervisor/hypervisor-intel=
.o
<br>&gt;&gt;   OBJCOPY /home/prashant/jailhouse/hypervisor/jailhouse-intel.=
bin
<br>&gt;&gt;   CC      /home/prashant/jailhouse/inmates/lib/x86/../alloc.o
<br>&gt;&gt;   CC      /home/prashant/jailhouse/inmates/lib/x86/../cmdline.=
o
<br>&gt;&gt;   CC      /home/prashant/jailhouse/inmates/lib/x86/../pci.o
<br>&gt;&gt;   CC      /home/prashant/jailhouse/inmates/lib/x86/../printk.o
<br>&gt;&gt;   CC      /home/prashant/jailhouse/inmates/lib/x86/../setup.o
<br>&gt;&gt;   CC      /home/prashant/jailhouse/inmates/lib/x86/../string.o
<br>&gt;&gt;   CC      /home/prashant/jailhouse/inmates/lib/x86/../test.o
<br>&gt;&gt;   CC      /home/prashant/jailhouse/inmates/lib/x86/../uart-825=
0.o
<br>&gt;&gt;   CC      /home/prashant/jailhouse/inmates/lib/x86/cpu-feature=
s.o
<br>&gt;&gt;   CC      /home/prashant/jailhouse/inmates/lib/x86/excp.o
<br>&gt;&gt;   AS      /home/prashant/jailhouse/inmates/lib/x86/header-64.o
<br>&gt;&gt;   AS      /home/prashant/jailhouse/inmates/lib/x86/header-comm=
on.o
<br>&gt;&gt;   CC      /home/prashant/jailhouse/inmates/lib/x86/ioapic.o
<br>&gt;&gt;   CC      /home/prashant/jailhouse/inmates/lib/x86/irq.o
<br>&gt;&gt;   CC      /home/prashant/jailhouse/inmates/lib/x86/mem.o
<br>&gt;&gt;   CC      /home/prashant/jailhouse/inmates/lib/x86/pci.o
<br>&gt;&gt;   CC      /home/prashant/jailhouse/inmates/lib/x86/printk.o
<br>&gt;&gt;   CC      /home/prashant/jailhouse/inmates/lib/x86/setup.o
<br>&gt;&gt;   CC      /home/prashant/jailhouse/inmates/lib/x86/smp.o
<br>&gt;&gt;   CC      /home/prashant/jailhouse/inmates/lib/x86/timing.o
<br>&gt;&gt;   CC      /home/prashant/jailhouse/inmates/lib/x86/uart.o
<br>&gt;&gt;   AR      /home/prashant/jailhouse/inmates/lib/x86/lib.a
<br>&gt;&gt;   CC      /home/prashant/jailhouse/inmates/lib/x86/cpu-feature=
s-32.o
<br>&gt;&gt;   CC      /home/prashant/jailhouse/inmates/lib/x86/excp-32.o
<br>&gt;&gt;   AS      /home/prashant/jailhouse/inmates/lib/x86/header-comm=
on-32.o
<br>&gt;&gt;   CC      /home/prashant/jailhouse/inmates/lib/x86/irq-32.o
<br>&gt;&gt;   CC      /home/prashant/jailhouse/inmates/lib/x86/ioapic-32.o
<br>&gt;&gt;   CC      /home/prashant/jailhouse/inmates/lib/x86/printk-32.o
<br>&gt;&gt;   CC      /home/prashant/jailhouse/inmates/lib/x86/setup-32.o
<br>&gt;&gt;   CC      /home/prashant/jailhouse/inmates/lib/x86/uart-32.o
<br>&gt;&gt;   CC      /home/prashant/jailhouse/inmates/lib/x86/../alloc-32=
.o
<br>&gt;&gt;   CC      /home/prashant/jailhouse/inmates/lib/x86/../pci-32.o
<br>&gt;&gt;   CC      /home/prashant/jailhouse/inmates/lib/x86/../string-3=
2.o
<br>&gt;&gt;   CC      /home/prashant/jailhouse/inmates/lib/x86/../cmdline-=
32.o
<br>&gt;&gt;   CC      /home/prashant/jailhouse/inmates/lib/x86/../setup-32=
.o
<br>&gt;&gt;   CC      /home/prashant/jailhouse/inmates/lib/x86/../test-32.=
o
<br>&gt;&gt;   CC      /home/prashant/jailhouse/inmates/lib/x86/../uart-825=
0-32.o
<br>&gt;&gt;   CC      /home/prashant/jailhouse/inmates/lib/x86/../printk-3=
2.o
<br>&gt;&gt;   AS      /home/prashant/jailhouse/inmates/lib/x86/header-32.o
<br>&gt;&gt;   AR      /home/prashant/jailhouse/inmates/lib/x86/lib32.a
<br>&gt;&gt;   CC      /home/prashant/jailhouse/inmates/demos/x86/tiny-demo=
.o
<br>&gt;&gt;   LD
<br>&gt;&gt; /home/prashant/jailhouse/inmates/demos/x86/tiny-demo-linked.o =
OBJCOPY
<br>&gt;&gt; /home/prashant/jailhouse/inmates/demos/x86/tiny-demo.bin CC
<br>&gt;&gt; /home/prashant/jailhouse/inmates/demos/x86/apic-demo.o LD
<br>&gt;&gt; /home/prashant/jailhouse/inmates/demos/x86/apic-demo-linked.o =
OBJCOPY
<br>&gt;&gt; /home/prashant/jailhouse/inmates/demos/x86/apic-demo.bin CC
<br>&gt;&gt; /home/prashant/jailhouse/inmates/demos/x86/ioapic-demo.o LD
<br>&gt;&gt; /home/prashant/jailhouse/inmates/demos/x86/ioapic-demo-linked.=
o
<br>&gt;&gt; OBJCOPY /home/prashant/jailhouse/inmates/demos/x86/ioapic-demo=
.bin CC
<br>&gt;&gt;      /home/prashant/jailhouse/inmates/demos/x86/32-bit-demo.o =
LD
<br>&gt;&gt; /home/prashant/jailhouse/inmates/demos/x86/32-bit-demo-linked.=
o
<br>&gt;&gt; OBJCOPY /home/prashant/jailhouse/inmates/demos/x86/32-bit-demo=
.bin CC
<br>&gt;&gt;      /home/prashant/jailhouse/inmates/demos/x86/pci-demo.o LD
<br>&gt;&gt; /home/prashant/jailhouse/inmates/demos/x86/pci-demo-linked.o O=
BJCOPY
<br>&gt;&gt; /home/prashant/jailhouse/inmates/demos/x86/pci-demo.bin CC
<br>&gt;&gt; /home/prashant/jailhouse/inmates/demos/x86/e1000-demo.o LD
<br>&gt;&gt; /home/prashant/jailhouse/inmates/demos/x86/e1000-demo-linked.o
<br>&gt;&gt; OBJCOPY /home/prashant/jailhouse/inmates/demos/x86/e1000-demo.=
bin CC
<br>&gt;&gt;     /home/prashant/jailhouse/inmates/demos/x86/../ivshmem-demo=
.o LD
<br>&gt;&gt;    /home/prashant/jailhouse/inmates/demos/x86/ivshmem-demo-lin=
ked.o
<br>&gt;&gt; OBJCOPY /home/prashant/jailhouse/inmates/demos/x86/ivshmem-dem=
o.bin
<br>&gt;&gt; CC      /home/prashant/jailhouse/inmates/demos/x86/smp-demo.o =
LD
<br>&gt;&gt; /home/prashant/jailhouse/inmates/demos/x86/smp-demo-linked.o O=
BJCOPY
<br>&gt;&gt; /home/prashant/jailhouse/inmates/demos/x86/smp-demo.bin CC
<br>&gt;&gt; /home/prashant/jailhouse/inmates/demos/x86/cache-timings.o LD
<br>&gt;&gt; /home/prashant/jailhouse/inmates/demos/x86/cache-timings-linke=
d.o
<br>&gt;&gt; OBJCOPY /home/prashant/jailhouse/inmates/demos/x86/cache-timin=
gs.bin
<br>&gt;&gt; CC      /home/prashant/jailhouse/inmates/tests/x86/mmio-access=
.o LD
<br>&gt;&gt;    /home/prashant/jailhouse/inmates/tests/x86/mmio-access-link=
ed.o
<br>&gt;&gt; OBJCOPY /home/prashant/jailhouse/inmates/tests/x86/mmio-access=
.bin CC
<br>&gt;&gt;      /home/prashant/jailhouse/inmates/tests/x86/mmio-access-32=
.o LD
<br>&gt;&gt;    /home/prashant/jailhouse/inmates/tests/x86/mmio-access-32-l=
inked.o
<br>&gt;&gt; OBJCOPY /home/prashant/jailhouse/inmates/tests/x86/mmio-access=
-32.bin
<br>&gt;&gt; CC      /home/prashant/jailhouse/inmates/tests/x86/sse-demo.o =
LD
<br>&gt;&gt; /home/prashant/jailhouse/inmates/tests/x86/sse-demo-linked.o O=
BJCOPY
<br>&gt;&gt; /home/prashant/jailhouse/inmates/tests/x86/sse-demo.bin CC
<br>&gt;&gt; /home/prashant/jailhouse/inmates/tests/x86/sse-demo-32.o LD
<br>&gt;&gt; /home/prashant/jailhouse/inmates/tests/x86/sse-demo-32-linked.=
o
<br>&gt;&gt; OBJCOPY /home/prashant/jailhouse/inmates/tests/x86/sse-demo-32=
.bin CC
<br>&gt;&gt;      /home/prashant/jailhouse/inmates/tools/x86/linux-loader.o=
 LD
<br>&gt;&gt;  /home/prashant/jailhouse/inmates/tools/x86/linux-loader-linke=
d.o
<br>&gt;&gt; OBJCOPY /home/prashant/jailhouse/inmates/tools/x86/linux-loade=
r.bin
<br>&gt;&gt; GEN     /home/prashant/jailhouse/pyjailhouse/pci_defs.py CC
<br>&gt;&gt; /home/prashant/jailhouse/tools/jailhouse.o LD
<br>&gt;&gt; /home/prashant/jailhouse/tools/jailhouse CC
<br>&gt;&gt; /home/prashant/jailhouse/tools/demos/ivshmem-demo.o LD
<br>&gt;&gt; /home/prashant/jailhouse/tools/demos/ivshmem-demo CC
<br>&gt;&gt; /home/prashant/jailhouse/tools/demos/cache-timings.o LD
<br>&gt;&gt; /home/prashant/jailhouse/tools/demos/cache-timings GEN
<br>&gt;&gt; /home/prashant/jailhouse/tools/jailhouse-config-collect CC
<br>&gt;&gt; /home/prashant/jailhouse/tools/jailhouse-gcov-extract.o LD
<br>&gt;&gt; /home/prashant/jailhouse/tools/jailhouse-gcov-extract GEN
<br>&gt;&gt; /home/prashant/jailhouse/tools/jailhouse.8 GEN
<br>&gt;&gt; /home/prashant/jailhouse/tools/jailhouse-cell.8 GEN
<br>&gt;&gt; /home/prashant/jailhouse/tools/jailhouse-enable.8 MODPOST
<br>&gt;&gt; /home/prashant/jailhouse/Module.symvers ERROR: modpost:
<br>&gt;&gt; &quot;lapic_timer_period&quot; [/home/prashant/jailhouse/drive=
r/jailhouse.ko]
<br>&gt;&gt; undefined! ERROR: modpost: &quot;__get_vm_area_caller&quot;
<br>&gt;&gt; [/home/prashant/jailhouse/driver/jailhouse.ko] undefined!
<br>&gt;&gt; ERROR: modpost: &quot;ioremap_page_range&quot;
<br>&gt;&gt; [/home/prashant/jailhouse/driver/jailhouse.ko] undefined!
<br>&gt;&gt; make[2]: *** [scripts/Makefile.modpost:111:
<br>&gt;&gt; /home/prashant/jailhouse/Module.symvers] Error 1
<br>&gt;&gt; make[2]: *** Deleting file &#39;/home/prashant/jailhouse/Modul=
e.symvers&#39;
<br>&gt;&gt; make[1]: *** [Makefile:1714: modules] Error 2
<br>&gt;&gt; make: *** [Makefile:40: modules] Error 2
<br>&gt;&gt; [prashant@fedora jailhouse]$
<br>&gt;&gt;
<br>&gt;&gt; I could see the issue is with the kernel. Could I get necessar=
y steps
<br>&gt;&gt; to fix this? How to apply patches if I have? Pointing to any r=
esource
<br>&gt;&gt; also might be very helpful.
<br>&gt;&gt; Thank you
<br>&gt;=20
<br>&gt; On x86 we used to get away without patching the kernel, i think wi=
th
<br>&gt; more recent 5.x kernels that luxury is gone. Check out
<br>&gt; <a href=3D"https://eur01.safelinks.protection.outlook.com/?url=3Dh=
ttps%3A%2F%2Fgithub.com%2Fsiemens%2Flinux%2Ftree%2Fjailhouse-enabling%2F5.1=
0&amp;amp;data=3D04%7C01%7Cflorian.bezdeka%40siemens.com%7C74ce6e998d594fed=
802908d91a032725%7C38ae3bcd95794fd4addab42e1495d55a%7C1%7C0%7C6375694231107=
10081%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6I=
k1haWwiLCJXVCI6Mn0%3D%7C1000&amp;amp;sdata=3DlM97dJOoqAwpgSrhyxCsFs5AOS%2F%=
2Fik2nkNjCVZ6aiW8%3D&amp;amp;reserved=3D0" target=3D"_blank" rel=3D"nofollo=
w" data-saferedirecturl=3D"https://www.google.com/url?hl=3Dzh-CN&amp;q=3Dht=
tps://eur01.safelinks.protection.outlook.com/?url%3Dhttps%253A%252F%252Fgit=
hub.com%252Fsiemens%252Flinux%252Ftree%252Fjailhouse-enabling%252F5.10%26am=
p;data%3D04%257C01%257Cflorian.bezdeka%2540siemens.com%257C74ce6e998d594fed=
802908d91a032725%257C38ae3bcd95794fd4addab42e1495d55a%257C1%257C0%257C63756=
9423110710081%257CUnknown%257CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luM=
zIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%253D%257C1000%26amp;sdata%3DlM97dJOoqAwpgSrh=
yxCsFs5AOS%252F%252Fik2nkNjCVZ6aiW8%253D%26amp;reserved%3D0&amp;source=3Dgm=
ail&amp;ust=3D1621562142862000&amp;usg=3DAFQjCNGgfiasQ1aZjH1p2QErL0cQ1HXiBw=
">https://eur01.safelinks.protection.outlook.com/?url=3Dhttps%3A%2F%2Fgithu=
b.com%2Fsiemens%2Flinux%2Ftree%2Fjailhouse-enabling%2F5.10&amp;amp;data=3D0=
4%7C01%7Cflorian.bezdeka%40siemens.com%7C74ce6e998d594fed802908d91a032725%7=
C38ae3bcd95794fd4addab42e1495d55a%7C1%7C0%7C637569423110710081%7CUnknown%7C=
TWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0=
%3D%7C1000&amp;amp;sdata=3DlM97dJOoqAwpgSrhyxCsFs5AOS%2F%2Fik2nkNjCVZ6aiW8%=
3D&amp;amp;reserved=3D0</a>
<br>
<br>That is exactly what I did a few days ago. Using one of the JH
<br>&quot;prepared&quot; Linux trees solved the compilation error.
<br>
<br>It looks like some of the necessary symbols are not visible anymore for
<br>out of tree builds, but I did not check it yet.
<br>
<br>&gt;=20
<br>&gt; There are other jailhouse-enabling branches as well. Find one that=
 is
<br>&gt; close to your distro kernel and compile a custom kernel.
<br>&gt;=20
<br>&gt; regards,
<br>&gt; Henning
<br>&gt;=20
<br>&gt;=20
<br>
<br>
<br>--=20
<br>Siemens AG, T RDA IOT
<br>Corporate Competence Center Embedded Linux
<br></blockquote></div>

<p></p>

-- <br />
You received this message because you are subscribed to the Google Groups &=
quot;Jailhouse&quot; group.<br />
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to <a href=3D"mailto:jailhouse-dev+unsubscribe@googlegroups.com">jailh=
ouse-dev+unsubscribe@googlegroups.com</a>.<br />
To view this discussion on the web visit <a href=3D"https://groups.google.c=
om/d/msgid/jailhouse-dev/73b31f17-7d10-4be5-83ec-d65f4522ba9dn%40googlegrou=
ps.com?utm_medium=3Demail&utm_source=3Dfooter">https://groups.google.com/d/=
msgid/jailhouse-dev/73b31f17-7d10-4be5-83ec-d65f4522ba9dn%40googlegroups.co=
m</a>.<br />

------=_Part_1727_1422119724.1621593965613--

------=_Part_1726_565774955.1621593965613--
