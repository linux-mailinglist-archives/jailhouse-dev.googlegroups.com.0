Return-Path: <jailhouse-dev+bncBDVP3IWNW4CBBWFEY34QKGQE4TDPO3Q@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-qt1-x83a.google.com (mail-qt1-x83a.google.com [IPv6:2607:f8b0:4864:20::83a])
	by mail.lfdr.de (Postfix) with ESMTPS id 18B26240CFF
	for <lists+jailhouse-dev@lfdr.de>; Mon, 10 Aug 2020 20:30:51 +0200 (CEST)
Received: by mail-qt1-x83a.google.com with SMTP id z20sf8020825qti.21
        for <lists+jailhouse-dev@lfdr.de>; Mon, 10 Aug 2020 11:30:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:date:from:to:message-id:in-reply-to:references:subject
         :mime-version:x-original-sender:precedence:mailing-list:list-id
         :list-post:list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=PeC9Ev1QY8xj8U0y03hqjSm9XiI7O/Fgb9JYxRUabxI=;
        b=aPRdqUucrCJ/QtLbY2/rF4fguokuUyQohF/oVFoSGnLZ2VqjEgtPwg3mUxP6/17Ar4
         dQuZSn9i6PZxu1Gwm8yGSATYvpvkq9ShyCWFCP1QTVdnddF2M9slDvEoafnV0D+4w5Sz
         hiOi5z5hbK2RW0hRoeiupe+eE3gr7Xao80yqY2JG5d3JtpFdweYNa15Kf+2jYmPDlmis
         ZrE5rG7Y9GdiZzsa7YoawlOeRTY879rS7zo7I1Ug6rba5eRGjhvp4+dQodvhsfuwxBmO
         JLl5LMJGox/s471BJh4v29aOeSp7Vn9qZtopP08gtZyVe09k37DSFvCHgVzmW9eI5T1K
         lhbA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:message-id:in-reply-to:references:subject:mime-version
         :x-original-sender:precedence:mailing-list:list-id:list-post
         :list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=PeC9Ev1QY8xj8U0y03hqjSm9XiI7O/Fgb9JYxRUabxI=;
        b=Woe6lCvi4KhhjN6QCVICIxFjMu6f99GZ6G8RTWa0dH2N2BR6wGCtbFEYfB/PqMUfpj
         5sTi3nIthNcfwLwPOUX5W0C0rJADaXWcZlGKZAYmGFpNQSkfGUqp96eKBVk2rYe022qh
         DRoyvTtIGCvfkcdSimQRaokv0iub2WnKpjnupM+Ju5hlLNsBO/jYvzvEesR2CgPgsmVx
         rLFBVglfyZ08SK8zBUej5XUIrsL/Okb57zZa+Y9pbEZhLvtigzSOU7OlkJEFQ1qTmfRB
         85ux720dByISJLqCGqm6mKscqLfCZi5yU6lcTToeqqnlEyhSkqEIbqeWihGoeXIV8H23
         3tZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:date:from:to:message-id:in-reply-to
         :references:subject:mime-version:x-original-sender:precedence
         :mailing-list:list-id:x-spam-checked-in-group:list-post:list-help
         :list-archive:list-subscribe:list-unsubscribe;
        bh=PeC9Ev1QY8xj8U0y03hqjSm9XiI7O/Fgb9JYxRUabxI=;
        b=oZnMWuK93GsqIH6FXQ5ydwGNPSDxEV73trpT274CUiuRRpyQ3BmCsl+PtOWWzxlZIa
         /A4zOUebJS1FU88MBOctITey/zKNpt1aJLpdvGmNU8mepfysL66tV8msVKkk2fpIC+sg
         6nWVHGiZWDzcv1t0V6hWyrvHaSAMKyGIXLkXaz5ZWmt+ud6CUGh3lhgoObDXJn66hrA1
         UIwycH7cI7c+bW6A6vX4qJ/6jdVNEXWRWyU2GjtxsBKnxhdjW5cO5CltxRauHQIsLl71
         GXYHf8A05tpzum53PB2WUjJNZbkQbaVD3KAKFx99u2UOhndjujCiL39ZMVHc25R3RvIo
         JrDw==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AOAM531oBQ1vBOkop2+5ESEvdDVFJhs5vd4kx2XjjSy/mTkO8YqWorwR
	xNTRS+7ABbERWXWMvNfVZSM=
X-Google-Smtp-Source: ABdhPJxriQrF/57ISpRx1zolTydDY4YfPm4wB2pmz5JWC83fAEI+m7D4u+4K9XV1K2YwcuRD2NEh9Q==
X-Received: by 2002:a37:9945:: with SMTP id b66mr27922721qke.51.1597084248661;
        Mon, 10 Aug 2020 11:30:48 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:aed:246b:: with SMTP id s40ls7214748qtc.5.gmail; Mon, 10 Aug
 2020 11:30:48 -0700 (PDT)
X-Received: by 2002:ac8:65cd:: with SMTP id t13mr29416044qto.368.1597084247546;
        Mon, 10 Aug 2020 11:30:47 -0700 (PDT)
Date: Mon, 10 Aug 2020 11:30:46 -0700 (PDT)
From: Vipul Suneja <vsuneja63@gmail.com>
To: Jailhouse <jailhouse-dev@googlegroups.com>
Message-Id: <fed47e44-bfa7-47a7-bad7-a60088a9d2a6o@googlegroups.com>
In-Reply-To: <CAEfxd--LbKjCA55W-tNmL_4H2b+H3jsW6PKYAo5B2Y1Wx0o6GQ@mail.gmail.com>
References: <11e37b92-3146-4194-877f-f79ab746d971o@googlegroups.com>
 <CAEfxd--LbKjCA55W-tNmL_4H2b+H3jsW6PKYAo5B2Y1Wx0o6GQ@mail.gmail.com>
Subject: Re: imx8 : linux-inmate-demo cell created & started. Does it
 maintain another rootfs for this 2nd linux & how we can run a binary in
 this 2nd linux?
MIME-Version: 1.0
Content-Type: multipart/mixed; 
	boundary="----=_Part_1053_757991147.1597084246771"
X-Original-Sender: vsuneja63@gmail.com
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

------=_Part_1053_757991147.1597084246771
Content-Type: multipart/alternative; 
	boundary="----=_Part_1054_1186273098.1597084246773"

------=_Part_1054_1186273098.1597084246773
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable


Hi,

I could flash image in emmc using uuu tool. Removed sd card from board.=20
Facing bootup failing if using "run jh_mmcboot". Image boot up successfully=
=20
if don't use this. Tried the same in sd card it works properly, what could=
=20
be the reason for failing image in emmc.Logs are below:=20

U-Boot SPL 2020.04-5.4.24-2.1.0+g4979a99 (Jul 28 2020 - 11:44:33 +0000)
PMIC:  PFUZE100 ID=3D0x10
DDRINFO: start DRAM init
DDRINFO: DRAM rate 3200MTS
DDRINFO:ddrphy calibration done
DDRINFO: ddrmix config done
Normal Boot
Trying to boot from MMC1
E/TC:0 0 caam_mp_init:367 *************************************
E/TC:0 0 caam_mp_init:368 * Warning: Manufacturing protection *
E/TC:0 0 caam_mp_init:369 *          is not supported         *
E/TC:0 0 caam_mp_init:370 *************************************


U-Boot 2020.04-5.4.24-2.1.0+g4979a99 (Jul 28 2020 - 11:44:33 +0000)

CPU:   i.MX8MQ rev2.0 1500 MHz (running at 1000 MHz)
CPU:   Commercial temperature grade (0C to 95C) at 36C
Reset cause: POR
Model: NXP i.MX8MQ EVK
DRAM:  3 GiB
TCPC:  Vendor ID [0x1fc9], Product ID [0x5110], Addr [I2C0 0x50]
MMC:   FSL_SDHC: 0, FSL_SDHC: 1
Loading Environment from MMC... *** Warning - bad CRC, using default=20
environment

[*]-Video Link 0imx8m_hdmi_probe
 (1280 x 720)
        [0] display-controller@32e00000, video
        [1] hdmi@32c00000, display
In:    serial
Out:   serial
Err:   serial

 BuildInfo:
  - ATF b0a00f2
  - U-Boot 2020.04-5.4.24-2.1.0+g4979a99

switch to partitions #0, OK
mmc0(part 0) is current device
flash target is MMC:0
Net:
Warning: ethernet@30be0000 using MAC address from ROM
eth0: ethernet@30be0000
Fastboot: Normal
Normal Boot
Hit any key to stop autoboot:  0
u-boot=3D> run jh_mmcboot
28021248 bytes read in 190 ms (140.6 MiB/s)
Booting from mmc ...
44482 bytes read in 9 ms (4.7 MiB/s)
## Flattened Device Tree blob at 43000000
   Booting using the fdt blob at 0x43000000
   Using Device Tree in place at 0000000043000000, end 000000004300ddc1

Starting kernel ...

