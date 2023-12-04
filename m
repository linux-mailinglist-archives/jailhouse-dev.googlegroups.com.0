Return-Path: <jailhouse-dev+bncBCC7XQGMWINBBMUXW2VQMGQE73IBWRQ@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-yw1-x113f.google.com (mail-yw1-x113f.google.com [IPv6:2607:f8b0:4864:20::113f])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E506802D02
	for <lists+jailhouse-dev@lfdr.de>; Mon,  4 Dec 2023 09:20:04 +0100 (CET)
Received: by mail-yw1-x113f.google.com with SMTP id 00721157ae682-5cfe0b63eeesf71244587b3.0
        for <lists+jailhouse-dev@lfdr.de>; Mon, 04 Dec 2023 00:20:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20230601; t=1701678003; x=1702282803; darn=lfdr.de;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:x-original-sender:mime-version
         :subject:references:in-reply-to:message-id:to:from:date:sender:from
         :to:cc:subject:date:message-id:reply-to;
        bh=a48fhsYGdILpCLOoMfGLUsmWvfbhI+MCbbtg+h/rUXc=;
        b=w8JOQLP+9h/oelF5MsOjKP3lvTTIIxIRb5dHVIFU97RJFuVrmKnywJI0bA+lETdbli
         NPrLlFggwsX+xWkbR2Uost7DAR4L95fDKKPmTbeFgrm73iEucKKsaENbm8u57xcI4AuW
         P0LjTqa10Zf/a2vRMBVLiHkQdqBSxM6cgxMIh6oHMUkyJIcAUMgaFlGet0gWL7ljDFZc
         cpap4FIpsXaJaVVkhpXdtZCvo05i5ElieeTmJJg4Zv+hpvJWxMUU2AG7+ewaBkH/yfXg
         YyQ0qiE8E6L+c+6Ex2gw2465lszwjjAy/+z21AWBwz0MqgCxSwmrUUl4VwzubGr/kJNj
         8bWw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1701678003; x=1702282803; darn=lfdr.de;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:x-original-sender:mime-version
         :subject:references:in-reply-to:message-id:to:from:date:from:to:cc
         :subject:date:message-id:reply-to;
        bh=a48fhsYGdILpCLOoMfGLUsmWvfbhI+MCbbtg+h/rUXc=;
        b=UcKk9zxff7bimHqeXtkBIkFGgopadff5jraMT/DV43fLUj1slY3yP0AMJuKfHCoRXP
         6Jg7qse9uofL4TCulhQZVBRfzHfETcrzLEf8WWpWG9tLoVzXnB4Tw7IyBnZXa1ZxU1+o
         lLD7hrTnjgCjSTAQaeLeQoYJdXm/UtTbLRnSsoOTSib9gkWEcFhefAGlxWEt4oUJjH07
         kTe1E7e3z629YMx85QkVXnomnxTgM1FJ08HjpSXhDMJx0CobUuI0n8buw/c2O1duVFwD
         M8xVRnEzgH0ZhLDYmAT4nTBAJro0d1ofutI+ZOA5R6T7uNKIe6ZjsGQBjYIlkRPzqSq0
         y0+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701678003; x=1702282803;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :x-spam-checked-in-group:list-id:mailing-list:precedence
         :x-original-sender:mime-version:subject:references:in-reply-to
         :message-id:to:from:date:x-beenthere:x-gm-message-state:sender:from
         :to:cc:subject:date:message-id:reply-to;
        bh=a48fhsYGdILpCLOoMfGLUsmWvfbhI+MCbbtg+h/rUXc=;
        b=h9X5mNaCs9Sm+33d0y/PfW3sKWjDsJQM3Aay3S3TgdBPUTBYCuHQmBSUorGSXsea1V
         l8vt8+cFHGjyiAPkv8Da8mH+Fc3BB5Ul34JkiIfUVUcFI4iq1WiVBvMM/cfDWl8C9d1S
         Sg/OadLElS0QtLpLq6y0Lsx+o1zdPKcXje2TpkDVw5Jm1ImTAJnyJwmx9hj2p6qOasiB
         AjeE8WB72mG82EsIRcV8wAmvyjUapygigMsQvGotl+ONyReZU/IxsnlYGuSLMeeBVwPN
         le1V6TmDFGXbGE654JH7HuOLdaNk4C3pFUAm/gDa/JyFula+EHSMCeYzjqPIp7M3+CT4
         8veA==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AOJu0YxumRVCb0hTHOwVZYTiT/9cdsfgtllt9pkF+OaBspEgfB6UNcNM
	sFAWjTKP/2HTeN/t2v9prSU=
X-Google-Smtp-Source: AGHT+IGxl+o4puqXGlRCPSSGnGeuqCYO+BRfCgkVSn7rbRLI8OMPb3IUXXYTrhs8DF298K6Sxyudxw==
X-Received: by 2002:a25:aa63:0:b0:db5:4e2d:8bb2 with SMTP id s90-20020a25aa63000000b00db54e2d8bb2mr2251626ybi.1.1701678002906;
        Mon, 04 Dec 2023 00:20:02 -0800 (PST)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a25:abf1:0:b0:db5:e688:5cf6 with SMTP id v104-20020a25abf1000000b00db5e6885cf6ls1254742ybi.1.-pod-prod-03-us;
 Mon, 04 Dec 2023 00:20:01 -0800 (PST)
X-Received: by 2002:a81:be17:0:b0:5d0:a744:7197 with SMTP id i23-20020a81be17000000b005d0a7447197mr761749ywn.3.1701677997391;
        Mon, 04 Dec 2023 00:19:57 -0800 (PST)
Date: Mon, 4 Dec 2023 00:19:56 -0800 (PST)
From: =?UTF-8?B?5p2o56uj6L22?= <prodigyyanng@gmail.com>
To: Jailhouse <jailhouse-dev@googlegroups.com>
Message-Id: <305639b4-0140-4c73-9481-c593701527d5n@googlegroups.com>
In-Reply-To: <cccc15df-cb50-4153-b0f0-5a058042a41b@oth-regensburg.de>
References: <893f2e46-c438-4182-859f-1f65af16f8d4n@googlegroups.com>
 <cccc15df-cb50-4153-b0f0-5a058042a41b@oth-regensburg.de>
Subject: Re: Jailhouse on OKMX8mq--C , "unable to open an initial console"
MIME-Version: 1.0
Content-Type: multipart/mixed; 
	boundary="----=_Part_97567_748884021.1701677996499"
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

------=_Part_97567_748884021.1701677996499
Content-Type: multipart/alternative; 
	boundary="----=_Part_97568_1994301258.1701677996499"

------=_Part_97568_1994301258.1701677996499
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

I tried these two methods, but still can't get any output.

=E5=9C=A82023=E5=B9=B411=E6=9C=8827=E6=97=A5=E6=98=9F=E6=9C=9F=E4=B8=80 UTC=
+8 21:32:23<Ralf Ramsauer> =E5=86=99=E9=81=93=EF=BC=9A

