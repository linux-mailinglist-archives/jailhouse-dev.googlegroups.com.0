Return-Path: <jailhouse-dev+bncBCQ7HUU4XULBBF4D3HYAKGQETP46FTA@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-oi1-x238.google.com (mail-oi1-x238.google.com [IPv6:2607:f8b0:4864:20::238])
	by mail.lfdr.de (Postfix) with ESMTPS id EA33E134E18
	for <lists+jailhouse-dev@lfdr.de>; Wed,  8 Jan 2020 21:54:48 +0100 (CET)
Received: by mail-oi1-x238.google.com with SMTP id w205sf2251800oie.13
        for <lists+jailhouse-dev@lfdr.de>; Wed, 08 Jan 2020 12:54:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:date:from:to:message-id:subject:mime-version
         :x-original-sender:precedence:mailing-list:list-id:list-post
         :list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=vZv0gAIc4tb/yNoUyv2qIkajjNcCEwpWglEZodiFYeM=;
        b=bW2JA5L7PXIu6zeMWyb3XeRb3GzGouXcCFa01/0uayPZxpdl8U04nlBmp1zzknN1aP
         7Z1vaxTD8HJ87QyVdYsHKcNRn7ouI0+D8ygdBrKSMX0eke5LbQVkQLbvfXYUxUcdyG/a
         WBXYs5Z4PLZfvlkoMhJARaQ5iPNGnjxe+MpsaDhZO3pgfs1Ezj0UHO58X2rRghjbObdZ
         zdmKIWwMxDwyJsLBoHU0Ce9Wgt+taiDYWQOC6lp650fMsuutzn5cEP/KxkQ4bDWxobja
         y07ZpQH4D8vW9y8TiS8B1on83SARxZGy0XBjJHbxwFswk3HTI3QFqxaSmkPJYbu6GJpZ
         dpiQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:message-id:subject:mime-version:x-original-sender
         :precedence:mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=vZv0gAIc4tb/yNoUyv2qIkajjNcCEwpWglEZodiFYeM=;
        b=jQyn97Kdiz5z1LtiOQ44jm01rf/AtkDDG1pcnWb3Ust7fg8/sXSFde+6Lg/SpxQJPa
         9SNYZA2noZ7cDAzAGHxk+z/qyxaZ/uF1uc+v+l0e7Q4FQsAX5zA/YZWHDdoKH3OyZ1PS
         5eztj8FkLEhjmza5MOuZP0HpnJaLN/vifrpsY2eAiuQG5FppN+dnMxUkHbrnxwZJk8Bs
         EgvvAL7sjpmcH8Q/2HdoLcKttG2DlozNcKxtpq/kgL2ymf50aStz3/AmcBGf+41ghIni
         6kq8lyIq0WgwAHGwwc0IdqXt4FSFqrYRNluSbUp+3XdjrKcfRMskzP56HuOh591YQz2f
         GlGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:date:from:to:message-id:subject
         :mime-version:x-original-sender:precedence:mailing-list:list-id
         :x-spam-checked-in-group:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=vZv0gAIc4tb/yNoUyv2qIkajjNcCEwpWglEZodiFYeM=;
        b=raZOXeoIO/nm3g1yUlcHJRh68dYGwl30UON7H2NHhAs0SGXaxCVCxGHPN2YBQKiZ05
         +XLAzGWxugID/u/YV6Ad6U0FbRcqwwPdQlgsHndYz7qyLUnRhJSYTOGtd34C32JvaMvw
         L7/Y6BkqCA6Qy1lrW2TmarLCInwsLRfCu48bfJXveHOebJDVcQFfeZ8EVl3JVJKyxxgt
         bTqGN7lacs9ItE8vatkQhrQvcLctjjgUbmnZp8tA9MrDJuTiu5Idsl0SKDE1TtdhkjGD
         H+QMPIH9UCDmPaZ21fi49WLVdgw+LFHyUwdcCk0Zq7/e50lEUP3mQzfdGs3lRoNoPQ2s
         L2xQ==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: APjAAAUcECBM6wZHLBhNpzJsZ9B0eTTK9KZgP4Yz1SET6+0qCWotLo4r
	UhFM3kUMnZiM43AHIuP8r0U=
X-Google-Smtp-Source: APXvYqzaHYsFJM6giiXwn9k7xPiX0GKLfao8YtsI5umSiXkA0KUaB5jZswQKbcO95UDf/d3lzqEvjw==
X-Received: by 2002:a9d:2dca:: with SMTP id g68mr5142877otb.150.1578516887676;
        Wed, 08 Jan 2020 12:54:47 -0800 (PST)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:aca:5753:: with SMTP id l80ls5890oib.15.gmail; Wed, 08 Jan
 2020 12:54:47 -0800 (PST)
X-Received: by 2002:aca:2118:: with SMTP id 24mr458004oiz.28.1578516886946;
        Wed, 08 Jan 2020 12:54:46 -0800 (PST)
Date: Wed, 8 Jan 2020 12:54:46 -0800 (PST)
From: Saroj Sapkota <samirroj2016@gmail.com>
To: Jailhouse <jailhouse-dev@googlegroups.com>
Message-Id: <b33c1868-f6be-4e7c-8b23-7d7bdf75f15e@googlegroups.com>
Subject: ssh don't work on  jailhouse-images and how to create two cell one
 with application and another with linux on jailhouse-image demo
MIME-Version: 1.0
Content-Type: multipart/mixed; 
	boundary="----=_Part_4701_1909101181.1578516886328"
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

------=_Part_4701_1909101181.1578516886328
Content-Type: multipart/alternative; 
	boundary="----=_Part_4702_2043086626.1578516886329"

------=_Part_4702_2043086626.1578516886329
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

All the requirement docker, qemu, kernel updated to latest as mentioned in=
=20
read.md and the results are:
sarojs@engee-e121-d08:/$ docker --version
Docker version 19.03.4, build 9013bf583a
sarojs@engee-e121-d08:/$ qemu-system-x86_64 --version
QEMU emulator version 4.1.0
Copyright (c) 2003-2019 Fabrice Bellard and the QEMU Project developers
sarojs@engee-e121-d08:/$ uname -r
4.4.0-167-generic
*after this I run build-images.sh and then finally start-qemu.sh*
*and the results is:*

