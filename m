Return-Path: <jailhouse-dev+bncBDVP3IWNW4CBBBPRVWKQMGQEC5WVFTQ@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-qk1-x737.google.com (mail-qk1-x737.google.com [IPv6:2607:f8b0:4864:20::737])
	by mail.lfdr.de (Postfix) with ESMTPS id 0DA2454E988
	for <lists+jailhouse-dev@lfdr.de>; Thu, 16 Jun 2022 20:37:59 +0200 (CEST)
Received: by mail-qk1-x737.google.com with SMTP id r6-20020a05620a298600b006a98e988ba4sf2575724qkp.3
        for <lists+jailhouse-dev@lfdr.de>; Thu, 16 Jun 2022 11:37:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20210112;
        h=sender:date:from:to:message-id:in-reply-to:references:subject
         :mime-version:x-original-sender:precedence:mailing-list:list-id
         :list-post:list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=d7K/7GvTUUKDMLSfCKwHLYeNHuK4aqIiNKn6vBaonlE=;
        b=rs8TYDluuqCE5PcKn+tg6fitffpM5jpNsO5/NHBKNwhbqI+yPpLqZTHFp+Nbp74Dpk
         NyY8QuqvkcMxGQikMe0V1geJ+HmhsTxtG0nNX3E4AVLaOgdiEPHeVPyY1npuO3uuUQxu
         Z/+E7l7VDYxt3ppMc5j3rztDC/VELlUH01lRCVvlRs9h1T0nMImocJ41f3zaxcAhLbEn
         6gLr437cYWYvNCRs22xpDdDE0VXSm4PqFH7Z/QNMsE5uJA1bcLgZ4J5E7L0rwBzVhYUi
         yMv9XI5Rf6ExIAJKkCIGmPTjkMzQZiTSHoiv7fLBAryab4xpKr20YBS5v7i3JdENdP69
         Khww==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=date:from:to:message-id:in-reply-to:references:subject:mime-version
         :x-original-sender:precedence:mailing-list:list-id:list-post
         :list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=d7K/7GvTUUKDMLSfCKwHLYeNHuK4aqIiNKn6vBaonlE=;
        b=UKuD1ApT0o4P+AmB36ieV7pVifLYO4OR2RiC8ObimDdzXaoF589geUGZuluBPWM6+6
         NDnXDTtNGIcRtKmqWW5D7zRrJOk15LsPPch0hI9ZCFVu9c5OZBc+uq7xYwgoJQM2etXH
         8EZTkEIl5pf5W/W6St2xNq9eJF6Hag4v6LcjCYHwxt4DhyLTv7s7h2Q68xdnRr3sz8xa
         an/HHy+s7RqbTdEcgjsjC+2R+nsYTylqaew5bG3cGuS7H5RE1FUmy40B6wVlCuVdzwYq
         FEN5TXgsUExH7m4Az0CcAfcyTPY4FnP4Y6FRuife+zCYV86Le3MtxIxUjrkebMmgS7vM
         F7ww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=sender:x-gm-message-state:date:from:to:message-id:in-reply-to
         :references:subject:mime-version:x-original-sender:precedence
         :mailing-list:list-id:x-spam-checked-in-group:list-post:list-help
         :list-archive:list-subscribe:list-unsubscribe;
        bh=d7K/7GvTUUKDMLSfCKwHLYeNHuK4aqIiNKn6vBaonlE=;
        b=PjHqc/VwUIx1Q0PCNRizfwet4fGcpAVrqo4k4OY4ytb0hR27ZI8xWOVnFHhQ/i8ohF
         rQbJh208xa3iL3ozOymlf6Ahczj+tXDcVY1uHy3MPXKadreAp/fu1yv2xyKwA6djXvaQ
         dOWVDY94kbbTc/6JxUnDI5Gey8ooKPi0DuyUyjJgZFEDErWGFsgX5c8fb5hgOS5Lv4yA
         YvRauMrHqqVesHWH7LiPv7b2uZgbU9I7+gvYTMw2yZtJ6AqvhLe94LcxGJYo5M2SvXu5
         c8aeHLEvu6d0Oo1LfWv2XKyF+IO/v2n7Mw4R/RlbrnocjA4IuP6pyh4VdQYzZX8QzWN7
         VbNw==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AJIora8VlH01KfZe2yBxz2Cp18ai3H8C8Yu3uyGpl9mk7vALpLn0O6qC
	Mep1HrjTnNE+5rM50QrJABg=
X-Google-Smtp-Source: AGRyM1u821ovOnvd/DN2QiG5dWzbxyXLVHKTl4pUfWrsapoGz2HZCoLy8QKprWezlGh4EMfIlQ5XeQ==
X-Received: by 2002:a37:a8ce:0:b0:6a6:990d:d7f0 with SMTP id r197-20020a37a8ce000000b006a6990dd7f0mr4572936qke.588.1655404677859;
        Thu, 16 Jun 2022 11:37:57 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a05:620a:c04:b0:6a7:3c7f:2b3a with SMTP id
 l4-20020a05620a0c0400b006a73c7f2b3als1615268qki.9.gmail; Thu, 16 Jun 2022
 11:37:57 -0700 (PDT)
X-Received: by 2002:a05:620a:2448:b0:6a6:c24e:2b38 with SMTP id h8-20020a05620a244800b006a6c24e2b38mr4566302qkn.326.1655404676905;
        Thu, 16 Jun 2022 11:37:56 -0700 (PDT)
Date: Thu, 16 Jun 2022 11:37:56 -0700 (PDT)
From: "vsun...@gmail.com" <vsuneja63@gmail.com>
To: Jailhouse <jailhouse-dev@googlegroups.com>
Message-Id: <e3d17a73-37b0-4250-9168-e37a134a4af4n@googlegroups.com>
In-Reply-To: <c58f3a6e-a1d0-4b7e-896d-42a1ee0fa40en@googlegroups.com>
References: <c58f3a6e-a1d0-4b7e-896d-42a1ee0fa40en@googlegroups.com>
Subject: Re: i.MX8 : Facing issue while loading image in non-root cell of
 jailhouse 0.12
MIME-Version: 1.0
Content-Type: multipart/mixed; 
	boundary="----=_Part_372_1277284333.1655404676165"
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

------=_Part_372_1277284333.1655404676165
Content-Type: multipart/alternative; 
	boundary="----=_Part_373_1081614761.1655404676165"

------=_Part_373_1081614761.1655404676165
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Peng,

Any input from your end?

Thanks & Regards,
Vipul Kumar

On Tuesday, May 31, 2022 at 1:00:42 AM UTC+5:30 vsun...@gmail.com wrote:

> Hi,
>
> I am trying to load & bootup 2nd linux image in non-root cell of jailhous=
e.
> I could port jailhouse 0.12 in kernel 5.4.147 . Flashed the image in SD=
=20
> card & emmc of i.MX8. Initiated SD card image with command "run jh_mmcboo=
t"=20
> & could load jailhouse driver also. emmc has mmcblk0 & sd card has mmcblk=
1,=20
> mounted mmcblk1p1 & mmcblkip2 manually.
> =20
> After driver is up used below commands:
>
> *jailhouse enable /usr/share/jailhouse/cells/imx8mq.cell*
>
> *export PATH=3D$PATH:/usr/share/jailhouse/tools/*
>
> * jailhouse cell linux /usr/share/jailhouse/cells/imx8mq-linux-demo.cell=
=20
> /run/media/mmcblk1p1/Image -d /run/media/mmcblk1p1/imx8mq-evk-inmate.dtb =
-c=20
> "clk_ignore_unused console=3Dttymxc0,115200=20
> earlycon=3Dec_imx6q,0x30860000,115200 root=3D/dev/mmcblk2p2 rootwait rw"*
>
> 2nd image not booting up, below are the logs:
>
>
>
>
>
>
>
>
>
>
>
>
>
>
>
>
>
>
>
>
>
>
>
>
>
>
>
>
>
>
>
>
>
>
>
>
>
>
>
>
>
>
>
>
>
>
>
>
>
>
>
>
>
>
>
>
>
>
>
>
>
>
>
>
>
>
>
>
>
>
>
>
>
>
>
>
>
>
>
>
>
>
>
>
>
>
>
>
>
>
>
>
>
>
>
>
>
>
>
>
>
>
>
>
>
>
>
>
>
>
>
>
>
>
>
>
>
>
>
>
>
>
>
>
>
>
>
>
>
>
>
>
>
>
>
>
>
>
>
>
>
>
>
>
>
>
>
>
>
>
>
>
>
>
>
>
>
>
>
>
>
>
>
>
>
>
>
>
>
>
>
>
>
>
>
>
>
>
>
>
>
>
>
>
>
>
>
>
>
>
>
>
>
>
>
>
>
>
>
>
>
>
>
>
>
>
>
>
>
>
>
>
>
>
>
>
>
>
>
>
>
>
>
>
>
>
>
>
>
>
>
>
>
>
>
>
>
>
>
>
>
>
>
>
>
>
>
>
>
>
>
>
>
>
>
>
>
>
>
>
>
>
>
>
>
>
>
>
>
>
>
>
>
>
>
>
>
>
>
>
>
>
>
>
>
>
>
>
>
>
>
>
>
>
>
>
>
>
>
>
>
>
>
>
>
>
>
>
>
>
> *root=3D/dev/mmcblk2p2 rootwait rw"mxc0,115200=20
> earlycon=3Dec_imx6q,0x30860000,115200[ 2102.362388] IRQ232: set affinity=
=20
> failed(-22).[ 2102.362464] CPU2: shutdown[ 2102.369562] psci: CPU2 killed=
=20
> (polled 0 ms)[ 2102.422343] IRQ232: set affinity failed(-22).[ 2102.42264=
2]=20
> CPU3: shutdown[ 2102.429741] psci: CPU3 killed (polled 0 ms)Adding virtua=
l=20
> PCI device 00:00.0 to cell "linux-inmate-demo"Shared memory connection=20
> established, peer cells: "imx8mq"Adding virtual PCI device 00:01.0 to cel=
l=20
> "linux-inmate-demo"Shared memory connection established, peer=20
> cells: "imx8mq"Created cell "linux-inmate-demo"Page pool usage after cell=
=20
> creation: mem 80/992, remap 144/131072[ 2102.486660] Created Jailhouse ce=
ll=20
> "linux-inmate-demo"Cell "linux-inmate-demo" can be loadedStarted cell=20
> "linux-inmate-demo"[    0.000000] Booting Linux on physical CPU=20
> 0x0000000002 [0x410fd034][    0.000000] Linux version 5.4.147+gbbb2e2b=20
> (oe-user@oe-host) (gcc version 9.3.0 (GCC)) #1 SMP PREEMPT Wed Dec 1=20
> 22:21:40 UTC 2021[    0.000000] Machine model: Freescale i.MX8MQ EVK[  =
=20
>  0.000000] earlycon: ec_imx6q0 at MMIO 0x0000000030860000 (options=20
> '115200')[    0.000000] printk: bootconsole [ec_imx6q0] enabled[  =20
>  0.000000] efi: Getting EFI parameters from FDT:[    0.000000] efi: UEFI=
=20
> not found.[    0.000000] cma: Reserved 320 MiB at=20
> 0x00000000e8000000imx8mqevk:/dev# [    0.000000] NUMA: No NUMA=20
> configuration found[    0.000000] NUMA: Faking a node at [mem=20
> 0x00000000c0000000-0x00000000fdbfffff][    0.000000] NUMA: NODE_DATA [mem=
=20
> 0xfda0e500-0xfda0ffff][    0.000000] Zone ranges:[    0.000000]   DMA32  =
=20
>  [mem 0x00000000c0000000-0x00000000fdbfffff][    0.000000]   Normal  =20
> empty[    0.000000] Movable zone start for each node[    0.000000] Early=
=20
> memory node ranges[    0.000000]   node   0: [mem=20
> 0x00000000c0000000-0x00000000fdbfffff][    0.000000] Initmem setup node 0=
=20
> [mem 0x00000000c0000000-0x00000000fdbfffff][    0.000000] psci: probing f=
or=20
> conduit method from DT.[    0.000000] psci: PSCIv1.1 detected in firmware=
.[=20
>    0.000000] psci: Using standard PSCI v0.2 function IDs[    0.000000]=20
> psci: MIGRATE_INFO_TYPE not supported.[    0.000000] psci: SMC Calling=20
> Convention v1.1[    0.000000] percpu: Embedded 33 pages/cpu s98072 r8192=
=20
> d28904 u135168[    0.000000] Detected VIPT I-cache on CPU0[    0.000000]=
=20
> CPU features: detected: ARM erratum 845719[    0.000000] CPU features:=20
> detected: GIC system register CPU interface[    0.000000] Built 1=20
> zonelists, mobility grouping on.  Total pages: 248976[    0.000000] Polic=
y=20
> zone: DMA32[    0.000000] Kernel command line: clk_ignore_unused=20
> console=3Dttymxc0,115200 earlycon=3Dec_imx6q,0x30860000,115200=20
> root=3D/dev/mmcblk2p2 rootwait rw[    0.000000] Dentry cache hash table=
=20
> entries: 131072 (order: 8, 1048576 bytes, linear)[    0.000000] Inode-cac=
he=20
> hash table entries: 65536 (order: 7, 524288 bytes, linear)[    0.000000]=
=20
> mem auto-init: stack:off, heap alloc:off, heap free:off[    0.000000]=20
> Memory: 632620K/1011712K available (17212K kernel code, 2074K rwdata, 706=
8K=20
> rodata, 3712K init, 1034K bss, 51412K reserved, 327680K cma-reserved)[  =
=20
>  0.000000] SLUB: HWalign=3D64, Order=3D0-3, MinObjects=3D0, CPUs=3D2, Nod=
es=3D1[  =20
>  0.000000] rcu: Preemptible hierarchical RCU implementation.[    0.000000=
]=20
> rcu:     RCU restricting CPUs from NR_CPUS=3D256 to nr_cpu_ids=3D2.[  =20
>  0.000000]  Tasks RCU enabled.[    0.000000] rcu: RCU calculated value of=
=20
> scheduler-enlistment delay is 25 jiffies.[    0.000000] rcu: Adjusting=20
> geometry for rcu_fanout_leaf=3D16, nr_cpu_ids=3D2[    0.000000] NR_IRQS: =
64,=20
> nr_irqs: 64, preallocated irqs: 0[    0.000000] GICv3: 128 SPIs=20
> implemented[    0.000000] GICv3: 0 Extended SPIs implemented[    0.000000=
]=20
> GICv3: Distributor has no Range Selector support[    0.000000] GICv3: 16=
=20
> PPIs implemented[    0.000000] GICv3: no VLPI support, no direct LPI=20
> support[    0.000000] GICv3: CPU0: found redistributor 2 region=20
> 0:0x00000000388c0000[    0.000000] ITS: No ITS available, not enabling=20
> LPIs[    0.000000] random: get_random_bytes called from=20
> start_kernel+0x318/0x49c with crng_init=3D0[    0.000000] arch_timer: cp1=
5=20
> timer(s) running at 8.33MHz (virt).[    0.000000] clocksource:=20
> arch_sys_counter: mask: 0xffffffffffffff max_cycles: 0x1ec0311ec,=20
> max_idle_ns: 440795202152 ns[    0.000004] sched_clock: 56 bits at 8MHz,=
=20
> resolution 120ns, wraps every 2199023255541ns[    0.008140] Console: colo=
ur=20
> dummy device 80x25[    0.012468] Calibrating delay loop (skipped), value=
=20
> calculated using timer frequency.. 16.66 BogoMIPS (lpj=3D33333)[    0.022=
663]=20
> pid_max: default: 32768 minimum: 301[    0.027337] LSM: Security Framewor=
k=20
> initializing[    0.031912] Smack:  Initializing.[    0.035152] Smack:  IP=
v6=20
> port labeling enabled.[    0.039717] Mount-cache hash table entries: 2048=
=20
> (order: 2, 16384 bytes, linear)[    0.047061] Mountpoint-cache hash table=
=20
> entries: 2048 (order: 2, 16384 bytes, linear)[    0.056210] ASID allocato=
r=20
> initialised with 32768 entries[    0.060340] rcu: Hierarchical SRCU=20
> implementation.[    0.065289] EFI services will not be available.[  =20
>  0.069677] smp: Bringing up secondary CPUs ...[    0.074490] Detected VIP=
T=20
> I-cache on CPU1[    0.074525] GICv3: CPU1: found redistributor 3 region=
=20
> 0:0x00000000388e0000[    0.074566] CPU1: Booted secondary processor=20
> 0x0000000003 [0x410fd034][    0.074660] smp: Brought up 1 node, 2 CPUs[  =
=20
>  0.095498] SMP: Total of 2 processors activated.[    0.100182] CPU=20
> features: detected: 32-bit EL0 Support[    0.105318] CPU features:=20
> detected: CRC32 instructions[    0.120795] CPU: All CPU(s) started at EL1=
[=20
>    0.122044] alternatives: patching kernel code[    0.127762] devtmpfs:=
=20
> initialized[    0.131440] clocksource: jiffies: mask: 0xffffffff=20
> max_cycles: 0xffffffff, max_idle_ns: 7645041785100000 ns[    0.139498]=20
> futex hash table entries: 512 (order: 3, 32768 bytes, linear)[    0.15561=
5]=20
> pinctrl core: initialized pinctrl subsystem[    0.158617] DMI not present=
=20
> or invalid.[    0.162081] NET: Registered protocol family 16[    0.173481=
]=20
> DMA: preallocated 256 KiB pool for atomic allocations[    0.176737] audit=
:=20
> initializing netlink subsys (disabled)[    0.182242] audit: type=3D2000=
=20
> audit(0.136:1): state=3Dinitialized audit_enabled=3D0 res=3D1[    0.18985=
5]=20
> cpuidle: using governor menu[    0.194092] hw-breakpoint: found 6=20
> breakpoint and 4 watchpoint registers.[    0.200888] Serial: AMBA PL011=
=20
> UART driver[    0.204654] imx mu driver is registered.[    0.208501] imx=
=20
> rpmsg driver is registered.[    0.231076] HugeTLB registered 1.00 GiB pag=
e=20
> size, pre-allocated 0 pages[    0.234931] HugeTLB registered 32.0 MiB pag=
e=20
> size, pre-allocated 0 pages[    0.241608] HugeTLB registered 2.00 MiB pag=
e=20
> size, pre-allocated 0 pages[    0.248291] HugeTLB registered 64.0 KiB pag=
e=20
> size, pre-allocated 0 pages[    0.256007] cryptd: max_cpu_qlen set to 100=
0[=20
>    0.261848] ACPI: Interpreter disabled.[    0.263391] iommu: Default=20
> domain type: Translated[    0.268086] vgaarb: loaded[    0.270905] SCSI=
=20
> subsystem initialized[    0.274698] usbcore: registered new interface=20
> driver usbfs[    0.279826] usbcore: registered new interface driver hub[ =
 =20
>  0.285127] usbcore: registered new device driver usb[    0.290446] mc:=20
> Linux media interface: v0.10[    0.294407] videodev: Linux video capture=
=20
> interface: v2.00[    0.299922] pps_core: LinuxPPS API ver. 1 registered[ =
 =20
>  0.304800] pps_core: Software ver. 5.3.6 - Copyright 2005-2007 Rodolfo=20
> Giometti <giom...@linux.it>[    0.313927] PTP clock support registered[  =
=20
>  0.317874] EDAC MC: Ver: 3.0.0[    0.321369] No BMan portals available![ =
 =20
>  0.324882] QMan: Allocated lookup table at (____ptrval____), entry count=
=20
> 65537[    0.332006] No QMan portals available![    0.335746] No USDPAA=20
> memory, no 'fsl,usdpaa-mem' in device-tree[    0.341970] FPGA manager=20
> framework[    0.345172] Advanced Linux Sound Architecture Driver=20
> Initialized.[    0.351573] NetLabel: Initializing[    0.354555] NetLabel:=
=20
>  domain hash size =3D 128[    0.358877] NetLabel:  protocols =3D UNLABELE=
D=20
> CIPSOv4 CALIPSO[    0.364577] NetLabel:  unlabeled traffic allowed by=20
> default[    0.370582] clocksource: Switched to clocksource=20
> arch_sys_counter[    1.126801] VFS: Disk quotas dquot_6.6.0[    1.127914]=
=20
> VFS: Dquot-cache hash table entries: 512 (order 0, 4096 bytes)[  =20
>  1.134921] pnp: PnP ACPI: disabled[    1.145678] thermal_sys: Registered=
=20
> thermal governor 'step_wise'[    1.145681] thermal_sys: Registered therma=
l=20
> governor 'power_allocator'[    1.149008] NET: Registered protocol family =
2[=20
>    1.159787] IP idents hash table entries: 16384 (order: 5, 131072 bytes,=
=20
> linear)[    1.167659] tcp_listen_portaddr_hash hash table entries: 512=20
> (order: 1, 8192 bytes, linear)[    1.175430] TCP established hash table=
=20
> entries: 8192 (order: 4, 65536 bytes, linear)[    1.183185] TCP bind hash=
=20
> table entries: 8192 (order: 5, 131072 bytes, linear)[    1.190453] TCP:=
=20
> Hash tables configured (established 8192 bind 8192)[    1.196747] UDP has=
h=20
> table entries: 512 (order: 2, 16384 bytes, linear)[    1.203285] UDP-Lite=
=20
> hash table entries: 512 (order: 2, 16384 bytes, linear)[    1.210414] NET=
:=20
> Registered protocol family 1[    1.215001] RPC: Registered named UNIX=20
> socket transport module.[    1.220549] RPC: Registered udp transport=20
> module.[    1.225224] RPC: Registered tcp transport module.[    1.229907]=
=20
> RPC: Registered tcp NFSv4.1 backchannel transport module.[    1.236334]=
=20
> PCI: CLS 0 bytes, default 64[    1.240854] kvm [1]: HYP mode not availabl=
e[=20
>    1.247543] Initialise system trusted keyrings[    1.249234] workingset:=
=20
> timestamp_bits=3D44 max_order=3D18 bucket_order=3D0[    1.262658] squashf=
s:=20
> version 4.0 (2009/01/31) Phillip Lougher[    1.266308] NFS: Registering t=
he=20
> id_resolver key type[    1.270690] Key type id_resolver registered[  =20
>  1.274838] Key type id_legacy registered[    1.278838] nfs4filelayout_ini=
t:=20
> NFSv4 File Layout Driver Registering...[    1.285511]=20
> nfs4flexfilelayout_init: NFSv4 Flexfile Layout Driver Registering...[  =
=20
>  1.292908] jffs2: version 2.2. (NAND) =C2=A9 2001-2006 Red Hat, Inc.[  =
=20
>  1.299464] 9p: Installing v9fs 9p2000 file system support[    1.321024] K=
ey=20
> type asymmetric registered[    1.322258] Asymmetric key parser 'x509'=20
> registered[    1.327165] Block layer SCSI generic (bsg) driver version 0.=
4=20
> loaded (major 244)[    1.334506] io scheduler mq-deadline registered[  =
=20
>  1.339020] io scheduler kyber registered[    1.344069] pci-host-generic=
=20
> bfb00000.pci: host bridge /pci@bfb00000 ranges:[    1.350073]=20
> pci-host-generic bfb00000.pci:   MEM 0x10000000..0x1000ffff -> 0x10000000=
[=20
>    1.357904] pci-host-generic bfb00000.pci: ECAM at [mem=20
> 0xbfb00000-0xbfbfffff] for [bus 00][    1.366299] pci-host-generic=20
> bfb00000.pci: PCI host bridge to bus 0000:00[    1.372967] pci_bus 0000:0=
0:=20
> root bus resource [bus 00][    1.378171] pci_bus 0000:00: root bus resour=
ce=20
> [mem 0x10000000-0x1000ffff][    1.385056] pci 0000:00:00.0: [110a:4106]=
=20
> type 00 class 0xff0000[    1.391048] pci 0000:00:00.0: reg 0x10: [mem=20
> 0x00000000-0x00000fff][    1.397518] pci 0000:00:01.0: [110a:4106] type 0=
0=20
> class 0xff0001[    1.403282] pci 0000:00:01.0: reg 0x10: [mem=20
> 0x00000000-0x00000fff][    1.409905] pci 0000:00:00.0: BAR 0: assigned [m=
em=20
> 0x10000000-0x10000fff][    1.416286] pci 0000:00:01.0: BAR 0: assigned [m=
em=20
> 0x10001000-0x10001fff][    1.423676] EINJ: ACPI disabled.[    1.427098] B=
us=20
> freq driver module loaded[    1.433950] Serial: 8250/16550 driver, 4 port=
s,=20
> IRQ sharing enabled[    1.438875] 30890000.serial: ttymxc1 at MMIO=20
> 0x30890000 (irq =3D 5, base_baud =3D 1562500) is a IMX[    1.454472] brd:=
=20
> module loaded[    1.460813] loop: module loaded[    1.504683] imx ahci=20
> driver is registered.[    1.507384] libphy: Fixed MDIO Bus: probed[  =20
>  1.510933] tun: Universal TUN/TAP device driver, 1.6[    1.515357]=20
> thunder_xcv, ver 1.0[    1.518284] thunder_bgx, ver 1.0[    1.521510]=20
> nicpf, ver 1.0[    1.524328] Freescale FM module, FMD API version 21.1.0[=
  =20
>  1.529414] Freescale FM Ports module[    1.533013] fsl_mac: fsl_mac: FSL=
=20
> FMan MAC API based driver[    1.538614] fsl_dpa: FSL DPAA Ethernet driver=
[=20
>    1.542943] fsl_advanced: FSL DPAA Advanced drivers:[    1.547856]=20
> fsl_proxy: FSL DPAA Proxy initialization driver[    1.553450] fsl_oh: FSL=
=20
> FMan Offline Parsing port driver[    1.559103] hclge is initializing[  =
=20
>  1.561998] hns3: Hisilicon Ethernet Network Driver for Hip08 Family -=20
> version[    1.569209] hns3: Copyright (c) 2017 Huawei Corporation.[  =20
>  1.574555] e1000: Intel(R) PRO/1000 Network Driver - version=20
> 7.3.21-k8-NAPI[    1.581534] e1000: Copyright (c) 1999-2006 Intel=20
> Corporation.[    1.587303] e1000e: Intel(R) PRO/1000 Network Driver -=20
> 3.2.6-k[    1.593078] e1000e: Copyright(c) 1999 - 2015 Intel Corporation.=
[=20
>    1.599025] igb: Intel(R) Gigabit Ethernet Network Driver - version=20
> 5.6.0-k[    1.605926] igb: Copyright (c) 2007-2014 Intel Corporation.[  =
=20
>  1.611521] igbvf: Intel(R) Gigabit Virtual Function Network Driver -=20
> version 2.4.0-k[    1.619298] igbvf: Copyright (c) 2009 - 2012 Intel=20
> Corporation.[    1.625275] sky2: driver version 1.30[    1.629226]=20
> ivshmem-net 0000:00:01.0: enabling device (0000 -> 0002)[    1.635261]=20
> ivshmem-net 0000:00:01.0: TX memory at 0x00000000bfe80000, size=20
> 0x000000000007f000[    1.643779] ivshmem-net 0000:00:01.0: RX memory at=
=20
> 0x00000000bfe01000, size 0x000000000007f000_ivshmem 0000:00:00.0:=20
> state_table at 0x00000000bfd00000, size 0x0000000000001000o58s ready[  =
=20
>  1.667569] uio_ivshmem 0000:00:00.0: rw_section at 0x00000000bfd01000, si=
ze=20
> 0x0000000000009000[    1.676244] uio_ivshmem 0000:00:00.0: input_sections=
=20
> at 0x00000000bfd0a000, size 0x0000000000006000[    1.685268] uio_ivshmem=
=20
> 0000:00:00.0: output_section at 0x00000000bfd0e000, size=20
> 0x0000000000002000[    1.694814] VFIO - User Level meta-driver version:=
=20
> 0.3[    1.700138] ehci_hcd: USB 2.0 'Enhanced' Host Controller (EHCI)=20
> Driver[    1.705933] ehci-pci: EHCI PCI platform driver[    1.710384]=20
> ehci-platform: EHCI generic platform driver[    1.715598] ohci_hcd: USB 1=
.1=20
> 'Open' Host Controller (OHCI) Driver[    1.721741] ohci-pci: OHCI PCI=20
> platform driver[    1.726175] ohci-platform: OHCI generic platform driver=
[=20
>    1.731493] usbcore: registered new interface driver usb-storage[  =20
>  1.737402] usbcore: registered new interface driver usbserial_generic[  =
=20
>  1.743876] usbserial: USB Serial support registered for generic[  =20
>  1.749866] usbcore: registered new interface driver cp210x[    1.755414]=
=20
> usbserial: USB Serial support registered for cp210x[    1.761327] usbcore=
:=20
> registered new interface driver usb_serial_simple[    1.767836] usbserial=
:=20
> USB Serial support registered for carelink[    1.773904] usbserial: USB=
=20
> Serial support registered for zio[    1.779547] usbserial: USB Serial=20
> support registered for funsoft[    1.785535] usbserial: USB Serial suppor=
t=20
> registered for flashloader[    1.791874] usbserial: USB Serial support=20
> registered for google[    1.797776] usbserial: USB Serial support=20
> registered for libtransistor[    1.804286] usbserial: USB Serial support=
=20
> registered for vivopay[    1.810274] usbserial: USB Serial support=20
> registered for moto_modem[    1.816526] usbserial: USB Serial support=20
> registered for motorola_tetra[    1.823127] usbserial: USB Serial support=
=20
> registered for novatel_gps[    1.829469] usbserial: USB Serial support=20
> registered for hp4x[    1.835189] usbserial: USB Serial support registere=
d=20
> for suunto[    1.841092] usbserial: USB Serial support registered for=20
> siemens_mpi[    1.848500] i2c /dev entries driver[    1.850968] usbcore:=
=20
> registered new interface driver i2c-tiny-usb[    1.857640] imx-cpufreq-dt=
:=20
> probe of imx-cpufreq-dt failed with error -2[    1.863865] sdhci: Secure=
=20
> Digital Host Controller Interface driver[    1.869815] sdhci: Copyright(c=
)=20
> Pierre Ossman[    1.874218] Synopsys Designware Multimedia Card Interface=
=20
> Driver[    1.880265] sdhci-pltfm: SDHCI platform and OF driver helper[  =
=20
>  1.885988] sdhci-esdhc-imx 30b40000.mmc: could not get pinctrl[  =20
>  1.922878] mmc2: SDHCI controller on 30b40000.mmc [30b40000.mmc] using=20
> ADMA[    1.927813] ledtrig-cpu: registered to indicate activity on CPUs[ =
 =20
>  1.934117] usbcore: registered new interface driver usbhid[    1.938650]=
=20
> usbhid: USB HID core driver[    1.943182] No fsl,qman node[    1.945348]=
=20
> Freescale USDPAA process driver[    1.949525] fsl-usdpaa: no region found=
[=20
>    1.953344] Freescale USDPAA process IRQ driver[    1.959898] usbcore:=
=20
> registered new interface driver snd-usb-audio[    1.966247] pktgen: Packe=
t=20
> Generator for packet performance testing. Version: 2.75[    1.971766]=20
> drop_monitor: Initializing network drop monitor service[    1.977889] NET=
:=20
> Registered protocol family 26[    1.982808] NET: Registered protocol fami=
ly=20
> 10[    1.987363] Segment Routing with IPv6[    1.990314] NET: Registered=
=20
> protocol family 17[    1.994752] 8021q: 802.1Q VLAN Support v1.8[  =20
>  1.998931] lib80211: common routines for IEEE802.11 drivers[    2.004686]=
=20
> 9pnet: Installing 9P2000 support[    2.008803] tsn generic netlink module=
=20
> v1 init...[    2.013535] Key type dns_resolver registered[    2.018325]=
=20
> registered taskstats version 1[    2.021787] Loading compiled-in X.509=20
> certificates[    2.028774] hctosys: unable to open rtc device (rtc0)[  =
=20
>  2.031735] clk: Not disabling unused clocks[    2.035868] ALSA device=20
> list:[    2.038808]   No soundcards found.[    2.042235] Warning: unable =
to=20
> open an initial console.[    2.047626] Waiting for root device=20
> /dev/mmcblk2p2...[    2.095262] mmc2: new DDR MMC card at address 0001[  =
=20
>  2.097737] mmcblk2: mmc2:0001 DG4016 14.7 GiB[    2.101934] mmcblk2boot0:=
=20
> mmc2:0001 DG4016 partition 1 4.00 MiB[    2.107842] mmcblk2boot1: mmc2:00=
01=20
> DG4016 partition 2 4.00 MiB[    2.113647] mmcblk2rpmb: mmc2:0001 DG4016=
=20
> partition 3 4.00 MiB, chardev (237:0)[    2.123465]  mmcblk2: p1 p2[  =20
>  2.139262] EXT4-fs (mmcblk2p2): mounted filesystem with ordered data mode=
.=20
> Opts: (null)[    2.144558] VFS: Mounted root (ext4 filesystem) on device=
=20
> 179:2.[    2.150930] devtmpfs: error mounting -2[    2.156025] Freeing=20
> unused kernel memory: 3712K[    2.158906] Run /sbin/init as init process[=
  =20
>  2.162934] Run /etc/init as init process[    2.166921] Run /bin/init as=
=20
> init process[    2.170922] Run /bin/sh as init process[    2.174728] Kern=
el=20
> panic - not syncing: No working init found.  Try passing init=3D option t=
o=20
> kernel. See Linux Documentation/admin-guide/init.rst for guidance.[  =20
>  2.188854] CPU: 1 PID: 1 Comm: swapper/0 Not tainted 5.4.147+gbbb2e2b #1[=
  =20
>  2.195620] Hardware name: Freescale i.MX8MQ EVK (DT)[    2.200655] Call=
=20
> trace:[    2.203094]  dump_backtrace+0x0/0x140[    2.206734]=20
>  show_stack+0x14/0x20[    2.210036]  dump_stack+0xb4/0x110[    2.213419]=
=20
>  panic+0x158/0x360[    2.216455]  kernel_init+0xf0/0x108[    2.219929]=20
>  ret_from_fork+0x10/0x1c[    2.223489] SMP: stopping secondary CPUs[  =20
>  2.227396] Kernel Offset: disabled[    2.230865] CPU features:=20
> 0x0002,2000200c[    2.234856] Memory Limit: none[    2.237901] ---[ end=
=20
> Kernel panic - not syncing: No working init found.  Try passing init=3D=
=20
> option to kernel. See Linux Documentation/admin-guide/init.rst for=20
> guidance. ]---*
>
>
>

--=20
You received this message because you are subscribed to the Google Groups "=
Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/=
jailhouse-dev/e3d17a73-37b0-4250-9168-e37a134a4af4n%40googlegroups.com.

------=_Part_373_1081614761.1655404676165
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Peng,<div><br></div><div>Any input from your end?</div><div><br></div><d=
iv>Thanks &amp; Regards,</div><div>Vipul Kumar<br><br></div><div class=3D"g=
mail_quote"><div dir=3D"auto" class=3D"gmail_attr">On Tuesday, May 31, 2022=
 at 1:00:42 AM UTC+5:30 vsun...@gmail.com wrote:<br/></div><blockquote clas=
s=3D"gmail_quote" style=3D"margin: 0 0 0 0.8ex; border-left: 1px solid rgb(=
204, 204, 204); padding-left: 1ex;">Hi,<div><br></div><div>I am trying to l=
oad &amp; bootup 2nd linux image in non-root cell of jailhouse.</div><div>I=
 could port jailhouse 0.12 in kernel 5.4.147 . Flashed the image in SD card=
 &amp; emmc of i.MX8. Initiated SD card image with command &quot;run jh_mmc=
boot&quot; &amp; could load jailhouse driver also. emmc has mmcblk0 &amp; s=
d card has mmcblk1, mounted mmcblk1p1 &amp; mmcblkip2 manually.</div><div>=
=C2=A0</div><div>After driver is up used below commands:</div><div><br></di=
v><div><b><i>jailhouse enable /usr/share/jailhouse/cells/imx8mq.cell</i></b=
></div><div><b><i><br></i></b></div><div><b><i>export PATH=3D$PATH:/usr/sha=
re/jailhouse/tools/</i></b><br></div><div><br></div><div><b><i>=C2=A0jailho=
use cell linux /usr/share/jailhouse/cells/imx8mq-linux-demo.cell /run/media=
/mmcblk1p1/Image -d /run/media/mmcblk1p1/imx8mq-evk-inmate.dtb -c &quot;clk=
_ignore_unused console=3Dttymxc0,115200 earlycon=3Dec_imx6q,0x30860000,1152=
00 root=3D/dev/mmcblk2p2 rootwait rw&quot;</i></b></div><div><b><i><br></i>=
</b></div><div>2nd image not booting up, below are the logs:</div><div><br>=
</div><div><b><i>root=3D/dev/mmcblk2p2 rootwait rw&quot;mxc0,115200 earlyco=
n=3Dec_imx6q,0x30860000,115200<br>[ 2102.362388] IRQ232: set affinity faile=
d(-22).<br>[ 2102.362464] CPU2: shutdown<br>[ 2102.369562] psci: CPU2 kille=
d (polled 0 ms)<br>[ 2102.422343] IRQ232: set affinity failed(-22).<br>[ 21=
02.422642] CPU3: shutdown<br>[ 2102.429741] psci: CPU3 killed (polled 0 ms)=
<br>Adding virtual PCI device 00:00.0 to cell &quot;linux-inmate-demo&quot;=
<br>Shared memory connection established, peer cells:<br>=C2=A0&quot;imx8mq=
&quot;<br>Adding virtual PCI device 00:01.0 to cell &quot;linux-inmate-demo=
&quot;<br>Shared memory connection established, peer cells:<br>=C2=A0&quot;=
imx8mq&quot;<br>Created cell &quot;linux-inmate-demo&quot;<br>Page pool usa=
ge after cell creation: mem 80/992, remap 144/131072<br>[ 2102.486660] Crea=
ted Jailhouse cell &quot;linux-inmate-demo&quot;<br>Cell &quot;linux-inmate=
-demo&quot; can be loaded<br>Started cell &quot;linux-inmate-demo&quot;<br>=
[ =C2=A0 =C2=A00.000000] Booting Linux on physical CPU 0x0000000002 [0x410f=
d034]<br>[ =C2=A0 =C2=A00.000000] Linux version 5.4.147+gbbb2e2b (oe-user@o=
e-host) (gcc version 9.3.0 (GCC)) #1 SMP PREEMPT Wed Dec 1 22:21:40 UTC 202=
1<br>[ =C2=A0 =C2=A00.000000] Machine model: Freescale i.MX8MQ EVK<br>[ =C2=
=A0 =C2=A00.000000] earlycon: ec_imx6q0 at MMIO 0x0000000030860000 (options=
 &#39;115200&#39;)<br>[ =C2=A0 =C2=A00.000000] printk: bootconsole [ec_imx6=
q0] enabled<br>[ =C2=A0 =C2=A00.000000] efi: Getting EFI parameters from FD=
T:<br>[ =C2=A0 =C2=A00.000000] efi: UEFI not found.<br>[ =C2=A0 =C2=A00.000=
000] cma: Reserved 320 MiB at 0x00000000e8000000<br>imx8mqevk:/dev# [ =C2=
=A0 =C2=A00.000000] NUMA: No NUMA configuration found<br>[ =C2=A0 =C2=A00.0=
00000] NUMA: Faking a node at [mem 0x00000000c0000000-0x00000000fdbfffff]<b=
r>[ =C2=A0 =C2=A00.000000] NUMA: NODE_DATA [mem 0xfda0e500-0xfda0ffff]<br>[=
 =C2=A0 =C2=A00.000000] Zone ranges:<br>[ =C2=A0 =C2=A00.000000] =C2=A0 DMA=
32 =C2=A0 =C2=A0[mem 0x00000000c0000000-0x00000000fdbfffff]<br>[ =C2=A0 =C2=
=A00.000000] =C2=A0 Normal =C2=A0 empty<br>[ =C2=A0 =C2=A00.000000] Movable=
 zone start for each node<br>[ =C2=A0 =C2=A00.000000] Early memory node ran=
ges<br>[ =C2=A0 =C2=A00.000000] =C2=A0 node =C2=A0 0: [mem 0x00000000c00000=
00-0x00000000fdbfffff]<br>[ =C2=A0 =C2=A00.000000] Initmem setup node 0 [me=
m 0x00000000c0000000-0x00000000fdbfffff]<br>[ =C2=A0 =C2=A00.000000] psci: =
probing for conduit method from DT.<br>[ =C2=A0 =C2=A00.000000] psci: PSCIv=
1.1 detected in firmware.<br>[ =C2=A0 =C2=A00.000000] psci: Using standard =
PSCI v0.2 function IDs<br>[ =C2=A0 =C2=A00.000000] psci: MIGRATE_INFO_TYPE =
not supported.<br>[ =C2=A0 =C2=A00.000000] psci: SMC Calling Convention v1.=
1<br>[ =C2=A0 =C2=A00.000000] percpu: Embedded 33 pages/cpu s98072 r8192 d2=
8904 u135168<br>[ =C2=A0 =C2=A00.000000] Detected VIPT I-cache on CPU0<br>[=
 =C2=A0 =C2=A00.000000] CPU features: detected: ARM erratum 845719<br>[ =C2=
=A0 =C2=A00.000000] CPU features: detected: GIC system register CPU interfa=
ce<br>[ =C2=A0 =C2=A00.000000] Built 1 zonelists, mobility grouping on.=C2=
=A0 Total pages: 248976<br>[ =C2=A0 =C2=A00.000000] Policy zone: DMA32<br>[=
 =C2=A0 =C2=A00.000000] Kernel command line: clk_ignore_unused console=3Dtt=
ymxc0,115200 earlycon=3Dec_imx6q,0x30860000,115200 root=3D/dev/mmcblk2p2 ro=
otwait rw<br>[ =C2=A0 =C2=A00.000000] Dentry cache hash table entries: 1310=
72 (order: 8, 1048576 bytes, linear)<br>[ =C2=A0 =C2=A00.000000] Inode-cach=
e hash table entries: 65536 (order: 7, 524288 bytes, linear)<br>[ =C2=A0 =
=C2=A00.000000] mem auto-init: stack:off, heap alloc:off, heap free:off<br>=
[ =C2=A0 =C2=A00.000000] Memory: 632620K/1011712K available (17212K kernel =
code, 2074K rwdata, 7068K rodata, 3712K init, 1034K bss, 51412K reserved, 3=
27680K cma-reserved)<br>[ =C2=A0 =C2=A00.000000] SLUB: HWalign=3D64, Order=
=3D0-3, MinObjects=3D0, CPUs=3D2, Nodes=3D1<br>[ =C2=A0 =C2=A00.000000] rcu=
: Preemptible hierarchical RCU implementation.<br>[ =C2=A0 =C2=A00.000000] =
rcu: =C2=A0 =C2=A0 RCU restricting CPUs from NR_CPUS=3D256 to nr_cpu_ids=3D=
2.<br>[ =C2=A0 =C2=A00.000000] =C2=A0Tasks RCU enabled.<br>[ =C2=A0 =C2=A00=
.000000] rcu: RCU calculated value of scheduler-enlistment delay is 25 jiff=
ies.<br>[ =C2=A0 =C2=A00.000000] rcu: Adjusting geometry for rcu_fanout_lea=
f=3D16, nr_cpu_ids=3D2<br>[ =C2=A0 =C2=A00.000000] NR_IRQS: 64, nr_irqs: 64=
, preallocated irqs: 0<br>[ =C2=A0 =C2=A00.000000] GICv3: 128 SPIs implemen=
ted<br>[ =C2=A0 =C2=A00.000000] GICv3: 0 Extended SPIs implemented<br>[ =C2=
=A0 =C2=A00.000000] GICv3: Distributor has no Range Selector support<br>[ =
=C2=A0 =C2=A00.000000] GICv3: 16 PPIs implemented<br>[ =C2=A0 =C2=A00.00000=
0] GICv3: no VLPI support, no direct LPI support<br>[ =C2=A0 =C2=A00.000000=
] GICv3: CPU0: found redistributor 2 region 0:0x00000000388c0000<br>[ =C2=
=A0 =C2=A00.000000] ITS: No ITS available, not enabling LPIs<br>[ =C2=A0 =
=C2=A00.000000] random: get_random_bytes called from start_kernel+0x318/0x4=
9c with crng_init=3D0<br>[ =C2=A0 =C2=A00.000000] arch_timer: cp15 timer(s)=
 running at 8.33MHz (virt).<br>[ =C2=A0 =C2=A00.000000] clocksource: arch_s=
ys_counter: mask: 0xffffffffffffff max_cycles: 0x1ec0311ec, max_idle_ns: 44=
0795202152 ns<br>[ =C2=A0 =C2=A00.000004] sched_clock: 56 bits at 8MHz, res=
olution 120ns, wraps every 2199023255541ns<br>[ =C2=A0 =C2=A00.008140] Cons=
ole: colour dummy device 80x25<br>[ =C2=A0 =C2=A00.012468] Calibrating dela=
y loop (skipped), value calculated using timer frequency.. 16.66 BogoMIPS (=
lpj=3D33333)<br>[ =C2=A0 =C2=A00.022663] pid_max: default: 32768 minimum: 3=
01<br>[ =C2=A0 =C2=A00.027337] LSM: Security Framework initializing<br>[ =
=C2=A0 =C2=A00.031912] Smack: =C2=A0Initializing.<br>[ =C2=A0 =C2=A00.03515=
2] Smack: =C2=A0IPv6 port labeling enabled.<br>[ =C2=A0 =C2=A00.039717] Mou=
nt-cache hash table entries: 2048 (order: 2, 16384 bytes, linear)<br>[ =C2=
=A0 =C2=A00.047061] Mountpoint-cache hash table entries: 2048 (order: 2, 16=
384 bytes, linear)<br>[ =C2=A0 =C2=A00.056210] ASID allocator initialised w=
ith 32768 entries<br>[ =C2=A0 =C2=A00.060340] rcu: Hierarchical SRCU implem=
entation.<br>[ =C2=A0 =C2=A00.065289] EFI services will not be available.<b=
r>[ =C2=A0 =C2=A00.069677] smp: Bringing up secondary CPUs ...<br>[ =C2=A0 =
=C2=A00.074490] Detected VIPT I-cache on CPU1<br>[ =C2=A0 =C2=A00.074525] G=
ICv3: CPU1: found redistributor 3 region 0:0x00000000388e0000<br>[ =C2=A0 =
=C2=A00.074566] CPU1: Booted secondary processor 0x0000000003 [0x410fd034]<=
br>[ =C2=A0 =C2=A00.074660] smp: Brought up 1 node, 2 CPUs<br>[ =C2=A0 =C2=
=A00.095498] SMP: Total of 2 processors activated.<br>[ =C2=A0 =C2=A00.1001=
82] CPU features: detected: 32-bit EL0 Support<br>[ =C2=A0 =C2=A00.105318] =
CPU features: detected: CRC32 instructions<br>[ =C2=A0 =C2=A00.120795] CPU:=
 All CPU(s) started at EL1<br>[ =C2=A0 =C2=A00.122044] alternatives: patchi=
ng kernel code<br>[ =C2=A0 =C2=A00.127762] devtmpfs: initialized<br>[ =C2=
=A0 =C2=A00.131440] clocksource: jiffies: mask: 0xffffffff max_cycles: 0xff=
ffffff, max_idle_ns: 7645041785100000 ns<br>[ =C2=A0 =C2=A00.139498] futex =
hash table entries: 512 (order: 3, 32768 bytes, linear)<br>[ =C2=A0 =C2=A00=
.155615] pinctrl core: initialized pinctrl subsystem<br>[ =C2=A0 =C2=A00.15=
8617] DMI not present or invalid.<br>[ =C2=A0 =C2=A00.162081] NET: Register=
ed protocol family 16<br>[ =C2=A0 =C2=A00.173481] DMA: preallocated 256 KiB=
 pool for atomic allocations<br>[ =C2=A0 =C2=A00.176737] audit: initializin=
g netlink subsys (disabled)<br>[ =C2=A0 =C2=A00.182242] audit: type=3D2000 =
audit(0.136:1): state=3Dinitialized audit_enabled=3D0 res=3D1<br>[ =C2=A0 =
=C2=A00.189855] cpuidle: using governor menu<br>[ =C2=A0 =C2=A00.194092] hw=
-breakpoint: found 6 breakpoint and 4 watchpoint registers.<br>[ =C2=A0 =C2=
=A00.200888] Serial: AMBA PL011 UART driver<br>[ =C2=A0 =C2=A00.204654] imx=
 mu driver is registered.<br>[ =C2=A0 =C2=A00.208501] imx rpmsg driver is r=
egistered.<br>[ =C2=A0 =C2=A00.231076] HugeTLB registered 1.00 GiB page siz=
e, pre-allocated 0 pages<br>[ =C2=A0 =C2=A00.234931] HugeTLB registered 32.=
0 MiB page size, pre-allocated 0 pages<br>[ =C2=A0 =C2=A00.241608] HugeTLB =
registered 2.00 MiB page size, pre-allocated 0 pages<br>[ =C2=A0 =C2=A00.24=
8291] HugeTLB registered 64.0 KiB page size, pre-allocated 0 pages<br>[ =C2=
=A0 =C2=A00.256007] cryptd: max_cpu_qlen set to 1000<br>[ =C2=A0 =C2=A00.26=
1848] ACPI: Interpreter disabled.<br>[ =C2=A0 =C2=A00.263391] iommu: Defaul=
t domain type: Translated<br>[ =C2=A0 =C2=A00.268086] vgaarb: loaded<br>[ =
=C2=A0 =C2=A00.270905] SCSI subsystem initialized<br>[ =C2=A0 =C2=A00.27469=
8] usbcore: registered new interface driver usbfs<br>[ =C2=A0 =C2=A00.27982=
6] usbcore: registered new interface driver hub<br>[ =C2=A0 =C2=A00.285127]=
 usbcore: registered new device driver usb<br>[ =C2=A0 =C2=A00.290446] mc: =
Linux media interface: v0.10<br>[ =C2=A0 =C2=A00.294407] videodev: Linux vi=
deo capture interface: v2.00<br>[ =C2=A0 =C2=A00.299922] pps_core: LinuxPPS=
 API ver. 1 registered<br>[ =C2=A0 =C2=A00.304800] pps_core: Software ver. =
5.3.6 - Copyright 2005-2007 Rodolfo Giometti &lt;<a href data-email-masked =
rel=3D"nofollow">giom...@linux.it</a>&gt;<br>[ =C2=A0 =C2=A00.313927] PTP c=
lock support registered<br>[ =C2=A0 =C2=A00.317874] EDAC MC: Ver: 3.0.0<br>=
[ =C2=A0 =C2=A00.321369] No BMan portals available!<br>[ =C2=A0 =C2=A00.324=
882] QMan: Allocated lookup table at (____ptrval____), entry count 65537<br=
>[ =C2=A0 =C2=A00.332006] No QMan portals available!<br>[ =C2=A0 =C2=A00.33=
5746] No USDPAA memory, no &#39;fsl,usdpaa-mem&#39; in device-tree<br>[ =C2=
=A0 =C2=A00.341970] FPGA manager framework<br>[ =C2=A0 =C2=A00.345172] Adva=
nced Linux Sound Architecture Driver Initialized.<br>[ =C2=A0 =C2=A00.35157=
3] NetLabel: Initializing<br>[ =C2=A0 =C2=A00.354555] NetLabel: =C2=A0domai=
n hash size =3D 128<br>[ =C2=A0 =C2=A00.358877] NetLabel: =C2=A0protocols =
=3D UNLABELED CIPSOv4 CALIPSO<br>[ =C2=A0 =C2=A00.364577] NetLabel: =C2=A0u=
nlabeled traffic allowed by default<br>[ =C2=A0 =C2=A00.370582] clocksource=
: Switched to clocksource arch_sys_counter<br>[ =C2=A0 =C2=A01.126801] VFS:=
 Disk quotas dquot_6.6.0<br>[ =C2=A0 =C2=A01.127914] VFS: Dquot-cache hash =
table entries: 512 (order 0, 4096 bytes)<br>[ =C2=A0 =C2=A01.134921] pnp: P=
nP ACPI: disabled<br>[ =C2=A0 =C2=A01.145678] thermal_sys: Registered therm=
al governor &#39;step_wise&#39;<br>[ =C2=A0 =C2=A01.145681] thermal_sys: Re=
gistered thermal governor &#39;power_allocator&#39;<br>[ =C2=A0 =C2=A01.149=
008] NET: Registered protocol family 2<br>[ =C2=A0 =C2=A01.159787] IP ident=
s hash table entries: 16384 (order: 5, 131072 bytes, linear)<br>[ =C2=A0 =
=C2=A01.167659] tcp_listen_portaddr_hash hash table entries: 512 (order: 1,=
 8192 bytes, linear)<br>[ =C2=A0 =C2=A01.175430] TCP established hash table=
 entries: 8192 (order: 4, 65536 bytes, linear)<br>[ =C2=A0 =C2=A01.183185] =
TCP bind hash table entries: 8192 (order: 5, 131072 bytes, linear)<br>[ =C2=
=A0 =C2=A01.190453] TCP: Hash tables configured (established 8192 bind 8192=
)<br>[ =C2=A0 =C2=A01.196747] UDP hash table entries: 512 (order: 2, 16384 =
bytes, linear)<br>[ =C2=A0 =C2=A01.203285] UDP-Lite hash table entries: 512=
 (order: 2, 16384 bytes, linear)<br>[ =C2=A0 =C2=A01.210414] NET: Registere=
d protocol family 1<br>[ =C2=A0 =C2=A01.215001] RPC: Registered named UNIX =
socket transport module.<br>[ =C2=A0 =C2=A01.220549] RPC: Registered udp tr=
ansport module.<br>[ =C2=A0 =C2=A01.225224] RPC: Registered tcp transport m=
odule.<br>[ =C2=A0 =C2=A01.229907] RPC: Registered tcp NFSv4.1 backchannel =
transport module.<br>[ =C2=A0 =C2=A01.236334] PCI: CLS 0 bytes, default 64<=
br>[ =C2=A0 =C2=A01.240854] kvm [1]: HYP mode not available<br>[ =C2=A0 =C2=
=A01.247543] Initialise system trusted keyrings<br>[ =C2=A0 =C2=A01.249234]=
 workingset: timestamp_bits=3D44 max_order=3D18 bucket_order=3D0<br>[ =C2=
=A0 =C2=A01.262658] squashfs: version 4.0 (2009/01/31) Phillip Lougher<br>[=
 =C2=A0 =C2=A01.266308] NFS: Registering the id_resolver key type<br>[ =C2=
=A0 =C2=A01.270690] Key type id_resolver registered<br>[ =C2=A0 =C2=A01.274=
838] Key type id_legacy registered<br>[ =C2=A0 =C2=A01.278838] nfs4filelayo=
ut_init: NFSv4 File Layout Driver Registering...<br>[ =C2=A0 =C2=A01.285511=
] nfs4flexfilelayout_init: NFSv4 Flexfile Layout Driver Registering...<br>[=
 =C2=A0 =C2=A01.292908] jffs2: version 2.2. (NAND) =C2=A9 2001-2006 Red Hat=
, Inc.<br>[ =C2=A0 =C2=A01.299464] 9p: Installing v9fs 9p2000 file system s=
upport<br>[ =C2=A0 =C2=A01.321024] Key type asymmetric registered<br>[ =C2=
=A0 =C2=A01.322258] Asymmetric key parser &#39;x509&#39; registered<br>[ =
=C2=A0 =C2=A01.327165] Block layer SCSI generic (bsg) driver version 0.4 lo=
aded (major 244)<br>[ =C2=A0 =C2=A01.334506] io scheduler mq-deadline regis=
tered<br>[ =C2=A0 =C2=A01.339020] io scheduler kyber registered<br>[ =C2=A0=
 =C2=A01.344069] pci-host-generic bfb00000.pci: host bridge /pci@bfb00000 r=
anges:<br>[ =C2=A0 =C2=A01.350073] pci-host-generic bfb00000.pci: =C2=A0 ME=
M 0x10000000..0x1000ffff -&gt; 0x10000000<br>[ =C2=A0 =C2=A01.357904] pci-h=
ost-generic bfb00000.pci: ECAM at [mem 0xbfb00000-0xbfbfffff] for [bus 00]<=
br>[ =C2=A0 =C2=A01.366299] pci-host-generic bfb00000.pci: PCI host bridge =
to bus 0000:00<br>[ =C2=A0 =C2=A01.372967] pci_bus 0000:00: root bus resour=
ce [bus 00]<br>[ =C2=A0 =C2=A01.378171] pci_bus 0000:00: root bus resource =
[mem 0x10000000-0x1000ffff]<br>[ =C2=A0 =C2=A01.385056] pci 0000:00:00.0: [=
110a:4106] type 00 class 0xff0000<br>[ =C2=A0 =C2=A01.391048] pci 0000:00:0=
0.0: reg 0x10: [mem 0x00000000-0x00000fff]<br>[ =C2=A0 =C2=A01.397518] pci =
0000:00:01.0: [110a:4106] type 00 class 0xff0001<br>[ =C2=A0 =C2=A01.403282=
] pci 0000:00:01.0: reg 0x10: [mem 0x00000000-0x00000fff]<br>[ =C2=A0 =C2=
=A01.409905] pci 0000:00:00.0: BAR 0: assigned [mem 0x10000000-0x10000fff]<=
br>[ =C2=A0 =C2=A01.416286] pci 0000:00:01.0: BAR 0: assigned [mem 0x100010=
00-0x10001fff]<br>[ =C2=A0 =C2=A01.423676] EINJ: ACPI disabled.<br>[ =C2=A0=
 =C2=A01.427098] Bus freq driver module loaded<br>[ =C2=A0 =C2=A01.433950] =
Serial: 8250/16550 driver, 4 ports, IRQ sharing enabled<br>[ =C2=A0 =C2=A01=
.438875] 30890000.serial: ttymxc1 at MMIO 0x30890000 (irq =3D 5, base_baud =
=3D 1562500) is a IMX<br>[ =C2=A0 =C2=A01.454472] brd: module loaded<br>[ =
=C2=A0 =C2=A01.460813] loop: module loaded<br>[ =C2=A0 =C2=A01.504683] imx =
ahci driver is registered.<br>[ =C2=A0 =C2=A01.507384] libphy: Fixed MDIO B=
us: probed<br>[ =C2=A0 =C2=A01.510933] tun: Universal TUN/TAP device driver=
, 1.6<br>[ =C2=A0 =C2=A01.515357] thunder_xcv, ver 1.0<br>[ =C2=A0 =C2=A01.=
518284] thunder_bgx, ver 1.0<br>[ =C2=A0 =C2=A01.521510] nicpf, ver 1.0<br>=
[ =C2=A0 =C2=A01.524328] Freescale FM module, FMD API version 21.1.0<br>[ =
=C2=A0 =C2=A01.529414] Freescale FM Ports module<br>[ =C2=A0 =C2=A01.533013=
] fsl_mac: fsl_mac: FSL FMan MAC API based driver<br>[ =C2=A0 =C2=A01.53861=
4] fsl_dpa: FSL DPAA Ethernet driver<br>[ =C2=A0 =C2=A01.542943] fsl_advanc=
ed: FSL DPAA Advanced drivers:<br>[ =C2=A0 =C2=A01.547856] fsl_proxy: FSL D=
PAA Proxy initialization driver<br>[ =C2=A0 =C2=A01.553450] fsl_oh: FSL FMa=
n Offline Parsing port driver<br>[ =C2=A0 =C2=A01.559103] hclge is initiali=
zing<br>[ =C2=A0 =C2=A01.561998] hns3: Hisilicon Ethernet Network Driver fo=
r Hip08 Family - version<br>[ =C2=A0 =C2=A01.569209] hns3: Copyright (c) 20=
17 Huawei Corporation.<br>[ =C2=A0 =C2=A01.574555] e1000: Intel(R) PRO/1000=
 Network Driver - version 7.3.21-k8-NAPI<br>[ =C2=A0 =C2=A01.581534] e1000:=
 Copyright (c) 1999-2006 Intel Corporation.<br>[ =C2=A0 =C2=A01.587303] e10=
00e: Intel(R) PRO/1000 Network Driver - 3.2.6-k<br>[ =C2=A0 =C2=A01.593078]=
 e1000e: Copyright(c) 1999 - 2015 Intel Corporation.<br>[ =C2=A0 =C2=A01.59=
9025] igb: Intel(R) Gigabit Ethernet Network Driver - version 5.6.0-k<br>[ =
=C2=A0 =C2=A01.605926] igb: Copyright (c) 2007-2014 Intel Corporation.<br>[=
 =C2=A0 =C2=A01.611521] igbvf: Intel(R) Gigabit Virtual Function Network Dr=
iver - version 2.4.0-k<br>[ =C2=A0 =C2=A01.619298] igbvf: Copyright (c) 200=
9 - 2012 Intel Corporation.<br>[ =C2=A0 =C2=A01.625275] sky2: driver versio=
n 1.30<br>[ =C2=A0 =C2=A01.629226] ivshmem-net 0000:00:01.0: enabling devic=
e (0000 -&gt; 0002)<br>[ =C2=A0 =C2=A01.635261] ivshmem-net 0000:00:01.0: T=
X memory at 0x00000000bfe80000, size 0x000000000007f000<br>[ =C2=A0 =C2=A01=
.643779] ivshmem-net 0000:00:01.0: RX memory at 0x00000000bfe01000, size 0x=
000000000007f000<br>_ivshmem 0000:00:00.0: state_table at 0x00000000bfd0000=
0, size 0x0000000000001000o58s ready<br>[ =C2=A0 =C2=A01.667569] uio_ivshme=
m 0000:00:00.0: rw_section at 0x00000000bfd01000, size 0x0000000000009000<b=
r>[ =C2=A0 =C2=A01.676244] uio_ivshmem 0000:00:00.0: input_sections at 0x00=
000000bfd0a000, size 0x0000000000006000<br>[ =C2=A0 =C2=A01.685268] uio_ivs=
hmem 0000:00:00.0: output_section at 0x00000000bfd0e000, size 0x00000000000=
02000<br>[ =C2=A0 =C2=A01.694814] VFIO - User Level meta-driver version: 0.=
3<br>[ =C2=A0 =C2=A01.700138] ehci_hcd: USB 2.0 &#39;Enhanced&#39; Host Con=
troller (EHCI) Driver<br>[ =C2=A0 =C2=A01.705933] ehci-pci: EHCI PCI platfo=
rm driver<br>[ =C2=A0 =C2=A01.710384] ehci-platform: EHCI generic platform =
driver<br>[ =C2=A0 =C2=A01.715598] ohci_hcd: USB 1.1 &#39;Open&#39; Host Co=
ntroller (OHCI) Driver<br>[ =C2=A0 =C2=A01.721741] ohci-pci: OHCI PCI platf=
orm driver<br>[ =C2=A0 =C2=A01.726175] ohci-platform: OHCI generic platform=
 driver<br>[ =C2=A0 =C2=A01.731493] usbcore: registered new interface drive=
r usb-storage<br>[ =C2=A0 =C2=A01.737402] usbcore: registered new interface=
 driver usbserial_generic<br>[ =C2=A0 =C2=A01.743876] usbserial: USB Serial=
 support registered for generic<br>[ =C2=A0 =C2=A01.749866] usbcore: regist=
ered new interface driver cp210x<br>[ =C2=A0 =C2=A01.755414] usbserial: USB=
 Serial support registered for cp210x<br>[ =C2=A0 =C2=A01.761327] usbcore: =
registered new interface driver usb_serial_simple<br>[ =C2=A0 =C2=A01.76783=
6] usbserial: USB Serial support registered for carelink<br>[ =C2=A0 =C2=A0=
1.773904] usbserial: USB Serial support registered for zio<br>[ =C2=A0 =C2=
=A01.779547] usbserial: USB Serial support registered for funsoft<br>[ =C2=
=A0 =C2=A01.785535] usbserial: USB Serial support registered for flashloade=
r<br>[ =C2=A0 =C2=A01.791874] usbserial: USB Serial support registered for =
google<br>[ =C2=A0 =C2=A01.797776] usbserial: USB Serial support registered=
 for libtransistor<br>[ =C2=A0 =C2=A01.804286] usbserial: USB Serial suppor=
t registered for vivopay<br>[ =C2=A0 =C2=A01.810274] usbserial: USB Serial =
support registered for moto_modem<br>[ =C2=A0 =C2=A01.816526] usbserial: US=
B Serial support registered for motorola_tetra<br>[ =C2=A0 =C2=A01.823127] =
usbserial: USB Serial support registered for novatel_gps<br>[ =C2=A0 =C2=A0=
1.829469] usbserial: USB Serial support registered for hp4x<br>[ =C2=A0 =C2=
=A01.835189] usbserial: USB Serial support registered for suunto<br>[ =C2=
=A0 =C2=A01.841092] usbserial: USB Serial support registered for siemens_mp=
i<br>[ =C2=A0 =C2=A01.848500] i2c /dev entries driver<br>[ =C2=A0 =C2=A01.8=
50968] usbcore: registered new interface driver i2c-tiny-usb<br>[ =C2=A0 =
=C2=A01.857640] imx-cpufreq-dt: probe of imx-cpufreq-dt failed with error -=
2<br>[ =C2=A0 =C2=A01.863865] sdhci: Secure Digital Host Controller Interfa=
ce driver<br>[ =C2=A0 =C2=A01.869815] sdhci: Copyright(c) Pierre Ossman<br>=
[ =C2=A0 =C2=A01.874218] Synopsys Designware Multimedia Card Interface Driv=
er<br>[ =C2=A0 =C2=A01.880265] sdhci-pltfm: SDHCI platform and OF driver he=
lper<br>[ =C2=A0 =C2=A01.885988] sdhci-esdhc-imx 30b40000.mmc: could not ge=
t pinctrl<br>[ =C2=A0 =C2=A01.922878] mmc2: SDHCI controller on 30b40000.mm=
c [30b40000.mmc] using ADMA<br>[ =C2=A0 =C2=A01.927813] ledtrig-cpu: regist=
ered to indicate activity on CPUs<br>[ =C2=A0 =C2=A01.934117] usbcore: regi=
stered new interface driver usbhid<br>[ =C2=A0 =C2=A01.938650] usbhid: USB =
HID core driver<br>[ =C2=A0 =C2=A01.943182] No fsl,qman node<br>[ =C2=A0 =
=C2=A01.945348] Freescale USDPAA process driver<br>[ =C2=A0 =C2=A01.949525]=
 fsl-usdpaa: no region found<br>[ =C2=A0 =C2=A01.953344] Freescale USDPAA p=
rocess IRQ driver<br>[ =C2=A0 =C2=A01.959898] usbcore: registered new inter=
face driver snd-usb-audio<br>[ =C2=A0 =C2=A01.966247] pktgen: Packet Genera=
tor for packet performance testing. Version: 2.75<br>[ =C2=A0 =C2=A01.97176=
6] drop_monitor: Initializing network drop monitor service<br>[ =C2=A0 =C2=
=A01.977889] NET: Registered protocol family 26<br>[ =C2=A0 =C2=A01.982808]=
 NET: Registered protocol family 10<br>[ =C2=A0 =C2=A01.987363] Segment Rou=
ting with IPv6<br>[ =C2=A0 =C2=A01.990314] NET: Registered protocol family =
17<br>[ =C2=A0 =C2=A01.994752] 8021q: 802.1Q VLAN Support v1.8<br>[ =C2=A0 =
=C2=A01.998931] lib80211: common routines for IEEE802.11 drivers<br>[ =C2=
=A0 =C2=A02.004686] 9pnet: Installing 9P2000 support<br>[ =C2=A0 =C2=A02.00=
8803] tsn generic netlink module v1 init...<br>[ =C2=A0 =C2=A02.013535] Key=
 type dns_resolver registered<br>[ =C2=A0 =C2=A02.018325] registered taskst=
ats version 1<br>[ =C2=A0 =C2=A02.021787] Loading compiled-in X.509 certifi=
cates<br>[ =C2=A0 =C2=A02.028774] hctosys: unable to open rtc device (rtc0)=
<br>[ =C2=A0 =C2=A02.031735] clk: Not disabling unused clocks<br>[ =C2=A0 =
=C2=A02.035868] ALSA device list:<br>[ =C2=A0 =C2=A02.038808] =C2=A0 No sou=
ndcards found.<br>[ =C2=A0 =C2=A02.042235] Warning: unable to open an initi=
al console.<br>[ =C2=A0 =C2=A02.047626] Waiting for root device /dev/mmcblk=
2p2...<br>[ =C2=A0 =C2=A02.095262] mmc2: new DDR MMC card at address 0001<b=
r>[ =C2=A0 =C2=A02.097737] mmcblk2: mmc2:0001 DG4016 14.7 GiB<br>[ =C2=A0 =
=C2=A02.101934] mmcblk2boot0: mmc2:0001 DG4016 partition 1 4.00 MiB<br>[ =
=C2=A0 =C2=A02.107842] mmcblk2boot1: mmc2:0001 DG4016 partition 2 4.00 MiB<=
br>[ =C2=A0 =C2=A02.113647] mmcblk2rpmb: mmc2:0001 DG4016 partition 3 4.00 =
MiB, chardev (237:0)<br>[ =C2=A0 =C2=A02.123465] =C2=A0mmcblk2: p1 p2<br>[ =
=C2=A0 =C2=A02.139262] EXT4-fs (mmcblk2p2): mounted filesystem with ordered=
 data mode. Opts: (null)<br>[ =C2=A0 =C2=A02.144558] VFS: Mounted root (ext=
4 filesystem) on device 179:2.<br>[ =C2=A0 =C2=A02.150930] devtmpfs: error =
mounting -2<br>[ =C2=A0 =C2=A02.156025] Freeing unused kernel memory: 3712K=
<br>[ =C2=A0 =C2=A02.158906] Run /sbin/init as init process<br>[ =C2=A0 =C2=
=A02.162934] Run /etc/init as init process<br>[ =C2=A0 =C2=A02.166921] Run =
/bin/init as init process<br>[ =C2=A0 =C2=A02.170922] Run /bin/sh as init p=
rocess<br>[ =C2=A0 =C2=A02.174728] Kernel panic - not syncing: No working i=
nit found.=C2=A0 Try passing init=3D option to kernel. See Linux Documentat=
ion/admin-guide/init.rst for guidance.<br>[ =C2=A0 =C2=A02.188854] CPU: 1 P=
ID: 1 Comm: swapper/0 Not tainted 5.4.147+gbbb2e2b #1<br>[ =C2=A0 =C2=A02.1=
95620] Hardware name: Freescale i.MX8MQ EVK (DT)<br>[ =C2=A0 =C2=A02.200655=
] Call trace:<br>[ =C2=A0 =C2=A02.203094] =C2=A0dump_backtrace+0x0/0x140<br=
>[ =C2=A0 =C2=A02.206734] =C2=A0show_stack+0x14/0x20<br>[ =C2=A0 =C2=A02.21=
0036] =C2=A0dump_stack+0xb4/0x110<br>[ =C2=A0 =C2=A02.213419] =C2=A0panic+0=
x158/0x360<br>[ =C2=A0 =C2=A02.216455] =C2=A0kernel_init+0xf0/0x108<br>[ =
=C2=A0 =C2=A02.219929] =C2=A0ret_from_fork+0x10/0x1c<br>[ =C2=A0 =C2=A02.22=
3489] SMP: stopping secondary CPUs<br>[ =C2=A0 =C2=A02.227396] Kernel Offse=
t: disabled<br>[ =C2=A0 =C2=A02.230865] CPU features: 0x0002,2000200c<br>[ =
=C2=A0 =C2=A02.234856] Memory Limit: none<br>[ =C2=A0 =C2=A02.237901] ---[ =
end Kernel panic - not syncing: No working init found.=C2=A0 Try passing in=
it=3D option to kernel. See Linux Documentation/admin-guide/init.rst for gu=
idance. ]---</i></b><div></div><div><br></div></div><div><br></div></blockq=
uote></div>

<p></p>

-- <br />
You received this message because you are subscribed to the Google Groups &=
quot;Jailhouse&quot; group.<br />
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to <a href=3D"mailto:jailhouse-dev+unsubscribe@googlegroups.com">jailh=
ouse-dev+unsubscribe@googlegroups.com</a>.<br />
To view this discussion on the web visit <a href=3D"https://groups.google.c=
om/d/msgid/jailhouse-dev/e3d17a73-37b0-4250-9168-e37a134a4af4n%40googlegrou=
ps.com?utm_medium=3Demail&utm_source=3Dfooter">https://groups.google.com/d/=
msgid/jailhouse-dev/e3d17a73-37b0-4250-9168-e37a134a4af4n%40googlegroups.co=
m</a>.<br />

------=_Part_373_1081614761.1655404676165--

------=_Part_372_1277284333.1655404676165--
