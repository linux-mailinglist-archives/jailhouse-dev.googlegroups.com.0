Return-Path: <jailhouse-dev+bncBCC7XQGMWINBBRNVQ2VQMGQE55BRCLQ@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-oi1-x23e.google.com (mail-oi1-x23e.google.com [IPv6:2607:f8b0:4864:20::23e])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D9D27F88B4
	for <lists+jailhouse-dev@lfdr.de>; Sat, 25 Nov 2023 07:57:11 +0100 (CET)
Received: by mail-oi1-x23e.google.com with SMTP id 5614622812f47-3b3447c72c4sf3698454b6e.1
        for <lists+jailhouse-dev@lfdr.de>; Fri, 24 Nov 2023 22:57:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20230601; t=1700895430; x=1701500230; darn=lfdr.de;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:x-original-sender:mime-version
         :subject:message-id:to:from:date:sender:from:to:cc:subject:date
         :message-id:reply-to;
        bh=pYfOy01F4wReMvwa7yN7Pg7fQltNwdkwvGyUZMjkrEQ=;
        b=ZeAYvZIaK7wkWIOvvBCSi4NUns9c8+KHkNvzLgRZZbZFQC3oeGCROxizsQov5H7aum
         kbPeExESQpwV1cFQ0QuDSv106a085P2zRRu/tzy5xb19mxJIWNMQRHXO2Uq2xuhge0Fc
         PClHD6bYrDoGtlnj0Aeof36Z4oX9SgrMFLNKLTgHLzfQr5PXMibew0B01AcP4HGgwZpf
         pwQ27el8Xni2KzVvqcBCP4zaOGezNYDJpqlPweqpG0+ndYMKBr29zJWk6njgvnZD0lX0
         i1XWl7wSza7E/u9ASoG4VZIQ2UX0wx9kji1dF4CEiHbb2I4dx235gMjw7N2odauimLVx
         aYeQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1700895430; x=1701500230; darn=lfdr.de;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:x-original-sender:mime-version
         :subject:message-id:to:from:date:from:to:cc:subject:date:message-id
         :reply-to;
        bh=pYfOy01F4wReMvwa7yN7Pg7fQltNwdkwvGyUZMjkrEQ=;
        b=gc/SOpN/kC0aO2N629pCH9qIIBJXaDwjQL5qBKdrk2dipj6HlSErHAa7Hcal5r3Ksg
         lboxqYq4EYR2RTTRLDFEcwZRCWLp2B6fXPM/wj8dPS+O3kRb7atblrHhN7FfzvuTCESZ
         uIfz+NkD82j6BuVBT9is05rPX7vSTkEInXqomWZPhqDxE/xeX4pGBV2u8IKiXuhmO96O
         ohROowVBJGm9M+0/QKxVftLFFG5cAGswgT3NhW8R3wyr3jda6yx10EGb0iEkeobl1uj5
         fG63PZwSvitdi66iwD/bY1ifUeIFmflRyog0SH/m3n+6Ipkvxqw9yzSJU/DNiozpk7b9
         B36A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700895430; x=1701500230;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :x-spam-checked-in-group:list-id:mailing-list:precedence
         :x-original-sender:mime-version:subject:message-id:to:from:date
         :x-beenthere:x-gm-message-state:sender:from:to:cc:subject:date
         :message-id:reply-to;
        bh=pYfOy01F4wReMvwa7yN7Pg7fQltNwdkwvGyUZMjkrEQ=;
        b=ETTMD7PUmZ4DPFloMv9eYU4g30EvuZyma5RJNc3EqelUNN/6TY7wjeQbaI0nQqEpXc
         5PF777Jxdj0+8mijiPHfkS5Cn5En4SEp4/VeYBUW6VAM5g0PpUC9Qtx1i3FEgTas+s8K
         c3k/Gm1zvSbfk8/UO+djBNAWo0+iGbdXSoyKyiYEQirPdYrPA+q4waIYwf5mugUjHJfA
         qL1vKxhrVxQ/eId9cwOVIz2UQ1oIHLnKzPQ/3nigWqpKT/ECqc+PzW5H2EVJi5i10+oX
         Ttc3gMVoUizsi51et6l5EF1teePgKHKPAy0S2ZS/5tCPJ1uLiBrrgGtzgaGeYgoVuVuT
         S+ZA==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AOJu0YwcQj/iWwqrg+Cf0MjrOVDz/+HDOlE23AAus86GYUUIzi+JT1jb
	qV7szOz+vtadaL/Pc1vKc3c=
X-Google-Smtp-Source: AGHT+IHO6vISpwYZUwdjryRMxSkW1fV2jj3YLy9hYjQBMNn7za0RhCDyTXpT7vX9P2ACCZ0CMJBjvw==
X-Received: by 2002:a05:6808:1b25:b0:3b5:75ad:5b73 with SMTP id bx37-20020a0568081b2500b003b575ad5b73mr7193039oib.13.1700895429962;
        Fri, 24 Nov 2023 22:57:09 -0800 (PST)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a05:6a00:3a09:b0:6c0:fb5e:7625 with SMTP id
 fj9-20020a056a003a0900b006c0fb5e7625ls1895174pfb.0.-pod-prod-05-us; Fri, 24
 Nov 2023 22:57:08 -0800 (PST)
X-Received: by 2002:a63:1019:0:b0:5bd:d69b:6f8 with SMTP id f25-20020a631019000000b005bdd69b06f8mr828234pgl.4.1700895428088;
        Fri, 24 Nov 2023 22:57:08 -0800 (PST)
Date: Fri, 24 Nov 2023 22:57:06 -0800 (PST)
From: =?UTF-8?B?5p2o56uj6L22?= <prodigyyanng@gmail.com>
To: Jailhouse <jailhouse-dev@googlegroups.com>
Message-Id: <893f2e46-c438-4182-859f-1f65af16f8d4n@googlegroups.com>
Subject: Jailhouse on OKMX8mq--C , "unable to open an initial console"
MIME-Version: 1.0
Content-Type: multipart/mixed; 
	boundary="----=_Part_74705_1196123780.1700895426752"
X-Original-Sender: prodigyyanng@gmail.com
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

------=_Part_74705_1196123780.1700895426752
Content-Type: multipart/alternative; 
	boundary="----=_Part_74706_1163055094.1700895426752"

------=_Part_74706_1163055094.1700895426752
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

I'm using a OKMX8MQ-C which from imx8, now i can boot the root cell and=20
some simple demp such as gic-demo. But when boot the non-root linux cell, i=
=20
face some problem.

I only use initramfs to boot non-root linux. Furthermore, my initramfs only=
=20
contains a helloworld and a console device. [I cannot use busybox to build=
=20
initramfs because my toolchain does not allow me to compile it]. My ramfs=
=20
directory is as follows=EF=BC=9A[image: =E6=88=AA=E5=B1=8F2023-11-25 14.49.=
49.png]

Then my startup command is as follows:

*cd /home/root/imx_jailhouse *
*insmod driver/jailhouse.ko *
*export PATH=3D/home/root/imx_jailhouse/tools:$PATH *

*jailhouse enable configs/arm64/imx8mq-veth.cell  *
*jailhouse cell linux configs/arm64/imx8mq-linux-demo.cell \ *
*                                 ~/Image2 -d \ *
*                                 ~/imx8mq-evk-inmate.dtb -i \ *
*                                  ~/rootfs.cpio.gz \ *
*                                 -c "clk_ignore_unused=20
console=3Dttymxc0,30860000,115200 earlycon=3Dec_imx6q,0x30860000,115200=20
root=3D/dev/ram ramdisk_size=3D10000000 rdinit=3D/hello rootwait rw "  *

Eventually, I got the following output=EF=BC=9A
root@imx8mqevk:~/imx_jailhouse# jailhouse cell linux=20
configs/arm64/imx8mq-linux-demo.cell \
_unused console=3Dttymxc0,30860000,115200 earlycon=3Dec_imx6q,0x30860000,11=
5200=20
root=3D/dev/ram ramdisk_size=3D10000000 rdinit=3D/hello rootwait rw "
>      ~/Image2 -d \
>     ~/imx8mq-evk-inmate.dtb -i \
>      ~/rootfs.cpio.gz \
>  -c "clk_ignore_unused console=3Dttymxc0,30860000,115200=20
earlycon=3Dec_imx6q,0x30860000,115200 root=3D/dev/ram ramdisk_size=3D100000=
00=20
rdinit=3D/hello rootwait rw "
[  567.018158] Ready to search binary handler...
[  567.023161] Finish search binary handler, ret=3D0...
[  567.029032] Ready to search binary handler...
[  567.033683] Finish search binary handler, ret=3D0...
[  567.039395] Ready to search binary handler...
[  567.044092] Finish search binary handler, ret=3D0...


[  567.365079] IRQ231: set affinity failed(-22).
[  567.365091] IRQ232: set affinity failed(-22).
[  567.365646] CPU2: shutdown
[  567.377126] psci: CPU2 killed.
[  567.424984] IRQ231: set affinity failed(-22).
[  567.424991] IRQ232: set affinity failed(-22).
[  567.425300] CPU3: shutdown
[  567.436789] psci: CPU3 killed.
Adding virtual PCI device 00:00.0 to cell "linux-inmate-demo"
Shared memory connection established: "linux-inmate-demo" <--> "imx8mq"
iommu_config_commit linux-inmate-demo
Created cell "linux-inmate-demo"
Page pool usage after cell creation: mem 111/995, remap 144/131072
[  567.473937] Created Jailhouse cell "linux-inmate-demo"
Cell "linux-inmate-demo" can be loaded

Started cell "linux-inmate-demo"