sarojs@engee-e121-d08:~/Downloads/jailhouse-images$ ./start-qemu.sh arm64
VNC server running on 127.0.0.1:5900
[    0.000000] Booting Linux on physical CPU 0x0000000000 [0x411fd070]
[    0.000000] Linux version 4.19.67 (builder@bc528e2a57f1) (gcc version=20
8.3.0 (Debian 8.3.0-2)) #1 SMP PREEMPT Tue Nov 5 18:52:36 UTC 2019
[    0.000000] Machine model: linux,dummy-virt
[    0.000000] Memory limited to 768MB
[    0.000000] efi: Getting EFI parameters from FDT:
[    0.000000] efi: UEFI not found.
[    0.000000] cma: Reserved 16 MiB at 0x000000006f000000
[    0.000000] NUMA: No NUMA configuration found
[    0.000000] NUMA: Faking a node at [mem=20
0x0000000000000000-0x000000006fffffff]
[    0.000000] NUMA: NODE_DATA [mem 0x6efe8480-0x6efe9c3f]
[    0.000000] Zone ranges:
[    0.000000]   DMA32    [mem 0x0000000040000000-0x000000006fffffff]
[    0.000000]   Normal   empty
[    0.000000] Movable zone start for each node
[    0.000000] Early memory node ranges
[    0.000000]   node   0: [mem 0x0000000040000000-0x000000006fffffff]
[    0.000000] Initmem setup node 0 [mem=20
0x0000000040000000-0x000000006fffffff]
[    0.000000] psci: probing for conduit method from DT.
[    0.000000] psci: PSCIv0.2 detected in firmware.
[    0.000000] psci: Using standard PSCI v0.2 function IDs
[    0.000000] psci: Trusted OS migration not required
[    0.000000] random: get_random_bytes called from start_kernel+0x94/0x400=
=20
with crng_init=3D0
[    0.000000] percpu: Embedded 22 pages/cpu s53016 r8192 d28904 u90112
[    0.000000] Detected PIPT I-cache on CPU0
[    0.000000] CPU features: enabling workaround for ARM erratum 832075
[    0.000000] CPU features: enabling workaround for EL2 vector hardening
[    0.000000] CPU features: detected: Kernel page table isolation (KPTI)
[    0.000000] Built 1 zonelists, mobility grouping on.  Total pages: 19353=
6
[    0.000000] Policy zone: DMA32
[    0.000000] Kernel command line:              root=3D/dev/vda mem=3D768M
[    0.000000] Memory: 729472K/786432K available (10044K kernel code, 1294K=
=20
rwdata, 4312K rodata, 1152K init, 369K bss, 40576K reserved, 16384K=20
cma-reserved)
[    0.000000] SLUB: HWalign=3D64, Order=3D0-3, MinObjects=3D0, CPUs=3D16, =
Nodes=3D1
[    0.000000] rcu: Preemptible hierarchical RCU implementation.
[    0.000000] rcu:     RCU restricting CPUs from NR_CPUS=3D64 to=20
nr_cpu_ids=3D16.
[    0.000000]     Tasks RCU enabled.
[    0.000000] rcu: Adjusting geometry for rcu_fanout_leaf=3D16, nr_cpu_ids=
=3D16
[    0.000000] NR_IRQS: 64, nr_irqs: 64, preallocated irqs: 0
[    0.000000] GICv3: GIC: Using split EOI/Deactivate mode
[    0.000000] GICv3: Distributor has no Range Selector support
[    0.000000] GICv3: no VLPI support, no direct LPI support
[    0.000000] GICv3: CPU0: found redistributor 0 region=20
0:0x00000000080a0000
[    0.000000] arch_timer: cp15 timer(s) running at 62.50MHz (phys).
[    0.000000] clocksource: arch_sys_counter: mask: 0xffffffffffffff=20
max_cycles: 0x1cd42e208c, max_idle_ns: 881590405314 ns
[    0.000167] sched_clock: 56 bits at 62MHz, resolution 16ns, wraps every=
=20
4398046511096ns
[    0.009196] Console: colour dummy device 80x25
[    0.011540] console [tty0] enabled
[    0.014855] Calibrating delay loop (skipped), value calculated using=20
timer frequency.. 125.00 BogoMIPS (lpj=3D250000)
[    0.015058] pid_max: default: 32768 minimum: 301
[    0.016528] Security Framework initialized
[    0.018663] Dentry cache hash table entries: 131072 (order: 8, 1048576=
=20
bytes)
[    0.019461] Inode-cache hash table entries: 65536 (order: 7, 524288=20
bytes)
[    0.019731] Mount-cache hash table entries: 2048 (order: 2, 16384 bytes)
[    0.019824] Mountpoint-cache hash table entries: 2048 (order: 2, 16384=
=20
bytes)
[    0.082413] ASID allocator initialised with 32768 entries
[    0.090745] rcu: Hierarchical SRCU implementation.
[    0.121397] EFI services will not be available.
[    0.131213] smp: Bringing up secondary CPUs ...
[    0.163456] Detected PIPT I-cache on CPU1
[    0.165414] GICv3: CPU1: found redistributor 1 region=20
0:0x00000000080c0000
[    0.165996] CPU1: Booted secondary processor 0x0000000001 [0x411fd070]
[    0.209014] Detected PIPT I-cache on CPU2
[    0.209110] GICv3: CPU2: found redistributor 2 region=20
0:0x00000000080e0000
[    0.209225] CPU2: Booted secondary processor 0x0000000002 [0x411fd070]
[    0.241807] Detected PIPT I-cache on CPU3
[    0.241941] GICv3: CPU3: found redistributor 3 region=20
0:0x0000000008100000
[    0.242103] CPU3: Booted secondary processor 0x0000000003 [0x411fd070]
[    0.276834] Detected PIPT I-cache on CPU4
[    0.277172] GICv3: CPU4: found redistributor 4 region=20
0:0x0000000008120000
[    0.277537] CPU4: Booted secondary processor 0x0000000004 [0x411fd070]
[    0.316327] Detected PIPT I-cache on CPU5
[    0.316709] GICv3: CPU5: found redistributor 5 region=20
0:0x0000000008140000
[    0.317101] CPU5: Booted secondary processor 0x0000000005 [0x411fd070]
[    0.356252] Detected PIPT I-cache on CPU6
[    0.356626] GICv3: CPU6: found redistributor 6 region=20
0:0x0000000008160000
[    0.357149] CPU6: Booted secondary processor 0x0000000006 [0x411fd070]
[    0.394943] Detected PIPT I-cache on CPU7
[    0.395074] GICv3: CPU7: found redistributor 7 region=20
0:0x0000000008180000
[    0.395224] CPU7: Booted secondary processor 0x0000000007 [0x411fd070]
[    0.427866] Detected PIPT I-cache on CPU8
[    0.428003] GICv3: CPU8: found redistributor 8 region=20
0:0x00000000081a0000
[    0.428163] CPU8: Booted secondary processor 0x0000000008 [0x411fd070]
[    0.483476] Detected PIPT I-cache on CPU9
[    0.483774] GICv3: CPU9: found redistributor 9 region=20
0:0x00000000081c0000
[    0.484125] CPU9: Booted secondary processor 0x0000000009 [0x411fd070]
[    0.517943] Detected PIPT I-cache on CPU10
[    0.518510] GICv3: CPU10: found redistributor a region=20
0:0x00000000081e0000
[    0.519101] CPU10: Booted secondary processor 0x000000000a [0x411fd070]
[    0.556796] Detected PIPT I-cache on CPU11
[    0.557390] GICv3: CPU11: found redistributor b region=20
0:0x0000000008200000
[    0.557984] CPU11: Booted secondary processor 0x000000000b [0x411fd070]
[    0.594707] Detected PIPT I-cache on CPU12
[    0.595031] GICv3: CPU12: found redistributor c region=20
0:0x0000000008220000
[    0.595533] CPU12: Booted secondary processor 0x000000000c [0x411fd070]
[    0.628692] Detected PIPT I-cache on CPU13
[    0.629111] GICv3: CPU13: found redistributor d region=20
0:0x0000000008240000
[    0.629460] CPU13: Booted secondary processor 0x000000000d [0x411fd070]
[    0.662432] Detected PIPT I-cache on CPU14
[    0.662815] GICv3: CPU14: found redistributor e region=20
0:0x0000000008260000
[    0.663338] CPU14: Booted secondary processor 0x000000000e [0x411fd070]
[    0.701173] Detected PIPT I-cache on CPU15
[    0.701480] GICv3: CPU15: found redistributor f region=20
0:0x0000000008280000
[    0.701830] CPU15: Booted secondary processor 0x000000000f [0x411fd070]
[    0.703285] smp: Brought up 1 node, 16 CPUs
[    0.709495] SMP: Total of 16 processors activated.
[    0.709877] CPU features: detected: GIC system register CPU interface
[    0.710137] CPU features: detected: 32-bit EL0 Support
[    0.932452] CPU: All CPU(s) started at EL2
[    0.965064] alternatives: patching kernel code
[    1.021311] devtmpfs: initialized
[    1.038681] clocksource: jiffies: mask: 0xffffffff max_cycles:=20
0xffffffff, max_idle_ns: 7645041785100000 ns
[    1.039229] futex hash table entries: 4096 (order: 6, 262144 bytes)
[    1.044588] pinctrl core: initialized pinctrl subsystem
[    1.062703] DMI not present or invalid.
[    1.069419] NET: Registered protocol family 16
[    1.074197] audit: initializing netlink subsys (disabled)
[    1.076449] audit: type=3D2000 audit(0.776:1): state=3Dinitialized=20
audit_enabled=3D0 res=3D1
[    1.084715] cpuidle: using governor menu
[    1.086698] vdso: 2 pages (1 code @ (____ptrval____), 1 data @=20
(____ptrval____))
[    1.086870] hw-breakpoint: found 6 breakpoint and 4 watchpoint registers=
.
[    1.100600] DMA: preallocated 256 KiB pool for atomic allocations
[    1.105252] Serial: AMBA PL011 UART driver
[    1.142651] 9000000.pl011: ttyAMA0 at MMIO 0x9000000 (irq =3D 40,=20
base_baud =3D 0) is a PL011 rev1
[    1.165136] console [ttyAMA0] enabled
[    1.370391] HugeTLB registered 2.00 MiB page size, pre-allocated 0 pages
[    1.375592] cryptd: max_cpu_qlen set to 1000
[    1.381172] ACPI: Interpreter disabled.
[    1.386213] vgaarb: loaded
[    1.388929] SCSI subsystem initialized
[    1.394115] usbcore: registered new interface driver usbfs
[    1.394984] usbcore: registered new interface driver hub
[    1.396038] usbcore: registered new device driver usb
[    1.404071] pps_core: LinuxPPS API ver. 1 registered
[    1.404564] pps_core: Software ver. 5.3.6 - Copyright 2005-2007 Rodolfo=
=20
Giometti <giometti@linux.it>
[    1.405492] PTP clock support registered
[    1.407076] EDAC MC: Ver: 3.0.0
[    1.492705] clocksource: Switched to clocksource arch_sys_counter
[    1.509419] VFS: Disk quotas dquot_6.6.0
[    1.509874] VFS: Dquot-cache hash table entries: 512 (order 0, 4096=20
bytes)
[    1.512450] pnp: PnP ACPI: disabled
[    1.568294] NET: Registered protocol family 2
[    1.584108] tcp_listen_portaddr_hash hash table entries: 512 (order: 1,=
=20
8192 bytes)
[    1.584780] TCP established hash table entries: 8192 (order: 4, 65536=20
bytes)
[    1.585583] TCP bind hash table entries: 8192 (order: 5, 131072 bytes)
[    1.586009] TCP: Hash tables configured (established 8192 bind 8192)
[    1.588606] UDP hash table entries: 512 (order: 2, 16384 bytes)
[    1.589179] UDP-Lite hash table entries: 512 (order: 2, 16384 bytes)
[    1.592560] NET: Registered protocol family 1
[    1.598547] RPC: Registered named UNIX socket transport module.
[    1.598784] RPC: Registered udp transport module.
[    1.598954] RPC: Registered tcp transport module.
[    1.599110] RPC: Registered tcp NFSv4.1 backchannel transport module.
[    1.602869] Unpacking initramfs...
[    1.847907] Freeing initrd memory: 4292K
[    1.857706] hw perfevents: enabled with armv8_pmuv3 PMU driver, 5=20
counters available
[    1.879734] Initialise system trusted keyrings
[    1.883324] workingset: timestamp_bits=3D44 max_order=3D18 bucket_order=
=3D0
[    1.912683] squashfs: version 4.0 (2009/01/31) Phillip Lougher
[    1.918361] NFS: Registering the id_resolver key type
[    1.918781] Key type id_resolver registered
[    1.919012] Key type id_legacy registered
[    1.919442] nfs4filelayout_init: NFSv4 File Layout Driver Registering...
[    1.921845] 9p: Installing v9fs 9p2000 file system support
[    1.942598] Key type asymmetric registered
[    1.942860] Asymmetric key parser 'x509' registered
[    1.943281] Block layer SCSI generic (bsg) driver version 0.4 loaded=20
(major 246)
[    1.944068] io scheduler noop registered
[    1.944699] io scheduler cfq registered (default)
[    1.945362] io scheduler mq-deadline registered
[    1.945581] io scheduler kyber registered
[    1.975723] pl061_gpio 9030000.pl061: PL061 GPIO chip=20
@0x0000000009030000 registered
[    1.985874] pci-host-generic 4010000000.pcie: host bridge /pcie@10000000=
=20
ranges:
[    1.986737] pci-host-generic 4010000000.pcie:    IO=20
0x3eff0000..0x3effffff -> 0x00000000
[    1.987598] pci-host-generic 4010000000.pcie:   MEM=20
0x10000000..0x3efeffff -> 0x10000000
[    1.987882] pci-host-generic 4010000000.pcie:   MEM=20
0x8000000000..0xffffffffff -> 0x8000000000
[    1.989836] pci-host-generic 4010000000.pcie: ECAM at [mem=20
0x4010000000-0x401fffffff] for [bus 00-ff]
[    1.992336] pci-host-generic 4010000000.pcie: PCI host bridge to bus=20
0000:00
[    1.993286] pci_bus 0000:00: root bus resource [bus 00-ff]
[    1.993814] pci_bus 0000:00: root bus resource [io  0x0000-0xffff]
[    1.994028] pci_bus 0000:00: root bus resource [mem=20
0x10000000-0x3efeffff]
[    1.994300] pci_bus 0000:00: root bus resource [mem=20
0x8000000000-0xffffffffff]
[    2.088592] Serial: 8250/16550 driver, 4 ports, IRQ sharing enabled
[    2.095955] SuperH (H)SCI(F) driver initialized
[    2.097903] msm_serial: driver initialized
[    2.118236] cacheinfo: Unable to detect cache hierarchy for CPU 0
[    2.168640] loop: module loaded
[    2.193407] virtio_blk virtio1: [vda] 2694416 512-byte logical blocks=20
(1.38 GB/1.28 GiB)
[    2.240577] libphy: Fixed MDIO Bus: probed
[    2.244779] tun: Universal TUN/TAP device driver, 1.6
[    2.263829] e1000e: Intel(R) PRO/1000 Network Driver - 3.2.6-k
[    2.264102] e1000e: Copyright(c) 1999 - 2015 Intel Corporation.
[    2.264632] igb: Intel(R) Gigabit Ethernet Network Driver - version=20
5.4.0-k
[    2.265235] igb: Copyright (c) 2007-2014 Intel Corporation.
[    2.265878] igbvf: Intel(R) Gigabit Virtual Function Network Driver -=20
version 2.4.0-k
[    2.266286] igbvf: Copyright (c) 2009 - 2012 Intel Corporation.
[    2.268481] sky2: driver version 1.30
[    2.271790] VFIO - User Level meta-driver version: 0.3
[    2.279480] ehci_hcd: USB 2.0 'Enhanced' Host Controller (EHCI) Driver
[    2.279971] ehci-pci: EHCI PCI platform driver
[    2.280718] ehci-platform: EHCI generic platform driver
[    2.281717] ehci-orion: EHCI orion driver
[    2.282216] ehci-exynos: EHCI EXYNOS driver
[    2.282661] ohci_hcd: USB 1.1 'Open' Host Controller (OHCI) Driver
[    2.283018] ohci-pci: OHCI PCI platform driver
[    2.283770] ohci-platform: OHCI generic platform driver
[    2.284438] ohci-exynos: OHCI EXYNOS driver
[    2.291438] usbcore: registered new interface driver usb-storage
[    2.306327] rtc-pl031 9010000.pl031: rtc core: registered pl031 as rtc0
[    2.309554] i2c /dev entries driver
[    2.323629] sdhci: Secure Digital Host Controller Interface driver
[    2.324065] sdhci: Copyright(c) Pierre Ossman
[    2.326027] Synopsys Designware Multimedia Card Interface Driver
[    2.331478] sdhci-pltfm: SDHCI platform and OF driver helper
[    2.338411] ledtrig-cpu: registered to indicate activity on CPUs
[    2.344584] usbcore: registered new interface driver usbhid
[    2.345111] usbhid: USB HID core driver
[    2.361241] NET: Registered protocol family 10
[    2.386925] Segment Routing with IPv6
[    2.387956] NET: Registered protocol family 17
[    2.390680] 9pnet: Installing 9P2000 support
[    2.391618] Key type dns_resolver registered
[    2.394251] registered taskstats version 1
[    2.394446] Loading compiled-in X.509 certificates
[    2.408606] input: gpio-keys as /devices/platform/gpio-keys/input/input0
[    2.413248] rtc-pl031 9010000.pl031: setting system clock to 2020-01-08=
=20
20:39:44 UTC (1578515984)
[    2.424182] uart-pl011 9000000.pl011: no DMA platform data
[    2.668052] Freeing unused kernel memory: 1152K
[    2.676760] Run /init as init process
Loading, please wait...
Starting version 241
Begin: Loading essential drivers ... done.
Begin: Running /scripts/init-premount ... done.
Begin: Mounting root file system ... Begin: Running /scripts/local-top ...=
=20
done.
Begin: Running /scripts/local-premount ... done.
Warning: fsck not present, so skipping root file system
[    6.458709] EXT4-fs (vda): INFO: recovery required on readonly filesyste=
m
[    6.459146] EXT4-fs (vda): write access will be enabled during recovery
[    6.562511] EXT4-fs (vda): recovery complete
[    6.586139] EXT4-fs (vda): mounted filesystem with ordered data mode.=20
Opts: (null)
done.
Begin: Running /scripts/local-bottom ... done.
Begin: Running /scripts/init-bottom ... done.
[    6.984092] random: fast init done
[    7.625962] systemd[1]: systemd 241 running in system mode. (+PAM +AUDIT=
=20
+SELINUX +IMA +APPARMOR +SMACK +SYSVINIT +UTMP +LIBCRYPTSETUP +GCRYPT=20
+GNUTLS +ACL +XZ +LZ4 +SECCOMP +BLKID +ELFUTILS +KMOD -IDN2 +IDN -PCRE2=20
default-hierarchy=3Dhybrid)
[    7.630537] systemd[1]: Detected virtualization qemu.
[    7.631210] systemd[1]: Detected architecture arm64.