[    0.000000] Booting Linux on physical CPU 0x0000000000 [0x410fd034]
[    0.000000] Linux version 5.4.24-2.1.0+gbabac00 (oe-user@oe-host) (gcc=
=20
version 9.2.0 (GCC)) #1 SMP PREEMPT Tue Jul 28 08:36:15 UTC 2020
[    0.000000] Machine model: NXP i.MX8MQ EVK
[    0.000000] efi: Getting EFI parameters from FDT:
[    0.000000] efi: UEFI not found.
[    0.000000] Reserved memory: created CMA memory pool at=20
0x0000000044000000, size 960 MiB
[    0.000000] OF: reserved mem: initialized node linux,cma, compatible id=
=20
shared-dma-pool
[    0.000000] NUMA: No NUMA configuration found
[    0.000000] NUMA: Faking a node at [mem=20
0x0000000040000000-0x00000000bfafffff]
[    0.000000] NUMA: NODE_DATA [mem 0xbf6d0500-0xbf6d1fff]
[    0.000000] Zone ranges:
[    0.000000]   DMA32    [mem 0x0000000040000000-0x00000000bfafffff]
[    0.000000]   Normal   empty
[    0.000000] Movable zone start for each node
[    0.000000] Early memory node ranges
[    0.000000]   node   0: [mem 0x0000000040000000-0x00000000b7ffffff]
[    0.000000]   node   0: [mem 0x00000000b8400000-0x00000000bfafffff]
[    0.000000] Zeroed struct page in unavailable ranges: 256 pages
[    0.000000] Initmem setup node 0 [mem=20
0x0000000040000000-0x00000000bfafffff]
[    0.000000] psci: probing for conduit method from DT.
[    0.000000] psci: PSCIv1.1 detected in firmware.
[    0.000000] psci: Using standard PSCI v0.2 function IDs
[    0.000000] psci: Trusted OS migration not required
[    0.000000] psci: SMC Calling Convention v1.1
[    0.000000] percpu: Embedded 24 pages/cpu s58904 r8192 d31208 u98304
[    0.000000] Detected VIPT I-cache on CPU0
[    0.000000] CPU features: detected: ARM erratum 845719
[    0.000000] CPU features: detected: GIC system register CPU interface
[    0.000000] Speculative Store Bypass Disable mitigation not required
[    0.000000] Built 1 zonelists, mobility grouping on.  Total pages: 51381=
2
[    0.000000] Policy zone: DMA32
[    0.000000] Kernel command line: clk_ignore_unused=20
console=3Dttymxc0,115200 root=3D/dev/mmcblk0p2 rootwait rw
[    0.000000] Dentry cache hash table entries: 262144 (order: 9, 2097152=
=20
bytes, linear)
[    0.000000] Inode-cache hash table entries: 131072 (order: 8, 1048576=20
bytes, linear)
[    0.000000] mem auto-init: stack:off, heap alloc:off, heap free:off
[    0.000000] Memory: 1035932K/2087936K available (16444K kernel code,=20
1444K rwdata, 6472K rodata, 2944K init, 1017K bss, 68964K reserved, 983040K=
=20
cma-reserved)
[    0.000000] SLUB: HWalign=3D64, Order=3D0-3, MinObjects=3D0, CPUs=3D4, N=
odes=3D1
[    0.000000] rcu: Preemptible hierarchical RCU implementation.
[    0.000000] rcu:     RCU restricting CPUs from NR_CPUS=3D256 to=20
nr_cpu_ids=3D4.
[    0.000000]  Tasks RCU enabled.
[    0.000000] rcu: RCU calculated value of scheduler-enlistment delay is=
=20
25 jiffies.
[    0.000000] rcu: Adjusting geometry for rcu_fanout_leaf=3D16, nr_cpu_ids=
=3D4
[    0.000000] NR_IRQS: 64, nr_irqs: 64, preallocated irqs: 0
[    0.000000] GICv3: GIC: Using split EOI/Deactivate mode
[    0.000000] GICv3: 128 SPIs implemented
[    0.000000] GICv3: 0 Extended SPIs implemented
[    0.000000] GICv3: Distributor has no Range Selector support
[    0.000000] GICv3: 16 PPIs implemented
[    0.000000] GICv3: no VLPI support, no direct LPI support
[    0.000000] GICv3: CPU0: found redistributor 0 region=20
0:0x0000000038880000
[    0.000000] ITS: No ITS available, not enabling LPIs
[    0.000000] random: get_random_bytes called from=20
start_kernel+0x2b8/0x44c with crng_init=3D0
[    0.000000] arch_timer: cp15 timer(s) running at 8.33MHz (phys).
[    0.000000] clocksource: arch_sys_counter: mask: 0xffffffffffffff=20
max_cycles: 0x1ec0311ec, max_idle_ns: 440795202152 ns
[    0.000003] sched_clock: 56 bits at 8MHz, resolution 120ns, wraps every=
=20
2199023255541ns
[    0.000495] Console: colour dummy device 80x25
[    0.000563] Calibrating delay loop (skipped), value calculated using=20
timer frequency.. 16.66 BogoMIPS (lpj=3D33333)
[    0.000572] pid_max: default: 32768 minimum: 301
[    0.000656] LSM: Security Framework initializing
[    0.000722] Mount-cache hash table entries: 4096 (order: 3, 32768 bytes,=
=20
linear)
[    0.000737] Mountpoint-cache hash table entries: 4096 (order: 3, 32768=
=20
bytes, linear)
[    0.023982] ASID allocator initialised with 32768 entries
[    0.031985] rcu: Hierarchical SRCU implementation.
[    0.040943] EFI services will not be available.
[    0.048015] smp: Bringing up secondary CPUs ...
[    0.080185] Detected VIPT I-cache on CPU1
[    0.080212] GICv3: CPU1: found redistributor 1 region=20
0:0x00000000388a0000
[    0.080237] CPU1: Booted secondary processor 0x0000000001 [0x410fd034]
[    0.112213] Detected VIPT I-cache on CPU2
[    0.112229] GICv3: CPU2: found redistributor 2 region=20
0:0x00000000388c0000
[    0.112246] CPU2: Booted secondary processor 0x0000000002 [0x410fd034]
[    0.144271] Detected VIPT I-cache on CPU3
[    0.144286] GICv3: CPU3: found redistributor 3 region=20
0:0x00000000388e0000
[    0.144305] CPU3: Booted secondary processor 0x0000000003 [0x410fd034]
[    0.144374] smp: Brought up 1 node, 4 CPUs
[    0.144395] SMP: Total of 4 processors activated.
[    0.144403] CPU features: detected: 32-bit EL0 Support
[    0.144411] CPU features: detected: CRC32 instructions
[    0.153040] CPU: All CPU(s) started at EL2
[    0.153065] alternatives: patching kernel code
[    0.154645] devtmpfs: initialized
[    0.161855] clocksource: jiffies: mask: 0xffffffff max_cycles:=20
0xffffffff, max_idle_ns: 7645041785100000 ns
[    0.161873] futex hash table entries: 1024 (order: 4, 65536 bytes,=20
linear)
[    0.190302] pinctrl core: initialized pinctrl subsystem
[    0.191100] DMI not present or invalid.
[    0.191380] NET: Registered protocol family 16
[    0.199413] DMA: preallocated 256 KiB pool for atomic allocations
[    0.199428] audit: initializing netlink subsys (disabled)
[    0.199558] audit: type=3D2000 audit(0.196:1): state=3Dinitialized=20
audit_enabled=3D0 res=3D1
[    0.200436] cpuidle: using governor menu
[    0.200972] hw-breakpoint: found 6 breakpoint and 4 watchpoint registers=
.
[    0.201927] Serial: AMBA PL011 UART driver
[    0.202007] imx mu driver is registered.
[    0.202033] imx rpmsg driver is registered.
[    0.206078] imx8mq-pinctrl 30330000.iomuxc: initialized IMX pinctrl=20
driver
[    0.233181] HugeTLB registered 1.00 GiB page size, pre-allocated 0 pages
[    0.233192] HugeTLB registered 32.0 MiB page size, pre-allocated 0 pages
[    0.233200] HugeTLB registered 2.00 MiB page size, pre-allocated 0 pages
[    0.233209] HugeTLB registered 64.0 KiB page size, pre-allocated 0 pages
[    0.235096] cryptd: max_cpu_qlen set to 1000
[    0.241165] ACPI: Interpreter disabled.
[    0.242067] iommu: Default domain type: Translated
[    0.242209] vgaarb: loaded
[    0.242552] SCSI subsystem initialized
[    0.242922] usbcore: registered new interface driver usbfs
[    0.242962] usbcore: registered new interface driver hub
[    0.243026] usbcore: registered new device driver usb
[    0.244115] mc: Linux media interface: v0.10
[    0.244146] videodev: Linux video capture interface: v2.00
[    0.244224] pps_core: LinuxPPS API ver. 1 registered
[    0.244231] pps_core: Software ver. 5.3.6 - Copyright 2005-2007 Rodolfo=
=20
Giometti <giometti@linux.it>
[    0.244247] PTP clock support registered
[    0.244396] EDAC MC: Ver: 3.0.0
[    0.245234] No BMan portals available!
[    0.245524] QMan: Allocated lookup table at (____ptrval____), entry=20
count 65537
[    0.245847] No QMan portals available!
[    0.246332] No USDPAA memory, no 'fsl,usdpaa-mem' in device-tree
[    0.246721] FPGA manager framework
[    0.246818] Advanced Linux Sound Architecture Driver Initialized.
[    0.247234] Bluetooth: Core ver 2.22
[    0.247261] NET: Registered protocol family 31
[    0.247268] Bluetooth: HCI device and connection manager initialized
[    0.247280] Bluetooth: HCI socket layer initialized
[    0.247288] Bluetooth: L2CAP socket layer initialized
[    0.247302] Bluetooth: SCO socket layer initialized
[    0.248043] clocksource: Switched to clocksource arch_sys_counter
[    0.248186] VFS: Disk quotas dquot_6.6.0
[    0.248244] VFS: Dquot-cache hash table entries: 512 (order 0, 4096=20
bytes)
[    0.248438] pnp: PnP ACPI: disabled
[    0.254681] thermal_sys: Registered thermal governor 'step_wise'
[    0.254683] thermal_sys: Registered thermal governor 'power_allocator'
[    0.254977] NET: Registered protocol family 2
[    0.255332] tcp_listen_portaddr_hash hash table entries: 1024 (order: 2,=
=20
16384 bytes, linear)
[    0.255369] TCP established hash table entries: 16384 (order: 5, 131072=
=20
bytes, linear)
[    0.255500] TCP bind hash table entries: 16384 (order: 6, 262144 bytes,=
=20
linear)
[    0.255747] TCP: Hash tables configured (established 16384 bind 16384)
[    0.255827] UDP hash table entries: 1024 (order: 3, 32768 bytes, linear)
[    0.255879] UDP-Lite hash table entries: 1024 (order: 3, 32768 bytes,=20
linear)
[    0.256023] NET: Registered protocol family 1
[    0.256465] RPC: Registered named UNIX socket transport module.
[    0.256471] RPC: Registered udp transport module.
[    0.256476] RPC: Registered tcp transport module.
[    0.256482] RPC: Registered tcp NFSv4.1 backchannel transport module.
[    0.256841] PCI: CLS 0 bytes, default 64
[    0.257582] hw perfevents: enabled with armv8_cortex_a53 PMU driver, 7=
=20
counters available
[    0.257955] kvm [1]: IPA Size Limit: 40bits
[    0.259128] kvm [1]: vgic-v2@31020000
[    0.259149] kvm [1]: GIC system register CPU interface enabled
[    0.259216] kvm [1]: vgic interrupt IRQ1
[    0.259322] kvm [1]: Hyp mode initialized successfully
[    0.265168] Initialise system trusted keyrings
[    0.265266] workingset: timestamp_bits=3D44 max_order=3D19 bucket_order=
=3D0
[    0.272198] squashfs: version 4.0 (2009/01/31) Phillip Lougher
[    0.272898] NFS: Registering the id_resolver key type
[    0.272917] Key type id_resolver registered
[    0.272923] Key type id_legacy registered
[    0.272935] nfs4filelayout_init: NFSv4 File Layout Driver Registering...
[    0.272956] jffs2: version 2.2. (NAND) =C2=A9 2001-2006 Red Hat, Inc.
[    0.273341] 9p: Installing v9fs 9p2000 file system support
[    0.288879] Key type asymmetric registered
[    0.288886] Asymmetric key parser 'x509' registered
[    0.288920] Block layer SCSI generic (bsg) driver version 0.4 loaded=20
(major 244)
[    0.288929] io scheduler mq-deadline registered
[    0.288936] io scheduler kyber registered
[    0.294229] EINJ: ACPI disabled.
[    0.302727] imx-sdma 302c0000.sdma: Direct firmware load for=20
imx/sdma/sdma-imx7d.bin failed with error -2
[    0.302741] imx-sdma 302c0000.sdma: Falling back to sysfs fallback for:=
=20
imx/sdma/sdma-imx7d.bin
[    0.307933] mxs-dma 33000000.dma-apbh: initialized
[    0.311494] Bus freq driver module loaded
[    0.316331] Serial: 8250/16550 driver, 4 ports, IRQ sharing enabled
[    0.318483] 30860000.serial: ttymxc0 at MMIO 0x30860000 (irq =3D 30,=20
base_baud =3D 1562500) is a IMX
[    1.284569] printk: console [ttymxc0] enabled
[    1.289451] 30880000.serial: ttymxc2 at MMIO 0x30880000 (irq =3D 31,=20
base_baud =3D 5000000) is a IMX
[    1.307376] imx-dcss 32e00000.display-controller: ctxld: can't get irq=
=20
number
[    1.314603] imx-dcss 32e00000.display-controller: submodules=20
initialization failed
[    1.322204] imx-dcss 32e00000.display-controller: master bind failed:=20
-517
[    1.339930] loop: module loaded
[    1.345404] imx ahci driver is registered.
[    1.352453] spi-nor spi3.0: n25q256a (32768 Kbytes)
[    1.362522] libphy: Fixed MDIO Bus: probed
[    1.367503] tun: Universal TUN/TAP device driver, 1.6
[    1.373322] thunder_xcv, ver 1.0
[    1.376602] thunder_bgx, ver 1.0
[    1.379874] nicpf, ver 1.0
[    1.383349] pps pps0: new PPS source ptp0
[    1.393265] libphy: fec_enet_mii_bus: probed
[    1.398699] fec 30be0000.ethernet eth0: registered PHC device 0
[    1.405311] Freescale FM module, FMD API version 21.1.0
[    1.410829] Freescale FM Ports module
[    1.414502] fsl_mac: fsl_mac: FSL FMan MAC API based driver
[    1.420251] fsl_dpa: FSL DPAA Ethernet driver
[    1.424736] fsl_advanced: FSL DPAA Advanced drivers:
[    1.429710] fsl_proxy: FSL DPAA Proxy initialization driver
[    1.435400] fsl_oh: FSL FMan Offline Parsing port driver
[    1.441694] hclge is initializing
[    1.445024] hns3: Hisilicon Ethernet Network Driver for Hip08 Family -=
=20
version
[    1.452256] hns3: Copyright (c) 2017 Huawei Corporation.
[    1.457620] e1000: Intel(R) PRO/1000 Network Driver - version=20
7.3.21-k8-NAPI
[    1.464675] e1000: Copyright (c) 1999-2006 Intel Corporation.
[    1.470463] e1000e: Intel(R) PRO/1000 Network Driver - 3.2.6-k
[    1.476301] e1000e: Copyright(c) 1999 - 2015 Intel Corporation.
[    1.482264] igb: Intel(R) Gigabit Ethernet Network Driver - version=20
5.6.0-k
[    1.489238] igb: Copyright (c) 2007-2014 Intel Corporation.
[    1.494858] igbvf: Intel(R) Gigabit Virtual Function Network Driver -=20
version 2.4.0-k
[    1.502695] igbvf: Copyright (c) 2009 - 2012 Intel Corporation.
[    1.508792] sky2: driver version 1.30
[    1.513478] VFIO - User Level meta-driver version: 0.3
[    1.521163] ehci_hcd: USB 2.0 'Enhanced' Host Controller (EHCI) Driver
[    1.527703] ehci-pci: EHCI PCI platform driver
[    1.532212] ehci-platform: EHCI generic platform driver
[    1.537640] ohci_hcd: USB 1.1 'Open' Host Controller (OHCI) Driver
[    1.543840] ohci-pci: OHCI PCI platform driver
[    1.548325] ohci-platform: OHCI generic platform driver
[    1.554171] usbcore: registered new interface driver usb-storage
[    1.560256] usbcore: registered new interface driver usbserial_generic
[    1.566814] usbserial: USB Serial support registered for generic
[    1.572853] usbcore: registered new interface driver ftdi_sio
[    1.578624] usbserial: USB Serial support registered for FTDI USB Serial=
=20
Device
[    1.585969] usbcore: registered new interface driver usb_serial_simple
[    1.592523] usbserial: USB Serial support registered for carelink
[    1.598644] usbserial: USB Serial support registered for zio
[    1.604330] usbserial: USB Serial support registered for funsoft
[    1.610360] usbserial: USB Serial support registered for flashloader
[    1.616739] usbserial: USB Serial support registered for google
[    1.622684] usbserial: USB Serial support registered for libtransistor
[    1.629236] usbserial: USB Serial support registered for vivopay
[    1.635268] usbserial: USB Serial support registered for moto_modem
[    1.641562] usbserial: USB Serial support registered for motorola_tetra
[    1.648209] usbserial: USB Serial support registered for novatel_gps
[    1.654590] usbserial: USB Serial support registered for hp4x
[    1.660367] usbserial: USB Serial support registered for suunto
[    1.666312] usbserial: USB Serial support registered for siemens_mpi
[    1.675516] input: 30370000.snvs:snvs-powerkey as=20
/devices/platform/soc@0/soc@0:bus@30000000/30370000.snvs/30370000.snvs:snvs=
-powerkey/input/input0
[    1.690752] snvs_rtc 30370000.snvs:snvs-rtc-lp: registered as rtc0
[    1.697045] i2c /dev entries driver
[    1.701173] mxc-mipi-csi2_yav 30a70000.mipi_csi1: mipi_csi2_probe
[    1.707327] mxc-mipi-csi2_yav 30a70000.mipi_csi: Remote device at=20
endpoint@0 XXX found
[    1.715266] mxc-mipi-csi2_yav 30a70000.mipi_csi1: lanes: 2, name:=20
mxc-mipi-csi2.0
[    1.722969] mxc-mipi-csi2_yav 30b60000.mipi_csi2: mipi_csi2_probe
[    1.729120] mxc-mipi-csi2_yav 30b60000.mipi_csi: Remote device at=20
endpoint@0 XXX found
[    1.737059] mxc-mipi-csi2_yav 30b60000.mipi_csi2: lanes: 2, name:=20
mxc-mipi-csi2.1
[    1.744795] mx6s-csi 30a90000.csi1_bridge: initialising
[    1.750232] CSI: Registered sensor subdevice: mxc-mipi-csi2.0
[    1.756065] mx6s-csi 30b80000.csi2_bridge: initialising
[    1.761479] CSI: Registered sensor subdevice: mxc-mipi-csi2.1
[    1.769869] imx2-wdt 30280000.watchdog: timeout 60 sec (nowayout=3D0)
[    1.776453] Bluetooth: HCI UART driver ver 2.3
[    1.780914] Bluetooth: HCI UART protocol H4 registered
[    1.786066] Bluetooth: HCI UART protocol BCSP registered
[    1.791407] Bluetooth: HCI UART protocol LL registered
[    1.796557] Bluetooth: HCI UART protocol ATH3K registered
[    1.801988] Bluetooth: HCI UART protocol Three-wire (H5) registered
[    1.808351] Bluetooth: HCI UART protocol Broadcom registered
[    1.814040] Bluetooth: HCI UART protocol QCA registered
[    1.821640] sdhci: Secure Digital Host Controller Interface driver
[    1.827831] sdhci: Copyright(c) Pierre Ossman
[    1.832406] Synopsys Designware Multimedia Card Interface Driver
[    1.839083] sdhci-pltfm: SDHCI platform and OF driver helper
[    1.847135] ledtrig-cpu: registered to indicate activity on CPUs
[    1.854303] caam 30900000.crypto: device ID =3D 0x0a16040100000000 (Era =
9)
[    1.861021] caam 30900000.crypto: job rings =3D 2, qi =3D 0
[    1.885558] caam algorithms registered in /proc/crypto
[    1.892931] caam 30900000.crypto: caam pkc algorithms registered in=20
/proc/crypto
[    1.902488] caam_jr 30901000.jr: registering rng-caam
[    1.916809] caam-snvs 30370000.caam-snvs: can't get snvs clock
[    1.922688] caam-snvs 30370000.caam-snvs: violation handlers armed -=20
non-secure state
[    1.931206] usbcore: registered new interface driver usbhid
[    1.936838] usbhid: USB HID core driver
[    1.942169] No fsl,qman node
[    1.945066] Freescale USDPAA process driver
[    1.949257] fsl-usdpaa: no region found
[    1.953100] Freescale USDPAA process IRQ driver
[    1.961015] optee: probing for conduit method from DT.
[    1.966195] optee: revision 3.7 (7a49776d)
[    1.966406] optee: dynamic shared memory is enabled
[    1.975618] optee: initialized driver
[    1.982779] wm8524-codec audio-codec: Failed to get mute line: -517
[    2.059611] imx-spdif sound-spdif: snd-soc-dummy-dai <-> 30810000.spdif=
=20
mapping ok
[    2.067221] imx-spdif sound-spdif: ASoC: no DMI vendor name!
[    2.075323] imx-spdif sound-hdmi-arc: snd-soc-dummy-dai <->=20
308a0000.spdif mapping ok
[    2.083184] imx-spdif sound-hdmi-arc: ASoC: no DMI vendor name!
[    2.090242] imx-ak4458 sound-ak4458: ASoC: failed to init link ak4458:=
=20
-517
[    2.097228] imx-ak4458 sound-ak4458: snd_soc_register_card failed (-517)
[    2.104197] imx-ak5558 sound-ak5558: ASoC: failed to init link ak5558:=
=20
-517
[    2.111174] imx-ak5558 sound-ak5558: snd_soc_register_card failed (-517)
[    2.118525] imx-cdnhdmi sound-hdmi: ASoC: failed to init link imx8 hdmi:=
=20
-517
[    2.125679] imx-cdnhdmi sound-hdmi: snd_soc_register_card failed (-517)
[    2.132548] pktgen: Packet Generator for packet performance testing.=20
Version: 2.75
[    2.140668] NET: Registered protocol family 26
[    2.145780] NET: Registered protocol family 10
[    2.150963] Segment Routing with IPv6
[    2.154698] NET: Registered protocol family 17
[    2.159246] Bluetooth: RFCOMM TTY layer initialized
[    2.164141] Bluetooth: RFCOMM socket layer initialized
[    2.169313] Bluetooth: RFCOMM ver 1.11
[    2.173079] Bluetooth: BNEP (Ethernet Emulation) ver 1.3
[    2.178400] Bluetooth: BNEP filters: protocol multicast
[    2.183641] Bluetooth: BNEP socket layer initialized
[    2.188614] Bluetooth: HIDP (Human Interface Emulation) ver 1.2
[    2.194546] Bluetooth: HIDP socket layer initialized
[    2.199551] 8021q: 802.1Q VLAN Support v1.8
[    2.203760] lib80211: common routines for IEEE802.11 drivers
[    2.209538] 9pnet: Installing 9P2000 support
[    2.213846] tsn generic netlink module v1 init...
[    2.218616] Key type dns_resolver registered
[    2.223334] registered taskstats version 1
[    2.227450] Loading compiled-in X.509 certificates
[    2.252874] GPIO line 157 (wl-reg-on) hogged as output/high
[    2.260890] ov5640_mipi 0-003c: No sensor reset pin available
[    2.266679] ov5640_mipi 0-003c: 0-003c supply DOVDD not found, using=20
dummy regulator
[    2.274488] ov5640_mipi 0-003c: 0-003c supply DVDD not found, using=20
dummy regulator
[    2.282216] ov5640_mipi 0-003c: 0-003c supply AVDD not found, using=20
dummy regulator
[    2.300363] ov5640_mipi 0-003c: Read reg error: reg=3D300a
[    2.305688] ov5640_mipi 0-003c: Camera is not found
[    2.312187] pfuze100-regulator 0-0008: Full layer: 2, Metal layer: 1
[    2.319167] pfuze100-regulator 0-0008: FAB: 0, FIN: 0
[    2.324243] pfuze100-regulator 0-0008: pfuze100 found.
[    2.346402] i2c i2c-0: IMX I2C adapter registered
[    2.351961] ov5640_mipi 1-003c: No sensor reset pin available
[    2.357752] ov5640_mipi 1-003c: 1-003c supply DOVDD not found, using=20
dummy regulator
[    2.365561] ov5640_mipi 1-003c: 1-003c supply DVDD not found, using=20
dummy regulator
[    2.373270] ov5640_mipi 1-003c: 1-003c supply AVDD not found, using=20
dummy regulator
[    2.425516] random: fast init done
[    3.552073] mxc-mipi-csi2_yav 30a70000.mipi_csi: Registered sensor=20
subdevice: ov5640_mipi 1-003c
[    3.562103] ov5640_mipi 1-003c: Camera is found
[    3.566692] i2c i2c-1: IMX I2C adapter registered
[    3.572225] ak4458 2-0010: 2-0010 supply DVDD not found, using dummy=20
regulator
[    3.579503] ak4458 2-0010: 2-0010 supply AVDD not found, using dummy=20
regulator
[    3.587128] ak4458 2-0012: 2-0012 supply DVDD not found, using dummy=20
regulator
[    3.594428] ak4458 2-0012: 2-0012 supply AVDD not found, using dummy=20
regulator
[    3.602034] ak5558 2-0013: 2-0013 supply DVDD not found, using dummy=20
regulator
[    3.609309] ak5558 2-0013: 2-0013 supply AVDD not found, using dummy=20
regulator
[    3.616942] ak4458 2-0011: 2-0011 supply DVDD not found, using dummy=20
regulator
[    3.624222] ak4458 2-0011: 2-0011 supply AVDD not found, using dummy=20
regulator
[    3.631567] i2c i2c-2: IMX I2C adapter registered
[    3.636791] imx8mq-usb-phy 381f0040.usb-phy: 381f0040.usb-phy supply=20
vbus not found, using dummy regulator
[    3.646740] imx8mq-usb-phy 382f0040.usb-phy: 382f0040.usb-phy supply=20
vbus not found, using dummy regulator
[    3.658518] imx6q-pcie 33c00000.pcie: couldn't get pcie-phy
[    3.664266] imx6q-pcie 33c00000.pcie: 33c00000.pcie supply epdev_on not=
=20
found, using dummy regulator
[    3.664780] [drm] Supports vblank timestamp caching Rev 2 (21.10.2013).
[    3.673673] imx6q-pcie 33c00000.pcie: host bridge /soc@0/pcie@33c00000=
=20
ranges:
[    3.680040] [drm] No driver support for vblank timestamp query.
[    3.680581] cdns-mhdp-imx 32c00000.hdmi: lane-mapping 0xe4
[    3.687274] imx6q-pcie 33c00000.pcie:   No bus range found for=20
/soc@0/pcie@33c00000, using [bus 00-ff]
[    3.687304] imx6q-pcie 33c00000.pcie:    IO 0x27f80000..0x27f8ffff ->=20
0x00000000
[    3.695218] imx-dcss 32e00000.display-controller: bound 32c00000.hdmi=20
(ops cdns_mhdp_imx_ops)
[    3.698706] imx6q-pcie 33c00000.pcie:   MEM 0x20000000..0x27efffff ->=20
0x20000000
[    3.708361] [drm] Initialized imx-dcss 1.0.0 20190917 for=20
32e00000.display-controller on minor 0
[    3.765728] cdns-mhdp-imx 32c00000.hdmi: 0,ff,ff,ff,ff,ff,ff,0
[    3.803626] cdns-mhdp-imx 32c00000.hdmi: 0,ff,ff,ff,ff,ff,ff,0
[    3.804589] [drm] Mode: 1920x1080p148500
[    3.820087] imx6q-pcie 33c00000.pcie: PCIe PLL locked after 0 us.
[    3.832073] [drm] Pixel clock: 148500 KHz, character clock: 222750, bpc=
=20
is 12-bit.
[    3.832079] [drm] VCO frequency is 4455000 KHz
[    3.909255] [drm] Sink Not Support SCDC
[    3.910487] [drm] No vendor infoframe
[    4.006715] Console: switching to colour frame buffer device 240x67
[    4.080055] imx-dcss 32e00000.display-controller: fb0: imx-dcssdrmfb=20
frame buffer device
[    4.089306] OF: graph: no port node found in /soc@0/usb-phy@381f0040
[    4.096786] xhci-hcd xhci-hcd.1.auto: xHCI Host Controller
[    4.102300] xhci-hcd xhci-hcd.1.auto: new USB bus registered, assigned=
=20
bus number 1
[    4.110086] xhci-hcd xhci-hcd.1.auto: hcc params 0x0220fe6c hci version=
=20
0x110 quirks 0x0000000001010010
[    4.119550] xhci-hcd xhci-hcd.1.auto: irq 53, io mem 0x38200000
[    4.126219] hub 1-0:1.0: USB hub found
[    4.130021] hub 1-0:1.0: 1 port detected
[    4.134215] xhci-hcd xhci-hcd.1.auto: xHCI Host Controller
[    4.139723] xhci-hcd xhci-hcd.1.auto: new USB bus registered, assigned=
=20
bus number 2
[    4.147415] xhci-hcd xhci-hcd.1.auto: Host supports USB 3.0 SuperSpeed
[    4.154014] usb usb2: We don't know the algorithms for LPM for this=20
host, disabling LPM.
[    4.162561] hub 2-0:1.0: USB hub found
[    4.166346] hub 2-0:1.0: 1 port detected
[    4.171452] imx-cpufreq-dt imx-cpufreq-dt: cpu speed grade 3 mkt segment=
=20
0 supported-hw 0x8 0x1
[    4.182246] sdhci-esdhc-imx 30b50000.mmc: Got CD GPIO
[    4.216897] mmc1: SDHCI controller on 30b50000.mmc [30b50000.mmc] using=
=20
ADMA
[    4.226780] galcore: clk_get 2d core clock failed, disable 2d/vg!
[    4.233248] Galcore version 6.4.0.234062
[    4.347584] hantrodec: module inserted. Major =3D 236
[    4.354696] debugfs: Directory '308b0000.sai' with parent 'wm8524-audio'=
=20
already present!
[    4.363020] asoc-simple-card sound-wm8524: wm8524-hifi <-> 308b0000.sai=
=20
mapping ok
[    4.370644] asoc-simple-card sound-wm8524: ASoC: no DMI vendor name!
[    4.382398] ak4458 2-0010: ASoC: failed to probe component -6
[    4.388215] imx-ak4458 sound-ak4458: ASoC: failed to instantiate card -6
[    4.395010] imx-ak4458 sound-ak4458: snd_soc_register_card failed (-6)
[    4.402517] ak5558 2-0013: ASoC: failed to probe component -6
[    4.408350] imx-ak5558 sound-ak5558: ASoC: failed to instantiate card -6
[    4.415140] imx-ak5558 sound-ak5558: snd_soc_register_card failed (-6)
[    4.422590] debugfs: Directory '30050000.sai' with parent=20
'imx-audio-hdmi' already present!
[    4.431068] imx-cdnhdmi sound-hdmi: i2s-hifi <-> 30050000.sai mapping ok
[    4.437846] imx-cdnhdmi sound-hdmi: ASoC: no DMI vendor name!
[    4.443694] debugfs: File 'Capture' in directory 'dapm' already present!
[    4.458915] mmc1: host does not support reading read-only switch,=20
assuming write-enable
[    4.468073] usb 1-1: new high-speed USB device number 2 using xhci-hcd
[    4.471829] imx6q-pcie 33800000.pcie: couldn't get pcie-phy
[    4.480204] snvs_rtc 30370000.snvs:snvs-rtc-lp: setting system clock to=
=20
1970-01-01T00:00:02 UTC (2)
[    4.480280] imx6q-pcie 33800000.pcie: 33800000.pcie supply epdev_on not=
=20
found, using dummy regulator
[    4.489624] cfg80211: Loading compiled-in X.509 certificates for=20
regulatory database
[    4.498627] imx6q-pcie 33800000.pcie: host bridge /soc@0/pcie@33800000=
=20
ranges:
[    4.508221] cfg80211: Loaded X.509 cert 'sforshee: 00b28ddf47aef9cea7'
[    4.513396] imx6q-pcie 33800000.pcie:    IO 0x1ff80000..0x1ff8ffff ->=20
0x00000000
[    4.519977] platform regulatory.0: Direct firmware load for=20
regulatory.db failed with error -2
[    4.527318] imx6q-pcie 33800000.pcie:   MEM 0x18000000..0x1fefffff ->=20
0x18000000
[    4.535919] clk: Not disabling unused clocks
[    4.547613] platform regulatory.0: Falling back to sysfs fallback for:=
=20
regulatory.db
[    4.555454] ALSA device list:
[    4.558454]   #0: imx-spdif
[    4.561258]   #1: imx-hdmi-arc
[    4.564320]   #2: wm8524-audio
[    4.567377]   #3: imx-audio-hdmi
[    4.570139] hub 1-1:1.0: USB hub found
[    4.574405] hub 1-1:1.0: 4 ports detected
[    4.580058] mmc1: new ultra high speed DDR50 SDHC card at address aaaa
[    4.587027] mmcblk1: mmc1:aaaa SS32G 29.7 GiB
[    4.600114]  mmcblk1: p1 p2
[    4.648111] imx6q-pcie 33800000.pcie: PCIe PLL locked after 0 us.
[    4.752076] imx6q-pcie 33800000.pcie: Link up
[    4.756448] imx6q-pcie 33800000.pcie: Link up
[    4.760824] imx6q-pcie 33800000.pcie: Link up, Gen1
[    4.765935] imx6q-pcie 33800000.pcie: PCI host bridge to bus 0000:00
[    4.772298] pci_bus 0000:00: root bus resource [bus 00-ff]
[    4.777805] pci_bus 0000:00: root bus resource [io  0x10000-0x1ffff]=20
(bus address [0x0000-0xffff])
[    4.786779] pci_bus 0000:00: root bus resource [mem=20
0x18000000-0x1fefffff]
[    4.793679] pci 0000:00:00.0: [16c3:abcd] type 01 class 0x060400
[    4.799718] pci 0000:00:00.0: reg 0x10: [mem 0x00000000-0x000fffff]
[    4.805999] pci 0000:00:00.0: reg 0x38: [mem 0x00000000-0x0000ffff pref]
[    4.812752] pci 0000:00:00.0: supports D1
[    4.816767] pci 0000:00:00.0: PME# supported from D0 D1 D3hot D3cold
[    4.825074] pci 0000:01:00.0: [168c:003e] type 00 class 0x028000
[    4.827406] imx6q-pcie 33c00000.pcie: Phy link never came up
[    4.831176] pci 0000:01:00.0: reg 0x10: [mem 0x00000000-0x001fffff 64bit=
]
[    4.836797] imx6q-pcie 33c00000.pcie: failed to initialize host
[    4.843880] pci 0000:01:00.0: PME# supported from D0 D3hot D3cold
[    4.849477] imx6q-pcie 33c00000.pcie: unable to add pcie port.
[    4.865657] pci 0000:00:00.0: BAR 14: assigned [mem=20
0x18000000-0x181fffff]
[    4.872543] pci 0000:00:00.0: BAR 0: assigned [mem 0x18200000-0x182fffff=
]
[    4.879341] pci 0000:00:00.0: BAR 6: assigned [mem 0x18300000-0x1830ffff=
=20
pref]
[    4.886574] pci 0000:01:00.0: BAR 0: assigned [mem 0x18000000-0x181fffff=
=20
64bit]
[    4.893914] pci 0000:00:00.0: PCI bridge to [bus 01-ff]
[    4.899148] pci 0000:00:00.0:   bridge window [mem 0x18000000-0x181fffff=
]
[    4.906263] pcieport 0000:00:00.0: PME: Signaling with IRQ 231
[    4.912315] pcieport 0000:00:00.0: AER: enabled with IRQ 231
[    4.918292] Waiting for root device /dev/mmcblk0p2...
[    4.968080] usb 1-1.2: new high-speed USB device number 3 using xhci-hcd
[    5.248053] usb 1-1.4: new low-speed USB device number 4 using xhci-hcd
[    5.532467] input: PixArt USB Optical Mouse as=20
/devices/platform/soc@0/38200000.usb/xhci-hcd.1.auto/usb1/1-1/1-1.4/1-1.4:1=
.0/0003:093A:2510.0001/input/input1
[    5.546652] hid-generic 0003:093A:2510.0001: input: USB HID v1.11 Mouse=
=20
[PixArt USB Optical Mouse] on usb-xhci-hcd.1.auto-1.4/input0
[   35.808082] vdd_arm: disabling
[   35.811158] VGEN1: disabling
[   35.814747] VGEN6: disabling
[   60.384106] imx-sdma 30bd0000.sdma: external firmware not found, using=
=20
ROM firmware
[   60.384226] imx-sdma 302c0000.sdma: Direct firmware load for=20
imx/sdma/sdma-imx7d.bin failed with error -2
[   60.401363] imx-sdma 302c0000.sdma: Falling back to sysfs fallback for:=
=20
imx/sdma/sdma-imx7d.bin
[   61.544094] random: crng init done
[   66.528146] cfg80211: failed to load regulatory.db
[  121.824100] imx-sdma 302c0000.sdma: external firmware not found, using=
=20
ROM firmware