[    0.000000] Booting Linux on physical CPU 0x0000000002 [0x410fd034]
[    0.000000] Linux version 5.4.3 (azureuser@junyiyang-test) (gcc version=
=20
9.2.0 (GCC)) #46 SMP PREEMPT Fri Nov 24 09:06:54 UTC 2023
[    0.000000] Machine model: Freescale i.MX8MQ EVK
[    0.000000] earlycon: ec_imx6q0 at MMIO 0x0000000030860000 (options=20
'115200')
[    0.000000] printk: bootconsole [ec_imx6q0] enabled
[    0.000000] efi: Getting EFI parameters from FDT:
[    0.000000] efi: UEFI not found.
[    0.000000] cma: Reserved 320 MiB at 0x00000000e4000000
root@imx8mqevk:~/imx_jailhouse#=20
root@imx8mqevk:~/imx_jailhouse#=20
[    0.000000] NUMA: No NUMA configuration found
[    0.000000] NUMA: Faking a node at [mem=20
0x00000000d0000000-0x00000000f9bfffff]
[    0.000000] NUMA: NODE_DATA [mem 0xf9a97500-0xf9a98fff]
[    0.000000] Zone ranges:
[    0.000000]   DMA32    [mem 0x00000000d0000000-0x00000000f9bfffff]
[    0.000000]   Normal   empty
[    0.000000] Movable zone start for each node
[    0.000000] Early memory node ranges
[    0.000000]   node   0: [mem 0x00000000d0000000-0x00000000f9bfffff]
[    0.000000] Initmem setup node 0 [mem=20
0x00000000d0000000-0x00000000f9bfffff]
root@imx8mqevk:~/imx_jailhouse#=20
[    0.000000] psci: probing for conduit method from DT.
[    0.000000] psci: PSCIv1.1 detected in firmware.
[    0.000000] psci: Using standard PSCI v0.2 function IDs
[    0.000000] psci: MIGRATE_INFO_TYPE not supported.
[    0.000000] psci: SMC Calling Convention v1.1
[    0.000000] percpu: Embedded 24 pages/cpu s58968 r8192 d31144 u98304
[    0.000000] Detected VIPT I-cache on CPU0
[    0.000000] CPU features: detected: ARM erratum 845719
[    0.000000] CPU features: detected: GIC system register CPU interface
[    0.000000] Built 1 zonelists, mobility grouping on.  Total pages: 16833=
6
[    0.000000] Policy zone: DMA32
[    0.000000] Kernel command line: clk_ignore_unused=20
console=3Dttymxc0,30860000,115200 earlycon=3Dec_imx6q,0x30860000,115200=20
root=3D/dev/ram ramdisk_size=3D10000000 rdinit=3D/hello rootwait rw=20
[    0.000000] Dentry cache hash table entries: 131072 (order: 8, 1048576=
=20
bytes, linear)
[    0.000000] Inode-cache hash table entries: 65536 (order: 7, 524288=20
bytes, linear)
[    0.000000] mem auto-init: stack:off, heap alloc:off, heap free:off
root@imx8mqevk:~/imx_jailhouse#=20
[    0.000000] Memory: 307980K/684032K available (16508K kernel code, 1370K=
=20
rwdata, 6456K rodata, 2944K init, 1039K bss, 48372K reserved, 327680K=20
cma-reserved)
[    0.000000] SLUB: HWalign=3D64, Order=3D0-3, MinObjects=3D0, CPUs=3D2, N=
odes=3D1
[    0.000000] rcu: Preemptible hierarchical RCU implementation.
[    0.000000] rcu:     RCU restricting CPUs from NR_CPUS=3D256 to=20
nr_cpu_ids=3D2.
[    0.000000]  Tasks RCU enabled.
[    0.000000] rcu: RCU calculated value of scheduler-enlistment delay is=
=20
25 jiffies.
[    0.000000] rcu: Adjusting geometry for rcu_fanout_leaf=3D16, nr_cpu_ids=
=3D2
[    0.000000] NR_IRQS: 64, nr_irqs: 64, preallocated irqs: 0
[    0.000000] GICv3: 128 SPIs implemented
[    0.000000] GICv3: 0 Extended SPIs implemented
[    0.000000] GICv3: Distributor has no Range Selector support
[    0.000000] GICv3: 16 PPIs implemented
[    0.000000] GICv3: no VLPI support, no direct LPI support
[    0.000000] GICv3: CPU0: found redistributor 2 region=20
0:0x00000000388c0000
[    0.000000] ITS: No ITS available, not enabling LPIs
[    0.000000] random: get_random_bytes called from=20
start_kernel+0x2b8/0x44c with crng_init=3D0
[    0.000000] arch_timer: cp15 timer(s) running at 8.33MHz (virt).
[    0.000000] clocksource: arch_sys_counter: mask: 0xffffffffffffff=20
max_cycles: 0x1ec0311ec, max_idle_ns: 440795202152 ns
[    0.000005] sched_clock: 56 bits at 8MHz, resolution 120ns, wraps every=
=20
2199023255541ns
[    0.008316] Console: colour dummy device 80x25
[    0.012477] Calibrating delay loop (skipped), value calculated using=20
timer frequency.. 16.66 BogoMIPS (lpj=3D33333)
[    0.022666] pid_max: default: 32768 minimum: 301
[    0.027356] LSM: Security Framework initializing
[    0.031897] SELinux:  Initializing.
[    0.035422] Mount-cache hash table entries: 2048 (order: 2, 16384 bytes,=
=20
linear)
[    0.042725] Mountpoint-cache hash table entries: 2048 (order: 2, 16384=
=20
bytes, linear)
[    0.051555] init thread pid check: 1...
root@imx8mqevk:~/imx_jailhouse#=20
root@imx8mqevk:~/imx_jailhouse# [    0.074633] ASID allocator initialised=
=20
with 32768 entries
[    0.082633] rcu: Hierarchical SRCU implementation.
[    0.091290] EFI services will not be available.
[    0.098677] smp: Bringing up secondary CPUs ...
[    0.130824] Detected VIPT I-cache on CPU1
[    0.130870] GICv3: CPU1: found redistributor 3 region=20
0:0x00000000388e0000
[    0.130914] CPU1: Booted secondary processor 0x0000000003 [0x410fd034]
[    0.131020] smp: Brought up 1 node, 2 CPUs
[    0.149632] SMP: Total of 2 processors activated.
[    0.154314] CPU features: detected: 32-bit EL0 Support
[    0.159450] CPU features: detected: CRC32 instructions
[    0.177838] CPU: All CPU(s) started at EL1
[    0.179087] alternatives: patching kernel code
[    0.184973] devtmpfs: initialized
[    0.192187] clocksource: jiffies: mask: 0xffffffff max_cycles:=20
0xffffffff, max_idle_ns: 7645041785100000 ns
[    0.199073] futex hash table entries: 512 (order: 3, 32768 bytes, linear=
)
[    0.217026] pinctrl core: initialized pinctrl subsystem
[    0.220270] DMI not present or invalid.
[    0.223548] NET: Registered protocol family 16
[    0.243512] DMA: preallocated 256 KiB pool for atomic allocations
[    0.246762] audit: initializing netlink subsys (disabled)
[    0.252330] audit: type=3D2000 audit(0.212:1): state=3Dinitialized=20
audit_enabled=3D0 res=3D1
[    0.259890] cpuidle: using governor menu
[    0.264391] hw-breakpoint: found 6 breakpoint and 4 watchpoint registers=
.
[    0.271261] Serial: AMBA PL011 UART driver
[    0.274699] imx mu driver is registered.
[    0.278539] imx rpmsg driver is registered.
[    0.304587] HugeTLB registered 1.00 GiB page size, pre-allocated 0 pages
[    0.308453] HugeTLB registered 32.0 MiB page size, pre-allocated 0 pages
[    0.315123] HugeTLB registered 2.00 MiB page size, pre-allocated 0 pages
[    0.321805] HugeTLB registered 64.0 KiB page size, pre-allocated 0 pages
[    0.331139] cryptd: max_cpu_qlen set to 1000
[    0.339367] ACPI: Interpreter disabled.
[    0.340820] iommu: Default domain type: Translated=20
[    0.345428] vgaarb: loaded
[    0.348260] SCSI subsystem initialized
[    0.352060] usbcore: registered new interface driver usbfs
[    0.357446] usbcore: registered new interface driver hub
[    0.362457] usbcore: registered new device driver usb
[    0.367753] mc: Linux media interface: v0.10
[    0.371747] videodev: Linux video capture interface: v2.00
[    0.377234] pps_core: LinuxPPS API ver. 1 registered
[    0.382104] pps_core: Software ver. 5.3.6 - Copyright 2005-2007 Rodolfo=
=20
Giometti <giometti@linux.it>
[    0.391236] PTP clock support registered
[    0.395188] EDAC MC: Ver: 3.0.0
[    0.398960] No BMan portals available!
[    0.402252] QMan: Allocated lookup table at (____ptrval____), entry=20
count 65537
[    0.409524] No QMan portals available!
[    0.413314] No USDPAA memory, no 'fsl,usdpaa-mem' in device-tree
[    0.419312] FPGA manager framework
[    0.422483] Advanced Linux Sound Architecture Driver Initialized.
[    0.428969] Bluetooth: Core ver 2.22
[    0.432033] NET: Registered protocol family 31
[    0.436445] Bluetooth: HCI device and connection manager initialized
[    0.442785] Bluetooth: HCI socket layer initialized
[    0.447644] Bluetooth: L2CAP socket layer initialized
[    0.452688] Bluetooth: SCO socket layer initialized
[    0.458289] clocksource: Switched to clocksource arch_sys_counter
[    0.463791] VFS: Disk quotas dquot_6.6.0
[    0.467580] VFS: Dquot-cache hash table entries: 512 (order 0, 4096=20
bytes)
[    0.474589] pnp: PnP ACPI: disabled
[    0.486097] thermal_sys: Registered thermal governor 'step_wise'
[    0.486100] thermal_sys: Registered thermal governor 'power_allocator'
[    0.489479] NET: Registered protocol family 2
[    0.500595] tcp_listen_portaddr_hash hash table entries: 512 (order: 1,=
=20
8192 bytes, linear)
[    0.508479] TCP established hash table entries: 8192 (order: 4, 65536=20
bytes, linear)
[    0.516248] TCP bind hash table entries: 8192 (order: 5, 131072 bytes,=
=20
linear)
[    0.523523] TCP: Hash tables configured (established 8192 bind 8192)
[    0.529790] UDP hash table entries: 512 (order: 2, 16384 bytes, linear)
[    0.536336] UDP-Lite hash table entries: 512 (order: 2, 16384 bytes,=20
linear)
[    0.543469] NET: Registered protocol family 1
[    0.548165] RPC: Registered named UNIX socket transport module.
[    0.553581] RPC: Registered udp transport module.
[    0.558262] RPC: Registered tcp transport module.
[    0.562952] RPC: Registered tcp NFSv4.1 backchannel transport module.
[    0.569831] PCI: CLS 0 bytes, default 64
[    0.573504] Trying to unpack rootfs image as initramfs...
[    0.578681] Compressed data magic: 0x1f 0x8b
[    0.604372] Freeing initrd memory: 372K
[    0.606046] kvm [1]: HYP mode not available
[    0.616895] Initialise system trusted keyrings
[    0.618624] workingset: timestamp_bits=3D44 max_order=3D18 bucket_order=
=3D0
[    0.633665] squashfs: version 4.0 (2009/01/31) Phillip Lougher
[    0.637392] NFS: Registering the id_resolver key type
[    0.641713] Key type id_resolver registered
[    0.645848] Key type id_legacy registered
[    0.649848] nfs4filelayout_init: NFSv4 File Layout Driver Registering...
[    0.656543] jffs2: version 2.2. (NAND) =C2=A9 2001-2006 Red Hat, Inc.
[    0.663102] 9p: Installing v9fs 9p2000 file system support
[    0.688300] Key type asymmetric registered
[    0.689534] Asymmetric key parser 'x509' registered
[    0.694461] Block layer SCSI generic (bsg) driver version 0.4 loaded=20
(major 244)
[    0.701900] io scheduler mq-deadline registered
[    0.706301] io scheduler kyber registered
[    0.711544] pci-host-generic bfb00000.pci: host bridge /pci@bfb00000=20
ranges:
[    0.717352] pci-host-generic bfb00000.pci:   MEM 0x10000000..0x1000ffff=
=20
-> 0x10000000
[    0.725202] pci-host-generic bfb00000.pci: ECAM at [mem=20
0xbfb00000-0xbfbfffff] for [bus 00]
[    0.733608] pci-host-generic bfb00000.pci: PCI host bridge to bus 0000:0=
0
[    0.740249] pci_bus 0000:00: root bus resource [bus 00]
[    0.745450] pci_bus 0000:00: root bus resource [mem=20
0x10000000-0x1000ffff]
[    0.752335] pci 0000:00:00.0: [1af4:1110] type 00 class 0xff0100
[    0.758324] pci 0000:00:00.0: reg 0x10: [mem 0x00000000-0x000000ff 64bit=
]
[    0.766848] pci 0000:00:00.0: BAR 0: assigned [mem 0x10000000-0x100000ff=
=20
64bit]
[    0.773175] EINJ: ACPI disabled.
[    0.776584] Bus freq driver module loaded
[    0.780120] virtio-pci 0000:00:00.0: enabling device (0000 -> 0002)
[    0.789667] Serial: 8250/16550 driver, 4 ports, IRQ sharing enabled
[    0.794841] 30890000.serial: ttymxc1 at MMIO 0x30890000 (irq =3D 5,=20
base_baud =3D 1562500) is a IMX
[    0.812412] brd: module loaded
[    0.820118] loop: module loaded
[    0.822089] imx ahci driver is registered.
[    0.826835] libphy: Fixed MDIO Bus: probed
[    0.829601] tun: Universal TUN/TAP device driver, 1.6
[    0.833815] CAN device driver interface
[    0.837738] thunder_xcv, ver 1.0
[    0.840680] thunder_bgx, ver 1.0
[    0.843893] nicpf, ver 1.0
[    0.846753] Freescale FM module, FMD API version 21.1.0
[    0.851814] Freescale FM Ports module
[    0.855392] fsl_mac: fsl_mac: FSL FMan MAC API based driver
[    0.861005] fsl_dpa: FSL DPAA Ethernet driver
[    0.865334] fsl_advanced: FSL DPAA Advanced drivers:
[    0.870234] fsl_proxy: FSL DPAA Proxy initialization driver
[    0.875835] fsl_oh: FSL FMan Offline Parsing port driver
[    0.881572] hclge is initializing
[    0.884388] hns3: Hisilicon Ethernet Network Driver for Hip08 Family -=
=20
version
[    0.891589] hns3: Copyright (c) 2017 Huawei Corporation.
[    0.896938] e1000: Intel(R) PRO/1000 Network Driver - version=20
7.3.21-k8-NAPI
[    0.903916] e1000: Copyright (c) 1999-2006 Intel Corporation.
[    0.909688] e1000e: Intel(R) PRO/1000 Network Driver - 3.2.6-k
[    0.915505] e1000e: Copyright(c) 1999 - 2015 Intel Corporation.
[    0.921425] igb: Intel(R) Gigabit Ethernet Network Driver - version=20
5.6.0-k
[    0.928314] igb: Copyright (c) 2007-2014 Intel Corporation.
[    0.933910] igbvf: Intel(R) Gigabit Virtual Function Network Driver -=20
version 2.4.0-k
[    0.941683] igbvf: Copyright (c) 2009 - 2012 Intel Corporation.
[    0.947685] sky2: driver version 1.30
[    0.951424] usbcore: registered new interface driver asix
[    0.956652] usbcore: registered new interface driver ax88179_178a
[    0.962722] usbcore: registered new interface driver cdc_ether
[    0.968534] usbcore: registered new interface driver net1080
[    0.974179] usbcore: registered new interface driver cdc_subset
[    0.980082] usbcore: registered new interface driver zaurus
[    0.985654] usbcore: registered new interface driver cdc_ncm
[    0.991279] usbcore: registered new interface driver huawei_cdc_ncm
[    0.997535] usbcore: registered new interface driver qmi_wwan_q
[    1.003641] VFIO - User Level meta-driver version: 0.3
[    1.009455] ehci_hcd: USB 2.0 'Enhanced' Host Controller (EHCI) Driver
[    1.015039] ehci-pci: EHCI PCI platform driver
[    1.019496] ehci-platform: EHCI generic platform driver
[    1.024722] ohci_hcd: USB 1.1 'Open' Host Controller (OHCI) Driver
[    1.030839] ohci-pci: OHCI PCI platform driver
[    1.035296] ohci-platform: OHCI generic platform driver
[    1.040695] usbcore: registered new interface driver cdc_wdm
[    1.046156] usbcore: registered new interface driver usb-storage
[    1.052184] usbcore: registered new interface driver usbserial_generic
[    1.058636] usbserial: USB Serial support registered for generic
[    1.064625] usbcore: registered new interface driver option
[    1.070174] usbserial: USB Serial support registered for GSM modem=20
(1-port)
[    1.078254] <<-GTP-INFO->> GTP driver installing...
[    1.082821] i2c /dev entries driver
[    1.086604] Bluetooth: HCI UART driver ver 2.3
[    1.089846] Bluetooth: HCI UART protocol H4 registered
[    1.094981] Bluetooth: HCI UART protocol BCSP registered
[    1.100305] Bluetooth: HCI UART protocol LL registered
[    1.105394] Bluetooth: HCI UART protocol ATH3K registered
[    1.110796] Bluetooth: HCI UART protocol Three-wire (H5) registered
[    1.117092] Bluetooth: HCI UART protocol Broadcom registered
[    1.122689] Bluetooth: HCI UART protocol QCA registered
[    1.128079] imx-cpufreq-dt: probe of imx-cpufreq-dt failed with error -2
[    1.135773] sdhci: Secure Digital Host Controller Interface driver
[    1.140731] sdhci: Copyright(c) Pierre Ossman
[    1.145172] Synopsys Designware Multimedia Card Interface Driver
[    1.151282] sdhci-pltfm: SDHCI platform and OF driver helper
[    1.157247] ledtrig-cpu: registered to indicate activity on CPUs
[    1.163670] usbcore: registered new interface driver usbhid
[    1.168242] usbhid: USB HID core driver
[    1.172978] No fsl,qman node
[    1.174928] Freescale USDPAA process driver
[    1.179087] fsl-usdpaa: no region found
[    1.182907] Freescale USDPAA process IRQ driver
[    1.191715] NET: Registered protocol family 26
[    1.193427] Initializing XFRM netlink socket
[    1.198204] NET: Registered protocol family 10
[    1.202897] Segment Routing with IPv6
[    1.205680] NET: Registered protocol family 17
[    1.210087] can: controller area network core (rev 20170425 abi 9)
[    1.216272] NET: Registered protocol family 29
[    1.220654] can: raw protocol (rev 20170425)
[    1.224903] can: broadcast manager protocol (rev 20170425 t)
[    1.230548] can: netlink gateway (rev 20190810) max_hops=3D1
[    1.236247] Bluetooth: RFCOMM TTY layer initialized
[    1.240894] Bluetooth: RFCOMM socket layer initialized
[    1.246020] Bluetooth: RFCOMM ver 1.11
[    1.249739] Bluetooth: BNEP (Ethernet Emulation) ver 1.3
[    1.255024] Bluetooth: BNEP filters: protocol multicast
[    1.260238] Bluetooth: BNEP socket layer initialized
[    1.265180] Bluetooth: HIDP (Human Interface Emulation) ver 1.2
[    1.271085] Bluetooth: HIDP socket layer initialized
[    1.276074] 8021q: 802.1Q VLAN Support v1.8
[    1.280216] lib80211: common routines for IEEE802.11 drivers
[    1.285980] 9pnet: Installing 9P2000 support
[    1.290126] tsn generic netlink module v1 init...
[    1.294849] Key type dns_resolver registered
[    1.299721] registered taskstats version 1
[    1.303120] Loading compiled-in X.509 certificates
[    1.310428] hctosys: unable to open rtc device (rtc0)
[    1.313111] cfg80211: Loading compiled-in X.509 certificates for=20
regulatory database
[    1.322641] cfg80211: Loaded X.509 cert 'sforshee: 00b28ddf47aef9cea7'
[    1.327262] platform regulatory.0: Direct firmware load for=20
regulatory.db failed with error -2
[    1.330307] clk: Not disabling unused clocks
[    1.335778] platform regulatory.0: Falling back to sysfs fallback for:=
=20
regulatory.db
[    1.340026] ALSA device list:
[    1.350686]   No soundcards found.
[    1.354101] The error code is -2
*[    1.357282] Warning: unable to open an initial console.*
[    1.363973] Freeing unused kernel memory: 2944K
[    1.382376] Run /hello as init process
[    1.383398] Ready to search binary handler...
[    1.387791] Finish search binary handler, ret=3D0...