Welcome to Debian GNU/Linux 10 (buster)!

[    7.699983] systemd[1]: Set hostname to <demo>.
[    7.751547] systemd[1]: Failed to bump fs.file-max, ignoring: Invalid=20
argument
[    9.000192] systemd[1]: File=20
/lib/systemd/system/systemd-journald.service:12 configures an IP firewall=
=20
(IPAddressDeny=3Dany), but the local system does not support BPF/cgroup bas=
ed=20
firewalling.
[    9.001046] systemd[1]: Proceeding WITHOUT firewalling in effect! (This=
=20
warning is only shown for the first loaded unit using IP firewalling.)
[    9.705779] random: systemd: uninitialized urandom read (16 bytes read)
[    9.749841] random: systemd: uninitialized urandom read (16 bytes read)
[    9.762078] systemd[1]: Listening on Journal Socket.
[  OK  ] Listening on Journal Socket.
[    9.767359] random: systemd: uninitialized urandom read (16 bytes read)
[    9.770462] systemd[1]: Listening on initctl Compatibility Named Pipe.
[  OK  ] Listening on initctl Compatibility Named Pipe.
[    9.834070] systemd[1]: Starting Remount Root and Kernel File Systems...
         Starting Remount Root and Kernel File Systems...
[  OK  ] Started Forward Password R=E2=80=A6uests to Wall Directory Watch.
         Mounting Huge Pages File System...
[  OK  ] Created slice system-serial\x2dgetty.slice.
[  OK  ] Started Dispatch Password =E2=80=A6ts to Console Directory Watch.
[  OK  ] Reached target Local Encrypted Volumes.
         Starting Load Kernel Modules...
[  OK  ] Created slice system-getty.slice.
[  OK  ] Reached target Paths.
[  OK  ] Listening on udev Kernel Socket.
[  OK  ] Reached target Remote File Systems.
[  OK  ] Listening on Journal Audit Socket.
[  OK  ] Reached target Swap.
[  OK  ] Created slice User and Session Slice.
[  OK  ] Reached target Slices.
         Mounting Kernel Debug File System...
[  OK  ] Listening on Journal Socket (/dev/log).
         Starting Journal Service...
[  OK  ] Listening on udev Control Socket.
         Starting udev Coldplug all Devices...
[   10.496248] EXT4-fs (vda): re-mounted. Opts: (null)
         Mounting POSIX Message Queue File System...
[   10.671466] jailhouse: loading out-of-tree module taints kernel.
[  OK  ] Mounted Huge Pages File System.
[  OK  ] Started Remount Root and Kernel File Systems.
[  OK  ] Started Load Kernel Modules.
[  OK  ] Mounted Kernel Debug File System.
[  OK  ] Mounted POSIX Message Queue File System.
         Mounting Kernel Configuration File System...
         Starting Apply Kernel Variables...
         Starting Load/Save Random Seed...
         Starting Create System Users...
[  OK  ] Mounted Kernel Configuration File System.
[  OK  ] Started Apply Kernel Variables.
[  OK  ] Started Load/Save Random Seed.
[  OK  ] Started Create System Users.
[  OK  ] Started Journal Service.
         Starting Flush Journal to Persistent Storage...
         Starting Create Static Device Nodes in /dev...
[  OK  ] Started Flush Journal to Persistent Storage.
[  OK  ] Started Create Static Device Nodes in /dev.
         Starting udev Kernel Device Manager...
[  OK  ] Reached target Local File Systems (Pre).
[  OK  ] Reached target Local File Systems.
         Starting Create Volatile Files and Directories...
[  OK  ] Started udev Kernel Device Manager.
[  OK  ] Started Create Volatile Files and Directories.
         Starting Network Time Synchronization...
         Starting Update UTMP about System Boot/Shutdown...