On Thursday, August 6, 2020 at 6:52:17 AM UTC+5:30, Peng Fan wrote:
>
>
>
> Vipul Suneja <vsun...@gmail.com <javascript:>> =E4=BA=8E2020=E5=B9=B48=E6=
=9C=885=E6=97=A5=E5=91=A8=E4=B8=89 =E4=B8=8B=E5=8D=884:48=E5=86=99=E9=81=93=
=EF=BC=9A
>
>>
>>      Target: imx8mq evk
>>      bsp: 5.4.24
>>     =20
>>      Created & started linux cell. Does it maintain separate rootfs? How=
=20
>> to run a binary in this 2nd linux (in dedicated CPU)? I didn't found=20
>> initrd.img, didn't include in the below given command.
>>    =20
>> *     jailhouse cell linux=20
>> /usr/share/jailhouse/cells/imx8mq-linux-demo.cell=20
>> /run/media/mmcblk1p1/Image -d /run/media/mmcblk1p1/imx8mq-evk-inmate.dtb=
 -c=20
>> "clk_ignore_unused console=3Dttymxc0,115200=20
>> earlycon=3Dec_imx6q,0x30860000,115200 root=3D/dev/mmcblk1p2 rootwait rw"=
*
>>
>
> Change the root to /dev/mmcblk2p2 according to your boot log. The 2nd=20
> linux take the emmc on board as the rootfs storage media.
> So you need first use uuu to burn the sdcard image to the emmc device on=
=20
> board. And the 2nd linux will use the other uart as normal console,
> it take the 1st linux uart as early console.
>
> Regards,
> Peng.
>
>>
>>
>>     Below are logs:
>>
>>    =20
>>
>>
>>
>>
>>
>>
>>
>>
>>
>>
>>
>>
>>
>>
>>
>>
>>
>>
>>
>>
>>
>>
>>
>>
>>
>>
>>
>>
>>
>>
>>
>>
>>
>>
>>
>>
>>
>>
>>
>>
>>
>>
>>
>>
>>
>>
>>
>>
>>
>>
>>
>>
>>
>>
>>
>>
>>
>>
>>
>>
>>
>>
>>
>>
>>
>>
>>
>>
>>
>>
>>
>>
>>
>>
>>
>>
>>
>>
>>
>>
>>
>>
>>
>>
>>
>>
>>
>>
>>
>>
>>
>>
>>
>>
>>
>>
>>
>>
>>
>>
>>
>>
>>
>>
>>
>>
>>
>>
>>
>>
>>
>>
>>
>>
>>
>>
>>
>>
>>
>>
>>
>>
>>
>>
>>
>>
>>
>>
>>
>>
>>
>>
>>
>>
>>
>>
>>
>>
>>
>>
>>
>>
>>
>>
>>
>>
>>
>>
>>
>>
>>
>>
>>
>>
>>
>>
>>
>>
>>
>>
>>
>>
>>
>>
>>
>>
>>
>>
>>
>>
>>
>>
>>
>>
>>
>>
>>
>>
>>
>>
>>
>>
>>
>>
>>
>>
>>
>>
>>
>>
>>
>>
>>
>>
>>
>>
>>
>>
>>
>>
>>
>>
>>
>>
>>
>>
>>
>>
>>
>>
>>
>>
>>
>>
>>
>>
>>
>>
>>
>>
>>
>>
>>
>>
>>
>>
>>
>>
>>
>>
>>
>>
>>
>>
>>
>>
>>
>>
>>
>>
>>
>>
>>
>>
>>
>>
>>
>>
>>
>>
>>
>>
>>
>>
>>
>>
>>
>>
>>
>>
>>
>>
>>
>>
>>
>>
>>
>>
>>
>>
>>
>>
>>
>>
>>
>>
>>
>>
>>
>>
>>
>>
>>
>>
>>
>>
>>
>>
>>
>>
>>
>>
>>
>>
>> *Adding virtual PCI device 00:00.0 to cell "linux-inmate-demo"Shared=20
>> memory connection established, peer cells: "imx8mq"Adding virtual PCI=20
>> device 00:01.0 to cell "linux-inmate-demo"Shared memory connection=20
>> established, peer cells: "imx8mq"Created cell "linux-inmate-demo"Page po=
ol=20
>> usage after cell creation: mem 80/992, remap 144/131072[ 1021.954940]=20
>> Created Jailhouse cell "linux-inmate-demo"Cell "linux-inmate-demo" can b=
e=20
>> loadedStarted cell "linux-inmate-demo"[    0.000000] Booting Linux on=20
>> physical CPU 0x0000000002 [0x410fd034][    0.000000] Linux version=20
>> 5.4.24-2.1.0+gbabac00 (oe-user@oe-host) (gcc version 9.2.0 (GCC)) #1 SMP=
=20
>> PREEMPT Tue Jul 28 08:36:15 UTC 2020[    0.000000] Machine model: Freesc=
ale=20
>> i.MX8MQ EVK[    0.000000] earlycon: ec_imx6q0 at MMIO 0x0000000030860000=
=20
>> (options '115200')[    0.000000] printk: bootconsole [ec_imx6q0]=20
>> enabled[    0.000000] efi: Getting EFI parameters from FDT:[    0.000000=
]=20
>> efi: UEFI not found.[    0.000000] cma: Reserved 320 MiB at=20
>> 0x00000000e8000000[    0.000000] NUMA: No NUMA configuration found[   =
=20
>> 0.000000] NUMA: Faking a node at [mem=20
>> 0x00000000c0000000-0x00000000fdbfffff][    0.000000] NUMA: NODE_DATA [me=
m=20
>> 0xfda0d500-0xfda0efff][    0.000000] Zone ranges:[    0.000000]   DMA32 =
  =20
>> [mem 0x00000000c0000000-0x00000000fdbfffff][    0.000000]   Normal  =20
>> empty[    0.000000] Movable zone start for each node[    0.000000] Early=
=20
>> memory node ranges[    0.000000]   node   0: [mem=20
>> 0x00000000c0000000-0x00000000fdbfffff][    0.000000] Initmem setup node =
0=20
>> [mem 0x00000000c0000000-0x00000000fdbfffff][    0.000000] psci: probing =
for=20
>> conduit method from DT.[    0.000000] psci: PSCIv1.1 detected in=20
>> firmware.[    0.000000] psci: Using standard PSCI v0.2 function IDs[   =
=20
>> 0.000000] psci: MIGRATE_INFO_TYPE not supported.[    0.000000] psci: SMC=
=20
>> Calling Convention v1.1[    0.000000] percpu: Embedded 24 pages/cpu s589=
04=20
>> r8192 d31208 u98304[    0.000000] Detected VIPT I-cache on CPU0[   =20
>> 0.000000] CPU features: detected: ARM erratum 845719[    0.000000] CPU=
=20
>> features: detected: GIC system register CPU interface[    0.000000] Buil=
t 1=20
>> zonelists, mobility grouping on.  Total pages: 248976[    0.000000] Poli=
cy=20
>> zone: DMA32[    0.000000] Kernel command line: clk_ignore_unused=20
>> console=3Dttymxc0,115200 earlycon=3Dec_imx6q,0x30860000,115200=20
>> root=3D/dev/mmcblk1p2 rootwait rw[    0.000000] Dentry cache hash table=
=20
>> entries: 131072 (order: 8, 1048576 bytes, linear)[    0.000000] Inode-ca=
che=20
>> hash table entries: 65536 (order: 7, 524288 bytes, linear)[    0.000000]=
=20
>> mem auto-init: stack:off, heap alloc:off, heap free:off[    0.000000]=20
>> Memory: 635512K/1011712K available (16444K kernel code, 1444K rwdata, 64=
72K=20
>> rodata, 2944K init, 1017K bss, 48520K reserved, 327680K cma-reserved)[  =
 =20
>> 0.000000] SLUB: HWalign=3D64, Order=3D0-3, MinObjects=3D0, CPUs=3D2, Nod=
es=3D1[   =20
>> 0.000000] rcu: Preemptible hierarchical RCU implementation.[    0.000000=
]=20
>> rcu:     RCU restricting CPUs from NR_CPUS=3D256 to nr_cpu_ids=3D2.[   =
=20
>> 0.000000]  Tasks RCU enabled.[    0.000000] rcu: RCU calculated value of=
=20
>> scheduler-enlistment delay is 25 jiffies.[    0.000000] rcu: Adjusting=
=20
>> geometry for rcu_fanout_leaf=3D16, nr_cpu_ids=3D2[    0.000000] NR_IRQS:=
 64,=20
>> nr_irqs: 64, preallocated irqs: 0[    0.000000] GICv3: 128 SPIs=20
>> implemented[    0.000000] GICv3: 0 Extended SPIs implemented[    0.00000=
0]=20
>> GICv3: Distributor has no Range Selector support[    0.000000] GICv3: 16=
=20
>> PPIs implemented[    0.000000] GICv3: no VLPI support, no direct LPI=20
>> support[    0.000000] GICv3: CPU0: found redistributor 2 region=20
>> 0:0x00000000388c0000[    0.000000] ITS: No ITS available, not enabling=
=20
>> LPIs[    0.000000] random: get_random_bytes called from=20
>> start_kernel+0x2b8/0x44c with crng_init=3D0[    0.000000] arch_timer: cp=
15=20
>> timer(s) running at 8.33MHz (virt).[    0.000000] clocksource:=20
>> arch_sys_counter: mask: 0xffffffffffffff max_cycles: 0x1ec0311ec,=20
>> max_idle_ns: 440795202152 ns[    0.000004] sched_clock: 56 bits at 8MHz,=
=20
>> resolution 120ns, wraps every 2199023255541ns[    0.008121] Console: col=
our=20
>> dummy device 80x25[    0.012473] Calibrating delay loop (skipped), value=
=20
>> calculated using timer frequency.. 16.66 BogoMIPS (lpj=3D33333)[    0.02=
2664]=20
>> pid_max: default: 32768 minimum: 301[    0.027337] LSM: Security Framewo=
rk=20
>> initializing[    0.031915] Mount-cache hash table entries: 2048 (order: =
2,=20
>> 16384 bytes, linear)[    0.039248] Mountpoint-cache hash table entries:=
=20
>> 2048 (order: 2, 16384 bytes, linear)[    0.071135] ASID allocator=20
>> initialised with 32768 entries[    0.079137] rcu: Hierarchical SRCU=20
>> implementation.[    0.087271] EFI services will not be available.[   =20
>> 0.095177] smp: Bringing up secondary CPUs ...[    0.127296] Detected VIP=
T=20
>> I-cache on CPU1[    0.127333] GICv3: CPU1: found redistributor 3 region=
=20
>> 0:0x00000000388e0000[    0.127374] CPU1: Booted secondary processor=20
>> 0x0000000003 [0x410fd034][    0.127452] smp: Brought up 1 node, 2 CPUs[ =
  =20
>> 0.146060] SMP: Total of 2 processors activated.[    0.150745] CPU featur=
es:=20
>> detected: 32-bit EL0 Support[    0.155882] CPU features: detected: CRC32=
=20
>> instructions[    0.171395] CPU: All CPU(s) started at EL1[    0.172643]=
=20
>> alternatives: patching kernel code[    0.178327] devtmpfs: initialized[ =
  =20
>> 0.182016] clocksource: jiffies: mask: 0xffffffff max_cycles: 0xffffffff,=
=20
>> max_idle_ns: 7645041785100000 ns[    0.190093] futex hash table entries:=
=20
>> 512 (order: 3, 32768 bytes, linear)[    0.205814] pinctrl core: initiali=
zed=20
>> pinctrl subsystem[    0.208766] DMI not present or invalid.[    0.212295=
]=20
>> NET: Registered protocol family 16[    0.226844] DMA: preallocated 256 K=
iB=20
>> pool for atomic allocations[    0.230091] audit: initializing netlink=20
>> subsys (disabled)[    0.235625] audit: type=3D2000 audit(0.200:1):=20
>> state=3Dinitialized audit_enabled=3D0 res=3D1[    0.243221] cpuidle: usi=
ng=20
>> governor menu[    0.247461] hw-breakpoint: found 6 breakpoint and 4=20
>> watchpoint registers.[    0.254239] Serial: AMBA PL011 UART driver[   =
=20
>> 0.258022] imx mu driver is registered.[    0.261865] imx rpmsg driver is=
=20
>> registered.[    0.283632] HugeTLB registered 1.00 GiB page size,=20
>> pre-allocated 0 pages[    0.287485] HugeTLB registered 32.0 MiB page siz=
e,=20
>> pre-allocated 0 pages[    0.294161] HugeTLB registered 2.00 MiB page siz=
e,=20
>> pre-allocated 0 pages[    0.300846] HugeTLB registered 64.0 KiB page siz=
e,=20
>> pre-allocated 0 pages[    0.309530] cryptd: max_cpu_qlen set to 1000[   =
=20
>> 0.317166] ACPI: Interpreter disabled.[    0.318509] iommu: Default domai=
n=20
>> type: Translated[    0.323154] vgaarb: loaded[    0.325989] SCSI subsyst=
em=20
>> initialized[    0.329830] usbcore: registered new interface driver=20
>> usbfs[    0.334947] usbcore: registered new interface driver hub[   =20
>> 0.340466] usbcore: registered new device driver usb[    0.345518] mc: Li=
nux=20
>> media interface: v0.10[    0.349507] videodev: Linux video capture=20
>> interface: v2.00[    0.355017] pps_core: LinuxPPS API ver. 1 registered[=
   =20
>> 0.359900] pps_core: Software ver. 5.3.6 - Copyright 2005-2007 Rodolfo=20
>> Giometti <giom...@linux.it <javascript:>>[    0.369034] PTP clock suppor=
t=20
>> registered[    0.372976] EDAC MC: Ver: 3.0.0[    0.376456] No BMan porta=
ls=20
>> available![    0.379991] QMan: Allocated lookup table at (____ptrval____=
),=20
>> entry count 65537[    0.387121] No QMan portals available![    0.390844]=
 No=20
>> USDPAA memory, no 'fsl,usdpaa-mem' in device-tree[    0.397047] FPGA=20
>> manager framework[    0.400255] Advanced Linux Sound Architecture Driver=
=20
>> Initialized.[    0.406683] Bluetooth: Core ver 2.22[    0.409838] NET:=
=20
>> Registered protocol family 31[    0.414246] Bluetooth: HCI device and=20
>> connection manager initialized[    0.420580] Bluetooth: HCI socket layer=
=20
>> initialized[    0.425440] Bluetooth: L2CAP socket layer initialized[   =
=20
>> 0.430494] Bluetooth: SCO socket layer initialized[    0.435863]=20
>> clocksource: Switched to clocksource arch_sys_counter[    0.441553] VFS:=
=20
>> Disk quotas dquot_6.6.0[    0.445367] VFS: Dquot-cache hash table entrie=
s:=20
>> 512 (order 0, 4096 bytes)[    0.452334] pnp: PnP ACPI: disabled[   =20
>> 0.462170] thermal_sys: Registered thermal governor 'step_wise'[   =20
>> 0.462173] thermal_sys: Registered thermal governor 'power_allocator'[   =
=20
>> 0.465472] NET: Registered protocol family 2[    0.476511]=20
>> tcp_listen_portaddr_hash hash table entries: 512 (order: 1, 8192 bytes,=
=20
>> linear)[    0.484540] TCP established hash table entries: 8192 (order: 4=
,=20
>> 65536 bytes, linear)[    0.492302] TCP bind hash table entries: 8192=20
>> (order: 5, 131072 bytes, linear)[    0.499571] TCP: Hash tables configur=
ed=20
>> (established 8192 bind 8192)[    0.505845] UDP hash table entries: 512=
=20
>> (order: 2, 16384 bytes, linear)[    0.512401] UDP-Lite hash table entrie=
s:=20
>> 512 (order: 2, 16384 bytes, linear)[    0.519510] NET: Registered protoc=
ol=20
>> family 1[    0.524157] RPC: Registered named UNIX socket transport=20
>> module.[    0.529649] RPC: Registered udp transport module.[    0.534334=
]=20
>> RPC: Registered tcp transport module.[    0.539023] RPC: Registered tcp=
=20
>> NFSv4.1 backchannel transport module.[    0.545810] PCI: CLS 0 bytes,=20
>> default 64[    0.549924] kvm [1]: HYP mode not available[    0.559322]=
=20
>> Initialise system trusted keyrings[    0.561042] workingset:=20
>> timestamp_bits=3D44 max_order=3D18 bucket_order=3D0[    0.574077] squash=
fs:=20
>> version 4.0 (2009/01/31) Phillip Lougher[    0.577766] NFS: Registering =
the=20
>> id_resolver key type[    0.582117] Key type id_resolver registered[   =
=20
>> 0.586255] Key type id_legacy registered[    0.590256] nfs4filelayout_ini=
t:=20
>> NFSv4 File Layout Driver Registering...[    0.596947] jffs2: version 2.2=
.=20
>> (NAND) =C2=A9 2001-2006 Red Hat, Inc.[    0.603415] 9p: Installing v9fs =
9p2000=20
>> file system support[    0.623963] Key type asymmetric registered[   =20
>> 0.625197] Asymmetric key parser 'x509' registered[    0.630097] Block la=
yer=20
>> SCSI generic (bsg) driver version 0.4 loaded (major 244)[    0.637464] i=
o=20
>> scheduler mq-deadline registered[    0.641963] io scheduler kyber=20
>> registered[    0.646985] pci-host-generic bfb00000.pci: host bridge=20
>> /pci@bfb00000 ranges:[    0.653010] pci-host-generic bfb00000.pci:   MEM=
=20
>> 0x10000000..0x1000ffff -> 0x10000000[    0.660844] pci-host-generic=20
>> bfb00000.pci: ECAM at [mem 0xbfb00000-0xbfbfffff] for [bus 00][   =20
>> 0.669234] pci-host-generic bfb00000.pci: PCI host bridge to bus 0000:00[=
   =20
>> 0.675904] pci_bus 0000:00: root bus resource [bus 00][    0.681117] pci_=
bus=20
>> 0000:00: root bus resource [mem 0x10000000-0x1000ffff][    0.687999] pci=
=20
>> 0000:00:00.0: [110a:4106] type 00 class 0xff0000[    0.693983] pci=20
>> 0000:00:00.0: reg 0x10: [mem 0x00000000-0x00000fff][    0.700441] pci=20
>> 0000:00:01.0: [110a:4106] type 00 class 0xff0001[    0.706215] pci=20
>> 0000:00:01.0: reg 0x10: [mem 0x00000000-0x00000fff][    0.712846] pci=20
>> 0000:00:00.0: BAR 0: assigned [mem 0x10000000-0x10000fff][    0.719226] =
pci=20
>> 0000:00:01.0: BAR 0: assigned [mem 0x10001000-0x10001fff][    0.730661]=
=20
>> EINJ: ACPI disabled.[    0.731846] Bus freq driver module loaded[   =20
>> 0.738437] Serial: 8250/16550 driver, 4 ports, IRQ sharing enabled[   =20
>> 0.743272] 30890000.serial: ttymxc1 at MMIO 0x30890000 (irq =3D 5, base_b=
aud =3D=20
>> 1562500) is a IMX[    0.758802] loop: module loaded[    0.760497] imx ah=
ci=20
>> driver is registered.[    0.764652] libphy: Fixed MDIO Bus: probed[   =
=20
>> 0.768138] tun: Universal TUN/TAP device driver, 1.6[    0.772584]=20
>> thunder_xcv, ver 1.0[    0.775525] thunder_bgx, ver 1.0[    0.778759]=20
>> nicpf, ver 1.0[    0.781574] Freescale FM module, FMD API version=20
>> 21.1.0[    0.786667] Freescale FM Ports module[    0.790255] fsl_mac:=20
>> fsl_mac: FSL FMan MAC API based driver[    0.795852] fsl_dpa: FSL DPAA=
=20
>> Ethernet driver[    0.800190] fsl_advanced: FSL DPAA Advanced drivers:[ =
  =20
>> 0.805098] fsl_proxy: FSL DPAA Proxy initialization driver[    0.810691]=
=20
>> fsl_oh: FSL FMan Offline Parsing port driver[    0.816330] hclge is=20
>> initializing[    0.819240] hns3: Hisilicon Ethernet Network Driver for=
=20
>> Hip08 Family - version[    0.826457] hns3: Copyright (c) 2017 Huawei=20
>> Corporation.[    0.831800] e1000: Intel(R) PRO/1000 Network Driver -=20
>> version 7.3.21-k8-NAPI[    0.838777] e1000: Copyright (c) 1999-2006 Inte=
l=20
>> Corporation.[    0.844545] e1000e: Intel(R) PRO/1000 Network Driver -=20
>> 3.2.6-k[    0.850324] e1000e: Copyright(c) 1999 - 2015 Intel=20
>> Corporation.[    0.856268] igb: Intel(R) Gigabit Ethernet Network Driver=
 -=20
>> version 5.6.0-k[    0.863169] igb: Copyright (c) 2007-2014 Intel=20
>> Corporation.[    0.868770] igbvf: Intel(R) Gigabit Virtual Function Netw=
ork=20
>> Driver - version 2.4.0-k[    0.876539] igbvf: Copyright (c) 2009 - 2012=
=20
>> Intel Corporation.[    0.882511] sky2: driver version 1.30[    0.886445]=
=20
>> ivshmem-net 0000:00:01.0: enabling device (0000 -> 0002)[    0.892506]=
=20
>> ivshmem-net 0000:00:01.0: TX memory at 0x00000000bfe80000, size=20
>> 0x000000000007f000[    0.901024] ivshmem-net 0000:00:01.0: RX memory at=
=20
>> 0x00000000bfe01000, size 0x000000000007f000_ivshmem 0000:00:00.0:=20
>> state_table at 0x00000000bfd00000, size 0x0000000000001000om6s 3] dy[   =
=20
>> 0.924815] uio_ivshmem 0000:00:00.0: rw_section at 0x00000000bfd01000, si=
ze=20
>> 0x0000000000009000[    0.933489] uio_ivshmem 0000:00:00.0: input_section=
s=20
>> at 0x00000000bfd0a000, size 0x0000000000006000[    0.942511] uio_ivshmem=
=20
>> 0000:00:00.0: output_section at 0x00000000bfd0e000, size=20
>> 0x0000000000002000[    0.951977] VFIO - User Level meta-driver version:=
=20
>> 0.3[    0.957373] ehci_hcd: USB 2.0 'Enhanced' Host Controller (EHCI)=20
>> Driver[    0.963176] ehci-pci: EHCI PCI platform driver[    0.967627]=20
>> ehci-platform: EHCI generic platform driver[    0.972839] ohci_hcd: USB =
1.1=20
>> 'Open' Host Controller (OHCI) Driver[    0.978981] ohci-pci: OHCI PCI=20
>> platform driver[    0.983424] ohci-platform: OHCI generic platform=20
>> driver[    0.988740] usbcore: registered new interface driver=20
>> usb-storage[    0.994651] usbcore: registered new interface driver=20
>> usbserial_generic[    1.001115] usbserial: USB Serial support registered=
=20
>> for generic[    1.007108] usbcore: registered new interface driver=20
>> ftdi_sio[    1.012831] usbserial: USB Serial support registered for FTDI=
=20
>> USB Serial Device[    1.020135] usbcore: registered new interface driver=
=20
>> usb_serial_simple[    1.026643] usbserial: USB Serial support registered=
=20
>> for carelink[    1.032709] usbserial: USB Serial support registered for=
=20
>> zio[    1.038351] usbserial: USB Serial support registered for funsoft[ =
  =20
>> 1.044350] usbserial: USB Serial support registered for flashloader[   =
=20
>> 1.050679] usbserial: USB Serial support registered for google[    1.0565=
83]=20
>> usbserial: USB Serial support registered for libtransistor[    1.063090]=
=20
>> usbserial: USB Serial support registered for vivopay[    1.069080]=20
>> usbserial: USB Serial support registered for moto_modem[    1.075333]=20
>> usbserial: USB Serial support registered for motorola_tetra[    1.081930=
]=20
>> usbserial: USB Serial support registered for novatel_gps[    1.088278]=
=20
>> usbserial: USB Serial support registered for hp4x[    1.093993] usbseria=
l:=20
>> USB Serial support registered for suunto[    1.099901] usbserial: USB=20
>> Serial support registered for siemens_mpi[    1.107246] i2c /dev entries=
=20
>> driver[    1.110345] Bluetooth: HCI UART driver ver 2.3[    1.114127]=20
>> Bluetooth: HCI UART protocol H4 registered[    1.119245] Bluetooth: HCI=
=20
>> UART protocol BCSP registered[    1.124556] Bluetooth: HCI UART protocol=
 LL=20
