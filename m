Return-Path: <jailhouse-dev+bncBDVP3IWNW4CBBREP5P4QKGQER3KZ3BY@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-qv1-xf3e.google.com (mail-qv1-xf3e.google.com [IPv6:2607:f8b0:4864:20::f3e])
	by mail.lfdr.de (Postfix) with ESMTPS id E7073247069
	for <lists+jailhouse-dev@lfdr.de>; Mon, 17 Aug 2020 20:09:09 +0200 (CEST)
Received: by mail-qv1-xf3e.google.com with SMTP id f1sf11474986qvx.13
        for <lists+jailhouse-dev@lfdr.de>; Mon, 17 Aug 2020 11:09:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:date:from:to:message-id:subject:mime-version
         :x-original-sender:precedence:mailing-list:list-id:list-post
         :list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=E/QzWsJ+u6/w8Wr4eHAIInszJMFNP3XYgOISkqD6peE=;
        b=N17cF1So7q+BmVoYDwsZtTbOHbP7RKU00PNpRcrnQJWIJ7WdtwFLzEiF7p/u6LhWbC
         +6zyO9I1GS1CnODVPktWjmrWpMXK9Ni17nSRRW1a5Guc7/llG2BDvj946bMkiGAhm6bN
         E21R1A2JbwcTp4TPxHK+gaQQRD5qY/fWCLzn6oVb2o0tp8NZF5D/TiMHUp5h2IGx9nYN
         7dQW8oYfCAqIs7wkIGTiR/UX//Ft7ra4+pM9vCXixyF0E/fjSqfx6QG5xIWvickO/OeP
         qcCurZz4Apxn86+rZPaSzWR+WQMPWX9zzk3RTyoZavOVUq4nZuqs+kzKePk+gX7bVbu/
         mjYA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:message-id:subject:mime-version:x-original-sender
         :precedence:mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=E/QzWsJ+u6/w8Wr4eHAIInszJMFNP3XYgOISkqD6peE=;
        b=FIPIKMit6yFqUajm5q09HGY7L/1Il9orM4ahmK29KnSWTn5FvVXt9lQYo+AVUI+oNB
         7M3dYOgIQXzzB4DPYDZ+k0CnEa1kibEibKN/S0nkn2mpj6aPTl4fRaWNIqv48DXuWtRv
         eIMEQvGC+jYcX9l+lxgntaGKYDqumqZt3EkPmGFuPd/zF7mimOGVIpUv6IIae3WXAktV
         VR6JD7+gCTYDx93BuRPNuh/AAN4PVI5TK0hz+IU/7OLDcnsdtfs8d4Ju9LLCt9zVFGnL
         2UaYxVRXWvbPnu4GeXAtR/GTA2XhFDTe6s5sqg1TjPyApRJvI5a7NwI2WCdSZeCtdNHQ
         rvXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:date:from:to:message-id:subject
         :mime-version:x-original-sender:precedence:mailing-list:list-id
         :x-spam-checked-in-group:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=E/QzWsJ+u6/w8Wr4eHAIInszJMFNP3XYgOISkqD6peE=;
        b=fViORUvYZWqTX/T2nTCim5Y127T5CQzDnP7sVLBxZnwaQsdQHnZxiVnhcVi4nfHPoG
         ieBMnUvYFwZ95gSQEdROZrIImAnmb++mC34h9u6up06uqCxOT8oG3xlDaDVqOoOA0YI5
         crScAWKLQ8grRH9A34zWeyUV+zBiG2YUJOwHFHarIf49W1tCBzMfCjBmbNTcyGC/DTXr
         Q2NkZrcNVtOx267A3hoqNvGIAcf460vBB9DJaQbNDysyoPc44hfpSPBeKGXqj3H5I2zP
         3tS0iEvIO50vAZif+Ci+V4/qLlNFdlDy/tEBX6Mh+Up4uIEA/8veeJ+4H3vuVp7zOKoX
         mmhA==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AOAM530BVchGeUzka+tWjLOwjgXZvKcE90ngrUUQhmZn1uRIdb0ysJeC
	W3AbFRnOXv35hWjPybgBC5M=
X-Google-Smtp-Source: ABdhPJzyR8gdvCfXZol7Lknab6iH8Sq8S5Bz9F25om0mhNf7KPRSe5jtZtlH+xjg9PA0eG+aSsoI4A==
X-Received: by 2002:a05:620a:539:: with SMTP id h25mr13666518qkh.151.1597687748728;
        Mon, 17 Aug 2020 11:09:08 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a05:620a:131a:: with SMTP id o26ls8070865qkj.10.gmail; Mon,
 17 Aug 2020 11:09:08 -0700 (PDT)
X-Received: by 2002:a05:620a:2481:: with SMTP id i1mr13722940qkn.139.1597687747669;
        Mon, 17 Aug 2020 11:09:07 -0700 (PDT)
Date: Mon, 17 Aug 2020 11:09:07 -0700 (PDT)
From: Vipul Suneja <vsuneja63@gmail.com>
To: Jailhouse <jailhouse-dev@googlegroups.com>
Message-Id: <a46f55d1-2b6f-485e-8eef-71aa5eb08d92o@googlegroups.com>
Subject: imx8: issue with jailhouse on custom freescale image for imx8mq-evk
MIME-Version: 1.0
Content-Type: multipart/mixed; 
	boundary="----=_Part_864_665991048.1597687747183"
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

------=_Part_864_665991048.1597687747183
Content-Type: multipart/alternative; 
	boundary="----=_Part_865_1540480717.1597687747184"

------=_Part_865_1540480717.1597687747184
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable



Hi Peng,

=20

Thanks!

=20

I could load NXP 5.4.24 bsp image as primary & secondary linux (in non root=
=20
cell) in *imx8mq evk* target. I am trying to do the same in a custom=20
freescale image bsp 5.4.46. I could successfully add & build jailhouse 0.12=
=20
in the image, but the image boot up failed if i choose "run jh_mmcboot" in=
=20
u-boot. Image boots up fine if go normally without jh_mmcboot. Here are the=
=20
logs below, expecting some pointers from your end:























































































































































































































































































































































































































































































































*U-Boot SPL 2019.04-lf-5.4.y_v2019.04+g228843c (Jun 29 2020 - 03:06:40=20
+0000)PMIC:  PFUZE100 ID=3D0x10DDRINFO: start DRAM initDDRINFO:ddrphy=20
calibration doneDDRINFO: ddrmix config doneNormal BootTrying to boot from=
=20
MMC2U-Boot 2019.04-lf-5.4.y_v2019.04+g228843c (Jun 29 2020 - 03:06:40=20
+0000)CPU:   Freescale i.MX8MQ rev2.0 1500 MHz (running at 1000 MHz)CPU:  =
=20
Commercial temperature grade (0C to 95C) at 44CReset cause: PORModel:=20
Freescale i.MX8MQ EVKDRAM:  3 GiBTCPC:  Vendor ID [0x1fc9], Product ID=20
[0x5110], Addr [I2C0 0x50]MMC:   FSL_SDHC: 0, FSL_SDHC: 1Loading=20
Environment from MMC... *** Warning - bad CRC, using default environmentNo=
=20
panel detected: default to HDMIDisplay: HDMI (1280x720)In:    serialOut:  =
=20
serialErr:   serial BuildInfo:  - ATF 7b3389d  - U-Boot=20
2019.04-lf-5.4.y_v2019.04+g228843cswitch to partitions #0, OKmmc1 is=20
current deviceflash target is MMC:1Net:Warning: ethernet@30be0000 using MAC=
=20
address from ROMeth0: ethernet@30be0000Fastboot: NormalNormal BootHit any=
=20
key to stop autoboot:  0u-boot=3D>=20
printenvbaudrate=3D115200boot_fdt=3Dtrybootcmd=3Dmmc dev ${mmcdev}; if mmc=
=20
rescan; then if run loadbootscript; then run bootscript; else if run=20
loadimage; then run mmcboot; else run netboot; fi; fi; else booti=20
${loadaddr} - ${fdt_addr}; fibootcmd_mfg=3Drun mfgtool_args;if iminfo=20
${initrd_addr}; then if test ${tee} =3D yes; then bootm ${tee_addr}=20
${initrd_addr} ${fdt_addr}; else booti ${loadaddr} ${initrd_addr}=20
${fdt_addr}; fi; else echo "Run fastboot ..."; fastboot 0;=20
fi;bootdelay=3D2bootscript=3Decho Running bootscript from mmc ...;=20
sourceconsole=3Dttymxc0,115200=20
earlycon=3Dec_imx6q,0x30860000,115200emmc_dev=3D0ethaddr=3D00:04:9f:05:a5:9=
cethprime=3DFECfastboot_dev=3Dmmc1fdt_addr=3D0x43000000fdt_file=3Dimx8mq-ev=
k.dtbfdt_high=3D0xfffffffffffffffffdtcontroladdr=3Dfd919fe8image=3DImageini=
trd_addr=3D0x43800000initrd_high=3D0xffffffffffffffffjh_clk=3Djh_mmcboot=3D=
setenv=20
fdt_file imx8mq-evk-root.dtb; setenv jh_clk clk_ignore_unused; if run=20
loadimage; then run mmcboot; else run jh_netboot; fi;jh_netboot=3Dsetenv=20
fdt_file imx8mq-evk-root.dtb; setenv jh_clk clk_ignore_unused; run=20
netboot;kboot=3Dbootiloadaddr=3D0x40480000loadbootscript=3Dfatload mmc=20
${mmcdev}:${mmcpart} ${loadaddr} ${script};loadfdt=3Dfatload mmc=20
${mmcdev}:${mmcpart} ${fdt_addr} ${fdt_file}loadimage=3Dfatload mmc=20
${mmcdev}:${mmcpart} ${loadaddr} ${image}mfgtool_args=3Dsetenv bootargs=20
console=3D${console},${baudrate} rdinit=3D/linuxrc=20
clk_ignore_unusedmmcargs=3Dsetenv bootargs ${jh_clk} console=3D${console}=
=20
root=3D${mmcroot}mmcautodetect=3Dyesmmcboot=3Decho Booting from mmc ...; ru=
n=20
mmcargs; if test ${boot_fdt} =3D yes || test ${boot_fdt} =3D try; then if r=
un=20
loadfdt; then booti ${loadaddr} - ${fdt_addr}; else echo WARN: Cannot load=
=20
the DT; fi; else echo wait for boot;=20
fi;mmcdev=3D1mmcpart=3D1mmcroot=3D/dev/mmcblk1p2 rootwait rwnetargs=3Dseten=
v=20
bootargs ${jh_clk} console=3D${console} root=3D/dev/nfs ip=3Ddhcp=20
nfsroot=3D${serverip}:${nfsroot},v3,tcpnetboot=3Decho Booting from net ...;=
 run=20