My console cannot output the printf code in the helloworld program. I can't=
=20
solve this problem anyway. Can you help me solve it?

imx8mq-evk-inmate.dts: (for non-root-cell linux)
&uart2 {
clocks =3D <&osc_25m>,
<&osc_25m>;
clock-names =3D "ipg", "per";
/delete-property/ dmas;
/delete-property/ dmas-names;
status =3D "okay";
};

ok8mq-evk-root.dts (for root cell )
&uart1 {
/* uart2 is used by the 2nd OS, so configure pin and clk */
pinctrl-0 =3D <&pinctrl_uart1>, <&pinctrl_uart2>;
assigned-clocks =3D <&clk IMX8MQ_CLK_UART1>,
<&clk IMX8MQ_CLK_UART2>;
assigned-clock-parents =3D <&clk IMX8MQ_CLK_25M>,
<&clk IMX8MQ_CLK_25M>;
};

--=20
You received this message because you are subscribed to the Google Groups "=
Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/=
jailhouse-dev/893f2e46-c438-4182-859f-1f65af16f8d4n%40googlegroups.com.

------=_Part_74706_1163055094.1700895426752
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

I'm using a OKMX8MQ-C which from imx8, now i can boot the root cell and som=
e simple demp such as gic-demo. But when boot the non-root linux cell, i fa=
ce some problem.<div><br /></div><div>I only use initramfs to boot non-root=
 linux. Furthermore, my initramfs only contains a helloworld and a console =