>> registered[    1.129660] Bluetooth: HCI UART protocol ATH3K registered[ =
  =20
>> 1.135056] Bluetooth: HCI UART protocol Three-wire (H5) registered[   =20
>> 1.141326] Bluetooth: HCI UART protocol Broadcom registered[    1.146950]=
=20
>> Bluetooth: HCI UART protocol QCA registered[    1.152285] imx-cpufreq-dt=
:=20
>> probe of imx-cpufreq-dt failed with error -2[    1.159033] sdhci: Secure=
=20
>> Digital Host Controller Interface driver[    1.164990] sdhci: Copyright(=
c)=20
>> Pierre Ossman[    1.169392] Synopsys Designware Multimedia Card Interfac=
e=20
>> Driver[    1.175449] sdhci-pltfm: SDHCI platform and OF driver helper[  =
 =20
>> 1.181146] sdhci-esdhc-imx 30b40000.mmc: could not get pinctrl[    1.2180=
13]=20
>> mmc2: SDHCI controller on 30b40000.mmc [30b40000.mmc] using ADMA[   =20
>> 1.222834] ledtrig-cpu: registered to indicate activity on CPUs[   =20
>> 1.229160] usbcore: registered new interface driver usbhid[    1.233823]=
=20
>> usbhid: USB HID core driver[    1.238352] No fsl,qman node[    1.240462]=
=20
>> Freescale USDPAA process driver[    1.244627] fsl-usdpaa: no region=20
>> found[    1.248477] Freescale USDPAA process IRQ driver[    1.257304]=20
>> pktgen: Packet Generator for packet performance testing. Version: 2.75[ =
  =20
>> 1.262307] NET: Registered protocol family 26[    1.267090] NET: Register=
ed=20
>> protocol family 10[    1.271591] Segment Routing with IPv6[    1.274573]=
=20
>> NET: Registered protocol family 17[    1.279040] Bluetooth: RFCOMM TTY=
=20
>> layer initialized[    1.283840] Bluetooth: RFCOMM socket layer=20
>> initialized[    1.288955] Bluetooth: RFCOMM ver 1.11[    1.292683]=20
>> Bluetooth: BNEP (Ethernet Emulation) ver 1.3[    1.297958] Bluetooth: BN=
EP=20
>> filters: protocol multicast[    1.303185] Bluetooth: BNEP socket layer=
=20
>> initialized[    1.308126] Bluetooth: HIDP (Human Interface Emulation) ve=
r=20
>> 1.2[    1.314021] Bluetooth: HIDP socket layer initialized[    1.319004]=
=20
>> 8021q: 802.1Q VLAN Support v1.8[    1.323167] lib80211: common routines =
for=20
>> IEEE802.11 drivers[    1.328915] 9pnet: Installing 9P2000 support[   =20
>> 1.333060] tsn generic netlink module v1 init...[    1.337781] Key type=
=20
>> dns_resolver registered[    1.342482] registered taskstats version 1[   =
=20
>> 1.346064] Loading compiled-in X.509 certificates[    1.352505] hctosys:=
=20
>> unable to open rtc device (rtc0)[    1.355965] cfg80211: Loading=20
>> compiled-in X.509 certificates for regulatory database[    1.365244]=20
>> cfg80211: Loaded X.509 cert 'sforshee: 00b28ddf47aef9cea7'[    1.370196]=
=20
>> platform regulatory.0: Direct firmware load for regulatory.db failed wit=
h=20
>> error -2[    1.371872] clk: Not disabling unused clocks[    1.378719]=20
>> platform regulatory.0: Falling back to sysfs fallback for:=20
>> regulatory.db[    1.382975] ALSA device list:[    1.393625]   No soundca=
rds=20
>> found.[    1.397057] Warning: unable to open an initial console.[   =20
>> 1.402301] Waiting for root device /dev/mmcblk1p2...[    1.417055] mmc2: =
new=20
>> DDR MMC card at address 0001[    1.419499] mmcblk2: mmc2:0001 DG4016 14.=
7=20
>> GiB[    1.423711] mmcblk2boot0: mmc2:0001 DG4016 partition 1 4.00 MiB[  =
 =20
>> 1.429619] mmcblk2boot1: mmc2:0001 DG4016 partition 2 4.00 MiB[    1.4354=
31]=20
>> mmcblk2rpmb: mmc2:0001 DG4016 partition 3 4.00 MiB, chardev (237:0)[   =
=20
>> 1.452011]  mmcblk2: p1 p2[   62.528001] cfg80211: failed to load=20
>> regulatory.db*
>>
>> --=20
>> You received this message because you are subscribed to the Google Group=
s=20
>> "Jailhouse" group.
>> To unsubscribe from this group and stop receiving emails from it, send a=
n=20
>> email to jailho...@googlegroups.com <javascript:>.
>> To view this discussion on the web visit=20
>> https://groups.google.com/d/msgid/jailhouse-dev/11e37b92-3146-4194-877f-=
f79ab746d971o%40googlegroups.com=20
>> <https://groups.google.com/d/msgid/jailhouse-dev/11e37b92-3146-4194-877f=
-f79ab746d971o%40googlegroups.com?utm_medium=3Demail&utm_source=3Dfooter>
>> .
>>
>
>
> --=20
>
>

--=20
You received this message because you are subscribed to the Google Groups "=
Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/=
jailhouse-dev/fed47e44-bfa7-47a7-bad7-a60088a9d2a6o%40googlegroups.com.

------=_Part_1054_1186273098.1597084246773
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><br><div>Hi,</div><div><br></div><div>I could flash image =
in emmc using uuu tool. Removed sd card from board. Facing bootup failing i=
f using &quot;run jh_mmcboot&quot;. Image boot up successfully if don&#39;t=
 use this. Tried the same in sd card it works properly, what could be the r=
eason for failing image in emmc.Logs are below: <br></div><div><br></div><d=
iv>U-Boot SPL 2020.04-5.4.24-2.1.0+g4979a99 (Jul 28 2020 - 11:44:33 +0000)<=
/div>PMIC:=C2=A0 PFUZE100 ID=3D0x10<br>DDRINFO: start DRAM init<br>DDRINFO:=
 DRAM rate 3200MTS<br>DDRINFO:ddrphy calibration done<br>DDRINFO: ddrmix co=
nfig done<br>Normal Boot<br>Trying to boot from MMC1<br>E/TC:0 0 caam_mp_in=
it:367 *************************************<br>E/TC:0 0 caam_mp_init:368 *=
 Warning: Manufacturing protection *<br>E/TC:0 0 caam_mp_init:369 *=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 is not supported=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 *<br>E/TC:0 0 caam_mp_init:370 ****=
*********************************<br><br><br>U-Boot 2020.04-5.4.24-2.1.0+g4=
979a99 (Jul 28 2020 - 11:44:33 +0000)<br><br>CPU:=C2=A0=C2=A0 i.MX8MQ rev2.=
0 1500 MHz (running at 1000 MHz)<br>CPU:=C2=A0=C2=A0 Commercial temperature=
 grade (0C to 95C) at 36C<br>Reset cause: POR<br>Model: NXP i.MX8MQ EVK<br>=
DRAM:=C2=A0 3 GiB<br>TCPC:=C2=A0 Vendor ID [0x1fc9], Product ID [0x5110], A=
ddr [I2C0 0x50]<br>MMC:=C2=A0=C2=A0 FSL_SDHC: 0, FSL_SDHC: 1<br>Loading Env=
ironment from MMC... *** Warning - bad CRC, using default environment<br><b=
r>[*]-Video Link 0imx8m_hdmi_probe<br>=C2=A0(1280 x 720)<br>=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0 [0] display-controller@32e00000, video<br>=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 [1] hdmi@32c00000, display<br>In:=
=C2=A0=C2=A0=C2=A0 serial<br>Out:=C2=A0=C2=A0 serial<br>Err:=C2=A0=C2=A0 se=
rial<br><br>=C2=A0BuildInfo:<br>=C2=A0 - ATF b0a00f2<br>=C2=A0 - U-Boot 202=
0.04-5.4.24-2.1.0+g4979a99<br><br>switch to partitions #0, OK<br>mmc0(part =
0) is current device<br>flash target is MMC:0<br>Net:<br>Warning: ethernet@=
30be0000 using MAC address from ROM<br>eth0: ethernet@30be0000<br>Fastboot:=
 Normal<br>Normal Boot<br>Hit any key to stop autoboot:=C2=A0 0<br>u-boot=
=3D&gt; run jh_mmcboot<br>28021248 bytes read in 190 ms (140.6 MiB/s)<br>Bo=
oting from mmc ...<br>44482 bytes read in 9 ms (4.7 MiB/s)<br>## Flattened =
Device Tree blob at 43000000<br>=C2=A0=C2=A0 Booting using the fdt blob at =
0x43000000<br>=C2=A0=C2=A0 Using Device Tree in place at 0000000043000000, =
end 000000004300ddc1<br><br>Starting kernel ...<br><br>[=C2=A0=C2=A0=C2=A0 =
0.000000] Booting Linux on physical CPU 0x0000000000 [0x410fd034]<br>[=C2=
=A0=C2=A0=C2=A0 0.000000] Linux version 5.4.24-2.1.0+gbabac00 (oe-user@oe-h=
ost) (gcc version 9.2.0 (GCC)) #1 SMP PREEMPT Tue Jul 28 08:36:15 UTC 2020<=
br>[=C2=A0=C2=A0=C2=A0 0.000000] Machine model: NXP i.MX8MQ EVK<br>[=C2=A0=
=C2=A0=C2=A0 0.000000] efi: Getting EFI parameters from FDT:<br>[=C2=A0=C2=
=A0=C2=A0 0.000000] efi: UEFI not found.<br>[=C2=A0=C2=A0=C2=A0 0.000000] R=
eserved memory: created CMA memory pool at 0x0000000044000000, size 960 MiB=
<br>[=C2=A0=C2=A0=C2=A0 0.000000] OF: reserved mem: initialized node linux,=
cma, compatible id shared-dma-pool<br>[=C2=A0=C2=A0=C2=A0 0.000000] NUMA: N=
o NUMA configuration found<br>[=C2=A0=C2=A0=C2=A0 0.000000] NUMA: Faking a =
node at [mem 0x0000000040000000-0x00000000bfafffff]<br>[=C2=A0=C2=A0=C2=A0 =
0.000000] NUMA: NODE_DATA [mem 0xbf6d0500-0xbf6d1fff]<br>[=C2=A0=C2=A0=C2=
=A0 0.000000] Zone ranges:<br>[=C2=A0=C2=A0=C2=A0 0.000000]=C2=A0=C2=A0 DMA=
32=C2=A0=C2=A0=C2=A0 [mem 0x0000000040000000-0x00000000bfafffff]<br>[=C2=A0=
=C2=A0=C2=A0 0.000000]=C2=A0=C2=A0 Normal=C2=A0=C2=A0 empty<br>[=C2=A0=C2=
=A0=C2=A0 0.000000] Movable zone start for each node<br>[=C2=A0=C2=A0=C2=A0=
 0.000000] Early memory node ranges<br>[=C2=A0=C2=A0=C2=A0 0.000000]=C2=A0=
=C2=A0 node=C2=A0=C2=A0 0: [mem 0x0000000040000000-0x00000000b7ffffff]<br>[=
=C2=A0=C2=A0=C2=A0 0.000000]=C2=A0=C2=A0 node=C2=A0=C2=A0 0: [mem 0x0000000=
0b8400000-0x00000000bfafffff]<br>[=C2=A0=C2=A0=C2=A0 0.000000] Zeroed struc=
t page in unavailable ranges: 256 pages<br>[=C2=A0=C2=A0=C2=A0 0.000000] In=
itmem setup node 0 [mem 0x0000000040000000-0x00000000bfafffff]<br>[=C2=A0=
=C2=A0=C2=A0 0.000000] psci: probing for conduit method from DT.<br>[=C2=A0=
=C2=A0=C2=A0 0.000000] psci: PSCIv1.1 detected in firmware.<br>[=C2=A0=C2=
=A0=C2=A0 0.000000] psci: Using standard PSCI v0.2 function IDs<br>[=C2=A0=
=C2=A0=C2=A0 0.000000] psci: Trusted OS migration not required<br>[=C2=A0=
=C2=A0=C2=A0 0.000000] psci: SMC Calling Convention v1.1<br>[=C2=A0=C2=A0=
=C2=A0 0.000000] percpu: Embedded 24 pages/cpu s58904 r8192 d31208 u98304<b=
r>[=C2=A0=C2=A0=C2=A0 0.000000] Detected VIPT I-cache on CPU0<br>[=C2=A0=C2=
=A0=C2=A0 0.000000] CPU features: detected: ARM erratum 845719<br>[=C2=A0=
=C2=A0=C2=A0 0.000000] CPU features: detected: GIC system register CPU inte=
rface<br>[=C2=A0=C2=A0=C2=A0 0.000000] Speculative Store Bypass Disable mit=
igation not required<br>[=C2=A0=C2=A0=C2=A0 0.000000] Built 1 zonelists, mo=
bility grouping on.=C2=A0 Total pages: 513812<br>[=C2=A0=C2=A0=C2=A0 0.0000=
00] Policy zone: DMA32<br>[=C2=A0=C2=A0=C2=A0 0.000000] Kernel command line=
: clk_ignore_unused console=3Dttymxc0,115200 root=3D/dev/mmcblk0p2 rootwait=
 rw<br>[=C2=A0=C2=A0=C2=A0 0.000000] Dentry cache hash table entries: 26214=
4 (order: 9, 2097152 bytes, linear)<br>[=C2=A0=C2=A0=C2=A0 0.000000] Inode-=
cache hash table entries: 131072 (order: 8, 1048576 bytes, linear)<br>[=C2=
=A0=C2=A0=C2=A0 0.000000] mem auto-init: stack:off, heap alloc:off, heap fr=
ee:off<br>[=C2=A0=C2=A0=C2=A0 0.000000] Memory: 1035932K/2087936K available=
 (16444K kernel code, 1444K rwdata, 6472K rodata, 2944K init, 1017K bss, 68=
964K reserved, 983040K cma-reserved)<br>[=C2=A0=C2=A0=C2=A0 0.000000] SLUB:=
 HWalign=3D64, Order=3D0-3, MinObjects=3D0, CPUs=3D4, Nodes=3D1<br>[=C2=A0=
=C2=A0=C2=A0 0.000000] rcu: Preemptible hierarchical RCU implementation.<br=
>[=C2=A0=C2=A0=C2=A0 0.000000] rcu:=C2=A0=C2=A0=C2=A0=C2=A0 RCU restricting=
 CPUs from NR_CPUS=3D256 to nr_cpu_ids=3D4.<br>[=C2=A0=C2=A0=C2=A0 0.000000=
]=C2=A0 Tasks RCU enabled.<br>[=C2=A0=C2=A0=C2=A0 0.000000] rcu: RCU calcul=
ated value of scheduler-enlistment delay is 25 jiffies.<br>[=C2=A0=C2=A0=C2=
=A0 0.000000] rcu: Adjusting geometry for rcu_fanout_leaf=3D16, nr_cpu_ids=
=3D4<br>[=C2=A0=C2=A0=C2=A0 0.000000] NR_IRQS: 64, nr_irqs: 64, preallocate=
d irqs: 0<br>[=C2=A0=C2=A0=C2=A0 0.000000] GICv3: GIC: Using split EOI/Deac=
tivate mode<br>[=C2=A0=C2=A0=C2=A0 0.000000] GICv3: 128 SPIs implemented<br=
>[=C2=A0=C2=A0=C2=A0 0.000000] GICv3: 0 Extended SPIs implemented<br>[=C2=
=A0=C2=A0=C2=A0 0.000000] GICv3: Distributor has no Range Selector support<=
br>[=C2=A0=C2=A0=C2=A0 0.000000] GICv3: 16 PPIs implemented<br>[=C2=A0=C2=
=A0=C2=A0 0.000000] GICv3: no VLPI support, no direct LPI support<br>[=C2=
=A0=C2=A0=C2=A0 0.000000] GICv3: CPU0: found redistributor 0 region 0:0x000=
0000038880000<br>[=C2=A0=C2=A0=C2=A0 0.000000] ITS: No ITS available, not e=
nabling LPIs<br>[=C2=A0=C2=A0=C2=A0 0.000000] random: get_random_bytes call=
ed from start_kernel+0x2b8/0x44c with crng_init=3D0<br>[=C2=A0=C2=A0=C2=A0 =
0.000000] arch_timer: cp15 timer(s) running at 8.33MHz (phys).<br>[=C2=A0=
=C2=A0=C2=A0 0.000000] clocksource: arch_sys_counter: mask: 0xfffffffffffff=
f max_cycles: 0x1ec0311ec, max_idle_ns: 440795202152 ns<br>[=C2=A0=C2=A0=C2=
=A0 0.000003] sched_clock: 56 bits at 8MHz, resolution 120ns, wraps every 2=
199023255541ns<br>[=C2=A0=C2=A0=C2=A0 0.000495] Console: colour dummy devic=
e 80x25<br>[=C2=A0=C2=A0=C2=A0 0.000563] Calibrating delay loop (skipped), =
value calculated using timer frequency.. 16.66 BogoMIPS (lpj=3D33333)<br>[=
=C2=A0=C2=A0=C2=A0 0.000572] pid_max: default: 32768 minimum: 301<br>[=C2=
=A0=C2=A0=C2=A0 0.000656] LSM: Security Framework initializing<br>[=C2=A0=
=C2=A0=C2=A0 0.000722] Mount-cache hash table entries: 4096 (order: 3, 3276=
8 bytes, linear)<br>[=C2=A0=C2=A0=C2=A0 0.000737] Mountpoint-cache hash tab=
le entries: 4096 (order: 3, 32768 bytes, linear)<br>[=C2=A0=C2=A0=C2=A0 0.0=
23982] ASID allocator initialised with 32768 entries<br>[=C2=A0=C2=A0=C2=A0=
 0.031985] rcu: Hierarchical SRCU implementation.<br>[=C2=A0=C2=A0=C2=A0 0.=
040943] EFI services will not be available.<br>[=C2=A0=C2=A0=C2=A0 0.048015=
] smp: Bringing up secondary CPUs ...<br>[=C2=A0=C2=A0=C2=A0 0.080185] Dete=
cted VIPT I-cache on CPU1<br>[=C2=A0=C2=A0=C2=A0 0.080212] GICv3: CPU1: fou=
nd redistributor 1 region 0:0x00000000388a0000<br>[=C2=A0=C2=A0=C2=A0 0.080=
237] CPU1: Booted secondary processor 0x0000000001 [0x410fd034]<br>[=C2=A0=
=C2=A0=C2=A0 0.112213] Detected VIPT I-cache on CPU2<br>[=C2=A0=C2=A0=C2=A0=
 0.112229] GICv3: CPU2: found redistributor 2 region 0:0x00000000388c0000<b=
r>[=C2=A0=C2=A0=C2=A0 0.112246] CPU2: Booted secondary processor 0x00000000=
02 [0x410fd034]<br>[=C2=A0=C2=A0=C2=A0 0.144271] Detected VIPT I-cache on C=
PU3<br>[=C2=A0=C2=A0=C2=A0 0.144286] GICv3: CPU3: found redistributor 3 reg=
ion 0:0x00000000388e0000<br>[=C2=A0=C2=A0=C2=A0 0.144305] CPU3: Booted seco=
ndary processor 0x0000000003 [0x410fd034]<br>[=C2=A0=C2=A0=C2=A0 0.144374] =
smp: Brought up 1 node, 4 CPUs<br>[=C2=A0=C2=A0=C2=A0 0.144395] SMP: Total =
of 4 processors activated.<br>[=C2=A0=C2=A0=C2=A0 0.144403] CPU features: d=
etected: 32-bit EL0 Support<br>[=C2=A0=C2=A0=C2=A0 0.144411] CPU features: =
detected: CRC32 instructions<br>[=C2=A0=C2=A0=C2=A0 0.153040] CPU: All CPU(=
s) started at EL2<br>[=C2=A0=C2=A0=C2=A0 0.153065] alternatives: patching k=
ernel code<br>[=C2=A0=C2=A0=C2=A0 0.154645] devtmpfs: initialized<br>[=C2=
=A0=C2=A0=C2=A0 0.161855] clocksource: jiffies: mask: 0xffffffff max_cycles=
: 0xffffffff, max_idle_ns: 7645041785100000 ns<br>[=C2=A0=C2=A0=C2=A0 0.161=
873] futex hash table entries: 1024 (order: 4, 65536 bytes, linear)<br>[=C2=
=A0=C2=A0=C2=A0 0.190302] pinctrl core: initialized pinctrl subsystem<br>[=
=C2=A0=C2=A0=C2=A0 0.191100] DMI not present or invalid.<br>[=C2=A0=C2=A0=
=C2=A0 0.191380] NET: Registered protocol family 16<br>[=C2=A0=C2=A0=C2=A0 =
0.199413] DMA: preallocated 256 KiB pool for atomic allocations<br>[=C2=A0=
=C2=A0=C2=A0 0.199428] audit: initializing netlink subsys (disabled)<br>[=
=C2=A0=C2=A0=C2=A0 0.199558] audit: type=3D2000 audit(0.196:1): state=3Dini=
tialized audit_enabled=3D0 res=3D1<br>[=C2=A0=C2=A0=C2=A0 0.200436] cpuidle=
: using governor menu<br>[=C2=A0=C2=A0=C2=A0 0.200972] hw-breakpoint: found=
 6 breakpoint and 4 watchpoint registers.<br>[=C2=A0=C2=A0=C2=A0 0.201927] =
Serial: AMBA PL011 UART driver<br>[=C2=A0=C2=A0=C2=A0 0.202007] imx mu driv=
er is registered.<br>[=C2=A0=C2=A0=C2=A0 0.202033] imx rpmsg driver is regi=
stered.<br>[=C2=A0=C2=A0=C2=A0 0.206078] imx8mq-pinctrl 30330000.iomuxc: in=
itialized IMX pinctrl driver<br>[=C2=A0=C2=A0=C2=A0 0.233181] HugeTLB regis=
tered 1.00 GiB page size, pre-allocated 0 pages<br>[=C2=A0=C2=A0=C2=A0 0.23=
3192] HugeTLB registered 32.0 MiB page size, pre-allocated 0 pages<br>[=C2=
=A0=C2=A0=C2=A0 0.233200] HugeTLB registered 2.00 MiB page size, pre-alloca=
ted 0 pages<br>[=C2=A0=C2=A0=C2=A0 0.233209] HugeTLB registered 64.0 KiB pa=
ge size, pre-allocated 0 pages<br>[=C2=A0=C2=A0=C2=A0 0.235096] cryptd: max=
_cpu_qlen set to 1000<br>[=C2=A0=C2=A0=C2=A0 0.241165] ACPI: Interpreter di=
sabled.<br>[=C2=A0=C2=A0=C2=A0 0.242067] iommu: Default domain type: Transl=
ated<br>[=C2=A0=C2=A0=C2=A0 0.242209] vgaarb: loaded<br>[=C2=A0=C2=A0=C2=A0=
 0.242552] SCSI subsystem initialized<br>[=C2=A0=C2=A0=C2=A0 0.242922] usbc=