netargs;  if test ${ip_dyn} =3D yes; then setenv get_cmd dhcp; else setenv=
=20
get_cmd tftp; fi; ${get_cmd} ${loadaddr} ${image}; if test ${boot_fdt} =3D=
=20
yes || test ${boot_fdt} =3D try; then if ${get_cmd} ${fdt_addr} ${fdt_file}=
;=20
then booti ${loadaddr} - ${fdt_addr}; else echo WARN: Cannot load the DT;=
=20
fi; else booti;=20
fi;script=3Dboot.scrsd_dev=3D1serial#=3D051a61d6f0609912soc_type=3Dimx8mqEn=
vironment=20
size: 2298/4092 bytesu-boot=3D> run jh_mmcboot26708480 bytes read in 1145 m=
s=20
(22.2 MiB/s)Booting from mmc ...44274 bytes read in 8 ms (5.3 MiB/s)##=20
Flattened Device Tree blob at 43000000   Booting using the fdt blob at=20
0x43000000   Using Device Tree in place at 0000000043000000, end=20
000000004300dcf1Starting kernel ...[    0.000000] Booting Linux on physical=
=20
CPU 0x0000000000 [0x410fd034][    0.000000] Linux version 5.4.46+g5376418=
=20
(oe-user@oe-host) (gcc version 9.3.0 (GCC)) #1 SMP PREEMPT Mon Jun 29=20
03:06:40 UTC 2020[    0.000000] Machine model: NXP i.MX8MQ EVK[   =20
0.000000] earlycon: ec_imx6q0 at MMIO 0x0000000030860000 (options=20
'115200')[    0.000000] printk: bootconsole [ec_imx6q0] enabled[   =20
0.000000] efi: Getting EFI parameters from FDT:[    0.000000] efi: UEFI not=
=20
found.[    0.000000] Reserved memory: created CMA memory pool at=20
0x0000000044000000, size 960 MiB[    0.000000] OF: reserved mem:=20
initialized node linux,cma, compatible id shared-dma-pool[    0.000000]=20
NUMA: No NUMA configuration found[    0.000000] NUMA: Faking a node at [mem=
=20
0x0000000040000000-0x00000000bfafffff][    0.000000] NUMA: NODE_DATA [mem=
=20
0xbf6d0500-0xbf6d1fff][    0.000000] Zone ranges:[    0.000000]   DMA32   =
=20
[mem 0x0000000040000000-0x00000000bfafffff][    0.000000]   Normal  =20
empty[    0.000000] Movable zone start for each node[    0.000000] Early=20
memory node ranges[    0.000000]   node   0: [mem=20
0x0000000040000000-0x00000000b7ffffff][    0.000000]   node   0: [mem=20
0x00000000b8400000-0x00000000bfafffff][    0.000000] Zeroed struct page in=
=20
unavailable ranges: 256 pages[    0.000000] Initmem setup node 0 [mem=20
0x0000000040000000-0x00000000bfafffff][    0.000000] psci: probing for=20
conduit method from DT.[    0.000000] psci: PSCIv1.1 detected in=20
firmware.[    0.000000] psci: Using standard PSCI v0.2 function IDs[   =20
0.000000] psci: Trusted OS migration not required[    0.000000] psci: SMC=
=20
Calling Convention v1.1[    0.000000] percpu: Embedded 24 pages/cpu s58840=
=20
r8192 d31272 u98304[    0.000000] Detected VIPT I-cache on CPU0[   =20
0.000000] CPU features: detected: ARM erratum 845719[    0.000000] CPU=20
features: detected: GIC system register CPU interface[    0.000000]=20
Speculative Store Bypass Disable mitigation not required[    0.000000]=20
Built 1 zonelists, mobility grouping on.  Total pages: 513812[    0.000000]=
=20
Policy zone: DMA32[    0.000000] Kernel command line: clk_ignore_unused=20
console=3Dttymxc0,115200 earlycon=3Dec_imx6q,0x30860000,115200=20
root=3D/dev/mmcblk1p2 rootwait rw[    0.000000] Dentry cache hash table=20
entries: 262144 (order: 9, 2097152 bytes, linear)[    0.000000] Inode-cache=
=20
hash table entries: 131072 (order: 8, 1048576 bytes, linear)[    0.000000]=
=20
mem auto-init: stack:off, heap alloc:off, heap free:off[    0.000000]=20
Memory: 1037220K/2087936K available (15676K kernel code, 1186K rwdata,=20
6252K rodata, 2880K init, 1012K bss, 67676K reserved, 983040K=20
cma-reserved)[    0.000000] SLUB: HWalign=3D64, Order=3D0-3, MinObjects=3D0=
,=20
CPUs=3D4, Nodes=3D1[    0.000000] rcu: Preemptible hierarchical RCU=20
implementation.[    0.000000] rcu:     RCU restricting CPUs from=20
NR_CPUS=3D256 to nr_cpu_ids=3D4.[    0.000000]  Tasks RCU enabled.[   =20
0.000000] rcu: RCU calculated value of scheduler-enlistment delay is 25=20
jiffies.[    0.000000] rcu: Adjusting geometry for rcu_fanout_leaf=3D16,=20
nr_cpu_ids=3D4[    0.000000] NR_IRQS: 64, nr_irqs: 64, preallocated irqs:=
=20
0[    0.000000] GICv3: GIC: Using split EOI/Deactivate mode[    0.000000]=
=20
GICv3: 128 SPIs implemented[    0.000000] GICv3: 0 Extended SPIs=20
implemented[    0.000000] GICv3: Distributor has no Range Selector=20
support[    0.000000] GICv3: 16 PPIs implemented[    0.000000] GICv3: no=20
VLPI support, no direct LPI support[    0.000000] GICv3: CPU0: found=20
redistributor 0 region 0:0x0000000038880000[    0.000000] ITS: No ITS=20
available, not enabling LPIs[    0.000000] random: get_random_bytes called=
=20
from start_kernel+0x2b8/0x44c with crng_init=3D0[    0.000000] arch_timer:=
=20
cp15 timer(s) running at 8.33MHz (phys).[    0.000000] clocksource:=20
arch_sys_counter: mask: 0xffffffffffffff max_cycles: 0x1ec0311ec,=20
max_idle_ns: 440795202152 ns[    0.000004] sched_clock: 56 bits at 8MHz,=20
resolution 120ns, wraps every 2199023255541ns[    0.008522] Console: colour=
=20
dummy device 80x25[    0.012540] Calibrating delay loop (skipped), value=20
calculated using timer frequency.. 16.66 BogoMIPS (lpj=3D33333)[    0.02276=
7]=20
pid_max: default: 32768 minimum: 301[    0.027466] LSM: Security Framework=
=20
initializing[    0.032057] Smack:  Initializing.[    0.035314] Smack:  IPv6=
=20
port labeling enabled.[    0.039903] Mount-cache hash table entries: 4096=
=20
(order: 3, 32768 bytes, linear)[    0.047278] Mountpoint-cache hash table=
=20
entries: 4096 (order: 3, 32768 bytes, linear)[    0.079192] ASID allocator=
=20
initialised with 32768 entries[    0.087188] rcu: Hierarchical SRCU=20
implementation.[    0.096133] EFI services will not be available.[   =20
0.103219] smp: Bringing up secondary CPUs ...[    0.135392] Detected VIPT=
=20
I-cache on CPU1[    0.135420] GICv3: CPU1: found redistributor 1 region=20
0:0x00000000388a0000[    0.135444] CPU1: Booted secondary processor=20
0x0000000001 [0x410fd034][    0.167418] Detected VIPT I-cache on CPU2[   =
=20
0.167434] GICv3: CPU2: found redistributor 2 region=20
0:0x00000000388c0000[    0.167450] CPU2: Booted secondary processor=20
0x0000000002 [0x410fd034][    0.199475] Detected VIPT I-cache on CPU3[   =
=20
0.199491] GICv3: CPU3: found redistributor 3 region=20
0:0x00000000388e0000[    0.199508] CPU3: Booted secondary processor=20
0x0000000003 [0x410fd034][    0.199574] smp: Brought up 1 node, 4 CPUs[   =
=20
0.253145] SMP: Total of 4 processors activated.[    0.257849] CPU features:=
=20
detected: 32-bit EL0 Support[    0.263005] CPU features: detected: CRC32=20
instructions[    0.276060] CPU: All CPU(s) started at EL2[    0.277324]=20
alternatives: patching kernel code[    0.283321] devtmpfs: initialized[   =
=20
0.291775] clocksource: jiffies: mask: 0xffffffff max_cycles: 0xffffffff,=20
max_idle_ns: 7645041785100000 ns[    0.298700] futex hash table entries:=20
1024 (order: 4, 65536 bytes, linear)[    0.334050] pinctrl core:=20
initialized pinctrl subsystem[    0.337229] DMI not present or invalid.[   =
=20
0.340553] NET: Registered protocol family 16[    0.357311] DMA:=20
preallocated 256 KiB pool for atomic allocations[    0.360565] audit:=20
initializing netlink subsys (disabled)[    0.366096] audit: type=3D2000=20
audit(0.316:1): state=3Dinitialized audit_enabled=3D0 res=3D1[    0.373754]=
=20
cpuidle: using governor menu[    0.378251] hw-breakpoint: found 6=20
breakpoint and 4 watchpoint registers.[    0.385345] Serial: AMBA PL011=20
UART driver[    0.388621] imx mu driver is registered.[    0.392485] imx=20
rpmsg driver is registered.[    0.400586] imx8mq-pinctrl 30330000.iomuxc:=
=20
initialized IMX pinctrl driver[    0.426581] HugeTLB registered 1.00 GiB=20
page size, pre-allocated 0 pages[    0.430457] HugeTLB registered 32.0 MiB=
=20
page size, pre-allocated 0 pages[    0.437159] HugeTLB registered 2.00 MiB=
=20
page size, pre-allocated 0 pages[    0.443872] HugeTLB registered 64.0 KiB=
=20
page size, pre-allocated 0 pages[    0.452450] cryptd: max_cpu_qlen set to=
=20
1000[    0.460740] ACPI: Interpreter disabled.[    0.466072] iommu: Default=
=20
domain type: Translated[    0.468237] vgaarb: loaded[    0.471117] SCSI=20
subsystem initialized[    0.475173] usbcore: registered new interface=20
driver usbfs[    0.480083] usbcore: registered new interface driver hub[   =
=20
0.485433] usbcore: registered new device driver usb[    0.491493] mc: Linux=
=20
media interface: v0.10[    0.494724] videodev: Linux video capture=20
interface: v2.00[    0.500256] pps_core: LinuxPPS API ver. 1 registered[   =
=20
0.505160] pps_core: Software ver. 5.3.6 - Copyright 2005-2007 Rodolfo=20
Giometti <giometti@linux.it>[    0.514325] PTP clock support registered[   =
=20
0.518379] EDAC MC: Ver: 3.0.0[    0.522183] No BMan portals available![   =
=20
0.525459] QMan: Allocated lookup table at (____ptrval____), entry count=20
65537[    0.532766] No QMan portals available![    0.536666] No USDPAA=20
memory, no 'fsl,usdpaa-mem' in device-tree[    0.542598] FPGA manager=20
framework[    0.545690] Advanced Linux Sound Architecture Driver=20
Initialized.[    0.552115] NetLabel: Initializing[    0.555118] NetLabel: =
=20
domain hash size =3D 128[    0.559486] NetLabel:  protocols =3D UNLABELED=
=20
CIPSOv4 CALIPSO[    0.565202] NetLabel:  unlabeled traffic allowed by=20
default[    0.571430] clocksource: Switched to clocksource=20
arch_sys_counter[    0.577005] VFS: Disk quotas dquot_6.6.0[    0.580819]=
=20
VFS: Dquot-cache hash table entries: 512 (order 0, 4096 bytes)[   =20
0.587831] pnp: PnP ACPI: disabled[    0.597738] thermal_sys: Registered=20
thermal governor 'step_wise'[    0.597741] thermal_sys: Registered thermal=
=20
governor 'power_allocator'[    0.601226] NET: Registered protocol family=20
2[    0.612156] tcp_listen_portaddr_hash hash table entries: 1024 (order:=
=20
2, 16384 bytes, linear)[    0.620396] TCP established hash table entries:=
=20
16384 (order: 5, 131072 bytes, linear)[    0.628412] TCP bind hash table=20
entries: 16384 (order: 6, 262144 bytes, linear)[    0.635849] TCP: Hash=20
tables configured (established 16384 bind 16384)[    0.642240] UDP hash=20
table entries: 1024 (order: 3, 32768 bytes, linear)[    0.648911] UDP-Lite=
=20
hash table entries: 1024 (order: 3, 32768 bytes, linear)[    0.656160] NET:=
=20
Registered protocol family 1[    0.660772] RPC: Registered named UNIX=20
socket transport module.[    0.666312] RPC: Registered udp transport=20
module.[    0.671012] RPC: Registered tcp transport module.[    0.675722]=
=20
RPC: Registered tcp NFSv4.1 backchannel transport module.[    0.682555]=20
PCI: CLS 0 bytes, default 64[    0.686877] hw perfevents: enabled with=20
armv8_cortex_a53 PMU driver, 7 counters available[    0.694656] kvm [1]:=20
IPA Size Limit: 40bits[    0.699184] kvm [1]: vgic-v2@31020000[   =20
0.702163] kvm [1]: GIC system register CPU interface enabled[    0.708049]=
=20
kvm [1]: vgic interrupt IRQ1[    0.712020] kvm [1]: Hyp mode initialized=20
successfully[    0.722834] Initialise system trusted keyrings[    0.724541]=
=20
workingset: timestamp_bits=3D44 max_order=3D19 bucket_order=3D0[    0.73725=
8]=20
squashfs: version 4.0 (2009/01/31) Phillip Lougher[    0.740896] NFS:=20
Registering the id_resolver key type[    0.745333] Key type id_resolver=20
registered[    0.749491] Key type id_legacy registered[    0.753510]=20
nfs4filelayout_init: NFSv4 File Layout Driver Registering...[    0.760234]=
=20
jffs2: version 2.2. (NAND) =C2=A9 2001-2006 Red Hat, Inc.[    0.766703] 9p:=
=20
Installing v9fs 9p2000 file system support[    0.787998] Key type=20
asymmetric registered[    0.789236] Asymmetric key parser 'x509'=20
registered[    0.794162] Block layer SCSI generic (bsg) driver version 0.4=
=20
loaded (major 244)[    0.801543] io scheduler mq-deadline registered[   =20
0.806072] io scheduler kyber registered[    0.814902] EINJ: ACPI=20
disabled.[    0.823000] imx-sdma 302c0000.sdma: Direct firmware load for=20
imx/sdma/sdma-imx7d.bin failed with error -2[    0.829836] imx-sdma=20
302c0000.sdma: Direct firmware load for imx/sdma/sdma-imx7d.bin failed with=
=20
error -2[    0.834079] mxs-dma 33000000.dma-apbh: initialized[    0.839348]=
=20
imx-sdma 302c0000.sdma: external firmware not found, using ROM firmware[   =
=20
0.844225] imx-sdma 30bd0000.sdma: Direct firmware load for=20
imx/sdma/sdma-imx7d.bin failed with error -2[    0.854814] Bus freq driver=
=20
module loaded[    0.861404] imx-sdma 30bd0000.sdma: external firmware not=
=20
found, using ROM firmware[    0.877597] Serial: 8250/16550 driver, 4 ports,=
=20
IRQ sharing enabled[    0.883159] 30860000.serial: ttymxc0 at MMIO=20
0x30860000 (irq =3D 30, base_baud =3D 1562500) is a IMX[    0.889886] print=
k:=20
console [ttymxc0] enabled[    0.889886] printk: console [ttymxc0]=20
enabled[    0.898532] printk: bootconsole [ec_imx6q0] disabled[   =20
0.898532] printk: bootconsole [ec_imx6q0] disabled[    0.908931]=20
30880000.serial: ttymxc2 at MMIO 0x30880000 (irq =3D 31, base_baud =3D 5000=
000)=20
is a IMX[    0.928199] imx-dcss 32e00000.display-controller: ctxld: can't=
=20
get irq number[    0.935434] imx-dcss 32e00000.display-controller:=20
submodules initialization failed[    0.953837] loop: module loaded[   =20
0.959117] imx ahci driver is registered.[    0.966058] spi-nor spi3.0:=20
n25q256a (32768 Kbytes)[    0.977852] libphy: Fixed MDIO Bus: probed[   =20
0.982771] tun: Universal TUN/TAP device driver, 1.6[    0.988585]=20
thunder_xcv, ver 1.0[    0.991857] thunder_bgx, ver 1.0[    0.995114]=20
nicpf, ver 1.0[    0.998573] pps pps0: new PPS source ptp0[    1.008325]=20
libphy: fec_enet_mii_bus: probed[    1.013751] fec 30be0000.ethernet eth0:=
=20
registered PHC device 0[    1.020325] Freescale FM module, FMD API version=
=20
21.1.0[    1.025834] Freescale FM Ports module[    1.029506] fsl_mac:=20
fsl_mac: FSL FMan MAC API based driver[    1.035250] fsl_dpa: FSL DPAA=20
Ethernet driver[    1.039728] fsl_advanced: FSL DPAA Advanced drivers:[   =
=20
1.044701] fsl_proxy: FSL DPAA Proxy initialization driver[    1.050388]=20
fsl_oh: FSL FMan Offline Parsing port driver[    1.056656] hclge is=20
initializing[    1.059982] hns3: Hisilicon Ethernet Network Driver for=20
Hip08 Family - version[    1.067209] hns3: Copyright (c) 2017 Huawei=20
Corporation.[    1.072568] e1000: Intel(R) PRO/1000 Network Driver -=20
version 7.3.21-k8-NAPI[    1.079623] e1000: Copyright (c) 1999-2006 Intel=
=20
Corporation.[    1.085406] e1000e: Intel(R) PRO/1000 Network Driver -=20
3.2.6-k[    1.091244] e1000e: Copyright(c) 1999 - 2015 Intel=20
Corporation.[    1.097209] igb: Intel(R) Gigabit Ethernet Network Driver -=
=20
version 5.6.0-k[    1.104182] igb: Copyright (c) 2007-2014 Intel=20
Corporation.[    1.109793] igbvf: Intel(R) Gigabit Virtual Function Network=
=20
Driver - version 2.4.0-k[    1.117629] igbvf: Copyright (c) 2009 - 2012=20
Intel Corporation.[    1.123712] sky2: driver version 1.30[    1.127882]=20
VFIO - User Level meta-driver version: 0.3[    1.135376] ehci_hcd: USB 2.0=
=20
'Enhanced' Host Controller (EHCI) Driver[    1.141924] ehci-pci: EHCI PCI=
=20
platform driver[    1.146429] ehci-platform: EHCI generic platform=20
driver[    1.151848] ohci_hcd: USB 1.1 'Open' Host Controller (OHCI)=20
Driver[    1.158049] ohci-pci: OHCI PCI platform driver[    1.162530]=20
ohci-platform: OHCI generic platform driver[    1.168360] usbcore:=20
registered new interface driver usb-storage[    1.174444] usbcore:=20
registered new interface driver usbserial_generic[    1.180996] usbserial:=
=20
USB Serial support registered for generic[    1.189781] input:=20
30370000.snvs:snvs-powerkey as=20
/devices/platform/soc@0/soc@0:bus@30000000/30370000.snvs/30370000.snvs:snvs=
-powerkey/input/input0[   =20
1.205063] snvs_rtc 30370000.snvs:snvs-rtc-lp: registered as rtc0[   =20
1.211353] i2c /dev entries driver[    1.215126] usbcore: registered new=20
interface driver i2c-tiny-usb[    1.221581] mxc-mipi-csi2_yav=20
30a70000.mipi_csi1: mipi_csi2_probe[    1.227739] mxc-mipi-csi2_yav=20
30a70000.mipi_csi: Remote device at endpoint@0 XXX found[    1.235677]=20
mxc-mipi-csi2_yav 30a70000.mipi_csi1: lanes: 2, name: mxc-mipi-csi2.0[   =
=20
1.243361] mxc-mipi-csi2_yav 30b60000.mipi_csi2: mipi_csi2_probe[   =20
1.249505] mxc-mipi-csi2_yav 30b60000.mipi_csi: Remote device at endpoint@0=
=20
XXX found[    1.257441] mxc-mipi-csi2_yav 30b60000.mipi_csi2: lanes: 2,=20
name: mxc-mipi-csi2.1[    1.265159] mx6s-csi 30a90000.csi1_bridge:=20
initialising[    1.270589] CSI: Registered sensor subdevice:=20
mxc-mipi-csi2.0[    1.276411] mx6s-csi 30b80000.csi2_bridge:=20
initialising[    1.281826] CSI: Registered sensor subdevice:=20
mxc-mipi-csi2.1[    1.289998] imx2-wdt 30280000.watchdog: timeout 60 sec=20
(nowayout=3D0)[    1.298423] sdhci: Secure Digital Host Controller Interfac=
e=20
driver[    1.304616] sdhci: Copyright(c) Pierre Ossman[    1.309175]=20
Synopsys Designware Multimedia Card Interface Driver[    1.315843]=20
sdhci-pltfm: SDHCI platform and OF driver helper[    1.323883] ledtrig-cpu:=
=20
registered to indicate activity on CPUs[    1.330891] caam 30900000.crypto:=
=20
device ID =3D 0x0a16040100000000 (Era 9)[    1.337606] caam 30900000.crypto=
:=20
job rings =3D 3, qi =3D 0[    1.360416] caam algorithms registered in=20
/proc/crypto[    1.367539] caam 30900000.crypto: caam pkc algorithms=20
registered in /proc/crypto[    1.377087] caam_jr 30901000.jr: registering=
=20
rng-caam[    1.387843] caam-snvs 30370000.caam-snvs: can't get snvs=20
clock[    1.393752] caam-snvs 30370000.caam-snvs: violation handlers armed=
=20
- non-secure state[    1.402639] usbcore: registered new interface driver=
=20
usbhid[    1.408224] usbhid: USB HID core driver[    1.413532] No fsl,qman=
=20
node[    1.416435] Freescale USDPAA process driver[    1.420626]=20
fsl-usdpaa: no region found[    1.424469] Freescale USDPAA process IRQ=20
driver[    1.430987] optee: probing for conduit method from DT.[   =20
1.436166] optee: revision 3.2 (6d99b525)[    1.436539] optee: initialized=
=20
driver[    1.445920] usbcore: registered new interface driver=20
snd-usb-audio[    1.453063] wm8524-codec audio-codec: Failed to get mute=20
line: -517[    1.486304] imx-spdif sound-spdif: snd-soc-dummy-dai <->=20
30810000.spdif mapping ok[    1.493915] imx-spdif sound-spdif: ASoC: no DMI=
=20
vendor name![    1.501906] imx-spdif sound-hdmi-arc: snd-soc-dummy-dai <->=
=20
308a0000.spdif mapping ok[    1.509762] imx-spdif sound-hdmi-arc: ASoC: no=
=20
DMI vendor name![    1.516844] imx-ak4458 sound-ak4458: ASoC: failed to=20
init link ak4458: -517[    1.523828] imx-ak4458 sound-ak4458:=20
snd_soc_register_card failed (-517)[    1.530748] imx-ak5558 sound-ak5558:=
=20
ASoC: failed to init link ak5558: -517[    1.537723] imx-ak5558=20
sound-ak5558: snd_soc_register_card failed (-517)[    1.545045] imx-cdnhdmi=
=20
sound-hdmi: ASoC: failed to init link imx8 hdmi: -517[    1.552197]=20
imx-cdnhdmi sound-hdmi: snd_soc_register_card failed (-517)[    1.559023]=
=20
NET: Registered protocol family 26[    1.564089] NET: Registered protocol=
=20
family 10[    1.569318] Segment Routing with IPv6[    1.573059] NET:=20
Registered protocol family 17[    1.577557] 8021q: 802.1Q VLAN Support=20
v1.8[    1.581766] lib80211: common routines for IEEE802.11 drivers[   =20
1.587538] 9pnet: Installing 9P2000 support[    1.591848] tsn generic=20
netlink module v1 init...[    1.596616] Key type dns_resolver=20
registered[    1.601386] registered taskstats version 1[    1.605502]=20
Loading compiled-in X.509 certificates[    1.633069] GPIO line 157=20
(wl-reg-on) hogged as output/high[    1.640962] ov5640_mipi 0-003c: No=20
sensor reset pin available[    1.646750] ov5640_mipi 0-003c: 0-003c supply=
=20
DOVDD not found, using dummy regulator[    1.654559] ov5640_mipi 0-003c:=20
0-003c supply DVDD not found, using dummy regulator[    1.662275]=20
ov5640_mipi 0-003c: 0-003c supply AVDD not found, using dummy regulator[   =
=20
1.679749] ov5640_mipi 0-003c: Read reg error: reg=3D300a[    1.685074]=20
ov5640_mipi 0-003c: Camera is not found[    1.691643] pfuze100-regulator=20
0-0008: Full layer: 2, Metal layer: 1[    1.698651] pfuze100-regulator=20
0-0008: FAB: 0, FIN: 0[    1.703724] pfuze100-regulator 0-0008: pfuze100=20
found.[    1.726433] i2c i2c-0: IMX I2C adapter registered[    1.731962]=20
ov5640_mipi 1-003c: No sensor reset pin available[    1.737751] ov5640_mipi=
=20
1-003c: 1-003c supply DOVDD not found, using dummy regulator[    1.745564]=
=20
ov5640_mipi 1-003c: 1-003c supply DVDD not found, using dummy regulator[   =
=20
1.753279] ov5640_mipi 1-003c: 1-003c supply AVDD not found, using dummy=20
regulator[    1.806172] random: fast init done[    2.923484]=20
mxc-mipi-csi2_yav 30a70000.mipi_csi: Registered sensor subdevice:=20
ov5640_mipi 1-003c[    2.933515] ov5640_mipi 1-003c: Camera is found[   =20
2.938098] i2c i2c-1: IMX I2C adapter registered[    2.943625] ak4458=20
2-0010: 2-0010 supply DVDD not found, using dummy regulator[    2.950922]=
=20
ak4458 2-0010: 2-0010 supply AVDD not found, using dummy regulator[   =20
2.958539] ak4458 2-0012: 2-0012 supply DVDD not found, using dummy=20
regulator[    2.965819] ak4458 2-0012: 2-0012 supply AVDD not found, using=
=20
dummy regulator[    2.973434] ak5558 2-0013: 2-0013 supply DVDD not found,=
=20
using dummy regulator[    2.980712] ak5558 2-0013: 2-0013 supply AVDD not=
=20
found, using dummy regulator[    2.988334] ak4458 2-0011: 2-0011 supply=20
DVDD not found, using dummy regulator[    2.995613] ak4458 2-0011: 2-0011=
=20
supply AVDD not found, using dummy regulator[    3.002965] i2c i2c-2: IMX=
=20
I2C adapter registered[    3.008171] imx8mq-usb-phy 381f0040.usb-phy:=20
381f0040.usb-phy supply vbus not found, using dummy regulator[    3.018106]=
=20
imx8mq-usb-phy 382f0040.usb-phy: 382f0040.usb-phy supply vbus not found,=20
using dummy regulator[    3.029780] imx6q-pcie 33c00000.pcie: 33c00000.pcie=
=20
supply epdev_on not found, using dummy regulator[    3.039413] imx6q-pcie=
=20
33c00000.pcie: host bridge /soc@0/pcie@33c00000 ranges:[    3.044136] [drm]=
=20
Supports vblank timestamp caching Rev 2 (21.10.2013).[    3.046671]=20
imx6q-pcie 33c00000.pcie:   No bus range found for /soc@0/pcie@33c00000,=20
using [bus 00-ff][    3.053283] [drm] No driver support for vblank=20
timestamp query.[    3.062595] imx6q-pcie 33c00000.pcie:    IO=20
0x27f80000..0x27f8ffff -> 0x00000000[    3.069011] cdns-mhdp-imx=20
32c00000.hdmi: lane-mapping 0xe4[    3.075912] imx6q-pcie 33c00000.pcie:  =
=20
MEM 0x20000000..0x27efffff -> 0x20000000[    3.083339] imx-dcss=20
32e00000.display-controller: bound 32c00000.hdmi (ops=20
cdns_mhdp_imx_ops)[    3.097656] [drm] Initialized imx-dcss 1.0.0 20190917=
=20
for 32e00000.display-controller on minor 0[    3.132030] cdns-mhdp-imx=20
32c00000.hdmi: 0,ff,ff,ff,ff,ff,ff,0[    3.169065] cdns-mhdp-imx=20
32c00000.hdmi: 0,ff,ff,ff,ff,ff,ff,0[    3.169698] [drm] Mode:=20
1920x1080p148500[    3.195465] [drm] Pixel clock: 148500 KHz, character=20
clock: 222750, bpc is 12-bit.[    3.195469] [drm] VCO frequency is 4455000=
=20
KHz[    3.272634] [drm] Sink Not Support SCDC[    3.273850] [drm] No vendor=
=20
infoframe[    3.370041] Console: switching to colour frame buffer device=20
240x67[    3.437224] imx-dcss 32e00000.display-controller: fb0:=20
imx-dcssdrmfb frame buffer device[    3.446394] OF: graph: no port node=20
found in /soc@0/usb-phy@381f0040[    3.453792] xhci-hcd xhci-hcd.1.auto:=20
xHCI Host Controller[    3.459305] xhci-hcd xhci-hcd.1.auto: new USB bus=20
registered, assigned bus number 1[    3.467089] xhci-hcd xhci-hcd.1.auto:=
=20
hcc params 0x0220fe6c hci version 0x110 quirks 0x0000000001010010[   =20
3.476536] xhci-hcd xhci-hcd.1.auto: irq 53, io mem 0x38200000[    3.483222]=
=20
hub 1-0:1.0: USB hub found[    3.487007] hub 1-0:1.0: 1 port detected[   =
=20
3.491188] xhci-hcd xhci-hcd.1.auto: xHCI Host Controller[    3.496691]=20
xhci-hcd xhci-hcd.1.auto: new USB bus registered, assigned bus number 2[   =
=20
3.504364] xhci-hcd xhci-hcd.1.auto: Host supports USB 3.0 SuperSpeed[   =20
3.510941] usb usb2: We don't know the algorithms for LPM for this host,=20
disabling LPM.[    3.519499] hub 2-0:1.0: USB hub found[    3.523268] hub=
=20
2-0:1.0: 1 port detected[    3.528323] imx-cpufreq-dt imx-cpufreq-dt: cpu=
=20
speed grade 3 mkt segment 0 supported-hw 0x8 0x1[    3.539043]=20
sdhci-esdhc-imx 30b50000.mmc: Got CD GPIO[    3.575349] mmc0: SDHCI=20
controller on 30b50000.mmc [30b50000.mmc] using ADMA[    3.585291]=20
hantrodec: module inserted. Major =3D 236[    3.591996] debugfs: Directory=
=20
'308b0000.sai' with parent 'wm8524-audio' already present![    3.600264]=20
asoc-simple-card sound-wm8524: wm8524-hifi <-> 308b0000.sai mapping ok[   =
=20
3.607858] asoc-simple-card sound-wm8524: ASoC: no DMI vendor name![   =20
3.617751] ak4458 2-0010: ASoC: failed to probe component -6[    3.623573]=
=20
imx-ak4458 sound-ak4458: ASoC: failed to instantiate card -6[    3.630361]=
=20
imx-ak4458 sound-ak4458: snd_soc_register_card failed (-6)[    3.637686]=20
ak5558 2-0013: ASoC: failed to probe component -6[    3.643461] imx-ak5558=
=20
sound-ak5558: ASoC: failed to instantiate card -6[    3.650216] imx-ak5558=
=20
sound-ak5558: snd_soc_register_card failed (-6)[    3.657254] debugfs:=20
Directory '30050000.sai' with parent 'imx-audio-hdmi' already present![   =
=20
3.665679] imx-cdnhdmi sound-hdmi: i2s-hifi <-> 30050000.sai mapping ok[   =
=20
3.672416] imx-cdnhdmi sound-hdmi: ASoC: no DMI vendor name![    3.678210]=
=20
debugfs: File 'Capture' in directory 'dapm' already present![    3.698013]=
=20
imx6q-pcie 33800000.pcie: 33800000.pcie supply epdev_on not found, using=20
dummy regulator[    3.707158] snvs_rtc 30370000.snvs:snvs-rtc-lp: setting=
=20
system clock to 1970-01-01T00:00:02 UTC (2)[    3.707407] imx6q-pcie=20
33800000.pcie: host bridge /soc@0/pcie@33800000 ranges:[    3.716550]=20
cfg80211: Loading compiled-in X.509 certificates for regulatory=20
database[    3.723475] imx6q-pcie 33800000.pcie:    IO=20
0x1ff80000..0x1ff8ffff -> 0x00000000[    3.733066] cfg80211: Loaded X.509=
=20
cert 'sforshee: 00b28ddf47aef9cea7'[    3.738615] imx6q-pcie=20
33800000.pcie:   MEM 0x18000000..0x1fefffff -> 0x18000000[    3.745173]=20
platform regulatory.0: Direct firmware load for regulatory.db failed with=
=20
error -2[    3.752535] clk: Not disabling unused clocks[    3.761138]=20
cfg80211: failed to load regulatory.db[    3.770254] ALSA device list:[   =
=20
3.773235]   #0: imx-spdif[    3.776064]   #1: imx-hdmi-arc[    3.779128]  =
=20
#2: wm8524-audio[    3.782202]   #3: imx-audio-hdmi[    3.823443] usb 1-1:=
=20
new high-speed USB device number 2 using xhci-hcd[    3.828497] mmc0: host=
=20
does not support reading read-only switch, assuming write-enable[   =20
3.840091] mmc0: new high speed SDHC card at address 59b4[    3.846085]=20
mmcblk0: mmc0:59b4 SMI   29.5 GiB[    3.855880]  mmcblk0: p1 p2[   =20
3.959531] imx6q-pcie 33800000.pcie: Link up[    3.963910] imx6q-pcie=20
33800000.pcie: Link up[    3.968286] imx6q-pcie 33800000.pcie: Link up,=20
Gen1[    3.973386] imx6q-pcie 33800000.pcie: PCI host bridge to bus=20
0000:00[    3.979750] pci_bus 0000:00: root bus resource [bus 00-ff][   =20
3.985243] pci_bus 0000:00: root bus resource [io  0x10000-0x1ffff] (bus=20
address [0x0000-0xffff])[    3.994209] pci_bus 0000:00: root bus resource=
=20
[mem 0x18000000-0x1fefffff][    4.001119] pci 0000:00:00.0: [16c3:abcd]=20
type 01 class 0x060400[    4.007146] pci 0000:00:00.0: reg 0x10: [mem=20
0x00000000-0x000fffff][    4.013435] pci 0000:00:00.0: reg 0x38: [mem=20
0x00000000-0x0000ffff pref][    4.020179] pci 0000:00:00.0: supports D1[   =
=20
4.023054] hub 1-1:1.0: USB hub found[    4.024204] pci 0000:00:00.0: PME#=
=20
supported from D0 D1 D3hot D3cold[    4.027986] hub 1-1:1.0: 4 ports=20
detected[    4.036217] pci 0000:01:00.0: [168c:003e] type 00 class=20
0x028000[    4.044416] pci 0000:01:00.0: reg 0x10: [mem=20
0x00000000-0x001fffff 64bit][    4.051511] pci 0000:01:00.0: PME# supported=
=20
from D0 D3hot D3cold[    4.069887] pci 0000:00:00.0: BAR 14: assigned [mem=
=20
0x18000000-0x181fffff][    4.076778] pci 0000:00:00.0: BAR 0: assigned [mem=
=20
0x18200000-0x182fffff][    4.083700] pci 0000:00:00.0: BAR 6: assigned [mem=
=20
0x18300000-0x1830ffff pref][    4.090930] pci 0000:01:00.0: BAR 0: assigned=
=20
[mem 0x18000000-0x181fffff 64bit][    4.098269] pci 0000:00:00.0: PCI=20
bridge to [bus 01-ff][    4.103502] pci 0000:00:00.0:   bridge window [mem=
=20
0x18000000-0x181fffff][    4.110584] pcieport 0000:00:00.0: PME: Signaling=
=20
with IRQ 232[    4.116617] pcieport 0000:00:00.0: AER: enabled with IRQ=20
232[    4.194272] imx6q-pcie 33c00000.pcie: Phy link never came up[   =20
4.199975] imx6q-pcie 33c00000.pcie: failed to initialize host[    4.205916]=
=20
imx6q-pcie 33c00000.pcie: unable to add pcie port.[    4.212755] Waiting=20
for root device /dev/mmcblk1p2...[    4.423473] usb 1-1.2: new high-speed=
=20
USB device number 3 using xhci-hcd*