>
>
> On 25/11/2023 07:57, =E6=9D=A8=E7=AB=A3=E8=BD=B6 wrote:
> > I'm using a OKMX8MQ-C which from imx8, now i can boot the root cell and=
=20
> > some simple demp such as gic-demo. But when boot the non-root linux=20
> > cell, i face some problem.
> >=20
> > I only use initramfs to boot non-root linux. Furthermore, my initramfs=
=20
> > only contains a helloworld and a console device. [I cannot use busybox=
=20
> > to build initramfs because my toolchain does not allow me to compile=20
> > it]. My ramfs directory is as follows=EF=BC=9A=E6=88=AA=E5=B1=8F2023-11=
-25 14.49.49.png
> >=20
> > Then my startup command is as follows:
> >=20
> > *cd /home/root/imx_jailhouse *
> > *insmod driver/jailhouse.ko *
> > *export PATH=3D/home/root/imx_jailhouse/tools:$PATH *
> > *jailhouse enable configs/arm64/imx8mq-veth.cell
> > *
> > *jailhouse cell linux configs/arm64/imx8mq-linux-demo.cell \ *
> > *                                 ~/Image2 -d \ *
> > *                                 ~/imx8mq-evk-inmate.dtb -i \ *
> > *                                  ~/rootfs.cpio.gz \ *
> > *                                 -c "clk_ignore_unused=20
> > console=3Dttymxc0,30860000,115200 earlycon=3Dec_imx6q,0x30860000,115200=
=20
> > root=3D/dev/ram ramdisk_size=3D10000000 rdinit=3D/hello rootwait rw " *
>
> try to add console=3Dtty0 here. Further, did you set stdout-path in yor=
=20
> non root's device tree correctly?
>
> > console=3Dttymxc0,30860000,115200
> Are you sure that this line is correct? Why do you encode the address her=
e?
>
> Please try:
> console=3Dttymxc0,115200 console=3Dtty0
>
> Ralf
>
> > *
> > *
> > Eventually, I got the following output=EF=BC=9A*
> > *
> > root@imx8mqevk:~/imx_jailhouse# jailhouse cell linux=20
> > configs/arm64/imx8mq-linux-demo.cell \
> > _unused console=3Dttymxc0,30860000,115200=20
> > earlycon=3Dec_imx6q,0x30860000,115200 root=3D/dev/ram ramdisk_size=3D10=
000000=20
> > rdinit=3D/hello rootwait rw "
> > >      ~/Image2 -d \
> > >     ~/imx8mq-evk-inmate.dtb -i \
> > >      ~/rootfs.cpio.gz \
> > >  -c "clk_ignore_unused console=3Dttymxc0,30860000,115200=20
> > earlycon=3Dec_imx6q,0x30860000,115200 root=3D/dev/ram ramdisk_size=3D10=
000000=20
> > rdinit=3D/hello rootwait rw "
> > [  567.018158] Ready to search binary handler...
> > [  567.023161] Finish search binary handler, ret=3D0...
> > [  567.029032] Ready to search binary handler...
> > [  567.033683] Finish search binary handler, ret=3D0...
> > [  567.039395] Ready to search binary handler...
> > [  567.044092] Finish search binary handler, ret=3D0...
> >=20
> >=20
> > [  567.365079] IRQ231: set affinity failed(-22).
> > [  567.365091] IRQ232: set affinity failed(-22).
> > [  567.365646] CPU2: shutdown
> > [  567.377126] psci: CPU2 killed.
> > [  567.424984] IRQ231: set affinity failed(-22).
> > [  567.424991] IRQ232: set affinity failed(-22).
> > [  567.425300] CPU3: shutdown
> > [  567.436789] psci: CPU3 killed.
> > Adding virtual PCI device 00:00.0 to cell "linux-inmate-demo"
> > Shared memory connection established: "linux-inmate-demo" <--> "imx8mq"
> > iommu_config_commit linux-inmate-demo
> > Created cell "linux-inmate-demo"
> > Page pool usage after cell creation: mem 111/995, remap 144/131072
> > [  567.473937] Created Jailhouse cell "linux-inmate-demo"
> > Cell "linux-inmate-demo" can be loaded
> >=20
> > Started cell "linux-inmate-demo"
> >=20
> > [    0.000000] Booting Linux on physical CPU 0x0000000002 [0x410fd034]
> > [    0.000000] Linux version 5.4.3 (azureuser@junyiyang-test) (gcc=20
> > version 9.2.0 (GCC)) #46 SMP PREEMPT Fri Nov 24 09:06:54 UTC 2023
> > [    0.000000] Machine model: Freescale i.MX8MQ EVK
> > [    0.000000] earlycon: ec_imx6q0 at MMIO 0x0000000030860000 (options=
=20
> > '115200')
> > [    0.000000] printk: bootconsole [ec_imx6q0] enabled
> > [    0.000000] efi: Getting EFI parameters from FDT:
> > [    0.000000] efi: UEFI not found.
> > [    0.000000] cma: Reserved 320 MiB at 0x00000000e4000000
> > root@imx8mqevk:~/imx_jailhouse#
> > root@imx8mqevk:~/imx_jailhouse#
> > [    0.000000] NUMA: No NUMA configuration found
> > [    0.000000] NUMA: Faking a node at [mem=20
> > 0x00000000d0000000-0x00000000f9bfffff]
> > [    0.000000] NUMA: NODE_DATA [mem 0xf9a97500-0xf9a98fff]
> > [    0.000000] Zone ranges:
> > [    0.000000]   DMA32    [mem 0x00000000d0000000-0x00000000f9bfffff]
> > [    0.000000]   Normal   empty
> > [    0.000000] Movable zone start for each node
> > [    0.000000] Early memory node ranges
> > [    0.000000]   node   0: [mem 0x00000000d0000000-0x00000000f9bfffff]
> > [    0.000000] Initmem setup node 0 [mem=20
> > 0x00000000d0000000-0x00000000f9bfffff]
> > root@imx8mqevk:~/imx_jailhouse#
> > [    0.000000] psci: probing for conduit method from DT.
> > [    0.000000] psci: PSCIv1.1 detected in firmware.
> > [    0.000000] psci: Using standard PSCI v0.2 function IDs
> > [    0.000000] psci: MIGRATE_INFO_TYPE not supported.
> > [    0.000000] psci: SMC Calling Convention v1.1
> > [    0.000000] percpu: Embedded 24 pages/cpu s58968 r8192 d31144 u98304
> > [    0.000000] Detected VIPT I-cache on CPU0
> > [    0.000000] CPU features: detected: ARM erratum 845719
> > [    0.000000] CPU features: detected: GIC system register CPU interfac=
e
> > [    0.000000] Built 1 zonelists, mobility grouping on.  Total pages:=
=20
> 168336
> > [    0.000000] Policy zone: DMA32
> > [    0.000000] Kernel command line: clk_ignore_unused=20
> > console=3Dttymxc0,30860000,115200 earlycon=3Dec_imx6q,0x30860000,115200=
=20
> > root=3D/dev/ram ramdisk_size=3D10000000 rdinit=3D/hello rootwait rw
> > [    0.000000] Dentry cache hash table entries: 131072 (order: 8,=20
> > 1048576 bytes, linear)
> > [    0.000000] Inode-cache hash table entries: 65536 (order: 7, 524288=
=20
> > bytes, linear)
> > [    0.000000] mem auto-init: stack:off, heap alloc:off, heap free:off
> > root@imx8mqevk:~/imx_jailhouse#
> > [    0.000000] Memory: 307980K/684032K available (16508K kernel code,=
=20
> > 1370K rwdata, 6456K rodata, 2944K init, 1039K bss, 48372K reserved,=20
> > 327680K cma-reserved)
> > [    0.000000] SLUB: HWalign=3D64, Order=3D0-3, MinObjects=3D0, CPUs=3D=
2, Nodes=3D1
> > [    0.000000] rcu: Preemptible hierarchical RCU implementation.
> > [    0.000000] rcu:     RCU restricting CPUs from NR_CPUS=3D256 to=20
> > nr_cpu_ids=3D2.
> > [    0.000000]  Tasks RCU enabled.
> > [    0.000000] rcu: RCU calculated value of scheduler-enlistment delay=
=20
> > is 25 jiffies.
> > [    0.000000] rcu: Adjusting geometry for rcu_fanout_leaf=3D16,=20
> nr_cpu_ids=3D2
> > [    0.000000] NR_IRQS: 64, nr_irqs: 64, preallocated irqs: 0
> > [    0.000000] GICv3: 128 SPIs implemented
> > [    0.000000] GICv3: 0 Extended SPIs implemented
> > [    0.000000] GICv3: Distributor has no Range Selector support
> > [    0.000000] GICv3: 16 PPIs implemented
> > [    0.000000] GICv3: no VLPI support, no direct LPI support
> > [    0.000000] GICv3: CPU0: found redistributor 2 region=20
> > 0:0x00000000388c0000
> > [    0.000000] ITS: No ITS available, not enabling LPIs
> > [    0.000000] random: get_random_bytes called from=20
> > start_kernel+0x2b8/0x44c with crng_init=3D0
> > [    0.000000] arch_timer: cp15 timer(s) running at 8.33MHz (virt).
> > [    0.000000] clocksource: arch_sys_counter: mask: 0xffffffffffffff=20
> > max_cycles: 0x1ec0311ec, max_idle_ns: 440795202152 ns
> > [    0.000005] sched_clock: 56 bits at 8MHz, resolution 120ns, wraps=20
> > every 2199023255541ns
> > [    0.008316] Console: colour dummy device 80x25
> > [    0.012477] Calibrating delay loop (skipped), value calculated using=
=20
> > timer frequency.. 16.66 BogoMIPS (lpj=3D33333)
> > [    0.022666] pid_max: default: 32768 minimum: 301
> > [    0.027356] LSM: Security Framework initializing
> > [    0.031897] SELinux:  Initializing.
> > [    0.035422] Mount-cache hash table entries: 2048 (order: 2, 16384=20
> > bytes, linear)
> > [    0.042725] Mountpoint-cache hash table entries: 2048 (order: 2,=20
> > 16384 bytes, linear)
> > [    0.051555] init thread pid check: 1...
> > root@imx8mqevk:~/imx_jailhouse#
> > root@imx8mqevk:~/imx_jailhouse# [    0.074633] ASID allocator=20
> > initialised with 32768 entries
> > [    0.082633] rcu: Hierarchical SRCU implementation.
> > [    0.091290] EFI services will not be available.
> > [    0.098677] smp: Bringing up secondary CPUs ...
> > [    0.130824] Detected VIPT I-cache on CPU1
> > [    0.130870] GICv3: CPU1: found redistributor 3 region=20
> > 0:0x00000000388e0000
> > [    0.130914] CPU1: Booted secondary processor 0x0000000003 [0x410fd03=
4]
> > [    0.131020] smp: Brought up 1 node, 2 CPUs
> > [    0.149632] SMP: Total of 2 processors activated.
> > [    0.154314] CPU features: detected: 32-bit EL0 Support
> > [    0.159450] CPU features: detected: CRC32 instructions
> > [    0.177838] CPU: All CPU(s) started at EL1
> > [    0.179087] alternatives: patching kernel code
> > [    0.184973] devtmpfs: initialized
> > [    0.192187] clocksource: jiffies: mask: 0xffffffff max_cycles:=20
> > 0xffffffff, max_idle_ns: 7645041785100000 ns
> > [    0.199073] futex hash table entries: 512 (order: 3, 32768 bytes,=20
> linear)
> > [    0.217026] pinctrl core: initialized pinctrl subsystem
> > [    0.220270] DMI not present or invalid.
> > [    0.223548] NET: Registered protocol family 16
> > [    0.243512] DMA: preallocated 256 KiB pool for atomic allocations
> > [    0.246762] audit: initializing netlink subsys (disabled)
> > [    0.252330] audit: type=3D2000 audit(0.212:1): state=3Dinitialized=
=20
> > audit_enabled=3D0 res=3D1
> > [    0.259890] cpuidle: using governor menu
> > [    0.264391] hw-breakpoint: found 6 breakpoint and 4 watchpoint=20
> registers.
> > [    0.271261] Serial: AMBA PL011 UART driver
> > [    0.274699] imx mu driver is registered.
> > [    0.278539] imx rpmsg driver is registered.
> > [    0.304587] HugeTLB registered 1.00 GiB page size, pre-allocated 0=
=20
> pages
> > [    0.308453] HugeTLB registered 32.0 MiB page size, pre-allocated 0=
=20
> pages
> > [    0.315123] HugeTLB registered 2.00 MiB page size, pre-allocated 0=
=20
> pages
> > [    0.321805] HugeTLB registered 64.0 KiB page size, pre-allocated 0=
=20
> pages
> > [    0.331139] cryptd: max_cpu_qlen set to 1000
> > [    0.339367] ACPI: Interpreter disabled.
> > [    0.340820] iommu: Default domain type: Translated
> > [    0.345428] vgaarb: loaded
> > [    0.348260] SCSI subsystem initialized
> > [    0.352060] usbcore: registered new interface driver usbfs
> > [    0.357446] usbcore: registered new interface driver hub
> > [    0.362457] usbcore: registered new device driver usb
> > [    0.367753] mc: Linux media interface: v0.10
> > [    0.371747] videodev: Linux video capture interface: v2.00
> > [    0.377234] pps_core: LinuxPPS API ver. 1 registered
> > [    0.382104] pps_core: Software ver. 5.3.6 - Copyright 2005-2007=20
> > Rodolfo Giometti <giom...@linux.it>
> > [    0.391236] PTP clock support registered
> > [    0.395188] EDAC MC: Ver: 3.0.0
> > [    0.398960] No BMan portals available!
> > [    0.402252] QMan: Allocated lookup table at (____ptrval____), entry=
=20
> > count 65537
> > [    0.409524] No QMan portals available!
> > [    0.413314] No USDPAA memory, no 'fsl,usdpaa-mem' in device-tree
> > [    0.419312] FPGA manager framework
> > [    0.422483] Advanced Linux Sound Architecture Driver Initialized.
> > [    0.428969] Bluetooth: Core ver 2.22
> > [    0.432033] NET: Registered protocol family 31
> > [    0.436445] Bluetooth: HCI device and connection manager initialized
> > [    0.442785] Bluetooth: HCI socket layer initialized
> > [    0.447644] Bluetooth: L2CAP socket layer initialized
> > [    0.452688] Bluetooth: SCO socket layer initialized
> > [    0.458289] clocksource: Switched to clocksource arch_sys_counter
> > [    0.463791] VFS: Disk quotas dquot_6.6.0
> > [    0.467580] VFS: Dquot-cache hash table entries: 512 (order 0, 4096=
=20
> > bytes)
> > [    0.474589] pnp: PnP ACPI: disabled
> > [    0.486097] thermal_sys: Registered thermal governor 'step_wise'
> > [    0.486100] thermal_sys: Registered thermal governor 'power_allocato=
r'
> > [    0.489479] NET: Registered protocol family 2
> > [    0.500595] tcp_listen_portaddr_hash hash table entries: 512 (order:=
=20
> > 1, 8192 bytes, linear)
> > [    0.508479] TCP established hash table entries: 8192 (order: 4, 6553=
6=20
> > bytes, linear)
> > [    0.516248] TCP bind hash table entries: 8192 (order: 5, 131072=20
> > bytes, linear)
> > [    0.523523] TCP: Hash tables configured (established 8192 bind 8192)
> > [    0.529790] UDP hash table entries: 512 (order: 2, 16384 bytes,=20
> linear)
> > [    0.536336] UDP-Lite hash table entries: 512 (order: 2, 16384 bytes,=
=20
> > linear)
> > [    0.543469] NET: Registered protocol family 1
> > [    0.548165] RPC: Registered named UNIX socket transport module.
> > [    0.553581] RPC: Registered udp transport module.
> > [    0.558262] RPC: Registered tcp transport module.
> > [    0.562952] RPC: Registered tcp NFSv4.1 backchannel transport module=
.
> > [    0.569831] PCI: CLS 0 bytes, default 64
> > [    0.573504] Trying to unpack rootfs image as initramfs...
> > [    0.578681] Compressed data magic: 0x1f 0x8b
> > [    0.604372] Freeing initrd memory: 372K
> > [    0.606046] kvm [1]: HYP mode not available
> > [    0.616895] Initialise system trusted keyrings
> > [    0.618624] workingset: timestamp_bits=3D44 max_order=3D18 bucket_or=
der=3D0
> > [    0.633665] squashfs: version 4.0 (2009/01/31) Phillip Lougher
> > [    0.637392] NFS: Registering the id_resolver key type
> > [    0.641713] Key type id_resolver registered
> > [    0.645848] Key type id_legacy registered
> > [    0.649848] nfs4filelayout_init: NFSv4 File Layout Driver=20
> Registering...
> > [    0.656543] jffs2: version 2.2. (NAND) =C2=A9 2001-2006 Red Hat, Inc=
.
> > [    0.663102] 9p: Installing v9fs 9p2000 file system support
> > [    0.688300] Key type asymmetric registered
> > [    0.689534] Asymmetric key parser 'x509' registered
> > [    0.694461] Block layer SCSI generic (bsg) driver version 0.4 loaded=
=20
> > (major 244)
> > [    0.701900] io scheduler mq-deadline registered
> > [    0.706301] io scheduler kyber registered
> > [    0.711544] pci-host-generic bfb00000.pci: host bridge /pci@bfb00000=
=20
> > ranges:
> > [    0.717352] pci-host-generic bfb00000.pci:   MEM=20
> > 0x10000000..0x1000ffff -> 0x10000000
> > [    0.725202] pci-host-generic bfb00000.pci: ECAM at [mem=20
> > 0xbfb00000-0xbfbfffff] for [bus 00]
> > [    0.733608] pci-host-generic bfb00000.pci: PCI host bridge to bus=20
> 0000:00
> > [    0.740249] pci_bus 0000:00: root bus resource [bus 00]
> > [    0.745450] pci_bus 0000:00: root bus resource [mem=20
> > 0x10000000-0x1000ffff]
> > [    0.752335] pci 0000:00:00.0: [1af4:1110] type 00 class 0xff0100
> > [    0.758324] pci 0000:00:00.0: reg 0x10: [mem 0x00000000-0x000000ff=
=20
> 64bit]
> > [    0.766848] pci 0000:00:00.0: BAR 0: assigned [mem=20
> > 0x10000000-0x100000ff 64bit]
> > [    0.773175] EINJ: ACPI disabled.
> > [    0.776584] Bus freq driver module loaded
> > [    0.780120] virtio-pci 0000:00:00.0: enabling device (0000 -> 0002)
> > [    0.789667] Serial: 8250/16550 driver, 4 ports, IRQ sharing enabled
> > [    0.794841] 30890000.serial: ttymxc1 at MMIO 0x30890000 (irq =3D 5,=
=20
> > base_baud =3D 1562500) is a IMX
> > [    0.812412] brd: module loaded
> > [    0.820118] loop: module loaded
> > [    0.822089] imx ahci driver is registered.
> > [    0.826835] libphy: Fixed MDIO Bus: probed
> > [    0.829601] tun: Universal TUN/TAP device driver, 1.6
> > [    0.833815] CAN device driver interface
> > [    0.837738] thunder_xcv, ver 1.0
> > [    0.840680] thunder_bgx, ver 1.0
> > [    0.843893] nicpf, ver 1.0
> > [    0.846753] Freescale FM module, FMD API version 21.1.0
> > [    0.851814] Freescale FM Ports module
> > [    0.855392] fsl_mac: fsl_mac: FSL FMan MAC API based driver
> > [    0.861005] fsl_dpa: FSL DPAA Ethernet driver
> > [    0.865334] fsl_advanced: FSL DPAA Advanced drivers:
> > [    0.870234] fsl_proxy: FSL DPAA Proxy initialization driver
> > [    0.875835] fsl_oh: FSL FMan Offline Parsing port driver
> > [    0.881572] hclge is initializing
> > [    0.884388] hns3: Hisilicon Ethernet Network Driver for Hip08 Family=
=20
> > - version
> > [    0.891589] hns3: Copyright (c) 2017 Huawei Corporation.
> > [    0.896938] e1000: Intel(R) PRO/1000 Network Driver - version=20
> > 7.3.21-k8-NAPI
> > [    0.903916] e1000: Copyright (c) 1999-2006 Intel Corporation.
> > [    0.909688] e1000e: Intel(R) PRO/1000 Network Driver - 3.2.6-k
> > [    0.915505] e1000e: Copyright(c) 1999 - 2015 Intel Corporation.
> > [    0.921425] igb: Intel(R) Gigabit Ethernet Network Driver - version=
=20
> > 5.6.0-k
> > [    0.928314] igb: Copyright (c) 2007-2014 Intel Corporation.
> > [    0.933910] igbvf: Intel(R) Gigabit Virtual Function Network Driver =
-=20
> > version 2.4.0-k
> > [    0.941683] igbvf: Copyright (c) 2009 - 2012 Intel Corporation.
> > [    0.947685] sky2: driver version 1.30
> > [    0.951424] usbcore: registered new interface driver asix
> > [    0.956652] usbcore: registered new interface driver ax88179_178a
> > [    0.962722] usbcore: registered new interface driver cdc_ether
> > [    0.968534] usbcore: registered new interface driver net1080
> > [    0.974179] usbcore: registered new interface driver cdc_subset
> > [    0.980082] usbcore: registered new interface driver zaurus
> > [    0.985654] usbcore: registered new interface driver cdc_ncm
> > [    0.991279] usbcore: registered new interface driver huawei_cdc_ncm
> > [    0.997535] usbcore: registered new interface driver qmi_wwan_q
> > [    1.003641] VFIO - User Level meta-driver version: 0.3
> > [    1.009455] ehci_hcd: USB 2.0 'Enhanced' Host Controller (EHCI) Driv=
er
> > [    1.015039] ehci-pci: EHCI PCI platform driver
> > [    1.019496] ehci-platform: EHCI generic platform driver
> > [    1.024722] ohci_hcd: USB 1.1 'Open' Host Controller (OHCI) Driver
> > [    1.030839] ohci-pci: OHCI PCI platform driver
> > [    1.035296] ohci-platform: OHCI generic platform driver
> > [    1.040695] usbcore: registered new interface driver cdc_wdm
> > [    1.046156] usbcore: registered new interface driver usb-storage
> > [    1.052184] usbcore: registered new interface driver usbserial_gener=
ic
> > [    1.058636] usbserial: USB Serial support registered for generic
> > [    1.064625] usbcore: registered new interface driver option
> > [    1.070174] usbserial: USB Serial support registered for GSM modem=
=20
> > (1-port)
> > [    1.078254] <<-GTP-INFO->> GTP driver installing...
> > [    1.082821] i2c /dev entries driver
> > [    1.086604] Bluetooth: HCI UART driver ver 2.3
> > [    1.089846] Bluetooth: HCI UART protocol H4 registered
> > [    1.094981] Bluetooth: HCI UART protocol BCSP registered
> > [    1.100305] Bluetooth: HCI UART protocol LL registered
> > [    1.105394] Bluetooth: HCI UART protocol ATH3K registered
> > [    1.110796] Bluetooth: HCI UART protocol Three-wire (H5) registered
> > [    1.117092] Bluetooth: HCI UART protocol Broadcom registered
> > [    1.122689] Bluetooth: HCI UART protocol QCA registered
> > [    1.128079] imx-cpufreq-dt: probe of imx-cpufreq-dt failed with erro=
r=20
> -2
> > [    1.135773] sdhci: Secure Digital Host Controller Interface driver
> > [    1.140731] sdhci: Copyright(c) Pierre Ossman
> > [    1.145172] Synopsys Designware Multimedia Card Interface Driver
> > [    1.151282] sdhci-pltfm: SDHCI platform and OF driver helper
> > [    1.157247] ledtrig-cpu: registered to indicate activity on CPUs
> > [    1.163670] usbcore: registered new interface driver usbhid
> > [    1.168242] usbhid: USB HID core driver
> > [    1.172978] No fsl,qman node
> > [    1.174928] Freescale USDPAA process driver
> > [    1.179087] fsl-usdpaa: no region found
> > [    1.182907] Freescale USDPAA process IRQ driver
> > [    1.191715] NET: Registered protocol family 26
> > [    1.193427] Initializing XFRM netlink socket
> > [    1.198204] NET: Registered protocol family 10
> > [    1.202897] Segment Routing with IPv6
> > [    1.205680] NET: Registered protocol family 17
> > [    1.210087] can: controller area network core (rev 20170425 abi 9)
> > [    1.216272] NET: Registered protocol family 29
> > [    1.220654] can: raw protocol (rev 20170425)
> > [    1.224903] can: broadcast manager protocol (rev 20170425 t)
> > [    1.230548] can: netlink gateway (rev 20190810) max_hops=3D1
> > [    1.236247] Bluetooth: RFCOMM TTY layer initialized
> > [    1.240894] Bluetooth: RFCOMM socket layer initialized
> > [    1.246020] Bluetooth: RFCOMM ver 1.11
> > [    1.249739] Bluetooth: BNEP (Ethernet Emulation) ver 1.3
> > [    1.255024] Bluetooth: BNEP filters: protocol multicast
> > [    1.260238] Bluetooth: BNEP socket layer initialized
> > [    1.265180] Bluetooth: HIDP (Human Interface Emulation) ver 1.2
> > [    1.271085] Bluetooth: HIDP socket layer initialized
> > [    1.276074] 8021q: 802.1Q VLAN Support v1.8
> > [    1.280216] lib80211: common routines for IEEE802.11 drivers
> > [    1.285980] 9pnet: Installing 9P2000 support
> > [    1.290126] tsn generic netlink module v1 init...
> > [    1.294849] Key type dns_resolver registered
> > [    1.299721] registered taskstats version 1
> > [    1.303120] Loading compiled-in X.509 certificates
> > [    1.310428] hctosys: unable to open rtc device (rtc0)
> > [    1.313111] cfg80211: Loading compiled-in X.509 certificates for=20
> > regulatory database
> > [    1.322641] cfg80211: Loaded X.509 cert 'sforshee: 00b28ddf47aef9cea=
7'
> > [    1.327262] platform regulatory.0: Direct firmware load for=20
> > regulatory.db failed with error -2
> > [    1.330307] clk: Not disabling unused clocks
> > [    1.335778] platform regulatory.0: Falling back to sysfs fallback=20
> > for: regulatory.db
> > [    1.340026] ALSA device list:
> > [    1.350686]   No soundcards found.
> > [    1.354101] The error code is -2
> > *[    1.357282] Warning: unable to open an initial console.*
> > [    1.363973] Freeing unused kernel memory: 2944K
> > [    1.382376] Run /hello as init process
> > [    1.383398] Ready to search binary handler...
> > [    1.387791] Finish search binary handler, ret=3D0...
> >=20
> >=20
> > My console cannot output the printf code in the helloworld program. I=
=20
> > can't solve this problem anyway. Can you help me solve it?
> >=20
> > imx8mq-evk-inmate.dts: (for non-root-cell linux)
> > &uart2 {
> > clocks =3D <&osc_25m>,
> > <&osc_25m>;
> > clock-names =3D "ipg", "per";
> > /delete-property/ dmas;
> > /delete-property/ dmas-names;
> > status =3D "okay";
> > };
> >=20
> > ok8mq-evk-root.dts (for root cell )
> > &uart1 {
> > /* uart2 is used by the 2nd OS, so configure pin and clk */
> > pinctrl-0 =3D <&pinctrl_uart1>, <&pinctrl_uart2>;
> > assigned-clocks =3D <&clk IMX8MQ_CLK_UART1>,
> > <&clk IMX8MQ_CLK_UART2>;
> > assigned-clock-parents =3D <&clk IMX8MQ_CLK_25M>,
> > <&clk IMX8MQ_CLK_25M>;
> > };
> >=20
> > --=20
> > You received this message because you are subscribed to the Google=20
> > Groups "Jailhouse" group.
> > To unsubscribe from this group and stop receiving emails from it, send=
=20
> > an email to jailhouse-de...@googlegroups.com=20
> > <mailto:jailhouse-de...@googlegroups.com>.
> > To view this discussion on the web visit=20
> >=20
> https://groups.google.com/d/msgid/jailhouse-dev/893f2e46-c438-4182-859f-1=
f65af16f8d4n%40googlegroups.com=20
> <
> https://groups.google.com/d/msgid/jailhouse-dev/893f2e46-c438-4182-859f-1=
f65af16f8d4n%40googlegroups.com?utm_medium=3Demail&utm_source=3Dfooter
> >.
>