ore: registered new interface driver usbfs<br>[=C2=A0=C2=A0=C2=A0 0.242962]=
 usbcore: registered new interface driver hub<br>[=C2=A0=C2=A0=C2=A0 0.2430=
26] usbcore: registered new device driver usb<br>[=C2=A0=C2=A0=C2=A0 0.2441=
15] mc: Linux media interface: v0.10<br>[=C2=A0=C2=A0=C2=A0 0.244146] video=
dev: Linux video capture interface: v2.00<br>[=C2=A0=C2=A0=C2=A0 0.244224] =
pps_core: LinuxPPS API ver. 1 registered<br>[=C2=A0=C2=A0=C2=A0 0.244231] p=
ps_core: Software ver. 5.3.6 - Copyright 2005-2007 Rodolfo Giometti &lt;gio=
metti@linux.it&gt;<br>[=C2=A0=C2=A0=C2=A0 0.244247] PTP clock support regis=
tered<br>[=C2=A0=C2=A0=C2=A0 0.244396] EDAC MC: Ver: 3.0.0<br>[=C2=A0=C2=A0=
=C2=A0 0.245234] No BMan portals available!<br>[=C2=A0=C2=A0=C2=A0 0.245524=
] QMan: Allocated lookup table at (____ptrval____), entry count 65537<br>[=
=C2=A0=C2=A0=C2=A0 0.245847] No QMan portals available!<br>[=C2=A0=C2=A0=C2=
=A0 0.246332] No USDPAA memory, no &#39;fsl,usdpaa-mem&#39; in device-tree<=
br>[=C2=A0=C2=A0=C2=A0 0.246721] FPGA manager framework<br>[=C2=A0=C2=A0=C2=
=A0 0.246818] Advanced Linux Sound Architecture Driver Initialized.<br>[=C2=
=A0=C2=A0=C2=A0 0.247234] Bluetooth: Core ver 2.22<br>[=C2=A0=C2=A0=C2=A0 0=
.247261] NET: Registered protocol family 31<br>[=C2=A0=C2=A0=C2=A0 0.247268=
] Bluetooth: HCI device and connection manager initialized<br>[=C2=A0=C2=A0=
=C2=A0 0.247280] Bluetooth: HCI socket layer initialized<br>[=C2=A0=C2=A0=
=C2=A0 0.247288] Bluetooth: L2CAP socket layer initialized<br>[=C2=A0=C2=A0=
=C2=A0 0.247302] Bluetooth: SCO socket layer initialized<br>[=C2=A0=C2=A0=
=C2=A0 0.248043] clocksource: Switched to clocksource arch_sys_counter<br>[=
=C2=A0=C2=A0=C2=A0 0.248186] VFS: Disk quotas dquot_6.6.0<br>[=C2=A0=C2=A0=
=C2=A0 0.248244] VFS: Dquot-cache hash table entries: 512 (order 0, 4096 by=
tes)<br>[=C2=A0=C2=A0=C2=A0 0.248438] pnp: PnP ACPI: disabled<br>[=C2=A0=C2=
=A0=C2=A0 0.254681] thermal_sys: Registered thermal governor &#39;step_wise=
&#39;<br>[=C2=A0=C2=A0=C2=A0 0.254683] thermal_sys: Registered thermal gove=
rnor &#39;power_allocator&#39;<br>[=C2=A0=C2=A0=C2=A0 0.254977] NET: Regist=
ered protocol family 2<br>[=C2=A0=C2=A0=C2=A0 0.255332] tcp_listen_portaddr=
_hash hash table entries: 1024 (order: 2, 16384 bytes, linear)<br>[=C2=A0=
=C2=A0=C2=A0 0.255369] TCP established hash table entries: 16384 (order: 5,=
 131072 bytes, linear)<br>[=C2=A0=C2=A0=C2=A0 0.255500] TCP bind hash table=
 entries: 16384 (order: 6, 262144 bytes, linear)<br>[=C2=A0=C2=A0=C2=A0 0.2=
55747] TCP: Hash tables configured (established 16384 bind 16384)<br>[=C2=
=A0=C2=A0=C2=A0 0.255827] UDP hash table entries: 1024 (order: 3, 32768 byt=
es, linear)<br>[=C2=A0=C2=A0=C2=A0 0.255879] UDP-Lite hash table entries: 1=
024 (order: 3, 32768 bytes, linear)<br>[=C2=A0=C2=A0=C2=A0 0.256023] NET: R=
egistered protocol family 1<br>[=C2=A0=C2=A0=C2=A0 0.256465] RPC: Registere=
d named UNIX socket transport module.<br>[=C2=A0=C2=A0=C2=A0 0.256471] RPC:=
 Registered udp transport module.<br>[=C2=A0=C2=A0=C2=A0 0.256476] RPC: Reg=
istered tcp transport module.<br>[=C2=A0=C2=A0=C2=A0 0.256482] RPC: Registe=
red tcp NFSv4.1 backchannel transport module.<br>[=C2=A0=C2=A0=C2=A0 0.2568=
41] PCI: CLS 0 bytes, default 64<br>[=C2=A0=C2=A0=C2=A0 0.257582] hw perfev=
ents: enabled with armv8_cortex_a53 PMU driver, 7 counters available<br>[=
=C2=A0=C2=A0=C2=A0 0.257955] kvm [1]: IPA Size Limit: 40bits<br>[=C2=A0=C2=
=A0=C2=A0 0.259128] kvm [1]: vgic-v2@31020000<br>[=C2=A0=C2=A0=C2=A0 0.2591=
49] kvm [1]: GIC system register CPU interface enabled<br>[=C2=A0=C2=A0=C2=
=A0 0.259216] kvm [1]: vgic interrupt IRQ1<br>[=C2=A0=C2=A0=C2=A0 0.259322]=
 kvm [1]: Hyp mode initialized successfully<br>[=C2=A0=C2=A0=C2=A0 0.265168=
] Initialise system trusted keyrings<br>[=C2=A0=C2=A0=C2=A0 0.265266] worki=
ngset: timestamp_bits=3D44 max_order=3D19 bucket_order=3D0<br>[=C2=A0=C2=A0=
=C2=A0 0.272198] squashfs: version 4.0 (2009/01/31) Phillip Lougher<br>[=C2=
=A0=C2=A0=C2=A0 0.272898] NFS: Registering the id_resolver key type<br>[=C2=
=A0=C2=A0=C2=A0 0.272917] Key type id_resolver registered<br>[=C2=A0=C2=A0=
=C2=A0 0.272923] Key type id_legacy registered<br>[=C2=A0=C2=A0=C2=A0 0.272=
935] nfs4filelayout_init: NFSv4 File Layout Driver Registering...<br>[=C2=
=A0=C2=A0=C2=A0 0.272956] jffs2: version 2.2. (NAND) =C2=A9 2001-2006 Red H=
at, Inc.<br>[=C2=A0=C2=A0=C2=A0 0.273341] 9p: Installing v9fs 9p2000 file s=
ystem support<br>[=C2=A0=C2=A0=C2=A0 0.288879] Key type asymmetric register=
ed<br>[=C2=A0=C2=A0=C2=A0 0.288886] Asymmetric key parser &#39;x509&#39; re=
gistered<br>[=C2=A0=C2=A0=C2=A0 0.288920] Block layer SCSI generic (bsg) dr=
iver version 0.4 loaded (major 244)<br>[=C2=A0=C2=A0=C2=A0 0.288929] io sch=
eduler mq-deadline registered<br>[=C2=A0=C2=A0=C2=A0 0.288936] io scheduler=
 kyber registered<br>[=C2=A0=C2=A0=C2=A0 0.294229] EINJ: ACPI disabled.<br>=
[=C2=A0=C2=A0=C2=A0 0.302727] imx-sdma 302c0000.sdma: Direct firmware load =
for imx/sdma/sdma-imx7d.bin failed with error -2<br>[=C2=A0=C2=A0=C2=A0 0.3=
02741] imx-sdma 302c0000.sdma: Falling back to sysfs fallback for: imx/sdma=
/sdma-imx7d.bin<br>[=C2=A0=C2=A0=C2=A0 0.307933] mxs-dma 33000000.dma-apbh:=
 initialized<br>[=C2=A0=C2=A0=C2=A0 0.311494] Bus freq driver module loaded=
<br>[=C2=A0=C2=A0=C2=A0 0.316331] Serial: 8250/16550 driver, 4 ports, IRQ s=
haring enabled<br>[=C2=A0=C2=A0=C2=A0 0.318483] 30860000.serial: ttymxc0 at=
 MMIO 0x30860000 (irq =3D 30, base_baud =3D 1562500) is a IMX<br>[=C2=A0=C2=
=A0=C2=A0 1.284569] printk: console [ttymxc0] enabled<br>[=C2=A0=C2=A0=C2=
=A0 1.289451] 30880000.serial: ttymxc2 at MMIO 0x30880000 (irq =3D 31, base=
_baud =3D 5000000) is a IMX<br>[=C2=A0=C2=A0=C2=A0 1.307376] imx-dcss 32e00=
000.display-controller: ctxld: can&#39;t get irq number<br>[=C2=A0=C2=A0=C2=
=A0 1.314603] imx-dcss 32e00000.display-controller: submodules initializati=
on failed<br>[=C2=A0=C2=A0=C2=A0 1.322204] imx-dcss 32e00000.display-contro=
ller: master bind failed: -517<br>[=C2=A0=C2=A0=C2=A0 1.339930] loop: modul=
e loaded<br>[=C2=A0=C2=A0=C2=A0 1.345404] imx ahci driver is registered.<br=
>[=C2=A0=C2=A0=C2=A0 1.352453] spi-nor spi3.0: n25q256a (32768 Kbytes)<br>[=
=C2=A0=C2=A0=C2=A0 1.362522] libphy: Fixed MDIO Bus: probed<br>[=C2=A0=C2=
=A0=C2=A0 1.367503] tun: Universal TUN/TAP device driver, 1.6<br>[=C2=A0=C2=
=A0=C2=A0 1.373322] thunder_xcv, ver 1.0<br>[=C2=A0=C2=A0=C2=A0 1.376602] t=
hunder_bgx, ver 1.0<br>[=C2=A0=C2=A0=C2=A0 1.379874] nicpf, ver 1.0<br>[=C2=
=A0=C2=A0=C2=A0 1.383349] pps pps0: new PPS source ptp0<br>[=C2=A0=C2=A0=C2=
=A0 1.393265] libphy: fec_enet_mii_bus: probed<br>[=C2=A0=C2=A0=C2=A0 1.398=
699] fec 30be0000.ethernet eth0: registered PHC device 0<br>[=C2=A0=C2=A0=
=C2=A0 1.405311] Freescale FM module, FMD API version 21.1.0<br>[=C2=A0=C2=
=A0=C2=A0 1.410829] Freescale FM Ports module<br>[=C2=A0=C2=A0=C2=A0 1.4145=
02] fsl_mac: fsl_mac: FSL FMan MAC API based driver<br>[=C2=A0=C2=A0=C2=A0 =
1.420251] fsl_dpa: FSL DPAA Ethernet driver<br>[=C2=A0=C2=A0=C2=A0 1.424736=
] fsl_advanced: FSL DPAA Advanced drivers:<br>[=C2=A0=C2=A0=C2=A0 1.429710]=
 fsl_proxy: FSL DPAA Proxy initialization driver<br>[=C2=A0=C2=A0=C2=A0 1.4=
35400] fsl_oh: FSL FMan Offline Parsing port driver<br>[=C2=A0=C2=A0=C2=A0 =
1.441694] hclge is initializing<br>[=C2=A0=C2=A0=C2=A0 1.445024] hns3: Hisi=
licon Ethernet Network Driver for Hip08 Family - version<br>[=C2=A0=C2=A0=
=C2=A0 1.452256] hns3: Copyright (c) 2017 Huawei Corporation.<br>[=C2=A0=C2=
=A0=C2=A0 1.457620] e1000: Intel(R) PRO/1000 Network Driver - version 7.3.2=
1-k8-NAPI<br>[=C2=A0=C2=A0=C2=A0 1.464675] e1000: Copyright (c) 1999-2006 I=
ntel Corporation.<br>[=C2=A0=C2=A0=C2=A0 1.470463] e1000e: Intel(R) PRO/100=
0 Network Driver - 3.2.6-k<br>[=C2=A0=C2=A0=C2=A0 1.476301] e1000e: Copyrig=
ht(c) 1999 - 2015 Intel Corporation.<br>[=C2=A0=C2=A0=C2=A0 1.482264] igb: =
Intel(R) Gigabit Ethernet Network Driver - version 5.6.0-k<br>[=C2=A0=C2=A0=
=C2=A0 1.489238] igb: Copyright (c) 2007-2014 Intel Corporation.<br>[=C2=A0=
=C2=A0=C2=A0 1.494858] igbvf: Intel(R) Gigabit Virtual Function Network Dri=
ver - version 2.4.0-k<br>[=C2=A0=C2=A0=C2=A0 1.502695] igbvf: Copyright (c)=
 2009 - 2012 Intel Corporation.<br>[=C2=A0=C2=A0=C2=A0 1.508792] sky2: driv=
er version 1.30<br>[=C2=A0=C2=A0=C2=A0 1.513478] VFIO - User Level meta-dri=
ver version: 0.3<br>[=C2=A0=C2=A0=C2=A0 1.521163] ehci_hcd: USB 2.0 &#39;En=
hanced&#39; Host Controller (EHCI) Driver<br>[=C2=A0=C2=A0=C2=A0 1.527703] =
ehci-pci: EHCI PCI platform driver<br>[=C2=A0=C2=A0=C2=A0 1.532212] ehci-pl=
atform: EHCI generic platform driver<br>[=C2=A0=C2=A0=C2=A0 1.537640] ohci_=
hcd: USB 1.1 &#39;Open&#39; Host Controller (OHCI) Driver<br>[=C2=A0=C2=A0=
=C2=A0 1.543840] ohci-pci: OHCI PCI platform driver<br>[=C2=A0=C2=A0=C2=A0 =
1.548325] ohci-platform: OHCI generic platform driver<br>[=C2=A0=C2=A0=C2=
=A0 1.554171] usbcore: registered new interface driver usb-storage<br>[=C2=
=A0=C2=A0=C2=A0 1.560256] usbcore: registered new interface driver usbseria=
l_generic<br>[=C2=A0=C2=A0=C2=A0 1.566814] usbserial: USB Serial support re=
gistered for generic<br>[=C2=A0=C2=A0=C2=A0 1.572853] usbcore: registered n=
ew interface driver ftdi_sio<br>[=C2=A0=C2=A0=C2=A0 1.578624] usbserial: US=
B Serial support registered for FTDI USB Serial Device<br>[=C2=A0=C2=A0=C2=
=A0 1.585969] usbcore: registered new interface driver usb_serial_simple<br=
>[=C2=A0=C2=A0=C2=A0 1.592523] usbserial: USB Serial support registered for=
 carelink<br>[=C2=A0=C2=A0=C2=A0 1.598644] usbserial: USB Serial support re=
gistered for zio<br>[=C2=A0=C2=A0=C2=A0 1.604330] usbserial: USB Serial sup=
port registered for funsoft<br>[=C2=A0=C2=A0=C2=A0 1.610360] usbserial: USB=
 Serial support registered for flashloader<br>[=C2=A0=C2=A0=C2=A0 1.616739]=
 usbserial: USB Serial support registered for google<br>[=C2=A0=C2=A0=C2=A0=
 1.622684] usbserial: USB Serial support registered for libtransistor<br>[=
=C2=A0=C2=A0=C2=A0 1.629236] usbserial: USB Serial support registered for v=
ivopay<br>[=C2=A0=C2=A0=C2=A0 1.635268] usbserial: USB Serial support regis=
tered for moto_modem<br>[=C2=A0=C2=A0=C2=A0 1.641562] usbserial: USB Serial=
 support registered for motorola_tetra<br>[=C2=A0=C2=A0=C2=A0 1.648209] usb=
serial: USB Serial support registered for novatel_gps<br>[=C2=A0=C2=A0=C2=
=A0 1.654590] usbserial: USB Serial support registered for hp4x<br>[=C2=A0=
=C2=A0=C2=A0 1.660367] usbserial: USB Serial support registered for suunto<=
br>[=C2=A0=C2=A0=C2=A0 1.666312] usbserial: USB Serial support registered f=
or siemens_mpi<br>[=C2=A0=C2=A0=C2=A0 1.675516] input: 30370000.snvs:snvs-p=
owerkey as /devices/platform/soc@0/soc@0:bus@30000000/30370000.snvs/3037000=
0.snvs:snvs-powerkey/input/input0<br>[=C2=A0=C2=A0=C2=A0 1.690752] snvs_rtc=
 30370000.snvs:snvs-rtc-lp: registered as rtc0<br>[=C2=A0=C2=A0=C2=A0 1.697=
045] i2c /dev entries driver<br>[=C2=A0=C2=A0=C2=A0 1.701173] mxc-mipi-csi2=
_yav 30a70000.mipi_csi1: mipi_csi2_probe<br>[=C2=A0=C2=A0=C2=A0 1.707327] m=
xc-mipi-csi2_yav 30a70000.mipi_csi: Remote device at endpoint@0 XXX found<b=
r>[=C2=A0=C2=A0=C2=A0 1.715266] mxc-mipi-csi2_yav 30a70000.mipi_csi1: lanes=
: 2, name: mxc-mipi-csi2.0<br>[=C2=A0=C2=A0=C2=A0 1.722969] mxc-mipi-csi2_y=
av 30b60000.mipi_csi2: mipi_csi2_probe<br>[=C2=A0=C2=A0=C2=A0 1.729120] mxc=
-mipi-csi2_yav 30b60000.mipi_csi: Remote device at endpoint@0 XXX found<br>=
[=C2=A0=C2=A0=C2=A0 1.737059] mxc-mipi-csi2_yav 30b60000.mipi_csi2: lanes: =
2, name: mxc-mipi-csi2.1<br>[=C2=A0=C2=A0=C2=A0 1.744795] mx6s-csi 30a90000=
.csi1_bridge: initialising<br>[=C2=A0=C2=A0=C2=A0 1.750232] CSI: Registered=
 sensor subdevice: mxc-mipi-csi2.0<br>[=C2=A0=C2=A0=C2=A0 1.756065] mx6s-cs=
i 30b80000.csi2_bridge: initialising<br>[=C2=A0=C2=A0=C2=A0 1.761479] CSI: =
Registered sensor subdevice: mxc-mipi-csi2.1<br>[=C2=A0=C2=A0=C2=A0 1.76986=
9] imx2-wdt 30280000.watchdog: timeout 60 sec (nowayout=3D0)<br>[=C2=A0=C2=
=A0=C2=A0 1.776453] Bluetooth: HCI UART driver ver 2.3<br>[=C2=A0=C2=A0=C2=
=A0 1.780914] Bluetooth: HCI UART protocol H4 registered<br>[=C2=A0=C2=A0=
=C2=A0 1.786066] Bluetooth: HCI UART protocol BCSP registered<br>[=C2=A0=C2=
=A0=C2=A0 1.791407] Bluetooth: HCI UART protocol LL registered<br>[=C2=A0=
=C2=A0=C2=A0 1.796557] Bluetooth: HCI UART protocol ATH3K registered<br>[=
=C2=A0=C2=A0=C2=A0 1.801988] Bluetooth: HCI UART protocol Three-wire (H5) r=
egistered<br>[=C2=A0=C2=A0=C2=A0 1.808351] Bluetooth: HCI UART protocol Bro=
adcom registered<br>[=C2=A0=C2=A0=C2=A0 1.814040] Bluetooth: HCI UART proto=
col QCA registered<br>[=C2=A0=C2=A0=C2=A0 1.821640] sdhci: Secure Digital H=
ost Controller Interface driver<br>[=C2=A0=C2=A0=C2=A0 1.827831] sdhci: Cop=
yright(c) Pierre Ossman<br>[=C2=A0=C2=A0=C2=A0 1.832406] Synopsys Designwar=
e Multimedia Card Interface Driver<br>[=C2=A0=C2=A0=C2=A0 1.839083] sdhci-p=
ltfm: SDHCI platform and OF driver helper<br>[=C2=A0=C2=A0=C2=A0 1.847135] =
ledtrig-cpu: registered to indicate activity on CPUs<br>[=C2=A0=C2=A0=C2=A0=
 1.854303] caam 30900000.crypto: device ID =3D 0x0a16040100000000 (Era 9)<b=