--=20
You received this message because you are subscribed to the Google Groups "=
Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/=
jailhouse-dev/a46f55d1-2b6f-485e-8eef-71aa5eb08d92o%40googlegroups.com.

------=_Part_865_1540480717.1597687747184
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><p>Hi Peng,</p><p style=3D"min-height: 8pt; padding: 0px;"=
>=C2=A0</p><p>Thanks!</p><p style=3D"min-height: 8pt; padding: 0px;">=C2=A0=
</p><p>I could load NXP 5.4.24 bsp image as primary &amp; secondary linux (=
in non root cell) in <strong>imx8mq evk</strong>
 target. I am trying to do the same in a custom freescale image bsp=20
5.4.46. I could successfully add &amp; build jailhouse 0.12 in the=20
image, but the image boot up failed if i choose &quot;run jh_mmcboot&quot; =
in=20
u-boot. Image boots up fine if go normally without jh_mmcboot. Here are=20
the logs below, expecting some pointers from your end:</p><p><br></p><p><b>=
U-Boot SPL 2019.04-lf-5.4.y_v2019.04+g228843c (Jun 29 2020 - 03:06:40 +0000=
)<br>PMIC:=C2=A0 PFUZE100 ID=3D0x10<br>DDRINFO: start DRAM init<br>DDRINFO:=
ddrphy calibration done<br>DDRINFO: ddrmix config done<br>Normal Boot<br>Tr=
ying to boot from MMC2<br><br><br>U-Boot 2019.04-lf-5.4.y_v2019.04+g228843c=
 (Jun 29 2020 - 03:06:40 +0000)<br><br>CPU:=C2=A0=C2=A0 Freescale i.MX8MQ r=
