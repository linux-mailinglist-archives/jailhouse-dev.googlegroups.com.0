Return-Path: <jailhouse-dev+bncBDVP3IWNW4CBBY5W2SKAMGQETQCR2YQ@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-qv1-xf38.google.com (mail-qv1-xf38.google.com [IPv6:2607:f8b0:4864:20::f38])
	by mail.lfdr.de (Postfix) with ESMTPS id 55CA85387C1
	for <lists+jailhouse-dev@lfdr.de>; Mon, 30 May 2022 21:30:45 +0200 (CEST)
Received: by mail-qv1-xf38.google.com with SMTP id dw10-20020a0562140a0a00b004644636cc8fsf3333900qvb.22
        for <lists+jailhouse-dev@lfdr.de>; Mon, 30 May 2022 12:30:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20210112;
        h=sender:date:from:to:message-id:subject:mime-version
         :x-original-sender:precedence:mailing-list:list-id:list-post
         :list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=F/RWLHSXWi6RNxFk5sJny7kXYYE5SquBKXz/jNLdsuE=;
        b=tIIx/xwxWYNr3N8Tuf2JsQNsEM7AJpFRs7EpJ6IPkL/cGuUhYsfwgAx+U+bQ2M+oTw
         F3Y0fVs4ovO0bfXaqXgfyetZ2cKXJigwviZTd9iyK9DVZrnPQECiFyJ+9WCamYQ5H3mF
         g0jXk59OrOsS+XN7DoiLhsZO0h3/wr65viTYcBfmjuTJst1JQXg5t2u92+yuxLlVEI32
         AHyD/nnm1yf1eeuHua9vbU3LFUeaBBRbvtcRHXrluJUZYMGPasxhkGtmyNnzFYREW7tC
         Pd1cF3d/syeYjnQ9SM2h/M356JCKttIc73M73/aY9Suy0DLD99nNd86RQrGDmd7CNBSg
         HWNg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=date:from:to:message-id:subject:mime-version:x-original-sender
         :precedence:mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=F/RWLHSXWi6RNxFk5sJny7kXYYE5SquBKXz/jNLdsuE=;
        b=aQU7YIknmchs5FEci4JfsEg/CVPu2MF51hCMdA74Dobm/V18BFFfo0VcxnE6BB1Ah7
         pRVW+yY7OQ0g/eRoIplO5QKz5EbxPfB0RIKh/hHHMFAf8Dqk5Oc2aQcNQ3N/vCJkikgA
         Y0aNGQ/i/kw2SQ3gtYR8Mg+ZYGkq8gD2WapC6NlfAEkWJmTIa5i2O6mxMVLqd+BP5T4Z
         bHRKNxLRLAW8xJiU2/GpxNsp22t0C1EAaKnL8w8VtGYAwHdgV6gYsTgeArXnsTE/Lixx
         pZ4Ayb1BBiJNopQVnO02OKXVc4Ouae+2WM+/jYjQh1c0fV9wkXvUDNtoYTLmSSkI3Qcp
         zezQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=sender:x-gm-message-state:date:from:to:message-id:subject
         :mime-version:x-original-sender:precedence:mailing-list:list-id
         :x-spam-checked-in-group:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=F/RWLHSXWi6RNxFk5sJny7kXYYE5SquBKXz/jNLdsuE=;
        b=bUJWz87nzeWkWUhBWQu+RNFW/pmhGUvxGV0Ru+c3PN6UTIpg5eJIhPJLk472E4KZ4k
         dvMI0L3S/NTXVP0rFDEm/sAhFCA6l1a6NkY54/BjNwesUqIcjD+0olOPRP64tDhuL4RA
         xkCkEFj9P8pfBRrfnZwTWa8T5FzaCjWEWlUlb/yrTlPt7VX72AGQIbEz6SG3Krz1JmE6
         5FHQ4tgRRc20L1OsaYC1NYbIeBmz/bT3+Ouv9ZgBjy7eGl5ueFCTMDjuCLiv7uOcVOYR
         OvmvOklDr6o8x7Nn8dB6XkyvAf9B9gK42PiznLU7iJWRtRj21Igy6mKYz0MeLDJ+ubXq
         eFlg==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AOAM5338RuqACs0V72RZYSeYOpN/NeCn62P4kO3Fdd1JnoHCGg/hW0+G
	vHWU1mXQNskhgwBwLiC3e1U=
X-Google-Smtp-Source: ABdhPJxrJ0gzpFwe0niEtduh99ba1asGw+3nH8c4vReoJ401TyONfhY6usbqWT3kr3GN6yPo6xYW6Q==
X-Received: by 2002:a05:6214:3003:b0:462:1c15:772c with SMTP id ke3-20020a056214300300b004621c15772cmr39507581qvb.71.1653939044071;
        Mon, 30 May 2022 12:30:44 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a05:620a:4408:b0:6a5:96a4:9106 with SMTP id
 v8-20020a05620a440800b006a596a49106ls8946287qkp.5.gmail; Mon, 30 May 2022
 12:30:43 -0700 (PDT)
X-Received: by 2002:a05:620a:c4c:b0:6a5:8d19:cbf0 with SMTP id u12-20020a05620a0c4c00b006a58d19cbf0mr20904093qki.259.1653939042881;
        Mon, 30 May 2022 12:30:42 -0700 (PDT)
Date: Mon, 30 May 2022 12:30:42 -0700 (PDT)
From: "vsun...@gmail.com" <vsuneja63@gmail.com>
To: Jailhouse <jailhouse-dev@googlegroups.com>
Message-Id: <c58f3a6e-a1d0-4b7e-896d-42a1ee0fa40en@googlegroups.com>
Subject: i.MX8 : Facing issue while loading image in non-root cell of
 jailhouse 0.12
MIME-Version: 1.0
Content-Type: multipart/mixed; 
	boundary="----=_Part_2936_951805531.1653939042236"
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

------=_Part_2936_951805531.1653939042236
Content-Type: multipart/alternative; 
	boundary="----=_Part_2937_1926537421.1653939042236"

------=_Part_2937_1926537421.1653939042236
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi,

I am trying to load & bootup 2nd linux image in non-root cell of jailhouse.
I could port jailhouse 0.12 in kernel 5.4.147 . Flashed the image in SD=20
card & emmc of i.MX8. Initiated SD card image with command "run jh_mmcboot"=
=20
& could load jailhouse driver also. emmc has mmcblk0 & sd card has mmcblk1,=
=20
mounted mmcblk1p1 & mmcblkip2 manually.
=20
After driver is up used below commands:

*jailhouse enable /usr/share/jailhouse/cells/imx8mq.cell*