device. [I cannot use busybox to build initramfs because my toolchain does =
not allow me to compile it]. My ramfs directory is as follows=EF=BC=9A<img =
alt=3D"=E6=88=AA=E5=B1=8F2023-11-25 14.49.49.png" width=3D"534px" height=3D=
"152px" src=3D"cid:f5a8a7cb-9650-4e84-9833-902fd7c12597" /><br /></div><div=
><br /></div><div>Then my startup command is as follows:<br /></div><div><b=
r /></div><div><b>cd /home/root/imx_jailhouse=C2=A0</b></div><div><b>insmod=
 driver/jailhouse.ko=C2=A0</b></div><div><b>export PATH=3D/home/root/imx_ja=
ilhouse/tools:$PATH=C2=A0</b></div><div><b>jailhouse enable configs/arm64/i=
mx8mq-veth.cell=C2=A0=C2=A0<br /></b></div><div><b>jailhouse cell linux con=
figs/arm64/imx8mq-linux-demo.cell \=C2=A0</b></div><div><b>=C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0~/Image2 -d \=C2=A0</b></div><div><b>=C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0~/imx8mq-evk-inmate.dtb -i \=C2=A0</b=
></div><div><b>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ~/rootfs.cpio.g=
z \=C2=A0</b></div><div><b>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0-c "c=
lk_ignore_unused console=3Dttymxc0,30860000,115200 earlycon=3Dec_imx6q,0x30=
860000,115200 root=3D/dev/ram ramdisk_size=3D10000000 rdinit=3D/hello rootw=
ait rw "=C2=A0=C2=A0</b><br /></div><div><b><br /></b></div><div>Eventually=
, I got the following output=EF=BC=9A<b><br /></b></div><div>root@imx8mqevk=
:~/imx_jailhouse# jailhouse cell linux configs/arm64/imx8mq-linux-demo.cell=
 \<br />_unused console=3Dttymxc0,30860000,115200 earlycon=3Dec_imx6q,0x308=
60000,115200 root=3D/dev/ram ramdisk_size=3D10000000 rdinit=3D/hello rootwa=
it rw "<br />&gt; =C2=A0 =C2=A0 =C2=A0~/Image2 -d \<br />&gt; =C2=A0 =C2=A0=
 ~/imx8mq-evk-inmate.dtb -i \<br />&gt; =C2=A0 =C2=A0 =C2=A0~/rootfs.cpio.g=
z \<br />&gt; =C2=A0-c "clk_ignore_unused console=3Dttymxc0,30860000,115200=
 earlycon=3Dec_imx6q,0x30860000,115200 root=3D/dev/ram ramdisk_size=3D10000=
000 rdinit=3D/hello rootwait rw "<br />[ =C2=A0567.018158] Ready to search =
binary handler...<br />[ =C2=A0567.023161] Finish search binary handler, re=
t=3D0...<br />[ =C2=A0567.029032] Ready to search binary handler...<br />[ =
=C2=A0567.033683] Finish search binary handler, ret=3D0...<br />[ =C2=A0567=
.039395] Ready to search binary handler...<br />[ =C2=A0567.044092] Finish =
search binary handler, ret=3D0...<br /><br /><br />[ =C2=A0567.365079] IRQ2=
31: set affinity failed(-22).<br />[ =C2=A0567.365091] IRQ232: set affinity=
 failed(-22).<br />[ =C2=A0567.365646] CPU2: shutdown<br />[ =C2=A0567.3771=
26] psci: CPU2 killed.<br />[ =C2=A0567.424984] IRQ231: set affinity failed=
(-22).<br />[ =C2=A0567.424991] IRQ232: set affinity failed(-22).<br />[ =
=C2=A0567.425300] CPU3: shutdown<br />[ =C2=A0567.436789] psci: CPU3 killed=
.<br />Adding virtual PCI device 00:00.0 to cell "linux-inmate-demo"<br />S=
hared memory connection established: "linux-inmate-demo" &lt;--&gt; "imx8mq=
"<br />iommu_config_commit linux-inmate-demo<br />Created cell "linux-inmat=
e-demo"<br />Page pool usage after cell creation: mem 111/995, remap 144/13=
1072<br />[ =C2=A0567.473937] Created Jailhouse cell "linux-inmate-demo"<br=
 />Cell "linux-inmate-demo" can be loaded<br /><br />Started cell "linux-in=
mate-demo"<br /><br />[ =C2=A0 =C2=A00.000000] Booting Linux on physical CP=
U 0x0000000002 [0x410fd034]<br />[ =C2=A0 =C2=A00.000000] Linux version 5.4=
.3 (azureuser@junyiyang-test) (gcc version 9.2.0 (GCC)) #46 SMP PREEMPT Fri=
 Nov 24 09:06:54 UTC 2023<br />[ =C2=A0 =C2=A00.000000] Machine model: Free=
scale i.MX8MQ EVK<br />[ =C2=A0 =C2=A00.000000] earlycon: ec_imx6q0 at MMIO=
 0x0000000030860000 (options '115200')<br />[ =C2=A0 =C2=A00.000000] printk=