ev2.0 1500 MHz (running at 1000 MHz)<br>CPU:=C2=A0=C2=A0 Commercial tempera=
ture grade (0C to 95C) at 44C<br>Reset cause: POR<br>Model: Freescale i.MX8=
MQ EVK<br>DRAM:=C2=A0 3 GiB<br>TCPC:=C2=A0 Vendor ID [0x1fc9], Product ID [=
0x5110], Addr [I2C0 0x50]<br>MMC:=C2=A0=C2=A0 FSL_SDHC: 0, FSL_SDHC: 1<br>L=
oading Environment from MMC... *** Warning - bad CRC, using default environ=
ment<br><br>No panel detected: default to HDMI<br>Display: HDMI (1280x720)<=
br>In:=C2=A0=C2=A0=C2=A0 serial<br>Out:=C2=A0=C2=A0 serial<br>Err:=C2=A0=C2=
=A0 serial<br><br>=C2=A0BuildInfo:<br>=C2=A0 - ATF 7b3389d<br>=C2=A0 - U-Bo=
ot 2019.04-lf-5.4.y_v2019.04+g228843c<br><br>switch to partitions #0, OK<br=
>mmc1 is current device<br>flash target is MMC:1<br>Net:<br>Warning: ethern=
et@30be0000 using MAC address from ROM<br>eth0: ethernet@30be0000<br>Fastbo=
ot: Normal<br>Normal Boot<br>Hit any key to stop autoboot:=C2=A0 0<br>u-boo=
t=3D&gt; printenv<br>baudrate=3D115200<br>boot_fdt=3Dtry<br>bootcmd=3Dmmc d=
ev ${mmcdev}; if mmc rescan; then if run loadbootscript; then run bootscrip=
t; else if run loadimage; then run mmcboot; else run netboot; fi; fi; else =
booti ${loadaddr} - ${fdt_addr}; fi<br>bootcmd_mfg=3Drun mfgtool_args;if im=
info ${initrd_addr}; then if test ${tee} =3D yes; then bootm ${tee_addr} ${=
initrd_addr} ${fdt_addr}; else booti ${loadaddr} ${initrd_addr} ${fdt_addr}=
; fi; else echo &quot;Run fastboot ...&quot;; fastboot 0; fi;<br>bootdelay=
=3D2<br>bootscript=3Decho Running bootscript from mmc ...; source<br>consol=
e=3Dttymxc0,115200 earlycon=3Dec_imx6q,0x30860000,115200<br>emmc_dev=3D0<br=
>ethaddr=3D00:04:9f:05:a5:9c<br>ethprime=3DFEC<br>fastboot_dev=3Dmmc1<br>fd=
t_addr=3D0x43000000<br>fdt_file=3Dimx8mq-evk.dtb<br>fdt_high=3D0xffffffffff=
ffffff<br>fdtcontroladdr=3Dfd919fe8<br>image=3DImage<br>initrd_addr=3D0x438=
00000<br>initrd_high=3D0xffffffffffffffff<br>jh_clk=3D<br>jh_mmcboot=3Dsete=
nv fdt_file imx8mq-evk-root.dtb; setenv jh_clk clk_ignore_unused; if run lo=
adimage; then run mmcboot; else run jh_netboot; fi;<br>jh_netboot=3Dsetenv =
fdt_file imx8mq-evk-root.dtb; setenv jh_clk clk_ignore_unused; run netboot;=
<br>kboot=3Dbooti<br>loadaddr=3D0x40480000<br>loadbootscript=3Dfatload mmc =
${mmcdev}:${mmcpart} ${loadaddr} ${script};<br>loadfdt=3Dfatload mmc ${mmcd=
ev}:${mmcpart} ${fdt_addr} ${fdt_file}<br>loadimage=3Dfatload mmc ${mmcdev}=
:${mmcpart} ${loadaddr} ${image}<br>mfgtool_args=3Dsetenv bootargs console=
=3D${console},${baudrate} rdinit=3D/linuxrc clk_ignore_unused<br>mmcargs=3D=
setenv bootargs ${jh_clk} console=3D${console} root=3D${mmcroot}<br>mmcauto=
detect=3Dyes<br>mmcboot=3Decho Booting from mmc ...; run mmcargs; if test $=
{boot_fdt} =3D yes || test ${boot_fdt} =3D try; then if run loadfdt; then b=
ooti ${loadaddr} - ${fdt_addr}; else echo WARN: Cannot load the DT; fi; els=
e echo wait for boot; fi;<br>mmcdev=3D1<br>mmcpart=3D1<br>mmcroot=3D/dev/mm=
cblk1p2 rootwait rw<br>netargs=3Dsetenv bootargs ${jh_clk} console=3D${cons=
ole} root=3D/dev/nfs ip=3Ddhcp nfsroot=3D${serverip}:${nfsroot},v3,tcp<br>n=
etboot=3Decho Booting from net ...; run netargs;=C2=A0 if test ${ip_dyn} =
=3D yes; then setenv get_cmd dhcp; else setenv get_cmd tftp; fi; ${get_cmd}=
 ${loadaddr} ${image}; if test ${boot_fdt} =3D yes || test ${boot_fdt} =3D =