--=20
You received this message because you are subscribed to the Google Groups "=
Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/=
jailhouse-dev/305639b4-0140-4c73-9481-c593701527d5n%40googlegroups.com.

------=_Part_97568_1994301258.1701677996499
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<span dir=3D"ltr" style=3D"unicode-bidi: isolate; font-size: 28px; line-hei=
ght: 36px; background-color: rgb(248, 249, 250); border: none; padding: 2px=
 0.14em 2px 0px; position: relative; margin: -2px 0px; resize: none; font-f=
amily: inherit; overflow: hidden; width: 270px; white-space-collapse: prese=
rve; overflow-wrap: break-word; color: rgb(32, 33, 36);"><span lang=3D"en" =
tabindex=3D"-1" style=3D"outline: 0px;">I tried these two methods, but stil=
l can't get any output.</span></span><br /><br /><div class=3D"gmail_quote"=
><div dir=3D"auto" class=3D"gmail_attr">=E5=9C=A82023=E5=B9=B411=E6=9C=8827=
=E6=97=A5=E6=98=9F=E6=9C=9F=E4=B8=80 UTC+8 21:32:23&lt;Ralf Ramsauer> =E5=
=86=99=E9=81=93=EF=BC=9A<br/></div><blockquote class=3D"gmail_quote" style=
=3D"margin: 0 0 0 0.8ex; border-left: 1px solid rgb(204, 204, 204); padding=
-left: 1ex;">
<br>
<br>On 25/11/2023 07:57, =E6=9D=A8=E7=AB=A3=E8=BD=B6 wrote:
<br>&gt; I&#39;m using a OKMX8MQ-C which from imx8, now i can boot the root=
 cell and=20
