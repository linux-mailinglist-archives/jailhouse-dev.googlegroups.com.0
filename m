Return-Path: <jailhouse-dev+bncBCQ7HUU4XULBBSX53XYAKGQEMPTN6PQ@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-ot1-x33c.google.com (mail-ot1-x33c.google.com [IPv6:2607:f8b0:4864:20::33c])
	by mail.lfdr.de (Postfix) with ESMTPS id 50C03136110
	for <lists+jailhouse-dev@lfdr.de>; Thu,  9 Jan 2020 20:28:12 +0100 (CET)
Received: by mail-ot1-x33c.google.com with SMTP id z3sf4270983oto.22
        for <lists+jailhouse-dev@lfdr.de>; Thu, 09 Jan 2020 11:28:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:date:from:to:message-id:in-reply-to:references:subject
         :mime-version:x-original-sender:precedence:mailing-list:list-id
         :list-post:list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=GsZWq+Pavq7zLAq0AK6AYSMoWOR0BB2OJ7p3i+oKVFs=;
        b=TzTdYDDIkepktDSFTB927DbEzoa2NYRqFYRso3ltot31OpLxILEb3tHWe+nDbdXF6D
         3h0iHV11oJ8y5id00oX6W/I39E13uz20M7UzsU4lzz18gOFu3P1XqPH0pSmtpbLainBy
         ZdYlNlODQOU5s0QSCbR8u8R2Xxk1FC9YuzcqG8WsxwA9cxKxI+1BlNbWZejJR3uw3dyp
         V9micTagljvv80gYnmXaLhhB7tgDbX5ck+UkSXuUC7zdSVuMW0qlafyq2idJ3FYqKHwh
         xjleDsrdMpfGrf70iMD1KLdASZzspQz8j2zEZ19NRKmCgJskkNyn9cy7gSJ0faREgXev
         uYjA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:message-id:in-reply-to:references:subject:mime-version
         :x-original-sender:precedence:mailing-list:list-id:list-post
         :list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=GsZWq+Pavq7zLAq0AK6AYSMoWOR0BB2OJ7p3i+oKVFs=;
        b=QMFgpT7H00ImW8cbj8V2NG2eyYkAHpOSl/MezFnBx5CNPz6qJsET/eM1NKRHGQjt/P
         MvmB7BL6XL+CqcVYhwvJ7JeiLpw50cx284+aIHg3OBx6XCxYHEO0QH6yhvE09WyE9mrc
         T1y+zeVSmFc+t3oYkgXolf6OzjlHan2ND0S0c85QCQ4bMOjntnfgWzZpmyjO8zVRGmeF
         qG5eHl/yk8EEufjKFd8Kj3TLwop93M5UhAZKLFyFW6kb3yk0JqlgsdN60eOjsUF8YFh6
         sfebici0qJCGQfEvHTCLqhV3aIrQa251+9EQLuyekHdSsFEviPT+55pY2/8Rd6ggkXoE
         bD8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:date:from:to:message-id:in-reply-to
         :references:subject:mime-version:x-original-sender:precedence
         :mailing-list:list-id:x-spam-checked-in-group:list-post:list-help
         :list-archive:list-subscribe:list-unsubscribe;
        bh=GsZWq+Pavq7zLAq0AK6AYSMoWOR0BB2OJ7p3i+oKVFs=;
        b=I/OGnmsZmHF3o8XzH/hlInLE0ewqinvYGD6rqJTvc5KNpTPezWXfPhO9eNmgl9AsuH
         7r2dCW+uFC3mqanI7gkmHCkiavu6Rsui88dpr3Z0UXTHqKuKrUtBZgGUfRQnmBbQiBvg
         XMd1VlwOsPtFXwnVC41isOyi23eDXPHrOzGPKjH/EPGG8Fv6/oWOkfeVjVH3mrtL6I8g
         NridjEJmIk6ejXKbp1zGLlkDjTkCYxFeGLttvMgq06I3ml8JjvJLdxcUxgUQ+hpdfUZH
         9HIsdG3EaMD0eXLOqV6rosiVKfMTOJBICEn5w+b//z0RFmNyvW6CWID2rOjNwV93U61j
         W3+Q==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: APjAAAWLfkmTZF58IeQ89g+3538JFTyHv8XWX43N9pxO0XE80i07SEi8
	fTkdkgJn0Xqe2h+vRIm/V8Y=
X-Google-Smtp-Source: APXvYqyYEz5a8avgP+q279pOSVp7Tz0sbtI9qImAc2gtmmgqdrOpgc1qAXevMZ7tYDsXmX6wqj1sNw==
X-Received: by 2002:aca:534f:: with SMTP id h76mr4540254oib.23.1578598091081;
        Thu, 09 Jan 2020 11:28:11 -0800 (PST)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a9d:60d0:: with SMTP id b16ls611221otk.0.gmail; Thu, 09 Jan
 2020 11:28:10 -0800 (PST)
X-Received: by 2002:a9d:588c:: with SMTP id x12mr9620134otg.2.1578598090297;
        Thu, 09 Jan 2020 11:28:10 -0800 (PST)
Date: Thu, 9 Jan 2020 11:28:09 -0800 (PST)
From: Saroj Sapkota <samirroj2016@gmail.com>
To: Jailhouse <jailhouse-dev@googlegroups.com>
Message-Id: <dd8368be-e94d-41cf-9bf7-654094e623f3@googlegroups.com>
In-Reply-To: <3f685f85-d1ba-4619-6d0a-06b6b675c60f@siemens.com>
References: <b33c1868-f6be-4e7c-8b23-7d7bdf75f15e@googlegroups.com>
 <3f685f85-d1ba-4619-6d0a-06b6b675c60f@siemens.com>
Subject: Re: ssh don't work on jailhouse-images and how to create two cell
 one with application and another with linux on jailhouse-image demo
MIME-Version: 1.0
Content-Type: multipart/mixed; 
	boundary="----=_Part_373_214089516.1578598089608"
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

------=_Part_373_214089516.1578598089608
Content-Type: multipart/alternative; 
	boundary="----=_Part_374_651712537.1578598089609"

------=_Part_374_651712537.1578598089609
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

*Yes, I tried after enabling  jailhouse by first command I tried to open=20
jailhouse console by typing second command but it results same thing as=20
jailhouse enable command as shown below:*
root@demo:~# jailhouse enable /etc/jailhouse/qemu-arm64.cell

Initializing Jailhouse hypervisor v0.11 (0-g58052a7a-dirty) on CPU 0
Code location: 0x0000ffffc0200800
Page pool usage after early setup: mem 87/996, remap 0/131072
Initializing processors:
 CPU 0... OK
 CPU 12... OK
 CPU 9... OK
 CPU 6... OK
 CPU 13... OK
 CPU 15... OK
 CPU 8... OK
 CPU 14... OK
 CPU 10... OK
 CPU 11... OK
 CPU 5... OK
 CPU 2... OK
 CPU 4... OK
 CPU 3... OK
 CPU 7... OK
 CPU 1... OK
Initializing unit: irqchip
Initializing unit: PCI
Adding virtual PCI device 00:00.0 to cell "qemu-arm64"
Page pool usage after late setup: mem 143/996, remap 528/131072
Activating hypervisor
root@demo:~#  jailhouse console

Initializing Jailhouse hypervisor v0.11 (0-g58052a7a-dirty) on CPU 0
Code location: 0x0000ffffc0200800
Page pool usage after early setup: mem 87/996, remap 0/131072
Initializing processors:
 CPU 0... OK
 CPU 12... OK
 CPU 9... OK
 CPU 6... OK
 CPU 13... OK
 CPU 15... OK
 CPU 8... OK
 CPU 14... OK
 CPU 10... OK
 CPU 11... OK
 CPU 5... OK
 CPU 2... OK
 CPU 4... OK
 CPU 3... OK
 CPU 7... OK
 CPU 1... OK
Initializing unit: irqchip
Initializing unit: PCI
Adding virtual PCI device 00:00.0 to cell "qemu-arm64"
Page pool usage after late setup: mem 143/996, remap 528/131072
Activating hypervisor
root@demo:~#=20
*why I don't get jailhouse console?*
*other command goes well and I can create cell for apic demo and load it=20
and start it on the host terminal and it continuously run I can't destroy=
=20
the cell as it is running on the same terminal. So, Main problem is i'm=20
unable to get jailhouse console and control it from terminal. How can I do=
=20
that?*

*the sample output and command result is below: once cell is started=20
neither I can destroy it or terminate it.*

root@demo:~# jailhouse cell create /etc/jailhouse/qemu-arm64-gic-
demo.cell
Created cell "gic-demo"
Page pool usage after cell creation: mem 154/996, remap 528/131072
root@demo:~# jailhouse cell load gic-demo=20
/usr/libexec/jailhouse/demos/gic-demo.bin
Cell "gic-demo" can be loaded
root@demo:~# jailhouse cell start gic-demo
Started cell "gic-demo"
Initializing the GIC...
Initializing the timer...
root@demo:~# Timer fired, jitter: 370435 ns, min: 370435 ns, max: 370435 ns
Timer fired, jitter: 330999 ns, min: 330999 ns, max: 370435 ns
Timer fired, jitter: 155290 ns, min: 155290 ns, max: 370435 ns
Timer fired, jitter: 385564 ns, min: 155290 ns, max: 385564 ns
Timer fired, jitter: 203096 ns, min: 155290 ns, max: 385564 ns
Timer fired, jitter: 189354 ns, min: 155290 ns, max: 385564 ns
Timer fired, jitter: 172258 ns, min: 155290 ns, max: 385564 ns
Timer fired, jitter: 495612 ns, min: 155290 ns, max: 495612 ns
Timer fired, jitter: 199322 ns, min: 155290 ns, max: 495612 ns
Timer fired, jitter: 151016 ns, min: 151016 ns, max: 495612 ns
Timer fired, jitter: 232209 ns, min: 151016 ns, max: 495612 ns
Timer fired, jitter:  63806 ns, min:  63806 ns, max: 495612 ns
Timer fired, jitter: 245225 ns, min:  63806 ns, max: 495612 ns
Timer fired, jitter: 242596 ns, min:  63806 ns, max: 495612 ns
Timer fired, jitter: 159903 ns, min:  63806 ns, max: 495612 ns
Timer fired, jitter: 153548 ns, min:  63806 ns, max: 495612 ns
Timer fired, jitter: 193016 ns, min:  63806 ns, max: 495612 ns
Timer fired, jitter: 339741 ns, min:  63806 ns, max: 495612 ns
Timer fired, jitter: 219532 ns, min:  63806 ns, max: 495612 ns
Timer fired, jitter: 412258 ns, min:  63806 ns, max: 495612 ns
Timer fired, jitter: 197725 ns, min:  63806 ns, max: 495612 ns
Timer fired, jitter: 290612 ns, min:  63806 ns, max: 495612 ns
Timer fired, jitter: 225112 ns, min:  63806 ns, max: 495612 ns
Timer fired, jitter: 386258 ns, min:  63806 ns, max: 495612 ns
Timer fired, jitter: 198854 ns, min:  63806 ns, max: 495612 ns
Timer fired, jitter: 173806 ns, min:  63806 ns, max: 495612 ns
Timer fired, jitter: 247354 ns, min:  63806 ns, max: 495612 ns
Timer fired, jitter: 379548 ns, min:  63806 ns, max: 495612 ns
Timer fired, jitter: 174709 ns, min:  63806 ns, max: 495612 ns
Timer fired, jitter: 400241 ns, min:  63806 ns, max: 495612 ns
Timer fired, jitter:  77838 ns, min:  63806 ns, max: 495612 ns