try; then if ${get_cmd} ${fdt_addr} ${fdt_file}; then booti ${loadaddr} - $=
{fdt_addr}; else echo WARN: Cannot load the DT; fi; else booti; fi;<br>scri=
pt=3Dboot.scr<br>sd_dev=3D1<br>serial#=3D051a61d6f0609912<br>soc_type=3Dimx=
8mq<br><br>Environment size: 2298/4092 bytes<br>u-boot=3D&gt; run jh_mmcboo=
t<br>26708480 bytes read in 1145 ms (22.2 MiB/s)<br>Booting from mmc ...<br=
>44274 bytes read in 8 ms (5.3 MiB/s)<br>## Flattened Device Tree blob at 4=
3000000<br>=C2=A0=C2=A0 Booting using the fdt blob at 0x43000000<br>=C2=A0=
=C2=A0 Using Device Tree in place at 0000000043000000, end 000000004300dcf1=
<br><br>Starting kernel ...<br><br>[=C2=A0=C2=A0=C2=A0 0.000000] Booting Li=
nux on physical CPU 0x0000000000 [0x410fd034]<br>[=C2=A0=C2=A0=C2=A0 0.0000=
00] Linux version 5.4.46+g5376418 (oe-user@oe-host) (gcc version 9.3.0 (GCC=
)) #1 SMP PREEMPT Mon Jun 29 03:06:40 UTC 2020<br>[=C2=A0=C2=A0=C2=A0 0.000=
000] Machine model: NXP i.MX8MQ EVK<br>[=C2=A0=C2=A0=C2=A0 0.000000] earlyc=
on: ec_imx6q0 at MMIO 0x0000000030860000 (options &#39;115200&#39;)<br>[=C2=
=A0=C2=A0=C2=A0 0.000000] printk: bootconsole [ec_imx6q0] enabled<br>[=C2=
=A0=C2=A0=C2=A0 0.000000] efi: Getting EFI parameters from FDT:<br>[=C2=A0=
=C2=A0=C2=A0 0.000000] efi: UEFI not found.<br>[=C2=A0=C2=A0=C2=A0 0.000000=
] Reserved memory: created CMA memory pool at 0x0000000044000000, size 960 =
MiB<br>[=C2=A0=C2=A0=C2=A0 0.000000] OF: reserved mem: initialized node lin=
ux,cma, compatible id shared-dma-pool<br>[=C2=A0=C2=A0=C2=A0 0.000000] NUMA=
: No NUMA configuration found<br>[=C2=A0=C2=A0=C2=A0 0.000000] NUMA: Faking=
 a node at [mem 0x0000000040000000-0x00000000bfafffff]<br>[=C2=A0=C2=A0=C2=
=A0 0.000000] NUMA: NODE_DATA [mem 0xbf6d0500-0xbf6d1fff]<br>[=C2=A0=C2=A0=
=C2=A0 0.000000] Zone ranges:<br>[=C2=A0=C2=A0=C2=A0 0.000000]=C2=A0=C2=A0 =
DMA32=C2=A0=C2=A0=C2=A0 [mem 0x0000000040000000-0x00000000bfafffff]<br>[=C2=
=A0=C2=A0=C2=A0 0.000000]=C2=A0=C2=A0 Normal=C2=A0=C2=A0 empty<br>[=C2=A0=
=C2=A0=C2=A0 0.000000] Movable zone start for each node<br>[=C2=A0=C2=A0=C2=
=A0 0.000000] Early memory node ranges<br>[=C2=A0=C2=A0=C2=A0 0.000000]=C2=
=A0=C2=A0 node=C2=A0=C2=A0 0: [mem 0x0000000040000000-0x00000000b7ffffff]<b=
r>[=C2=A0=C2=A0=C2=A0 0.000000]=C2=A0=C2=A0 node=C2=A0=C2=A0 0: [mem 0x0000=
0000b8400000-0x00000000bfafffff]<br>[=C2=A0=C2=A0=C2=A0 0.000000] Zeroed st=
ruct page in unavailable ranges: 256 pages<br>[=C2=A0=C2=A0=C2=A0 0.000000]=
 Initmem setup node 0 [mem 0x0000000040000000-0x00000000bfafffff]<br>[=C2=
=A0=C2=A0=C2=A0 0.000000] psci: probing for conduit method from DT.<br>[=C2=
=A0=C2=A0=C2=A0 0.000000] psci: PSCIv1.1 detected in firmware.<br>[=C2=A0=
=C2=A0=C2=A0 0.000000] psci: Using standard PSCI v0.2 function IDs<br>[=C2=
=A0=C2=A0=C2=A0 0.000000] psci: Trusted OS migration not required<br>[=C2=
=A0=C2=A0=C2=A0 0.000000] psci: SMC Calling Convention v1.1<br>[=C2=A0=C2=
=A0=C2=A0 0.000000] percpu: Embedded 24 pages/cpu s58840 r8192 d31272 u9830=
4<br>[=C2=A0=C2=A0=C2=A0 0.000000] Detected VIPT I-cache on CPU0<br>[=C2=A0=
=C2=A0=C2=A0 0.000000] CPU features: detected: ARM erratum 845719<br>[=C2=
=A0=C2=A0=C2=A0 0.000000] CPU features: detected: GIC system register CPU i=
nterface<br>[=C2=A0=C2=A0=C2=A0 0.000000] Speculative Store Bypass Disable =
mitigation not required<br>[=C2=A0=C2=A0=C2=A0 0.000000] Built 1 zonelists,=
 mobility grouping on.=C2=A0 Total pages: 513812<br>[=C2=A0=C2=A0=C2=A0 0.0=
00000] Policy zone: DMA32<br>[=C2=A0=C2=A0=C2=A0 0.000000] Kernel command l=
ine: clk_ignore_unused console=3Dttymxc0,115200 earlycon=3Dec_imx6q,0x30860=
000,115200 root=3D/dev/mmcblk1p2 rootwait rw<br>[=C2=A0=C2=A0=C2=A0 0.00000=
0] Dentry cache hash table entries: 262144 (order: 9, 2097152 bytes, linear=
)<br>[=C2=A0=C2=A0=C2=A0 0.000000] Inode-cache hash table entries: 131072 (=
order: 8, 1048576 bytes, linear)<br>[=C2=A0=C2=A0=C2=A0 0.000000] mem auto-=
init: stack:off, heap alloc:off, heap free:off<br>[=C2=A0=C2=A0=C2=A0 0.000=
000] Memory: 1037220K/2087936K available (15676K kernel code, 1186K rwdata,=
 6252K rodata, 2880K init, 1012K bss, 67676K reserved, 983040K cma-reserved=
)<br>[=C2=A0=C2=A0=C2=A0 0.000000] SLUB: HWalign=3D64, Order=3D0-3, MinObje=
cts=3D0, CPUs=3D4, Nodes=3D1<br>[=C2=A0=C2=A0=C2=A0 0.000000] rcu: Preempti=
ble hierarchical RCU implementation.<br>[=C2=A0=C2=A0=C2=A0 0.000000] rcu:=
=C2=A0=C2=A0=C2=A0=C2=A0 RCU restricting CPUs from NR_CPUS=3D256 to nr_cpu_=
ids=3D4.<br>[=C2=A0=C2=A0=C2=A0 0.000000]=C2=A0 Tasks RCU enabled.<br>[=C2=
=A0=C2=A0=C2=A0 0.000000] rcu: RCU calculated value of scheduler-enlistment=
 delay is 25 jiffies.<br>[=C2=A0=C2=A0=C2=A0 0.000000] rcu: Adjusting geome=
try for rcu_fanout_leaf=3D16, nr_cpu_ids=3D4<br>[=C2=A0=C2=A0=C2=A0 0.00000=
0] NR_IRQS: 64, nr_irqs: 64, preallocated irqs: 0<br>[=C2=A0=C2=A0=C2=A0 0.=
000000] GICv3: GIC: Using split EOI/Deactivate mode<br>[=C2=A0=C2=A0=C2=A0 =
0.000000] GICv3: 128 SPIs implemented<br>[=C2=A0=C2=A0=C2=A0 0.000000] GICv=
3: 0 Extended SPIs implemented<br>[=C2=A0=C2=A0=C2=A0 0.000000] GICv3: Dist=
ributor has no Range Selector support<br>[=C2=A0=C2=A0=C2=A0 0.000000] GICv=
3: 16 PPIs implemented<br>[=C2=A0=C2=A0=C2=A0 0.000000] GICv3: no VLPI supp=
ort, no direct LPI support<br>[=C2=A0=C2=A0=C2=A0 0.000000] GICv3: CPU0: fo=
und redistributor 0 region 0:0x0000000038880000<br>[=C2=A0=C2=A0=C2=A0 0.00=
0000] ITS: No ITS available, not enabling LPIs<br>[=C2=A0=C2=A0=C2=A0 0.000=
000] random: get_random_bytes called from start_kernel+0x2b8/0x44c with crn=
g_init=3D0<br>[=C2=A0=C2=A0=C2=A0 0.000000] arch_timer: cp15 timer(s) runni=
ng at 8.33MHz (phys).<br>[=C2=A0=C2=A0=C2=A0 0.000000] clocksource: arch_sy=
s_counter: mask: 0xffffffffffffff max_cycles: 0x1ec0311ec, max_idle_ns: 440=
795202152 ns<br>[=C2=A0=C2=A0=C2=A0 0.000004] sched_clock: 56 bits at 8MHz,=
 resolution 120ns, wraps every 2199023255541ns<br>[=C2=A0=C2=A0=C2=A0 0.008=
522] Console: colour dummy device 80x25<br>[=C2=A0=C2=A0=C2=A0 0.012540] Ca=
librating delay loop (skipped), value calculated using timer frequency.. 16=
.66 BogoMIPS (lpj=3D33333)<br>[=C2=A0=C2=A0=C2=A0 0.022767] pid_max: defaul=
t: 32768 minimum: 301<br>[=C2=A0=C2=A0=C2=A0 0.027466] LSM: Security Framew=
ork initializing<br>[=C2=A0=C2=A0=C2=A0 0.032057] Smack:=C2=A0 Initializing=
.<br>[=C2=A0=C2=A0=C2=A0 0.035314] Smack:=C2=A0 IPv6 port labeling enabled.=
<br>[=C2=A0=C2=A0=C2=A0 0.039903] Mount-cache hash table entries: 4096 (ord=
er: 3, 32768 bytes, linear)<br>[=C2=A0=C2=A0=C2=A0 0.047278] Mountpoint-cac=
he hash table entries: 4096 (order: 3, 32768 bytes, linear)<br>[=C2=A0=C2=
=A0=C2=A0 0.079192] ASID allocator initialised with 32768 entries<br>[=C2=
=A0=C2=A0=C2=A0 0.087188] rcu: Hierarchical SRCU implementation.<br>[=C2=A0=
=C2=A0=C2=A0 0.096133] EFI services will not be available.<br>[=C2=A0=C2=A0=
=C2=A0 0.103219] smp: Bringing up secondary CPUs ...<br>[=C2=A0=C2=A0=C2=A0=
 0.135392] Detected VIPT I-cache on CPU1<br>[=C2=A0=C2=A0=C2=A0 0.135420] G=