r>[=C2=A0=C2=A0=C2=A0 1.861021] caam 30900000.crypto: job rings =3D 2, qi =
=3D 0<br>[=C2=A0=C2=A0=C2=A0 1.885558] caam algorithms registered in /proc/=
crypto<br>[=C2=A0=C2=A0=C2=A0 1.892931] caam 30900000.crypto: caam pkc algo=
rithms registered in /proc/crypto<br>[=C2=A0=C2=A0=C2=A0 1.902488] caam_jr =
30901000.jr: registering rng-caam<br>[=C2=A0=C2=A0=C2=A0 1.916809] caam-snv=
s 30370000.caam-snvs: can&#39;t get snvs clock<br>[=C2=A0=C2=A0=C2=A0 1.922=
688] caam-snvs 30370000.caam-snvs: violation handlers armed - non-secure st=
ate<br>[=C2=A0=C2=A0=C2=A0 1.931206] usbcore: registered new interface driv=
er usbhid<br>[=C2=A0=C2=A0=C2=A0 1.936838] usbhid: USB HID core driver<br>[=
=C2=A0=C2=A0=C2=A0 1.942169] No fsl,qman node<br>[=C2=A0=C2=A0=C2=A0 1.9450=
66] Freescale USDPAA process driver<br>[=C2=A0=C2=A0=C2=A0 1.949257] fsl-us=
dpaa: no region found<br>[=C2=A0=C2=A0=C2=A0 1.953100] Freescale USDPAA pro=
cess IRQ driver<br>[=C2=A0=C2=A0=C2=A0 1.961015] optee: probing for conduit=
 method from DT.<br>[=C2=A0=C2=A0=C2=A0 1.966195] optee: revision 3.7 (7a49=
776d)<br>[=C2=A0=C2=A0=C2=A0 1.966406] optee: dynamic shared memory is enab=
led<br>[=C2=A0=C2=A0=C2=A0 1.975618] optee: initialized driver<br>[=C2=A0=
=C2=A0=C2=A0 1.982779] wm8524-codec audio-codec: Failed to get mute line: -=
517<br>[=C2=A0=C2=A0=C2=A0 2.059611] imx-spdif sound-spdif: snd-soc-dummy-d=
ai &lt;-&gt; 30810000.spdif mapping ok<br>[=C2=A0=C2=A0=C2=A0 2.067221] imx=
-spdif sound-spdif: ASoC: no DMI vendor name!<br>[=C2=A0=C2=A0=C2=A0 2.0753=
23] imx-spdif sound-hdmi-arc: snd-soc-dummy-dai &lt;-&gt; 308a0000.spdif ma=
pping ok<br>[=C2=A0=C2=A0=C2=A0 2.083184] imx-spdif sound-hdmi-arc: ASoC: n=
o DMI vendor name!<br>[=C2=A0=C2=A0=C2=A0 2.090242] imx-ak4458 sound-ak4458=
: ASoC: failed to init link ak4458: -517<br>[=C2=A0=C2=A0=C2=A0 2.097228] i=
mx-ak4458 sound-ak4458: snd_soc_register_card failed (-517)<br>[=C2=A0=C2=
=A0=C2=A0 2.104197] imx-ak5558 sound-ak5558: ASoC: failed to init link ak55=
58: -517<br>[=C2=A0=C2=A0=C2=A0 2.111174] imx-ak5558 sound-ak5558: snd_soc_=
register_card failed (-517)<br>[=C2=A0=C2=A0=C2=A0 2.118525] imx-cdnhdmi so=
und-hdmi: ASoC: failed to init link imx8 hdmi: -517<br>[=C2=A0=C2=A0=C2=A0 =
2.125679] imx-cdnhdmi sound-hdmi: snd_soc_register_card failed (-517)<br>[=
=C2=A0=C2=A0=C2=A0 2.132548] pktgen: Packet Generator for packet performanc=
e testing. Version: 2.75<br>[=C2=A0=C2=A0=C2=A0 2.140668] NET: Registered p=
rotocol family 26<br>[=C2=A0=C2=A0=C2=A0 2.145780] NET: Registered protocol=
 family 10<br>[=C2=A0=C2=A0=C2=A0 2.150963] Segment Routing with IPv6<br>[=
=C2=A0=C2=A0=C2=A0 2.154698] NET: Registered protocol family 17<br>[=C2=A0=
=C2=A0=C2=A0 2.159246] Bluetooth: RFCOMM TTY layer initialized<br>[=C2=A0=
=C2=A0=C2=A0 2.164141] Bluetooth: RFCOMM socket layer initialized<br>[=C2=
=A0=C2=A0=C2=A0 2.169313] Bluetooth: RFCOMM ver 1.11<br>[=C2=A0=C2=A0=C2=A0=
 2.173079] Bluetooth: BNEP (Ethernet Emulation) ver 1.3<br>[=C2=A0=C2=A0=C2=
=A0 2.178400] Bluetooth: BNEP filters: protocol multicast<br>[=C2=A0=C2=A0=
=C2=A0 2.183641] Bluetooth: BNEP socket layer initialized<br>[=C2=A0=C2=A0=
=C2=A0 2.188614] Bluetooth: HIDP (Human Interface Emulation) ver 1.2<br>[=
=C2=A0=C2=A0=C2=A0 2.194546] Bluetooth: HIDP socket layer initialized<br>[=
=C2=A0=C2=A0=C2=A0 2.199551] 8021q: 802.1Q VLAN Support v1.8<br>[=C2=A0=C2=
=A0=C2=A0 2.203760] lib80211: common routines for IEEE802.11 drivers<br>[=
=C2=A0=C2=A0=C2=A0 2.209538] 9pnet: Installing 9P2000 support<br>[=C2=A0=C2=
=A0=C2=A0 2.213846] tsn generic netlink module v1 init...<br>[=C2=A0=C2=A0=
=C2=A0 2.218616] Key type dns_resolver registered<br>[=C2=A0=C2=A0=C2=A0 2.=
223334] registered taskstats version 1<br>[=C2=A0=C2=A0=C2=A0 2.227450] Loa=
ding compiled-in X.509 certificates<br>[=C2=A0=C2=A0=C2=A0 2.252874] GPIO l=
ine 157 (wl-reg-on) hogged as output/high<br>[=C2=A0=C2=A0=C2=A0 2.260890] =
ov5640_mipi 0-003c: No sensor reset pin available<br>[=C2=A0=C2=A0=C2=A0 2.=
266679] ov5640_mipi 0-003c: 0-003c supply DOVDD not found, using dummy regu=
lator<br>[=C2=A0=C2=A0=C2=A0 2.274488] ov5640_mipi 0-003c: 0-003c supply DV=
DD not found, using dummy regulator<br>[=C2=A0=C2=A0=C2=A0 2.282216] ov5640=
_mipi 0-003c: 0-003c supply AVDD not found, using dummy regulator<br>[=C2=
=A0=C2=A0=C2=A0 2.300363] ov5640_mipi 0-003c: Read reg error: reg=3D300a<br=
>[=C2=A0=C2=A0=C2=A0 2.305688] ov5640_mipi 0-003c: Camera is not found<br>[=
=C2=A0=C2=A0=C2=A0 2.312187] pfuze100-regulator 0-0008: Full layer: 2, Meta=
l layer: 1<br>[=C2=A0=C2=A0=C2=A0 2.319167] pfuze100-regulator 0-0008: FAB:=
 0, FIN: 0<br>[=C2=A0=C2=A0=C2=A0 2.324243] pfuze100-regulator 0-0008: pfuz=
e100 found.<br>[=C2=A0=C2=A0=C2=A0 2.346402] i2c i2c-0: IMX I2C adapter reg=
istered<br>[=C2=A0=C2=A0=C2=A0 2.351961] ov5640_mipi 1-003c: No sensor rese=
t pin available<br>[=C2=A0=C2=A0=C2=A0 2.357752] ov5640_mipi 1-003c: 1-003c=
 supply DOVDD not found, using dummy regulator<br>[=C2=A0=C2=A0=C2=A0 2.365=
561] ov5640_mipi 1-003c: 1-003c supply DVDD not found, using dummy regulato=
r<br>[=C2=A0=C2=A0=C2=A0 2.373270] ov5640_mipi 1-003c: 1-003c supply AVDD n=
ot found, using dummy regulator<br>[=C2=A0=C2=A0=C2=A0 2.425516] random: fa=
st init done<br>[=C2=A0=C2=A0=C2=A0 3.552073] mxc-mipi-csi2_yav 30a70000.mi=
pi_csi: Registered sensor subdevice: ov5640_mipi 1-003c<br>[=C2=A0=C2=A0=C2=
=A0 3.562103] ov5640_mipi 1-003c: Camera is found<br>[=C2=A0=C2=A0=C2=A0 3.=
566692] i2c i2c-1: IMX I2C adapter registered<br>[=C2=A0=C2=A0=C2=A0 3.5722=
25] ak4458 2-0010: 2-0010 supply DVDD not found, using dummy regulator<br>[=
=C2=A0=C2=A0=C2=A0 3.579503] ak4458 2-0010: 2-0010 supply AVDD not found, u=
sing dummy regulator<br>[=C2=A0=C2=A0=C2=A0 3.587128] ak4458 2-0012: 2-0012=
 supply DVDD not found, using dummy regulator<br>[=C2=A0=C2=A0=C2=A0 3.5944=
28] ak4458 2-0012: 2-0012 supply AVDD not found, using dummy regulator<br>[=
=C2=A0=C2=A0=C2=A0 3.602034] ak5558 2-0013: 2-0013 supply DVDD not found, u=
sing dummy regulator<br>[=C2=A0=C2=A0=C2=A0 3.609309] ak5558 2-0013: 2-0013=
 supply AVDD not found, using dummy regulator<br>[=C2=A0=C2=A0=C2=A0 3.6169=
42] ak4458 2-0011: 2-0011 supply DVDD not found, using dummy regulator<br>[=
=C2=A0=C2=A0=C2=A0 3.624222] ak4458 2-0011: 2-0011 supply AVDD not found, u=
sing dummy regulator<br>[=C2=A0=C2=A0=C2=A0 3.631567] i2c i2c-2: IMX I2C ad=
apter registered<br>[=C2=A0=C2=A0=C2=A0 3.636791] imx8mq-usb-phy 381f0040.u=
sb-phy: 381f0040.usb-phy supply vbus not found, using dummy regulator<br>[=
=C2=A0=C2=A0=C2=A0 3.646740] imx8mq-usb-phy 382f0040.usb-phy: 382f0040.usb-=
phy supply vbus not found, using dummy regulator<br>[=C2=A0=C2=A0=C2=A0 3.6=
58518] imx6q-pcie 33c00000.pcie: couldn&#39;t get pcie-phy<br>[=C2=A0=C2=A0=
=C2=A0 3.664266] imx6q-pcie 33c00000.pcie: 33c00000.pcie supply epdev_on no=
t found, using dummy regulator<br>[=C2=A0=C2=A0=C2=A0 3.664780] [drm] Suppo=
rts vblank timestamp caching Rev 2 (21.10.2013).<br>[=C2=A0=C2=A0=C2=A0 3.6=
73673] imx6q-pcie 33c00000.pcie: host bridge /soc@0/pcie@33c00000 ranges:<b=
r>[=C2=A0=C2=A0=C2=A0 3.680040] [drm] No driver support for vblank timestam=
p query.<br>[=C2=A0=C2=A0=C2=A0 3.680581] cdns-mhdp-imx 32c00000.hdmi: lane=
-mapping 0xe4<br>[=C2=A0=C2=A0=C2=A0 3.687274] imx6q-pcie 33c00000.pcie:=C2=
=A0=C2=A0 No bus range found for /soc@0/pcie@33c00000, using [bus 00-ff]<br=
>[=C2=A0=C2=A0=C2=A0 3.687304] imx6q-pcie 33c00000.pcie:=C2=A0=C2=A0=C2=A0 =
IO 0x27f80000..0x27f8ffff -&gt; 0x00000000<br>[=C2=A0=C2=A0=C2=A0 3.695218]=
 imx-dcss 32e00000.display-controller: bound 32c00000.hdmi (ops cdns_mhdp_i=
mx_ops)<br>[=C2=A0=C2=A0=C2=A0 3.698706] imx6q-pcie 33c00000.pcie:=C2=A0=C2=
=A0 MEM 0x20000000..0x27efffff -&gt; 0x20000000<br>[=C2=A0=C2=A0=C2=A0 3.70=
8361] [drm] Initialized imx-dcss 1.0.0 20190917 for 32e00000.display-contro=
ller on minor 0<br>[=C2=A0=C2=A0=C2=A0 3.765728] cdns-mhdp-imx 32c00000.hdm=
i: 0,ff,ff,ff,ff,ff,ff,0<br>[=C2=A0=C2=A0=C2=A0 3.803626] cdns-mhdp-imx 32c=
00000.hdmi: 0,ff,ff,ff,ff,ff,ff,0<br>[=C2=A0=C2=A0=C2=A0 3.804589] [drm] Mo=
de: 1920x1080p148500<br>[=C2=A0=C2=A0=C2=A0 3.820087] imx6q-pcie 33c00000.p=
cie: PCIe PLL locked after 0 us.<br>[=C2=A0=C2=A0=C2=A0 3.832073] [drm] Pix=
el clock: 148500 KHz, character clock: 222750, bpc is 12-bit.<br>[=C2=A0=C2=
=A0=C2=A0 3.832079] [drm] VCO frequency is 4455000 KHz<br>[=C2=A0=C2=A0=C2=
=A0 3.909255] [drm] Sink Not Support SCDC<br>[=C2=A0=C2=A0=C2=A0 3.910487] =
[drm] No vendor infoframe<br>[=C2=A0=C2=A0=C2=A0 4.006715] Console: switchi=
ng to colour frame buffer device 240x67<br>[=C2=A0=C2=A0=C2=A0 4.080055] im=
x-dcss 32e00000.display-controller: fb0: imx-dcssdrmfb frame buffer device<=
br>[=C2=A0=C2=A0=C2=A0 4.089306] OF: graph: no port node found in /soc@0/us=
b-phy@381f0040<br>[=C2=A0=C2=A0=C2=A0 4.096786] xhci-hcd xhci-hcd.1.auto: x=
HCI Host Controller<br>[=C2=A0=C2=A0=C2=A0 4.102300] xhci-hcd xhci-hcd.1.au=
to: new USB bus registered, assigned bus number 1<br>[=C2=A0=C2=A0=C2=A0 4.=
110086] xhci-hcd xhci-hcd.1.auto: hcc params 0x0220fe6c hci version 0x110 q=
uirks 0x0000000001010010<br>[=C2=A0=C2=A0=C2=A0 4.119550] xhci-hcd xhci-hcd=
.1.auto: irq 53, io mem 0x38200000<br>[=C2=A0=C2=A0=C2=A0 4.126219] hub 1-0=
:1.0: USB hub found<br>[=C2=A0=C2=A0=C2=A0 4.130021] hub 1-0:1.0: 1 port de=
tected<br>[=C2=A0=C2=A0=C2=A0 4.134215] xhci-hcd xhci-hcd.1.auto: xHCI Host=
 Controller<br>[=C2=A0=C2=A0=C2=A0 4.139723] xhci-hcd xhci-hcd.1.auto: new =
USB bus registered, assigned bus number 2<br>[=C2=A0=C2=A0=C2=A0 4.147415] =
xhci-hcd xhci-hcd.1.auto: Host supports USB 3.0 SuperSpeed<br>[=C2=A0=C2=A0=
=C2=A0 4.154014] usb usb2: We don&#39;t know the algorithms for LPM for thi=
s host, disabling LPM.<br>[=C2=A0=C2=A0=C2=A0 4.162561] hub 2-0:1.0: USB hu=
b found<br>[=C2=A0=C2=A0=C2=A0 4.166346] hub 2-0:1.0: 1 port detected<br>[=
=C2=A0=C2=A0=C2=A0 4.171452] imx-cpufreq-dt imx-cpufreq-dt: cpu speed grade=
 3 mkt segment 0 supported-hw 0x8 0x1<br>[=C2=A0=C2=A0=C2=A0 4.182246] sdhc=
i-esdhc-imx 30b50000.mmc: Got CD GPIO<br>[=C2=A0=C2=A0=C2=A0 4.216897] mmc1=
: SDHCI controller on 30b50000.mmc [30b50000.mmc] using ADMA<br>[=C2=A0=C2=
=A0=C2=A0 4.226780] galcore: clk_get 2d core clock failed, disable 2d/vg!<b=
r>[=C2=A0=C2=A0=C2=A0 4.233248] Galcore version 6.4.0.234062<br>[=C2=A0=C2=
=A0=C2=A0 4.347584] hantrodec: module inserted. Major =3D 236<br>[=C2=A0=C2=
=A0=C2=A0 4.354696] debugfs: Directory &#39;308b0000.sai&#39; with parent &=
#39;wm8524-audio&#39; already present!<br>[=C2=A0=C2=A0=C2=A0 4.363020] aso=
c-simple-card sound-wm8524: wm8524-hifi &lt;-&gt; 308b0000.sai mapping ok<b=
r>[=C2=A0=C2=A0=C2=A0 4.370644] asoc-simple-card sound-wm8524: ASoC: no DMI=
 vendor name!<br>[=C2=A0=C2=A0=C2=A0 4.382398] ak4458 2-0010: ASoC: failed =
to probe component -6<br>[=C2=A0=C2=A0=C2=A0 4.388215] imx-ak4458 sound-ak4=
458: ASoC: failed to instantiate card -6<br>[=C2=A0=C2=A0=C2=A0 4.395010] i=
mx-ak4458 sound-ak4458: snd_soc_register_card failed (-6)<br>[=C2=A0=C2=A0=
=C2=A0 4.402517] ak5558 2-0013: ASoC: failed to probe component -6<br>[=C2=
=A0=C2=A0=C2=A0 4.408350] imx-ak5558 sound-ak5558: ASoC: failed to instanti=
ate card -6<br>[=C2=A0=C2=A0=C2=A0 4.415140] imx-ak5558 sound-ak5558: snd_s=
oc_register_card failed (-6)<br>[=C2=A0=C2=A0=C2=A0 4.422590] debugfs: Dire=
ctory &#39;30050000.sai&#39; with parent &#39;imx-audio-hdmi&#39; already p=
resent!<br>[=C2=A0=C2=A0=C2=A0 4.431068] imx-cdnhdmi sound-hdmi: i2s-hifi &=
lt;-&gt; 30050000.sai mapping ok<br>[=C2=A0=C2=A0=C2=A0 4.437846] imx-cdnhd=
mi sound-hdmi: ASoC: no DMI vendor name!<br>[=C2=A0=C2=A0=C2=A0 4.443694] d=
ebugfs: File &#39;Capture&#39; in directory &#39;dapm&#39; already present!=
<br>[=C2=A0=C2=A0=C2=A0 4.458915] mmc1: host does not support reading read-=
only switch, assuming write-enable<br>[=C2=A0=C2=A0=C2=A0 4.468073] usb 1-1=
: new high-speed USB device number 2 using xhci-hcd<br>[=C2=A0=C2=A0=C2=A0 =
4.471829] imx6q-pcie 33800000.pcie: couldn&#39;t get pcie-phy<br>[=C2=A0=C2=
=A0=C2=A0 4.480204] snvs_rtc 30370000.snvs:snvs-rtc-lp: setting system cloc=
k to 1970-01-01T00:00:02 UTC (2)<br>[=C2=A0=C2=A0=C2=A0 4.480280] imx6q-pci=
e 33800000.pcie: 33800000.pcie supply epdev_on not found, using dummy regul=
ator<br>[=C2=A0=C2=A0=C2=A0 4.489624] cfg80211: Loading compiled-in X.509 c=
ertificates for regulatory database<br>[=C2=A0=C2=A0=C2=A0 4.498627] imx6q-=
pcie 33800000.pcie: host bridge /soc@0/pcie@33800000 ranges:<br>[=C2=A0=C2=
=A0=C2=A0 4.508221] cfg80211: Loaded X.509 cert &#39;sforshee: 00b28ddf47ae=
f9cea7&#39;<br>[=C2=A0=C2=A0=C2=A0 4.513396] imx6q-pcie 33800000.pcie:=C2=
=A0=C2=A0=C2=A0 IO 0x1ff80000..0x1ff8ffff -&gt; 0x00000000<br>[=C2=A0=C2=A0=
=C2=A0 4.519977] platform regulatory.0: Direct firmware load for regulatory=
.db failed with error -2<br>[=C2=A0=C2=A0=C2=A0 4.527318] imx6q-pcie 338000=
00.pcie:=C2=A0=C2=A0 MEM 0x18000000..0x1fefffff -&gt; 0x18000000<br>[=C2=A0=
=C2=A0=C2=A0 4.535919] clk: Not disabling unused clocks<br>[=C2=A0=C2=A0=C2=
=A0 4.547613] platform regulatory.0: Falling back to sysfs fallback for: re=
gulatory.db<br>[=C2=A0=C2=A0=C2=A0 4.555454] ALSA device list:<br>[=C2=A0=
=C2=A0=C2=A0 4.558454]=C2=A0=C2=A0 #0: imx-spdif<br>[=C2=A0=C2=A0=C2=A0 4.5=
61258]=C2=A0=C2=A0 #1: imx-hdmi-arc<br>[=C2=A0=C2=A0=C2=A0 4.564320]=C2=A0=
=C2=A0 #2: wm8524-audio<br>[=C2=A0=C2=A0=C2=A0 4.567377]=C2=A0=C2=A0 #3: im=
x-audio-hdmi<br>[=C2=A0=C2=A0=C2=A0 4.570139] hub 1-1:1.0: USB hub found<br=
>[=C2=A0=C2=A0=C2=A0 4.574405] hub 1-1:1.0: 4 ports detected<br>[=C2=A0=C2=
=A0=C2=A0 4.580058] mmc1: new ultra high speed DDR50 SDHC card at address a=
aaa<br>[=C2=A0=C2=A0=C2=A0 4.587027] mmcblk1: mmc1:aaaa SS32G 29.7 GiB<br>[=
=C2=A0=C2=A0=C2=A0 4.600114]=C2=A0 mmcblk1: p1 p2<br>[=C2=A0=C2=A0=C2=A0 4.=
648111] imx6q-pcie 33800000.pcie: PCIe PLL locked after 0 us.<br>[=C2=A0=C2=
=A0=C2=A0 4.752076] imx6q-pcie 33800000.pcie: Link up<br>[=C2=A0=C2=A0=C2=
=A0 4.756448] imx6q-pcie 33800000.pcie: Link up<br>[=C2=A0=C2=A0=C2=A0 4.76=
0824] imx6q-pcie 33800000.pcie: Link up, Gen1<br>[=C2=A0=C2=A0=C2=A0 4.7659=
35] imx6q-pcie 33800000.pcie: PCI host bridge to bus 0000:00<br>[=C2=A0=C2=
=A0=C2=A0 4.772298] pci_bus 0000:00: root bus resource [bus 00-ff]<br>[=C2=
=A0=C2=A0=C2=A0 4.777805] pci_bus 0000:00: root bus resource [io=C2=A0 0x10=
000-0x1ffff] (bus address [0x0000-0xffff])<br>[=C2=A0=C2=A0=C2=A0 4.786779]=
 pci_bus 0000:00: root bus resource [mem 0x18000000-0x1fefffff]<br>[=C2=A0=
=C2=A0=C2=A0 4.793679] pci 0000:00:00.0: [16c3:abcd] type 01 class 0x060400=
<br>[=C2=A0=C2=A0=C2=A0 4.799718] pci 0000:00:00.0: reg 0x10: [mem 0x000000=
00-0x000fffff]<br>[=C2=A0=C2=A0=C2=A0 4.805999] pci 0000:00:00.0: reg 0x38:=
 [mem 0x00000000-0x0000ffff pref]<br>[=C2=A0=C2=A0=C2=A0 4.812752] pci 0000=
:00:00.0: supports D1<br>[=C2=A0=C2=A0=C2=A0 4.816767] pci 0000:00:00.0: PM=
E# supported from D0 D1 D3hot D3cold<br>[=C2=A0=C2=A0=C2=A0 4.825074] pci 0=
000:01:00.0: [168c:003e] type 00 class 0x028000<br>[=C2=A0=C2=A0=C2=A0 4.82=
7406] imx6q-pcie 33c00000.pcie: Phy link never came up<br>[=C2=A0=C2=A0=C2=
=A0 4.831176] pci 0000:01:00.0: reg 0x10: [mem 0x00000000-0x001fffff 64bit]=
<br>[=C2=A0=C2=A0=C2=A0 4.836797] imx6q-pcie 33c00000.pcie: failed to initi=
alize host<br>[=C2=A0=C2=A0=C2=A0 4.843880] pci 0000:01:00.0: PME# supporte=
d from D0 D3hot D3cold<br>[=C2=A0=C2=A0=C2=A0 4.849477] imx6q-pcie 33c00000=
.pcie: unable to add pcie port.<br>[=C2=A0=C2=A0=C2=A0 4.865657] pci 0000:0=
0:00.0: BAR 14: assigned [mem 0x18000000-0x181fffff]<br>[=C2=A0=C2=A0=C2=A0=
 4.872543] pci 0000:00:00.0: BAR 0: assigned [mem 0x18200000-0x182fffff]<br=
>[=C2=A0=C2=A0=C2=A0 4.879341] pci 0000:00:00.0: BAR 6: assigned [mem 0x183=
00000-0x1830ffff pref]<br>[=C2=A0=C2=A0=C2=A0 4.886574] pci 0000:01:00.0: B=
AR 0: assigned [mem 0x18000000-0x181fffff 64bit]<br>[=C2=A0=C2=A0=C2=A0 4.8=
93914] pci 0000:00:00.0: PCI bridge to [bus 01-ff]<br>[=C2=A0=C2=A0=C2=A0 4=
.899148] pci 0000:00:00.0:=C2=A0=C2=A0 bridge window [mem 0x18000000-0x181f=
ffff]<br>[=C2=A0=C2=A0=C2=A0 4.906263] pcieport 0000:00:00.0: PME: Signalin=
g with IRQ 231<br>[=C2=A0=C2=A0=C2=A0 4.912315] pcieport 0000:00:00.0: AER:=
 enabled with IRQ 231<br>[=C2=A0=C2=A0=C2=A0 4.918292] Waiting for root dev=