: bootconsole [ec_imx6q0] enabled<br />[ =C2=A0 =C2=A00.000000] efi: Gettin=
g EFI parameters from FDT:<br />[ =C2=A0 =C2=A00.000000] efi: UEFI not foun=
d.<br />[ =C2=A0 =C2=A00.000000] cma: Reserved 320 MiB at 0x00000000e400000=
0<br />root@imx8mqevk:~/imx_jailhouse# <br />root@imx8mqevk:~/imx_jailhouse=
# <br />[ =C2=A0 =C2=A00.000000] NUMA: No NUMA configuration found<br />[ =
=C2=A0 =C2=A00.000000] NUMA: Faking a node at [mem 0x00000000d0000000-0x000=
00000f9bfffff]<br />[ =C2=A0 =C2=A00.000000] NUMA: NODE_DATA [mem 0xf9a9750=
0-0xf9a98fff]<br />[ =C2=A0 =C2=A00.000000] Zone ranges:<br />[ =C2=A0 =C2=
=A00.000000] =C2=A0 DMA32 =C2=A0 =C2=A0[mem 0x00000000d0000000-0x00000000f9=
bfffff]<br />[ =C2=A0 =C2=A00.000000] =C2=A0 Normal =C2=A0 empty<br />[ =C2=
=A0 =C2=A00.000000] Movable zone start for each node<br />[ =C2=A0 =C2=A00.=
000000] Early memory node ranges<br />[ =C2=A0 =C2=A00.000000] =C2=A0 node =
=C2=A0 0: [mem 0x00000000d0000000-0x00000000f9bfffff]<br />[ =C2=A0 =C2=A00=
.000000] Initmem setup node 0 [mem 0x00000000d0000000-0x00000000f9bfffff]<b=
r />root@imx8mqevk:~/imx_jailhouse# <br />[ =C2=A0 =C2=A00.000000] psci: pr=
obing for conduit method from DT.<br />[ =C2=A0 =C2=A00.000000] psci: PSCIv=
1.1 detected in firmware.<br />[ =C2=A0 =C2=A00.000000] psci: Using standar=
d PSCI v0.2 function IDs<br />[ =C2=A0 =C2=A00.000000] psci: MIGRATE_INFO_T=
YPE not supported.<br />[ =C2=A0 =C2=A00.000000] psci: SMC Calling Conventi=
on v1.1<br />[ =C2=A0 =C2=A00.000000] percpu: Embedded 24 pages/cpu s58968 =
r8192 d31144 u98304<br />[ =C2=A0 =C2=A00.000000] Detected VIPT I-cache on =
CPU0<br />[ =C2=A0 =C2=A00.000000] CPU features: detected: ARM erratum 8457=
19<br />[ =C2=A0 =C2=A00.000000] CPU features: detected: GIC system registe=
r CPU interface<br />[ =C2=A0 =C2=A00.000000] Built 1 zonelists, mobility g=
rouping on. =C2=A0Total pages: 168336<br />[ =C2=A0 =C2=A00.000000] Policy =
zone: DMA32<br />[ =C2=A0 =C2=A00.000000] Kernel command line: clk_ignore_u=
nused console=3Dttymxc0,30860000,115200 earlycon=3Dec_imx6q,0x30860000,1152=
00 root=3D/dev/ram ramdisk_size=3D10000000 rdinit=3D/hello rootwait rw <br =
/>[ =C2=A0 =C2=A00.000000] Dentry cache hash table entries: 131072 (order: =
8, 1048576 bytes, linear)<br />[ =C2=A0 =C2=A00.000000] Inode-cache hash ta=
ble entries: 65536 (order: 7, 524288 bytes, linear)<br />[ =C2=A0 =C2=A00.0=
00000] mem auto-init: stack:off, heap alloc:off, heap free:off<br />root@im=
x8mqevk:~/imx_jailhouse# <br />[ =C2=A0 =C2=A00.000000] Memory: 307980K/684=
032K available (16508K kernel code, 1370K rwdata, 6456K rodata, 2944K init,=
 1039K bss, 48372K reserved, 327680K cma-reserved)<br />[ =C2=A0 =C2=A00.00=
0000] SLUB: HWalign=3D64, Order=3D0-3, MinObjects=3D0, CPUs=3D2, Nodes=3D1<=
br />[ =C2=A0 =C2=A00.000000] rcu: Preemptible hierarchical RCU implementat=
ion.<br />[ =C2=A0 =C2=A00.000000] rcu: =C2=A0 =C2=A0 RCU restricting CPUs =
from NR_CPUS=3D256 to nr_cpu_ids=3D2.<br />[ =C2=A0 =C2=A00.000000] =C2=A0T=
asks RCU enabled.<br />[ =C2=A0 =C2=A00.000000] rcu: RCU calculated value o=
f scheduler-enlistment delay is 25 jiffies.<br />[ =C2=A0 =C2=A00.000000] r=
cu: Adjusting geometry for rcu_fanout_leaf=3D16, nr_cpu_ids=3D2<br />[ =C2=
=A0 =C2=A00.000000] NR_IRQS: 64, nr_irqs: 64, preallocated irqs: 0<br />[ =
=C2=A0 =C2=A00.000000] GICv3: 128 SPIs implemented<br />[ =C2=A0 =C2=A00.00=
0000] GICv3: 0 Extended SPIs implemented<br />[ =C2=A0 =C2=A00.000000] GICv=
3: Distributor has no Range Selector support<br />[ =C2=A0 =C2=A00.000000] =
GICv3: 16 PPIs implemented<br />[ =C2=A0 =C2=A00.000000] GICv3: no VLPI sup=
port, no direct LPI support<br />[ =C2=A0 =C2=A00.000000] GICv3: CPU0: foun=
d redistributor 2 region 0:0x00000000388c0000<br />[ =C2=A0 =C2=A00.000000]=
 ITS: No ITS available, not enabling LPIs<br />[ =C2=A0 =C2=A00.000000] ran=
dom: get_random_bytes called from start_kernel+0x2b8/0x44c with crng_init=
=3D0<br />[ =C2=A0 =C2=A00.000000] arch_timer: cp15 timer(s) running at 8.3=
3MHz (virt).<br />[ =C2=A0 =C2=A00.000000] clocksource: arch_sys_counter: m=
ask: 0xffffffffffffff max_cycles: 0x1ec0311ec, max_idle_ns: 440795202152 ns=
<br />[ =C2=A0 =C2=A00.000005] sched_clock: 56 bits at 8MHz, resolution 120=
ns, wraps every 2199023255541ns<br />[ =C2=A0 =C2=A00.008316] Console: colo=
ur dummy device 80x25<br />[ =C2=A0 =C2=A00.012477] Calibrating delay loop =
(skipped), value calculated using timer frequency.. 16.66 BogoMIPS (lpj=3D3=
3333)<br />[ =C2=A0 =C2=A00.022666] pid_max: default: 32768 minimum: 301<br=
 />[ =C2=A0 =C2=A00.027356] LSM: Security Framework initializing<br />[ =C2=
=A0 =C2=A00.031897] SELinux: =C2=A0Initializing.<br />[ =C2=A0 =C2=A00.0354=
22] Mount-cache hash table entries: 2048 (order: 2, 16384 bytes, linear)<br=
 />[ =C2=A0 =C2=A00.042725] Mountpoint-cache hash table entries: 2048 (orde=
r: 2, 16384 bytes, linear)<br />[ =C2=A0 =C2=A00.051555] init thread pid ch=
eck: 1...<br />root@imx8mqevk:~/imx_jailhouse# <br />root@imx8mqevk:~/imx_j=
ailhouse# [ =C2=A0 =C2=A00.074633] ASID allocator initialised with 32768 en=
tries<br />[ =C2=A0 =C2=A00.082633] rcu: Hierarchical SRCU implementation.<=
br />[ =C2=A0 =C2=A00.091290] EFI services will not be available.<br />[ =
=C2=A0 =C2=A00.098677] smp: Bringing up secondary CPUs ...<br />[ =C2=A0 =
=C2=A00.130824] Detected VIPT I-cache on CPU1<br />[ =C2=A0 =C2=A00.130870]=
 GICv3: CPU1: found redistributor 3 region 0:0x00000000388e0000<br />[ =C2=
=A0 =C2=A00.130914] CPU1: Booted secondary processor 0x0000000003 [0x410fd0=
34]<br />[ =C2=A0 =C2=A00.131020] smp: Brought up 1 node, 2 CPUs<br />[ =C2=
=A0 =C2=A00.149632] SMP: Total of 2 processors activated.<br />[ =C2=A0 =C2=
=A00.154314] CPU features: detected: 32-bit EL0 Support<br />[ =C2=A0 =C2=
=A00.159450] CPU features: detected: CRC32 instructions<br />[ =C2=A0 =C2=
=A00.177838] CPU: All CPU(s) started at EL1<br />[ =C2=A0 =C2=A00.179087] a=
lternatives: patching kernel code<br />[ =C2=A0 =C2=A00.184973] devtmpfs: i=
nitialized<br />[ =C2=A0 =C2=A00.192187] clocksource: jiffies: mask: 0xffff=
ffff max_cycles: 0xffffffff, max_idle_ns: 7645041785100000 ns<br />[ =C2=A0=
 =C2=A00.199073] futex hash table entries: 512 (order: 3, 32768 bytes, line=
ar)<br />[ =C2=A0 =C2=A00.217026] pinctrl core: initialized pinctrl subsyst=
em<br />[ =C2=A0 =C2=A00.220270] DMI not present or invalid.<br />[ =C2=A0 =
=C2=A00.223548] NET: Registered protocol family 16<br />[ =C2=A0 =C2=A00.24=
3512] DMA: preallocated 256 KiB pool for atomic allocations<br />[ =C2=A0 =
=C2=A00.246762] audit: initializing netlink subsys (disabled)<br />[ =C2=A0=
 =C2=A00.252330] audit: type=3D2000 audit(0.212:1): state=3Dinitialized aud=