On Thursday, January 9, 2020 at 3:06:41 AM UTC-6, Jan Kiszka wrote:
>
> On 08.01.20 21:54, Saroj Sapkota wrote:=20
>  All the requirement docker, qemu, kernel updated to latest as mentioned=
=20
> > in read.md and the results are:=20
> > sarojs@engee-e121-d08:/$ docker --version=20
> > Docker version 19.03.4, build 9013bf583a=20
> > sarojs@engee-e121-d08:/$ qemu-system-x86_64 --version=20
> > QEMU emulator version 4.1.0=20
> > Copyright (c) 2003-2019 Fabrice Bellard and the QEMU Project developers=
=20
> > sarojs@engee-e121-d08:/$ uname -r=20
> > 4.4.0-167-generic=20
> > *after this I run build-images.sh and then finally start-qemu.sh*=20
> > *and the results is:*=20
> >=20
> > sarojs@engee-e121-d08:~/Downloads/jailhouse-images$ ./start-qemu.sh=20
> arm64=20
> > VNC server running on 127.0.0.1:5900=20
> > [    0.000000] Booting Linux on physical CPU 0x0000000000 [0x411fd070]=
=20
> > [    0.000000] Linux version 4.19.67 (builder@bc528e2a57f1) (gcc versio=
n=20
> > 8.3.0 (Debian 8.3.0-2)) #1 SMP PREEMPT Tue Nov 5 18:52:36 UTC 2019=20
> > [    0.000000] Machine model: linux,dummy-virt=20
> > [    0.000000] Memory limited to 768MB=20
> > [    0.000000] efi: Getting EFI parameters from FDT:=20
> > [    0.000000] efi: UEFI not found.=20
> > [    0.000000] cma: Reserved 16 MiB at 0x000000006f000000=20
> > [    0.000000] NUMA: No NUMA configuration found=20
> > [    0.000000] NUMA: Faking a node at [mem=20
> > 0x0000000000000000-0x000000006fffffff]=20
> > [    0.000000] NUMA: NODE_DATA [mem 0x6efe8480-0x6efe9c3f]=20
> > [    0.000000] Zone ranges:=20
> > [    0.000000]   DMA32    [mem 0x0000000040000000-0x000000006fffffff]=
=20
> > [    0.000000]   Normal   empty=20
> > [    0.000000] Movable zone start for each node=20
> > [    0.000000] Early memory node ranges=20
> > [    0.000000]   node   0: [mem 0x0000000040000000-0x000000006fffffff]=
=20
> > [    0.000000] Initmem setup node 0 [mem=20
> > 0x0000000040000000-0x000000006fffffff]=20
> > [    0.000000] psci: probing for conduit method from DT.=20
> > [    0.000000] psci: PSCIv0.2 detected in firmware.=20
> > [    0.000000] psci: Using standard PSCI v0.2 function IDs=20
> > [    0.000000] psci: Trusted OS migration not required=20
> > [    0.000000] random: get_random_bytes called from=20
> > start_kernel+0x94/0x400 with crng_init=3D0=20
> > [    0.000000] percpu: Embedded 22 pages/cpu s53016 r8192 d28904 u90112=
=20
> > [    0.000000] Detected PIPT I-cache on CPU0=20
> > [    0.000000] CPU features: enabling workaround for ARM erratum 832075=
=20
> > [    0.000000] CPU features: enabling workaround for EL2 vector=20
> hardening=20
> > [    0.000000] CPU features: detected: Kernel page table isolation=20
> (KPTI)=20
> > [    0.000000] Built 1 zonelists, mobility grouping on.  Total pages:=
=20
> 193536=20
> > [    0.000000] Policy zone: DMA32=20
> > [    0.000000] Kernel command line:              root=3D/dev/vda mem=3D=
768M=20
> > [    0.000000] Memory: 729472K/786432K available (10044K kernel code,=
=20
> > 1294K rwdata, 4312K rodata, 1152K init, 369K bss, 40576K reserved,=20
> > 16384K cma-reserved)=20
> > [    0.000000] SLUB: HWalign=3D64, Order=3D0-3, MinObjects=3D0, CPUs=3D=
16,=20
> Nodes=3D1=20
> > [    0.000000] rcu: Preemptible hierarchical RCU implementation.=20
> > [    0.000000] rcu:     RCU restricting CPUs from NR_CPUS=3D64 to=20
> > nr_cpu_ids=3D16.=20
> > [    0.000000]     Tasks RCU enabled.=20
> > [    0.000000] rcu: Adjusting geometry for rcu_fanout_leaf=3D16,=20
> nr_cpu_ids=3D16=20
> > [    0.000000] NR_IRQS: 64, nr_irqs: 64, preallocated irqs: 0=20
> > [    0.000000] GICv3: GIC: Using split EOI/Deactivate mode=20
> > [    0.000000] GICv3: Distributor has no Range Selector support=20
> > [    0.000000] GICv3: no VLPI support, no direct LPI support=20
> > [    0.000000] GICv3: CPU0: found redistributor 0 region=20
> > 0:0x00000000080a0000=20
> > [    0.000000] arch_timer: cp15 timer(s) running at 62.50MHz (phys).=20
> > [    0.000000] clocksource: arch_sys_counter: mask: 0xffffffffffffff=20
> > max_cycles: 0x1cd42e208c, max_idle_ns: 881590405314 ns=20
> > [    0.000167] sched_clock: 56 bits at 62MHz, resolution 16ns, wraps=20
> > every 4398046511096ns=20
> > [    0.009196] Console: colour dummy device 80x25=20
> > [    0.011540] console [tty0] enabled=20
> > [    0.014855] Calibrating delay loop (skipped), value calculated using=
=20
> > timer frequency.. 125.00 BogoMIPS (lpj=3D250000)=20
> > [    0.015058] pid_max: default: 32768 minimum: 301=20
> > [    0.016528] Security Framework initialized=20
> > [    0.018663] Dentry cache hash table entries: 131072 (order: 8,=20
> > 1048576 bytes)=20
> > [    0.019461] Inode-cache hash table entries: 65536 (order: 7, 524288=
=20
> > bytes)=20
> > [    0.019731] Mount-cache hash table entries: 2048 (order: 2, 16384=20
> bytes)=20
> > [    0.019824] Mountpoint-cache hash table entries: 2048 (order: 2,=20
> > 16384 bytes)=20
> > [    0.082413] ASID allocator initialised with 32768 entries=20
> > [    0.090745] rcu: Hierarchical SRCU implementation.=20
> > [    0.121397] EFI services will not be available.=20
> > [    0.131213] smp: Bringing up secondary CPUs ...=20
> > [    0.163456] Detected PIPT I-cache on CPU1=20
> > [    0.165414] GICv3: CPU1: found redistributor 1 region=20
> > 0:0x00000000080c0000=20
> > [    0.165996] CPU1: Booted secondary processor 0x0000000001=20
> [0x411fd070]=20
> > [    0.209014] Detected PIPT I-cache on CPU2=20
> > [    0.209110] GICv3: CPU2: found redistributor 2 region=20
> > 0:0x00000000080e0000=20
> > [    0.209225] CPU2: Booted secondary processor 0x0000000002=20
> [0x411fd070]=20
> > [    0.241807] Detected PIPT I-cache on CPU3=20
> > [    0.241941] GICv3: CPU3: found redistributor 3 region=20
> > 0:0x0000000008100000=20
> > [    0.242103] CPU3: Booted secondary processor 0x0000000003=20
> [0x411fd070]=20
> > [    0.276834] Detected PIPT I-cache on CPU4=20
> > [    0.277172] GICv3: CPU4: found redistributor 4 region=20
> > 0:0x0000000008120000=20
> > [    0.277537] CPU4: Booted secondary processor 0x0000000004=20
> [0x411fd070]=20
> > [    0.316327] Detected PIPT I-cache on CPU5=20
> > [    0.316709] GICv3: CPU5: found redistributor 5 region=20
> > 0:0x0000000008140000=20
> > [    0.317101] CPU5: Booted secondary processor 0x0000000005=20
> [0x411fd070]=20
> > [    0.356252] Detected PIPT I-cache on CPU6=20
> > [    0.356626] GICv3: CPU6: found redistributor 6 region=20
> > 0:0x0000000008160000=20
> > [    0.357149] CPU6: Booted secondary processor 0x0000000006=20
> [0x411fd070]=20
> > [    0.394943] Detected PIPT I-cache on CPU7=20
> > [    0.395074] GICv3: CPU7: found redistributor 7 region=20
> > 0:0x0000000008180000=20
> > [    0.395224] CPU7: Booted secondary processor 0x0000000007=20
> [0x411fd070]=20
> > [    0.427866] Detected PIPT I-cache on CPU8=20
> > [    0.428003] GICv3: CPU8: found redistributor 8 region=20
> > 0:0x00000000081a0000=20
> > [    0.428163] CPU8: Booted secondary processor 0x0000000008=20
> [0x411fd070]=20
> > [    0.483476] Detected PIPT I-cache on CPU9=20
> > [    0.483774] GICv3: CPU9: found redistributor 9 region=20
> > 0:0x00000000081c0000=20
> > [    0.484125] CPU9: Booted secondary processor 0x0000000009=20
> [0x411fd070]=20
> > [    0.517943] Detected PIPT I-cache on CPU10=20
> > [    0.518510] GICv3: CPU10: found redistributor a region=20
> > 0:0x00000000081e0000=20
> > [    0.519101] CPU10: Booted secondary processor 0x000000000a=20
> [0x411fd070]=20
> > [    0.556796] Detected PIPT I-cache on CPU11=20
> > [    0.557390] GICv3: CPU11: found redistributor b region=20
> > 0:0x0000000008200000=20
> > [    0.557984] CPU11: Booted secondary processor 0x000000000b=20
> [0x411fd070]=20
> > [    0.594707] Detected PIPT I-cache on CPU12=20
> > [    0.595031] GICv3: CPU12: found redistributor c region=20
> > 0:0x0000000008220000=20
> > [    0.595533] CPU12: Booted secondary processor 0x000000000c=20
> [0x411fd070]=20
> > [    0.628692] Detected PIPT I-cache on CPU13=20
> > [    0.629111] GICv3: CPU13: found redistributor d region=20
> > 0:0x0000000008240000=20
> > [    0.629460] CPU13: Booted secondary processor 0x000000000d=20
> [0x411fd070]=20
> > [    0.662432] Detected PIPT I-cache on CPU14=20
> > [    0.662815] GICv3: CPU14: found redistributor e region=20
> > 0:0x0000000008260000=20
> > [    0.663338] CPU14: Booted secondary processor 0x000000000e=20
> [0x411fd070]=20
> > [    0.701173] Detected PIPT I-cache on CPU15=20
> > [    0.701480] GICv3: CPU15: found redistributor f region=20
> > 0:0x0000000008280000=20
> > [    0.701830] CPU15: Booted secondary processor 0x000000000f=20
> [0x411fd070]=20
> > [    0.703285] smp: Brought up 1 node, 16 CPUs=20
> > [    0.709495] SMP: Total of 16 processors activated.=20
> > [    0.709877] CPU features: detected: GIC system register CPU interfac=
e=20
> > [    0.710137] CPU features: detected: 32-bit EL0 Support=20
> > [    0.932452] CPU: All CPU(s) started at EL2=20
> > [    0.965064] alternatives: patching kernel code=20
> > [    1.021311] devtmpfs: initialized=20
> > [    1.038681] clocksource: jiffies: mask: 0xffffffff max_cycles:=20
> > 0xffffffff, max_idle_ns: 7645041785100000 ns=20
> > [    1.039229] futex hash table entries: 4096 (order: 6, 262144 bytes)=
=20
> > [    1.044588] pinctrl core: initialized pinctrl subsystem=20
> > [    1.062703] DMI not present or invalid.=20
> > [    1.069419] NET: Registered protocol family 16=20
> > [    1.074197] audit: initializing netlink subsys (disabled)=20
> > [    1.076449] audit: type=3D2000 audit(0.776:1): state=3Dinitialized=
=20
> > audit_enabled=3D0 res=3D1=20
> > [    1.084715] cpuidle: using governor menu=20
> > [    1.086698] vdso: 2 pages (1 code @ (____ptrval____), 1 data @=20
> > (____ptrval____))=20
> > [    1.086870] hw-breakpoint: found 6 breakpoint and 4 watchpoint=20
> registers.=20
> > [    1.100600] DMA: preallocated 256 KiB pool for atomic allocations=20
> > [    1.105252] Serial: AMBA PL011 UART driver=20
> > [    1.142651] 9000000.pl011: ttyAMA0 at MMIO 0x9000000 (irq =3D 40,=20
> > base_baud =3D 0) is a PL011 rev1=20
> > [    1.165136] console [ttyAMA0] enabled=20
> > [    1.370391] HugeTLB registered 2.00 MiB page size, pre-allocated 0=
=20
> pages=20
> > [    1.375592] cryptd: max_cpu_qlen set to 1000=20
> > [    1.381172] ACPI: Interpreter disabled.=20
> > [    1.386213] vgaarb: loaded=20
> > [    1.388929] SCSI subsystem initialized=20
> > [    1.394115] usbcore: registered new interface driver usbfs=20
> > [    1.394984] usbcore: registered new interface driver hub=20
> > [    1.396038] usbcore: registered new device driver usb=20
> > [    1.404071] pps_core: LinuxPPS API ver. 1 registered=20
> > [    1.404564] pps_core: Software ver. 5.3.6 - Copyright 2005-2007=20
> > Rodolfo Giometti <giom...@linux.it <javascript:>>=20
> > [    1.405492] PTP clock support registered=20
> > [    1.407076] EDAC MC: Ver: 3.0.0=20
> > [    1.492705] clocksource: Switched to clocksource arch_sys_counter=20
> > [    1.509419] VFS: Disk quotas dquot_6.6.0=20
> > [    1.509874] VFS: Dquot-cache hash table entries: 512 (order 0, 4096=
=20
> > bytes)=20
> > [    1.512450] pnp: PnP ACPI: disabled=20
> > [    1.568294] NET: Registered protocol family 2=20
> > [    1.584108] tcp_listen_portaddr_hash hash table entries: 512 (order:=
=20
> > 1, 8192 bytes)=20
> > [    1.584780] TCP established hash table entries: 8192 (order: 4, 6553=
6=20
> > bytes)=20
> > [    1.585583] TCP bind hash table entries: 8192 (order: 5, 131072=20
> bytes)=20
> > [    1.586009] TCP: Hash tables configured (established 8192 bind 8192)=
=20
> > [    1.588606] UDP hash table entries: 512 (order: 2, 16384 bytes)=20
> > [    1.589179] UDP-Lite hash table entries: 512 (order: 2, 16384 bytes)=
=20
> > [    1.592560] NET: Registered protocol family 1=20
> > [    1.598547] RPC: Registered named UNIX socket transport module.=20
> > [    1.598784] RPC: Registered udp transport module.=20
> > [    1.598954] RPC: Registered tcp transport module.=20
> > [    1.599110] RPC: Registered tcp NFSv4.1 backchannel transport module=
.=20
> > [    1.602869] Unpacking initramfs...=20
> > [    1.847907] Freeing initrd memory: 4292K=20
> > [    1.857706] hw perfevents: enabled with armv8_pmuv3 PMU driver, 5=20
> > counters available=20
> > [    1.879734] Initialise system trusted keyrings=20
> > [    1.883324] workingset: timestamp_bits=3D44 max_order=3D18 bucket_or=
der=3D0=20
> > [    1.912683] squashfs: version 4.0 (2009/01/31) Phillip Lougher=20
> > [    1.918361] NFS: Registering the id_resolver key type=20
> > [    1.918781] Key type id_resolver registered=20
> > [    1.919012] Key type id_legacy registered=20
> > [    1.919442] nfs4filelayout_init: NFSv4 File Layout Driver=20
> Registering...=20
> > [    1.921845] 9p: Installing v9fs 9p2000 file system support=20
> > [    1.942598] Key type asymmetric registered=20
> > [    1.942860] Asymmetric key parser 'x509' registered=20
> > [    1.943281] Block layer SCSI generic (bsg) driver version 0.4 loaded=
=20
> > (major 246)=20
> > [    1.944068] io scheduler noop registered=20
> > [    1.944699] io scheduler cfq registered (default)=20
> > [    1.945362] io scheduler mq-deadline registered=20
> > [    1.945581] io scheduler kyber registered=20
> > [    1.975723] pl061_gpio 9030000.pl061: PL061 GPIO chip=20
> > @0x0000000009030000 registered=20
> > [    1.985874] pci-host-generic 4010000000.pcie: host bridge=20
> > /pcie@10000000 ranges:=20
> > [    1.986737] pci-host-generic 4010000000.pcie:    IO=20
> > 0x3eff0000..0x3effffff -> 0x00000000=20
> > [    1.987598] pci-host-generic 4010000000.pcie:   MEM=20
> > 0x10000000..0x3efeffff -> 0x10000000=20
> > [    1.987882] pci-host-generic 4010000000.pcie:   MEM=20
> > 0x8000000000..0xffffffffff -> 0x8000000000=20
> > [    1.989836] pci-host-generic 4010000000.pcie: ECAM at [mem=20
> > 0x4010000000-0x401fffffff] for [bus 00-ff]=20
> > [    1.992336] pci-host-generic 4010000000.pcie: PCI host bridge to bus=
=20
> > 0000:00=20
> > [    1.993286] pci_bus 0000:00: root bus resource [bus 00-ff]=20
> > [    1.993814] pci_bus 0000:00: root bus resource [io  0x0000-0xffff]=
=20
> > [    1.994028] pci_bus 0000:00: root bus resource [mem=20
> > 0x10000000-0x3efeffff]=20
> > [    1.994300] pci_bus 0000:00: root bus resource [mem=20
> > 0x8000000000-0xffffffffff]=20
> > [    2.088592] Serial: 8250/16550 driver, 4 ports, IRQ sharing enabled=
=20
> > [    2.095955] SuperH (H)SCI(F) driver initialized=20
> > [    2.097903] msm_serial: driver initialized=20
> > [    2.118236] cacheinfo: Unable to detect cache hierarchy for CPU 0=20
> > [    2.168640] loop: module loaded=20
> > [    2.193407] virtio_blk virtio1: [vda] 2694416 512-byte logical block=
s=20
> > (1.38 GB/1.28 GiB)=20
> > [    2.240577] libphy: Fixed MDIO Bus: probed=20
> > [    2.244779] tun: Universal TUN/TAP device driver, 1.6=20
> > [    2.263829] e1000e: Intel(R) PRO/1000 Network Driver - 3.2.6-k=20
> > [    2.264102] e1000e: Copyright(c) 1999 - 2015 Intel Corporation.=20
> > [    2.264632] igb: Intel(R) Gigabit Ethernet Network Driver - version=
=20
> > 5.4.0-k=20
> > [    2.265235] igb: Copyright (c) 2007-2014 Intel Corporation.=20
> > [    2.265878] igbvf: Intel(R) Gigabit Virtual Function Network Driver =
-=20
> > version 2.4.0-k=20
> > [    2.266286] igbvf: Copyright (c) 2009 - 2012 Intel Corporation.=20
> > [    2.268481] sky2: driver version 1.30=20
> > [    2.271790] VFIO - User Level meta-driver version: 0.3=20
> > [    2.279480] ehci_hcd: USB 2.0 'Enhanced' Host Controller (EHCI)=20
> Driver=20
> > [    2.279971] ehci-pci: EHCI PCI platform driver=20
> > [    2.280718] ehci-platform: EHCI generic platform driver=20
> > [    2.281717] ehci-orion: EHCI orion driver=20
> > [    2.282216] ehci-exynos: EHCI EXYNOS driver=20
> > [    2.282661] ohci_hcd: USB 1.1 'Open' Host Controller (OHCI) Driver=
=20
> > [    2.283018] ohci-pci: OHCI PCI platform driver=20
> > [    2.283770] ohci-platform: OHCI generic platform driver=20
> > [    2.284438] ohci-exynos: OHCI EXYNOS driver=20
> > [    2.291438] usbcore: registered new interface driver usb-storage=20
> > [    2.306327] rtc-pl031 9010000.pl031: rtc core: registered pl031 as=
=20
> rtc0=20
> > [    2.309554] i2c /dev entries driver=20
> > [    2.323629] sdhci: Secure Digital Host Controller Interface driver=
=20
> > [    2.324065] sdhci: Copyright(c) Pierre Ossman=20
> > [    2.326027] Synopsys Designware Multimedia Card Interface Driver=20
> > [    2.331478] sdhci-pltfm: SDHCI platform and OF driver helper=20
> > [    2.338411] ledtrig-cpu: registered to indicate activity on CPUs=20
> > [    2.344584] usbcore: registered new interface driver usbhid=20
> > [    2.345111] usbhid: USB HID core driver=20
> > [    2.361241] NET: Registered protocol family 10=20
> > [    2.386925] Segment Routing with IPv6=20
> > [    2.387956] NET: Registered protocol family 17=20
> > [    2.390680] 9pnet: Installing 9P2000 support=20
> > [    2.391618] Key type dns_resolver registered=20
> > [    2.394251] registered taskstats version 1=20
> > [    2.394446] Loading compiled-in X.509 certificates=20
> > [    2.408606] input: gpio-keys as=20
> /devices/platform/gpio-keys/input/input0=20
> > [    2.413248] rtc-pl031 9010000.pl031: setting system clock to=20
> > 2020-01-08 20:39:44 UTC (1578515984)=20
> > [    2.424182] uart-pl011 9000000.pl011: no DMA platform data=20
> > [    2.668052] Freeing unused kernel memory: 1152K=20
> > [    2.676760] Run /init as init process=20
> > Loading, please wait...=20
> > Starting version 241=20
> > Begin: Loading essential drivers ... done.=20
> > Begin: Running /scripts/init-premount ... done.=20
> > Begin: Mounting root file system ... Begin: Running /scripts/local-top=
=20
> > ... done.=20
> > Begin: Running /scripts/local-premount ... done.=20
> > Warning: fsck not present, so skipping root file system=20
> > [    6.458709] EXT4-fs (vda): INFO: recovery required on readonly=20
> filesystem=20
> > [    6.459146] EXT4-fs (vda): write access will be enabled during=20
> recovery=20
> > [    6.562511] EXT4-fs (vda): recovery complete=20
> > [    6.586139] EXT4-fs (vda): mounted filesystem with ordered data mode=
.=20
> > Opts: (null)=20
> > done.=20
> > Begin: Running /scripts/local-bottom ... done.=20
> > Begin: Running /scripts/init-bottom ... done.=20
> > [    6.984092] random: fast init done=20
> > [    7.625962] systemd[1]: systemd 241 running in system mode. (+PAM=20
> > +AUDIT +SELINUX +IMA +APPARMOR +SMACK +SYSVINIT +UTMP +LIBCRYPTSETUP=20
> > +GCRYPT +GNUTLS +ACL +XZ +LZ4 +SECCOMP +BLKID +ELFUTILS +KMOD -IDN2 +ID=
N=20
> > -PCRE2 default-hierarchy=3Dhybrid)=20
> > [    7.630537] systemd[1]: Detected virtualization qemu.=20
> > [    7.631210] systemd[1]: Detected architecture arm64.=20
> >=20
> > Welcome to Debian GNU/Linux 10 (buster)!=20
> >=20
> > [    7.699983] systemd[1]: Set hostname to <demo>.=20
> > [    7.751547] systemd[1]: Failed to bump fs.file-max, ignoring: Invali=
d=20
> > argument=20
> > [    9.000192] systemd[1]: File=20
> > /lib/systemd/system/systemd-journald.service:12 configures an IP=20
> > firewall (IPAddressDeny=3Dany), but the local system does not support=
=20
> > BPF/cgroup based firewalling.=20
> > [    9.001046] systemd[1]: Proceeding WITHOUT firewalling in effect!=20
> > (This warning is only shown for the first loaded unit using IP=20
> firewalling.)=20
> > [    9.705779] random: systemd: uninitialized urandom read (16 bytes=20
> read)=20
> > [    9.749841] random: systemd: uninitialized urandom read (16 bytes=20
> read)=20
> > [    9.762078] systemd[1]: Listening on Journal Socket.=20
> > [  OK  ] Listening on Journal Socket.=20
> > [    9.767359] random: systemd: uninitialized urandom read (16 bytes=20
> read)=20
> > [    9.770462] systemd[1]: Listening on initctl Compatibility Named=20
> Pipe.=20
> > [  OK  ] Listening on initctl Compatibility Named Pipe.=20
> > [    9.834070] systemd[1]: Starting Remount Root and Kernel File=20
> Systems...=20
> >           Starting Remount Root and Kernel File Systems...=20
> > [  OK  ] Started Forward Password R=E2=80=A6uests to Wall Directory Wat=
ch.=20
> >           Mounting Huge Pages File System...=20
> > [  OK  ] Created slice system-serial\x2dgetty.slice.=20
> > [  OK  ] Started Dispatch Password =E2=80=A6ts to Console Directory Wat=
ch.=20
> > [  OK  ] Reached target Local Encrypted Volumes.=20
> >           Starting Load Kernel Modules...=20
> > [  OK  ] Created slice system-getty.slice.=20
> > [  OK  ] Reached target Paths.=20
> > [  OK  ] Listening on udev Kernel Socket.=20
> > [  OK  ] Reached target Remote File Systems.=20
> > [  OK  ] Listening on Journal Audit Socket.=20
> > [  OK  ] Reached target Swap.=20
> > [  OK  ] Created slice User and Session Slice.=20
> > [  OK  ] Reached target Slices.=20
> >           Mounting Kernel Debug File System...=20
> > [  OK  ] Listening on Journal Socket (/dev/log).=20
> >           Starting Journal Service...=20
> > [  OK  ] Listening on udev Control Socket.=20
> >           Starting udev Coldplug all Devices...=20
> > [   10.496248] EXT4-fs (vda): re-mounted. Opts: (null)=20
> >           Mounting POSIX Message Queue File System...=20
> > [   10.671466] jailhouse: loading out-of-tree module taints kernel.=20
> > [  OK  ] Mounted Huge Pages File System.=20
> > [  OK  ] Started Remount Root and Kernel File Systems.=20
> > [  OK  ] Started Load Kernel Modules.=20
> > [  OK  ] Mounted Kernel Debug File System.=20
> > [  OK  ] Mounted POSIX Message Queue File System.=20
> >           Mounting Kernel Configuration File System...=20
> >           Starting Apply Kernel Variables...=20
> >           Starting Load/Save Random Seed...=20
> >           Starting Create System Users...=20
> > [  OK  ] Mounted Kernel Configuration File System.=20
> > [  OK  ] Started Apply Kernel Variables.=20
> > [  OK  ] Started Load/Save Random Seed.=20
> > [  OK  ] Started Create System Users.=20
> > [  OK  ] Started Journal Service.=20
> >           Starting Flush Journal to Persistent Storage...=20
> >           Starting Create Static Device Nodes in /dev...=20
> > [  OK  ] Started Flush Journal to Persistent Storage.=20
> > [  OK  ] Started Create Static Device Nodes in /dev.=20
> >           Starting udev Kernel Device Manager...=20
> > [  OK  ] Reached target Local File Systems (Pre).=20
> > [  OK  ] Reached target Local File Systems.=20
> >           Starting Create Volatile Files and Directories...=20
> > [  OK  ] Started udev Kernel Device Manager.=20
> > [  OK  ] Started Create Volatile Files and Directories.=20
> >           Starting Network Time Synchronization...=20
> >           Starting Update UTMP about System Boot/Shutdown...=20
> > [  OK  ] Started Update UTMP about System Boot/Shutdown.=20
> > [  OK  ] Started Network Time Synchronization.=20
> > [  OK  ] Reached target System Time Synchronized.=20
> > [  OK  ] Found device /dev/ttyAMA0.=20
> > [  OK  ] Started udev Coldplug all Devices.=20
> > [  OK  ] Found device /dev/hvc0.=20
> > [  OK  ] Started ifup for eth0.=20
> > [  OK  ] Reached target System Initialization.=20
> > [  OK  ] Listening on D-Bus System Message Bus Socket.=20
> > [  OK  ] Reached target Sockets.=20
> > [  OK  ] Started Daily man-db regeneration.=20
> > [  OK  ] Started Daily apt download activities.=20
> > [  OK  ] Started Daily Cleanup of Temporary Directories.=20
> > [  OK  ] Reached target Basic System.=20
> >           Starting Login Service...=20
> > [  OK  ] Started D-Bus System Message Bus.=20
> >           Starting WPA supplicant...=20
> > [  OK  ] Started Daily apt upgrade and clean activities.=20
> > [  OK  ] Reached target Timers.=20
> >           Starting Helper to synchronize boot up for ifupdown...=20
> >           Starting Daily man-db regeneration...=20
> > [  OK  ] Started Helper to synchronize boot up for ifupdown.=20
> > [  OK  ] Started Login Service.=20
> > [  OK  ] Started WPA supplicant.=20
> >           Starting Raise network interfaces...=20
> > [  OK  ] Started Raise network interfaces.=20
> > [  OK  ] Reached target Network.=20
> >           Starting Daily apt download activities...=20
> >           Starting OpenBSD Secure Shell server...=20
> >           Starting Permit User Sessions...=20
> > [  OK  ] Started Permit User Sessions.=20
> > [  OK  ] Started Serial Getty on ttyAMA0.=20
> > [  OK  ] Started Serial Getty on hvc0.=20
> > [  OK  ] Started Getty on tty1.=20
> > [  OK  ] Reached target Login Prompts.=20
> > [  OK  ] Started Daily man-db regeneration.=20
> >=20
> > Jailhouse Demo Image (login: root/root)=20
> > demo login: sarojs@engee-e121-d08:/$ docker --version=20
> > Password:=20
> > Login timed out after 60 seconds.=20
> >=20
> > Jailhouse Demo Image (login: root/root)=20
> > demo login:=20
> > *After I login i get the following:*=20
> > Linux demo 4.19.67 #1 SMP PREEMPT Tue Nov 5 18:52:36 UTC 2019 aarch64=
=20
> >=20
> > For trying out Jailhouse, the following commands have been placed into=
=20
> the=20
> > shell history:=20
> >   # jailhouse enable /etc/jailhouse/qemu-arm64.cell=20
> >   # jailhouse console=20
> >   # jailhouse cell create /etc/jailhouse/qemu-arm64-gic-demo.cell=20
> >   # jailhouse cell load gic-demo=20
> /usr/libexec/jailhouse/demos/gic-demo.bin=20
> >   # jailhouse cell start gic-demo=20
> >   # jailhouse cell stats gic-demo=20
> >   # jailhouse cell destroy gic-demo=20
> >   # jailhouse cell linux /etc/jailhouse/qemu-arm64-linux-demo.cell \=20
> >                          /boot/vmlinuz* \=20
> >                          -d /etc/jailhouse/dts/inmate-qemu-arm64.dtb \=
=20
> >                          -i /usr/libexec/jailhouse/demos/rootfs.cpio \=
=20
> >                          -c "console=3DttyAMA0 ip=3D192.168.19.2"=20
> >   # ssh 192.168.19.2=20
> >   # jailhouse disable=20
> >=20
> > The programs included with the Debian GNU/Linux system are free=20
> software;=20
> > the exact distribution terms for each program are described in the=20
> > individual files in /usr/share/doc/*/copyright.=20
> >=20
> > Debian GNU/Linux comes with ABSOLUTELY NO WARRANTY, to the extent=20
> > permitted by applicable law.=20
> > *Then I open new terminal and try to ssh but it shows time out, why I=
=20
> > cannot ssh the address given. Due to this failure I was unable to=20
> > control one console terminal from the other and create two cells=20
> > gic-demo and linux demo. How can I create two cell so that I can run=20
> > application in One and Linux in another? please help me with this. I'm=
=20
> > trying for nearly one month but I was unable to do this.*=20
>
> Which of the commands above did you run, besides ssh?=20
>
> Jan=20
>
> --=20
> Siemens AG, Corporate Technology, CT RDA IOT SES-DE=20
> Corporate Competence Center Embedded Linux=20
>

--=20
You received this message because you are subscribed to the Google Groups "=
Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/=
jailhouse-dev/dd8368be-e94d-41cf-9bf7-654094e623f3%40googlegroups.com.

------=_Part_374_651712537.1578598089609
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div><b>Yes, I tried after enabling=C2=A0 jailhouse by fir=
st command I tried=20
to open jailhouse console by typing second command but it results same=20
thing as jailhouse enable command as shown below:</b></div><div>root@demo:~=
# jailhouse enable /etc/jailhouse/qemu-arm64.cell<br><br>Initializing Jailh=
ouse hypervisor v0.11 (0-g58052a7a-dirty) on CPU 0<br>Code location: 0x0000=
ffffc0200800<br>Page pool usage after early setup: mem 87/996, remap 0/1310=
72<br>Initializing processors:<br>=C2=A0CPU 0... OK<br>=C2=A0CPU 12... OK<b=
r>=C2=A0CPU 9... OK<br>=C2=A0CPU 6... OK<br>=C2=A0CPU 13... OK<br>=C2=A0CPU=
 15... OK<br>=C2=A0CPU 8... OK<br>=C2=A0CPU 14... OK<br>=C2=A0CPU 10... OK<=
br>=C2=A0CPU 11... OK<br>=C2=A0CPU 5... OK<br>=C2=A0CPU 2... OK<br>=C2=A0CP=
U 4... OK<br>=C2=A0CPU 3... OK<br>=C2=A0CPU 7... OK<br>=C2=A0CPU 1... OK<br=
>Initializing unit: irqchip<br>Initializing unit: PCI<br>Adding virtual PCI=
 device 00:00.0 to cell &quot;qemu-arm64&quot;<br>Page pool usage after lat=
e setup: mem 143/996, remap 528/131072<br>Activating hypervisor<br>root@dem=
o:~# =C2=A0jailhouse console<br><br>Initializing Jailhouse hypervisor v0.11=
 (0-g58052a7a-dirty) on CPU 0<br>Code location: 0x0000ffffc0200800<br>Page =
pool usage after early setup: mem 87/996, remap 0/131072<br>Initializing pr=
ocessors:<br>=C2=A0CPU 0... OK<br>=C2=A0CPU 12... OK<br>=C2=A0CPU 9... OK<b=
r>=C2=A0CPU 6... OK<br>=C2=A0CPU 13... OK<br>=C2=A0CPU 15... OK<br>=C2=A0CP=
U 8... OK<br>=C2=A0CPU 14... OK<br>=C2=A0CPU 10... OK<br>=C2=A0CPU 11... OK=
<br>=C2=A0CPU 5... OK<br>=C2=A0CPU 2... OK<br>=C2=A0CPU 4... OK<br>=C2=A0CP=
U 3... OK<br>=C2=A0CPU 7... OK<br>=C2=A0CPU 1... OK<br>Initializing unit: i=
rqchip<br>Initializing unit: PCI<br>Adding virtual PCI device 00:00.0 to ce=
ll &quot;qemu-arm64&quot;<br>Page pool usage after late setup: mem 143/996,=
 remap 528/131072<br>Activating hypervisor<br>root@demo:~# <br></div><div><=
b>why I don&#39;t get jailhouse console?</b></div><div><b>other
 command goes well and I can create cell for apic demo and load it and=20
start it on the host terminal and it continuously run I can&#39;t destroy=
=20
the cell as it is running on the same terminal. So, Main problem is i&#39;m=
=20
unable to get jailhouse console and control it from terminal. How can I=20
do that?</b></div><div><b>the sample output and command result is below: on=
ce cell is started neither I can destroy it or terminate it.<br></b></div><=
div><b><br></b></div>root@demo:~# jailhouse cell create /etc/jailhouse/qemu=
-arm64-gic-<div><wbr>demo.cell<br>Created cell &quot;gic-demo&quot;<br>Page=
 pool usage after cell creation: mem 154/996, remap 528/131072<br>root@demo=
:~# jailhouse cell load gic-demo /usr/libexec/jailhouse/demos/<wbr>gic-demo=
.bin<br>Cell &quot;gic-demo&quot; can be loaded<br>root@demo:~# jailhouse c=
ell start gic-demo<br>Started cell &quot;gic-demo&quot;<br>Initializing the=
 GIC...<br>Initializing the timer...<br>root@demo:~# Timer fired, jitter: 3=
70435 ns, min: 370435 ns, max: 370435 ns<br>Timer fired, jitter: 330999 ns,=
 min: 330999 ns, max: 370435 ns<br>Timer fired, jitter: 155290 ns, min: 155=
290 ns, max: 370435 ns<br>Timer fired, jitter: 385564 ns, min: 155290 ns, m=
ax: 385564 ns<br>Timer fired, jitter: 203096 ns, min: 155290 ns, max: 38556=
4 ns<br>Timer fired, jitter: 189354 ns, min: 155290 ns, max: 385564 ns<br>T=
imer fired, jitter: 172258 ns, min: 155290 ns, max: 385564 ns<br>Timer fire=
d, jitter: 495612 ns, min: 155290 ns, max: 495612 ns<br>Timer fired, jitter=
: 199322 ns, min: 155290 ns, max: 495612 ns<br>Timer fired, jitter: 151016 =
ns, min: 151016 ns, max: 495612 ns<br>Timer fired, jitter: 232209 ns, min: =
151016 ns, max: 495612 ns<br>Timer fired, jitter: =C2=A063806 ns, min: =C2=
=A063806 ns, max: 495612 ns<br>Timer fired, jitter: 245225 ns, min: =C2=A06=
3806 ns, max: 495612 ns<br>Timer fired, jitter: 242596 ns, min: =C2=A063806=
 ns, max: 495612 ns<br>Timer fired, jitter: 159903 ns, min: =C2=A063806 ns,=
 max: 495612 ns<br>Timer fired, jitter: 153548 ns, min: =C2=A063806 ns, max=
: 495612 ns<br>Timer fired, jitter: 193016 ns, min: =C2=A063806 ns, max: 49=
5612 ns<br>Timer fired, jitter: 339741 ns, min: =C2=A063806 ns, max: 495612=
 ns<br>Timer fired, jitter: 219532 ns, min: =C2=A063806 ns, max: 495612 ns<=
br>Timer fired, jitter: 412258 ns, min: =C2=A063806 ns, max: 495612 ns<br>T=
imer fired, jitter: 197725 ns, min: =C2=A063806 ns, max: 495612 ns<br>Timer=
 fired, jitter: 290612 ns, min: =C2=A063806 ns, max: 495612 ns<br>Timer fir=
ed, jitter: 225112 ns, min: =C2=A063806 ns, max: 495612 ns<br>Timer fired, =
jitter: 386258 ns, min: =C2=A063806 ns, max: 495612 ns<br>Timer fired, jitt=
er: 198854 ns, min: =C2=A063806 ns, max: 495612 ns<br>Timer fired, jitter: =
173806 ns, min: =C2=A063806 ns, max: 495612 ns<br>Timer fired, jitter: 2473=
54 ns, min: =C2=A063806 ns, max: 495612 ns<br>Timer fired, jitter: 379548 n=
s, min: =C2=A063806 ns, max: 495612 ns<br>Timer fired, jitter: 174709 ns, m=
in: =C2=A063806 ns, max: 495612 ns<br>Timer fired, jitter: 400241 ns, min: =
=C2=A063806 ns, max: 495612 ns<br>Timer fired, jitter: =C2=A077838 ns, min:=
 =C2=A063806 ns, max: 495612 ns</div><br>            <br>On Thursday, Janua=
ry 9, 2020 at 3:06:41 AM UTC-6, Jan Kiszka wrote:<blockquote class=3D"gmail=
_quote" style=3D"margin: 0;margin-left: 0.8ex;border-left: 1px #ccc solid;p=
adding-left: 1ex;">On 08.01.20 21:54, Saroj Sapkota wrote:
<br>=C2=A0All the requirement docker, qemu, kernel updated to latest as men=
tioned=20
<br>&gt; in read.md and the results are:
<br>&gt; sarojs@engee-e121-d08:/$ docker --version
<br>&gt; Docker version 19.03.4, build 9013bf583a
<br>&gt; sarojs@engee-e121-d08:/$ qemu-system-x86_64 --version
<br>&gt; QEMU emulator version 4.1.0
<br>&gt; Copyright (c) 2003-2019 Fabrice Bellard and the QEMU Project devel=
opers
<br>&gt; sarojs@engee-e121-d08:/$ uname -r
<br>&gt; 4.4.0-167-generic
<br>&gt; *after this I run build-images.sh and then finally start-qemu.sh*
<br>&gt; *and the results is:*
<br>&gt;=20
<br>&gt; sarojs@engee-e121-d08:~/<wbr>Downloads/jailhouse-images$ ./start-q=
emu.sh arm64
<br>&gt; VNC server running on <a href=3D"http://127.0.0.1:5900" target=3D"=
_blank" rel=3D"nofollow" onmousedown=3D"this.href=3D&#39;http://www.google.=
com/url?q\x3dhttp%3A%2F%2F127.0.0.1%3A5900\x26sa\x3dD\x26sntz\x3d1\x26usg\x=
3dAFQjCNGXkEUQvEdcucXQu8CzWzL7vVwWvQ&#39;;return true;" onclick=3D"this.hre=
f=3D&#39;http://www.google.com/url?q\x3dhttp%3A%2F%2F127.0.0.1%3A5900\x26sa=
\x3dD\x26sntz\x3d1\x26usg\x3dAFQjCNGXkEUQvEdcucXQu8CzWzL7vVwWvQ&#39;;return=
 true;">127.0.0.1:5900</a>
<br>&gt; [=C2=A0=C2=A0=C2=A0 0.000000] Booting Linux on physical CPU 0x0000=
000000 [0x411fd070]
<br>&gt; [=C2=A0=C2=A0=C2=A0 0.000000] Linux version 4.19.67 (builder@bc528=
e2a57f1) (gcc version=20
<br>&gt; 8.3.0 (Debian 8.3.0-2)) #1 SMP PREEMPT Tue Nov 5 18:52:36 UTC 2019
<br>&gt; [=C2=A0=C2=A0=C2=A0 0.000000] Machine model: linux,dummy-virt
<br>&gt; [=C2=A0=C2=A0=C2=A0 0.000000] Memory limited to 768MB
<br>&gt; [=C2=A0=C2=A0=C2=A0 0.000000] efi: Getting EFI parameters from FDT=
:
<br>&gt; [=C2=A0=C2=A0=C2=A0 0.000000] efi: UEFI not found.
<br>&gt; [=C2=A0=C2=A0=C2=A0 0.000000] cma: Reserved 16 MiB at 0x000000006f=
000000
<br>&gt; [=C2=A0=C2=A0=C2=A0 0.000000] NUMA: No NUMA configuration found
<br>&gt; [=C2=A0=C2=A0=C2=A0 0.000000] NUMA: Faking a node at [mem=20
<br>&gt; 0x0000000000000000-<wbr>0x000000006fffffff]
<br>&gt; [=C2=A0=C2=A0=C2=A0 0.000000] NUMA: NODE_DATA [mem 0x6efe8480-0x6e=
fe9c3f]
<br>&gt; [=C2=A0=C2=A0=C2=A0 0.000000] Zone ranges:
<br>&gt; [=C2=A0=C2=A0=C2=A0 0.000000]=C2=A0=C2=A0 DMA32=C2=A0=C2=A0=C2=A0 =
[mem 0x0000000040000000-<wbr>0x000000006fffffff]
<br>&gt; [=C2=A0=C2=A0=C2=A0 0.000000]=C2=A0=C2=A0 Normal=C2=A0=C2=A0 empty
<br>&gt; [=C2=A0=C2=A0=C2=A0 0.000000] Movable zone start for each node
<br>&gt; [=C2=A0=C2=A0=C2=A0 0.000000] Early memory node ranges
<br>&gt; [=C2=A0=C2=A0=C2=A0 0.000000]=C2=A0=C2=A0 node=C2=A0=C2=A0 0: [mem=
 0x0000000040000000-<wbr>0x000000006fffffff]
<br>&gt; [=C2=A0=C2=A0=C2=A0 0.000000] Initmem setup node 0 [mem=20
<br>&gt; 0x0000000040000000-<wbr>0x000000006fffffff]
<br>&gt; [=C2=A0=C2=A0=C2=A0 0.000000] psci: probing for conduit method fro=
m DT.
<br>&gt; [=C2=A0=C2=A0=C2=A0 0.000000] psci: PSCIv0.2 detected in firmware.
<br>&gt; [=C2=A0=C2=A0=C2=A0 0.000000] psci: Using standard PSCI v0.2 funct=
ion IDs
<br>&gt; [=C2=A0=C2=A0=C2=A0 0.000000] psci: Trusted OS migration not requi=
red
<br>&gt; [=C2=A0=C2=A0=C2=A0 0.000000] random: get_random_bytes called from=
=20
<br>&gt; start_kernel+0x94/0x400 with crng_init=3D0
<br>&gt; [=C2=A0=C2=A0=C2=A0 0.000000] percpu: Embedded 22 pages/cpu s53016=
 r8192 d28904 u90112
<br>&gt; [=C2=A0=C2=A0=C2=A0 0.000000] Detected PIPT I-cache on CPU0
<br>&gt; [=C2=A0=C2=A0=C2=A0 0.000000] CPU features: enabling workaround fo=
r ARM erratum 832075
<br>&gt; [=C2=A0=C2=A0=C2=A0 0.000000] CPU features: enabling workaround fo=
r EL2 vector hardening
<br>&gt; [=C2=A0=C2=A0=C2=A0 0.000000] CPU features: detected: Kernel page =
table isolation (KPTI)
<br>&gt; [=C2=A0=C2=A0=C2=A0 0.000000] Built 1 zonelists, mobility grouping=
 on.=C2=A0 Total pages: 193536
<br>&gt; [=C2=A0=C2=A0=C2=A0 0.000000] Policy zone: DMA32
<br>&gt; [=C2=A0=C2=A0=C2=A0 0.000000] Kernel command line:=C2=A0 =C2=A0=C2=
=A0=C2=A0 =C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 root=3D/dev/vda mem=3D768M
<br>&gt; [=C2=A0=C2=A0=C2=A0 0.000000] Memory: 729472K/786432K available (1=
0044K kernel code,=20
<br>&gt; 1294K rwdata, 4312K rodata, 1152K init, 369K bss, 40576K reserved,=
=20
<br>&gt; 16384K cma-reserved)
<br>&gt; [=C2=A0=C2=A0=C2=A0 0.000000] SLUB: HWalign=3D64, Order=3D0-3, Min=
Objects=3D0, CPUs=3D16, Nodes=3D1
<br>&gt; [=C2=A0=C2=A0=C2=A0 0.000000] rcu: Preemptible hierarchical RCU im=
plementation.
<br>&gt; [=C2=A0=C2=A0=C2=A0 0.000000] rcu: =C2=A0=C2=A0=C2=A0 RCU restrict=
ing CPUs from NR_CPUS=3D64 to=20
<br>&gt; nr_cpu_ids=3D16.
<br>&gt; [=C2=A0=C2=A0=C2=A0 0.000000] =C2=A0=C2=A0=C2=A0 Tasks RCU enabled=
.
<br>&gt; [=C2=A0=C2=A0=C2=A0 0.000000] rcu: Adjusting geometry for rcu_fano=
ut_leaf=3D16, nr_cpu_ids=3D16
<br>&gt; [=C2=A0=C2=A0=C2=A0 0.000000] NR_IRQS: 64, nr_irqs: 64, preallocat=
ed irqs: 0
<br>&gt; [=C2=A0=C2=A0=C2=A0 0.000000] GICv3: GIC: Using split EOI/Deactiva=
te mode
<br>&gt; [=C2=A0=C2=A0=C2=A0 0.000000] GICv3: Distributor has no Range Sele=
ctor support
<br>&gt; [=C2=A0=C2=A0=C2=A0 0.000000] GICv3: no VLPI support, no direct LP=
I support
<br>&gt; [=C2=A0=C2=A0=C2=A0 0.000000] GICv3: CPU0: found redistributor 0 r=
egion=20
<br>&gt; 0:0x00000000080a0000
<br>&gt; [=C2=A0=C2=A0=C2=A0 0.000000] arch_timer: cp15 timer(s) running at=
 62.50MHz (phys).
<br>&gt; [=C2=A0=C2=A0=C2=A0 0.000000] clocksource: arch_sys_counter: mask:=
 0xffffffffffffff=20
<br>&gt; max_cycles: 0x1cd42e208c, max_idle_ns: 881590405314 ns
<br>&gt; [=C2=A0=C2=A0=C2=A0 0.000167] sched_clock: 56 bits at 62MHz, resol=
ution 16ns, wraps=20
<br>&gt; every 4398046511096ns
<br>&gt; [=C2=A0=C2=A0=C2=A0 0.009196] Console: colour dummy device 80x25
<br>&gt; [=C2=A0=C2=A0=C2=A0 0.011540] console [tty0] enabled
<br>&gt; [=C2=A0=C2=A0=C2=A0 0.014855] Calibrating delay loop (skipped), va=
lue calculated using=20
<br>&gt; timer frequency.. 125.00 BogoMIPS (lpj=3D250000)
<br>&gt; [=C2=A0=C2=A0=C2=A0 0.015058] pid_max: default: 32768 minimum: 301
<br>&gt; [=C2=A0=C2=A0=C2=A0 0.016528] Security Framework initialized
<br>&gt; [=C2=A0=C2=A0=C2=A0 0.018663] Dentry cache hash table entries: 131=
072 (order: 8,=20
<br>&gt; 1048576 bytes)
<br>&gt; [=C2=A0=C2=A0=C2=A0 0.019461] Inode-cache hash table entries: 6553=
6 (order: 7, 524288=20
<br>&gt; bytes)
<br>&gt; [=C2=A0=C2=A0=C2=A0 0.019731] Mount-cache hash table entries: 2048=
 (order: 2, 16384 bytes)
<br>&gt; [=C2=A0=C2=A0=C2=A0 0.019824] Mountpoint-cache hash table entries:=
 2048 (order: 2,=20
<br>&gt; 16384 bytes)
<br>&gt; [=C2=A0=C2=A0=C2=A0 0.082413] ASID allocator initialised with 3276=
8 entries
<br>&gt; [=C2=A0=C2=A0=C2=A0 0.090745] rcu: Hierarchical SRCU implementatio=
n.
<br>&gt; [=C2=A0=C2=A0=C2=A0 0.121397] EFI services will not be available.
<br>&gt; [=C2=A0=C2=A0=C2=A0 0.131213] smp: Bringing up secondary CPUs ...
<br>&gt; [=C2=A0=C2=A0=C2=A0 0.163456] Detected PIPT I-cache on CPU1
<br>&gt; [=C2=A0=C2=A0=C2=A0 0.165414] GICv3: CPU1: found redistributor 1 r=
egion=20
<br>&gt; 0:0x00000000080c0000
<br>&gt; [=C2=A0=C2=A0=C2=A0 0.165996] CPU1: Booted secondary processor 0x0=
000000001 [0x411fd070]
<br>&gt; [=C2=A0=C2=A0=C2=A0 0.209014] Detected PIPT I-cache on CPU2
<br>&gt; [=C2=A0=C2=A0=C2=A0 0.209110] GICv3: CPU2: found redistributor 2 r=
egion=20
<br>&gt; 0:0x00000000080e0000
<br>&gt; [=C2=A0=C2=A0=C2=A0 0.209225] CPU2: Booted secondary processor 0x0=
000000002 [0x411fd070]
<br>&gt; [=C2=A0=C2=A0=C2=A0 0.241807] Detected PIPT I-cache on CPU3
<br>&gt; [=C2=A0=C2=A0=C2=A0 0.241941] GICv3: CPU3: found redistributor 3 r=
egion=20
<br>&gt; 0:0x0000000008100000
<br>&gt; [=C2=A0=C2=A0=C2=A0 0.242103] CPU3: Booted secondary processor 0x0=
000000003 [0x411fd070]
<br>&gt; [=C2=A0=C2=A0=C2=A0 0.276834] Detected PIPT I-cache on CPU4
<br>&gt; [=C2=A0=C2=A0=C2=A0 0.277172] GICv3: CPU4: found redistributor 4 r=
egion=20
<br>&gt; 0:0x0000000008120000
<br>&gt; [=C2=A0=C2=A0=C2=A0 0.277537] CPU4: Booted secondary processor 0x0=
000000004 [0x411fd070]
<br>&gt; [=C2=A0=C2=A0=C2=A0 0.316327] Detected PIPT I-cache on CPU5
<br>&gt; [=C2=A0=C2=A0=C2=A0 0.316709] GICv3: CPU5: found redistributor 5 r=
egion=20
<br>&gt; 0:0x0000000008140000
<br>&gt; [=C2=A0=C2=A0=C2=A0 0.317101] CPU5: Booted secondary processor 0x0=
000000005 [0x411fd070]
<br>&gt; [=C2=A0=C2=A0=C2=A0 0.356252] Detected PIPT I-cache on CPU6
<br>&gt; [=C2=A0=C2=A0=C2=A0 0.356626] GICv3: CPU6: found redistributor 6 r=
egion=20
<br>&gt; 0:0x0000000008160000
<br>&gt; [=C2=A0=C2=A0=C2=A0 0.357149] CPU6: Booted secondary processor 0x0=
000000006 [0x411fd070]
<br>&gt; [=C2=A0=C2=A0=C2=A0 0.394943] Detected PIPT I-cache on CPU7
<br>&gt; [=C2=A0=C2=A0=C2=A0 0.395074] GICv3: CPU7: found redistributor 7 r=
egion=20
<br>&gt; 0:0x0000000008180000
<br>&gt; [=C2=A0=C2=A0=C2=A0 0.395224] CPU7: Booted secondary processor 0x0=
000000007 [0x411fd070]
<br>&gt; [=C2=A0=C2=A0=C2=A0 0.427866] Detected PIPT I-cache on CPU8
<br>&gt; [=C2=A0=C2=A0=C2=A0 0.428003] GICv3: CPU8: found redistributor 8 r=
egion=20
<br>&gt; 0:0x00000000081a0000
<br>&gt; [=C2=A0=C2=A0=C2=A0 0.428163] CPU8: Booted secondary processor 0x0=
000000008 [0x411fd070]
<br>&gt; [=C2=A0=C2=A0=C2=A0 0.483476] Detected PIPT I-cache on CPU9
<br>&gt; [=C2=A0=C2=A0=C2=A0 0.483774] GICv3: CPU9: found redistributor 9 r=
egion=20
<br>&gt; 0:0x00000000081c0000
<br>&gt; [=C2=A0=C2=A0=C2=A0 0.484125] CPU9: Booted secondary processor 0x0=
000000009 [0x411fd070]
<br>&gt; [=C2=A0=C2=A0=C2=A0 0.517943] Detected PIPT I-cache on CPU10
<br>&gt; [=C2=A0=C2=A0=C2=A0 0.518510] GICv3: CPU10: found redistributor a =
region=20
<br>&gt; 0:0x00000000081e0000
<br>&gt; [=C2=A0=C2=A0=C2=A0 0.519101] CPU10: Booted secondary processor 0x=
000000000a [0x411fd070]
<br>&gt; [=C2=A0=C2=A0=C2=A0 0.556796] Detected PIPT I-cache on CPU11
<br>&gt; [=C2=A0=C2=A0=C2=A0 0.557390] GICv3: CPU11: found redistributor b =
region=20
<br>&gt; 0:0x0000000008200000
<br>&gt; [=C2=A0=C2=A0=C2=A0 0.557984] CPU11: Booted secondary processor 0x=
000000000b [0x411fd070]
<br>&gt; [=C2=A0=C2=A0=C2=A0 0.594707] Detected PIPT I-cache on CPU12
<br>&gt; [=C2=A0=C2=A0=C2=A0 0.595031] GICv3: CPU12: found redistributor c =
region=20
<br>&gt; 0:0x0000000008220000
<br>&gt; [=C2=A0=C2=A0=C2=A0 0.595533] CPU12: Booted secondary processor 0x=
000000000c [0x411fd070]
<br>&gt; [=C2=A0=C2=A0=C2=A0 0.628692] Detected PIPT I-cache on CPU13
<br>&gt; [=C2=A0=C2=A0=C2=A0 0.629111] GICv3: CPU13: found redistributor d =
region=20
<br>&gt; 0:0x0000000008240000
<br>&gt; [=C2=A0=C2=A0=C2=A0 0.629460] CPU13: Booted secondary processor 0x=
000000000d [0x411fd070]
<br>&gt; [=C2=A0=C2=A0=C2=A0 0.662432] Detected PIPT I-cache on CPU14
<br>&gt; [=C2=A0=C2=A0=C2=A0 0.662815] GICv3: CPU14: found redistributor e =
region=20
<br>&gt; 0:0x0000000008260000
<br>&gt; [=C2=A0=C2=A0=C2=A0 0.663338] CPU14: Booted secondary processor 0x=
000000000e [0x411fd070]
<br>&gt; [=C2=A0=C2=A0=C2=A0 0.701173] Detected PIPT I-cache on CPU15
<br>&gt; [=C2=A0=C2=A0=C2=A0 0.701480] GICv3: CPU15: found redistributor f =
region=20
<br>&gt; 0:0x0000000008280000
<br>&gt; [=C2=A0=C2=A0=C2=A0 0.701830] CPU15: Booted secondary processor 0x=
000000000f [0x411fd070]
<br>&gt; [=C2=A0=C2=A0=C2=A0 0.703285] smp: Brought up 1 node, 16 CPUs
<br>&gt; [=C2=A0=C2=A0=C2=A0 0.709495] SMP: Total of 16 processors activate=
d.
<br>&gt; [=C2=A0=C2=A0=C2=A0 0.709877] CPU features: detected: GIC system r=
egister CPU interface
<br>&gt; [=C2=A0=C2=A0=C2=A0 0.710137] CPU features: detected: 32-bit EL0 S=
upport
<br>&gt; [=C2=A0=C2=A0=C2=A0 0.932452] CPU: All CPU(s) started at EL2
<br>&gt; [=C2=A0=C2=A0=C2=A0 0.965064] alternatives: patching kernel code
<br>&gt; [=C2=A0=C2=A0=C2=A0 1.021311] devtmpfs: initialized
<br>&gt; [=C2=A0=C2=A0=C2=A0 1.038681] clocksource: jiffies: mask: 0xffffff=
ff max_cycles:=20
<br>&gt; 0xffffffff, max_idle_ns: 7645041785100000 ns
<br>&gt; [=C2=A0=C2=A0=C2=A0 1.039229] futex hash table entries: 4096 (orde=
r: 6, 262144 bytes)
<br>&gt; [=C2=A0=C2=A0=C2=A0 1.044588] pinctrl core: initialized pinctrl su=
bsystem
<br>&gt; [=C2=A0=C2=A0=C2=A0 1.062703] DMI not present or invalid.
<br>&gt; [=C2=A0=C2=A0=C2=A0 1.069419] NET: Registered protocol family 16
<br>&gt; [=C2=A0=C2=A0=C2=A0 1.074197] audit: initializing netlink subsys (=
disabled)
<br>&gt; [=C2=A0=C2=A0=C2=A0 1.076449] audit: type=3D2000 audit(0.776:1): s=
tate=3Dinitialized=20
<br>&gt; audit_enabled=3D0 res=3D1
<br>&gt; [=C2=A0=C2=A0=C2=A0 1.084715] cpuidle: using governor menu
<br>&gt; [=C2=A0=C2=A0=C2=A0 1.086698] vdso: 2 pages (1 code @ (____ptrval_=
___), 1 data @=20
<br>&gt; (____ptrval____))
<br>&gt; [=C2=A0=C2=A0=C2=A0 1.086870] hw-breakpoint: found 6 breakpoint an=
d 4 watchpoint registers.
<br>&gt; [=C2=A0=C2=A0=C2=A0 1.100600] DMA: preallocated 256 KiB pool for a=
tomic allocations
<br>&gt; [=C2=A0=C2=A0=C2=A0 1.105252] Serial: AMBA PL011 UART driver
<br>&gt; [=C2=A0=C2=A0=C2=A0 1.142651] 9000000.pl011: ttyAMA0 at MMIO 0x900=
0000 (irq =3D 40,=20
<br>&gt; base_baud =3D 0) is a PL011 rev1
<br>&gt; [=C2=A0=C2=A0=C2=A0 1.165136] console [ttyAMA0] enabled
<br>&gt; [=C2=A0=C2=A0=C2=A0 1.370391] HugeTLB registered 2.00 MiB page siz=
e, pre-allocated 0 pages
<br>&gt; [=C2=A0=C2=A0=C2=A0 1.375592] cryptd: max_cpu_qlen set to 1000
<br>&gt; [=C2=A0=C2=A0=C2=A0 1.381172] ACPI: Interpreter disabled.
<br>&gt; [=C2=A0=C2=A0=C2=A0 1.386213] vgaarb: loaded
<br>&gt; [=C2=A0=C2=A0=C2=A0 1.388929] SCSI subsystem initialized
<br>&gt; [=C2=A0=C2=A0=C2=A0 1.394115] usbcore: registered new interface dr=
iver usbfs
<br>&gt; [=C2=A0=C2=A0=C2=A0 1.394984] usbcore: registered new interface dr=
iver hub
<br>&gt; [=C2=A0=C2=A0=C2=A0 1.396038] usbcore: registered new device drive=
r usb
<br>&gt; [=C2=A0=C2=A0=C2=A0 1.404071] pps_core: LinuxPPS API ver. 1 regist=
ered
<br>&gt; [=C2=A0=C2=A0=C2=A0 1.404564] pps_core: Software ver. 5.3.6 - Copy=
right 2005-2007=20
<br>&gt; Rodolfo Giometti &lt;<a href=3D"javascript:" target=3D"_blank" gdf=
-obfuscated-mailto=3D"eSsumlaABgAJ" rel=3D"nofollow" onmousedown=3D"this.hr=
ef=3D&#39;javascript:&#39;;return true;" onclick=3D"this.href=3D&#39;javasc=
ript:&#39;;return true;">giom...@linux.it</a>&gt;
<br>&gt; [=C2=A0=C2=A0=C2=A0 1.405492] PTP clock support registered
<br>&gt; [=C2=A0=C2=A0=C2=A0 1.407076] EDAC MC: Ver: 3.0.0
<br>&gt; [=C2=A0=C2=A0=C2=A0 1.492705] clocksource: Switched to clocksource=
 arch_sys_counter
<br>&gt; [=C2=A0=C2=A0=C2=A0 1.509419] VFS: Disk quotas dquot_6.6.0
<br>&gt; [=C2=A0=C2=A0=C2=A0 1.509874] VFS: Dquot-cache hash table entries:=
 512 (order 0, 4096=20
<br>&gt; bytes)
<br>&gt; [=C2=A0=C2=A0=C2=A0 1.512450] pnp: PnP ACPI: disabled
<br>&gt; [=C2=A0=C2=A0=C2=A0 1.568294] NET: Registered protocol family 2
<br>&gt; [=C2=A0=C2=A0=C2=A0 1.584108] tcp_listen_portaddr_hash hash table =
entries: 512 (order:=20
<br>&gt; 1, 8192 bytes)
<br>&gt; [=C2=A0=C2=A0=C2=A0 1.584780] TCP established hash table entries: =
8192 (order: 4, 65536=20
<br>&gt; bytes)
<br>&gt; [=C2=A0=C2=A0=C2=A0 1.585583] TCP bind hash table entries: 8192 (o=
rder: 5, 131072 bytes)
<br>&gt; [=C2=A0=C2=A0=C2=A0 1.586009] TCP: Hash tables configured (establi=
shed 8192 bind 8192)
<br>&gt; [=C2=A0=C2=A0=C2=A0 1.588606] UDP hash table entries: 512 (order: =
2, 16384 bytes)
<br>&gt; [=C2=A0=C2=A0=C2=A0 1.589179] UDP-Lite hash table entries: 512 (or=
der: 2, 16384 bytes)
<br>&gt; [=C2=A0=C2=A0=C2=A0 1.592560] NET: Registered protocol family 1
<br>&gt; [=C2=A0=C2=A0=C2=A0 1.598547] RPC: Registered named UNIX socket tr=
ansport module.
<br>&gt; [=C2=A0=C2=A0=C2=A0 1.598784] RPC: Registered udp transport module=
.
<br>&gt; [=C2=A0=C2=A0=C2=A0 1.598954] RPC: Registered tcp transport module=
.
<br>&gt; [=C2=A0=C2=A0=C2=A0 1.599110] RPC: Registered tcp NFSv4.1 backchan=
nel transport module.
<br>&gt; [=C2=A0=C2=A0=C2=A0 1.602869] Unpacking initramfs...
<br>&gt; [=C2=A0=C2=A0=C2=A0 1.847907] Freeing initrd memory: 4292K
<br>&gt; [=C2=A0=C2=A0=C2=A0 1.857706] hw perfevents: enabled with armv8_pm=
uv3 PMU driver, 5=20
<br>&gt; counters available
<br>&gt; [=C2=A0=C2=A0=C2=A0 1.879734] Initialise system trusted keyrings
<br>&gt; [=C2=A0=C2=A0=C2=A0 1.883324] workingset: timestamp_bits=3D44 max_=
order=3D18 bucket_order=3D0
<br>&gt; [=C2=A0=C2=A0=C2=A0 1.912683] squashfs: version 4.0 (2009/01/31) P=
hillip Lougher
<br>&gt; [=C2=A0=C2=A0=C2=A0 1.918361] NFS: Registering the id_resolver key=
 type
<br>&gt; [=C2=A0=C2=A0=C2=A0 1.918781] Key type id_resolver registered
<br>&gt; [=C2=A0=C2=A0=C2=A0 1.919012] Key type id_legacy registered
<br>&gt; [=C2=A0=C2=A0=C2=A0 1.919442] nfs4filelayout_init: NFSv4 File Layo=
ut Driver Registering...
<br>&gt; [=C2=A0=C2=A0=C2=A0 1.921845] 9p: Installing v9fs 9p2000 file syst=
em support
<br>&gt; [=C2=A0=C2=A0=C2=A0 1.942598] Key type asymmetric registered
<br>&gt; [=C2=A0=C2=A0=C2=A0 1.942860] Asymmetric key parser &#39;x509&#39;=
 registered
<br>&gt; [=C2=A0=C2=A0=C2=A0 1.943281] Block layer SCSI generic (bsg) drive=
r version 0.4 loaded=20
<br>&gt; (major 246)
<br>&gt; [=C2=A0=C2=A0=C2=A0 1.944068] io scheduler noop registered
<br>&gt; [=C2=A0=C2=A0=C2=A0 1.944699] io scheduler cfq registered (default=
)
<br>&gt; [=C2=A0=C2=A0=C2=A0 1.945362] io scheduler mq-deadline registered
<br>&gt; [=C2=A0=C2=A0=C2=A0 1.945581] io scheduler kyber registered
<br>&gt; [=C2=A0=C2=A0=C2=A0 1.975723] pl061_gpio 9030000.pl061: PL061 GPIO=
 chip=20
<br>&gt; @0x0000000009030000 registered
<br>&gt; [=C2=A0=C2=A0=C2=A0 1.985874] pci-host-generic 4010000000.pcie: ho=
st bridge=20
<br>&gt; /pcie@10000000 ranges:
<br>&gt; [=C2=A0=C2=A0=C2=A0 1.986737] pci-host-generic 4010000000.pcie:=C2=
=A0=C2=A0=C2=A0 IO=20
<br>&gt; 0x3eff0000..0x3effffff -&gt; 0x00000000
<br>&gt; [=C2=A0=C2=A0=C2=A0 1.987598] pci-host-generic 4010000000.pcie:=C2=
=A0=C2=A0 MEM=20
<br>&gt; 0x10000000..0x3efeffff -&gt; 0x10000000
<br>&gt; [=C2=A0=C2=A0=C2=A0 1.987882] pci-host-generic 4010000000.pcie:=C2=
=A0=C2=A0 MEM=20
<br>&gt; 0x8000000000..0xffffffffff -&gt; 0x8000000000
<br>&gt; [=C2=A0=C2=A0=C2=A0 1.989836] pci-host-generic 4010000000.pcie: EC=
AM at [mem=20
<br>&gt; 0x4010000000-0x401fffffff] for [bus 00-ff]
<br>&gt; [=C2=A0=C2=A0=C2=A0 1.992336] pci-host-generic 4010000000.pcie: PC=
I host bridge to bus=20
<br>&gt; 0000:00
<br>&gt; [=C2=A0=C2=A0=C2=A0 1.993286] pci_bus 0000:00: root bus resource [=
bus 00-ff]
<br>&gt; [=C2=A0=C2=A0=C2=A0 1.993814] pci_bus 0000:00: root bus resource [=
io=C2=A0 0x0000-0xffff]
<br>&gt; [=C2=A0=C2=A0=C2=A0 1.994028] pci_bus 0000:00: root bus resource [=
mem=20
<br>&gt; 0x10000000-0x3efeffff]
<br>&gt; [=C2=A0=C2=A0=C2=A0 1.994300] pci_bus 0000:00: root bus resource [=
mem=20
<br>&gt; 0x8000000000-0xffffffffff]
<br>&gt; [=C2=A0=C2=A0=C2=A0 2.088592] Serial: 8250/16550 driver, 4 ports, =
IRQ sharing enabled
<br>&gt; [=C2=A0=C2=A0=C2=A0 2.095955] SuperH (H)SCI(F) driver initialized
<br>&gt; [=C2=A0=C2=A0=C2=A0 2.097903] msm_serial: driver initialized
<br>&gt; [=C2=A0=C2=A0=C2=A0 2.118236] cacheinfo: Unable to detect cache hi=
erarchy for CPU 0
<br>&gt; [=C2=A0=C2=A0=C2=A0 2.168640] loop: module loaded
<br>&gt; [=C2=A0=C2=A0=C2=A0 2.193407] virtio_blk virtio1: [vda] 2694416 51=
2-byte logical blocks=20
<br>&gt; (1.38 GB/1.28 GiB)
<br>&gt; [=C2=A0=C2=A0=C2=A0 2.240577] libphy: Fixed MDIO Bus: probed
<br>&gt; [=C2=A0=C2=A0=C2=A0 2.244779] tun: Universal TUN/TAP device driver=
, 1.6
<br>&gt; [=C2=A0=C2=A0=C2=A0 2.263829] e1000e: Intel(R) PRO/1000 Network Dr=
iver - 3.2.6-k
<br>&gt; [=C2=A0=C2=A0=C2=A0 2.264102] e1000e: Copyright(c) 1999 - 2015 Int=
el Corporation.
<br>&gt; [=C2=A0=C2=A0=C2=A0 2.264632] igb: Intel(R) Gigabit Ethernet Netwo=
rk Driver - version=20
<br>&gt; 5.4.0-k
<br>&gt; [=C2=A0=C2=A0=C2=A0 2.265235] igb: Copyright (c) 2007-2014 Intel C=
orporation.
<br>&gt; [=C2=A0=C2=A0=C2=A0 2.265878] igbvf: Intel(R) Gigabit Virtual Func=
tion Network Driver -=20
<br>&gt; version 2.4.0-k
<br>&gt; [=C2=A0=C2=A0=C2=A0 2.266286] igbvf: Copyright (c) 2009 - 2012 Int=
el Corporation.
<br>&gt; [=C2=A0=C2=A0=C2=A0 2.268481] sky2: driver version 1.30
<br>&gt; [=C2=A0=C2=A0=C2=A0 2.271790] VFIO - User Level meta-driver versio=
n: 0.3
<br>&gt; [=C2=A0=C2=A0=C2=A0 2.279480] ehci_hcd: USB 2.0 &#39;Enhanced&#39;=
 Host Controller (EHCI) Driver
<br>&gt; [=C2=A0=C2=A0=C2=A0 2.279971] ehci-pci: EHCI PCI platform driver
<br>&gt; [=C2=A0=C2=A0=C2=A0 2.280718] ehci-platform: EHCI generic platform=
 driver
<br>&gt; [=C2=A0=C2=A0=C2=A0 2.281717] ehci-orion: EHCI orion driver
<br>&gt; [=C2=A0=C2=A0=C2=A0 2.282216] ehci-exynos: EHCI EXYNOS driver
<br>&gt; [=C2=A0=C2=A0=C2=A0 2.282661] ohci_hcd: USB 1.1 &#39;Open&#39; Hos=
t Controller (OHCI) Driver
<br>&gt; [=C2=A0=C2=A0=C2=A0 2.283018] ohci-pci: OHCI PCI platform driver
<br>&gt; [=C2=A0=C2=A0=C2=A0 2.283770] ohci-platform: OHCI generic platform=
 driver
<br>&gt; [=C2=A0=C2=A0=C2=A0 2.284438] ohci-exynos: OHCI EXYNOS driver
<br>&gt; [=C2=A0=C2=A0=C2=A0 2.291438] usbcore: registered new interface dr=
iver usb-storage
<br>&gt; [=C2=A0=C2=A0=C2=A0 2.306327] rtc-pl031 9010000.pl031: rtc core: r=
egistered pl031 as rtc0
<br>&gt; [=C2=A0=C2=A0=C2=A0 2.309554] i2c /dev entries driver
<br>&gt; [=C2=A0=C2=A0=C2=A0 2.323629] sdhci: Secure Digital Host Controlle=
r Interface driver
<br>&gt; [=C2=A0=C2=A0=C2=A0 2.324065] sdhci: Copyright(c) Pierre Ossman
<br>&gt; [=C2=A0=C2=A0=C2=A0 2.326027] Synopsys Designware Multimedia Card =
Interface Driver
<br>&gt; [=C2=A0=C2=A0=C2=A0 2.331478] sdhci-pltfm: SDHCI platform and OF d=
river helper
<br>&gt; [=C2=A0=C2=A0=C2=A0 2.338411] ledtrig-cpu: registered to indicate =
activity on CPUs
<br>&gt; [=C2=A0=C2=A0=C2=A0 2.344584] usbcore: registered new interface dr=
iver usbhid
<br>&gt; [=C2=A0=C2=A0=C2=A0 2.345111] usbhid: USB HID core driver
<br>&gt; [=C2=A0=C2=A0=C2=A0 2.361241] NET: Registered protocol family 10
<br>&gt; [=C2=A0=C2=A0=C2=A0 2.386925] Segment Routing with IPv6
<br>&gt; [=C2=A0=C2=A0=C2=A0 2.387956] NET: Registered protocol family 17
<br>&gt; [=C2=A0=C2=A0=C2=A0 2.390680] 9pnet: Installing 9P2000 support
<br>&gt; [=C2=A0=C2=A0=C2=A0 2.391618] Key type dns_resolver registered
<br>&gt; [=C2=A0=C2=A0=C2=A0 2.394251] registered taskstats version 1
<br>&gt; [=C2=A0=C2=A0=C2=A0 2.394446] Loading compiled-in X.509 certificat=
es
<br>&gt; [=C2=A0=C2=A0=C2=A0 2.408606] input: gpio-keys as /devices/platfor=
m/gpio-keys/<wbr>input/input0
<br>&gt; [=C2=A0=C2=A0=C2=A0 2.413248] rtc-pl031 9010000.pl031: setting sys=
tem clock to=20
<br>&gt; 2020-01-08 20:39:44 UTC (1578515984)
<br>&gt; [=C2=A0=C2=A0=C2=A0 2.424182] uart-pl011 9000000.pl011: no DMA pla=
tform data
<br>&gt; [=C2=A0=C2=A0=C2=A0 2.668052] Freeing unused kernel memory: 1152K
<br>&gt; [=C2=A0=C2=A0=C2=A0 2.676760] Run /init as init process
<br>&gt; Loading, please wait...
<br>&gt; Starting version 241
<br>&gt; Begin: Loading essential drivers ... done.
<br>&gt; Begin: Running /scripts/init-premount ... done.
<br>&gt; Begin: Mounting root file system ... Begin: Running /scripts/local=
-top=20
<br>&gt; ... done.
<br>&gt; Begin: Running /scripts/local-premount ... done.
<br>&gt; Warning: fsck not present, so skipping root file system
<br>&gt; [=C2=A0=C2=A0=C2=A0 6.458709] EXT4-fs (vda): INFO: recovery requir=
ed on readonly filesystem
<br>&gt; [=C2=A0=C2=A0=C2=A0 6.459146] EXT4-fs (vda): write access will be =
enabled during recovery
<br>&gt; [=C2=A0=C2=A0=C2=A0 6.562511] EXT4-fs (vda): recovery complete
<br>&gt; [=C2=A0=C2=A0=C2=A0 6.586139] EXT4-fs (vda): mounted filesystem wi=
th ordered data mode.=20
<br>&gt; Opts: (null)
<br>&gt; done.
<br>&gt; Begin: Running /scripts/local-bottom ... done.
<br>&gt; Begin: Running /scripts/init-bottom ... done.
<br>&gt; [=C2=A0=C2=A0=C2=A0 6.984092] random: fast init done
<br>&gt; [=C2=A0=C2=A0=C2=A0 7.625962] systemd[1]: systemd 241 running in s=
ystem mode. (+PAM=20
<br>&gt; +AUDIT +SELINUX +IMA +APPARMOR +SMACK +SYSVINIT +UTMP +LIBCRYPTSET=
UP=20
<br>&gt; +GCRYPT +GNUTLS +ACL +XZ +LZ4 +SECCOMP +BLKID +ELFUTILS +KMOD -IDN=
2 +IDN=20
<br>&gt; -PCRE2 default-hierarchy=3Dhybrid)
<br>&gt; [=C2=A0=C2=A0=C2=A0 7.630537] systemd[1]: Detected virtualization =
qemu.
<br>&gt; [=C2=A0=C2=A0=C2=A0 7.631210] systemd[1]: Detected architecture ar=
m64.
<br>&gt;=20
<br>&gt; Welcome to Debian GNU/Linux 10 (buster)!
<br>&gt;=20
<br>&gt; [=C2=A0=C2=A0=C2=A0 7.699983] systemd[1]: Set hostname to &lt;demo=
&gt;.
<br>&gt; [=C2=A0=C2=A0=C2=A0 7.751547] systemd[1]: Failed to bump fs.file-m=
ax, ignoring: Invalid=20
<br>&gt; argument
<br>&gt; [=C2=A0=C2=A0=C2=A0 9.000192] systemd[1]: File=20
<br>&gt; /lib/systemd/system/systemd-<wbr>journald.service:12 configures an=
 IP=20
<br>&gt; firewall (IPAddressDeny=3Dany), but the local system does not supp=
ort=20
<br>&gt; BPF/cgroup based firewalling.
<br>&gt; [=C2=A0=C2=A0=C2=A0 9.001046] systemd[1]: Proceeding WITHOUT firew=
alling in effect!=20
<br>&gt; (This warning is only shown for the first loaded unit using IP fir=
ewalling.)
<br>&gt; [=C2=A0=C2=A0=C2=A0 9.705779] random: systemd: uninitialized urand=
om read (16 bytes read)
<br>&gt; [=C2=A0=C2=A0=C2=A0 9.749841] random: systemd: uninitialized urand=
om read (16 bytes read)
<br>&gt; [=C2=A0=C2=A0=C2=A0 9.762078] systemd[1]: Listening on Journal Soc=
ket.
<br>&gt; [=C2=A0 OK=C2=A0 ] Listening on Journal Socket.
<br>&gt; [=C2=A0=C2=A0=C2=A0 9.767359] random: systemd: uninitialized urand=
om read (16 bytes read)
<br>&gt; [=C2=A0=C2=A0=C2=A0 9.770462] systemd[1]: Listening on initctl Com=
patibility Named Pipe.
<br>&gt; [=C2=A0 OK=C2=A0 ] Listening on initctl Compatibility Named Pipe.
<br>&gt; [=C2=A0=C2=A0=C2=A0 9.834070] systemd[1]: Starting Remount Root an=
d Kernel File Systems...
<br>&gt; =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 Starting Re=
mount Root and Kernel File Systems...
<br>&gt; [=C2=A0 OK=C2=A0 ] Started Forward Password R=E2=80=A6uests to Wal=
l Directory Watch.
<br>&gt; =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 Mounting Hu=
ge Pages File System...
<br>&gt; [=C2=A0 OK=C2=A0 ] Created slice system-serial\x2dgetty.slice.
<br>&gt; [=C2=A0 OK=C2=A0 ] Started Dispatch Password =E2=80=A6ts to Consol=
e Directory Watch.
<br>&gt; [=C2=A0 OK=C2=A0 ] Reached target Local Encrypted Volumes.
<br>&gt; =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 Starting Lo=
ad Kernel Modules...
<br>&gt; [=C2=A0 OK=C2=A0 ] Created slice system-getty.slice.
<br>&gt; [=C2=A0 OK=C2=A0 ] Reached target Paths.
<br>&gt; [=C2=A0 OK=C2=A0 ] Listening on udev Kernel Socket.
<br>&gt; [=C2=A0 OK=C2=A0 ] Reached target Remote File Systems.
<br>&gt; [=C2=A0 OK=C2=A0 ] Listening on Journal Audit Socket.
<br>&gt; [=C2=A0 OK=C2=A0 ] Reached target Swap.
<br>&gt; [=C2=A0 OK=C2=A0 ] Created slice User and Session Slice.
<br>&gt; [=C2=A0 OK=C2=A0 ] Reached target Slices.
<br>&gt; =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 Mounting Ke=
rnel Debug File System...
<br>&gt; [=C2=A0 OK=C2=A0 ] Listening on Journal Socket (/dev/log).
<br>&gt; =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 Starting Jo=
urnal Service...
<br>&gt; [=C2=A0 OK=C2=A0 ] Listening on udev Control Socket.
<br>&gt; =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 Starting ud=
ev Coldplug all Devices...
<br>&gt; [=C2=A0=C2=A0 10.496248] EXT4-fs (vda): re-mounted. Opts: (null)
<br>&gt; =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 Mounting PO=
SIX Message Queue File System...
<br>&gt; [=C2=A0=C2=A0 10.671466] jailhouse: loading out-of-tree module tai=
nts kernel.
<br>&gt; [=C2=A0 OK=C2=A0 ] Mounted Huge Pages File System.
<br>&gt; [=C2=A0 OK=C2=A0 ] Started Remount Root and Kernel File Systems.
<br>&gt; [=C2=A0 OK=C2=A0 ] Started Load Kernel Modules.
<br>&gt; [=C2=A0 OK=C2=A0 ] Mounted Kernel Debug File System.
<br>&gt; [=C2=A0 OK=C2=A0 ] Mounted POSIX Message Queue File System.
<br>&gt; =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 Mounting Ke=
rnel Configuration File System...
<br>&gt; =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 Starting Ap=
ply Kernel Variables...
<br>&gt; =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 Starting Lo=
ad/Save Random Seed...
<br>&gt; =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 Starting Cr=
eate System Users...
<br>&gt; [=C2=A0 OK=C2=A0 ] Mounted Kernel Configuration File System.
<br>&gt; [=C2=A0 OK=C2=A0 ] Started Apply Kernel Variables.
<br>&gt; [=C2=A0 OK=C2=A0 ] Started Load/Save Random Seed.
<br>&gt; [=C2=A0 OK=C2=A0 ] Started Create System Users.
<br>&gt; [=C2=A0 OK=C2=A0 ] Started Journal Service.
<br>&gt; =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 Starting Fl=
ush Journal to Persistent Storage...
<br>&gt; =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 Starting Cr=
eate Static Device Nodes in /dev...
<br>&gt; [=C2=A0 OK=C2=A0 ] Started Flush Journal to Persistent Storage.
<br>&gt; [=C2=A0 OK=C2=A0 ] Started Create Static Device Nodes in /dev.
<br>&gt; =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 Starting ud=
ev Kernel Device Manager...
<br>&gt; [=C2=A0 OK=C2=A0 ] Reached target Local File Systems (Pre).
<br>&gt; [=C2=A0 OK=C2=A0 ] Reached target Local File Systems.
<br>&gt; =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 Starting Cr=
eate Volatile Files and Directories...
<br>&gt; [=C2=A0 OK=C2=A0 ] Started udev Kernel Device Manager.
<br>&gt; [=C2=A0 OK=C2=A0 ] Started Create Volatile Files and Directories.
<br>&gt; =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 Starting Ne=
twork Time Synchronization...
<br>&gt; =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 Starting Up=
date UTMP about System Boot/Shutdown...
<br>&gt; [=C2=A0 OK=C2=A0 ] Started Update UTMP about System Boot/Shutdown.
<br>&gt; [=C2=A0 OK=C2=A0 ] Started Network Time Synchronization.
<br>&gt; [=C2=A0 OK=C2=A0 ] Reached target System Time Synchronized.
<br>&gt; [=C2=A0 OK=C2=A0 ] Found device /dev/ttyAMA0.
<br>&gt; [=C2=A0 OK=C2=A0 ] Started udev Coldplug all Devices.
<br>&gt; [=C2=A0 OK=C2=A0 ] Found device /dev/hvc0.
<br>&gt; [=C2=A0 OK=C2=A0 ] Started ifup for eth0.
<br>&gt; [=C2=A0 OK=C2=A0 ] Reached target System Initialization.
<br>&gt; [=C2=A0 OK=C2=A0 ] Listening on D-Bus System Message Bus Socket.
<br>&gt; [=C2=A0 OK=C2=A0 ] Reached target Sockets.
<br>&gt; [=C2=A0 OK=C2=A0 ] Started Daily man-db regeneration.
<br>&gt; [=C2=A0 OK=C2=A0 ] Started Daily apt download activities.
<br>&gt; [=C2=A0 OK=C2=A0 ] Started Daily Cleanup of Temporary Directories.
<br>&gt; [=C2=A0 OK=C2=A0 ] Reached target Basic System.
<br>&gt; =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 Starting Lo=
gin Service...
<br>&gt; [=C2=A0 OK=C2=A0 ] Started D-Bus System Message Bus.
<br>&gt; =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 Starting WP=
A supplicant...
<br>&gt; [=C2=A0 OK=C2=A0 ] Started Daily apt upgrade and clean activities.
<br>&gt; [=C2=A0 OK=C2=A0 ] Reached target Timers.
<br>&gt; =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 Starting He=
lper to synchronize boot up for ifupdown...
<br>&gt; =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 Starting Da=
ily man-db regeneration...
<br>&gt; [=C2=A0 OK=C2=A0 ] Started Helper to synchronize boot up for ifupd=
own.
<br>&gt; [=C2=A0 OK=C2=A0 ] Started Login Service.
<br>&gt; [=C2=A0 OK=C2=A0 ] Started WPA supplicant.
<br>&gt; =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 Starting Ra=
ise network interfaces...
<br>&gt; [=C2=A0 OK=C2=A0 ] Started Raise network interfaces.
<br>&gt; [=C2=A0 OK=C2=A0 ] Reached target Network.
<br>&gt; =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 Starting Da=
ily apt download activities...
<br>&gt; =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 Starting Op=
enBSD Secure Shell server...
<br>&gt; =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 Starting Pe=
rmit User Sessions...
<br>&gt; [=C2=A0 OK=C2=A0 ] Started Permit User Sessions.
<br>&gt; [=C2=A0 OK=C2=A0 ] Started Serial Getty on ttyAMA0.
<br>&gt; [=C2=A0 OK=C2=A0 ] Started Serial Getty on hvc0.
<br>&gt; [=C2=A0 OK=C2=A0 ] Started Getty on tty1.
<br>&gt; [=C2=A0 OK=C2=A0 ] Reached target Login Prompts.
<br>&gt; [=C2=A0 OK=C2=A0 ] Started Daily man-db regeneration.
<br>&gt;=20
<br>&gt; Jailhouse Demo Image (login: root/root)
<br>&gt; demo login: sarojs@engee-e121-d08:/$ docker --version
<br>&gt; Password:
<br>&gt; Login timed out after 60 seconds.
<br>&gt;=20
<br>&gt; Jailhouse Demo Image (login: root/root)
<br>&gt; demo login:
<br>&gt; *After I login i get the following:*
<br>&gt; Linux demo 4.19.67 #1 SMP PREEMPT Tue Nov 5 18:52:36 UTC 2019 aarc=
h64
<br>&gt;=20
<br>&gt; For trying out Jailhouse, the following commands have been placed =
into the
<br>&gt; shell history:
<br>&gt; =C2=A0=C2=A0# jailhouse enable /etc/jailhouse/qemu-arm64.cell
<br>&gt; =C2=A0=C2=A0# jailhouse console
<br>&gt; =C2=A0=C2=A0# jailhouse cell create /etc/jailhouse/qemu-arm64-gic-=
<wbr>demo.cell
<br>&gt; =C2=A0=C2=A0# jailhouse cell load gic-demo /usr/libexec/jailhouse/=
demos/<wbr>gic-demo.bin
<br>&gt; =C2=A0=C2=A0# jailhouse cell start gic-demo
<br>&gt; =C2=A0=C2=A0# jailhouse cell stats gic-demo
<br>&gt; =C2=A0=C2=A0# jailhouse cell destroy gic-demo
<br>&gt; =C2=A0=C2=A0# jailhouse cell linux /etc/jailhouse/qemu-arm64-<wbr>=
linux-demo.cell \
<br>&gt; =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 /boot/vmlinuz* \
<br>&gt; =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 -d /etc/jailhouse/dts/inmate-<wbr>qemu-arm64.dtb \
<br>&gt; =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 -i /usr/libexec/jailhouse/demos/<wbr>rootfs.cpio \
<br>&gt; =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 -c &quot;console=3DttyAMA0 ip=3D192.168.19.2&quot;
<br>&gt; =C2=A0=C2=A0# ssh 192.168.19.2
<br>&gt; =C2=A0=C2=A0# jailhouse disable
<br>&gt;=20
<br>&gt; The programs included with the Debian GNU/Linux system are free so=
ftware;
<br>&gt; the exact distribution terms for each program are described in the
<br>&gt; individual files in /usr/share/doc/*/copyright.
<br>&gt;=20
<br>&gt; Debian GNU/Linux comes with ABSOLUTELY NO WARRANTY, to the extent
<br>&gt; permitted by applicable law.
<br>&gt; *Then I open new terminal and try to ssh but it shows time out, wh=
y I=20
<br>&gt; cannot ssh the address given. Due to this failure I was unable to=
=20
<br>&gt; control one console terminal from the other and create two cells=
=20
<br>&gt; gic-demo and linux demo. How can I create two cell so that I can r=
un=20
<br>&gt; application in One and Linux in another? please help me with this.=
 I&#39;m=20
<br>&gt; trying for nearly one month but I was unable to do this.*
<br>
<br>Which of the commands above did you run, besides ssh?
<br>
<br>Jan
<br>
<br>--=20
<br>Siemens AG, Corporate Technology, CT RDA IOT SES-DE
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
om/d/msgid/jailhouse-dev/dd8368be-e94d-41cf-9bf7-654094e623f3%40googlegroup=
s.com?utm_medium=3Demail&utm_source=3Dfooter">https://groups.google.com/d/m=
sgid/jailhouse-dev/dd8368be-e94d-41cf-9bf7-654094e623f3%40googlegroups.com<=
/a>.<br />

------=_Part_374_651712537.1578598089609--

------=_Part_373_214089516.1578598089608--