ice /dev/mmcblk0p2...<br>[=C2=A0=C2=A0=C2=A0 4.968080] usb 1-1.2: new high-=
speed USB device number 3 using xhci-hcd<br>[=C2=A0=C2=A0=C2=A0 5.248053] u=
sb 1-1.4: new low-speed USB device number 4 using xhci-hcd<br>[=C2=A0=C2=A0=
=C2=A0 5.532467] input: PixArt USB Optical Mouse as /devices/platform/soc@0=
/38200000.usb/xhci-hcd.1.auto/usb1/1-1/1-1.4/1-1.4:1.0/0003:093A:2510.0001/=
input/input1<br>[=C2=A0=C2=A0=C2=A0 5.546652] hid-generic 0003:093A:2510.00=
01: input: USB HID v1.11 Mouse [PixArt USB Optical Mouse] on usb-xhci-hcd.1=
.auto-1.4/input0<br>[=C2=A0=C2=A0 35.808082] vdd_arm: disabling<br>[=C2=A0=
=C2=A0 35.811158] VGEN1: disabling<br>[=C2=A0=C2=A0 35.814747] VGEN6: disab=
ling<br>[=C2=A0=C2=A0 60.384106] imx-sdma 30bd0000.sdma: external firmware =
not found, using ROM firmware<br>[=C2=A0=C2=A0 60.384226] imx-sdma 302c0000=
.sdma: Direct firmware load for imx/sdma/sdma-imx7d.bin failed with error -=
2<br>[=C2=A0=C2=A0 60.401363] imx-sdma 302c0000.sdma: Falling back to sysfs=
 fallback for: imx/sdma/sdma-imx7d.bin<br>[=C2=A0=C2=A0 61.544094] random: =
crng init done<br>[=C2=A0=C2=A0 66.528146] cfg80211: failed to load regulat=
ory.db<br><div>[=C2=A0 121.824100] imx-sdma 302c0000.sdma: external firmwar=
e not found, using ROM firmware</div><div><br></div><div><br></div><br>On T=
hursday, August 6, 2020 at 6:52:17 AM UTC+5:30, Peng Fan wrote:<blockquote =
class=3D"gmail_quote" style=3D"margin: 0;margin-left: 0.8ex;border-left: 1p=
x #ccc solid;padding-left: 1ex;"><div dir=3D"ltr"><div dir=3D"ltr"><br></di=
v><br><div class=3D"gmail_quote"><div dir=3D"ltr">Vipul Suneja &lt;<a href=
=3D"javascript:" target=3D"_blank" gdf-obfuscated-mailto=3D"dNty2DPpBAAJ" r=
el=3D"nofollow" onmousedown=3D"this.href=3D&#39;javascript:&#39;;return tru=
e;" onclick=3D"this.href=3D&#39;javascript:&#39;;return true;">vsun...@gmai=
l.com</a>&gt; =E4=BA=8E2020=E5=B9=B48=E6=9C=885=E6=97=A5=E5=91=A8=E4=B8=89 =
=E4=B8=8B=E5=8D=884:48=E5=86=99=E9=81=93=EF=BC=9A<br></div><blockquote clas=
s=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid r=
gb(204,204,204);padding-left:1ex"><div dir=3D"ltr"><div><br></div><div>=C2=
=A0=C2=A0=C2=A0=C2=A0 Target: imx8mq evk</div><div>=C2=A0=C2=A0=C2=A0=C2=A0=
 bsp: 5.4.24</div><div>=C2=A0=C2=A0=C2=A0=C2=A0 <br></div><div>=C2=A0=C2=A0=
=C2=A0=C2=A0 Created &amp; started linux cell. Does it maintain separate ro=
otfs? How to run a binary in this 2nd linux (in dedicated CPU)? I didn&#39;=
t found initrd.img, didn&#39;t include in the below given command.</div><di=
v>=C2=A0=C2=A0=C2=A0 <br></div><div><b>=C2=A0=C2=A0=C2=A0=C2=A0 jailhouse c=
ell linux /usr/share/jailhouse/cells/<wbr>imx8mq-linux-demo.cell /run/media=
/mmcblk1p1/Image -d /run/media/mmcblk1p1/imx8mq-<wbr>evk-inmate.dtb -c &quo=
t;clk_ignore_unused console=3Dttymxc0,115200 earlycon=3Dec_imx6q,0x30860000=
,<wbr>115200 root=3D/dev/mmcblk1p2 rootwait rw&quot;</b></div></div></block=
quote><div><br></div><div>Change the root to /dev/mmcblk2p2 according to yo=
ur boot log. The 2nd linux take the emmc on board as the rootfs storage med=
ia.</div><div>So you need first use uuu to burn the sdcard image to the emm=
c device on board. And the 2nd linux will use the other uart as normal cons=
ole,</div><div>it take the 1st linux uart as early console.</div><div><br><=
/div><div>Regards,</div><div>Peng.</div><blockquote class=3D"gmail_quote" s=
tyle=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);pad=
ding-left:1ex"><div dir=3D"ltr"><div><br></div><div><br></div><div>=C2=A0=
=C2=A0=C2=A0 Below are logs:</div><div><br></div><div>=C2=A0=C2=A0=C2=A0 <b=
>Adding virtual PCI device 00:00.0 to cell &quot;linux-inmate-demo&quot;<br=
>Shared memory connection established, peer cells:<br>=C2=A0&quot;imx8mq&qu=
ot;<br>Adding virtual PCI device 00:01.0 to cell &quot;linux-inmate-demo&qu=
ot;<br>Shared memory connection established, peer cells:<br>=C2=A0&quot;imx=
8mq&quot;<br>Created cell &quot;linux-inmate-demo&quot;<br>Page pool usage =
after cell creation: mem 80/992, remap 144/131072<br>[ 1021.954940] Created=
 Jailhouse cell &quot;linux-inmate-demo&quot;<br>Cell &quot;linux-inmate-de=
mo&quot; can be loaded<br>Started cell &quot;linux-inmate-demo&quot;<br>[=
=C2=A0=C2=A0=C2=A0 0.000000] Booting Linux on physical CPU 0x0000000002 [0x=
410fd034]<br>[=C2=A0=C2=A0=C2=A0 0.000000] Linux version 5.4.24-2.1.0+gbaba=
c00 (oe-user@oe-host) (gcc version 9.2.0 (GCC)) #1 SMP PREEMPT Tue Jul 28 0=
8:36:15 UTC 2020<br>[=C2=A0=C2=A0=C2=A0 0.000000] Machine model: Freescale =
i.MX8MQ EVK<br>[=C2=A0=C2=A0=C2=A0 0.000000] earlycon: ec_imx6q0 at MMIO 0x=
0000000030860000 (options &#39;115200&#39;)<br>[=C2=A0=C2=A0=C2=A0 0.000000=
] printk: bootconsole [ec_imx6q0] enabled<br>[=C2=A0=C2=A0=C2=A0 0.000000] =
efi: Getting EFI parameters from FDT:<br>[=C2=A0=C2=A0=C2=A0 0.000000] efi:=
 UEFI not found.<br>[=C2=A0=C2=A0=C2=A0 0.000000] cma: Reserved 320 MiB at =
0x00000000e8000000<br>[=C2=A0=C2=A0=C2=A0 0.000000] NUMA: No NUMA configura=
tion found<br>[=C2=A0=C2=A0=C2=A0 0.000000] NUMA: Faking a node at [mem 0x0=
0000000c0000000-<wbr>0x00000000fdbfffff]<br>[=C2=A0=C2=A0=C2=A0 0.000000] N=
UMA: NODE_DATA [mem 0xfda0d500-0xfda0efff]<br>[=C2=A0=C2=A0=C2=A0 0.000000]=
 Zone ranges:<br>[=C2=A0=C2=A0=C2=A0 0.000000]=C2=A0=C2=A0 DMA32=C2=A0=C2=
=A0=C2=A0 [mem 0x00000000c0000000-<wbr>0x00000000fdbfffff]<br>[=C2=A0=C2=A0=
=C2=A0 0.000000]=C2=A0=C2=A0 Normal=C2=A0=C2=A0 empty<br>[=C2=A0=C2=A0=C2=
=A0 0.000000] Movable zone start for each node<br>[=C2=A0=C2=A0=C2=A0 0.000=
000] Early memory node ranges<br>[=C2=A0=C2=A0=C2=A0 0.000000]=C2=A0=C2=A0 =
node=C2=A0=C2=A0 0: [mem 0x00000000c0000000-<wbr>0x00000000fdbfffff]<br>[=
=C2=A0=C2=A0=C2=A0 0.000000] Initmem setup node 0 [mem 0x00000000c0000000-<=
wbr>0x00000000fdbfffff]<br>[=C2=A0=C2=A0=C2=A0 0.000000] psci: probing for =
conduit method from DT.<br>[=C2=A0=C2=A0=C2=A0 0.000000] psci: PSCIv1.1 det=
ected in firmware.<br>[=C2=A0=C2=A0=C2=A0 0.000000] psci: Using standard PS=
CI v0.2 function IDs<br>[=C2=A0=C2=A0=C2=A0 0.000000] psci: MIGRATE_INFO_TY=
PE not supported.<br>[=C2=A0=C2=A0=C2=A0 0.000000] psci: SMC Calling Conven=
tion v1.1<br>[=C2=A0=C2=A0=C2=A0 0.000000] percpu: Embedded 24 pages/cpu s5=
8904 r8192 d31208 u98304<br>[=C2=A0=C2=A0=C2=A0 0.000000] Detected VIPT I-c=
ache on CPU0<br>[=C2=A0=C2=A0=C2=A0 0.000000] CPU features: detected: ARM e=
rratum 845719<br>[=C2=A0=C2=A0=C2=A0 0.000000] CPU features: detected: GIC =
system register CPU interface<br>[=C2=A0=C2=A0=C2=A0 0.000000] Built 1 zone=
lists, mobility grouping on.=C2=A0 Total pages: 248976<br>[=C2=A0=C2=A0=C2=
=A0 0.000000] Policy zone: DMA32<br>[=C2=A0=C2=A0=C2=A0 0.000000] Kernel co=
mmand line: clk_ignore_unused console=3Dttymxc0,115200 earlycon=3Dec_imx6q,=
0x30860000,<wbr>115200 root=3D/dev/mmcblk1p2 rootwait rw<br>[=C2=A0=C2=A0=
=C2=A0 0.000000] Dentry cache hash table entries: 131072 (order: 8, 1048576=
 bytes, linear)<br>[=C2=A0=C2=A0=C2=A0 0.000000] Inode-cache hash table ent=
ries: 65536 (order: 7, 524288 bytes, linear)<br>[=C2=A0=C2=A0=C2=A0 0.00000=
0] mem auto-init: stack:off, heap alloc:off, heap free:off<br>[=C2=A0=C2=A0=
=C2=A0 0.000000] Memory: 635512K/1011712K available (16444K kernel code, 14=
44K rwdata, 6472K rodata, 2944K init, 1017K bss, 48520K reserved, 327680K c=
ma-reserved)<br>[=C2=A0=C2=A0=C2=A0 0.000000] SLUB: HWalign=3D64, Order=3D0=
-3, MinObjects=3D0, CPUs=3D2, Nodes=3D1<br>[=C2=A0=C2=A0=C2=A0 0.000000] rc=
u: Preemptible hierarchical RCU implementation.<br>[=C2=A0=C2=A0=C2=A0 0.00=
0000] rcu:=C2=A0=C2=A0=C2=A0=C2=A0 RCU restricting CPUs from NR_CPUS=3D256 =
to nr_cpu_ids=3D2.<br>[=C2=A0=C2=A0=C2=A0 0.000000]=C2=A0 Tasks RCU enabled=
.<br>[=C2=A0=C2=A0=C2=A0 0.000000] rcu: RCU calculated value of scheduler-e=
nlistment delay is 25 jiffies.<br>[=C2=A0=C2=A0=C2=A0 0.000000] rcu: Adjust=
ing geometry for rcu_fanout_leaf=3D16, nr_cpu_ids=3D2<br>[=C2=A0=C2=A0=C2=
=A0 0.000000] NR_IRQS: 64, nr_irqs: 64, preallocated irqs: 0<br>[=C2=A0=C2=
=A0=C2=A0 0.000000] GICv3: 128 SPIs implemented<br>[=C2=A0=C2=A0=C2=A0 0.00=
0000] GICv3: 0 Extended SPIs implemented<br>[=C2=A0=C2=A0=C2=A0 0.000000] G=
ICv3: Distributor has no Range Selector support<br>[=C2=A0=C2=A0=C2=A0 0.00=
0000] GICv3: 16 PPIs implemented<br>[=C2=A0=C2=A0=C2=A0 0.000000] GICv3: no=
 VLPI support, no direct LPI support<br>[=C2=A0=C2=A0=C2=A0 0.000000] GICv3=
: CPU0: found redistributor 2 region 0:0x00000000388c0000<br>[=C2=A0=C2=A0=
=C2=A0 0.000000] ITS: No ITS available, not enabling LPIs<br>[=C2=A0=C2=A0=
=C2=A0 0.000000] random: get_random_bytes called from start_kernel+0x2b8/0x=
44c with crng_init=3D0<br>[=C2=A0=C2=A0=C2=A0 0.000000] arch_timer: cp15 ti=
mer(s) running at 8.33MHz (virt).<br>[=C2=A0=C2=A0=C2=A0 0.000000] clocksou=
rce: arch_sys_counter: mask: 0xffffffffffffff max_cycles: 0x1ec0311ec, max_=
idle_ns: 440795202152 ns<br>[=C2=A0=C2=A0=C2=A0 0.000004] sched_clock: 56 b=
its at 8MHz, resolution 120ns, wraps every 2199023255541ns<br>[=C2=A0=C2=A0=
=C2=A0 0.008121] Console: colour dummy device 80x25<br>[=C2=A0=C2=A0=C2=A0 =
0.012473] Calibrating delay loop (skipped), value calculated using timer fr=
equency.. 16.66 BogoMIPS (lpj=3D33333)<br>[=C2=A0=C2=A0=C2=A0 0.022664] pid=
_max: default: 32768 minimum: 301<br>[=C2=A0=C2=A0=C2=A0 0.027337] LSM: Sec=
urity Framework initializing<br>[=C2=A0=C2=A0=C2=A0 0.031915] Mount-cache h=
ash table entries: 2048 (order: 2, 16384 bytes, linear)<br>[=C2=A0=C2=A0=C2=
=A0 0.039248] Mountpoint-cache hash table entries: 2048 (order: 2, 16384 by=
tes, linear)<br>[=C2=A0=C2=A0=C2=A0 0.071135] ASID allocator initialised wi=
th 32768 entries<br>[=C2=A0=C2=A0=C2=A0 0.079137] rcu: Hierarchical SRCU im=
plementation.<br>[=C2=A0=C2=A0=C2=A0 0.087271] EFI services will not be ava=
ilable.<br>[=C2=A0=C2=A0=C2=A0 0.095177] smp: Bringing up secondary CPUs ..=
.<br>[=C2=A0=C2=A0=C2=A0 0.127296] Detected VIPT I-cache on CPU1<br>[=C2=A0=
=C2=A0=C2=A0 0.127333] GICv3: CPU1: found redistributor 3 region 0:0x000000=
00388e0000<br>[=C2=A0=C2=A0=C2=A0 0.127374] CPU1: Booted secondary processo=
r 0x0000000003 [0x410fd034]<br>[=C2=A0=C2=A0=C2=A0 0.127452] smp: Brought u=
p 1 node, 2 CPUs<br>[=C2=A0=C2=A0=C2=A0 0.146060] SMP: Total of 2 processor=
s activated.<br>[=C2=A0=C2=A0=C2=A0 0.150745] CPU features: detected: 32-bi=
t EL0 Support<br>[=C2=A0=C2=A0=C2=A0 0.155882] CPU features: detected: CRC3=
2 instructions<br>[=C2=A0=C2=A0=C2=A0 0.171395] CPU: All CPU(s) started at =
EL1<br>[=C2=A0=C2=A0=C2=A0 0.172643] alternatives: patching kernel code<br>=
[=C2=A0=C2=A0=C2=A0 0.178327] devtmpfs: initialized<br>[=C2=A0=C2=A0=C2=A0 =
0.182016] clocksource: jiffies: mask: 0xffffffff max_cycles: 0xffffffff, ma=
x_idle_ns: 7645041785100000 ns<br>[=C2=A0=C2=A0=C2=A0 0.190093] futex hash =
table entries: 512 (order: 3, 32768 bytes, linear)<br>[=C2=A0=C2=A0=C2=A0 0=
.205814] pinctrl core: initialized pinctrl subsystem<br>[=C2=A0=C2=A0=C2=A0=
 0.208766] DMI not present or invalid.<br>[=C2=A0=C2=A0=C2=A0 0.212295] NET=
: Registered protocol family 16<br>[=C2=A0=C2=A0=C2=A0 0.226844] DMA: preal=
located 256 KiB pool for atomic allocations<br>[=C2=A0=C2=A0=C2=A0 0.230091=
] audit: initializing netlink subsys (disabled)<br>[=C2=A0=C2=A0=C2=A0 0.23=
5625] audit: type=3D2000 audit(0.200:1): state=3Dinitialized audit_enabled=
=3D0 res=3D1<br>[=C2=A0=C2=A0=C2=A0 0.243221] cpuidle: using governor menu<=
br>[=C2=A0=C2=A0=C2=A0 0.247461] hw-breakpoint: found 6 breakpoint and 4 wa=
tchpoint registers.<br>[=C2=A0=C2=A0=C2=A0 0.254239] Serial: AMBA PL011 UAR=
T driver<br>[=C2=A0=C2=A0=C2=A0 0.258022] imx mu driver is registered.<br>[=
=C2=A0=C2=A0=C2=A0 0.261865] imx rpmsg driver is registered.<br>[=C2=A0=C2=
=A0=C2=A0 0.283632] HugeTLB registered 1.00 GiB page size, pre-allocated 0 =
pages<br>[=C2=A0=C2=A0=C2=A0 0.287485] HugeTLB registered 32.0 MiB page siz=
e, pre-allocated 0 pages<br>[=C2=A0=C2=A0=C2=A0 0.294161] HugeTLB registere=
d 2.00 MiB page size, pre-allocated 0 pages<br>[=C2=A0=C2=A0=C2=A0 0.300846=
] HugeTLB registered 64.0 KiB page size, pre-allocated 0 pages<br>[=C2=A0=
=C2=A0=C2=A0 0.309530] cryptd: max_cpu_qlen set to 1000<br>[=C2=A0=C2=A0=C2=
=A0 0.317166] ACPI: Interpreter disabled.<br>[=C2=A0=C2=A0=C2=A0 0.318509] =
iommu: Default domain type: Translated<br>[=C2=A0=C2=A0=C2=A0 0.323154] vga=
arb: loaded<br>[=C2=A0=C2=A0=C2=A0 0.325989] SCSI subsystem initialized<br>=
[=C2=A0=C2=A0=C2=A0 0.329830] usbcore: registered new interface driver usbf=
s<br>[=C2=A0=C2=A0=C2=A0 0.334947] usbcore: registered new interface driver=
 hub<br>[=C2=A0=C2=A0=C2=A0 0.340466] usbcore: registered new device driver=
 usb<br>[=C2=A0=C2=A0=C2=A0 0.345518] mc: Linux media interface: v0.10<br>[=
=C2=A0=C2=A0=C2=A0 0.349507] videodev: Linux video capture interface: v2.00=
<br>[=C2=A0=C2=A0=C2=A0 0.355017] pps_core: LinuxPPS API ver. 1 registered<=
br>[=C2=A0=C2=A0=C2=A0 0.359900] pps_core: Software ver. 5.3.6 - Copyright =
2005-2007 Rodolfo Giometti &lt;<a href=3D"javascript:" target=3D"_blank" gd=
f-obfuscated-mailto=3D"dNty2DPpBAAJ" rel=3D"nofollow" onmousedown=3D"this.h=
ref=3D&#39;javascript:&#39;;return true;" onclick=3D"this.href=3D&#39;javas=
cript:&#39;;return true;">giom...@linux.it</a>&gt;<br>[=C2=A0=C2=A0=C2=A0 0=
.369034] PTP clock support registered<br>[=C2=A0=C2=A0=C2=A0 0.372976] EDAC=
 MC: Ver: 3.0.0<br>[=C2=A0=C2=A0=C2=A0 0.376456] No BMan portals available!=
<br>[=C2=A0=C2=A0=C2=A0 0.379991] QMan: Allocated lookup table at (____ptrv=
al____), entry count 65537<br>[=C2=A0=C2=A0=C2=A0 0.387121] No QMan portals=
 available!<br>[=C2=A0=C2=A0=C2=A0 0.390844] No USDPAA memory, no &#39;fsl,=
usdpaa-mem&#39; in device-tree<br>[=C2=A0=C2=A0=C2=A0 0.397047] FPGA manage=
r framework<br>[=C2=A0=C2=A0=C2=A0 0.400255] Advanced Linux Sound Architect=
ure Driver Initialized.<br>[=C2=A0=C2=A0=C2=A0 0.406683] Bluetooth: Core ve=
r 2.22<br>[=C2=A0=C2=A0=C2=A0 0.409838] NET: Registered protocol family 31<=
br>[=C2=A0=C2=A0=C2=A0 0.414246] Bluetooth: HCI device and connection manag=
er initialized<br>[=C2=A0=C2=A0=C2=A0 0.420580] Bluetooth: HCI socket layer=
 initialized<br>[=C2=A0=C2=A0=C2=A0 0.425440] Bluetooth: L2CAP socket layer=
 initialized<br>[=C2=A0=C2=A0=C2=A0 0.430494] Bluetooth: SCO socket layer i=