*export PATH=3D$PATH:/usr/share/jailhouse/tools/*

* jailhouse cell linux /usr/share/jailhouse/cells/imx8mq-linux-demo.cell=20
/run/media/mmcblk1p1/Image -d /run/media/mmcblk1p1/imx8mq-evk-inmate.dtb -c=
=20
"clk_ignore_unused console=3Dttymxc0,115200=20
earlycon=3Dec_imx6q,0x30860000,115200 root=3D/dev/mmcblk2p2 rootwait rw"*

2nd image not booting up, below are the logs:






















































































































































































































































































































*root=3D/dev/mmcblk2p2 rootwait rw"mxc0,115200=20
earlycon=3Dec_imx6q,0x30860000,115200[ 2102.362388] IRQ232: set affinity=20
failed(-22).[ 2102.362464] CPU2: shutdown[ 2102.369562] psci: CPU2 killed=
=20
(polled 0 ms)[ 2102.422343] IRQ232: set affinity failed(-22).[ 2102.422642]=
=20
CPU3: shutdown[ 2102.429741] psci: CPU3 killed (polled 0 ms)Adding virtual=
=20
PCI device 00:00.0 to cell "linux-inmate-demo"Shared memory connection=20
established, peer cells: "imx8mq"Adding virtual PCI device 00:01.0 to cell=
=20
"linux-inmate-demo"Shared memory connection established, peer=20
cells: "imx8mq"Created cell "linux-inmate-demo"Page pool usage after cell=
=20
creation: mem 80/992, remap 144/131072[ 2102.486660] Created Jailhouse cell=
=20
"linux-inmate-demo"Cell "linux-inmate-demo" can be loadedStarted cell=20
"linux-inmate-demo"[    0.000000] Booting Linux on physical CPU=20
0x0000000002 [0x410fd034][    0.000000] Linux version 5.4.147+gbbb2e2b=20
(oe-user@oe-host) (gcc version 9.3.0 (GCC)) #1 SMP PREEMPT Wed Dec 1=20
22:21:40 UTC 2021[    0.000000] Machine model: Freescale i.MX8MQ EVK[  =20
 0.000000] earlycon: ec_imx6q0 at MMIO 0x0000000030860000 (options=20
'115200')[    0.000000] printk: bootconsole [ec_imx6q0] enabled[  =20
 0.000000] efi: Getting EFI parameters from FDT:[    0.000000] efi: UEFI=20
not found.[    0.000000] cma: Reserved 320 MiB at=20
0x00000000e8000000imx8mqevk:/dev# [    0.000000] NUMA: No NUMA=20
configuration found[    0.000000] NUMA: Faking a node at [mem=20
0x00000000c0000000-0x00000000fdbfffff][    0.000000] NUMA: NODE_DATA [mem=
=20
0xfda0e500-0xfda0ffff][    0.000000] Zone ranges:[    0.000000]   DMA32  =
=20
 [mem 0x00000000c0000000-0x00000000fdbfffff][    0.000000]   Normal  =20
empty[    0.000000] Movable zone start for each node[    0.000000] Early=20
memory node ranges[    0.000000]   node   0: [mem=20
0x00000000c0000000-0x00000000fdbfffff][    0.000000] Initmem setup node 0=
=20
[mem 0x00000000c0000000-0x00000000fdbfffff][    0.000000] psci: probing for=
=20
conduit method from DT.[    0.000000] psci: PSCIv1.1 detected in firmware.[=
=20
   0.000000] psci: Using standard PSCI v0.2 function IDs[    0.000000]=20
psci: MIGRATE_INFO_TYPE not supported.[    0.000000] psci: SMC Calling=20
Convention v1.1[    0.000000] percpu: Embedded 33 pages/cpu s98072 r8192=20
d28904 u135168[    0.000000] Detected VIPT I-cache on CPU0[    0.000000]=20
CPU features: detected: ARM erratum 845719[    0.000000] CPU features:=20
detected: GIC system register CPU interface[    0.000000] Built 1=20
zonelists, mobility grouping on.  Total pages: 248976[    0.000000] Policy=
=20
zone: DMA32[    0.000000] Kernel command line: clk_ignore_unused=20
console=3Dttymxc0,115200 earlycon=3Dec_imx6q,0x30860000,115200=20
root=3D/dev/mmcblk2p2 rootwait rw[    0.000000] Dentry cache hash table=20
entries: 131072 (order: 8, 1048576 bytes, linear)[    0.000000] Inode-cache=
=20
hash table entries: 65536 (order: 7, 524288 bytes, linear)[    0.000000]=20
mem auto-init: stack:off, heap alloc:off, heap free:off[    0.000000]=20
Memory: 632620K/1011712K available (17212K kernel code, 2074K rwdata, 7068K=
=20
rodata, 3712K init, 1034K bss, 51412K reserved, 327680K cma-reserved)[  =20
 0.000000] SLUB: HWalign=3D64, Order=3D0-3, MinObjects=3D0, CPUs=3D2, Nodes=
=3D1[  =20
 0.000000] rcu: Preemptible hierarchical RCU implementation.[    0.000000]=
=20
rcu:     RCU restricting CPUs from NR_CPUS=3D256 to nr_cpu_ids=3D2.[  =20
 0.000000]  Tasks RCU enabled.[    0.000000] rcu: RCU calculated value of=
=20
scheduler-enlistment delay is 25 jiffies.[    0.000000] rcu: Adjusting=20
geometry for rcu_fanout_leaf=3D16, nr_cpu_ids=3D2[    0.000000] NR_IRQS: 64=
,=20
nr_irqs: 64, preallocated irqs: 0[    0.000000] GICv3: 128 SPIs=20
implemented[    0.000000] GICv3: 0 Extended SPIs implemented[    0.000000]=
=20
GICv3: Distributor has no Range Selector support[    0.000000] GICv3: 16=20
PPIs implemented[    0.000000] GICv3: no VLPI support, no direct LPI=20
support[    0.000000] GICv3: CPU0: found redistributor 2 region=20
0:0x00000000388c0000[    0.000000] ITS: No ITS available, not enabling=20
LPIs[    0.000000] random: get_random_bytes called from=20
start_kernel+0x318/0x49c with crng_init=3D0[    0.000000] arch_timer: cp15=
=20
timer(s) running at 8.33MHz (virt).[    0.000000] clocksource:=20
arch_sys_counter: mask: 0xffffffffffffff max_cycles: 0x1ec0311ec,=20
max_idle_ns: 440795202152 ns[    0.000004] sched_clock: 56 bits at 8MHz,=20
resolution 120ns, wraps every 2199023255541ns[    0.008140] Console: colour=
=20
dummy device 80x25[    0.012468] Calibrating delay loop (skipped), value=20
calculated using timer frequency.. 16.66 BogoMIPS (lpj=3D33333)[    0.02266=
3]=20
pid_max: default: 32768 minimum: 301[    0.027337] LSM: Security Framework=
=20
initializing[    0.031912] Smack:  Initializing.[    0.035152] Smack:  IPv6=
=20
port labeling enabled.[    0.039717] Mount-cache hash table entries: 2048=
=20
(order: 2, 16384 bytes, linear)[    0.047061] Mountpoint-cache hash table=
=20
entries: 2048 (order: 2, 16384 bytes, linear)[    0.056210] ASID allocator=
=20
initialised with 32768 entries[    0.060340] rcu: Hierarchical SRCU=20
implementation.[    0.065289] EFI services will not be available.[  =20
 0.069677] smp: Bringing up secondary CPUs ...[    0.074490] Detected VIPT=
=20
I-cache on CPU1[    0.074525] GICv3: CPU1: found redistributor 3 region=20
0:0x00000000388e0000[    0.074566] CPU1: Booted secondary processor=20
0x0000000003 [0x410fd034][    0.074660] smp: Brought up 1 node, 2 CPUs[  =
=20
 0.095498] SMP: Total of 2 processors activated.[    0.100182] CPU=20
features: detected: 32-bit EL0 Support[    0.105318] CPU features:=20
detected: CRC32 instructions[    0.120795] CPU: All CPU(s) started at EL1[=
=20
   0.122044] alternatives: patching kernel code[    0.127762] devtmpfs:=20
initialized[    0.131440] clocksource: jiffies: mask: 0xffffffff=20
max_cycles: 0xffffffff, max_idle_ns: 7645041785100000 ns[    0.139498]=20
futex hash table entries: 512 (order: 3, 32768 bytes, linear)[    0.155615]=
=20
pinctrl core: initialized pinctrl subsystem[    0.158617] DMI not present=
=20
or invalid.[    0.162081] NET: Registered protocol family 16[    0.173481]=
=20
DMA: preallocated 256 KiB pool for atomic allocations[    0.176737] audit:=
=20
initializing netlink subsys (disabled)[    0.182242] audit: type=3D2000=20
audit(0.136:1): state=3Dinitialized audit_enabled=3D0 res=3D1[    0.189855]=
=20
cpuidle: using governor menu[    0.194092] hw-breakpoint: found 6=20
breakpoint and 4 watchpoint registers.[    0.200888] Serial: AMBA PL011=20
UART driver[    0.204654] imx mu driver is registered.[    0.208501] imx=20
rpmsg driver is registered.[    0.231076] HugeTLB registered 1.00 GiB page=
=20
size, pre-allocated 0 pages[    0.234931] HugeTLB registered 32.0 MiB page=
=20
size, pre-allocated 0 pages[    0.241608] HugeTLB registered 2.00 MiB page=
=20
size, pre-allocated 0 pages[    0.248291] HugeTLB registered 64.0 KiB page=
=20
size, pre-allocated 0 pages[    0.256007] cryptd: max_cpu_qlen set to 1000[=
=20
   0.261848] ACPI: Interpreter disabled.[    0.263391] iommu: Default=20
domain type: Translated[    0.268086] vgaarb: loaded[    0.270905] SCSI=20
subsystem initialized[    0.274698] usbcore: registered new interface=20
driver usbfs[    0.279826] usbcore: registered new interface driver hub[  =
=20
 0.285127] usbcore: registered new device driver usb[    0.290446] mc:=20
Linux media interface: v0.10[    0.294407] videodev: Linux video capture=20
interface: v2.00[    0.299922] pps_core: LinuxPPS API ver. 1 registered[  =
=20
 0.304800] pps_core: Software ver. 5.3.6 - Copyright 2005-2007 Rodolfo=20
Giometti <giometti@linux.it <giometti@linux.it>>[    0.313927] PTP clock=20
support registered[    0.317874] EDAC MC: Ver: 3.0.0[    0.321369] No BMan=
=20
portals available![    0.324882] QMan: Allocated lookup table at=20
(____ptrval____), entry count 65537[    0.332006] No QMan portals=20
available![    0.335746] No USDPAA memory, no 'fsl,usdpaa-mem' in=20
device-tree[    0.341970] FPGA manager framework[    0.345172] Advanced=20
Linux Sound Architecture Driver Initialized.[    0.351573] NetLabel:=20
Initializing[    0.354555] NetLabel:  domain hash size =3D 128[    0.358877=
]=20
NetLabel:  protocols =3D UNLABELED CIPSOv4 CALIPSO[    0.364577] NetLabel:=
=20
 unlabeled traffic allowed by default[    0.370582] clocksource: Switched=
=20
to clocksource arch_sys_counter[    1.126801] VFS: Disk quotas dquot_6.6.0[=
=20
   1.127914] VFS: Dquot-cache hash table entries: 512 (order 0, 4096=20
bytes)[    1.134921] pnp: PnP ACPI: disabled[    1.145678] thermal_sys:=20
Registered thermal governor 'step_wise'[    1.145681] thermal_sys:=20
Registered thermal governor 'power_allocator'[    1.149008] NET: Registered=
=20
protocol family 2[    1.159787] IP idents hash table entries: 16384 (order:=
=20
5, 131072 bytes, linear)[    1.167659] tcp_listen_portaddr_hash hash table=
=20
entries: 512 (order: 1, 8192 bytes, linear)[    1.175430] TCP established=
=20
hash table entries: 8192 (order: 4, 65536 bytes, linear)[    1.183185] TCP=
=20
bind hash table entries: 8192 (order: 5, 131072 bytes, linear)[  =20
 1.190453] TCP: Hash tables configured (established 8192 bind 8192)[  =20
 1.196747] UDP hash table entries: 512 (order: 2, 16384 bytes, linear)[  =
=20
 1.203285] UDP-Lite hash table entries: 512 (order: 2, 16384 bytes,=20
linear)[    1.210414] NET: Registered protocol family 1[    1.215001] RPC:=
=20
Registered named UNIX socket transport module.[    1.220549] RPC:=20
Registered udp transport module.[    1.225224] RPC: Registered tcp=20
transport module.[    1.229907] RPC: Registered tcp NFSv4.1 backchannel=20
transport module.[    1.236334] PCI: CLS 0 bytes, default 64[    1.240854]=
=20
kvm [1]: HYP mode not available[    1.247543] Initialise system trusted=20
keyrings[    1.249234] workingset: timestamp_bits=3D44 max_order=3D18=20
bucket_order=3D0[    1.262658] squashfs: version 4.0 (2009/01/31) Phillip=
=20
Lougher[    1.266308] NFS: Registering the id_resolver key type[  =20
 1.270690] Key type id_resolver registered[    1.274838] Key type id_legacy=
=20
registered[    1.278838] nfs4filelayout_init: NFSv4 File Layout Driver=20
Registering...[    1.285511] nfs4flexfilelayout_init: NFSv4 Flexfile Layout=
=20
Driver Registering...[    1.292908] jffs2: version 2.2. (NAND) =C2=A9 2001-=
2006=20
Red Hat, Inc.[    1.299464] 9p: Installing v9fs 9p2000 file system support[=
=20
   1.321024] Key type asymmetric registered[    1.322258] Asymmetric key=20
parser 'x509' registered[    1.327165] Block layer SCSI generic (bsg)=20
driver version 0.4 loaded (major 244)[    1.334506] io scheduler=20
mq-deadline registered[    1.339020] io scheduler kyber registered[  =20
 1.344069] pci-host-generic bfb00000.pci: host bridge /pci@bfb00000=20
ranges:[    1.350073] pci-host-generic bfb00000.pci:   MEM=20
0x10000000..0x1000ffff -> 0x10000000[    1.357904] pci-host-generic=20
bfb00000.pci: ECAM at [mem 0xbfb00000-0xbfbfffff] for [bus 00][  =20
 1.366299] pci-host-generic bfb00000.pci: PCI host bridge to bus 0000:00[  =
=20
 1.372967] pci_bus 0000:00: root bus resource [bus 00][    1.378171]=20
pci_bus 0000:00: root bus resource [mem 0x10000000-0x1000ffff][  =20
 1.385056] pci 0000:00:00.0: [110a:4106] type 00 class 0xff0000[  =20
 1.391048] pci 0000:00:00.0: reg 0x10: [mem 0x00000000-0x00000fff][  =20
 1.397518] pci 0000:00:01.0: [110a:4106] type 00 class 0xff0001[  =20
 1.403282] pci 0000:00:01.0: reg 0x10: [mem 0x00000000-0x00000fff][  =20
 1.409905] pci 0000:00:00.0: BAR 0: assigned [mem 0x10000000-0x10000fff][  =
=20
 1.416286] pci 0000:00:01.0: BAR 0: assigned [mem 0x10001000-0x10001fff][  =
=20
 1.423676] EINJ: ACPI disabled.[    1.427098] Bus freq driver module=20
loaded[    1.433950] Serial: 8250/16550 driver, 4 ports, IRQ sharing=20
enabled[    1.438875] 30890000.serial: ttymxc1 at MMIO 0x30890000 (irq =3D =
5,=20
base_baud =3D 1562500) is a IMX[    1.454472] brd: module loaded[  =20
 1.460813] loop: module loaded[    1.504683] imx ahci driver is=20
registered.[    1.507384] libphy: Fixed MDIO Bus: probed[    1.510933] tun:=
=20
Universal TUN/TAP device driver, 1.6[    1.515357] thunder_xcv, ver 1.0[  =
=20
 1.518284] thunder_bgx, ver 1.0[    1.521510] nicpf, ver 1.0[    1.524328]=
=20
Freescale FM module, FMD API version 21.1.0[    1.529414] Freescale FM=20
Ports module[    1.533013] fsl_mac: fsl_mac: FSL FMan MAC API based driver[=
=20
   1.538614] fsl_dpa: FSL DPAA Ethernet driver[    1.542943] fsl_advanced:=
=20
FSL DPAA Advanced drivers:[    1.547856] fsl_proxy: FSL DPAA Proxy=20
initialization driver[    1.553450] fsl_oh: FSL FMan Offline Parsing port=
=20
driver[    1.559103] hclge is initializing[    1.561998] hns3: Hisilicon=20
Ethernet Network Driver for Hip08 Family - version[    1.569209] hns3:=20
Copyright (c) 2017 Huawei Corporation.[    1.574555] e1000: Intel(R)=20
PRO/1000 Network Driver - version 7.3.21-k8-NAPI[    1.581534] e1000:=20
Copyright (c) 1999-2006 Intel Corporation.[    1.587303] e1000e: Intel(R)=
=20
PRO/1000 Network Driver - 3.2.6-k[    1.593078] e1000e: Copyright(c) 1999 -=
=20
2015 Intel Corporation.[    1.599025] igb: Intel(R) Gigabit Ethernet=20
Network Driver - version 5.6.0-k[    1.605926] igb: Copyright (c) 2007-2014=
=20
Intel Corporation.[    1.611521] igbvf: Intel(R) Gigabit Virtual Function=
=20
Network Driver - version 2.4.0-k[    1.619298] igbvf: Copyright (c) 2009 -=
=20
2012 Intel Corporation.[    1.625275] sky2: driver version 1.30[  =20
 1.629226] ivshmem-net 0000:00:01.0: enabling device (0000 -> 0002)[  =20
 1.635261] ivshmem-net 0000:00:01.0: TX memory at 0x00000000bfe80000, size=
=20
0x000000000007f000[    1.643779] ivshmem-net 0000:00:01.0: RX memory at=20
0x00000000bfe01000, size 0x000000000007f000_ivshmem 0000:00:00.0:=20
state_table at 0x00000000bfd00000, size 0x0000000000001000o58s ready[  =20
 1.667569] uio_ivshmem 0000:00:00.0: rw_section at 0x00000000bfd01000, size=
=20
0x0000000000009000[    1.676244] uio_ivshmem 0000:00:00.0: input_sections=
=20
at 0x00000000bfd0a000, size 0x0000000000006000[    1.685268] uio_ivshmem=20
0000:00:00.0: output_section at 0x00000000bfd0e000, size=20
0x0000000000002000[    1.694814] VFIO - User Level meta-driver version:=20
0.3[    1.700138] ehci_hcd: USB 2.0 'Enhanced' Host Controller (EHCI)=20
Driver[    1.705933] ehci-pci: EHCI PCI platform driver[    1.710384]=20
ehci-platform: EHCI generic platform driver[    1.715598] ohci_hcd: USB 1.1=
=20
'Open' Host Controller (OHCI) Driver[    1.721741] ohci-pci: OHCI PCI=20
platform driver[    1.726175] ohci-platform: OHCI generic platform driver[=
=20
   1.731493] usbcore: registered new interface driver usb-storage[  =20
 1.737402] usbcore: registered new interface driver usbserial_generic[  =20
 1.743876] usbserial: USB Serial support registered for generic[  =20
 1.749866] usbcore: registered new interface driver cp210x[    1.755414]=20
usbserial: USB Serial support registered for cp210x[    1.761327] usbcore:=
=20
registered new interface driver usb_serial_simple[    1.767836] usbserial:=
=20
USB Serial support registered for carelink[    1.773904] usbserial: USB=20
Serial support registered for zio[    1.779547] usbserial: USB Serial=20
support registered for funsoft[    1.785535] usbserial: USB Serial support=
=20
registered for flashloader[    1.791874] usbserial: USB Serial support=20
registered for google[    1.797776] usbserial: USB Serial support=20
registered for libtransistor[    1.804286] usbserial: USB Serial support=20
registered for vivopay[    1.810274] usbserial: USB Serial support=20
registered for moto_modem[    1.816526] usbserial: USB Serial support=20
registered for motorola_tetra[    1.823127] usbserial: USB Serial support=
=20
registered for novatel_gps[    1.829469] usbserial: USB Serial support=20
registered for hp4x[    1.835189] usbserial: USB Serial support registered=
=20
for suunto[    1.841092] usbserial: USB Serial support registered for=20
siemens_mpi[    1.848500] i2c /dev entries driver[    1.850968] usbcore:=20
registered new interface driver i2c-tiny-usb[    1.857640] imx-cpufreq-dt:=
=20
probe of imx-cpufreq-dt failed with error -2[    1.863865] sdhci: Secure=20
Digital Host Controller Interface driver[    1.869815] sdhci: Copyright(c)=
=20
Pierre Ossman[    1.874218] Synopsys Designware Multimedia Card Interface=
=20
Driver[    1.880265] sdhci-pltfm: SDHCI platform and OF driver helper[  =20
 1.885988] sdhci-esdhc-imx 30b40000.mmc: could not get pinctrl[  =20
 1.922878] mmc2: SDHCI controller on 30b40000.mmc [30b40000.mmc] using=20
ADMA[    1.927813] ledtrig-cpu: registered to indicate activity on CPUs[  =
=20
 1.934117] usbcore: registered new interface driver usbhid[    1.938650]=20
usbhid: USB HID core driver[    1.943182] No fsl,qman node[    1.945348]=20
Freescale USDPAA process driver[    1.949525] fsl-usdpaa: no region found[=
=20
   1.953344] Freescale USDPAA process IRQ driver[    1.959898] usbcore:=20
registered new interface driver snd-usb-audio[    1.966247] pktgen: Packet=
=20
Generator for packet performance testing. Version: 2.75[    1.971766]=20
drop_monitor: Initializing network drop monitor service[    1.977889] NET:=
=20
Registered protocol family 26[    1.982808] NET: Registered protocol family=
=20
10[    1.987363] Segment Routing with IPv6[    1.990314] NET: Registered=20
protocol family 17[    1.994752] 8021q: 802.1Q VLAN Support v1.8[  =20
 1.998931] lib80211: common routines for IEEE802.11 drivers[    2.004686]=
=20
9pnet: Installing 9P2000 support[    2.008803] tsn generic netlink module=
=20
v1 init...[    2.013535] Key type dns_resolver registered[    2.018325]=20
registered taskstats version 1[    2.021787] Loading compiled-in X.509=20
certificates[    2.028774] hctosys: unable to open rtc device (rtc0)[  =20
 2.031735] clk: Not disabling unused clocks[    2.035868] ALSA device=20
list:[    2.038808]   No soundcards found.[    2.042235] Warning: unable to=
=20
open an initial console.[    2.047626] Waiting for root device=20
/dev/mmcblk2p2...[    2.095262] mmc2: new DDR MMC card at address 0001[  =
=20
 2.097737] mmcblk2: mmc2:0001 DG4016 14.7 GiB[    2.101934] mmcblk2boot0:=
=20
mmc2:0001 DG4016 partition 1 4.00 MiB[    2.107842] mmcblk2boot1: mmc2:0001=
=20
DG4016 partition 2 4.00 MiB[    2.113647] mmcblk2rpmb: mmc2:0001 DG4016=20
partition 3 4.00 MiB, chardev (237:0)[    2.123465]  mmcblk2: p1 p2[  =20
 2.139262] EXT4-fs (mmcblk2p2): mounted filesystem with ordered data mode.=
=20
Opts: (null)[    2.144558] VFS: Mounted root (ext4 filesystem) on device=20
179:2.[    2.150930] devtmpfs: error mounting -2[    2.156025] Freeing=20
unused kernel memory: 3712K[    2.158906] Run /sbin/init as init process[  =
=20
 2.162934] Run /etc/init as init process[    2.166921] Run /bin/init as=20
init process[    2.170922] Run /bin/sh as init process[    2.174728] Kernel=
=20
panic - not syncing: No working init found.  Try passing init=3D option to=
=20
kernel. See Linux Documentation/admin-guide/init.rst for guidance.[  =20
 2.188854] CPU: 1 PID: 1 Comm: swapper/0 Not tainted 5.4.147+gbbb2e2b #1[  =
=20
 2.195620] Hardware name: Freescale i.MX8MQ EVK (DT)[    2.200655] Call=20
trace:[    2.203094]  dump_backtrace+0x0/0x140[    2.206734]=20
 show_stack+0x14/0x20[    2.210036]  dump_stack+0xb4/0x110[    2.213419]=20
 panic+0x158/0x360[    2.216455]  kernel_init+0xf0/0x108[    2.219929]=20
 ret_from_fork+0x10/0x1c[    2.223489] SMP: stopping secondary CPUs[  =20
 2.227396] Kernel Offset: disabled[    2.230865] CPU features:=20
0x0002,2000200c[    2.234856] Memory Limit: none[    2.237901] ---[ end=20
Kernel panic - not syncing: No working init found.  Try passing init=3D=20
option to kernel. See Linux Documentation/admin-guide/init.rst for=20
guidance. ]---*


--=20
You received this message because you are subscribed to the Google Groups "=
Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/=
jailhouse-dev/c58f3a6e-a1d0-4b7e-896d-42a1ee0fa40en%40googlegroups.com.

------=_Part_2937_1926537421.1653939042236
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi,<div><br></div><div>I am trying to load &amp; bootup 2nd linux image in =
non-root cell of jailhouse.</div><div>I could port jailhouse 0.12 in kernel=
 5.4.147 . Flashed the image in SD card &amp; emmc of i.MX8. Initiated SD c=
ard image with command "run jh_mmcboot" &amp; could load jailhouse driver a=
lso. emmc has mmcblk0 &amp; sd card has mmcblk1, mounted mmcblk1p1 &amp; mm=
cblkip2 manually.</div><div>&nbsp;</div><div>After driver is up used below =
commands:</div><div><br></div><div><b><i>jailhouse enable /usr/share/jailho=
use/cells/imx8mq.cell</i></b></div><div><b><i><br></i></b></div><div><b><i>=
export PATH=3D$PATH:/usr/share/jailhouse/tools/</i></b><br></div><div><br><=
/div><div><b><i>&nbsp;jailhouse cell linux /usr/share/jailhouse/cells/imx8m=
q-linux-demo.cell /run/media/mmcblk1p1/Image -d /run/media/mmcblk1p1/imx8mq=
-evk-inmate.dtb -c "clk_ignore_unused console=3Dttymxc0,115200 earlycon=3De=
c_imx6q,0x30860000,115200 root=3D/dev/mmcblk2p2 rootwait rw"</i></b></div><=
div><b><i><br></i></b></div><div>2nd image not booting up, below are the lo=
gs:</div><div><br></div><div><b><i>root=3D/dev/mmcblk2p2 rootwait rw"mxc0,1=
15200 earlycon=3Dec_imx6q,0x30860000,115200<br>[ 2102.362388] IRQ232: set a=
ffinity failed(-22).<br>[ 2102.362464] CPU2: shutdown<br>[ 2102.369562] psc=
i: CPU2 killed (polled 0 ms)<br>[ 2102.422343] IRQ232: set affinity failed(=
-22).<br>[ 2102.422642] CPU3: shutdown<br>[ 2102.429741] psci: CPU3 killed =
(polled 0 ms)<br>Adding virtual PCI device 00:00.0 to cell "linux-inmate-de=
mo"<br>Shared memory connection established, peer cells:<br>&nbsp;"imx8mq"<=
br>Adding virtual PCI device 00:01.0 to cell "linux-inmate-demo"<br>Shared =
memory connection established, peer cells:<br>&nbsp;"imx8mq"<br>Created cel=
l "linux-inmate-demo"<br>Page pool usage after cell creation: mem 80/992, r=
emap 144/131072<br>[ 2102.486660] Created Jailhouse cell "linux-inmate-demo=
"<br>Cell "linux-inmate-demo" can be loaded<br>Started cell "linux-inmate-d=
emo"<br>[ &nbsp; &nbsp;0.000000] Booting Linux on physical CPU 0x0000000002=
 [0x410fd034]<br>[ &nbsp; &nbsp;0.000000] Linux version 5.4.147+gbbb2e2b (o=
e-user@oe-host) (gcc version 9.3.0 (GCC)) #1 SMP PREEMPT Wed Dec 1 22:21:40=
 UTC 2021<br>[ &nbsp; &nbsp;0.000000] Machine model: Freescale i.MX8MQ EVK<=
br>[ &nbsp; &nbsp;0.000000] earlycon: ec_imx6q0 at MMIO 0x0000000030860000 =
(options '115200')<br>[ &nbsp; &nbsp;0.000000] printk: bootconsole [ec_imx6=
q0] enabled<br>[ &nbsp; &nbsp;0.000000] efi: Getting EFI parameters from FD=
T:<br>[ &nbsp; &nbsp;0.000000] efi: UEFI not found.<br>[ &nbsp; &nbsp;0.000=
000] cma: Reserved 320 MiB at 0x00000000e8000000<br>imx8mqevk:/dev# [ &nbsp=
; &nbsp;0.000000] NUMA: No NUMA configuration found<br>[ &nbsp; &nbsp;0.000=
000] NUMA: Faking a node at [mem 0x00000000c0000000-0x00000000fdbfffff]<br>=
[ &nbsp; &nbsp;0.000000] NUMA: NODE_DATA [mem 0xfda0e500-0xfda0ffff]<br>[ &=
nbsp; &nbsp;0.000000] Zone ranges:<br>[ &nbsp; &nbsp;0.000000] &nbsp; DMA32=
 &nbsp; &nbsp;[mem 0x00000000c0000000-0x00000000fdbfffff]<br>[ &nbsp; &nbsp=
;0.000000] &nbsp; Normal &nbsp; empty<br>[ &nbsp; &nbsp;0.000000] Movable z=
one start for each node<br>[ &nbsp; &nbsp;0.000000] Early memory node range=
s<br>[ &nbsp; &nbsp;0.000000] &nbsp; node &nbsp; 0: [mem 0x00000000c0000000=
-0x00000000fdbfffff]<br>[ &nbsp; &nbsp;0.000000] Initmem setup node 0 [mem =
0x00000000c0000000-0x00000000fdbfffff]<br>[ &nbsp; &nbsp;0.000000] psci: pr=
obing for conduit method from DT.<br>[ &nbsp; &nbsp;0.000000] psci: PSCIv1.=
1 detected in firmware.<br>[ &nbsp; &nbsp;0.000000] psci: Using standard PS=
CI v0.2 function IDs<br>[ &nbsp; &nbsp;0.000000] psci: MIGRATE_INFO_TYPE no=
t supported.<br>[ &nbsp; &nbsp;0.000000] psci: SMC Calling Convention v1.1<=
br>[ &nbsp; &nbsp;0.000000] percpu: Embedded 33 pages/cpu s98072 r8192 d289=
04 u135168<br>[ &nbsp; &nbsp;0.000000] Detected VIPT I-cache on CPU0<br>[ &=
nbsp; &nbsp;0.000000] CPU features: detected: ARM erratum 845719<br>[ &nbsp=
; &nbsp;0.000000] CPU features: detected: GIC system register CPU interface=
<br>[ &nbsp; &nbsp;0.000000] Built 1 zonelists, mobility grouping on.&nbsp;=
 Total pages: 248976<br>[ &nbsp; &nbsp;0.000000] Policy zone: DMA32<br>[ &n=
bsp; &nbsp;0.000000] Kernel command line: clk_ignore_unused console=3Dttymx=
c0,115200 earlycon=3Dec_imx6q,0x30860000,115200 root=3D/dev/mmcblk2p2 rootw=
ait rw<br>[ &nbsp; &nbsp;0.000000] Dentry cache hash table entries: 131072 =
(order: 8, 1048576 bytes, linear)<br>[ &nbsp; &nbsp;0.000000] Inode-cache h=
ash table entries: 65536 (order: 7, 524288 bytes, linear)<br>[ &nbsp; &nbsp=
;0.000000] mem auto-init: stack:off, heap alloc:off, heap free:off<br>[ &nb=
sp; &nbsp;0.000000] Memory: 632620K/1011712K available (17212K kernel code,=
 2074K rwdata, 7068K rodata, 3712K init, 1034K bss, 51412K reserved, 327680=
K cma-reserved)<br>[ &nbsp; &nbsp;0.000000] SLUB: HWalign=3D64, Order=3D0-3=
, MinObjects=3D0, CPUs=3D2, Nodes=3D1<br>[ &nbsp; &nbsp;0.000000] rcu: Pree=
mptible hierarchical RCU implementation.<br>[ &nbsp; &nbsp;0.000000] rcu: &=
nbsp; &nbsp; RCU restricting CPUs from NR_CPUS=3D256 to nr_cpu_ids=3D2.<br>=
[ &nbsp; &nbsp;0.000000] &nbsp;Tasks RCU enabled.<br>[ &nbsp; &nbsp;0.00000=
0] rcu: RCU calculated value of scheduler-enlistment delay is 25 jiffies.<b=
r>[ &nbsp; &nbsp;0.000000] rcu: Adjusting geometry for rcu_fanout_leaf=3D16=
, nr_cpu_ids=3D2<br>[ &nbsp; &nbsp;0.000000] NR_IRQS: 64, nr_irqs: 64, prea=
llocated irqs: 0<br>[ &nbsp; &nbsp;0.000000] GICv3: 128 SPIs implemented<br=
>[ &nbsp; &nbsp;0.000000] GICv3: 0 Extended SPIs implemented<br>[ &nbsp; &n=
bsp;0.000000] GICv3: Distributor has no Range Selector support<br>[ &nbsp; =
&nbsp;0.000000] GICv3: 16 PPIs implemented<br>[ &nbsp; &nbsp;0.000000] GICv=
3: no VLPI support, no direct LPI support<br>[ &nbsp; &nbsp;0.000000] GICv3=
: CPU0: found redistributor 2 region 0:0x00000000388c0000<br>[ &nbsp; &nbsp=
;0.000000] ITS: No ITS available, not enabling LPIs<br>[ &nbsp; &nbsp;0.000=
000] random: get_random_bytes called from start_kernel+0x318/0x49c with crn=
g_init=3D0<br>[ &nbsp; &nbsp;0.000000] arch_timer: cp15 timer(s) running at=
 8.33MHz (virt).<br>[ &nbsp; &nbsp;0.000000] clocksource: arch_sys_counter:=
 mask: 0xffffffffffffff max_cycles: 0x1ec0311ec, max_idle_ns: 440795202152 =
ns<br>[ &nbsp; &nbsp;0.000004] sched_clock: 56 bits at 8MHz, resolution 120=
ns, wraps every 2199023255541ns<br>[ &nbsp; &nbsp;0.008140] Console: colour=
 dummy device 80x25<br>[ &nbsp; &nbsp;0.012468] Calibrating delay loop (ski=
pped), value calculated using timer frequency.. 16.66 BogoMIPS (lpj=3D33333=
)<br>[ &nbsp; &nbsp;0.022663] pid_max: default: 32768 minimum: 301<br>[ &nb=
sp; &nbsp;0.027337] LSM: Security Framework initializing<br>[ &nbsp; &nbsp;=
0.031912] Smack: &nbsp;Initializing.<br>[ &nbsp; &nbsp;0.035152] Smack: &nb=
sp;IPv6 port labeling enabled.<br>[ &nbsp; &nbsp;0.039717] Mount-cache hash=
 table entries: 2048 (order: 2, 16384 bytes, linear)<br>[ &nbsp; &nbsp;0.04=
7061] Mountpoint-cache hash table entries: 2048 (order: 2, 16384 bytes, lin=
ear)<br>[ &nbsp; &nbsp;0.056210] ASID allocator initialised with 32768 entr=
ies<br>[ &nbsp; &nbsp;0.060340] rcu: Hierarchical SRCU implementation.<br>[=
 &nbsp; &nbsp;0.065289] EFI services will not be available.<br>[ &nbsp; &nb=
sp;0.069677] smp: Bringing up secondary CPUs ...<br>[ &nbsp; &nbsp;0.074490=
] Detected VIPT I-cache on CPU1<br>[ &nbsp; &nbsp;0.074525] GICv3: CPU1: fo=
und redistributor 3 region 0:0x00000000388e0000<br>[ &nbsp; &nbsp;0.074566]=
 CPU1: Booted secondary processor 0x0000000003 [0x410fd034]<br>[ &nbsp; &nb=
sp;0.074660] smp: Brought up 1 node, 2 CPUs<br>[ &nbsp; &nbsp;0.095498] SMP=
: Total of 2 processors activated.<br>[ &nbsp; &nbsp;0.100182] CPU features=
: detected: 32-bit EL0 Support<br>[ &nbsp; &nbsp;0.105318] CPU features: de=
tected: CRC32 instructions<br>[ &nbsp; &nbsp;0.120795] CPU: All CPU(s) star=
ted at EL1<br>[ &nbsp; &nbsp;0.122044] alternatives: patching kernel code<b=
r>[ &nbsp; &nbsp;0.127762] devtmpfs: initialized<br>[ &nbsp; &nbsp;0.131440=
] clocksource: jiffies: mask: 0xffffffff max_cycles: 0xffffffff, max_idle_n=
s: 7645041785100000 ns<br>[ &nbsp; &nbsp;0.139498] futex hash table entries=
: 512 (order: 3, 32768 bytes, linear)<br>[ &nbsp; &nbsp;0.155615] pinctrl c=
ore: initialized pinctrl subsystem<br>[ &nbsp; &nbsp;0.158617] DMI not pres=
ent or invalid.<br>[ &nbsp; &nbsp;0.162081] NET: Registered protocol family=
 16<br>[ &nbsp; &nbsp;0.173481] DMA: preallocated 256 KiB pool for atomic a=
llocations<br>[ &nbsp; &nbsp;0.176737] audit: initializing netlink subsys (=
disabled)<br>[ &nbsp; &nbsp;0.182242] audit: type=3D2000 audit(0.136:1): st=
ate=3Dinitialized audit_enabled=3D0 res=3D1<br>[ &nbsp; &nbsp;0.189855] cpu=
idle: using governor menu<br>[ &nbsp; &nbsp;0.194092] hw-breakpoint: found =
6 breakpoint and 4 watchpoint registers.<br>[ &nbsp; &nbsp;0.200888] Serial=
: AMBA PL011 UART driver<br>[ &nbsp; &nbsp;0.204654] imx mu driver is regis=
tered.<br>[ &nbsp; &nbsp;0.208501] imx rpmsg driver is registered.<br>[ &nb=
sp; &nbsp;0.231076] HugeTLB registered 1.00 GiB page size, pre-allocated 0 =
pages<br>[ &nbsp; &nbsp;0.234931] HugeTLB registered 32.0 MiB page size, pr=
e-allocated 0 pages<br>[ &nbsp; &nbsp;0.241608] HugeTLB registered 2.00 MiB=
 page size, pre-allocated 0 pages<br>[ &nbsp; &nbsp;0.248291] HugeTLB regis=
tered 64.0 KiB page size, pre-allocated 0 pages<br>[ &nbsp; &nbsp;0.256007]=
 cryptd: max_cpu_qlen set to 1000<br>[ &nbsp; &nbsp;0.261848] ACPI: Interpr=
eter disabled.<br>[ &nbsp; &nbsp;0.263391] iommu: Default domain type: Tran=
slated<br>[ &nbsp; &nbsp;0.268086] vgaarb: loaded<br>[ &nbsp; &nbsp;0.27090=
5] SCSI subsystem initialized<br>[ &nbsp; &nbsp;0.274698] usbcore: register=
ed new interface driver usbfs<br>[ &nbsp; &nbsp;0.279826] usbcore: register=
ed new interface driver hub<br>[ &nbsp; &nbsp;0.285127] usbcore: registered=
 new device driver usb<br>[ &nbsp; &nbsp;0.290446] mc: Linux media interfac=
e: v0.10<br>[ &nbsp; &nbsp;0.294407] videodev: Linux video capture interfac=
e: v2.00<br>[ &nbsp; &nbsp;0.299922] pps_core: LinuxPPS API ver. 1 register=
ed<br>[ &nbsp; &nbsp;0.304800] pps_core: Software ver. 5.3.6 - Copyright 20=
05-2007 Rodolfo Giometti &lt;<a href=3D"mailto:giometti@linux.it">giometti@=
linux.it</a>&gt;<br>[ &nbsp; &nbsp;0.313927] PTP clock support registered<b=
r>[ &nbsp; &nbsp;0.317874] EDAC MC: Ver: 3.0.0<br>[ &nbsp; &nbsp;0.321369] =
No BMan portals available!<br>[ &nbsp; &nbsp;0.324882] QMan: Allocated look=
up table at (____ptrval____), entry count 65537<br>[ &nbsp; &nbsp;0.332006]=
 No QMan portals available!<br>[ &nbsp; &nbsp;0.335746] No USDPAA memory, n=
o 'fsl,usdpaa-mem' in device-tree<br>[ &nbsp; &nbsp;0.341970] FPGA manager =
framework<br>[ &nbsp; &nbsp;0.345172] Advanced Linux Sound Architecture Dri=
ver Initialized.<br>[ &nbsp; &nbsp;0.351573] NetLabel: Initializing<br>[ &n=
bsp; &nbsp;0.354555] NetLabel: &nbsp;domain hash size =3D 128<br>[ &nbsp; &=
nbsp;0.358877] NetLabel: &nbsp;protocols =3D UNLABELED CIPSOv4 CALIPSO<br>[=
 &nbsp; &nbsp;0.364577] NetLabel: &nbsp;unlabeled traffic allowed by defaul=
t<br>[ &nbsp; &nbsp;0.370582] clocksource: Switched to clocksource arch_sys=
_counter<br>[ &nbsp; &nbsp;1.126801] VFS: Disk quotas dquot_6.6.0<br>[ &nbs=
p; &nbsp;1.127914] VFS: Dquot-cache hash table entries: 512 (order 0, 4096 =
bytes)<br>[ &nbsp; &nbsp;1.134921] pnp: PnP ACPI: disabled<br>[ &nbsp; &nbs=
p;1.145678] thermal_sys: Registered thermal governor 'step_wise'<br>[ &nbsp=
; &nbsp;1.145681] thermal_sys: Registered thermal governor 'power_allocator=
'<br>[ &nbsp; &nbsp;1.149008] NET: Registered protocol family 2<br>[ &nbsp;=
 &nbsp;1.159787] IP idents hash table entries: 16384 (order: 5, 131072 byte=
s, linear)<br>[ &nbsp; &nbsp;1.167659] tcp_listen_portaddr_hash hash table =
entries: 512 (order: 1, 8192 bytes, linear)<br>[ &nbsp; &nbsp;1.175430] TCP=
 established hash table entries: 8192 (order: 4, 65536 bytes, linear)<br>[ =
&nbsp; &nbsp;1.183185] TCP bind hash table entries: 8192 (order: 5, 131072 =
bytes, linear)<br>[ &nbsp; &nbsp;1.190453] TCP: Hash tables configured (est=
ablished 8192 bind 8192)<br>[ &nbsp; &nbsp;1.196747] UDP hash table entries=
: 512 (order: 2, 16384 bytes, linear)<br>[ &nbsp; &nbsp;1.203285] UDP-Lite =
hash table entries: 512 (order: 2, 16384 bytes, linear)<br>[ &nbsp; &nbsp;1=
.210414] NET: Registered protocol family 1<br>[ &nbsp; &nbsp;1.215001] RPC:=
 Registered named UNIX socket transport module.<br>[ &nbsp; &nbsp;1.220549]=
 RPC: Registered udp transport module.<br>[ &nbsp; &nbsp;1.225224] RPC: Reg=
istered tcp transport module.<br>[ &nbsp; &nbsp;1.229907] RPC: Registered t=
cp NFSv4.1 backchannel transport module.<br>[ &nbsp; &nbsp;1.236334] PCI: C=
LS 0 bytes, default 64<br>[ &nbsp; &nbsp;1.240854] kvm [1]: HYP mode not av=
ailable<br>[ &nbsp; &nbsp;1.247543] Initialise system trusted keyrings<br>[=
 &nbsp; &nbsp;1.249234] workingset: timestamp_bits=3D44 max_order=3D18 buck=
et_order=3D0<br>[ &nbsp; &nbsp;1.262658] squashfs: version 4.0 (2009/01/31)=
 Phillip Lougher<br>[ &nbsp; &nbsp;1.266308] NFS: Registering the id_resolv=
er key type<br>[ &nbsp; &nbsp;1.270690] Key type id_resolver registered<br>=
[ &nbsp; &nbsp;1.274838] Key type id_legacy registered<br>[ &nbsp; &nbsp;1.=
278838] nfs4filelayout_init: NFSv4 File Layout Driver Registering...<br>[ &=
nbsp; &nbsp;1.285511] nfs4flexfilelayout_init: NFSv4 Flexfile Layout Driver=
 Registering...<br>[ &nbsp; &nbsp;1.292908] jffs2: version 2.2. (NAND) =C2=
=A9 2001-2006 Red Hat, Inc.<br>[ &nbsp; &nbsp;1.299464] 9p: Installing v9fs=
 9p2000 file system support<br>[ &nbsp; &nbsp;1.321024] Key type asymmetric=
 registered<br>[ &nbsp; &nbsp;1.322258] Asymmetric key parser 'x509' regist=
ered<br>[ &nbsp; &nbsp;1.327165] Block layer SCSI generic (bsg) driver vers=
ion 0.4 loaded (major 244)<br>[ &nbsp; &nbsp;1.334506] io scheduler mq-dead=
line registered<br>[ &nbsp; &nbsp;1.339020] io scheduler kyber registered<b=
r>[ &nbsp; &nbsp;1.344069] pci-host-generic bfb00000.pci: host bridge /pci@=
bfb00000 ranges:<br>[ &nbsp; &nbsp;1.350073] pci-host-generic bfb00000.pci:=
 &nbsp; MEM 0x10000000..0x1000ffff -&gt; 0x10000000<br>[ &nbsp; &nbsp;1.357=
904] pci-host-generic bfb00000.pci: ECAM at [mem 0xbfb00000-0xbfbfffff] for=
 [bus 00]<br>[ &nbsp; &nbsp;1.366299] pci-host-generic bfb00000.pci: PCI ho=
st bridge to bus 0000:00<br>[ &nbsp; &nbsp;1.372967] pci_bus 0000:00: root =
bus resource [bus 00]<br>[ &nbsp; &nbsp;1.378171] pci_bus 0000:00: root bus=
 resource [mem 0x10000000-0x1000ffff]<br>[ &nbsp; &nbsp;1.385056] pci 0000:=
00:00.0: [110a:4106] type 00 class 0xff0000<br>[ &nbsp; &nbsp;1.391048] pci=
 0000:00:00.0: reg 0x10: [mem 0x00000000-0x00000fff]<br>[ &nbsp; &nbsp;1.39=
7518] pci 0000:00:01.0: [110a:4106] type 00 class 0xff0001<br>[ &nbsp; &nbs=
p;1.403282] pci 0000:00:01.0: reg 0x10: [mem 0x00000000-0x00000fff]<br>[ &n=
bsp; &nbsp;1.409905] pci 0000:00:00.0: BAR 0: assigned [mem 0x10000000-0x10=
000fff]<br>[ &nbsp; &nbsp;1.416286] pci 0000:00:01.0: BAR 0: assigned [mem =
0x10001000-0x10001fff]<br>[ &nbsp; &nbsp;1.423676] EINJ: ACPI disabled.<br>=
[ &nbsp; &nbsp;1.427098] Bus freq driver module loaded<br>[ &nbsp; &nbsp;1.=
433950] Serial: 8250/16550 driver, 4 ports, IRQ sharing enabled<br>[ &nbsp;=
 &nbsp;1.438875] 30890000.serial: ttymxc1 at MMIO 0x30890000 (irq =3D 5, ba=
se_baud =3D 1562500) is a IMX<br>[ &nbsp; &nbsp;1.454472] brd: module loade=
d<br>[ &nbsp; &nbsp;1.460813] loop: module loaded<br>[ &nbsp; &nbsp;1.50468=
3] imx ahci driver is registered.<br>[ &nbsp; &nbsp;1.507384] libphy: Fixed=
 MDIO Bus: probed<br>[ &nbsp; &nbsp;1.510933] tun: Universal TUN/TAP device=
 driver, 1.6<br>[ &nbsp; &nbsp;1.515357] thunder_xcv, ver 1.0<br>[ &nbsp; &=
nbsp;1.518284] thunder_bgx, ver 1.0<br>[ &nbsp; &nbsp;1.521510] nicpf, ver =
1.0<br>[ &nbsp; &nbsp;1.524328] Freescale FM module, FMD API version 21.1.0=
<br>[ &nbsp; &nbsp;1.529414] Freescale FM Ports module<br>[ &nbsp; &nbsp;1.=
533013] fsl_mac: fsl_mac: FSL FMan MAC API based driver<br>[ &nbsp; &nbsp;1=
.538614] fsl_dpa: FSL DPAA Ethernet driver<br>[ &nbsp; &nbsp;1.542943] fsl_=
advanced: FSL DPAA Advanced drivers:<br>[ &nbsp; &nbsp;1.547856] fsl_proxy:=
 FSL DPAA Proxy initialization driver<br>[ &nbsp; &nbsp;1.553450] fsl_oh: F=
SL FMan Offline Parsing port driver<br>[ &nbsp; &nbsp;1.559103] hclge is in=
itializing<br>[ &nbsp; &nbsp;1.561998] hns3: Hisilicon Ethernet Network Dri=
ver for Hip08 Family - version<br>[ &nbsp; &nbsp;1.569209] hns3: Copyright =
(c) 2017 Huawei Corporation.<br>[ &nbsp; &nbsp;1.574555] e1000: Intel(R) PR=
O/1000 Network Driver - version 7.3.21-k8-NAPI<br>[ &nbsp; &nbsp;1.581534] =
e1000: Copyright (c) 1999-2006 Intel Corporation.<br>[ &nbsp; &nbsp;1.58730=
3] e1000e: Intel(R) PRO/1000 Network Driver - 3.2.6-k<br>[ &nbsp; &nbsp;1.5=
93078] e1000e: Copyright(c) 1999 - 2015 Intel Corporation.<br>[ &nbsp; &nbs=
p;1.599025] igb: Intel(R) Gigabit Ethernet Network Driver - version 5.6.0-k=
<br>[ &nbsp; &nbsp;1.605926] igb: Copyright (c) 2007-2014 Intel Corporation=
.<br>[ &nbsp; &nbsp;1.611521] igbvf: Intel(R) Gigabit Virtual Function Netw=
ork Driver - version 2.4.0-k<br>[ &nbsp; &nbsp;1.619298] igbvf: Copyright (=
c) 2009 - 2012 Intel Corporation.<br>[ &nbsp; &nbsp;1.625275] sky2: driver =
version 1.30<br>[ &nbsp; &nbsp;1.629226] ivshmem-net 0000:00:01.0: enabling=
 device (0000 -&gt; 0002)<br>[ &nbsp; &nbsp;1.635261] ivshmem-net 0000:00:0=
1.0: TX memory at 0x00000000bfe80000, size 0x000000000007f000<br>[ &nbsp; &=
nbsp;1.643779] ivshmem-net 0000:00:01.0: RX memory at 0x00000000bfe01000, s=
ize 0x000000000007f000<br>_ivshmem 0000:00:00.0: state_table at 0x00000000b=
fd00000, size 0x0000000000001000o58s ready<br>[ &nbsp; &nbsp;1.667569] uio_=
ivshmem 0000:00:00.0: rw_section at 0x00000000bfd01000, size 0x000000000000=
9000<br>[ &nbsp; &nbsp;1.676244] uio_ivshmem 0000:00:00.0: input_sections a=
t 0x00000000bfd0a000, size 0x0000000000006000<br>[ &nbsp; &nbsp;1.685268] u=
io_ivshmem 0000:00:00.0: output_section at 0x00000000bfd0e000, size 0x00000=
00000002000<br>[ &nbsp; &nbsp;1.694814] VFIO - User Level meta-driver versi=
on: 0.3<br>[ &nbsp; &nbsp;1.700138] ehci_hcd: USB 2.0 'Enhanced' Host Contr=
oller (EHCI) Driver<br>[ &nbsp; &nbsp;1.705933] ehci-pci: EHCI PCI platform=
 driver<br>[ &nbsp; &nbsp;1.710384] ehci-platform: EHCI generic platform dr=
iver<br>[ &nbsp; &nbsp;1.715598] ohci_hcd: USB 1.1 'Open' Host Controller (=
OHCI) Driver<br>[ &nbsp; &nbsp;1.721741] ohci-pci: OHCI PCI platform driver=
<br>[ &nbsp; &nbsp;1.726175] ohci-platform: OHCI generic platform driver<br=
>[ &nbsp; &nbsp;1.731493] usbcore: registered new interface driver usb-stor=
age<br>[ &nbsp; &nbsp;1.737402] usbcore: registered new interface driver us=
bserial_generic<br>[ &nbsp; &nbsp;1.743876] usbserial: USB Serial support r=
egistered for generic<br>[ &nbsp; &nbsp;1.749866] usbcore: registered new i=
nterface driver cp210x<br>[ &nbsp; &nbsp;1.755414] usbserial: USB Serial su=
pport registered for cp210x<br>[ &nbsp; &nbsp;1.761327] usbcore: registered=
 new interface driver usb_serial_simple<br>[ &nbsp; &nbsp;1.767836] usbseri=
al: USB Serial support registered for carelink<br>[ &nbsp; &nbsp;1.773904] =
usbserial: USB Serial support registered for zio<br>[ &nbsp; &nbsp;1.779547=
] usbserial: USB Serial support registered for funsoft<br>[ &nbsp; &nbsp;1.=
785535] usbserial: USB Serial support registered for flashloader<br>[ &nbsp=
; &nbsp;1.791874] usbserial: USB Serial support registered for google<br>[ =
&nbsp; &nbsp;1.797776] usbserial: USB Serial support registered for libtran=
sistor<br>[ &nbsp; &nbsp;1.804286] usbserial: USB Serial support registered=
 for vivopay<br>[ &nbsp; &nbsp;1.810274] usbserial: USB Serial support regi=
stered for moto_modem<br>[ &nbsp; &nbsp;1.816526] usbserial: USB Serial sup=
port registered for motorola_tetra<br>[ &nbsp; &nbsp;1.823127] usbserial: U=
SB Serial support registered for novatel_gps<br>[ &nbsp; &nbsp;1.829469] us=
bserial: USB Serial support registered for hp4x<br>[ &nbsp; &nbsp;1.835189]=
 usbserial: USB Serial support registered for suunto<br>[ &nbsp; &nbsp;1.84=
1092] usbserial: USB Serial support registered for siemens_mpi<br>[ &nbsp; =
&nbsp;1.848500] i2c /dev entries driver<br>[ &nbsp; &nbsp;1.850968] usbcore=
: registered new interface driver i2c-tiny-usb<br>[ &nbsp; &nbsp;1.857640] =
imx-cpufreq-dt: probe of imx-cpufreq-dt failed with error -2<br>[ &nbsp; &n=
bsp;1.863865] sdhci: Secure Digital Host Controller Interface driver<br>[ &=
nbsp; &nbsp;1.869815] sdhci: Copyright(c) Pierre Ossman<br>[ &nbsp; &nbsp;1=
.874218] Synopsys Designware Multimedia Card Interface Driver<br>[ &nbsp; &=
nbsp;1.880265] sdhci-pltfm: SDHCI platform and OF driver helper<br>[ &nbsp;=
 &nbsp;1.885988] sdhci-esdhc-imx 30b40000.mmc: could not get pinctrl<br>[ &=
nbsp; &nbsp;1.922878] mmc2: SDHCI controller on 30b40000.mmc [30b40000.mmc]=
 using ADMA<br>[ &nbsp; &nbsp;1.927813] ledtrig-cpu: registered to indicate=
 activity on CPUs<br>[ &nbsp; &nbsp;1.934117] usbcore: registered new inter=
face driver usbhid<br>[ &nbsp; &nbsp;1.938650] usbhid: USB HID core driver<=
br>[ &nbsp; &nbsp;1.943182] No fsl,qman node<br>[ &nbsp; &nbsp;1.945348] Fr=
eescale USDPAA process driver<br>[ &nbsp; &nbsp;1.949525] fsl-usdpaa: no re=
gion found<br>[ &nbsp; &nbsp;1.953344] Freescale USDPAA process IRQ driver<=
br>[ &nbsp; &nbsp;1.959898] usbcore: registered new interface driver snd-us=
b-audio<br>[ &nbsp; &nbsp;1.966247] pktgen: Packet Generator for packet per=
formance testing. Version: 2.75<br>[ &nbsp; &nbsp;1.971766] drop_monitor: I=
nitializing network drop monitor service<br>[ &nbsp; &nbsp;1.977889] NET: R=
egistered protocol family 26<br>[ &nbsp; &nbsp;1.982808] NET: Registered pr=
otocol family 10<br>[ &nbsp; &nbsp;1.987363] Segment Routing with IPv6<br>[=
 &nbsp; &nbsp;1.990314] NET: Registered protocol family 17<br>[ &nbsp; &nbs=
p;1.994752] 8021q: 802.1Q VLAN Support v1.8<br>[ &nbsp; &nbsp;1.998931] lib=
80211: common routines for IEEE802.11 drivers<br>[ &nbsp; &nbsp;2.004686] 9=
pnet: Installing 9P2000 support<br>[ &nbsp; &nbsp;2.008803] tsn generic net=
link module v1 init...<br>[ &nbsp; &nbsp;2.013535] Key type dns_resolver re=
gistered<br>[ &nbsp; &nbsp;2.018325] registered taskstats version 1<br>[ &n=
bsp; &nbsp;2.021787] Loading compiled-in X.509 certificates<br>[ &nbsp; &nb=
sp;2.028774] hctosys: unable to open rtc device (rtc0)<br>[ &nbsp; &nbsp;2.=
031735] clk: Not disabling unused clocks<br>[ &nbsp; &nbsp;2.035868] ALSA d=
evice list:<br>[ &nbsp; &nbsp;2.038808] &nbsp; No soundcards found.<br>[ &n=
bsp; &nbsp;2.042235] Warning: unable to open an initial console.<br>[ &nbsp=
; &nbsp;2.047626] Waiting for root device /dev/mmcblk2p2...<br>[ &nbsp; &nb=
sp;2.095262] mmc2: new DDR MMC card at address 0001<br>[ &nbsp; &nbsp;2.097=
737] mmcblk2: mmc2:0001 DG4016 14.7 GiB<br>[ &nbsp; &nbsp;2.101934] mmcblk2=
boot0: mmc2:0001 DG4016 partition 1 4.00 MiB<br>[ &nbsp; &nbsp;2.107842] mm=
cblk2boot1: mmc2:0001 DG4016 partition 2 4.00 MiB<br>[ &nbsp; &nbsp;2.11364=
7] mmcblk2rpmb: mmc2:0001 DG4016 partition 3 4.00 MiB, chardev (237:0)<br>[=
 &nbsp; &nbsp;2.123465] &nbsp;mmcblk2: p1 p2<br>[ &nbsp; &nbsp;2.139262] EX=
T4-fs (mmcblk2p2): mounted filesystem with ordered data mode. Opts: (null)<=
br>[ &nbsp; &nbsp;2.144558] VFS: Mounted root (ext4 filesystem) on device 1=
79:2.<br>[ &nbsp; &nbsp;2.150930] devtmpfs: error mounting -2<br>[ &nbsp; &=
nbsp;2.156025] Freeing unused kernel memory: 3712K<br>[ &nbsp; &nbsp;2.1589=
06] Run /sbin/init as init process<br>[ &nbsp; &nbsp;2.162934] Run /etc/ini=
t as init process<br>[ &nbsp; &nbsp;2.166921] Run /bin/init as init process=
<br>[ &nbsp; &nbsp;2.170922] Run /bin/sh as init process<br>[ &nbsp; &nbsp;=
2.174728] Kernel panic - not syncing: No working init found.&nbsp; Try pass=
ing init=3D option to kernel. See Linux Documentation/admin-guide/init.rst =
for guidance.<br>[ &nbsp; &nbsp;2.188854] CPU: 1 PID: 1 Comm: swapper/0 Not=
 tainted 5.4.147+gbbb2e2b #1<br>[ &nbsp; &nbsp;2.195620] Hardware name: Fre=
escale i.MX8MQ EVK (DT)<br>[ &nbsp; &nbsp;2.200655] Call trace:<br>[ &nbsp;=
 &nbsp;2.203094] &nbsp;dump_backtrace+0x0/0x140<br>[ &nbsp; &nbsp;2.206734]=
 &nbsp;show_stack+0x14/0x20<br>[ &nbsp; &nbsp;2.210036] &nbsp;dump_stack+0x=
b4/0x110<br>[ &nbsp; &nbsp;2.213419] &nbsp;panic+0x158/0x360<br>[ &nbsp; &n=
bsp;2.216455] &nbsp;kernel_init+0xf0/0x108<br>[ &nbsp; &nbsp;2.219929] &nbs=
p;ret_from_fork+0x10/0x1c<br>[ &nbsp; &nbsp;2.223489] SMP: stopping seconda=
ry CPUs<br>[ &nbsp; &nbsp;2.227396] Kernel Offset: disabled<br>[ &nbsp; &nb=
sp;2.230865] CPU features: 0x0002,2000200c<br>[ &nbsp; &nbsp;2.234856] Memo=
ry Limit: none<br>[ &nbsp; &nbsp;2.237901] ---[ end Kernel panic - not sync=
ing: No working init found.&nbsp; Try passing init=3D option to kernel. See=
 Linux Documentation/admin-guide/init.rst for guidance. ]---</i></b><div></=
div><div><br></div></div><div><br></div>

<p></p>

-- <br />
You received this message because you are subscribed to the Google Groups &=
quot;Jailhouse&quot; group.<br />
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to <a href=3D"mailto:jailhouse-dev+unsubscribe@googlegroups.com">jailh=
ouse-dev+unsubscribe@googlegroups.com</a>.<br />
To view this discussion on the web visit <a href=3D"https://groups.google.c=
om/d/msgid/jailhouse-dev/c58f3a6e-a1d0-4b7e-896d-42a1ee0fa40en%40googlegrou=
ps.com?utm_medium=3Demail&utm_source=3Dfooter">https://groups.google.com/d/=
msgid/jailhouse-dev/c58f3a6e-a1d0-4b7e-896d-42a1ee0fa40en%40googlegroups.co=
m</a>.<br />

------=_Part_2937_1926537421.1653939042236--

------=_Part_2936_951805531.1653939042236--