ICv3: CPU1: found redistributor 1 region 0:0x00000000388a0000<br>[=C2=A0=C2=
=A0=C2=A0 0.135444] CPU1: Booted secondary processor 0x0000000001 [0x410fd0=
34]<br>[=C2=A0=C2=A0=C2=A0 0.167418] Detected VIPT I-cache on CPU2<br>[=C2=
=A0=C2=A0=C2=A0 0.167434] GICv3: CPU2: found redistributor 2 region 0:0x000=
00000388c0000<br>[=C2=A0=C2=A0=C2=A0 0.167450] CPU2: Booted secondary proce=
ssor 0x0000000002 [0x410fd034]<br>[=C2=A0=C2=A0=C2=A0 0.199475] Detected VI=
PT I-cache on CPU3<br>[=C2=A0=C2=A0=C2=A0 0.199491] GICv3: CPU3: found redi=
stributor 3 region 0:0x00000000388e0000<br>[=C2=A0=C2=A0=C2=A0 0.199508] CP=
U3: Booted secondary processor 0x0000000003 [0x410fd034]<br>[=C2=A0=C2=A0=
=C2=A0 0.199574] smp: Brought up 1 node, 4 CPUs<br>[=C2=A0=C2=A0=C2=A0 0.25=
3145] SMP: Total of 4 processors activated.<br>[=C2=A0=C2=A0=C2=A0 0.257849=
] CPU features: detected: 32-bit EL0 Support<br>[=C2=A0=C2=A0=C2=A0 0.26300=
5] CPU features: detected: CRC32 instructions<br>[=C2=A0=C2=A0=C2=A0 0.2760=
60] CPU: All CPU(s) started at EL2<br>[=C2=A0=C2=A0=C2=A0 0.277324] alterna=
tives: patching kernel code<br>[=C2=A0=C2=A0=C2=A0 0.283321] devtmpfs: init=
ialized<br>[=C2=A0=C2=A0=C2=A0 0.291775] clocksource: jiffies: mask: 0xffff=
ffff max_cycles: 0xffffffff, max_idle_ns: 7645041785100000 ns<br>[=C2=A0=C2=
=A0=C2=A0 0.298700] futex hash table entries: 1024 (order: 4, 65536 bytes, =
linear)<br>[=C2=A0=C2=A0=C2=A0 0.334050] pinctrl core: initialized pinctrl =
subsystem<br>[=C2=A0=C2=A0=C2=A0 0.337229] DMI not present or invalid.<br>[=
=C2=A0=C2=A0=C2=A0 0.340553] NET: Registered protocol family 16<br>[=C2=A0=
=C2=A0=C2=A0 0.357311] DMA: preallocated 256 KiB pool for atomic allocation=
s<br>[=C2=A0=C2=A0=C2=A0 0.360565] audit: initializing netlink subsys (disa=
bled)<br>[=C2=A0=C2=A0=C2=A0 0.366096] audit: type=3D2000 audit(0.316:1): s=
tate=3Dinitialized audit_enabled=3D0 res=3D1<br>[=C2=A0=C2=A0=C2=A0 0.37375=
4] cpuidle: using governor menu<br>[=C2=A0=C2=A0=C2=A0 0.378251] hw-breakpo=
int: found 6 breakpoint and 4 watchpoint registers.<br>[=C2=A0=C2=A0=C2=A0 =
0.385345] Serial: AMBA PL011 UART driver<br>[=C2=A0=C2=A0=C2=A0 0.388621] i=
mx mu driver is registered.<br>[=C2=A0=C2=A0=C2=A0 0.392485] imx rpmsg driv=
er is registered.<br>[=C2=A0=C2=A0=C2=A0 0.400586] imx8mq-pinctrl 30330000.=
iomuxc: initialized IMX pinctrl driver<br>[=C2=A0=C2=A0=C2=A0 0.426581] Hug=
eTLB registered 1.00 GiB page size, pre-allocated 0 pages<br>[=C2=A0=C2=A0=
=C2=A0 0.430457] HugeTLB registered 32.0 MiB page size, pre-allocated 0 pag=
es<br>[=C2=A0=C2=A0=C2=A0 0.437159] HugeTLB registered 2.00 MiB page size, =
pre-allocated 0 pages<br>[=C2=A0=C2=A0=C2=A0 0.443872] HugeTLB registered 6=
4.0 KiB page size, pre-allocated 0 pages<br>[=C2=A0=C2=A0=C2=A0 0.452450] c=
ryptd: max_cpu_qlen set to 1000<br>[=C2=A0=C2=A0=C2=A0 0.460740] ACPI: Inte=
rpreter disabled.<br>[=C2=A0=C2=A0=C2=A0 0.466072] iommu: Default domain ty=
pe: Translated<br>[=C2=A0=C2=A0=C2=A0 0.468237] vgaarb: loaded<br>[=C2=A0=
=C2=A0=C2=A0 0.471117] SCSI subsystem initialized<br>[=C2=A0=C2=A0=C2=A0 0.=
475173] usbcore: registered new interface driver usbfs<br>[=C2=A0=C2=A0=C2=
=A0 0.480083] usbcore: registered new interface driver hub<br>[=C2=A0=C2=A0=
=C2=A0 0.485433] usbcore: registered new device driver usb<br>[=C2=A0=C2=A0=
=C2=A0 0.491493] mc: Linux media interface: v0.10<br>[=C2=A0=C2=A0=C2=A0 0.=
494724] videodev: Linux video capture interface: v2.00<br>[=C2=A0=C2=A0=C2=
=A0 0.500256] pps_core: LinuxPPS API ver. 1 registered<br>[=C2=A0=C2=A0=C2=
=A0 0.505160] pps_core: Software ver. 5.3.6 - Copyright 2005-2007 Rodolfo G=
iometti &lt;giometti@linux.it&gt;<br>[=C2=A0=C2=A0=C2=A0 0.514325] PTP cloc=
k support registered<br>[=C2=A0=C2=A0=C2=A0 0.518379] EDAC MC: Ver: 3.0.0<b=
r>[=C2=A0=C2=A0=C2=A0 0.522183] No BMan portals available!<br>[=C2=A0=C2=A0=
=C2=A0 0.525459] QMan: Allocated lookup table at (____ptrval____), entry co=
unt 65537<br>[=C2=A0=C2=A0=C2=A0 0.532766] No QMan portals available!<br>[=
=C2=A0=C2=A0=C2=A0 0.536666] No USDPAA memory, no &#39;fsl,usdpaa-mem&#39; =
in device-tree<br>[=C2=A0=C2=A0=C2=A0 0.542598] FPGA manager framework<br>[=
=C2=A0=C2=A0=C2=A0 0.545690] Advanced Linux Sound Architecture Driver Initi=
alized.<br>[=C2=A0=C2=A0=C2=A0 0.552115] NetLabel: Initializing<br>[=C2=A0=
=C2=A0=C2=A0 0.555118] NetLabel:=C2=A0 domain hash size =3D 128<br>[=C2=A0=
=C2=A0=C2=A0 0.559486] NetLabel:=C2=A0 protocols =3D UNLABELED CIPSOv4 CALI=
PSO<br>[=C2=A0=C2=A0=C2=A0 0.565202] NetLabel:=C2=A0 unlabeled traffic allo=
wed by default<br>[=C2=A0=C2=A0=C2=A0 0.571430] clocksource: Switched to cl=
ocksource arch_sys_counter<br>[=C2=A0=C2=A0=C2=A0 0.577005] VFS: Disk quota=
s dquot_6.6.0<br>[=C2=A0=C2=A0=C2=A0 0.580819] VFS: Dquot-cache hash table =
entries: 512 (order 0, 4096 bytes)<br>[=C2=A0=C2=A0=C2=A0 0.587831] pnp: Pn=
P ACPI: disabled<br>[=C2=A0=C2=A0=C2=A0 0.597738] thermal_sys: Registered t=
hermal governor &#39;step_wise&#39;<br>[=C2=A0=C2=A0=C2=A0 0.597741] therma=
l_sys: Registered thermal governor &#39;power_allocator&#39;<br>[=C2=A0=C2=
=A0=C2=A0 0.601226] NET: Registered protocol family 2<br>[=C2=A0=C2=A0=C2=
=A0 0.612156] tcp_listen_portaddr_hash hash table entries: 1024 (order: 2, =
16384 bytes, linear)<br>[=C2=A0=C2=A0=C2=A0 0.620396] TCP established hash =
table entries: 16384 (order: 5, 131072 bytes, linear)<br>[=C2=A0=C2=A0=C2=
=A0 0.628412] TCP bind hash table entries: 16384 (order: 6, 262144 bytes, l=
inear)<br>[=C2=A0=C2=A0=C2=A0 0.635849] TCP: Hash tables configured (establ=
ished 16384 bind 16384)<br>[=C2=A0=C2=A0=C2=A0 0.642240] UDP hash table ent=
ries: 1024 (order: 3, 32768 bytes, linear)<br>[=C2=A0=C2=A0=C2=A0 0.648911]=
 UDP-Lite hash table entries: 1024 (order: 3, 32768 bytes, linear)<br>[=C2=
=A0=C2=A0=C2=A0 0.656160] NET: Registered protocol family 1<br>[=C2=A0=C2=
=A0=C2=A0 0.660772] RPC: Registered named UNIX socket transport module.<br>=
[=C2=A0=C2=A0=C2=A0 0.666312] RPC: Registered udp transport module.<br>[=C2=
=A0=C2=A0=C2=A0 0.671012] RPC: Registered tcp transport module.<br>[=C2=A0=
=C2=A0=C2=A0 0.675722] RPC: Registered tcp NFSv4.1 backchannel transport mo=
dule.<br>[=C2=A0=C2=A0=C2=A0 0.682555] PCI: CLS 0 bytes, default 64<br>[=C2=
=A0=C2=A0=C2=A0 0.686877] hw perfevents: enabled with armv8_cortex_a53 PMU =
driver, 7 counters available<br>[=C2=A0=C2=A0=C2=A0 0.694656] kvm [1]: IPA =
Size Limit: 40bits<br>[=C2=A0=C2=A0=C2=A0 0.699184] kvm [1]: vgic-v2@310200=
00<br>[=C2=A0=C2=A0=C2=A0 0.702163] kvm [1]: GIC system register CPU interf=
ace enabled<br>[=C2=A0=C2=A0=C2=A0 0.708049] kvm [1]: vgic interrupt IRQ1<b=
r>[=C2=A0=C2=A0=C2=A0 0.712020] kvm [1]: Hyp mode initialized successfully<=
br>[=C2=A0=C2=A0=C2=A0 0.722834] Initialise system trusted keyrings<br>[=C2=
=A0=C2=A0=C2=A0 0.724541] workingset: timestamp_bits=3D44 max_order=3D19 bu=
cket_order=3D0<br>[=C2=A0=C2=A0=C2=A0 0.737258] squashfs: version 4.0 (2009=
/01/31) Phillip Lougher<br>[=C2=A0=C2=A0=C2=A0 0.740896] NFS: Registering t=
he id_resolver key type<br>[=C2=A0=C2=A0=C2=A0 0.745333] Key type id_resolv=
er registered<br>[=C2=A0=C2=A0=C2=A0 0.749491] Key type id_legacy registere=
d<br>[=C2=A0=C2=A0=C2=A0 0.753510] nfs4filelayout_init: NFSv4 File Layout D=
river Registering...<br>[=C2=A0=C2=A0=C2=A0 0.760234] jffs2: version 2.2. (=
NAND) =C2=A9 2001-2006 Red Hat, Inc.<br>[=C2=A0=C2=A0=C2=A0 0.766703] 9p: I=
nstalling v9fs 9p2000 file system support<br>[=C2=A0=C2=A0=C2=A0 0.787998] =
Key type asymmetric registered<br>[=C2=A0=C2=A0=C2=A0 0.789236] Asymmetric =
key parser &#39;x509&#39; registered<br>[=C2=A0=C2=A0=C2=A0 0.794162] Block=
 layer SCSI generic (bsg) driver version 0.4 loaded (major 244)<br>[=C2=A0=
=C2=A0=C2=A0 0.801543] io scheduler mq-deadline registered<br>[=C2=A0=C2=A0=
=C2=A0 0.806072] io scheduler kyber registered<br>[=C2=A0=C2=A0=C2=A0 0.814=
902] EINJ: ACPI disabled.<br>[=C2=A0=C2=A0=C2=A0 0.823000] imx-sdma 302c000=
0.sdma: Direct firmware load for imx/sdma/sdma-imx7d.bin failed with error =
-2<br>[=C2=A0=C2=A0=C2=A0 0.829836] imx-sdma 302c0000.sdma: Direct firmware=
 load for imx/sdma/sdma-imx7d.bin failed with error -2<br>[=C2=A0=C2=A0=C2=
=A0 0.834079] mxs-dma 33000000.dma-apbh: initialized<br>[=C2=A0=C2=A0=C2=A0=
 0.839348] imx-sdma 302c0000.sdma: external firmware not found, using ROM f=
irmware<br>[=C2=A0=C2=A0=C2=A0 0.844225] imx-sdma 30bd0000.sdma: Direct fir=
mware load for imx/sdma/sdma-imx7d.bin failed with error -2<br>[=C2=A0=C2=
=A0=C2=A0 0.854814] Bus freq driver module loaded<br>[=C2=A0=C2=A0=C2=A0 0.=
861404] imx-sdma 30bd0000.sdma: external firmware not found, using ROM firm=
ware<br>[=C2=A0=C2=A0=C2=A0 0.877597] Serial: 8250/16550 driver, 4 ports, I=
RQ sharing enabled<br>[=C2=A0=C2=A0=C2=A0 0.883159] 30860000.serial: ttymxc=
0 at MMIO 0x30860000 (irq =3D 30, base_baud =3D 1562500) is a IMX<br>[=C2=
=A0=C2=A0=C2=A0 0.889886] printk: console [ttymxc0] enabled<br>[=C2=A0=C2=
=A0=C2=A0 0.889886] printk: console [ttymxc0] enabled<br>[=C2=A0=C2=A0=C2=
=A0 0.898532] printk: bootconsole [ec_imx6q0] disabled<br>[=C2=A0=C2=A0=C2=
=A0 0.898532] printk: bootconsole [ec_imx6q0] disabled<br>[=C2=A0=C2=A0=C2=
=A0 0.908931] 30880000.serial: ttymxc2 at MMIO 0x30880000 (irq =3D 31, base=
_baud =3D 5000000) is a IMX<br>[=C2=A0=C2=A0=C2=A0 0.928199] imx-dcss 32e00=
000.display-controller: ctxld: can&#39;t get irq number<br>[=C2=A0=C2=A0=C2=
=A0 0.935434] imx-dcss 32e00000.display-controller: submodules initializati=
on failed<br>[=C2=A0=C2=A0=C2=A0 0.953837] loop: module loaded<br>[=C2=A0=
=C2=A0=C2=A0 0.959117] imx ahci driver is registered.<br>[=C2=A0=C2=A0=C2=
=A0 0.966058] spi-nor spi3.0: n25q256a (32768 Kbytes)<br>[=C2=A0=C2=A0=C2=
=A0 0.977852] libphy: Fixed MDIO Bus: probed<br>[=C2=A0=C2=A0=C2=A0 0.98277=
1] tun: Universal TUN/TAP device driver, 1.6<br>[=C2=A0=C2=A0=C2=A0 0.98858=
5] thunder_xcv, ver 1.0<br>[=C2=A0=C2=A0=C2=A0 0.991857] thunder_bgx, ver 1=
.0<br>[=C2=A0=C2=A0=C2=A0 0.995114] nicpf, ver 1.0<br>[=C2=A0=C2=A0=C2=A0 0=
.998573] pps pps0: new PPS source ptp0<br>[=C2=A0=C2=A0=C2=A0 1.008325] lib=
phy: fec_enet_mii_bus: probed<br>[=C2=A0=C2=A0=C2=A0 1.013751] fec 30be0000=
.ethernet eth0: registered PHC device 0<br>[=C2=A0=C2=A0=C2=A0 1.020325] Fr=
eescale FM module, FMD API version 21.1.0<br>[=C2=A0=C2=A0=C2=A0 1.025834] =
Freescale FM Ports module<br>[=C2=A0=C2=A0=C2=A0 1.029506] fsl_mac: fsl_mac=
: FSL FMan MAC API based driver<br>[=C2=A0=C2=A0=C2=A0 1.035250] fsl_dpa: F=
SL DPAA Ethernet driver<br>[=C2=A0=C2=A0=C2=A0 1.039728] fsl_advanced: FSL =
DPAA Advanced drivers:<br>[=C2=A0=C2=A0=C2=A0 1.044701] fsl_proxy: FSL DPAA=
 Proxy initialization driver<br>[=C2=A0=C2=A0=C2=A0 1.050388] fsl_oh: FSL F=
Man Offline Parsing port driver<br>[=C2=A0=C2=A0=C2=A0 1.056656] hclge is i=
nitializing<br>[=C2=A0=C2=A0=C2=A0 1.059982] hns3: Hisilicon Ethernet Netwo=
rk Driver for Hip08 Family - version<br>[=C2=A0=C2=A0=C2=A0 1.067209] hns3:=
 Copyright (c) 2017 Huawei Corporation.<br>[=C2=A0=C2=A0=C2=A0 1.072568] e1=
000: Intel(R) PRO/1000 Network Driver - version 7.3.21-k8-NAPI<br>[=C2=A0=
=C2=A0=C2=A0 1.079623] e1000: Copyright (c) 1999-2006 Intel Corporation.<br=
>[=C2=A0=C2=A0=C2=A0 1.085406] e1000e: Intel(R) PRO/1000 Network Driver - 3=
.2.6-k<br>[=C2=A0=C2=A0=C2=A0 1.091244] e1000e: Copyright(c) 1999 - 2015 In=
tel Corporation.<br>[=C2=A0=C2=A0=C2=A0 1.097209] igb: Intel(R) Gigabit Eth=
ernet Network Driver - version 5.6.0-k<br>[=C2=A0=C2=A0=C2=A0 1.104182] igb=
: Copyright (c) 2007-2014 Intel Corporation.<br>[=C2=A0=C2=A0=C2=A0 1.10979=
3] igbvf: Intel(R) Gigabit Virtual Function Network Driver - version 2.4.0-=
k<br>[=C2=A0=C2=A0=C2=A0 1.117629] igbvf: Copyright (c) 2009 - 2012 Intel C=
orporation.<br>[=C2=A0=C2=A0=C2=A0 1.123712] sky2: driver version 1.30<br>[=
=C2=A0=C2=A0=C2=A0 1.127882] VFIO - User Level meta-driver version: 0.3<br>=
[=C2=A0=C2=A0=C2=A0 1.135376] ehci_hcd: USB 2.0 &#39;Enhanced&#39; Host Con=
troller (EHCI) Driver<br>[=C2=A0=C2=A0=C2=A0 1.141924] ehci-pci: EHCI PCI p=
latform driver<br>[=C2=A0=C2=A0=C2=A0 1.146429] ehci-platform: EHCI generic=
 platform driver<br>[=C2=A0=C2=A0=C2=A0 1.151848] ohci_hcd: USB 1.1 &#39;Op=