nitialized<br>[=C2=A0=C2=A0=C2=A0 0.435863] clocksource: Switched to clocks=
ource arch_sys_counter<br>[=C2=A0=C2=A0=C2=A0 0.441553] VFS: Disk quotas dq=
uot_6.6.0<br>[=C2=A0=C2=A0=C2=A0 0.445367] VFS: Dquot-cache hash table entr=
ies: 512 (order 0, 4096 bytes)<br>[=C2=A0=C2=A0=C2=A0 0.452334] pnp: PnP AC=
PI: disabled<br>[=C2=A0=C2=A0=C2=A0 0.462170] thermal_sys: Registered therm=
al governor &#39;step_wise&#39;<br>[=C2=A0=C2=A0=C2=A0 0.462173] thermal_sy=
s: Registered thermal governor &#39;power_allocator&#39;<br>[=C2=A0=C2=A0=
=C2=A0 0.465472] NET: Registered protocol family 2<br>[=C2=A0=C2=A0=C2=A0 0=
.476511] tcp_listen_portaddr_hash hash table entries: 512 (order: 1, 8192 b=
ytes, linear)<br>[=C2=A0=C2=A0=C2=A0 0.484540] TCP established hash table e=
ntries: 8192 (order: 4, 65536 bytes, linear)<br>[=C2=A0=C2=A0=C2=A0 0.49230=
2] TCP bind hash table entries: 8192 (order: 5, 131072 bytes, linear)<br>[=
=C2=A0=C2=A0=C2=A0 0.499571] TCP: Hash tables configured (established 8192 =
bind 8192)<br>[=C2=A0=C2=A0=C2=A0 0.505845] UDP hash table entries: 512 (or=
der: 2, 16384 bytes, linear)<br>[=C2=A0=C2=A0=C2=A0 0.512401] UDP-Lite hash=
 table entries: 512 (order: 2, 16384 bytes, linear)<br>[=C2=A0=C2=A0=C2=A0 =
0.519510] NET: Registered protocol family 1<br>[=C2=A0=C2=A0=C2=A0 0.524157=
] RPC: Registered named UNIX socket transport module.<br>[=C2=A0=C2=A0=C2=
=A0 0.529649] RPC: Registered udp transport module.<br>[=C2=A0=C2=A0=C2=A0 =
0.534334] RPC: Registered tcp transport module.<br>[=C2=A0=C2=A0=C2=A0 0.53=
9023] RPC: Registered tcp NFSv4.1 backchannel transport module.<br>[=C2=A0=
=C2=A0=C2=A0 0.545810] PCI: CLS 0 bytes, default 64<br>[=C2=A0=C2=A0=C2=A0 =
0.549924] kvm [1]: HYP mode not available<br>[=C2=A0=C2=A0=C2=A0 0.559322] =
Initialise system trusted keyrings<br>[=C2=A0=C2=A0=C2=A0 0.561042] working=
set: timestamp_bits=3D44 max_order=3D18 bucket_order=3D0<br>[=C2=A0=C2=A0=
=C2=A0 0.574077] squashfs: version 4.0 (2009/01/31) Phillip Lougher<br>[=C2=
=A0=C2=A0=C2=A0 0.577766] NFS: Registering the id_resolver key type<br>[=C2=
=A0=C2=A0=C2=A0 0.582117] Key type id_resolver registered<br>[=C2=A0=C2=A0=
=C2=A0 0.586255] Key type id_legacy registered<br>[=C2=A0=C2=A0=C2=A0 0.590=
256] nfs4filelayout_init: NFSv4 File Layout Driver Registering...<br>[=C2=
=A0=C2=A0=C2=A0 0.596947] jffs2: version 2.2. (NAND) =C2=A9 2001-2006 Red H=
at, Inc.<br>[=C2=A0=C2=A0=C2=A0 0.603415] 9p: Installing v9fs 9p2000 file s=
ystem support<br>[=C2=A0=C2=A0=C2=A0 0.623963] Key type asymmetric register=
ed<br>[=C2=A0=C2=A0=C2=A0 0.625197] Asymmetric key parser &#39;x509&#39; re=
gistered<br>[=C2=A0=C2=A0=C2=A0 0.630097] Block layer SCSI generic (bsg) dr=
iver version 0.4 loaded (major 244)<br>[=C2=A0=C2=A0=C2=A0 0.637464] io sch=
eduler mq-deadline registered<br>[=C2=A0=C2=A0=C2=A0 0.641963] io scheduler=
 kyber registered<br>[=C2=A0=C2=A0=C2=A0 0.646985] pci-host-generic bfb0000=
0.pci: host bridge /pci@bfb00000 ranges:<br>[=C2=A0=C2=A0=C2=A0 0.653010] p=
ci-host-generic bfb00000.pci:=C2=A0=C2=A0 MEM 0x10000000..0x1000ffff -&gt; =
0x10000000<br>[=C2=A0=C2=A0=C2=A0 0.660844] pci-host-generic bfb00000.pci: =
ECAM at [mem 0xbfb00000-0xbfbfffff] for [bus 00]<br>[=C2=A0=C2=A0=C2=A0 0.6=
69234] pci-host-generic bfb00000.pci: PCI host bridge to bus 0000:00<br>[=
=C2=A0=C2=A0=C2=A0 0.675904] pci_bus 0000:00: root bus resource [bus 00]<br=
>[=C2=A0=C2=A0=C2=A0 0.681117] pci_bus 0000:00: root bus resource [mem 0x10=
000000-0x1000ffff]<br>[=C2=A0=C2=A0=C2=A0 0.687999] pci 0000:00:00.0: [110a=
:4106] type 00 class 0xff0000<br>[=C2=A0=C2=A0=C2=A0 0.693983] pci 0000:00:=
00.0: reg 0x10: [mem 0x00000000-0x00000fff]<br>[=C2=A0=C2=A0=C2=A0 0.700441=
] pci 0000:00:01.0: [110a:4106] type 00 class 0xff0001<br>[=C2=A0=C2=A0=C2=
=A0 0.706215] pci 0000:00:01.0: reg 0x10: [mem 0x00000000-0x00000fff]<br>[=
=C2=A0=C2=A0=C2=A0 0.712846] pci 0000:00:00.0: BAR 0: assigned [mem 0x10000=
000-0x10000fff]<br>[=C2=A0=C2=A0=C2=A0 0.719226] pci 0000:00:01.0: BAR 0: a=
ssigned [mem 0x10001000-0x10001fff]<br>[=C2=A0=C2=A0=C2=A0 0.730661] EINJ: =
ACPI disabled.<br>[=C2=A0=C2=A0=C2=A0 0.731846] Bus freq driver module load=
ed<br>[=C2=A0=C2=A0=C2=A0 0.738437] Serial: 8250/16550 driver, 4 ports, IRQ=
 sharing enabled<br>[=C2=A0=C2=A0=C2=A0 0.743272] 30890000.serial: ttymxc1 =
at MMIO 0x30890000 (irq =3D 5, base_baud =3D 1562500) is a IMX<br>[=C2=A0=
=C2=A0=C2=A0 0.758802] loop: module loaded<br>[=C2=A0=C2=A0=C2=A0 0.760497]=
 imx ahci driver is registered.<br>[=C2=A0=C2=A0=C2=A0 0.764652] libphy: Fi=
xed MDIO Bus: probed<br>[=C2=A0=C2=A0=C2=A0 0.768138] tun: Universal TUN/TA=
P device driver, 1.6<br>[=C2=A0=C2=A0=C2=A0 0.772584] thunder_xcv, ver 1.0<=
br>[=C2=A0=C2=A0=C2=A0 0.775525] thunder_bgx, ver 1.0<br>[=C2=A0=C2=A0=C2=
=A0 0.778759] nicpf, ver 1.0<br>[=C2=A0=C2=A0=C2=A0 0.781574] Freescale FM =
module, FMD API version 21.1.0<br>[=C2=A0=C2=A0=C2=A0 0.786667] Freescale F=
M Ports module<br>[=C2=A0=C2=A0=C2=A0 0.790255] fsl_mac: fsl_mac: FSL FMan =
MAC API based driver<br>[=C2=A0=C2=A0=C2=A0 0.795852] fsl_dpa: FSL DPAA Eth=
ernet driver<br>[=C2=A0=C2=A0=C2=A0 0.800190] fsl_advanced: FSL DPAA Advanc=
ed drivers:<br>[=C2=A0=C2=A0=C2=A0 0.805098] fsl_proxy: FSL DPAA Proxy init=
ialization driver<br>[=C2=A0=C2=A0=C2=A0 0.810691] fsl_oh: FSL FMan Offline=
 Parsing port driver<br>[=C2=A0=C2=A0=C2=A0 0.816330] hclge is initializing=
<br>[=C2=A0=C2=A0=C2=A0 0.819240] hns3: Hisilicon Ethernet Network Driver f=
or Hip08 Family - version<br>[=C2=A0=C2=A0=C2=A0 0.826457] hns3: Copyright =
(c) 2017 Huawei Corporation.<br>[=C2=A0=C2=A0=C2=A0 0.831800] e1000: Intel(=
R) PRO/1000 Network Driver - version 7.3.21-k8-NAPI<br>[=C2=A0=C2=A0=C2=A0 =
0.838777] e1000: Copyright (c) 1999-2006 Intel Corporation.<br>[=C2=A0=C2=
=A0=C2=A0 0.844545] e1000e: Intel(R) PRO/1000 Network Driver - 3.2.6-k<br>[=
=C2=A0=C2=A0=C2=A0 0.850324] e1000e: Copyright(c) 1999 - 2015 Intel Corpora=
tion.<br>[=C2=A0=C2=A0=C2=A0 0.856268] igb: Intel(R) Gigabit Ethernet Netwo=
rk Driver - version 5.6.0-k<br>[=C2=A0=C2=A0=C2=A0 0.863169] igb: Copyright=
 (c) 2007-2014 Intel Corporation.<br>[=C2=A0=C2=A0=C2=A0 0.868770] igbvf: I=
ntel(R) Gigabit Virtual Function Network Driver - version 2.4.0-k<br>[=C2=
=A0=C2=A0=C2=A0 0.876539] igbvf: Copyright (c) 2009 - 2012 Intel Corporatio=
n.<br>[=C2=A0=C2=A0=C2=A0 0.882511] sky2: driver version 1.30<br>[=C2=A0=C2=
=A0=C2=A0 0.886445] ivshmem-net 0000:00:01.0: enabling device (0000 -&gt; 0=
002)<br>[=C2=A0=C2=A0=C2=A0 0.892506] ivshmem-net 0000:00:01.0: TX memory a=
t 0x00000000bfe80000, size 0x000000000007f000<br>[=C2=A0=C2=A0=C2=A0 0.9010=
24] ivshmem-net 0000:00:01.0: RX memory at 0x00000000bfe01000, size 0x00000=
0000007f000<br>_ivshmem 0000:00:00.0: state_table at 0x00000000bfd00000, si=
ze 0x0000000000001000om6s 3] dy<br>[=C2=A0=C2=A0=C2=A0 0.924815] uio_ivshme=
m 0000:00:00.0: rw_section at 0x00000000bfd01000, size 0x0000000000009000<b=
r>[=C2=A0=C2=A0=C2=A0 0.933489] uio_ivshmem 0000:00:00.0: input_sections at=
 0x00000000bfd0a000, size 0x0000000000006000<br>[=C2=A0=C2=A0=C2=A0 0.94251=
1] uio_ivshmem 0000:00:00.0: output_section at 0x00000000bfd0e000, size 0x0=
000000000002000<br>[=C2=A0=C2=A0=C2=A0 0.951977] VFIO - User Level meta-dri=
ver version: 0.3<br>[=C2=A0=C2=A0=C2=A0 0.957373] ehci_hcd: USB 2.0 &#39;En=
hanced&#39; Host Controller (EHCI) Driver<br>[=C2=A0=C2=A0=C2=A0 0.963176] =
ehci-pci: EHCI PCI platform driver<br>[=C2=A0=C2=A0=C2=A0 0.967627] ehci-pl=
atform: EHCI generic platform driver<br>[=C2=A0=C2=A0=C2=A0 0.972839] ohci_=
hcd: USB 1.1 &#39;Open&#39; Host Controller (OHCI) Driver<br>[=C2=A0=C2=A0=
=C2=A0 0.978981] ohci-pci: OHCI PCI platform driver<br>[=C2=A0=C2=A0=C2=A0 =
0.983424] ohci-platform: OHCI generic platform driver<br>[=C2=A0=C2=A0=C2=
=A0 0.988740] usbcore: registered new interface driver usb-storage<br>[=C2=
=A0=C2=A0=C2=A0 0.994651] usbcore: registered new interface driver usbseria=
l_generic<br>[=C2=A0=C2=A0=C2=A0 1.001115] usbserial: USB Serial support re=
gistered for generic<br>[=C2=A0=C2=A0=C2=A0 1.007108] usbcore: registered n=
ew interface driver ftdi_sio<br>[=C2=A0=C2=A0=C2=A0 1.012831] usbserial: US=
B Serial support registered for FTDI USB Serial Device<br>[=C2=A0=C2=A0=C2=
=A0 1.020135] usbcore: registered new interface driver usb_serial_simple<br=
>[=C2=A0=C2=A0=C2=A0 1.026643] usbserial: USB Serial support registered for=
 carelink<br>[=C2=A0=C2=A0=C2=A0 1.032709] usbserial: USB Serial support re=
gistered for zio<br>[=C2=A0=C2=A0=C2=A0 1.038351] usbserial: USB Serial sup=
port registered for funsoft<br>[=C2=A0=C2=A0=C2=A0 1.044350] usbserial: USB=
 Serial support registered for flashloader<br>[=C2=A0=C2=A0=C2=A0 1.050679]=
 usbserial: USB Serial support registered for google<br>[=C2=A0=C2=A0=C2=A0=
 1.056583] usbserial: USB Serial support registered for libtransistor<br>[=
=C2=A0=C2=A0=C2=A0 1.063090] usbserial: USB Serial support registered for v=
ivopay<br>[=C2=A0=C2=A0=C2=A0 1.069080] usbserial: USB Serial support regis=
tered for moto_modem<br>[=C2=A0=C2=A0=C2=A0 1.075333] usbserial: USB Serial=
 support registered for motorola_tetra<br>[=C2=A0=C2=A0=C2=A0 1.081930] usb=
serial: USB Serial support registered for novatel_gps<br>[=C2=A0=C2=A0=C2=
=A0 1.088278] usbserial: USB Serial support registered for hp4x<br>[=C2=A0=
=C2=A0=C2=A0 1.093993] usbserial: USB Serial support registered for suunto<=
br>[=C2=A0=C2=A0=C2=A0 1.099901] usbserial: USB Serial support registered f=
or siemens_mpi<br>[=C2=A0=C2=A0=C2=A0 1.107246] i2c /dev entries driver<br>=
[=C2=A0=C2=A0=C2=A0 1.110345] Bluetooth: HCI UART driver ver 2.3<br>[=C2=A0=
=C2=A0=C2=A0 1.114127] Bluetooth: HCI UART protocol H4 registered<br>[=C2=
=A0=C2=A0=C2=A0 1.119245] Bluetooth: HCI UART protocol BCSP registered<br>[=
=C2=A0=C2=A0=C2=A0 1.124556] Bluetooth: HCI UART protocol LL registered<br>=
[=C2=A0=C2=A0=C2=A0 1.129660] Bluetooth: HCI UART protocol ATH3K registered=
<br>[=C2=A0=C2=A0=C2=A0 1.135056] Bluetooth: HCI UART protocol Three-wire (=
H5) registered<br>[=C2=A0=C2=A0=C2=A0 1.141326] Bluetooth: HCI UART protoco=
l Broadcom registered<br>[=C2=A0=C2=A0=C2=A0 1.146950] Bluetooth: HCI UART =
protocol QCA registered<br>[=C2=A0=C2=A0=C2=A0 1.152285] imx-cpufreq-dt: pr=
obe of imx-cpufreq-dt failed with error -2<br>[=C2=A0=C2=A0=C2=A0 1.159033]=
 sdhci: Secure Digital Host Controller Interface driver<br>[=C2=A0=C2=A0=C2=
=A0 1.164990] sdhci: Copyright(c) Pierre Ossman<br>[=C2=A0=C2=A0=C2=A0 1.16=
9392] Synopsys Designware Multimedia Card Interface Driver<br>[=C2=A0=C2=A0=
=C2=A0 1.175449] sdhci-pltfm: SDHCI platform and OF driver helper<br>[=C2=
=A0=C2=A0=C2=A0 1.181146] sdhci-esdhc-imx 30b40000.mmc: could not get pinct=
rl<br>[=C2=A0=C2=A0=C2=A0 1.218013] mmc2: SDHCI controller on 30b40000.mmc =
[30b40000.mmc] using ADMA<br>[=C2=A0=C2=A0=C2=A0 1.222834] ledtrig-cpu: reg=
istered to indicate activity on CPUs<br>[=C2=A0=C2=A0=C2=A0 1.229160] usbco=
re: registered new interface driver usbhid<br>[=C2=A0=C2=A0=C2=A0 1.233823]=
 usbhid: USB HID core driver<br>[=C2=A0=C2=A0=C2=A0 1.238352] No fsl,qman n=
ode<br>[=C2=A0=C2=A0=C2=A0 1.240462] Freescale USDPAA process driver<br>[=
=C2=A0=C2=A0=C2=A0 1.244627] fsl-usdpaa: no region found<br>[=C2=A0=C2=A0=
=C2=A0 1.248477] Freescale USDPAA process IRQ driver<br>[=C2=A0=C2=A0=C2=A0=
 1.257304] pktgen: Packet Generator for packet performance testing. Version=
: 2.75<br>[=C2=A0=C2=A0=C2=A0 1.262307] NET: Registered protocol family 26<=
br>[=C2=A0=C2=A0=C2=A0 1.267090] NET: Registered protocol family 10<br>[=C2=
=A0=C2=A0=C2=A0 1.271591] Segment Routing with IPv6<br>[=C2=A0=C2=A0=C2=A0 =
1.274573] NET: Registered protocol family 17<br>[=C2=A0=C2=A0=C2=A0 1.27904=
0] Bluetooth: RFCOMM TTY layer initialized<br>[=C2=A0=C2=A0=C2=A0 1.283840]=
 Bluetooth: RFCOMM socket layer initialized<br>[=C2=A0=C2=A0=C2=A0 1.288955=
] Bluetooth: RFCOMM ver 1.11<br>[=C2=A0=C2=A0=C2=A0 1.292683] Bluetooth: BN=
EP (Ethernet Emulation) ver 1.3<br>[=C2=A0=C2=A0=C2=A0 1.297958] Bluetooth:=
 BNEP filters: protocol multicast<br>[=C2=A0=C2=A0=C2=A0 1.303185] Bluetoot=
h: BNEP socket layer initialized<br>[=C2=A0=C2=A0=C2=A0 1.308126] Bluetooth=
: HIDP (Human Interface Emulation) ver 1.2<br>[=C2=A0=C2=A0=C2=A0 1.314021]=
 Bluetooth: HIDP socket layer initialized<br>[=C2=A0=C2=A0=C2=A0 1.319004] =
8021q: 802.1Q VLAN Support v1.8<br>[=C2=A0=C2=A0=C2=A0 1.323167] lib80211: =
common routines for IEEE802.11 drivers<br>[=C2=A0=C2=A0=C2=A0 1.328915] 9pn=
et: Installing 9P2000 support<br>[=C2=A0=C2=A0=C2=A0 1.333060] tsn generic =
netlink module v1 init...<br>[=C2=A0=C2=A0=C2=A0 1.337781] Key type dns_res=
olver registered<br>[=C2=A0=C2=A0=C2=A0 1.342482] registered taskstats vers=
ion 1<br>[=C2=A0=C2=A0=C2=A0 1.346064] Loading compiled-in X.509 certificat=
es<br>[=C2=A0=C2=A0=C2=A0 1.352505] hctosys: unable to open rtc device (rtc=
0)<br>[=C2=A0=C2=A0=C2=A0 1.355965] cfg80211: Loading compiled-in X.509 cer=
tificates for regulatory database<br>[=C2=A0=C2=A0=C2=A0 1.365244] cfg80211=
: Loaded X.509 cert &#39;sforshee: 00b28ddf47aef9cea7&#39;<br>[=C2=A0=C2=A0=
=C2=A0 1.370196] platform regulatory.0: Direct firmware load for regulatory=
.db failed with error -2<br>[=C2=A0=C2=A0=C2=A0 1.371872] clk: Not disablin=
g unused clocks<br>[=C2=A0=C2=A0=C2=A0 1.378719] platform regulatory.0: Fal=
ling back to sysfs fallback for: regulatory.db<br>[=C2=A0=C2=A0=C2=A0 1.382=
975] ALSA device list:<br>[=C2=A0=C2=A0=C2=A0 1.393625]=C2=A0=C2=A0 No soun=
dcards found.<br>[=C2=A0=C2=A0=C2=A0 1.397057] Warning: unable to open an i=
nitial console.<br>[=C2=A0=C2=A0=C2=A0 1.402301] Waiting for root device /d=
ev/mmcblk1p2...<br>[=C2=A0=C2=A0=C2=A0 1.417055] mmc2: new DDR MMC card at =
address 0001<br>[=C2=A0=C2=A0=C2=A0 1.419499] mmcblk2: mmc2:0001 DG4016 14.=
7 GiB<br>[=C2=A0=C2=A0=C2=A0 1.423711] mmcblk2boot0: mmc2:0001 DG4016 parti=
tion 1 4.00 MiB<br>[=C2=A0=C2=A0=C2=A0 1.429619] mmcblk2boot1: mmc2:0001 DG=
4016 partition 2 4.00 MiB<br>[=C2=A0=C2=A0=C2=A0 1.435431] mmcblk2rpmb: mmc=
2:0001 DG4016 partition 3 4.00 MiB, chardev (237:0)<br>[=C2=A0=C2=A0=C2=A0 =
1.452011]=C2=A0 mmcblk2: p1 p2<br>[=C2=A0=C2=A0 62.528001] cfg80211: failed=
 to load regulatory.db<br></b><br></div></div>

<p></p>

-- <br>
You received this message because you are subscribed to the Google Groups &=
quot;Jailhouse&quot; group.<br>
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to <a href=3D"javascript:" target=3D"_blank" gdf-obfuscated-mailto=3D"=
dNty2DPpBAAJ" rel=3D"nofollow" onmousedown=3D"this.href=3D&#39;javascript:&=
#39;;return true;" onclick=3D"this.href=3D&#39;javascript:&#39;;return true=
;">jailho...@<wbr>googlegroups.com</a>.<br>
To view this discussion on the web visit <a href=3D"https://groups.google.c=
om/d/msgid/jailhouse-dev/11e37b92-3146-4194-877f-f79ab746d971o%40googlegrou=
ps.com?utm_medium=3Demail&amp;utm_source=3Dfooter" target=3D"_blank" rel=3D=
"nofollow" onmousedown=3D"this.href=3D&#39;https://groups.google.com/d/msgi=
d/jailhouse-dev/11e37b92-3146-4194-877f-f79ab746d971o%40googlegroups.com?ut=
m_medium\x3demail\x26utm_source\x3dfooter&#39;;return true;" onclick=3D"thi=
s.href=3D&#39;https://groups.google.com/d/msgid/jailhouse-dev/11e37b92-3146=
-4194-877f-f79ab746d971o%40googlegroups.com?utm_medium\x3demail\x26utm_sour=
ce\x3dfooter&#39;;return true;">https://groups.google.com/d/<wbr>msgid/jail=
house-dev/11e37b92-<wbr>3146-4194-877f-f79ab746d971o%<wbr>40googlegroups.co=
m</a>.<br>
</blockquote></div><br clear=3D"all"><div><br></div>-- <br><div dir=3D"ltr"=
><div dir=3D"ltr"><br></div></div></div>
</blockquote></div>

<p></p>

-- <br />
You received this message because you are subscribed to the Google Groups &=
quot;Jailhouse&quot; group.<br />
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to <a href=3D"mailto:jailhouse-dev+unsubscribe@googlegroups.com">jailh=
ouse-dev+unsubscribe@googlegroups.com</a>.<br />
To view this discussion on the web visit <a href=3D"https://groups.google.c=
om/d/msgid/jailhouse-dev/fed47e44-bfa7-47a7-bad7-a60088a9d2a6o%40googlegrou=
ps.com?utm_medium=3Demail&utm_source=3Dfooter">https://groups.google.com/d/=
msgid/jailhouse-dev/fed47e44-bfa7-47a7-bad7-a60088a9d2a6o%40googlegroups.co=
m</a>.<br />

------=_Part_1054_1186273098.1597084246773--

------=_Part_1053_757991147.1597084246771--