<br>&gt; some simple demp such as gic-demo. But when boot the non-root linu=
x=20
<br>&gt; cell, i face some problem.
<br>&gt;=20
<br>&gt; I only use initramfs to boot non-root linux. Furthermore, my initr=
amfs=20
<br>&gt; only contains a helloworld and a console device. [I cannot use bus=
ybox=20
<br>&gt; to build initramfs because my toolchain does not allow me to compi=
le=20
<br>&gt; it]. My ramfs directory is as follows=EF=BC=9A=E6=88=AA=E5=B1=8F20=
23-11-25 14.49.49.png
<br>&gt;=20
<br>&gt; Then my startup command is as follows:
<br>&gt;=20
<br>&gt; *cd /home/root/imx_jailhouse *
<br>&gt; *insmod driver/jailhouse.ko *
<br>&gt; *export PATH=3D/home/root/imx_jailhouse/tools:$PATH *
<br>&gt; *jailhouse enable configs/arm64/imx8mq-veth.cell
<br>&gt; *
<br>&gt; *jailhouse cell linux configs/arm64/imx8mq-linux-demo.cell \ *
<br>&gt; *=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0~/Image2 -d \ *
<br>&gt; *=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0~/imx8mq-evk-inmate.=
dtb -i \ *
<br>&gt; *=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ~/rootfs.cpio.gz \ =
*
<br>&gt; *=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0-c &quot;clk_ignore_=
unused=20
<br>&gt; console=3Dttymxc0,30860000,115200 earlycon=3Dec_imx6q,0x30860000,1=
15200=20
<br>&gt; root=3D/dev/ram ramdisk_size=3D10000000 rdinit=3D/hello rootwait r=
w &quot; *
<br>
<br>try to add console=3Dtty0 here. Further, did you set stdout-path in yor=
=20
<br>non root&#39;s device tree correctly?
<br>
<br> &gt; console=3Dttymxc0,30860000,115200
<br>Are you sure that this line is correct? Why do you encode the address h=
ere?
<br>
<br>Please try:
<br>console=3Dttymxc0,115200 console=3Dtty0
<br>
<br>   Ralf
<br>
<br>&gt; *
<br>&gt; *
<br>&gt; Eventually, I got the following output=EF=BC=9A*
<br>&gt; *
<br>&gt; root@imx8mqevk:~/imx_jailhouse# jailhouse cell linux=20
<br>&gt; configs/arm64/imx8mq-linux-demo.cell \
<br>&gt; _unused console=3Dttymxc0,30860000,115200=20
<br>&gt; earlycon=3Dec_imx6q,0x30860000,115200 root=3D/dev/ram ramdisk_size=
=3D10000000=20
<br>&gt; rdinit=3D/hello rootwait rw &quot;
<br>&gt;  &gt; =C2=A0 =C2=A0 =C2=A0~/Image2 -d \
<br>&gt;  &gt; =C2=A0 =C2=A0 ~/imx8mq-evk-inmate.dtb -i \
<br>&gt;  &gt; =C2=A0 =C2=A0 =C2=A0~/rootfs.cpio.gz \
<br>&gt;  &gt; =C2=A0-c &quot;clk_ignore_unused console=3Dttymxc0,30860000,=
115200=20
<br>&gt; earlycon=3Dec_imx6q,0x30860000,115200 root=3D/dev/ram ramdisk_size=
=3D10000000=20
<br>&gt; rdinit=3D/hello rootwait rw &quot;
<br>&gt; [ =C2=A0567.018158] Ready to search binary handler...
<br>&gt; [ =C2=A0567.023161] Finish search binary handler, ret=3D0...
<br>&gt; [ =C2=A0567.029032] Ready to search binary handler...
<br>&gt; [ =C2=A0567.033683] Finish search binary handler, ret=3D0...
<br>&gt; [ =C2=A0567.039395] Ready to search binary handler...
<br>&gt; [ =C2=A0567.044092] Finish search binary handler, ret=3D0...
<br>&gt;=20
<br>&gt;=20
<br>&gt; [ =C2=A0567.365079] IRQ231: set affinity failed(-22).
<br>&gt; [ =C2=A0567.365091] IRQ232: set affinity failed(-22).
<br>&gt; [ =C2=A0567.365646] CPU2: shutdown
<br>&gt; [ =C2=A0567.377126] psci: CPU2 killed.
<br>&gt; [ =C2=A0567.424984] IRQ231: set affinity failed(-22).
<br>&gt; [ =C2=A0567.424991] IRQ232: set affinity failed(-22).
<br>&gt; [ =C2=A0567.425300] CPU3: shutdown
<br>&gt; [ =C2=A0567.436789] psci: CPU3 killed.
<br>&gt; Adding virtual PCI device 00:00.0 to cell &quot;linux-inmate-demo&=
quot;
<br>&gt; Shared memory connection established: &quot;linux-inmate-demo&quot=
; &lt;--&gt; &quot;imx8mq&quot;
<br>&gt; iommu_config_commit linux-inmate-demo
<br>&gt; Created cell &quot;linux-inmate-demo&quot;
<br>&gt; Page pool usage after cell creation: mem 111/995, remap 144/131072
<br>&gt; [ =C2=A0567.473937] Created Jailhouse cell &quot;linux-inmate-demo=
&quot;
<br>&gt; Cell &quot;linux-inmate-demo&quot; can be loaded
<br>&gt;=20
<br>&gt; Started cell &quot;linux-inmate-demo&quot;
<br>&gt;=20
<br>&gt; [ =C2=A0 =C2=A00.000000] Booting Linux on physical CPU 0x000000000=
2 [0x410fd034]
<br>&gt; [ =C2=A0 =C2=A00.000000] Linux version 5.4.3 (azureuser@junyiyang-=
test) (gcc=20
<br>&gt; version 9.2.0 (GCC)) #46 SMP PREEMPT Fri Nov 24 09:06:54 UTC 2023
<br>&gt; [ =C2=A0 =C2=A00.000000] Machine model: Freescale i.MX8MQ EVK
<br>&gt; [ =C2=A0 =C2=A00.000000] earlycon: ec_imx6q0 at MMIO 0x00000000308=
60000 (options=20
<br>&gt; &#39;115200&#39;)
<br>&gt; [ =C2=A0 =C2=A00.000000] printk: bootconsole [ec_imx6q0] enabled
<br>&gt; [ =C2=A0 =C2=A00.000000] efi: Getting EFI parameters from FDT:
<br>&gt; [ =C2=A0 =C2=A00.000000] efi: UEFI not found.
<br>&gt; [ =C2=A0 =C2=A00.000000] cma: Reserved 320 MiB at 0x00000000e40000=
00
<br>&gt; root@imx8mqevk:~/imx_jailhouse#
<br>&gt; root@imx8mqevk:~/imx_jailhouse#
<br>&gt; [ =C2=A0 =C2=A00.000000] NUMA: No NUMA configuration found
<br>&gt; [ =C2=A0 =C2=A00.000000] NUMA: Faking a node at [mem=20
<br>&gt; 0x00000000d0000000-0x00000000f9bfffff]
<br>&gt; [ =C2=A0 =C2=A00.000000] NUMA: NODE_DATA [mem 0xf9a97500-0xf9a98ff=
f]
<br>&gt; [ =C2=A0 =C2=A00.000000] Zone ranges:
<br>&gt; [ =C2=A0 =C2=A00.000000] =C2=A0 DMA32 =C2=A0 =C2=A0[mem 0x00000000=
d0000000-0x00000000f9bfffff]
<br>&gt; [ =C2=A0 =C2=A00.000000] =C2=A0 Normal =C2=A0 empty
<br>&gt; [ =C2=A0 =C2=A00.000000] Movable zone start for each node
<br>&gt; [ =C2=A0 =C2=A00.000000] Early memory node ranges
<br>&gt; [ =C2=A0 =C2=A00.000000] =C2=A0 node =C2=A0 0: [mem 0x00000000d000=
0000-0x00000000f9bfffff]
<br>&gt; [ =C2=A0 =C2=A00.000000] Initmem setup node 0 [mem=20
<br>&gt; 0x00000000d0000000-0x00000000f9bfffff]
<br>&gt; root@imx8mqevk:~/imx_jailhouse#
<br>&gt; [ =C2=A0 =C2=A00.000000] psci: probing for conduit method from DT.
<br>&gt; [ =C2=A0 =C2=A00.000000] psci: PSCIv1.1 detected in firmware.
<br>&gt; [ =C2=A0 =C2=A00.000000] psci: Using standard PSCI v0.2 function I=
Ds
<br>&gt; [ =C2=A0 =C2=A00.000000] psci: MIGRATE_INFO_TYPE not supported.
<br>&gt; [ =C2=A0 =C2=A00.000000] psci: SMC Calling Convention v1.1
<br>&gt; [ =C2=A0 =C2=A00.000000] percpu: Embedded 24 pages/cpu s58968 r819=
2 d31144 u98304
<br>&gt; [ =C2=A0 =C2=A00.000000] Detected VIPT I-cache on CPU0
<br>&gt; [ =C2=A0 =C2=A00.000000] CPU features: detected: ARM erratum 84571=
9
<br>&gt; [ =C2=A0 =C2=A00.000000] CPU features: detected: GIC system regist=
er CPU interface
<br>&gt; [ =C2=A0 =C2=A00.000000] Built 1 zonelists, mobility grouping on. =
=C2=A0Total pages: 168336
<br>&gt; [ =C2=A0 =C2=A00.000000] Policy zone: DMA32
<br>&gt; [ =C2=A0 =C2=A00.000000] Kernel command line: clk_ignore_unused=20
<br>&gt; console=3Dttymxc0,30860000,115200 earlycon=3Dec_imx6q,0x30860000,1=
15200=20
<br>&gt; root=3D/dev/ram ramdisk_size=3D10000000 rdinit=3D/hello rootwait r=
w
<br>&gt; [ =C2=A0 =C2=A00.000000] Dentry cache hash table entries: 131072 (=
order: 8,=20
<br>&gt; 1048576 bytes, linear)
<br>&gt; [ =C2=A0 =C2=A00.000000] Inode-cache hash table entries: 65536 (or=
der: 7, 524288=20
<br>&gt; bytes, linear)
<br>&gt; [ =C2=A0 =C2=A00.000000] mem auto-init: stack:off, heap alloc:off,=
 heap free:off
<br>&gt; root@imx8mqevk:~/imx_jailhouse#
<br>&gt; [ =C2=A0 =C2=A00.000000] Memory: 307980K/684032K available (16508K=
 kernel code,=20
<br>&gt; 1370K rwdata, 6456K rodata, 2944K init, 1039K bss, 48372K reserved=
,=20
<br>&gt; 327680K cma-reserved)
<br>&gt; [ =C2=A0 =C2=A00.000000] SLUB: HWalign=3D64, Order=3D0-3, MinObjec=
ts=3D0, CPUs=3D2, Nodes=3D1
<br>&gt; [ =C2=A0 =C2=A00.000000] rcu: Preemptible hierarchical RCU impleme=
ntation.
<br>&gt; [ =C2=A0 =C2=A00.000000] rcu: =C2=A0 =C2=A0 RCU restricting CPUs f=
rom NR_CPUS=3D256 to=20
<br>&gt; nr_cpu_ids=3D2.
<br>&gt; [ =C2=A0 =C2=A00.000000] =C2=A0Tasks RCU enabled.
<br>&gt; [ =C2=A0 =C2=A00.000000] rcu: RCU calculated value of scheduler-en=
listment delay=20
<br>&gt; is 25 jiffies.
<br>&gt; [ =C2=A0 =C2=A00.000000] rcu: Adjusting geometry for rcu_fanout_le=
af=3D16, nr_cpu_ids=3D2
<br>&gt; [ =C2=A0 =C2=A00.000000] NR_IRQS: 64, nr_irqs: 64, preallocated ir=
qs: 0
<br>&gt; [ =C2=A0 =C2=A00.000000] GICv3: 128 SPIs implemented
<br>&gt; [ =C2=A0 =C2=A00.000000] GICv3: 0 Extended SPIs implemented
<br>&gt; [ =C2=A0 =C2=A00.000000] GICv3: Distributor has no Range Selector =
support
<br>&gt; [ =C2=A0 =C2=A00.000000] GICv3: 16 PPIs implemented
<br>&gt; [ =C2=A0 =C2=A00.000000] GICv3: no VLPI support, no direct LPI sup=
port
<br>&gt; [ =C2=A0 =C2=A00.000000] GICv3: CPU0: found redistributor 2 region=
=20
<br>&gt; 0:0x00000000388c0000
<br>&gt; [ =C2=A0 =C2=A00.000000] ITS: No ITS available, not enabling LPIs
<br>&gt; [ =C2=A0 =C2=A00.000000] random: get_random_bytes called from=20
<br>&gt; start_kernel+0x2b8/0x44c with crng_init=3D0
<br>&gt; [ =C2=A0 =C2=A00.000000] arch_timer: cp15 timer(s) running at 8.33=
MHz (virt).
<br>&gt; [ =C2=A0 =C2=A00.000000] clocksource: arch_sys_counter: mask: 0xff=
ffffffffffff=20
<br>&gt; max_cycles: 0x1ec0311ec, max_idle_ns: 440795202152 ns
<br>&gt; [ =C2=A0 =C2=A00.000005] sched_clock: 56 bits at 8MHz, resolution =
120ns, wraps=20
<br>&gt; every 2199023255541ns
<br>&gt; [ =C2=A0 =C2=A00.008316] Console: colour dummy device 80x25
<br>&gt; [ =C2=A0 =C2=A00.012477] Calibrating delay loop (skipped), value c=
alculated using=20
<br>&gt; timer frequency.. 16.66 BogoMIPS (lpj=3D33333)
<br>&gt; [ =C2=A0 =C2=A00.022666] pid_max: default: 32768 minimum: 301
<br>&gt; [ =C2=A0 =C2=A00.027356] LSM: Security Framework initializing
<br>&gt; [ =C2=A0 =C2=A00.031897] SELinux: =C2=A0Initializing.
<br>&gt; [ =C2=A0 =C2=A00.035422] Mount-cache hash table entries: 2048 (ord=
er: 2, 16384=20
<br>&gt; bytes, linear)
<br>&gt; [ =C2=A0 =C2=A00.042725] Mountpoint-cache hash table entries: 2048=
 (order: 2,=20
<br>&gt; 16384 bytes, linear)
<br>&gt; [ =C2=A0 =C2=A00.051555] init thread pid check: 1...
<br>&gt; root@imx8mqevk:~/imx_jailhouse#
<br>&gt; root@imx8mqevk:~/imx_jailhouse# [ =C2=A0 =C2=A00.074633] ASID allo=
cator=20
<br>&gt; initialised with 32768 entries
<br>&gt; [ =C2=A0 =C2=A00.082633] rcu: Hierarchical SRCU implementation.
<br>&gt; [ =C2=A0 =C2=A00.091290] EFI services will not be available.
<br>&gt; [ =C2=A0 =C2=A00.098677] smp: Bringing up secondary CPUs ...
<br>&gt; [ =C2=A0 =C2=A00.130824] Detected VIPT I-cache on CPU1
<br>&gt; [ =C2=A0 =C2=A00.130870] GICv3: CPU1: found redistributor 3 region=
=20
<br>&gt; 0:0x00000000388e0000
<br>&gt; [ =C2=A0 =C2=A00.130914] CPU1: Booted secondary processor 0x000000=
0003 [0x410fd034]
<br>&gt; [ =C2=A0 =C2=A00.131020] smp: Brought up 1 node, 2 CPUs
<br>&gt; [ =C2=A0 =C2=A00.149632] SMP: Total of 2 processors activated.
<br>&gt; [ =C2=A0 =C2=A00.154314] CPU features: detected: 32-bit EL0 Suppor=
t
<br>&gt; [ =C2=A0 =C2=A00.159450] CPU features: detected: CRC32 instruction=
s
<br>&gt; [ =C2=A0 =C2=A00.177838] CPU: All CPU(s) started at EL1
<br>&gt; [ =C2=A0 =C2=A00.179087] alternatives: patching kernel code
<br>&gt; [ =C2=A0 =C2=A00.184973] devtmpfs: initialized
<br>&gt; [ =C2=A0 =C2=A00.192187] clocksource: jiffies: mask: 0xffffffff ma=
x_cycles:=20
<br>&gt; 0xffffffff, max_idle_ns: 7645041785100000 ns
<br>&gt; [ =C2=A0 =C2=A00.199073] futex hash table entries: 512 (order: 3, =
32768 bytes, linear)
<br>&gt; [ =C2=A0 =C2=A00.217026] pinctrl core: initialized pinctrl subsyst=
em
<br>&gt; [ =C2=A0 =C2=A00.220270] DMI not present or invalid.
<br>&gt; [ =C2=A0 =C2=A00.223548] NET: Registered protocol family 16
<br>&gt; [ =C2=A0 =C2=A00.243512] DMA: preallocated 256 KiB pool for atomic=
 allocations
<br>&gt; [ =C2=A0 =C2=A00.246762] audit: initializing netlink subsys (disab=
led)
<br>&gt; [ =C2=A0 =C2=A00.252330] audit: type=3D2000 audit(0.212:1): state=
=3Dinitialized=20
<br>&gt; audit_enabled=3D0 res=3D1
<br>&gt; [ =C2=A0 =C2=A00.259890] cpuidle: using governor menu
<br>&gt; [ =C2=A0 =C2=A00.264391] hw-breakpoint: found 6 breakpoint and 4 w=
atchpoint registers.
<br>&gt; [ =C2=A0 =C2=A00.271261] Serial: AMBA PL011 UART driver
<br>&gt; [ =C2=A0 =C2=A00.274699] imx mu driver is registered.
<br>&gt; [ =C2=A0 =C2=A00.278539] imx rpmsg driver is registered.
<br>&gt; [ =C2=A0 =C2=A00.304587] HugeTLB registered 1.00 GiB page size, pr=
e-allocated 0 pages
<br>&gt; [ =C2=A0 =C2=A00.308453] HugeTLB registered 32.0 MiB page size, pr=
e-allocated 0 pages
<br>&gt; [ =C2=A0 =C2=A00.315123] HugeTLB registered 2.00 MiB page size, pr=
e-allocated 0 pages
<br>&gt; [ =C2=A0 =C2=A00.321805] HugeTLB registered 64.0 KiB page size, pr=
e-allocated 0 pages
<br>&gt; [ =C2=A0 =C2=A00.331139] cryptd: max_cpu_qlen set to 1000
<br>&gt; [ =C2=A0 =C2=A00.339367] ACPI: Interpreter disabled.
<br>&gt; [ =C2=A0 =C2=A00.340820] iommu: Default domain type: Translated
<br>&gt; [ =C2=A0 =C2=A00.345428] vgaarb: loaded
<br>&gt; [ =C2=A0 =C2=A00.348260] SCSI subsystem initialized
<br>&gt; [ =C2=A0 =C2=A00.352060] usbcore: registered new interface driver =
usbfs
<br>&gt; [ =C2=A0 =C2=A00.357446] usbcore: registered new interface driver =
hub
<br>&gt; [ =C2=A0 =C2=A00.362457] usbcore: registered new device driver usb
<br>&gt; [ =C2=A0 =C2=A00.367753] mc: Linux media interface: v0.10
<br>&gt; [ =C2=A0 =C2=A00.371747] videodev: Linux video capture interface: =
v2.00
<br>&gt; [ =C2=A0 =C2=A00.377234] pps_core: LinuxPPS API ver. 1 registered
<br>&gt; [ =C2=A0 =C2=A00.382104] pps_core: Software ver. 5.3.6 - Copyright=
 2005-2007=20
<br>&gt; Rodolfo Giometti &lt;<a href data-email-masked rel=3D"nofollow">gi=
om...@linux.it</a>&gt;
<br>&gt; [ =C2=A0 =C2=A00.391236] PTP clock support registered
<br>&gt; [ =C2=A0 =C2=A00.395188] EDAC MC: Ver: 3.0.0
<br>&gt; [ =C2=A0 =C2=A00.398960] No BMan portals available!
<br>&gt; [ =C2=A0 =C2=A00.402252] QMan: Allocated lookup table at (____ptrv=
al____), entry=20
<br>&gt; count 65537
<br>&gt; [ =C2=A0 =C2=A00.409524] No QMan portals available!
<br>&gt; [ =C2=A0 =C2=A00.413314] No USDPAA memory, no &#39;fsl,usdpaa-mem&=
#39; in device-tree
<br>&gt; [ =C2=A0 =C2=A00.419312] FPGA manager framework
<br>&gt; [ =C2=A0 =C2=A00.422483] Advanced Linux Sound Architecture Driver =
Initialized.
<br>&gt; [ =C2=A0 =C2=A00.428969] Bluetooth: Core ver 2.22
<br>&gt; [ =C2=A0 =C2=A00.432033] NET: Registered protocol family 31
<br>&gt; [ =C2=A0 =C2=A00.436445] Bluetooth: HCI device and connection mana=
ger initialized
<br>&gt; [ =C2=A0 =C2=A00.442785] Bluetooth: HCI socket layer initialized
<br>&gt; [ =C2=A0 =C2=A00.447644] Bluetooth: L2CAP socket layer initialized
<br>&gt; [ =C2=A0 =C2=A00.452688] Bluetooth: SCO socket layer initialized
<br>&gt; [ =C2=A0 =C2=A00.458289] clocksource: Switched to clocksource arch=
_sys_counter
<br>&gt; [ =C2=A0 =C2=A00.463791] VFS: Disk quotas dquot_6.6.0
<br>&gt; [ =C2=A0 =C2=A00.467580] VFS: Dquot-cache hash table entries: 512 =
(order 0, 4096=20
<br>&gt; bytes)
<br>&gt; [ =C2=A0 =C2=A00.474589] pnp: PnP ACPI: disabled
<br>&gt; [ =C2=A0 =C2=A00.486097] thermal_sys: Registered thermal governor =
&#39;step_wise&#39;
<br>&gt; [ =C2=A0 =C2=A00.486100] thermal_sys: Registered thermal governor =
&#39;power_allocator&#39;
<br>&gt; [ =C2=A0 =C2=A00.489479] NET: Registered protocol family 2
<br>&gt; [ =C2=A0 =C2=A00.500595] tcp_listen_portaddr_hash hash table entri=
es: 512 (order:=20
<br>&gt; 1, 8192 bytes, linear)
<br>&gt; [ =C2=A0 =C2=A00.508479] TCP established hash table entries: 8192 =
(order: 4, 65536=20
<br>&gt; bytes, linear)
<br>&gt; [ =C2=A0 =C2=A00.516248] TCP bind hash table entries: 8192 (order:=
 5, 131072=20
<br>&gt; bytes, linear)
<br>&gt; [ =C2=A0 =C2=A00.523523] TCP: Hash tables configured (established =
8192 bind 8192)
<br>&gt; [ =C2=A0 =C2=A00.529790] UDP hash table entries: 512 (order: 2, 16=
384 bytes, linear)
<br>&gt; [ =C2=A0 =C2=A00.536336] UDP-Lite hash table entries: 512 (order: =
2, 16384 bytes,=20
<br>&gt; linear)
<br>&gt; [ =C2=A0 =C2=A00.543469] NET: Registered protocol family 1
<br>&gt; [ =C2=A0 =C2=A00.548165] RPC: Registered named UNIX socket transpo=
rt module.
<br>&gt; [ =C2=A0 =C2=A00.553581] RPC: Registered udp transport module.
<br>&gt; [ =C2=A0 =C2=A00.558262] RPC: Registered tcp transport module.
<br>&gt; [ =C2=A0 =C2=A00.562952] RPC: Registered tcp NFSv4.1 backchannel t=
ransport module.
<br>&gt; [ =C2=A0 =C2=A00.569831] PCI: CLS 0 bytes, default 64
<br>&gt; [ =C2=A0 =C2=A00.573504] Trying to unpack rootfs image as initramf=
s...
<br>&gt; [ =C2=A0 =C2=A00.578681] Compressed data magic: 0x1f 0x8b
<br>&gt; [ =C2=A0 =C2=A00.604372] Freeing initrd memory: 372K
<br>&gt; [ =C2=A0 =C2=A00.606046] kvm [1]: HYP mode not available
<br>&gt; [ =C2=A0 =C2=A00.616895] Initialise system trusted keyrings
<br>&gt; [ =C2=A0 =C2=A00.618624] workingset: timestamp_bits=3D44 max_order=
=3D18 bucket_order=3D0
<br>&gt; [ =C2=A0 =C2=A00.633665] squashfs: version 4.0 (2009/01/31) Philli=
p Lougher
<br>&gt; [ =C2=A0 =C2=A00.637392] NFS: Registering the id_resolver key type
<br>&gt; [ =C2=A0 =C2=A00.641713] Key type id_resolver registered
<br>&gt; [ =C2=A0 =C2=A00.645848] Key type id_legacy registered
<br>&gt; [ =C2=A0 =C2=A00.649848] nfs4filelayout_init: NFSv4 File Layout Dr=
iver Registering...
<br>&gt; [ =C2=A0 =C2=A00.656543] jffs2: version 2.2. (NAND) =C2=A9 2001-20=
06 Red Hat, Inc.
<br>&gt; [ =C2=A0 =C2=A00.663102] 9p: Installing v9fs 9p2000 file system su=
pport
<br>&gt; [ =C2=A0 =C2=A00.688300] Key type asymmetric registered
<br>&gt; [ =C2=A0 =C2=A00.689534] Asymmetric key parser &#39;x509&#39; regi=
stered
<br>&gt; [ =C2=A0 =C2=A00.694461] Block layer SCSI generic (bsg) driver ver=
sion 0.4 loaded=20
<br>&gt; (major 244)
<br>&gt; [ =C2=A0 =C2=A00.701900] io scheduler mq-deadline registered
<br>&gt; [ =C2=A0 =C2=A00.706301] io scheduler kyber registered
<br>&gt; [ =C2=A0 =C2=A00.711544] pci-host-generic bfb00000.pci: host bridg=
e /pci@bfb00000=20
<br>&gt; ranges:
<br>&gt; [ =C2=A0 =C2=A00.717352] pci-host-generic bfb00000.pci: =C2=A0 MEM=
=20
<br>&gt; 0x10000000..0x1000ffff -&gt; 0x10000000
<br>&gt; [ =C2=A0 =C2=A00.725202] pci-host-generic bfb00000.pci: ECAM at [m=
em=20
<br>&gt; 0xbfb00000-0xbfbfffff] for [bus 00]
<br>&gt; [ =C2=A0 =C2=A00.733608] pci-host-generic bfb00000.pci: PCI host b=
ridge to bus 0000:00
<br>&gt; [ =C2=A0 =C2=A00.740249] pci_bus 0000:00: root bus resource [bus 0=
0]
<br>&gt; [ =C2=A0 =C2=A00.745450] pci_bus 0000:00: root bus resource [mem=
=20
<br>&gt; 0x10000000-0x1000ffff]
<br>&gt; [ =C2=A0 =C2=A00.752335] pci 0000:00:00.0: [1af4:1110] type 00 cla=
ss 0xff0100
<br>&gt; [ =C2=A0 =C2=A00.758324] pci 0000:00:00.0: reg 0x10: [mem 0x000000=
00-0x000000ff 64bit]
<br>&gt; [ =C2=A0 =C2=A00.766848] pci 0000:00:00.0: BAR 0: assigned [mem=20
<br>&gt; 0x10000000-0x100000ff 64bit]
<br>&gt; [ =C2=A0 =C2=A00.773175] EINJ: ACPI disabled.
<br>&gt; [ =C2=A0 =C2=A00.776584] Bus freq driver module loaded
<br>&gt; [ =C2=A0 =C2=A00.780120] virtio-pci 0000:00:00.0: enabling device =
(0000 -&gt; 0002)
<br>&gt; [ =C2=A0 =C2=A00.789667] Serial: 8250/16550 driver, 4 ports, IRQ s=
haring enabled
<br>&gt; [ =C2=A0 =C2=A00.794841] 30890000.serial: ttymxc1 at MMIO 0x308900=
00 (irq =3D 5,=20
<br>&gt; base_baud =3D 1562500) is a IMX
<br>&gt; [ =C2=A0 =C2=A00.812412] brd: module loaded
<br>&gt; [ =C2=A0 =C2=A00.820118] loop: module loaded
<br>&gt; [ =C2=A0 =C2=A00.822089] imx ahci driver is registered.
<br>&gt; [ =C2=A0 =C2=A00.826835] libphy: Fixed MDIO Bus: probed
<br>&gt; [ =C2=A0 =C2=A00.829601] tun: Universal TUN/TAP device driver, 1.6
<br>&gt; [ =C2=A0 =C2=A00.833815] CAN device driver interface
<br>&gt; [ =C2=A0 =C2=A00.837738] thunder_xcv, ver 1.0
<br>&gt; [ =C2=A0 =C2=A00.840680] thunder_bgx, ver 1.0
<br>&gt; [ =C2=A0 =C2=A00.843893] nicpf, ver 1.0
<br>&gt; [ =C2=A0 =C2=A00.846753] Freescale FM module, FMD API version 21.1=
.0
<br>&gt; [ =C2=A0 =C2=A00.851814] Freescale FM Ports module
<br>&gt; [ =C2=A0 =C2=A00.855392] fsl_mac: fsl_mac: FSL FMan MAC API based =
driver
<br>&gt; [ =C2=A0 =C2=A00.861005] fsl_dpa: FSL DPAA Ethernet driver
<br>&gt; [ =C2=A0 =C2=A00.865334] fsl_advanced: FSL DPAA Advanced drivers:
<br>&gt; [ =C2=A0 =C2=A00.870234] fsl_proxy: FSL DPAA Proxy initialization =
driver
<br>&gt; [ =C2=A0 =C2=A00.875835] fsl_oh: FSL FMan Offline Parsing port dri=
ver
<br>&gt; [ =C2=A0 =C2=A00.881572] hclge is initializing
<br>&gt; [ =C2=A0 =C2=A00.884388] hns3: Hisilicon Ethernet Network Driver f=
or Hip08 Family=20
<br>&gt; - version
<br>&gt; [ =C2=A0 =C2=A00.891589] hns3: Copyright (c) 2017 Huawei Corporati=
on.
<br>&gt; [ =C2=A0 =C2=A00.896938] e1000: Intel(R) PRO/1000 Network Driver -=
 version=20
<br>&gt; 7.3.21-k8-NAPI
<br>&gt; [ =C2=A0 =C2=A00.903916] e1000: Copyright (c) 1999-2006 Intel Corp=
oration.
<br>&gt; [ =C2=A0 =C2=A00.909688] e1000e: Intel(R) PRO/1000 Network Driver =
- 3.2.6-k
<br>&gt; [ =C2=A0 =C2=A00.915505] e1000e: Copyright(c) 1999 - 2015 Intel Co=
rporation.
<br>&gt; [ =C2=A0 =C2=A00.921425] igb: Intel(R) Gigabit Ethernet Network Dr=
iver - version=20
<br>&gt; 5.6.0-k
<br>&gt; [ =C2=A0 =C2=A00.928314] igb: Copyright (c) 2007-2014 Intel Corpor=
ation.
<br>&gt; [ =C2=A0 =C2=A00.933910] igbvf: Intel(R) Gigabit Virtual Function =
Network Driver -=20
<br>&gt; version 2.4.0-k
<br>&gt; [ =C2=A0 =C2=A00.941683] igbvf: Copyright (c) 2009 - 2012 Intel Co=
rporation.
<br>&gt; [ =C2=A0 =C2=A00.947685] sky2: driver version 1.30
<br>&gt; [ =C2=A0 =C2=A00.951424] usbcore: registered new interface driver =
asix
<br>&gt; [ =C2=A0 =C2=A00.956652] usbcore: registered new interface driver =
ax88179_178a
<br>&gt; [ =C2=A0 =C2=A00.962722] usbcore: registered new interface driver =
cdc_ether
<br>&gt; [ =C2=A0 =C2=A00.968534] usbcore: registered new interface driver =
net1080
<br>&gt; [ =C2=A0 =C2=A00.974179] usbcore: registered new interface driver =
cdc_subset
<br>&gt; [ =C2=A0 =C2=A00.980082] usbcore: registered new interface driver =
zaurus
<br>&gt; [ =C2=A0 =C2=A00.985654] usbcore: registered new interface driver =
cdc_ncm
<br>&gt; [ =C2=A0 =C2=A00.991279] usbcore: registered new interface driver =
huawei_cdc_ncm
<br>&gt; [ =C2=A0 =C2=A00.997535] usbcore: registered new interface driver =
qmi_wwan_q
<br>&gt; [ =C2=A0 =C2=A01.003641] VFIO - User Level meta-driver version: 0.=
3
<br>&gt; [ =C2=A0 =C2=A01.009455] ehci_hcd: USB 2.0 &#39;Enhanced&#39; Host=
 Controller (EHCI) Driver
<br>&gt; [ =C2=A0 =C2=A01.015039] ehci-pci: EHCI PCI platform driver
<br>&gt; [ =C2=A0 =C2=A01.019496] ehci-platform: EHCI generic platform driv=
er
<br>&gt; [ =C2=A0 =C2=A01.024722] ohci_hcd: USB 1.1 &#39;Open&#39; Host Con=
troller (OHCI) Driver
<br>&gt; [ =C2=A0 =C2=A01.030839] ohci-pci: OHCI PCI platform driver
<br>&gt; [ =C2=A0 =C2=A01.035296] ohci-platform: OHCI generic platform driv=
er
<br>&gt; [ =C2=A0 =C2=A01.040695] usbcore: registered new interface driver =
cdc_wdm
<br>&gt; [ =C2=A0 =C2=A01.046156] usbcore: registered new interface driver =
usb-storage
<br>&gt; [ =C2=A0 =C2=A01.052184] usbcore: registered new interface driver =
usbserial_generic
<br>&gt; [ =C2=A0 =C2=A01.058636] usbserial: USB Serial support registered =
for generic
<br>&gt; [ =C2=A0 =C2=A01.064625] usbcore: registered new interface driver =
option
<br>&gt; [ =C2=A0 =C2=A01.070174] usbserial: USB Serial support registered =
for GSM modem=20
<br>&gt; (1-port)
<br>&gt; [ =C2=A0 =C2=A01.078254] &lt;&lt;-GTP-INFO-&gt;&gt; GTP driver ins=
talling...
<br>&gt; [ =C2=A0 =C2=A01.082821] i2c /dev entries driver
<br>&gt; [ =C2=A0 =C2=A01.086604] Bluetooth: HCI UART driver ver 2.3
<br>&gt; [ =C2=A0 =C2=A01.089846] Bluetooth: HCI UART protocol H4 registere=
d
<br>&gt; [ =C2=A0 =C2=A01.094981] Bluetooth: HCI UART protocol BCSP registe=
red
<br>&gt; [ =C2=A0 =C2=A01.100305] Bluetooth: HCI UART protocol LL registere=
d
<br>&gt; [ =C2=A0 =C2=A01.105394] Bluetooth: HCI UART protocol ATH3K regist=
ered
<br>&gt; [ =C2=A0 =C2=A01.110796] Bluetooth: HCI UART protocol Three-wire (=
H5) registered
<br>&gt; [ =C2=A0 =C2=A01.117092] Bluetooth: HCI UART protocol Broadcom reg=
istered
<br>&gt; [ =C2=A0 =C2=A01.122689] Bluetooth: HCI UART protocol QCA register=
ed
<br>&gt; [ =C2=A0 =C2=A01.128079] imx-cpufreq-dt: probe of imx-cpufreq-dt f=
ailed with error -2
<br>&gt; [ =C2=A0 =C2=A01.135773] sdhci: Secure Digital Host Controller Int=
erface driver
<br>&gt; [ =C2=A0 =C2=A01.140731] sdhci: Copyright(c) Pierre Ossman
<br>&gt; [ =C2=A0 =C2=A01.145172] Synopsys Designware Multimedia Card Inter=
face Driver
<br>&gt; [ =C2=A0 =C2=A01.151282] sdhci-pltfm: SDHCI platform and OF driver=
 helper
<br>&gt; [ =C2=A0 =C2=A01.157247] ledtrig-cpu: registered to indicate activ=
ity on CPUs
<br>&gt; [ =C2=A0 =C2=A01.163670] usbcore: registered new interface driver =
usbhid
<br>&gt; [ =C2=A0 =C2=A01.168242] usbhid: USB HID core driver
<br>&gt; [ =C2=A0 =C2=A01.172978] No fsl,qman node
<br>&gt; [ =C2=A0 =C2=A01.174928] Freescale USDPAA process driver
<br>&gt; [ =C2=A0 =C2=A01.179087] fsl-usdpaa: no region found
<br>&gt; [ =C2=A0 =C2=A01.182907] Freescale USDPAA process IRQ driver
<br>&gt; [ =C2=A0 =C2=A01.191715] NET: Registered protocol family 26
<br>&gt; [ =C2=A0 =C2=A01.193427] Initializing XFRM netlink socket
<br>&gt; [ =C2=A0 =C2=A01.198204] NET: Registered protocol family 10
<br>&gt; [ =C2=A0 =C2=A01.202897] Segment Routing with IPv6
<br>&gt; [ =C2=A0 =C2=A01.205680] NET: Registered protocol family 17
<br>&gt; [ =C2=A0 =C2=A01.210087] can: controller area network core (rev 20=
170425 abi 9)
<br>&gt; [ =C2=A0 =C2=A01.216272] NET: Registered protocol family 29
<br>&gt; [ =C2=A0 =C2=A01.220654] can: raw protocol (rev 20170425)
<br>&gt; [ =C2=A0 =C2=A01.224903] can: broadcast manager protocol (rev 2017=
0425 t)
<br>&gt; [ =C2=A0 =C2=A01.230548] can: netlink gateway (rev 20190810) max_h=
ops=3D1
<br>&gt; [ =C2=A0 =C2=A01.236247] Bluetooth: RFCOMM TTY layer initialized
<br>&gt; [ =C2=A0 =C2=A01.240894] Bluetooth: RFCOMM socket layer initialize=
d
<br>&gt; [ =C2=A0 =C2=A01.246020] Bluetooth: RFCOMM ver 1.11
<br>&gt; [ =C2=A0 =C2=A01.249739] Bluetooth: BNEP (Ethernet Emulation) ver =
1.3
<br>&gt; [ =C2=A0 =C2=A01.255024] Bluetooth: BNEP filters: protocol multica=
st
<br>&gt; [ =C2=A0 =C2=A01.260238] Bluetooth: BNEP socket layer initialized
<br>&gt; [ =C2=A0 =C2=A01.265180] Bluetooth: HIDP (Human Interface Emulatio=
n) ver 1.2
<br>&gt; [ =C2=A0 =C2=A01.271085] Bluetooth: HIDP socket layer initialized
<br>&gt; [ =C2=A0 =C2=A01.276074] 8021q: 802.1Q VLAN Support v1.8
<br>&gt; [ =C2=A0 =C2=A01.280216] lib80211: common routines for IEEE802.11 =
drivers
<br>&gt; [ =C2=A0 =C2=A01.285980] 9pnet: Installing 9P2000 support
<br>&gt; [ =C2=A0 =C2=A01.290126] tsn generic netlink module v1 init...
<br>&gt; [ =C2=A0 =C2=A01.294849] Key type dns_resolver registered
<br>&gt; [ =C2=A0 =C2=A01.299721] registered taskstats version 1
<br>&gt; [ =C2=A0 =C2=A01.303120] Loading compiled-in X.509 certificates
<br>&gt; [ =C2=A0 =C2=A01.310428] hctosys: unable to open rtc device (rtc0)
<br>&gt; [ =C2=A0 =C2=A01.313111] cfg80211: Loading compiled-in X.509 certi=
ficates for=20
<br>&gt; regulatory database
<br>&gt; [ =C2=A0 =C2=A01.322641] cfg80211: Loaded X.509 cert &#39;sforshee=
: 00b28ddf47aef9cea7&#39;
<br>&gt; [ =C2=A0 =C2=A01.327262] platform regulatory.0: Direct firmware lo=
ad for=20
<br>&gt; regulatory.db failed with error -2
<br>&gt; [ =C2=A0 =C2=A01.330307] clk: Not disabling unused clocks
<br>&gt; [ =C2=A0 =C2=A01.335778] platform regulatory.0: Falling back to sy=
sfs fallback=20
<br>&gt; for: regulatory.db
<br>&gt; [ =C2=A0 =C2=A01.340026] ALSA device list:
<br>&gt; [ =C2=A0 =C2=A01.350686] =C2=A0 No soundcards found.
<br>&gt; [ =C2=A0 =C2=A01.354101] The error code is -2
<br>&gt; *[ =C2=A0 =C2=A01.357282] Warning: unable to open an initial conso=
le.*
<br>&gt; [ =C2=A0 =C2=A01.363973] Freeing unused kernel memory: 2944K
<br>&gt; [ =C2=A0 =C2=A01.382376] Run /hello as init process
<br>&gt; [ =C2=A0 =C2=A01.383398] Ready to search binary handler...
<br>&gt; [ =C2=A0 =C2=A01.387791] Finish search binary handler, ret=3D0...
<br>&gt;=20
<br>&gt;=20
<br>&gt; My console cannot output the printf code in the helloworld program=
. I=20
<br>&gt; can&#39;t solve this problem anyway. Can you help me solve it?
<br>&gt;=20
<br>&gt; imx8mq-evk-inmate.dts: (for non-root-cell linux)
<br>&gt; &amp;uart2 {
<br>&gt; clocks =3D &lt;&amp;osc_25m&gt;,
<br>&gt; &lt;&amp;osc_25m&gt;;
<br>&gt; clock-names =3D &quot;ipg&quot;, &quot;per&quot;;
<br>&gt; /delete-property/ dmas;
<br>&gt; /delete-property/ dmas-names;
<br>&gt; status =3D &quot;okay&quot;;
<br>&gt; };
<br>&gt;=20
<br>&gt; ok8mq-evk-root.dts (for root cell )
<br>&gt; &amp;uart1 {
<br>&gt; /* uart2 is used by the 2nd OS, so configure pin and clk */
<br>&gt; pinctrl-0 =3D &lt;&amp;pinctrl_uart1&gt;, &lt;&amp;pinctrl_uart2&g=
t;;
<br>&gt; assigned-clocks =3D &lt;&amp;clk IMX8MQ_CLK_UART1&gt;,
<br>&gt; &lt;&amp;clk IMX8MQ_CLK_UART2&gt;;
<br>&gt; assigned-clock-parents =3D &lt;&amp;clk IMX8MQ_CLK_25M&gt;,
<br>&gt; &lt;&amp;clk IMX8MQ_CLK_25M&gt;;
<br>&gt; };
<br>&gt;=20
<br>&gt; --=20
<br>&gt; You received this message because you are subscribed to the Google=
=20
<br>&gt; Groups &quot;Jailhouse&quot; group.
<br>&gt; To unsubscribe from this group and stop receiving emails from it, =
send=20
<br>&gt; an email to <a href data-email-masked rel=3D"nofollow">jailhouse-d=
e...@googlegroups.com</a>=20
<br>&gt; &lt;mailto:<a href data-email-masked rel=3D"nofollow">jailhouse-de=
...@googlegroups.com</a>&gt;.
<br>&gt; To view this discussion on the web visit=20
<br>&gt; <a href=3D"https://groups.google.com/d/msgid/jailhouse-dev/893f2e4=
6-c438-4182-859f-1f65af16f8d4n%40googlegroups.com" target=3D"_blank" rel=3D=
"nofollow" data-saferedirecturl=3D"https://www.google.com/url?hl=3Dzh-CN&am=
p;q=3Dhttps://groups.google.com/d/msgid/jailhouse-dev/893f2e46-c438-4182-85=
9f-1f65af16f8d4n%2540googlegroups.com&amp;source=3Dgmail&amp;ust=3D17017643=
05930000&amp;usg=3DAOvVaw0WedzWRAX_V1eqq8mfwBIV">https://groups.google.com/=
d/msgid/jailhouse-dev/893f2e46-c438-4182-859f-1f65af16f8d4n%40googlegroups.=
com</a> &lt;<a href=3D"https://groups.google.com/d/msgid/jailhouse-dev/893f=
2e46-c438-4182-859f-1f65af16f8d4n%40googlegroups.com?utm_medium=3Demail&amp=
;utm_source=3Dfooter" target=3D"_blank" rel=3D"nofollow" data-saferedirectu=
rl=3D"https://www.google.com/url?hl=3Dzh-CN&amp;q=3Dhttps://groups.google.c=
om/d/msgid/jailhouse-dev/893f2e46-c438-4182-859f-1f65af16f8d4n%2540googlegr=
oups.com?utm_medium%3Demail%26utm_source%3Dfooter&amp;source=3Dgmail&amp;us=
t=3D1701764305930000&amp;usg=3DAOvVaw0MMOz0HLsCXqW-OAf17BVc">https://groups=
.google.com/d/msgid/jailhouse-dev/893f2e46-c438-4182-859f-1f65af16f8d4n%40g=
ooglegroups.com?utm_medium=3Demail&amp;utm_source=3Dfooter</a>&gt;.
<br></blockquote></div>

<p></p>

-- <br />
You received this message because you are subscribed to the Google Groups &=
quot;Jailhouse&quot; group.<br />
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to <a href=3D"mailto:jailhouse-dev+unsubscribe@googlegroups.com">jailh=
ouse-dev+unsubscribe@googlegroups.com</a>.<br />
To view this discussion on the web visit <a href=3D"https://groups.google.c=
om/d/msgid/jailhouse-dev/305639b4-0140-4c73-9481-c593701527d5n%40googlegrou=
ps.com?utm_medium=3Demail&utm_source=3Dfooter">https://groups.google.com/d/=
msgid/jailhouse-dev/305639b4-0140-4c73-9481-c593701527d5n%40googlegroups.co=
m</a>.<br />

------=_Part_97568_1994301258.1701677996499--

------=_Part_97567_748884021.1701677996499--