[  OK  ] Started Update UTMP about System Boot/Shutdown.
[  OK  ] Started Network Time Synchronization.
[  OK  ] Reached target System Time Synchronized.
[  OK  ] Found device /dev/ttyAMA0.
[  OK  ] Started udev Coldplug all Devices.
[  OK  ] Found device /dev/hvc0.
[  OK  ] Started ifup for eth0.
[  OK  ] Reached target System Initialization.
[  OK  ] Listening on D-Bus System Message Bus Socket.
[  OK  ] Reached target Sockets.
[  OK  ] Started Daily man-db regeneration.
[  OK  ] Started Daily apt download activities.
[  OK  ] Started Daily Cleanup of Temporary Directories.
[  OK  ] Reached target Basic System.
         Starting Login Service...
[  OK  ] Started D-Bus System Message Bus.
         Starting WPA supplicant...
[  OK  ] Started Daily apt upgrade and clean activities.
[  OK  ] Reached target Timers.
         Starting Helper to synchronize boot up for ifupdown...
         Starting Daily man-db regeneration...
[  OK  ] Started Helper to synchronize boot up for ifupdown.
[  OK  ] Started Login Service.
[  OK  ] Started WPA supplicant.
         Starting Raise network interfaces...
[  OK  ] Started Raise network interfaces.
[  OK  ] Reached target Network.
         Starting Daily apt download activities...
         Starting OpenBSD Secure Shell server...
         Starting Permit User Sessions...
[  OK  ] Started Permit User Sessions.
[  OK  ] Started Serial Getty on ttyAMA0.
[  OK  ] Started Serial Getty on hvc0.
[  OK  ] Started Getty on tty1.
[  OK  ] Reached target Login Prompts.
[  OK  ] Started Daily man-db regeneration.

Jailhouse Demo Image (login: root/root)
demo login: sarojs@engee-e121-d08:/$ docker --version
Password:=20
Login timed out after 60 seconds.

Jailhouse Demo Image (login: root/root)
demo login:=20
*After I login i get the following:*
Linux demo 4.19.67 #1 SMP PREEMPT Tue Nov 5 18:52:36 UTC 2019 aarch64

For trying out Jailhouse, the following commands have been placed into the
shell history:
 # jailhouse enable /etc/jailhouse/qemu-arm64.cell
 # jailhouse console
 # jailhouse cell create /etc/jailhouse/qemu-arm64-gic-demo.cell
 # jailhouse cell load gic-demo /usr/libexec/jailhouse/demos/gic-demo.bin
 # jailhouse cell start gic-demo
 # jailhouse cell stats gic-demo
 # jailhouse cell destroy gic-demo
 # jailhouse cell linux /etc/jailhouse/qemu-arm64-linux-demo.cell \
                        /boot/vmlinuz* \
                        -d /etc/jailhouse/dts/inmate-qemu-arm64.dtb \
                        -i /usr/libexec/jailhouse/demos/rootfs.cpio \
                        -c "console=3DttyAMA0 ip=3D192.168.19.2"
 # ssh 192.168.19.2
 # jailhouse disable