it_enabled=3D0 res=3D1<br />[ =C2=A0 =C2=A00.259890] cpuidle: using governo=
r menu<br />[ =C2=A0 =C2=A00.264391] hw-breakpoint: found 6 breakpoint and =
4 watchpoint registers.<br />[ =C2=A0 =C2=A00.271261] Serial: AMBA PL011 UA=
RT driver<br />[ =C2=A0 =C2=A00.274699] imx mu driver is registered.<br />[=
 =C2=A0 =C2=A00.278539] imx rpmsg driver is registered.<br />[ =C2=A0 =C2=
=A00.304587] HugeTLB registered 1.00 GiB page size, pre-allocated 0 pages<b=
r />[ =C2=A0 =C2=A00.308453] HugeTLB registered 32.0 MiB page size, pre-all=
ocated 0 pages<br />[ =C2=A0 =C2=A00.315123] HugeTLB registered 2.00 MiB pa=
ge size, pre-allocated 0 pages<br />[ =C2=A0 =C2=A00.321805] HugeTLB regist=
ered 64.0 KiB page size, pre-allocated 0 pages<br />[ =C2=A0 =C2=A00.331139=
] cryptd: max_cpu_qlen set to 1000<br />[ =C2=A0 =C2=A00.339367] ACPI: Inte=
rpreter disabled.<br />[ =C2=A0 =C2=A00.340820] iommu: Default domain type:=
 Translated <br />[ =C2=A0 =C2=A00.345428] vgaarb: loaded<br />[ =C2=A0 =C2=
=A00.348260] SCSI subsystem initialized<br />[ =C2=A0 =C2=A00.352060] usbco=
re: registered new interface driver usbfs<br />[ =C2=A0 =C2=A00.357446] usb=
core: registered new interface driver hub<br />[ =C2=A0 =C2=A00.362457] usb=
core: registered new device driver usb<br />[ =C2=A0 =C2=A00.367753] mc: Li=
nux media interface: v0.10<br />[ =C2=A0 =C2=A00.371747] videodev: Linux vi=
deo capture interface: v2.00<br />[ =C2=A0 =C2=A00.377234] pps_core: LinuxP=
PS API ver. 1 registered<br />[ =C2=A0 =C2=A00.382104] pps_core: Software v=
er. 5.3.6 - Copyright 2005-2007 Rodolfo Giometti &lt;giometti@linux.it&gt;<=
br />[ =C2=A0 =C2=A00.391236] PTP clock support registered<br />[ =C2=A0 =
=C2=A00.395188] EDAC MC: Ver: 3.0.0<br />[ =C2=A0 =C2=A00.398960] No BMan p=
ortals available!<br />[ =C2=A0 =C2=A00.402252] QMan: Allocated lookup tabl=
e at (____ptrval____), entry count 65537<br />[ =C2=A0 =C2=A00.409524] No Q=
Man portals available!<br />[ =C2=A0 =C2=A00.413314] No USDPAA memory, no '=
fsl,usdpaa-mem' in device-tree<br />[ =C2=A0 =C2=A00.419312] FPGA manager f=
ramework<br />[ =C2=A0 =C2=A00.422483] Advanced Linux Sound Architecture Dr=
iver Initialized.<br />[ =C2=A0 =C2=A00.428969] Bluetooth: Core ver 2.22<br=
 />[ =C2=A0 =C2=A00.432033] NET: Registered protocol family 31<br />[ =C2=
=A0 =C2=A00.436445] Bluetooth: HCI device and connection manager initialize=
d<br />[ =C2=A0 =C2=A00.442785] Bluetooth: HCI socket layer initialized<br =
/>[ =C2=A0 =C2=A00.447644] Bluetooth: L2CAP socket layer initialized<br />[=
 =C2=A0 =C2=A00.452688] Bluetooth: SCO socket layer initialized<br />[ =C2=
=A0 =C2=A00.458289] clocksource: Switched to clocksource arch_sys_counter<b=
r />[ =C2=A0 =C2=A00.463791] VFS: Disk quotas dquot_6.6.0<br />[ =C2=A0 =C2=
=A00.467580] VFS: Dquot-cache hash table entries: 512 (order 0, 4096 bytes)=
<br />[ =C2=A0 =C2=A00.474589] pnp: PnP ACPI: disabled<br />[ =C2=A0 =C2=A0=
0.486097] thermal_sys: Registered thermal governor 'step_wise'<br />[ =C2=
=A0 =C2=A00.486100] thermal_sys: Registered thermal governor 'power_allocat=
or'<br />[ =C2=A0 =C2=A00.489479] NET: Registered protocol family 2<br />[ =
=C2=A0 =C2=A00.500595] tcp_listen_portaddr_hash hash table entries: 512 (or=
der: 1, 8192 bytes, linear)<br />[ =C2=A0 =C2=A00.508479] TCP established h=
ash table entries: 8192 (order: 4, 65536 bytes, linear)<br />[ =C2=A0 =C2=
=A00.516248] TCP bind hash table entries: 8192 (order: 5, 131072 bytes, lin=
ear)<br />[ =C2=A0 =C2=A00.523523] TCP: Hash tables configured (established=
 8192 bind 8192)<br />[ =C2=A0 =C2=A00.529790] UDP hash table entries: 512 =
(order: 2, 16384 bytes, linear)<br />[ =C2=A0 =C2=A00.536336] UDP-Lite hash=
 table entries: 512 (order: 2, 16384 bytes, linear)<br />[ =C2=A0 =C2=A00.5=
43469] NET: Registered protocol family 1<br />[ =C2=A0 =C2=A00.548165] RPC:=
 Registered named UNIX socket transport module.<br />[ =C2=A0 =C2=A00.55358=
1] RPC: Registered udp transport module.<br />[ =C2=A0 =C2=A00.558262] RPC:=
 Registered tcp transport module.<br />[ =C2=A0 =C2=A00.562952] RPC: Regist=
ered tcp NFSv4.1 backchannel transport module.<br />[ =C2=A0 =C2=A00.569831=
] PCI: CLS 0 bytes, default 64<br />[ =C2=A0 =C2=A00.573504] Trying to unpa=
ck rootfs image as initramfs...<br />[ =C2=A0 =C2=A00.578681] Compressed da=
ta magic: 0x1f 0x8b<br />[ =C2=A0 =C2=A00.604372] Freeing initrd memory: 37=
2K<br />[ =C2=A0 =C2=A00.606046] kvm [1]: HYP mode not available<br />[ =C2=
=A0 =C2=A00.616895] Initialise system trusted keyrings<br />[ =C2=A0 =C2=A0=
0.618624] workingset: timestamp_bits=3D44 max_order=3D18 bucket_order=3D0<b=
r />[ =C2=A0 =C2=A00.633665] squashfs: version 4.0 (2009/01/31) Phillip Lou=
gher<br />[ =C2=A0 =C2=A00.637392] NFS: Registering the id_resolver key typ=
e<br />[ =C2=A0 =C2=A00.641713] Key type id_resolver registered<br />[ =C2=
=A0 =C2=A00.645848] Key type id_legacy registered<br />[ =C2=A0 =C2=A00.649=
848] nfs4filelayout_init: NFSv4 File Layout Driver Registering...<br />[ =
=C2=A0 =C2=A00.656543] jffs2: version 2.2. (NAND) =C2=A9 2001-2006 Red Hat,=
 Inc.<br />[ =C2=A0 =C2=A00.663102] 9p: Installing v9fs 9p2000 file system =
support<br />[ =C2=A0 =C2=A00.688300] Key type asymmetric registered<br />[=
 =C2=A0 =C2=A00.689534] Asymmetric key parser 'x509' registered<br />[ =C2=
=A0 =C2=A00.694461] Block layer SCSI generic (bsg) driver version 0.4 loade=
d (major 244)<br />[ =C2=A0 =C2=A00.701900] io scheduler mq-deadline regist=
ered<br />[ =C2=A0 =C2=A00.706301] io scheduler kyber registered<br />[ =C2=
=A0 =C2=A00.711544] pci-host-generic bfb00000.pci: host bridge /pci@bfb0000=
0 ranges:<br />[ =C2=A0 =C2=A00.717352] pci-host-generic bfb00000.pci: =C2=
=A0 MEM 0x10000000..0x1000ffff -&gt; 0x10000000<br />[ =C2=A0 =C2=A00.72520=
2] pci-host-generic bfb00000.pci: ECAM at [mem 0xbfb00000-0xbfbfffff] for [=
bus 00]<br />[ =C2=A0 =C2=A00.733608] pci-host-generic bfb00000.pci: PCI ho=
st bridge to bus 0000:00<br />[ =C2=A0 =C2=A00.740249] pci_bus 0000:00: roo=
t bus resource [bus 00]<br />[ =C2=A0 =C2=A00.745450] pci_bus 0000:00: root=
 bus resource [mem 0x10000000-0x1000ffff]<br />[ =C2=A0 =C2=A00.752335] pci=
 0000:00:00.0: [1af4:1110] type 00 class 0xff0100<br />[ =C2=A0 =C2=A00.758=
324] pci 0000:00:00.0: reg 0x10: [mem 0x00000000-0x000000ff 64bit]<br />[ =
=C2=A0 =C2=A00.766848] pci 0000:00:00.0: BAR 0: assigned [mem 0x10000000-0x=
100000ff 64bit]<br />[ =C2=A0 =C2=A00.773175] EINJ: ACPI disabled.<br />[ =
=C2=A0 =C2=A00.776584] Bus freq driver module loaded<br />[ =C2=A0 =C2=A00.=
780120] virtio-pci 0000:00:00.0: enabling device (0000 -&gt; 0002)<br />[ =
=C2=A0 =C2=A00.789667] Serial: 8250/16550 driver, 4 ports, IRQ sharing enab=
led<br />[ =C2=A0 =C2=A00.794841] 30890000.serial: ttymxc1 at MMIO 0x308900=
00 (irq =3D 5, base_baud =3D 1562500) is a IMX<br />[ =C2=A0 =C2=A00.812412=
] brd: module loaded<br />[ =C2=A0 =C2=A00.820118] loop: module loaded<br /=
>[ =C2=A0 =C2=A00.822089] imx ahci driver is registered.<br />[ =C2=A0 =C2=
=A00.826835] libphy: Fixed MDIO Bus: probed<br />[ =C2=A0 =C2=A00.829601] t=
un: Universal TUN/TAP device driver, 1.6<br />[ =C2=A0 =C2=A00.833815] CAN =
device driver interface<br />[ =C2=A0 =C2=A00.837738] thunder_xcv, ver 1.0<=
br />[ =C2=A0 =C2=A00.840680] thunder_bgx, ver 1.0<br />[ =C2=A0 =C2=A00.84=
3893] nicpf, ver 1.0<br />[ =C2=A0 =C2=A00.846753] Freescale FM module, FMD=
 API version 21.1.0<br />[ =C2=A0 =C2=A00.851814] Freescale FM Ports module=
<br />[ =C2=A0 =C2=A00.855392] fsl_mac: fsl_mac: FSL FMan MAC API based dri=
ver<br />[ =C2=A0 =C2=A00.861005] fsl_dpa: FSL DPAA Ethernet driver<br />[ =
=C2=A0 =C2=A00.865334] fsl_advanced: FSL DPAA Advanced drivers:<br />[ =C2=
=A0 =C2=A00.870234] fsl_proxy: FSL DPAA Proxy initialization driver<br />[ =
=C2=A0 =C2=A00.875835] fsl_oh: FSL FMan Offline Parsing port driver<br />[ =
=C2=A0 =C2=A00.881572] hclge is initializing<br />[ =C2=A0 =C2=A00.884388] =
hns3: Hisilicon Ethernet Network Driver for Hip08 Family - version<br />[ =
=C2=A0 =C2=A00.891589] hns3: Copyright (c) 2017 Huawei Corporation.<br />[ =
=C2=A0 =C2=A00.896938] e1000: Intel(R) PRO/1000 Network Driver - version 7.=
3.21-k8-NAPI<br />[ =C2=A0 =C2=A00.903916] e1000: Copyright (c) 1999-2006 I=
ntel Corporation.<br />[ =C2=A0 =C2=A00.909688] e1000e: Intel(R) PRO/1000 N=
etwork Driver - 3.2.6-k<br />[ =C2=A0 =C2=A00.915505] e1000e: Copyright(c) =
1999 - 2015 Intel Corporation.<br />[ =C2=A0 =C2=A00.921425] igb: Intel(R) =
Gigabit Ethernet Network Driver - version 5.6.0-k<br />[ =C2=A0 =C2=A00.928=
314] igb: Copyright (c) 2007-2014 Intel Corporation.<br />[ =C2=A0 =C2=A00.=
933910] igbvf: Intel(R) Gigabit Virtual Function Network Driver - version 2=
.4.0-k<br />[ =C2=A0 =C2=A00.941683] igbvf: Copyright (c) 2009 - 2012 Intel=
 Corporation.<br />[ =C2=A0 =C2=A00.947685] sky2: driver version 1.30<br />=