en&#39; Host Controller (OHCI) Driver<br>[=C2=A0=C2=A0=C2=A0 1.158049] ohci=
-pci: OHCI PCI platform driver<br>[=C2=A0=C2=A0=C2=A0 1.162530] ohci-platfo=
rm: OHCI generic platform driver<br>[=C2=A0=C2=A0=C2=A0 1.168360] usbcore: =
registered new interface driver usb-storage<br>[=C2=A0=C2=A0=C2=A0 1.174444=
] usbcore: registered new interface driver usbserial_generic<br>[=C2=A0=C2=
=A0=C2=A0 1.180996] usbserial: USB Serial support registered for generic<br=
>[=C2=A0=C2=A0=C2=A0 1.189781] input: 30370000.snvs:snvs-powerkey as /devic=
es/platform/soc@0/soc@0:bus@30000000/30370000.snvs/30370000.snvs:snvs-power=
key/input/input0<br>[=C2=A0=C2=A0=C2=A0 1.205063] snvs_rtc 30370000.snvs:sn=
vs-rtc-lp: registered as rtc0<br>[=C2=A0=C2=A0=C2=A0 1.211353] i2c /dev ent=
ries driver<br>[=C2=A0=C2=A0=C2=A0 1.215126] usbcore: registered new interf=
ace driver i2c-tiny-usb<br>[=C2=A0=C2=A0=C2=A0 1.221581] mxc-mipi-csi2_yav =
30a70000.mipi_csi1: mipi_csi2_probe<br>[=C2=A0=C2=A0=C2=A0 1.227739] mxc-mi=
pi-csi2_yav 30a70000.mipi_csi: Remote device at endpoint@0 XXX found<br>[=
=C2=A0=C2=A0=C2=A0 1.235677] mxc-mipi-csi2_yav 30a70000.mipi_csi1: lanes: 2=
, name: mxc-mipi-csi2.0<br>[=C2=A0=C2=A0=C2=A0 1.243361] mxc-mipi-csi2_yav =
30b60000.mipi_csi2: mipi_csi2_probe<br>[=C2=A0=C2=A0=C2=A0 1.249505] mxc-mi=
pi-csi2_yav 30b60000.mipi_csi: Remote device at endpoint@0 XXX found<br>[=
=C2=A0=C2=A0=C2=A0 1.257441] mxc-mipi-csi2_yav 30b60000.mipi_csi2: lanes: 2=
, name: mxc-mipi-csi2.1<br>[=C2=A0=C2=A0=C2=A0 1.265159] mx6s-csi 30a90000.=
csi1_bridge: initialising<br>[=C2=A0=C2=A0=C2=A0 1.270589] CSI: Registered =
sensor subdevice: mxc-mipi-csi2.0<br>[=C2=A0=C2=A0=C2=A0 1.276411] mx6s-csi=
 30b80000.csi2_bridge: initialising<br>[=C2=A0=C2=A0=C2=A0 1.281826] CSI: R=
egistered sensor subdevice: mxc-mipi-csi2.1<br>[=C2=A0=C2=A0=C2=A0 1.289998=
] imx2-wdt 30280000.watchdog: timeout 60 sec (nowayout=3D0)<br>[=C2=A0=C2=
=A0=C2=A0 1.298423] sdhci: Secure Digital Host Controller Interface driver<=
br>[=C2=A0=C2=A0=C2=A0 1.304616] sdhci: Copyright(c) Pierre Ossman<br>[=C2=
=A0=C2=A0=C2=A0 1.309175] Synopsys Designware Multimedia Card Interface Dri=
ver<br>[=C2=A0=C2=A0=C2=A0 1.315843] sdhci-pltfm: SDHCI platform and OF dri=
ver helper<br>[=C2=A0=C2=A0=C2=A0 1.323883] ledtrig-cpu: registered to indi=
cate activity on CPUs<br>[=C2=A0=C2=A0=C2=A0 1.330891] caam 30900000.crypto=
: device ID =3D 0x0a16040100000000 (Era 9)<br>[=C2=A0=C2=A0=C2=A0 1.337606]=
 caam 30900000.crypto: job rings =3D 3, qi =3D 0<br>[=C2=A0=C2=A0=C2=A0 1.3=
60416] caam algorithms registered in /proc/crypto<br>[=C2=A0=C2=A0=C2=A0 1.=
367539] caam 30900000.crypto: caam pkc algorithms registered in /proc/crypt=
o<br>[=C2=A0=C2=A0=C2=A0 1.377087] caam_jr 30901000.jr: registering rng-caa=
m<br>[=C2=A0=C2=A0=C2=A0 1.387843] caam-snvs 30370000.caam-snvs: can&#39;t =
get snvs clock<br>[=C2=A0=C2=A0=C2=A0 1.393752] caam-snvs 30370000.caam-snv=
s: violation handlers armed - non-secure state<br>[=C2=A0=C2=A0=C2=A0 1.402=
639] usbcore: registered new interface driver usbhid<br>[=C2=A0=C2=A0=C2=A0=
 1.408224] usbhid: USB HID core driver<br>[=C2=A0=C2=A0=C2=A0 1.413532] No =
fsl,qman node<br>[=C2=A0=C2=A0=C2=A0 1.416435] Freescale USDPAA process dri=
ver<br>[=C2=A0=C2=A0=C2=A0 1.420626] fsl-usdpaa: no region found<br>[=C2=A0=
=C2=A0=C2=A0 1.424469] Freescale USDPAA process IRQ driver<br>[=C2=A0=C2=A0=
=C2=A0 1.430987] optee: probing for conduit method from DT.<br>[=C2=A0=C2=
=A0=C2=A0 1.436166] optee: revision 3.2 (6d99b525)<br>[=C2=A0=C2=A0=C2=A0 1=
.436539] optee: initialized driver<br>[=C2=A0=C2=A0=C2=A0 1.445920] usbcore=
: registered new interface driver snd-usb-audio<br>[=C2=A0=C2=A0=C2=A0 1.45=
3063] wm8524-codec audio-codec: Failed to get mute line: -517<br>[=C2=A0=C2=
=A0=C2=A0 1.486304] imx-spdif sound-spdif: snd-soc-dummy-dai &lt;-&gt; 3081=
0000.spdif mapping ok<br>[=C2=A0=C2=A0=C2=A0 1.493915] imx-spdif sound-spdi=
f: ASoC: no DMI vendor name!<br>[=C2=A0=C2=A0=C2=A0 1.501906] imx-spdif sou=
nd-hdmi-arc: snd-soc-dummy-dai &lt;-&gt; 308a0000.spdif mapping ok<br>[=C2=
=A0=C2=A0=C2=A0 1.509762] imx-spdif sound-hdmi-arc: ASoC: no DMI vendor nam=
e!<br>[=C2=A0=C2=A0=C2=A0 1.516844] imx-ak4458 sound-ak4458: ASoC: failed t=
o init link ak4458: -517<br>[=C2=A0=C2=A0=C2=A0 1.523828] imx-ak4458 sound-=
ak4458: snd_soc_register_card failed (-517)<br>[=C2=A0=C2=A0=C2=A0 1.530748=
] imx-ak5558 sound-ak5558: ASoC: failed to init link ak5558: -517<br>[=C2=
=A0=C2=A0=C2=A0 1.537723] imx-ak5558 sound-ak5558: snd_soc_register_card fa=
iled (-517)<br>[=C2=A0=C2=A0=C2=A0 1.545045] imx-cdnhdmi sound-hdmi: ASoC: =
failed to init link imx8 hdmi: -517<br>[=C2=A0=C2=A0=C2=A0 1.552197] imx-cd=
nhdmi sound-hdmi: snd_soc_register_card failed (-517)<br>[=C2=A0=C2=A0=C2=
=A0 1.559023] NET: Registered protocol family 26<br>[=C2=A0=C2=A0=C2=A0 1.5=
64089] NET: Registered protocol family 10<br>[=C2=A0=C2=A0=C2=A0 1.569318] =
Segment Routing with IPv6<br>[=C2=A0=C2=A0=C2=A0 1.573059] NET: Registered =
protocol family 17<br>[=C2=A0=C2=A0=C2=A0 1.577557] 8021q: 802.1Q VLAN Supp=
ort v1.8<br>[=C2=A0=C2=A0=C2=A0 1.581766] lib80211: common routines for IEE=
E802.11 drivers<br>[=C2=A0=C2=A0=C2=A0 1.587538] 9pnet: Installing 9P2000 s=
upport<br>[=C2=A0=C2=A0=C2=A0 1.591848] tsn generic netlink module v1 init.=
..<br>[=C2=A0=C2=A0=C2=A0 1.596616] Key type dns_resolver registered<br>[=
=C2=A0=C2=A0=C2=A0 1.601386] registered taskstats version 1<br>[=C2=A0=C2=
=A0=C2=A0 1.605502] Loading compiled-in X.509 certificates<br>[=C2=A0=C2=A0=
=C2=A0 1.633069] GPIO line 157 (wl-reg-on) hogged as output/high<br>[=C2=A0=
=C2=A0=C2=A0 1.640962] ov5640_mipi 0-003c: No sensor reset pin available<br=
>[=C2=A0=C2=A0=C2=A0 1.646750] ov5640_mipi 0-003c: 0-003c supply DOVDD not =
found, using dummy regulator<br>[=C2=A0=C2=A0=C2=A0 1.654559] ov5640_mipi 0=
-003c: 0-003c supply DVDD not found, using dummy regulator<br>[=C2=A0=C2=A0=
=C2=A0 1.662275] ov5640_mipi 0-003c: 0-003c supply AVDD not found, using du=
mmy regulator<br>[=C2=A0=C2=A0=C2=A0 1.679749] ov5640_mipi 0-003c: Read reg=
 error: reg=3D300a<br>[=C2=A0=C2=A0=C2=A0 1.685074] ov5640_mipi 0-003c: Cam=
era is not found<br>[=C2=A0=C2=A0=C2=A0 1.691643] pfuze100-regulator 0-0008=
: Full layer: 2, Metal layer: 1<br>[=C2=A0=C2=A0=C2=A0 1.698651] pfuze100-r=
egulator 0-0008: FAB: 0, FIN: 0<br>[=C2=A0=C2=A0=C2=A0 1.703724] pfuze100-r=
egulator 0-0008: pfuze100 found.<br>[=C2=A0=C2=A0=C2=A0 1.726433] i2c i2c-0=
: IMX I2C adapter registered<br>[=C2=A0=C2=A0=C2=A0 1.731962] ov5640_mipi 1=
-003c: No sensor reset pin available<br>[=C2=A0=C2=A0=C2=A0 1.737751] ov564=
0_mipi 1-003c: 1-003c supply DOVDD not found, using dummy regulator<br>[=C2=
=A0=C2=A0=C2=A0 1.745564] ov5640_mipi 1-003c: 1-003c supply DVDD not found,=
 using dummy regulator<br>[=C2=A0=C2=A0=C2=A0 1.753279] ov5640_mipi 1-003c:=
 1-003c supply AVDD not found, using dummy regulator<br>[=C2=A0=C2=A0=C2=A0=
 1.806172] random: fast init done<br>[=C2=A0=C2=A0=C2=A0 2.923484] mxc-mipi=
-csi2_yav 30a70000.mipi_csi: Registered sensor subdevice: ov5640_mipi 1-003=
c<br>[=C2=A0=C2=A0=C2=A0 2.933515] ov5640_mipi 1-003c: Camera is found<br>[=
=C2=A0=C2=A0=C2=A0 2.938098] i2c i2c-1: IMX I2C adapter registered<br>[=C2=
=A0=C2=A0=C2=A0 2.943625] ak4458 2-0010: 2-0010 supply DVDD not found, usin=
g dummy regulator<br>[=C2=A0=C2=A0=C2=A0 2.950922] ak4458 2-0010: 2-0010 su=
pply AVDD not found, using dummy regulator<br>[=C2=A0=C2=A0=C2=A0 2.958539]=
 ak4458 2-0012: 2-0012 supply DVDD not found, using dummy regulator<br>[=C2=
=A0=C2=A0=C2=A0 2.965819] ak4458 2-0012: 2-0012 supply AVDD not found, usin=
g dummy regulator<br>[=C2=A0=C2=A0=C2=A0 2.973434] ak5558 2-0013: 2-0013 su=
pply DVDD not found, using dummy regulator<br>[=C2=A0=C2=A0=C2=A0 2.980712]=
 ak5558 2-0013: 2-0013 supply AVDD not found, using dummy regulator<br>[=C2=
=A0=C2=A0=C2=A0 2.988334] ak4458 2-0011: 2-0011 supply DVDD not found, usin=
g dummy regulator<br>[=C2=A0=C2=A0=C2=A0 2.995613] ak4458 2-0011: 2-0011 su=
pply AVDD not found, using dummy regulator<br>[=C2=A0=C2=A0=C2=A0 3.002965]=
 i2c i2c-2: IMX I2C adapter registered<br>[=C2=A0=C2=A0=C2=A0 3.008171] imx=
8mq-usb-phy 381f0040.usb-phy: 381f0040.usb-phy supply vbus not found, using=
 dummy regulator<br>[=C2=A0=C2=A0=C2=A0 3.018106] imx8mq-usb-phy 382f0040.u=