The programs included with the Debian GNU/Linux system are free software;
the exact distribution terms for each program are described in the
individual files in /usr/share/doc/*/copyright.

Debian GNU/Linux comes with ABSOLUTELY NO WARRANTY, to the extent
permitted by applicable law.
*Then I open new terminal and try to ssh but it shows time out, why I=20
cannot ssh the address given. Due to this failure I was unable to control=
=20
one console terminal from the other and create two cells gic-demo and linux=
=20
demo. How can I create two cell so that I can run application in One and=20
Linux in another? please help me with this. I'm trying for nearly one month=
=20
but I was unable to do this.*

--=20
You received this message because you are subscribed to the Google Groups "=
Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/=
jailhouse-dev/b33c1868-f6be-4e7c-8b23-7d7bdf75f15e%40googlegroups.com.

------=_Part_4702_2043086626.1578516886329
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>All the requirement docker, qemu, kernel updated to l=
atest as mentioned in read.md and the results are:</div><div>sarojs@engee-e=
121-d08:/$ docker --version</div>Docker version 19.03.4, build 9013bf583a<b=
r>sarojs@engee-e121-d08:/$ qemu-system-x86_64 --version<br>QEMU emulator ve=
rsion 4.1.0<br>Copyright (c) 2003-2019 Fabrice Bellard and the QEMU Project=
 developers<br>sarojs@engee-e121-d08:/$ uname -r<br><div>4.4.0-167-generic<=
/div><div><b>after this I run build-images.sh and then finally start-qemu.s=
h</b></div><div><b>and the results is:</b></div><div><br></div>sarojs@engee=
-e121-d08:~/Downloads/jailhouse-images$ ./start-qemu.sh arm64<br>VNC server=
 running on 127.0.0.1:5900<br>[=C2=A0=C2=A0=C2=A0 0.000000] Booting Linux o=
n physical CPU 0x0000000000 [0x411fd070]<br>[=C2=A0=C2=A0=C2=A0 0.000000] L=
inux version 4.19.67 (builder@bc528e2a57f1) (gcc version 8.3.0 (Debian 8.3.=
0-2)) #1 SMP PREEMPT Tue Nov 5 18:52:36 UTC 2019<br>[=C2=A0=C2=A0=C2=A0 0.0=
00000] Machine model: linux,dummy-virt<br>[=C2=A0=C2=A0=C2=A0 0.000000] Mem=
ory limited to 768MB<br>[=C2=A0=C2=A0=C2=A0 0.000000] efi: Getting EFI para=
meters from FDT:<br>[=C2=A0=C2=A0=C2=A0 0.000000] efi: UEFI not found.<br>[=
=C2=A0=C2=A0=C2=A0 0.000000] cma: Reserved 16 MiB at 0x000000006f000000<br>=
[=C2=A0=C2=A0=C2=A0 0.000000] NUMA: No NUMA configuration found<br>[=C2=A0=
=C2=A0=C2=A0 0.000000] NUMA: Faking a node at [mem 0x0000000000000000-0x000=
000006fffffff]<br>[=C2=A0=C2=A0=C2=A0 0.000000] NUMA: NODE_DATA [mem 0x6efe=
8480-0x6efe9c3f]<br>[=C2=A0=C2=A0=C2=A0 0.000000] Zone ranges:<br>[=C2=A0=
=C2=A0=C2=A0 0.000000]=C2=A0=C2=A0 DMA32=C2=A0=C2=A0=C2=A0 [mem 0x000000004=
0000000-0x000000006fffffff]<br>[=C2=A0=C2=A0=C2=A0 0.000000]=C2=A0=C2=A0 No=
rmal=C2=A0=C2=A0 empty<br>[=C2=A0=C2=A0=C2=A0 0.000000] Movable zone start =
for each node<br>[=C2=A0=C2=A0=C2=A0 0.000000] Early memory node ranges<br>=
[=C2=A0=C2=A0=C2=A0 0.000000]=C2=A0=C2=A0 node=C2=A0=C2=A0 0: [mem 0x000000=
0040000000-0x000000006fffffff]<br>[=C2=A0=C2=A0=C2=A0 0.000000] Initmem set=
up node 0 [mem 0x0000000040000000-0x000000006fffffff]<br>[=C2=A0=C2=A0=C2=
=A0 0.000000] psci: probing for conduit method from DT.<br>[=C2=A0=C2=A0=C2=
=A0 0.000000] psci: PSCIv0.2 detected in firmware.<br>[=C2=A0=C2=A0=C2=A0 0=
.000000] psci: Using standard PSCI v0.2 function IDs<br>[=C2=A0=C2=A0=C2=A0=
 0.000000] psci: Trusted OS migration not required<br>[=C2=A0=C2=A0=C2=A0 0=
.000000] random: get_random_bytes called from start_kernel+0x94/0x400 with =
crng_init=3D0<br>[=C2=A0=C2=A0=C2=A0 0.000000] percpu: Embedded 22 pages/cp=
u s53016 r8192 d28904 u90112<br>[=C2=A0=C2=A0=C2=A0 0.000000] Detected PIPT=
 I-cache on CPU0<br>[=C2=A0=C2=A0=C2=A0 0.000000] CPU features: enabling wo=
rkaround for ARM erratum 832075<br>[=C2=A0=C2=A0=C2=A0 0.000000] CPU featur=
es: enabling workaround for EL2 vector hardening<br>[=C2=A0=C2=A0=C2=A0 0.0=
00000] CPU features: detected: Kernel page table isolation (KPTI)<br>[=C2=
=A0=C2=A0=C2=A0 0.000000] Built 1 zonelists, mobility grouping on.=C2=A0 To=
tal pages: 193536<br>[=C2=A0=C2=A0=C2=A0 0.000000] Policy zone: DMA32<br>[=
=C2=A0=C2=A0=C2=A0 0.000000] Kernel command line:=C2=A0 =C2=A0=C2=A0=C2=A0 =
=C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 root=3D/dev/vda mem=3D768M<br>[=C2=A0=
=C2=A0=C2=A0 0.000000] Memory: 729472K/786432K available (10044K kernel cod=
e, 1294K rwdata, 4312K rodata, 1152K init, 369K bss, 40576K reserved, 16384=
K cma-reserved)<br>[=C2=A0=C2=A0=C2=A0 0.000000] SLUB: HWalign=3D64, Order=
=3D0-3, MinObjects=3D0, CPUs=3D16, Nodes=3D1<br>[=C2=A0=C2=A0=C2=A0 0.00000=
0] rcu: Preemptible hierarchical RCU implementation.<br>[=C2=A0=C2=A0=C2=A0=
 0.000000] rcu: =C2=A0=C2=A0=C2=A0 RCU restricting CPUs from NR_CPUS=3D64 t=
o nr_cpu_ids=3D16.<br>[=C2=A0=C2=A0=C2=A0 0.000000] =C2=A0=C2=A0=C2=A0 Task=
s RCU enabled.<br>[=C2=A0=C2=A0=C2=A0 0.000000] rcu: Adjusting geometry for=
 rcu_fanout_leaf=3D16, nr_cpu_ids=3D16<br>[=C2=A0=C2=A0=C2=A0 0.000000] NR_=
IRQS: 64, nr_irqs: 64, preallocated irqs: 0<br>[=C2=A0=C2=A0=C2=A0 0.000000=
] GICv3: GIC: Using split EOI/Deactivate mode<br>[=C2=A0=C2=A0=C2=A0 0.0000=
00] GICv3: Distributor has no Range Selector support<br>[=C2=A0=C2=A0=C2=A0=
 0.000000] GICv3: no VLPI support, no direct LPI support<br>[=C2=A0=C2=A0=
=C2=A0 0.000000] GICv3: CPU0: found redistributor 0 region 0:0x00000000080a=
0000<br>[=C2=A0=C2=A0=C2=A0 0.000000] arch_timer: cp15 timer(s) running at =
62.50MHz (phys).<br>[=C2=A0=C2=A0=C2=A0 0.000000] clocksource: arch_sys_cou=
nter: mask: 0xffffffffffffff max_cycles: 0x1cd42e208c, max_idle_ns: 8815904=
05314 ns<br>[=C2=A0=C2=A0=C2=A0 0.000167] sched_clock: 56 bits at 62MHz, re=
solution 16ns, wraps every 4398046511096ns<br>[=C2=A0=C2=A0=C2=A0 0.009196]=
 Console: colour dummy device 80x25<br>[=C2=A0=C2=A0=C2=A0 0.011540] consol=
e [tty0] enabled<br>[=C2=A0=C2=A0=C2=A0 0.014855] Calibrating delay loop (s=
kipped), value calculated using timer frequency.. 125.00 BogoMIPS (lpj=3D25=
0000)<br>[=C2=A0=C2=A0=C2=A0 0.015058] pid_max: default: 32768 minimum: 301=
<br>[=C2=A0=C2=A0=C2=A0 0.016528] Security Framework initialized<br>[=C2=A0=
=C2=A0=C2=A0 0.018663] Dentry cache hash table entries: 131072 (order: 8, 1=
048576 bytes)<br>[=C2=A0=C2=A0=C2=A0 0.019461] Inode-cache hash table entri=
es: 65536 (order: 7, 524288 bytes)<br>[=C2=A0=C2=A0=C2=A0 0.019731] Mount-c=
ache hash table entries: 2048 (order: 2, 16384 bytes)<br>[=C2=A0=C2=A0=C2=
=A0 0.019824] Mountpoint-cache hash table entries: 2048 (order: 2, 16384 by=
tes)<br>[=C2=A0=C2=A0=C2=A0 0.082413] ASID allocator initialised with 32768=
 entries<br>[=C2=A0=C2=A0=C2=A0 0.090745] rcu: Hierarchical SRCU implementa=
tion.<br>[=C2=A0=C2=A0=C2=A0 0.121397] EFI services will not be available.<=
br>[=C2=A0=C2=A0=C2=A0 0.131213] smp: Bringing up secondary CPUs ...<br>[=
=C2=A0=C2=A0=C2=A0 0.163456] Detected PIPT I-cache on CPU1<br>[=C2=A0=C2=A0=
=C2=A0 0.165414] GICv3: CPU1: found redistributor 1 region 0:0x00000000080c=
0000<br>[=C2=A0=C2=A0=C2=A0 0.165996] CPU1: Booted secondary processor 0x00=
00000001 [0x411fd070]<br>[=C2=A0=C2=A0=C2=A0 0.209014] Detected PIPT I-cach=
e on CPU2<br>[=C2=A0=C2=A0=C2=A0 0.209110] GICv3: CPU2: found redistributor=
 2 region 0:0x00000000080e0000<br>[=C2=A0=C2=A0=C2=A0 0.209225] CPU2: Boote=
d secondary processor 0x0000000002 [0x411fd070]<br>[=C2=A0=C2=A0=C2=A0 0.24=
1807] Detected PIPT I-cache on CPU3<br>[=C2=A0=C2=A0=C2=A0 0.241941] GICv3:=
 CPU3: found redistributor 3 region 0:0x0000000008100000<br>[=C2=A0=C2=A0=
=C2=A0 0.242103] CPU3: Booted secondary processor 0x0000000003 [0x411fd070]=
<br>[=C2=A0=C2=A0=C2=A0 0.276834] Detected PIPT I-cache on CPU4<br>[=C2=A0=
=C2=A0=C2=A0 0.277172] GICv3: CPU4: found redistributor 4 region 0:0x000000=
0008120000<br>[=C2=A0=C2=A0=C2=A0 0.277537] CPU4: Booted secondary processo=
r 0x0000000004 [0x411fd070]<br>[=C2=A0=C2=A0=C2=A0 0.316327] Detected PIPT =
I-cache on CPU5<br>[=C2=A0=C2=A0=C2=A0 0.316709] GICv3: CPU5: found redistr=
ibutor 5 region 0:0x0000000008140000<br>[=C2=A0=C2=A0=C2=A0 0.317101] CPU5:=
 Booted secondary processor 0x0000000005 [0x411fd070]<br>[=C2=A0=C2=A0=C2=
=A0 0.356252] Detected PIPT I-cache on CPU6<br>[=C2=A0=C2=A0=C2=A0 0.356626=
] GICv3: CPU6: found redistributor 6 region 0:0x0000000008160000<br>[=C2=A0=
=C2=A0=C2=A0 0.357149] CPU6: Booted secondary processor 0x0000000006 [0x411=
fd070]<br>[=C2=A0=C2=A0=C2=A0 0.394943] Detected PIPT I-cache on CPU7<br>[=
=C2=A0=C2=A0=C2=A0 0.395074] GICv3: CPU7: found redistributor 7 region 0:0x=
0000000008180000<br>[=C2=A0=C2=A0=C2=A0 0.395224] CPU7: Booted secondary pr=
ocessor 0x0000000007 [0x411fd070]<br>[=C2=A0=C2=A0=C2=A0 0.427866] Detected=
 PIPT I-cache on CPU8<br>[=C2=A0=C2=A0=C2=A0 0.428003] GICv3: CPU8: found r=
edistributor 8 region 0:0x00000000081a0000<br>[=C2=A0=C2=A0=C2=A0 0.428163]=
 CPU8: Booted secondary processor 0x0000000008 [0x411fd070]<br>[=C2=A0=C2=
=A0=C2=A0 0.483476] Detected PIPT I-cache on CPU9<br>[=C2=A0=C2=A0=C2=A0 0.=
483774] GICv3: CPU9: found redistributor 9 region 0:0x00000000081c0000<br>[=
=C2=A0=C2=A0=C2=A0 0.484125] CPU9: Booted secondary processor 0x0000000009 =
[0x411fd070]<br>[=C2=A0=C2=A0=C2=A0 0.517943] Detected PIPT I-cache on CPU1=
0<br>[=C2=A0=C2=A0=C2=A0 0.518510] GICv3: CPU10: found redistributor a regi=
on 0:0x00000000081e0000<br>[=C2=A0=C2=A0=C2=A0 0.519101] CPU10: Booted seco=
ndary processor 0x000000000a [0x411fd070]<br>[=C2=A0=C2=A0=C2=A0 0.556796] =
Detected PIPT I-cache on CPU11<br>[=C2=A0=C2=A0=C2=A0 0.557390] GICv3: CPU1=
1: found redistributor b region 0:0x0000000008200000<br>[=C2=A0=C2=A0=C2=A0=
 0.557984] CPU11: Booted secondary processor 0x000000000b [0x411fd070]<br>[=
=C2=A0=C2=A0=C2=A0 0.594707] Detected PIPT I-cache on CPU12<br>[=C2=A0=C2=
=A0=C2=A0 0.595031] GICv3: CPU12: found redistributor c region 0:0x00000000=
08220000<br>[=C2=A0=C2=A0=C2=A0 0.595533] CPU12: Booted secondary processor=
 0x000000000c [0x411fd070]<br>[=C2=A0=C2=A0=C2=A0 0.628692] Detected PIPT I=
-cache on CPU13<br>[=C2=A0=C2=A0=C2=A0 0.629111] GICv3: CPU13: found redist=
ributor d region 0:0x0000000008240000<br>[=C2=A0=C2=A0=C2=A0 0.629460] CPU1=
3: Booted secondary processor 0x000000000d [0x411fd070]<br>[=C2=A0=C2=A0=C2=
=A0 0.662432] Detected PIPT I-cache on CPU14<br>[=C2=A0=C2=A0=C2=A0 0.66281=
5] GICv3: CPU14: found redistributor e region 0:0x0000000008260000<br>[=C2=
=A0=C2=A0=C2=A0 0.663338] CPU14: Booted secondary processor 0x000000000e [0=
x411fd070]<br>[=C2=A0=C2=A0=C2=A0 0.701173] Detected PIPT I-cache on CPU15<=
br>[=C2=A0=C2=A0=C2=A0 0.701480] GICv3: CPU15: found redistributor f region=
 0:0x0000000008280000<br>[=C2=A0=C2=A0=C2=A0 0.701830] CPU15: Booted second=
ary processor 0x000000000f [0x411fd070]<br>[=C2=A0=C2=A0=C2=A0 0.703285] sm=
p: Brought up 1 node, 16 CPUs<br>[=C2=A0=C2=A0=C2=A0 0.709495] SMP: Total o=
f 16 processors activated.<br>[=C2=A0=C2=A0=C2=A0 0.709877] CPU features: d=
etected: GIC system register CPU interface<br>[=C2=A0=C2=A0=C2=A0 0.710137]=
 CPU features: detected: 32-bit EL0 Support<br>[=C2=A0=C2=A0=C2=A0 0.932452=
] CPU: All CPU(s) started at EL2<br>[=C2=A0=C2=A0=C2=A0 0.965064] alternati=
ves: patching kernel code<br>[=C2=A0=C2=A0=C2=A0 1.021311] devtmpfs: initia=
lized<br>[=C2=A0=C2=A0=C2=A0 1.038681] clocksource: jiffies: mask: 0xffffff=
ff max_cycles: 0xffffffff, max_idle_ns: 7645041785100000 ns<br>[=C2=A0=C2=
=A0=C2=A0 1.039229] futex hash table entries: 4096 (order: 6, 262144 bytes)=
<br>[=C2=A0=C2=A0=C2=A0 1.044588] pinctrl core: initialized pinctrl subsyst=
em<br>[=C2=A0=C2=A0=C2=A0 1.062703] DMI not present or invalid.<br>[=C2=A0=
=C2=A0=C2=A0 1.069419] NET: Registered protocol family 16<br>[=C2=A0=C2=A0=
=C2=A0 1.074197] audit: initializing netlink subsys (disabled)<br>[=C2=A0=
=C2=A0=C2=A0 1.076449] audit: type=3D2000 audit(0.776:1): state=3Dinitializ=
ed audit_enabled=3D0 res=3D1<br>[=C2=A0=C2=A0=C2=A0 1.084715] cpuidle: usin=
g governor menu<br>[=C2=A0=C2=A0=C2=A0 1.086698] vdso: 2 pages (1 code @ (_=
___ptrval____), 1 data @ (____ptrval____))<br>[=C2=A0=C2=A0=C2=A0 1.086870]=
 hw-breakpoint: found 6 breakpoint and 4 watchpoint registers.<br>[=C2=A0=
=C2=A0=C2=A0 1.100600] DMA: preallocated 256 KiB pool for atomic allocation=
s<br>[=C2=A0=C2=A0=C2=A0 1.105252] Serial: AMBA PL011 UART driver<br>[=C2=
=A0=C2=A0=C2=A0 1.142651] 9000000.pl011: ttyAMA0 at MMIO 0x9000000 (irq =3D=
 40, base_baud =3D 0) is a PL011 rev1<br>[=C2=A0=C2=A0=C2=A0 1.165136] cons=
ole [ttyAMA0] enabled<br>[=C2=A0=C2=A0=C2=A0 1.370391] HugeTLB registered 2=
.00 MiB page size, pre-allocated 0 pages<br>[=C2=A0=C2=A0=C2=A0 1.375592] c=
ryptd: max_cpu_qlen set to 1000<br>[=C2=A0=C2=A0=C2=A0 1.381172] ACPI: Inte=
rpreter disabled.<br>[=C2=A0=C2=A0=C2=A0 1.386213] vgaarb: loaded<br>[=C2=
=A0=C2=A0=C2=A0 1.388929] SCSI subsystem initialized<br>[=C2=A0=C2=A0=C2=A0=
 1.394115] usbcore: registered new interface driver usbfs<br>[=C2=A0=C2=A0=
=C2=A0 1.394984] usbcore: registered new interface driver hub<br>[=C2=A0=C2=
=A0=C2=A0 1.396038] usbcore: registered new device driver usb<br>[=C2=A0=C2=
=A0=C2=A0 1.404071] pps_core: LinuxPPS API ver. 1 registered<br>[=C2=A0=C2=
=A0=C2=A0 1.404564] pps_core: Software ver. 5.3.6 - Copyright 2005-2007 Rod=
olfo Giometti &lt;giometti@linux.it&gt;<br>[=C2=A0=C2=A0=C2=A0 1.405492] PT=
P clock support registered<br>[=C2=A0=C2=A0=C2=A0 1.407076] EDAC MC: Ver: 3=
.0.0<br>[=C2=A0=C2=A0=C2=A0 1.492705] clocksource: Switched to clocksource =
arch_sys_counter<br>[=C2=A0=C2=A0=C2=A0 1.509419] VFS: Disk quotas dquot_6.=
6.0<br>[=C2=A0=C2=A0=C2=A0 1.509874] VFS: Dquot-cache hash table entries: 5=
12 (order 0, 4096 bytes)<br>[=C2=A0=C2=A0=C2=A0 1.512450] pnp: PnP ACPI: di=
sabled<br>[=C2=A0=C2=A0=C2=A0 1.568294] NET: Registered protocol family 2<b=
r>[=C2=A0=C2=A0=C2=A0 1.584108] tcp_listen_portaddr_hash hash table entries=
: 512 (order: 1, 8192 bytes)<br>[=C2=A0=C2=A0=C2=A0 1.584780] TCP establish=
ed hash table entries: 8192 (order: 4, 65536 bytes)<br>[=C2=A0=C2=A0=C2=A0 =
1.585583] TCP bind hash table entries: 8192 (order: 5, 131072 bytes)<br>[=
=C2=A0=C2=A0=C2=A0 1.586009] TCP: Hash tables configured (established 8192 =
bind 8192)<br>[=C2=A0=C2=A0=C2=A0 1.588606] UDP hash table entries: 512 (or=
der: 2, 16384 bytes)<br>[=C2=A0=C2=A0=C2=A0 1.589179] UDP-Lite hash table e=
ntries: 512 (order: 2, 16384 bytes)<br>[=C2=A0=C2=A0=C2=A0 1.592560] NET: R=
egistered protocol family 1<br>[=C2=A0=C2=A0=C2=A0 1.598547] RPC: Registere=
d named UNIX socket transport module.<br>[=C2=A0=C2=A0=C2=A0 1.598784] RPC:=
 Registered udp transport module.<br>[=C2=A0=C2=A0=C2=A0 1.598954] RPC: Reg=
istered tcp transport module.<br>[=C2=A0=C2=A0=C2=A0 1.599110] RPC: Registe=
red tcp NFSv4.1 backchannel transport module.<br>[=C2=A0=C2=A0=C2=A0 1.6028=
69] Unpacking initramfs...<br>[=C2=A0=C2=A0=C2=A0 1.847907] Freeing initrd =
memory: 4292K<br>[=C2=A0=C2=A0=C2=A0 1.857706] hw perfevents: enabled with =
armv8_pmuv3 PMU driver, 5 counters available<br>[=C2=A0=C2=A0=C2=A0 1.87973=
4] Initialise system trusted keyrings<br>[=C2=A0=C2=A0=C2=A0 1.883324] work=
ingset: timestamp_bits=3D44 max_order=3D18 bucket_order=3D0<br>[=C2=A0=C2=
=A0=C2=A0 1.912683] squashfs: version 4.0 (2009/01/31) Phillip Lougher<br>[=
=C2=A0=C2=A0=C2=A0 1.918361] NFS: Registering the id_resolver key type<br>[=
=C2=A0=C2=A0=C2=A0 1.918781] Key type id_resolver registered<br>[=C2=A0=C2=
=A0=C2=A0 1.919012] Key type id_legacy registered<br>[=C2=A0=C2=A0=C2=A0 1.=
919442] nfs4filelayout_init: NFSv4 File Layout Driver Registering...<br>[=
=C2=A0=C2=A0=C2=A0 1.921845] 9p: Installing v9fs 9p2000 file system support=
<br>[=C2=A0=C2=A0=C2=A0 1.942598] Key type asymmetric registered<br>[=C2=A0=
=C2=A0=C2=A0 1.942860] Asymmetric key parser &#39;x509&#39; registered<br>[=
=C2=A0=C2=A0=C2=A0 1.943281] Block layer SCSI generic (bsg) driver version =
0.4 loaded (major 246)<br>[=C2=A0=C2=A0=C2=A0 1.944068] io scheduler noop r=
egistered<br>[=C2=A0=C2=A0=C2=A0 1.944699] io scheduler cfq registered (def=
ault)<br>[=C2=A0=C2=A0=C2=A0 1.945362] io scheduler mq-deadline registered<=
br>[=C2=A0=C2=A0=C2=A0 1.945581] io scheduler kyber registered<br>[=C2=A0=
=C2=A0=C2=A0 1.975723] pl061_gpio 9030000.pl061: PL061 GPIO chip @0x0000000=
009030000 registered<br>[=C2=A0=C2=A0=C2=A0 1.985874] pci-host-generic 4010=
000000.pcie: host bridge /pcie@10000000 ranges:<br>[=C2=A0=C2=A0=C2=A0 1.98=
6737] pci-host-generic 4010000000.pcie:=C2=A0=C2=A0=C2=A0 IO 0x3eff0000..0x=
3effffff -&gt; 0x00000000<br>[=C2=A0=C2=A0=C2=A0 1.987598] pci-host-generic=
 4010000000.pcie:=C2=A0=C2=A0 MEM 0x10000000..0x3efeffff -&gt; 0x10000000<b=
r>[=C2=A0=C2=A0=C2=A0 1.987882] pci-host-generic 4010000000.pcie:=C2=A0=C2=
=A0 MEM 0x8000000000..0xffffffffff -&gt; 0x8000000000<br>[=C2=A0=C2=A0=C2=
=A0 1.989836] pci-host-generic 4010000000.pcie: ECAM at [mem 0x4010000000-0=
x401fffffff] for [bus 00-ff]<br>[=C2=A0=C2=A0=C2=A0 1.992336] pci-host-gene=
ric 4010000000.pcie: PCI host bridge to bus 0000:00<br>[=C2=A0=C2=A0=C2=A0 =
1.993286] pci_bus 0000:00: root bus resource [bus 00-ff]<br>[=C2=A0=C2=A0=
=C2=A0 1.993814] pci_bus 0000:00: root bus resource [io=C2=A0 0x0000-0xffff=
]<br>[=C2=A0=C2=A0=C2=A0 1.994028] pci_bus 0000:00: root bus resource [mem =
0x10000000-0x3efeffff]<br>[=C2=A0=C2=A0=C2=A0 1.994300] pci_bus 0000:00: ro=
ot bus resource [mem 0x8000000000-0xffffffffff]<br>[=C2=A0=C2=A0=C2=A0 2.08=
8592] Serial: 8250/16550 driver, 4 ports, IRQ sharing enabled<br>[=C2=A0=C2=
=A0=C2=A0 2.095955] SuperH (H)SCI(F) driver initialized<br>[=C2=A0=C2=A0=C2=
=A0 2.097903] msm_serial: driver initialized<br>[=C2=A0=C2=A0=C2=A0 2.11823=
6] cacheinfo: Unable to detect cache hierarchy for CPU 0<br>[=C2=A0=C2=A0=
=C2=A0 2.168640] loop: module loaded<br>[=C2=A0=C2=A0=C2=A0 2.193407] virti=
o_blk virtio1: [vda] 2694416 512-byte logical blocks (1.38 GB/1.28 GiB)<br>=
[=C2=A0=C2=A0=C2=A0 2.240577] libphy: Fixed MDIO Bus: probed<br>[=C2=A0=C2=
=A0=C2=A0 2.244779] tun: Universal TUN/TAP device driver, 1.6<br>[=C2=A0=C2=
=A0=C2=A0 2.263829] e1000e: Intel(R) PRO/1000 Network Driver - 3.2.6-k<br>[=
=C2=A0=C2=A0=C2=A0 2.264102] e1000e: Copyright(c) 1999 - 2015 Intel Corpora=
tion.<br>[=C2=A0=C2=A0=C2=A0 2.264632] igb: Intel(R) Gigabit Ethernet Netwo=
rk Driver - version 5.4.0-k<br>[=C2=A0=C2=A0=C2=A0 2.265235] igb: Copyright=
 (c) 2007-2014 Intel Corporation.<br>[=C2=A0=C2=A0=C2=A0 2.265878] igbvf: I=
ntel(R) Gigabit Virtual Function Network Driver - version 2.4.0-k<br>[=C2=
=A0=C2=A0=C2=A0 2.266286] igbvf: Copyright (c) 2009 - 2012 Intel Corporatio=
n.<br>[=C2=A0=C2=A0=C2=A0 2.268481] sky2: driver version 1.30<br>[=C2=A0=C2=
=A0=C2=A0 2.271790] VFIO - User Level meta-driver version: 0.3<br>[=C2=A0=
=C2=A0=C2=A0 2.279480] ehci_hcd: USB 2.0 &#39;Enhanced&#39; Host Controller=
 (EHCI) Driver<br>[=C2=A0=C2=A0=C2=A0 2.279971] ehci-pci: EHCI PCI platform=
 driver<br>[=C2=A0=C2=A0=C2=A0 2.280718] ehci-platform: EHCI generic platfo=
rm driver<br>[=C2=A0=C2=A0=C2=A0 2.281717] ehci-orion: EHCI orion driver<br=
>[=C2=A0=C2=A0=C2=A0 2.282216] ehci-exynos: EHCI EXYNOS driver<br>[=C2=A0=
=C2=A0=C2=A0 2.282661] ohci_hcd: USB 1.1 &#39;Open&#39; Host Controller (OH=
CI) Driver<br>[=C2=A0=C2=A0=C2=A0 2.283018] ohci-pci: OHCI PCI platform dri=
ver<br>[=C2=A0=C2=A0=C2=A0 2.283770] ohci-platform: OHCI generic platform d=
river<br>[=C2=A0=C2=A0=C2=A0 2.284438] ohci-exynos: OHCI EXYNOS driver<br>[=
=C2=A0=C2=A0=C2=A0 2.291438] usbcore: registered new interface driver usb-s=
torage<br>[=C2=A0=C2=A0=C2=A0 2.306327] rtc-pl031 9010000.pl031: rtc core: =
registered pl031 as rtc0<br>[=C2=A0=C2=A0=C2=A0 2.309554] i2c /dev entries =
driver<br>[=C2=A0=C2=A0=C2=A0 2.323629] sdhci: Secure Digital Host Controll=
er Interface driver<br>[=C2=A0=C2=A0=C2=A0 2.324065] sdhci: Copyright(c) Pi=
erre Ossman<br>[=C2=A0=C2=A0=C2=A0 2.326027] Synopsys Designware Multimedia=
 Card Interface Driver<br>[=C2=A0=C2=A0=C2=A0 2.331478] sdhci-pltfm: SDHCI =
platform and OF driver helper<br>[=C2=A0=C2=A0=C2=A0 2.338411] ledtrig-cpu:=
 registered to indicate activity on CPUs<br>[=C2=A0=C2=A0=C2=A0 2.344584] u=
sbcore: registered new interface driver usbhid<br>[=C2=A0=C2=A0=C2=A0 2.345=
111] usbhid: USB HID core driver<br>[=C2=A0=C2=A0=C2=A0 2.361241] NET: Regi=
stered protocol family 10<br>[=C2=A0=C2=A0=C2=A0 2.386925] Segment Routing =
with IPv6<br>[=C2=A0=C2=A0=C2=A0 2.387956] NET: Registered protocol family =
17<br>[=C2=A0=C2=A0=C2=A0 2.390680] 9pnet: Installing 9P2000 support<br>[=
=C2=A0=C2=A0=C2=A0 2.391618] Key type dns_resolver registered<br>[=C2=A0=C2=
=A0=C2=A0 2.394251] registered taskstats version 1<br>[=C2=A0=C2=A0=C2=A0 2=
.394446] Loading compiled-in X.509 certificates<br>[=C2=A0=C2=A0=C2=A0 2.40=
8606] input: gpio-keys as /devices/platform/gpio-keys/input/input0<br>[=C2=
=A0=C2=A0=C2=A0 2.413248] rtc-pl031 9010000.pl031: setting system clock to =
2020-01-08 20:39:44 UTC (1578515984)<br>[=C2=A0=C2=A0=C2=A0 2.424182] uart-=
pl011 9000000.pl011: no DMA platform data<br>[=C2=A0=C2=A0=C2=A0 2.668052] =
Freeing unused kernel memory: 1152K<br>[=C2=A0=C2=A0=C2=A0 2.676760] Run /i=
nit as init process<br>Loading, please wait...<br>Starting version 241<br>B=
egin: Loading essential drivers ... done.<br>Begin: Running /scripts/init-p=
remount ... done.<br>Begin: Mounting root file system ... Begin: Running /s=
cripts/local-top ... done.<br>Begin: Running /scripts/local-premount ... do=
ne.<br>Warning: fsck not present, so skipping root file system<br>[=C2=A0=
=C2=A0=C2=A0 6.458709] EXT4-fs (vda): INFO: recovery required on readonly f=
ilesystem<br>[=C2=A0=C2=A0=C2=A0 6.459146] EXT4-fs (vda): write access will=
 be enabled during recovery<br>[=C2=A0=C2=A0=C2=A0 6.562511] EXT4-fs (vda):=
 recovery complete<br>[=C2=A0=C2=A0=C2=A0 6.586139] EXT4-fs (vda): mounted =
filesystem with ordered data mode. Opts: (null)<br>done.<br>Begin: Running =
/scripts/local-bottom ... done.<br>Begin: Running /scripts/init-bottom ... =
done.<br>[=C2=A0=C2=A0=C2=A0 6.984092] random: fast init done<br>[=C2=A0=C2=
=A0=C2=A0 7.625962] systemd[1]: systemd 241 running in system mode. (+PAM +=
AUDIT +SELINUX +IMA +APPARMOR +SMACK +SYSVINIT +UTMP +LIBCRYPTSETUP +GCRYPT=
 +GNUTLS +ACL +XZ +LZ4 +SECCOMP +BLKID +ELFUTILS +KMOD -IDN2 +IDN -PCRE2 de=
fault-hierarchy=3Dhybrid)<br>[=C2=A0=C2=A0=C2=A0 7.630537] systemd[1]: Dete=
cted virtualization qemu.<br>[=C2=A0=C2=A0=C2=A0 7.631210] systemd[1]: Dete=
cted architecture arm64.<br><br>Welcome to Debian GNU/Linux 10 (buster)!<br=
><br>[=C2=A0=C2=A0=C2=A0 7.699983] systemd[1]: Set hostname to &lt;demo&gt;=
.<br>[=C2=A0=C2=A0=C2=A0 7.751547] systemd[1]: Failed to bump fs.file-max, =
ignoring: Invalid argument<br>[=C2=A0=C2=A0=C2=A0 9.000192] systemd[1]: Fil=
e /lib/systemd/system/systemd-journald.service:12 configures an IP firewall=
 (IPAddressDeny=3Dany), but the local system does not support BPF/cgroup ba=
sed firewalling.<br>[=C2=A0=C2=A0=C2=A0 9.001046] systemd[1]: Proceeding WI=
THOUT firewalling in effect! (This warning is only shown for the first load=
ed unit using IP firewalling.)<br>[=C2=A0=C2=A0=C2=A0 9.705779] random: sys=
temd: uninitialized urandom read (16 bytes read)<br>[=C2=A0=C2=A0=C2=A0 9.7=
49841] random: systemd: uninitialized urandom read (16 bytes read)<br>[=C2=
=A0=C2=A0=C2=A0 9.762078] systemd[1]: Listening on Journal Socket.<br>[=C2=
=A0 OK=C2=A0 ] Listening on Journal Socket.<br>[=C2=A0=C2=A0=C2=A0 9.767359=
] random: systemd: uninitialized urandom read (16 bytes read)<br>[=C2=A0=C2=
=A0=C2=A0 9.770462] systemd[1]: Listening on initctl Compatibility Named Pi=
pe.<br>[=C2=A0 OK=C2=A0 ] Listening on initctl Compatibility Named Pipe.<br=
>[=C2=A0=C2=A0=C2=A0 9.834070] systemd[1]: Starting Remount Root and Kernel=
 File Systems...<br>=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 Starti=
ng Remount Root and Kernel File Systems...<br>[=C2=A0 OK=C2=A0 ] Started Fo=
rward Password R=E2=80=A6uests to Wall Directory Watch.<br>=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 Mounting Huge Pages File System...<br>[=
=C2=A0 OK=C2=A0 ] Created slice system-serial\x2dgetty.slice.<br>[=C2=A0 OK=
=C2=A0 ] Started Dispatch Password =E2=80=A6ts to Console Directory Watch.<=
br>[=C2=A0 OK=C2=A0 ] Reached target Local Encrypted Volumes.<br>=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 Starting Load Kernel Modules...<br>=
[=C2=A0 OK=C2=A0 ] Created slice system-getty.slice.<br>[=C2=A0 OK=C2=A0 ] =
Reached target Paths.<br>[=C2=A0 OK=C2=A0 ] Listening on udev Kernel Socket=
.<br>[=C2=A0 OK=C2=A0 ] Reached target Remote File Systems.<br>[=C2=A0 OK=
=C2=A0 ] Listening on Journal Audit Socket.<br>[=C2=A0 OK=C2=A0 ] Reached t=
arget Swap.<br>[=C2=A0 OK=C2=A0 ] Created slice User and Session Slice.<br>=
[=C2=A0 OK=C2=A0 ] Reached target Slices.<br>=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0 Mounting Kernel Debug File System...<br>[=C2=A0 OK=C2=A0=
 ] Listening on Journal Socket (/dev/log).<br>=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0 Starting Journal Service...<br>[=C2=A0 OK=C2=A0 ] Lis=
tening on udev Control Socket.<br>=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 Starting udev Coldplug all Devices...<br>[=C2=A0=C2=A0 10.496248]=
 EXT4-fs (vda): re-mounted. Opts: (null)<br>=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0 Mounting POSIX Message Queue File System...<br>[=C2=A0=
=C2=A0 10.671466] jailhouse: loading out-of-tree module taints kernel.<br>[=
=C2=A0 OK=C2=A0 ] Mounted Huge Pages File System.<br>[=C2=A0 OK=C2=A0 ] Sta=
rted Remount Root and Kernel File Systems.<br>[=C2=A0 OK=C2=A0 ] Started Lo=
ad Kernel Modules.<br>[=C2=A0 OK=C2=A0 ] Mounted Kernel Debug File System.<=
br>[=C2=A0 OK=C2=A0 ] Mounted POSIX Message Queue File System.<br>=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 Mounting Kernel Configuration File =
System...<br>=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 Starting Appl=
y Kernel Variables...<br>=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 S=
tarting Load/Save Random Seed...<br>=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 Starting Create System Users...<br>[=C2=A0 OK=C2=A0 ] Mounted Ker=
nel Configuration File System.<br>[=C2=A0 OK=C2=A0 ] Started Apply Kernel V=
ariables.<br>[=C2=A0 OK=C2=A0 ] Started Load/Save Random Seed.<br>[=C2=A0 O=
K=C2=A0 ] Started Create System Users.<br>[=C2=A0 OK=C2=A0 ] Started Journa=
l Service.<br>=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 Starting Flu=
sh Journal to Persistent Storage...<br>=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 Starting Create Static Device Nodes in /dev...<br>[=C2=A0 OK=
=C2=A0 ] Started Flush Journal to Persistent Storage.<br>[=C2=A0 OK=C2=A0 ]=
 Started Create Static Device Nodes in /dev.<br>=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0 Starting udev Kernel Device Manager...<br>[=C2=A0 OK=
=C2=A0 ] Reached target Local File Systems (Pre).<br>[=C2=A0 OK=C2=A0 ] Rea=
ched target Local File Systems.<br>=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 Starting Create Volatile Files and Directories...<br>[=C2=A0 OK=
=C2=A0 ] Started udev Kernel Device Manager.<br>[=C2=A0 OK=C2=A0 ] Started =
Create Volatile Files and Directories.<br>=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 Starting Network Time Synchronization...<br>=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 Starting Update UTMP about System Boot/Sh=
utdown...<br>[=C2=A0 OK=C2=A0 ] Started Update UTMP about System Boot/Shutd=
own.<br>[=C2=A0 OK=C2=A0 ] Started Network Time Synchronization.<br>[=C2=A0=
 OK=C2=A0 ] Reached target System Time Synchronized.<br>[=C2=A0 OK=C2=A0 ] =
Found device /dev/ttyAMA0.<br>[=C2=A0 OK=C2=A0 ] Started udev Coldplug all =
Devices.<br>[=C2=A0 OK=C2=A0 ] Found device /dev/hvc0.<br>[=C2=A0 OK=C2=A0 =
] Started ifup for eth0.<br>[=C2=A0 OK=C2=A0 ] Reached target System Initia=
lization.<br>[=C2=A0 OK=C2=A0 ] Listening on D-Bus System Message Bus Socke=
t.<br>[=C2=A0 OK=C2=A0 ] Reached target Sockets.<br>[=C2=A0 OK=C2=A0 ] Star=
ted Daily man-db regeneration.<br>[=C2=A0 OK=C2=A0 ] Started Daily apt down=
load activities.<br>[=C2=A0 OK=C2=A0 ] Started Daily Cleanup of Temporary D=
irectories.<br>[=C2=A0 OK=C2=A0 ] Reached target Basic System.<br>=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 Starting Login Service...<br>[=C2=
=A0 OK=C2=A0 ] Started D-Bus System Message Bus.<br>=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0 Starting WPA supplicant...<br>[=C2=A0 OK=C2=A0 =
] Started Daily apt upgrade and clean activities.<br>[=C2=A0 OK=C2=A0 ] Rea=
ched target Timers.<br>=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 Sta=
rting Helper to synchronize boot up for ifupdown...<br>=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 Starting Daily man-db regeneration...<br>[=
=C2=A0 OK=C2=A0 ] Started Helper to synchronize boot up for ifupdown.<br>[=
=C2=A0 OK=C2=A0 ] Started Login Service.<br>[=C2=A0 OK=C2=A0 ] Started WPA =
supplicant.<br>=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 Starting Ra=
ise network interfaces...<br>[=C2=A0 OK=C2=A0 ] Started Raise network inter=
faces.<br>[=C2=A0 OK=C2=A0 ] Reached target Network.<br>=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 Starting Daily apt download activities...<br=
>=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 Starting OpenBSD Secure S=
hell server...<br>=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 Starting=
 Permit User Sessions...<br>[=C2=A0 OK=C2=A0 ] Started Permit User Sessions=
.<br>[=C2=A0 OK=C2=A0 ] Started Serial Getty on ttyAMA0.<br>[=C2=A0 OK=C2=
=A0 ] Started Serial Getty on hvc0.<br>[=C2=A0 OK=C2=A0 ] Started Getty on =
tty1.<br>[=C2=A0 OK=C2=A0 ] Reached target Login Prompts.<br>[=C2=A0 OK=C2=
=A0 ] Started Daily man-db regeneration.<br><br>Jailhouse Demo Image (login=
: root/root)<br>demo login: sarojs@engee-e121-d08:/$ docker --version<br>Pa=
ssword: <br>Login timed out after 60 seconds.<br><br>Jailhouse Demo Image (=
login: root/root)<br>demo login: <br><div><b>After I login i get the follow=
ing:</b></div><div>Linux demo 4.19.67 #1 SMP PREEMPT Tue Nov 5 18:52:36 UTC=
 2019 aarch64<br><br>For trying out Jailhouse, the following commands have =
been placed into the<br>shell history:<br>=C2=A0# jailhouse enable /etc/jai=
lhouse/qemu-arm64.cell<br>=C2=A0# jailhouse console<br>=C2=A0# jailhouse ce=
ll create /etc/jailhouse/qemu-arm64-gic-demo.cell<br>=C2=A0# jailhouse cell=
 load gic-demo /usr/libexec/jailhouse/demos/gic-demo.bin<br>=C2=A0# jailhou=
se cell start gic-demo<br>=C2=A0# jailhouse cell stats gic-demo<br>=C2=A0# =
jailhouse cell destroy gic-demo<br>=C2=A0# jailhouse cell linux /etc/jailho=
use/qemu-arm64-linux-demo.cell \<br>=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0 /boot/vmlinuz* \<br>=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 -d /etc/jailhouse/dts/inmate-qemu-arm64.d=
tb \<br>=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 -i=
 /usr/libexec/jailhouse/demos/rootfs.cpio \<br>=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 -c &quot;console=3DttyAMA0 ip=3D192.16=
8.19.2&quot;<br>=C2=A0# ssh 192.168.19.2<br>=C2=A0# jailhouse disable<br><b=
r>The programs included with the Debian GNU/Linux system are free software;=
<br>the exact distribution terms for each program are described in the<br>i=
ndividual files in /usr/share/doc/*/copyright.<br><br>Debian GNU/Linux come=
s with ABSOLUTELY NO WARRANTY, to the extent<br>permitted by applicable law=
.<br><b>Then I open new terminal and try to ssh but it shows time out, why =
I cannot ssh the address given. Due to this failure I was unable to control=
 one console terminal from the other and create two cells gic-demo and linu=
x demo. How can I create two cell so that I can run application in One and =
Linux in another? please help me with this. I&#39;m trying for nearly one m=
onth but I was unable to do this.</b><br></div></div>

<p></p>

-- <br />
You received this message because you are subscribed to the Google Groups &=
quot;Jailhouse&quot; group.<br />
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to <a href=3D"mailto:jailhouse-dev+unsubscribe@googlegroups.com">jailh=
ouse-dev+unsubscribe@googlegroups.com</a>.<br />
To view this discussion on the web visit <a href=3D"https://groups.google.c=
om/d/msgid/jailhouse-dev/b33c1868-f6be-4e7c-8b23-7d7bdf75f15e%40googlegroup=
s.com?utm_medium=3Demail&utm_source=3Dfooter">https://groups.google.com/d/m=
sgid/jailhouse-dev/b33c1868-f6be-4e7c-8b23-7d7bdf75f15e%40googlegroups.com<=
/a>.<br />

------=_Part_4702_2043086626.1578516886329--

------=_Part_4701_1909101181.1578516886328--