[ =C2=A0 =C2=A00.951424] usbcore: registered new interface driver asix<br /=
>[ =C2=A0 =C2=A00.956652] usbcore: registered new interface driver ax88179_=
178a<br />[ =C2=A0 =C2=A00.962722] usbcore: registered new interface driver=
 cdc_ether<br />[ =C2=A0 =C2=A00.968534] usbcore: registered new interface =
driver net1080<br />[ =C2=A0 =C2=A00.974179] usbcore: registered new interf=
ace driver cdc_subset<br />[ =C2=A0 =C2=A00.980082] usbcore: registered new=
 interface driver zaurus<br />[ =C2=A0 =C2=A00.985654] usbcore: registered =
new interface driver cdc_ncm<br />[ =C2=A0 =C2=A00.991279] usbcore: registe=
red new interface driver huawei_cdc_ncm<br />[ =C2=A0 =C2=A00.997535] usbco=
re: registered new interface driver qmi_wwan_q<br />[ =C2=A0 =C2=A01.003641=
] VFIO - User Level meta-driver version: 0.3<br />[ =C2=A0 =C2=A01.009455] =
ehci_hcd: USB 2.0 'Enhanced' Host Controller (EHCI) Driver<br />[ =C2=A0 =
=C2=A01.015039] ehci-pci: EHCI PCI platform driver<br />[ =C2=A0 =C2=A01.01=
9496] ehci-platform: EHCI generic platform driver<br />[ =C2=A0 =C2=A01.024=
722] ohci_hcd: USB 1.1 'Open' Host Controller (OHCI) Driver<br />[ =C2=A0 =
=C2=A01.030839] ohci-pci: OHCI PCI platform driver<br />[ =C2=A0 =C2=A01.03=
5296] ohci-platform: OHCI generic platform driver<br />[ =C2=A0 =C2=A01.040=
695] usbcore: registered new interface driver cdc_wdm<br />[ =C2=A0 =C2=A01=
.046156] usbcore: registered new interface driver usb-storage<br />[ =C2=A0=
 =C2=A01.052184] usbcore: registered new interface driver usbserial_generic=
<br />[ =C2=A0 =C2=A01.058636] usbserial: USB Serial support registered for=
 generic<br />[ =C2=A0 =C2=A01.064625] usbcore: registered new interface dr=
iver option<br />[ =C2=A0 =C2=A01.070174] usbserial: USB Serial support reg=
istered for GSM modem (1-port)<br />[ =C2=A0 =C2=A01.078254] &lt;&lt;-GTP-I=
NFO-&gt;&gt; GTP driver installing...<br />[ =C2=A0 =C2=A01.082821] i2c /de=
v entries driver<br />[ =C2=A0 =C2=A01.086604] Bluetooth: HCI UART driver v=
er 2.3<br />[ =C2=A0 =C2=A01.089846] Bluetooth: HCI UART protocol H4 regist=
ered<br />[ =C2=A0 =C2=A01.094981] Bluetooth: HCI UART protocol BCSP regist=
ered<br />[ =C2=A0 =C2=A01.100305] Bluetooth: HCI UART protocol LL register=
ed<br />[ =C2=A0 =C2=A01.105394] Bluetooth: HCI UART protocol ATH3K registe=
red<br />[ =C2=A0 =C2=A01.110796] Bluetooth: HCI UART protocol Three-wire (=
H5) registered<br />[ =C2=A0 =C2=A01.117092] Bluetooth: HCI UART protocol B=
roadcom registered<br />[ =C2=A0 =C2=A01.122689] Bluetooth: HCI UART protoc=
ol QCA registered<br />[ =C2=A0 =C2=A01.128079] imx-cpufreq-dt: probe of im=
x-cpufreq-dt failed with error -2<br />[ =C2=A0 =C2=A01.135773] sdhci: Secu=
re Digital Host Controller Interface driver<br />[ =C2=A0 =C2=A01.140731] s=
dhci: Copyright(c) Pierre Ossman<br />[ =C2=A0 =C2=A01.145172] Synopsys Des=
ignware Multimedia Card Interface Driver<br />[ =C2=A0 =C2=A01.151282] sdhc=
i-pltfm: SDHCI platform and OF driver helper<br />[ =C2=A0 =C2=A01.157247] =
ledtrig-cpu: registered to indicate activity on CPUs<br />[ =C2=A0 =C2=A01.=
163670] usbcore: registered new interface driver usbhid<br />[ =C2=A0 =C2=
=A01.168242] usbhid: USB HID core driver<br />[ =C2=A0 =C2=A01.172978] No f=
sl,qman node<br />[ =C2=A0 =C2=A01.174928] Freescale USDPAA process driver<=
br />[ =C2=A0 =C2=A01.179087] fsl-usdpaa: no region found<br />[ =C2=A0 =C2=
=A01.182907] Freescale USDPAA process IRQ driver<br />[ =C2=A0 =C2=A01.1917=
15] NET: Registered protocol family 26<br />[ =C2=A0 =C2=A01.193427] Initia=
lizing XFRM netlink socket<br />[ =C2=A0 =C2=A01.198204] NET: Registered pr=
otocol family 10<br />[ =C2=A0 =C2=A01.202897] Segment Routing with IPv6<br=
 />[ =C2=A0 =C2=A01.205680] NET: Registered protocol family 17<br />[ =C2=
=A0 =C2=A01.210087] can: controller area network core (rev 20170425 abi 9)<=
br />[ =C2=A0 =C2=A01.216272] NET: Registered protocol family 29<br />[ =C2=
=A0 =C2=A01.220654] can: raw protocol (rev 20170425)<br />[ =C2=A0 =C2=A01.=
224903] can: broadcast manager protocol (rev 20170425 t)<br />[ =C2=A0 =C2=
=A01.230548] can: netlink gateway (rev 20190810) max_hops=3D1<br />[ =C2=A0=
 =C2=A01.236247] Bluetooth: RFCOMM TTY layer initialized<br />[ =C2=A0 =C2=
=A01.240894] Bluetooth: RFCOMM socket layer initialized<br />[ =C2=A0 =C2=
=A01.246020] Bluetooth: RFCOMM ver 1.11<br />[ =C2=A0 =C2=A01.249739] Bluet=
ooth: BNEP (Ethernet Emulation) ver 1.3<br />[ =C2=A0 =C2=A01.255024] Bluet=
ooth: BNEP filters: protocol multicast<br />[ =C2=A0 =C2=A01.260238] Blueto=
oth: BNEP socket layer initialized<br />[ =C2=A0 =C2=A01.265180] Bluetooth:=
 HIDP (Human Interface Emulation) ver 1.2<br />[ =C2=A0 =C2=A01.271085] Blu=
etooth: HIDP socket layer initialized<br />[ =C2=A0 =C2=A01.276074] 8021q: =
802.1Q VLAN Support v1.8<br />[ =C2=A0 =C2=A01.280216] lib80211: common rou=
tines for IEEE802.11 drivers<br />[ =C2=A0 =C2=A01.285980] 9pnet: Installin=
g 9P2000 support<br />[ =C2=A0 =C2=A01.290126] tsn generic netlink module v=
1 init...<br />[ =C2=A0 =C2=A01.294849] Key type dns_resolver registered<br=
 />[ =C2=A0 =C2=A01.299721] registered taskstats version 1<br />[ =C2=A0 =
=C2=A01.303120] Loading compiled-in X.509 certificates<br />[ =C2=A0 =C2=A0=
1.310428] hctosys: unable to open rtc device (rtc0)<br />[ =C2=A0 =C2=A01.3=
13111] cfg80211: Loading compiled-in X.509 certificates for regulatory data=
base<br />[ =C2=A0 =C2=A01.322641] cfg80211: Loaded X.509 cert 'sforshee: 0=
0b28ddf47aef9cea7'<br />[ =C2=A0 =C2=A01.327262] platform regulatory.0: Dir=
ect firmware load for regulatory.db failed with error -2<br />[ =C2=A0 =C2=
=A01.330307] clk: Not disabling unused clocks<br />[ =C2=A0 =C2=A01.335778]=
 platform regulatory.0: Falling back to sysfs fallback for: regulatory.db<b=
r />[ =C2=A0 =C2=A01.340026] ALSA device list:<br />[ =C2=A0 =C2=A01.350686=
] =C2=A0 No soundcards found.<br />[ =C2=A0 =C2=A01.354101] The error code =
is -2<br /><b>[ =C2=A0 =C2=A01.357282] Warning: unable to open an initial c=
onsole.</b><br />[ =C2=A0 =C2=A01.363973] Freeing unused kernel memory: 294=
4K<br />[ =C2=A0 =C2=A01.382376] Run /hello as init process<br />[ =C2=A0 =
=C2=A01.383398] Ready to search binary handler...<br />[ =C2=A0 =C2=A01.387=
791] Finish search binary handler, ret=3D0...<br /></div><div><br /></div><=
div><br /></div><div>My console cannot output the printf code in the hellow=
orld program. I can't solve this problem anyway. Can you help me solve it?<=
br /><br />imx8mq-evk-inmate.dts: (for non-root-cell linux)<br /><div style=
=3D"color: rgb(212, 212, 212); background-color: rgb(30, 30, 30); font-fami=
ly: &quot;JetBrains Mono&quot;, Menlo, Monaco, &quot;Courier New&quot;, mon=
ospace, Menlo, Monaco, &quot;Courier New&quot;, monospace; font-size: 12px;=
 line-height: 18px; white-space: pre;"><div>&amp;uart2 {</div><div>    cloc=