sb-phy: 382f0040.usb-phy supply vbus not found, using dummy regulator<br>[=
=C2=A0=C2=A0=C2=A0 3.029780] imx6q-pcie 33c00000.pcie: 33c00000.pcie supply=
 epdev_on not found, using dummy regulator<br>[=C2=A0=C2=A0=C2=A0 3.039413]=
 imx6q-pcie 33c00000.pcie: host bridge /soc@0/pcie@33c00000 ranges:<br>[=C2=
=A0=C2=A0=C2=A0 3.044136] [drm] Supports vblank timestamp caching Rev 2 (21=
.10.2013).<br>[=C2=A0=C2=A0=C2=A0 3.046671] imx6q-pcie 33c00000.pcie:=C2=A0=
=C2=A0 No bus range found for /soc@0/pcie@33c00000, using [bus 00-ff]<br>[=
=C2=A0=C2=A0=C2=A0 3.053283] [drm] No driver support for vblank timestamp q=
uery.<br>[=C2=A0=C2=A0=C2=A0 3.062595] imx6q-pcie 33c00000.pcie:=C2=A0=C2=
=A0=C2=A0 IO 0x27f80000..0x27f8ffff -&gt; 0x00000000<br>[=C2=A0=C2=A0=C2=A0=
 3.069011] cdns-mhdp-imx 32c00000.hdmi: lane-mapping 0xe4<br>[=C2=A0=C2=A0=
=C2=A0 3.075912] imx6q-pcie 33c00000.pcie:=C2=A0=C2=A0 MEM 0x20000000..0x27=
efffff -&gt; 0x20000000<br>[=C2=A0=C2=A0=C2=A0 3.083339] imx-dcss 32e00000.=
display-controller: bound 32c00000.hdmi (ops cdns_mhdp_imx_ops)<br>[=C2=A0=
=C2=A0=C2=A0 3.097656] [drm] Initialized imx-dcss 1.0.0 20190917 for 32e000=
00.display-controller on minor 0<br>[=C2=A0=C2=A0=C2=A0 3.132030] cdns-mhdp=
-imx 32c00000.hdmi: 0,ff,ff,ff,ff,ff,ff,0<br>[=C2=A0=C2=A0=C2=A0 3.169065] =
cdns-mhdp-imx 32c00000.hdmi: 0,ff,ff,ff,ff,ff,ff,0<br>[=C2=A0=C2=A0=C2=A0 3=
.169698] [drm] Mode: 1920x1080p148500<br>[=C2=A0=C2=A0=C2=A0 3.195465] [drm=
] Pixel clock: 148500 KHz, character clock: 222750, bpc is 12-bit.<br>[=C2=
=A0=C2=A0=C2=A0 3.195469] [drm] VCO frequency is 4455000 KHz<br>[=C2=A0=C2=
=A0=C2=A0 3.272634] [drm] Sink Not Support SCDC<br>[=C2=A0=C2=A0=C2=A0 3.27=
3850] [drm] No vendor infoframe<br>[=C2=A0=C2=A0=C2=A0 3.370041] Console: s=
witching to colour frame buffer device 240x67<br>[=C2=A0=C2=A0=C2=A0 3.4372=
24] imx-dcss 32e00000.display-controller: fb0: imx-dcssdrmfb frame buffer d=
evice<br>[=C2=A0=C2=A0=C2=A0 3.446394] OF: graph: no port node found in /so=
c@0/usb-phy@381f0040<br>[=C2=A0=C2=A0=C2=A0 3.453792] xhci-hcd xhci-hcd.1.a=
uto: xHCI Host Controller<br>[=C2=A0=C2=A0=C2=A0 3.459305] xhci-hcd xhci-hc=
d.1.auto: new USB bus registered, assigned bus number 1<br>[=C2=A0=C2=A0=C2=
=A0 3.467089] xhci-hcd xhci-hcd.1.auto: hcc params 0x0220fe6c hci version 0=
x110 quirks 0x0000000001010010<br>[=C2=A0=C2=A0=C2=A0 3.476536] xhci-hcd xh=
ci-hcd.1.auto: irq 53, io mem 0x38200000<br>[=C2=A0=C2=A0=C2=A0 3.483222] h=
ub 1-0:1.0: USB hub found<br>[=C2=A0=C2=A0=C2=A0 3.487007] hub 1-0:1.0: 1 p=
ort detected<br>[=C2=A0=C2=A0=C2=A0 3.491188] xhci-hcd xhci-hcd.1.auto: xHC=
I Host Controller<br>[=C2=A0=C2=A0=C2=A0 3.496691] xhci-hcd xhci-hcd.1.auto=
: new USB bus registered, assigned bus number 2<br>[=C2=A0=C2=A0=C2=A0 3.50=
4364] xhci-hcd xhci-hcd.1.auto: Host supports USB 3.0 SuperSpeed<br>[=C2=A0=
=C2=A0=C2=A0 3.510941] usb usb2: We don&#39;t know the algorithms for LPM f=
or this host, disabling LPM.<br>[=C2=A0=C2=A0=C2=A0 3.519499] hub 2-0:1.0: =
USB hub found<br>[=C2=A0=C2=A0=C2=A0 3.523268] hub 2-0:1.0: 1 port detected=
<br>[=C2=A0=C2=A0=C2=A0 3.528323] imx-cpufreq-dt imx-cpufreq-dt: cpu speed =
grade 3 mkt segment 0 supported-hw 0x8 0x1<br>[=C2=A0=C2=A0=C2=A0 3.539043]=
 sdhci-esdhc-imx 30b50000.mmc: Got CD GPIO<br>[=C2=A0=C2=A0=C2=A0 3.575349]=
 mmc0: SDHCI controller on 30b50000.mmc [30b50000.mmc] using ADMA<br>[=C2=
=A0=C2=A0=C2=A0 3.585291] hantrodec: module inserted. Major =3D 236<br>[=C2=
=A0=C2=A0=C2=A0 3.591996] debugfs: Directory &#39;308b0000.sai&#39; with pa=
rent &#39;wm8524-audio&#39; already present!<br>[=C2=A0=C2=A0=C2=A0 3.60026=
4] asoc-simple-card sound-wm8524: wm8524-hifi &lt;-&gt; 308b0000.sai mappin=
g ok<br>[=C2=A0=C2=A0=C2=A0 3.607858] asoc-simple-card sound-wm8524: ASoC: =
no DMI vendor name!<br>[=C2=A0=C2=A0=C2=A0 3.617751] ak4458 2-0010: ASoC: f=
ailed to probe component -6<br>[=C2=A0=C2=A0=C2=A0 3.623573] imx-ak4458 sou=
nd-ak4458: ASoC: failed to instantiate card -6<br>[=C2=A0=C2=A0=C2=A0 3.630=
361] imx-ak4458 sound-ak4458: snd_soc_register_card failed (-6)<br>[=C2=A0=
=C2=A0=C2=A0 3.637686] ak5558 2-0013: ASoC: failed to probe component -6<br=
>[=C2=A0=C2=A0=C2=A0 3.643461] imx-ak5558 sound-ak5558: ASoC: failed to ins=
tantiate card -6<br>[=C2=A0=C2=A0=C2=A0 3.650216] imx-ak5558 sound-ak5558: =
snd_soc_register_card failed (-6)<br>[=C2=A0=C2=A0=C2=A0 3.657254] debugfs:=
 Directory &#39;30050000.sai&#39; with parent &#39;imx-audio-hdmi&#39; alre=
ady present!<br>[=C2=A0=C2=A0=C2=A0 3.665679] imx-cdnhdmi sound-hdmi: i2s-h=
ifi &lt;-&gt; 30050000.sai mapping ok<br>[=C2=A0=C2=A0=C2=A0 3.672416] imx-=
cdnhdmi sound-hdmi: ASoC: no DMI vendor name!<br>[=C2=A0=C2=A0=C2=A0 3.6782=
10] debugfs: File &#39;Capture&#39; in directory &#39;dapm&#39; already pre=
sent!<br>[=C2=A0=C2=A0=C2=A0 3.698013] imx6q-pcie 33800000.pcie: 33800000.p=
cie supply epdev_on not found, using dummy regulator<br>[=C2=A0=C2=A0=C2=A0=
 3.707158] snvs_rtc 30370000.snvs:snvs-rtc-lp: setting system clock to 1970=
-01-01T00:00:02 UTC (2)<br>[=C2=A0=C2=A0=C2=A0 3.707407] imx6q-pcie 3380000=
0.pcie: host bridge /soc@0/pcie@33800000 ranges:<br>[=C2=A0=C2=A0=C2=A0 3.7=
16550] cfg80211: Loading compiled-in X.509 certificates for regulatory data=
base<br>[=C2=A0=C2=A0=C2=A0 3.723475] imx6q-pcie 33800000.pcie:=C2=A0=C2=A0=
=C2=A0 IO 0x1ff80000..0x1ff8ffff -&gt; 0x00000000<br>[=C2=A0=C2=A0=C2=A0 3.=
733066] cfg80211: Loaded X.509 cert &#39;sforshee: 00b28ddf47aef9cea7&#39;<=
br>[=C2=A0=C2=A0=C2=A0 3.738615] imx6q-pcie 33800000.pcie:=C2=A0=C2=A0 MEM =
0x18000000..0x1fefffff -&gt; 0x18000000<br>[=C2=A0=C2=A0=C2=A0 3.745173] pl=
atform regulatory.0: Direct firmware load for regulatory.db failed with err=
or -2<br>[=C2=A0=C2=A0=C2=A0 3.752535] clk: Not disabling unused clocks<br>=
[=C2=A0=C2=A0=C2=A0 3.761138] cfg80211: failed to load regulatory.db<br>[=
=C2=A0=C2=A0=C2=A0 3.770254] ALSA device list:<br>[=C2=A0=C2=A0=C2=A0 3.773=
235]=C2=A0=C2=A0 #0: imx-spdif<br>[=C2=A0=C2=A0=C2=A0 3.776064]=C2=A0=C2=A0=
 #1: imx-hdmi-arc<br>[=C2=A0=C2=A0=C2=A0 3.779128]=C2=A0=C2=A0 #2: wm8524-a=
udio<br>[=C2=A0=C2=A0=C2=A0 3.782202]=C2=A0=C2=A0 #3: imx-audio-hdmi<br>[=
=C2=A0=C2=A0=C2=A0 3.823443] usb 1-1: new high-speed USB device number 2 us=
ing xhci-hcd<br>[=C2=A0=C2=A0=C2=A0 3.828497] mmc0: host does not support r=
eading read-only switch, assuming write-enable<br>[=C2=A0=C2=A0=C2=A0 3.840=
091] mmc0: new high speed SDHC card at address 59b4<br>[=C2=A0=C2=A0=C2=A0 =
3.846085] mmcblk0: mmc0:59b4 SMI=C2=A0=C2=A0 29.5 GiB<br>[=C2=A0=C2=A0=C2=
=A0 3.855880]=C2=A0 mmcblk0: p1 p2<br>[=C2=A0=C2=A0=C2=A0 3.959531] imx6q-p=
cie 33800000.pcie: Link up<br>[=C2=A0=C2=A0=C2=A0 3.963910] imx6q-pcie 3380=
0000.pcie: Link up<br>[=C2=A0=C2=A0=C2=A0 3.968286] imx6q-pcie 33800000.pci=
e: Link up, Gen1<br>[=C2=A0=C2=A0=C2=A0 3.973386] imx6q-pcie 33800000.pcie:=
 PCI host bridge to bus 0000:00<br>[=C2=A0=C2=A0=C2=A0 3.979750] pci_bus 00=
00:00: root bus resource [bus 00-ff]<br>[=C2=A0=C2=A0=C2=A0 3.985243] pci_b=
us 0000:00: root bus resource [io=C2=A0 0x10000-0x1ffff] (bus address [0x00=
00-0xffff])<br>[=C2=A0=C2=A0=C2=A0 3.994209] pci_bus 0000:00: root bus reso=
urce [mem 0x18000000-0x1fefffff]<br>[=C2=A0=C2=A0=C2=A0 4.001119] pci 0000:=
00:00.0: [16c3:abcd] type 01 class 0x060400<br>[=C2=A0=C2=A0=C2=A0 4.007146=
] pci 0000:00:00.0: reg 0x10: [mem 0x00000000-0x000fffff]<br>[=C2=A0=C2=A0=
=C2=A0 4.013435] pci 0000:00:00.0: reg 0x38: [mem 0x00000000-0x0000ffff pre=
f]<br>[=C2=A0=C2=A0=C2=A0 4.020179] pci 0000:00:00.0: supports D1<br>[=C2=
=A0=C2=A0=C2=A0 4.023054] hub 1-1:1.0: USB hub found<br>[=C2=A0=C2=A0=C2=A0=
 4.024204] pci 0000:00:00.0: PME# supported from D0 D1 D3hot D3cold<br>[=C2=
=A0=C2=A0=C2=A0 4.027986] hub 1-1:1.0: 4 ports detected<br>[=C2=A0=C2=A0=C2=
=A0 4.036217] pci 0000:01:00.0: [168c:003e] type 00 class 0x028000<br>[=C2=
=A0=C2=A0=C2=A0 4.044416] pci 0000:01:00.0: reg 0x10: [mem 0x00000000-0x001=
fffff 64bit]<br>[=C2=A0=C2=A0=C2=A0 4.051511] pci 0000:01:00.0: PME# suppor=
ted from D0 D3hot D3cold<br>[=C2=A0=C2=A0=C2=A0 4.069887] pci 0000:00:00.0:=
 BAR 14: assigned [mem 0x18000000-0x181fffff]<br>[=C2=A0=C2=A0=C2=A0 4.0767=
78] pci 0000:00:00.0: BAR 0: assigned [mem 0x18200000-0x182fffff]<br>[=C2=
=A0=C2=A0=C2=A0 4.083700] pci 0000:00:00.0: BAR 6: assigned [mem 0x18300000=
-0x1830ffff pref]<br>[=C2=A0=C2=A0=C2=A0 4.090930] pci 0000:01:00.0: BAR 0:=
 assigned [mem 0x18000000-0x181fffff 64bit]<br>[=C2=A0=C2=A0=C2=A0 4.098269=
] pci 0000:00:00.0: PCI bridge to [bus 01-ff]<br>[=C2=A0=C2=A0=C2=A0 4.1035=
02] pci 0000:00:00.0:=C2=A0=C2=A0 bridge window [mem 0x18000000-0x181fffff]=
<br>[=C2=A0=C2=A0=C2=A0 4.110584] pcieport 0000:00:00.0: PME: Signaling wit=
h IRQ 232<br>[=C2=A0=C2=A0=C2=A0 4.116617] pcieport 0000:00:00.0: AER: enab=
led with IRQ 232<br>[=C2=A0=C2=A0=C2=A0 4.194272] imx6q-pcie 33c00000.pcie:=
 Phy link never came up<br>[=C2=A0=C2=A0=C2=A0 4.199975] imx6q-pcie 33c0000=
0.pcie: failed to initialize host<br>[=C2=A0=C2=A0=C2=A0 4.205916] imx6q-pc=
ie 33c00000.pcie: unable to add pcie port.<br>[=C2=A0=C2=A0=C2=A0 4.212755]=
 Waiting for root device /dev/mmcblk1p2...<br>[=C2=A0=C2=A0=C2=A0 4.423473]=
 usb 1-1.2: new high-speed USB device number 3 using xhci-hcd</b><br><br></=
p></div>

<p></p>

-- <br />
You received this message because you are subscribed to the Google Groups &=
quot;Jailhouse&quot; group.<br />
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to <a href=3D"mailto:jailhouse-dev+unsubscribe@googlegroups.com">jailh=
ouse-dev+unsubscribe@googlegroups.com</a>.<br />
To view this discussion on the web visit <a href=3D"https://groups.google.c=
om/d/msgid/jailhouse-dev/a46f55d1-2b6f-485e-8eef-71aa5eb08d92o%40googlegrou=
ps.com?utm_medium=3Demail&utm_source=3Dfooter">https://groups.google.com/d/=
msgid/jailhouse-dev/a46f55d1-2b6f-485e-8eef-71aa5eb08d92o%40googlegroups.co=
m</a>.<br />

------=_Part_865_1540480717.1597687747184--

------=_Part_864_665991048.1597687747183--