ks =3D &lt;&amp;osc_25m&gt;,</div><div>        &lt;&amp;osc_25m&gt;;</div><=
div>    clock-names =3D <span style=3D"color: rgb(206, 145, 120);">"ipg"</s=
pan>, <span style=3D"color: rgb(206, 145, 120);">"per"</span>;</div><div>  =
  /delete-property/ dmas;</div><div>    /delete-property/ dmas-names;</div>=
<div>    status =3D <span style=3D"color: rgb(206, 145, 120);">"okay"</span=
>;</div><div>};</div></div><br /></div><div>ok8mq-evk-root.dts (for root ce=
ll )</div><div><div style=3D"color: rgb(212, 212, 212); background-color: r=
gb(30, 30, 30); font-family: &quot;JetBrains Mono&quot;, Menlo, Monaco, &qu=
ot;Courier New&quot;, monospace, Menlo, Monaco, &quot;Courier New&quot;, mo=
nospace; font-size: 12px; line-height: 18px; white-space: pre;"><div>&amp;u=
art1 {</div><div>    <span style=3D"color: rgb(106, 153, 85);">/* uart2 is =
used by the 2nd OS, so configure pin and clk */</span></div><div>    pinctr=
l-0 =3D &lt;&amp;pinctrl_uart1&gt;, &lt;&amp;pinctrl_uart2&gt;;</div><div> =
   assigned-clocks =3D &lt;&amp;clk <span style=3D"color: rgb(181, 206, 168=
);">IMX8MQ_CLK_UART1</span>&gt;,</div><div>            &lt;&amp;clk <span s=
tyle=3D"color: rgb(181, 206, 168);">IMX8MQ_CLK_UART2</span>&gt;;</div><div>=
    assigned-clock-parents =3D &lt;&amp;clk <span style=3D"color: rgb(181, =
206, 168);">IMX8MQ_CLK_25M</span>&gt;,</div><div>            &lt;&amp;clk <=
span style=3D"color: rgb(181, 206, 168);">IMX8MQ_CLK_25M</span>&gt;;</div><=
div>};</div><div><br /></div></div></div>

<p></p>

-- <br />
You received this message because you are subscribed to the Google Groups &=
quot;Jailhouse&quot; group.<br />
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to <a href=3D"mailto:jailhouse-dev+unsubscribe@googlegroups.com">jailh=
ouse-dev+unsubscribe@googlegroups.com</a>.<br />
To view this discussion on the web visit <a href=3D"https://groups.google.c=
om/d/msgid/jailhouse-dev/893f2e46-c438-4182-859f-1f65af16f8d4n%40googlegrou=
ps.com?utm_medium=3Demail&utm_source=3Dfooter">https://groups.google.com/d/=
msgid/jailhouse-dev/893f2e46-c438-4182-859f-1f65af16f8d4n%40googlegroups.co=
m</a>.<br />

------=_Part_74706_1163055094.1700895426752--

------=_Part_74705_1196123780.1700895426752
Content-Type: image/png; 
	name="=?utf8?Q?=E6=88=AA=E5=B1=8F2023-11-25_14.49.49.png?="
Content-Transfer-Encoding: base64
Content-Disposition: inline; 
	filename="=?utf8?Q?=E6=88=AA=E5=B1=8F2023-11-25_14.49.49.png?="
X-Attachment-Id: f5a8a7cb-9650-4e84-9833-902fd7c12597
Content-ID: <f5a8a7cb-9650-4e84-9833-902fd7c12597>

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
pu+9sS9yX/N+5v66A9YHqg7SD5bVI/VT6nsbshs6G1Mb2w9FHGpu8m06eNj58LYj5kcqj+odXXyM
cmzusf7jxcf7TohP9JzMOvmoeULznVOjT11riWtpOx15+tyZ0DOnzrLOHj/nd+7IeZ/zhy4wLzRc
9LxY3+rRevB3j98Ptnm21V/yutR42ftyU/vI9mNXAq6cvBp89cw1zrWL16Ovt99IunGzY2xH503+
zWe38m69ul10+/OdWXcJd8vuad2ruG98v/oP+z92d3p2Hn0Q/KD1YcLDO494j148lj7+0jX3CfVJ
xVOzpzXPXJ8d6Q7tvvx8zPOuF+IXn3tK/9T+s+ql3csDfwX+1do7urfrleRV/+uFbwzfbHvr/ra5
L7bv/rv8d5/fl30w/LD9I/Pj2U8pn55+nvSF9GX1V/uvTd8iv93tz+/vF3MlXMWnAAYrmpkJwOtt
AFBTAaDD8xlljPL8pyiI8syqQOA/YeUZUVE8AaiD3+9xPfDrpgOAPVvg8Qvq08YCEEsFINEboG5u
g3XgrKY4V8oLEZ4DNsZ8zcjPAP+mKM+cP8T9cw/kqu7g5/5fER98ZcyF3h0AAACKZVhJZk1NACoA
AAAIAAQBGgAFAAAAAQAAAD4BGwAFAAAAAQAAAEYBKAADAAAAAQACAACHaQAEAAAAAQAAAE4AAAAA
AAAAkAAAAAEAAACQAAAAAQADkoYABwAAABIAAAB4oAIABAAAAAEAAAMYoAMABAAAAAEAAADiAAAA
AEFTQ0lJAAAAU2NyZWVuc2hvdN0csiMAAAAJcEhZcwAAFiUAABYlAUlSJPAAAAHWaVRYdFhNTDpj
b20uYWRvYmUueG1wAAAAAAA8eDp4bXBtZXRhIHhtbG5zOng9ImFkb2JlOm5zOm1ldGEvIiB4Onht
cHRrPSJYTVAgQ29yZSA2LjAuMCI+CiAgIDxyZGY6UkRGIHhtbG5zOnJkZj0iaHR0cDovL3d3dy53
My5vcmcvMTk5OS8wMi8yMi1yZGYtc3ludGF4LW5zIyI+CiAgICAgIDxyZGY6RGVzY3JpcHRpb24g
cmRmOmFib3V0PSIiCiAgICAgICAgICAgIHhtbG5zOmV4aWY9Imh0dHA6Ly9ucy5hZG9iZS5jb20v
ZXhpZi8xLjAvIj4KICAgICAgICAgPGV4aWY6UGl4ZWxZRGltZW5zaW9uPjIyNjwvZXhpZjpQaXhl
bFlEaW1lbnNpb24+CiAgICAgICAgIDxleGlmOlBpeGVsWERpbWVuc2lvbj43OTI8L2V4aWY6UGl4
ZWxYRGltZW5zaW9uPgogICAgICAgICA8ZXhpZjpVc2VyQ29tbWVudD5TY3JlZW5zaG90PC9leGlm
OlVzZXJDb21tZW50PgogICAgICA8L3JkZjpEZXNjcmlwdGlvbj4KICAgPC9yZGY6UkRGPgo8L3g6
eG1wbWV0YT4KT06r6gAAABxpRE9UAAAAAgAAAAAAAABxAAAAKAAAAHEAAABxAAAgskueWs4AACB+
SURBVHgB7N15nE3lH8DxL2NfInv2fS1mSP2y1y9CKZVSZN+ykzV7yhrZqShG0vpLJa0S7UISUmSJ
QULWsoXf+T7TOXPnzp39zJ2Zez/P62XuWZ7znHPejz/u9z5bhgoVKl4VEgIIIIAAAggggAACCCDw
r8CFC+eTbJGBACPJdlyIAAIIIIAAAggggEBACiQrwKh2Q3VaMALyvwUvhQACCCCAAAIIIIBA0gTO
nDqZtAutqzIQYCTZjgsRQAABBBBAAAEEEAhIAQKMgKxWXgoBBBBAAAEEEEAAgdQRIMBIHXfuigAC
CCCAAAIIIIBAQAoQYARktfJSCCCAAAIIIIAAAgikjgABRuq4c1cEEEAAAQQQQAABBAJSgAAjIKuV
l0IAAQQQQAABBBBAIHUECDBSx527IoAAAggggAACCCAQkAIEGAFZrbwUAggggAACCCCAAAKpI0CA
kTru3BUBBBBAAAEEEEAAgYAUIMAIyGrlpRBAAAEEEEAAAQQQSB0BAozUceeuCCCAAAIIIIAAAggE
pAABRkBWKy+FAAIIIIAAAggggEDqCBBgpI47d01jAgUKFJCwsFApXLCQZMueXTZs2CBbfvwxjT0l
j4MAAggggAACCKR9AQKMNFJH1coVlGplCyb6aV7/5KdEX8MFUQIhISHy1PjxUrTodVEHra0dO36W
yVOnRjvGDgIIIIAAAggggED8AgQY8Rv5Jce4RxsmKcB4YOibfnm+9HITDRiyZMliHvfixYty+fLl
OB99wpPjpXjx4jHyEGDEIOEAAggggAACCCCQIAECjAQxpWwmbb0Y16Nhkm5CgBGdrVvXLlKvbl1z
8OChQzJi5KjoGTz2MmfOLIuef845cubsWfn6669l/frv5K+//5bff//dOccGAggggAACCCCAQMIE
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
JlCRgPH/aqZgGclpy8UAAAAASUVORK5CYII=
------=_Part_74705_1196123780.1700895426752--
