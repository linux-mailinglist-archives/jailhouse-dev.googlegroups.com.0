Return-Path: <jailhouse-dev+bncBDVP3IWNW4CBBUFAZ34QKGQEDKUVS3A@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-qt1-x837.google.com (mail-qt1-x837.google.com [IPv6:2607:f8b0:4864:20::837])
	by mail.lfdr.de (Postfix) with ESMTPS id D1EC6242598
	for <lists+jailhouse-dev@lfdr.de>; Wed, 12 Aug 2020 08:46:41 +0200 (CEST)
Received: by mail-qt1-x837.google.com with SMTP id h10sf961891qtc.4
        for <lists+jailhouse-dev@lfdr.de>; Tue, 11 Aug 2020 23:46:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:date:from:to:message-id:in-reply-to:references:subject
         :mime-version:x-original-sender:precedence:mailing-list:list-id
         :list-post:list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=kboweYxmsJYb8waa3i/mmD0EovCtKJWvxJO6Jj9kJTI=;
        b=VKdpqR6f4LPthjYqCMM2WuBswUJIWNhIpNGSFJ2mLGjc3a/g0bWaBw86G5QADsI3XM
         WLZ0cCHiYPeQAjMevzBoljXg8KAh1Y9wXDvy0NejIx/4gVQtJFtJTLlpveigPvi0JFnv
         lxDZjepG2DdAQT626ROGpoK4nNKQVEnj0gwqTjzWeBHoiwkP5zEtYHTmEFl0hNNlRibN
         eZsXAv5RBH/rdyjyvPi+fggDWJt/fnC/7OKN9amTnNmnY4pCeCw1Q8laD9IhN1SrIss9
         /GKaMsvHXcEE8oQbUO42tuXmUqCDfzqKEYTI4s+yksh8lMwQeioWpvt2itXqolHk1gXh
         Cc6Q==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:message-id:in-reply-to:references:subject:mime-version
         :x-original-sender:precedence:mailing-list:list-id:list-post
         :list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=kboweYxmsJYb8waa3i/mmD0EovCtKJWvxJO6Jj9kJTI=;
        b=s++iBT27SWRBVcwYnQeFN9xAL/LZHkpRH6j78jxzYpQcdtN5yd9hqvYZaJeu+eAXbD
         hELwu3cEC3MID/PUsw8TsvALkjgkwNTeDqSGsLANRTKIi6JpxgNjer81cck8Ips5hN3D
         7mxTZoZ3jQ0cZrzgzKGZWb5LwKkkw9+vhQrpQCe8MclMYjG7lsLNQ7EQI8DiRjgHAJ1F
         6W3mgbusfqvolZOHWryzymhDjpyatey7+tzOPu6cyvPH0+UEJ7eeLrXVmvWfi7eun/an
         uuXl2iCMM+w+xkNi+y9uB7PhnlEuqpj6EaLg7JliLDFFdzauK80dccS0smz95sX3NB82
         8/KA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:date:from:to:message-id:in-reply-to
         :references:subject:mime-version:x-original-sender:precedence
         :mailing-list:list-id:x-spam-checked-in-group:list-post:list-help
         :list-archive:list-subscribe:list-unsubscribe;
        bh=kboweYxmsJYb8waa3i/mmD0EovCtKJWvxJO6Jj9kJTI=;
        b=kRbhnxwtkhcSlvSyDoZ5jBwTKdbsbIVuW+MXPXiYQYPqNMnmNLYG+qxccm7CCjn0kg
         R6Kbm17UMKWPYPX/A05es0ATO0LsFzTPVLzkemFVsfp1bPOymb9Bt2mPo+T1n1qUbClC
         doAhBT+haXUfO2S6Clnm3IXxN9Q2vvyN5/I5TEX9kzmLB/8nM563eZcH7hQ6HnuLU5us
         y2/YSDMCHaDiLHxpDAh8fEZ3fzldgQLT0PUsy/toulE6EtohhXDTW+J5+bFMJW2pr7KN
         cltVM235lza5f/FRO0ub2hmLl72zCyVo9/BvsY2TF3pRK9SX9sgmWG1RQLMHv0AX3Heh
         5bMA==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AOAM5336gqv+2S/Se9gXGWFN7uWFrI4LokMo4gQVdYcvLT/IlrDEaFd+
	Z+1tyPPj24RmQWjh7rrbMqA=
X-Google-Smtp-Source: ABdhPJyDKlZQ9U4bsKgkQwKcqbkR7RH1vm2VR3qKzCHzaxljgSNnLp5XWrOs9Cg0dj3qjkOhtzp9RA==
X-Received: by 2002:ac8:1999:: with SMTP id u25mr5037420qtj.307.1597214800661;
        Tue, 11 Aug 2020 23:46:40 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:ae9:c20d:: with SMTP id j13ls509390qkg.2.gmail; Tue, 11 Aug
 2020 23:46:39 -0700 (PDT)
X-Received: by 2002:ae9:f301:: with SMTP id p1mr4532521qkg.295.1597214799638;
        Tue, 11 Aug 2020 23:46:39 -0700 (PDT)
Date: Tue, 11 Aug 2020 23:46:38 -0700 (PDT)
From: Vipul Suneja <vsuneja63@gmail.com>
To: Jailhouse <jailhouse-dev@googlegroups.com>
Message-Id: <b36d3d7b-25ef-4ba4-bf63-77e511c2319eo@googlegroups.com>
In-Reply-To: <CAEfxd--LbKjCA55W-tNmL_4H2b+H3jsW6PKYAo5B2Y1Wx0o6GQ@mail.gmail.com>
References: <11e37b92-3146-4194-877f-f79ab746d971o@googlegroups.com>
 <CAEfxd--LbKjCA55W-tNmL_4H2b+H3jsW6PKYAo5B2Y1Wx0o6GQ@mail.gmail.com>
Subject: Re: imx8 : linux-inmate-demo cell created & started. Does it
 maintain another rootfs for this 2nd linux & how we can run a binary in
 this 2nd linux?
MIME-Version: 1.0
Content-Type: multipart/mixed; 
	boundary="----=_Part_1672_1270494209.1597214798889"
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

------=_Part_1672_1270494209.1597214798889
Content-Type: multipart/alternative; 
	boundary="----=_Part_1673_1826646733.1597214798889"

------=_Part_1673_1826646733.1597214798889
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Peng,

Thanks!

I could load 2nd linux of emmc through primary rootcell image of SD card.=
=20
Further exploring shared memory concept for root & non-root cell=20
communication.

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
jailhouse-dev/b36d3d7b-25ef-4ba4-bf63-77e511c2319eo%40googlegroups.com.

------=_Part_1673_1826646733.1597214798889
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>Hi Peng,</div><div><br></div><div>Thanks!</div><div><=
br></div><div>I could load 2nd linux of emmc through primary rootcell image=
 of SD card. Further exploring shared memory concept for root &amp; non-roo=
t cell communication.<br></div><br>On Thursday, August 6, 2020 at 6:52:17 A=
M UTC+5:30, Peng Fan wrote:<blockquote class=3D"gmail_quote" style=3D"margi=
n: 0;margin-left: 0.8ex;border-left: 1px #ccc solid;padding-left: 1ex;"><di=
v dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote"><di=
v dir=3D"ltr">Vipul Suneja &lt;<a href=3D"javascript:" target=3D"_blank" gd=
f-obfuscated-mailto=3D"dNty2DPpBAAJ" rel=3D"nofollow" onmousedown=3D"this.h=
ref=3D&#39;javascript:&#39;;return true;" onclick=3D"this.href=3D&#39;javas=
cript:&#39;;return true;">vsun...@gmail.com</a>&gt; =E4=BA=8E2020=E5=B9=B48=
=E6=9C=885=E6=97=A5=E5=91=A8=E4=B8=89 =E4=B8=8B=E5=8D=884:48=E5=86=99=E9=81=
=93=EF=BC=9A<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px=
 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex"><di=
v dir=3D"ltr"><div><br></div><div>=C2=A0=C2=A0=C2=A0=C2=A0 Target: imx8mq e=
vk</div><div>=C2=A0=C2=A0=C2=A0=C2=A0 bsp: 5.4.24</div><div>=C2=A0=C2=A0=C2=
=A0=C2=A0 <br></div><div>=C2=A0=C2=A0=C2=A0=C2=A0 Created &amp; started lin=
ux cell. Does it maintain separate rootfs? How to run a binary in this 2nd =
linux (in dedicated CPU)? I didn&#39;t found initrd.img, didn&#39;t include=
 in the below given command.</div><div>=C2=A0=C2=A0=C2=A0 <br></div><div><b=
>=C2=A0=C2=A0=C2=A0=C2=A0 jailhouse cell linux /usr/share/jailhouse/cells/<=
wbr>imx8mq-linux-demo.cell /run/media/mmcblk1p1/Image -d /run/media/mmcblk1=
p1/imx8mq-<wbr>evk-inmate.dtb -c &quot;clk_ignore_unused console=3Dttymxc0,=
115200 earlycon=3Dec_imx6q,0x30860000,<wbr>115200 root=3D/dev/mmcblk1p2 roo=
twait rw&quot;</b></div></div></blockquote><div><br></div><div>Change the r=
oot to /dev/mmcblk2p2 according to your boot log. The 2nd linux take the em=
mc on board as the rootfs storage media.</div><div>So you need first use uu=
u to burn the sdcard image to the emmc device on board. And the 2nd linux w=
ill use the other uart as normal console,</div><div>it take the 1st linux u=
art as early console.</div><div><br></div><div>Regards,</div><div>Peng.</di=
v><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;borde=
r-left:1px solid rgb(204,204,204);padding-left:1ex"><div dir=3D"ltr"><div><=
br></div><div><br></div><div>=C2=A0=C2=A0=C2=A0 Below are logs:</div><div><=
br></div><div>=C2=A0=C2=A0=C2=A0 <b>Adding virtual PCI device 00:00.0 to ce=
ll &quot;linux-inmate-demo&quot;<br>Shared memory connection established, p=
eer cells:<br>=C2=A0&quot;imx8mq&quot;<br>Adding virtual PCI device 00:01.0=
 to cell &quot;linux-inmate-demo&quot;<br>Shared memory connection establis=
hed, peer cells:<br>=C2=A0&quot;imx8mq&quot;<br>Created cell &quot;linux-in=
mate-demo&quot;<br>Page pool usage after cell creation: mem 80/992, remap 1=
44/131072<br>[ 1021.954940] Created Jailhouse cell &quot;linux-inmate-demo&=
quot;<br>Cell &quot;linux-inmate-demo&quot; can be loaded<br>Started cell &=
quot;linux-inmate-demo&quot;<br>[=C2=A0=C2=A0=C2=A0 0.000000] Booting Linux=
 on physical CPU 0x0000000002 [0x410fd034]<br>[=C2=A0=C2=A0=C2=A0 0.000000]=
 Linux version 5.4.24-2.1.0+gbabac00 (oe-user@oe-host) (gcc version 9.2.0 (=
GCC)) #1 SMP PREEMPT Tue Jul 28 08:36:15 UTC 2020<br>[=C2=A0=C2=A0=C2=A0 0.=
000000] Machine model: Freescale i.MX8MQ EVK<br>[=C2=A0=C2=A0=C2=A0 0.00000=
0] earlycon: ec_imx6q0 at MMIO 0x0000000030860000 (options &#39;115200&#39;=
)<br>[=C2=A0=C2=A0=C2=A0 0.000000] printk: bootconsole [ec_imx6q0] enabled<=
br>[=C2=A0=C2=A0=C2=A0 0.000000] efi: Getting EFI parameters from FDT:<br>[=
=C2=A0=C2=A0=C2=A0 0.000000] efi: UEFI not found.<br>[=C2=A0=C2=A0=C2=A0 0.=
000000] cma: Reserved 320 MiB at 0x00000000e8000000<br>[=C2=A0=C2=A0=C2=A0 =
0.000000] NUMA: No NUMA configuration found<br>[=C2=A0=C2=A0=C2=A0 0.000000=
] NUMA: Faking a node at [mem 0x00000000c0000000-<wbr>0x00000000fdbfffff]<b=
r>[=C2=A0=C2=A0=C2=A0 0.000000] NUMA: NODE_DATA [mem 0xfda0d500-0xfda0efff]=
<br>[=C2=A0=C2=A0=C2=A0 0.000000] Zone ranges:<br>[=C2=A0=C2=A0=C2=A0 0.000=
000]=C2=A0=C2=A0 DMA32=C2=A0=C2=A0=C2=A0 [mem 0x00000000c0000000-<wbr>0x000=
00000fdbfffff]<br>[=C2=A0=C2=A0=C2=A0 0.000000]=C2=A0=C2=A0 Normal=C2=A0=C2=
=A0 empty<br>[=C2=A0=C2=A0=C2=A0 0.000000] Movable zone start for each node=
<br>[=C2=A0=C2=A0=C2=A0 0.000000] Early memory node ranges<br>[=C2=A0=C2=A0=
=C2=A0 0.000000]=C2=A0=C2=A0 node=C2=A0=C2=A0 0: [mem 0x00000000c0000000-<w=
br>0x00000000fdbfffff]<br>[=C2=A0=C2=A0=C2=A0 0.000000] Initmem setup node =
0 [mem 0x00000000c0000000-<wbr>0x00000000fdbfffff]<br>[=C2=A0=C2=A0=C2=A0 0=
.000000] psci: probing for conduit method from DT.<br>[=C2=A0=C2=A0=C2=A0 0=
.000000] psci: PSCIv1.1 detected in firmware.<br>[=C2=A0=C2=A0=C2=A0 0.0000=
00] psci: Using standard PSCI v0.2 function IDs<br>[=C2=A0=C2=A0=C2=A0 0.00=
0000] psci: MIGRATE_INFO_TYPE not supported.<br>[=C2=A0=C2=A0=C2=A0 0.00000=
0] psci: SMC Calling Convention v1.1<br>[=C2=A0=C2=A0=C2=A0 0.000000] percp=
u: Embedded 24 pages/cpu s58904 r8192 d31208 u98304<br>[=C2=A0=C2=A0=C2=A0 =
0.000000] Detected VIPT I-cache on CPU0<br>[=C2=A0=C2=A0=C2=A0 0.000000] CP=
U features: detected: ARM erratum 845719<br>[=C2=A0=C2=A0=C2=A0 0.000000] C=
PU features: detected: GIC system register CPU interface<br>[=C2=A0=C2=A0=
=C2=A0 0.000000] Built 1 zonelists, mobility grouping on.=C2=A0 Total pages=
: 248976<br>[=C2=A0=C2=A0=C2=A0 0.000000] Policy zone: DMA32<br>[=C2=A0=C2=
=A0=C2=A0 0.000000] Kernel command line: clk_ignore_unused console=3Dttymxc=
0,115200 earlycon=3Dec_imx6q,0x30860000,<wbr>115200 root=3D/dev/mmcblk1p2 r=
ootwait rw<br>[=C2=A0=C2=A0=C2=A0 0.000000] Dentry cache hash table entries=
: 131072 (order: 8, 1048576 bytes, linear)<br>[=C2=A0=C2=A0=C2=A0 0.000000]=
 Inode-cache hash table entries: 65536 (order: 7, 524288 bytes, linear)<br>=
[=C2=A0=C2=A0=C2=A0 0.000000] mem auto-init: stack:off, heap alloc:off, hea=
p free:off<br>[=C2=A0=C2=A0=C2=A0 0.000000] Memory: 635512K/1011712K availa=
ble (16444K kernel code, 1444K rwdata, 6472K rodata, 2944K init, 1017K bss,=
 48520K reserved, 327680K cma-reserved)<br>[=C2=A0=C2=A0=C2=A0 0.000000] SL=
UB: HWalign=3D64, Order=3D0-3, MinObjects=3D0, CPUs=3D2, Nodes=3D1<br>[=C2=
=A0=C2=A0=C2=A0 0.000000] rcu: Preemptible hierarchical RCU implementation.=
<br>[=C2=A0=C2=A0=C2=A0 0.000000] rcu:=C2=A0=C2=A0=C2=A0=C2=A0 RCU restrict=
ing CPUs from NR_CPUS=3D256 to nr_cpu_ids=3D2.<br>[=C2=A0=C2=A0=C2=A0 0.000=
000]=C2=A0 Tasks RCU enabled.<br>[=C2=A0=C2=A0=C2=A0 0.000000] rcu: RCU cal=
culated value of scheduler-enlistment delay is 25 jiffies.<br>[=C2=A0=C2=A0=
=C2=A0 0.000000] rcu: Adjusting geometry for rcu_fanout_leaf=3D16, nr_cpu_i=
ds=3D2<br>[=C2=A0=C2=A0=C2=A0 0.000000] NR_IRQS: 64, nr_irqs: 64, prealloca=
ted irqs: 0<br>[=C2=A0=C2=A0=C2=A0 0.000000] GICv3: 128 SPIs implemented<br=
>[=C2=A0=C2=A0=C2=A0 0.000000] GICv3: 0 Extended SPIs implemented<br>[=C2=
=A0=C2=A0=C2=A0 0.000000] GICv3: Distributor has no Range Selector support<=
br>[=C2=A0=C2=A0=C2=A0 0.000000] GICv3: 16 PPIs implemented<br>[=C2=A0=C2=
=A0=C2=A0 0.000000] GICv3: no VLPI support, no direct LPI support<br>[=C2=
=A0=C2=A0=C2=A0 0.000000] GICv3: CPU0: found redistributor 2 region 0:0x000=
00000388c0000<br>[=C2=A0=C2=A0=C2=A0 0.000000] ITS: No ITS available, not e=
nabling LPIs<br>[=C2=A0=C2=A0=C2=A0 0.000000] random: get_random_bytes call=
ed from start_kernel+0x2b8/0x44c with crng_init=3D0<br>[=C2=A0=C2=A0=C2=A0 =
0.000000] arch_timer: cp15 timer(s) running at 8.33MHz (virt).<br>[=C2=A0=
=C2=A0=C2=A0 0.000000] clocksource: arch_sys_counter: mask: 0xfffffffffffff=
f max_cycles: 0x1ec0311ec, max_idle_ns: 440795202152 ns<br>[=C2=A0=C2=A0=C2=
=A0 0.000004] sched_clock: 56 bits at 8MHz, resolution 120ns, wraps every 2=
199023255541ns<br>[=C2=A0=C2=A0=C2=A0 0.008121] Console: colour dummy devic=
e 80x25<br>[=C2=A0=C2=A0=C2=A0 0.012473] Calibrating delay loop (skipped), =
value calculated using timer frequency.. 16.66 BogoMIPS (lpj=3D33333)<br>[=
=C2=A0=C2=A0=C2=A0 0.022664] pid_max: default: 32768 minimum: 301<br>[=C2=
=A0=C2=A0=C2=A0 0.027337] LSM: Security Framework initializing<br>[=C2=A0=
=C2=A0=C2=A0 0.031915] Mount-cache hash table entries: 2048 (order: 2, 1638=
4 bytes, linear)<br>[=C2=A0=C2=A0=C2=A0 0.039248] Mountpoint-cache hash tab=
le entries: 2048 (order: 2, 16384 bytes, linear)<br>[=C2=A0=C2=A0=C2=A0 0.0=
71135] ASID allocator initialised with 32768 entries<br>[=C2=A0=C2=A0=C2=A0=
 0.079137] rcu: Hierarchical SRCU implementation.<br>[=C2=A0=C2=A0=C2=A0 0.=
087271] EFI services will not be available.<br>[=C2=A0=C2=A0=C2=A0 0.095177=
] smp: Bringing up secondary CPUs ...<br>[=C2=A0=C2=A0=C2=A0 0.127296] Dete=
cted VIPT I-cache on CPU1<br>[=C2=A0=C2=A0=C2=A0 0.127333] GICv3: CPU1: fou=
nd redistributor 3 region 0:0x00000000388e0000<br>[=C2=A0=C2=A0=C2=A0 0.127=
374] CPU1: Booted secondary processor 0x0000000003 [0x410fd034]<br>[=C2=A0=
=C2=A0=C2=A0 0.127452] smp: Brought up 1 node, 2 CPUs<br>[=C2=A0=C2=A0=C2=
=A0 0.146060] SMP: Total of 2 processors activated.<br>[=C2=A0=C2=A0=C2=A0 =
0.150745] CPU features: detected: 32-bit EL0 Support<br>[=C2=A0=C2=A0=C2=A0=
 0.155882] CPU features: detected: CRC32 instructions<br>[=C2=A0=C2=A0=C2=
=A0 0.171395] CPU: All CPU(s) started at EL1<br>[=C2=A0=C2=A0=C2=A0 0.17264=
3] alternatives: patching kernel code<br>[=C2=A0=C2=A0=C2=A0 0.178327] devt=
mpfs: initialized<br>[=C2=A0=C2=A0=C2=A0 0.182016] clocksource: jiffies: ma=
sk: 0xffffffff max_cycles: 0xffffffff, max_idle_ns: 7645041785100000 ns<br>=
[=C2=A0=C2=A0=C2=A0 0.190093] futex hash table entries: 512 (order: 3, 3276=
8 bytes, linear)<br>[=C2=A0=C2=A0=C2=A0 0.205814] pinctrl core: initialized=
 pinctrl subsystem<br>[=C2=A0=C2=A0=C2=A0 0.208766] DMI not present or inva=
lid.<br>[=C2=A0=C2=A0=C2=A0 0.212295] NET: Registered protocol family 16<br=
>[=C2=A0=C2=A0=C2=A0 0.226844] DMA: preallocated 256 KiB pool for atomic al=
locations<br>[=C2=A0=C2=A0=C2=A0 0.230091] audit: initializing netlink subs=
ys (disabled)<br>[=C2=A0=C2=A0=C2=A0 0.235625] audit: type=3D2000 audit(0.2=
00:1): state=3Dinitialized audit_enabled=3D0 res=3D1<br>[=C2=A0=C2=A0=C2=A0=
 0.243221] cpuidle: using governor menu<br>[=C2=A0=C2=A0=C2=A0 0.247461] hw=
-breakpoint: found 6 breakpoint and 4 watchpoint registers.<br>[=C2=A0=C2=
=A0=C2=A0 0.254239] Serial: AMBA PL011 UART driver<br>[=C2=A0=C2=A0=C2=A0 0=
.258022] imx mu driver is registered.<br>[=C2=A0=C2=A0=C2=A0 0.261865] imx =
rpmsg driver is registered.<br>[=C2=A0=C2=A0=C2=A0 0.283632] HugeTLB regist=
ered 1.00 GiB page size, pre-allocated 0 pages<br>[=C2=A0=C2=A0=C2=A0 0.287=
485] HugeTLB registered 32.0 MiB page size, pre-allocated 0 pages<br>[=C2=
=A0=C2=A0=C2=A0 0.294161] HugeTLB registered 2.00 MiB page size, pre-alloca=
ted 0 pages<br>[=C2=A0=C2=A0=C2=A0 0.300846] HugeTLB registered 64.0 KiB pa=
ge size, pre-allocated 0 pages<br>[=C2=A0=C2=A0=C2=A0 0.309530] cryptd: max=
_cpu_qlen set to 1000<br>[=C2=A0=C2=A0=C2=A0 0.317166] ACPI: Interpreter di=
sabled.<br>[=C2=A0=C2=A0=C2=A0 0.318509] iommu: Default domain type: Transl=
ated<br>[=C2=A0=C2=A0=C2=A0 0.323154] vgaarb: loaded<br>[=C2=A0=C2=A0=C2=A0=
 0.325989] SCSI subsystem initialized<br>[=C2=A0=C2=A0=C2=A0 0.329830] usbc=
ore: registered new interface driver usbfs<br>[=C2=A0=C2=A0=C2=A0 0.334947]=
 usbcore: registered new interface driver hub<br>[=C2=A0=C2=A0=C2=A0 0.3404=
66] usbcore: registered new device driver usb<br>[=C2=A0=C2=A0=C2=A0 0.3455=
18] mc: Linux media interface: v0.10<br>[=C2=A0=C2=A0=C2=A0 0.349507] video=
dev: Linux video capture interface: v2.00<br>[=C2=A0=C2=A0=C2=A0 0.355017] =
pps_core: LinuxPPS API ver. 1 registered<br>[=C2=A0=C2=A0=C2=A0 0.359900] p=
ps_core: Software ver. 5.3.6 - Copyright 2005-2007 Rodolfo Giometti &lt;<a =
href=3D"javascript:" target=3D"_blank" gdf-obfuscated-mailto=3D"dNty2DPpBAA=
J" rel=3D"nofollow" onmousedown=3D"this.href=3D&#39;javascript:&#39;;return=
 true;" onclick=3D"this.href=3D&#39;javascript:&#39;;return true;">giom...@=
linux.it</a>&gt;<br>[=C2=A0=C2=A0=C2=A0 0.369034] PTP clock support registe=
red<br>[=C2=A0=C2=A0=C2=A0 0.372976] EDAC MC: Ver: 3.0.0<br>[=C2=A0=C2=A0=
=C2=A0 0.376456] No BMan portals available!<br>[=C2=A0=C2=A0=C2=A0 0.379991=
] QMan: Allocated lookup table at (____ptrval____), entry count 65537<br>[=
=C2=A0=C2=A0=C2=A0 0.387121] No QMan portals available!<br>[=C2=A0=C2=A0=C2=
=A0 0.390844] No USDPAA memory, no &#39;fsl,usdpaa-mem&#39; in device-tree<=
br>[=C2=A0=C2=A0=C2=A0 0.397047] FPGA manager framework<br>[=C2=A0=C2=A0=C2=
=A0 0.400255] Advanced Linux Sound Architecture Driver Initialized.<br>[=C2=
=A0=C2=A0=C2=A0 0.406683] Bluetooth: Core ver 2.22<br>[=C2=A0=C2=A0=C2=A0 0=
.409838] NET: Registered protocol family 31<br>[=C2=A0=C2=A0=C2=A0 0.414246=
] Bluetooth: HCI device and connection manager initialized<br>[=C2=A0=C2=A0=
=C2=A0 0.420580] Bluetooth: HCI socket layer initialized<br>[=C2=A0=C2=A0=
=C2=A0 0.425440] Bluetooth: L2CAP socket layer initialized<br>[=C2=A0=C2=A0=
=C2=A0 0.430494] Bluetooth: SCO socket layer initialized<br>[=C2=A0=C2=A0=
=C2=A0 0.435863] clocksource: Switched to clocksource arch_sys_counter<br>[=
=C2=A0=C2=A0=C2=A0 0.441553] VFS: Disk quotas dquot_6.6.0<br>[=C2=A0=C2=A0=
=C2=A0 0.445367] VFS: Dquot-cache hash table entries: 512 (order 0, 4096 by=
tes)<br>[=C2=A0=C2=A0=C2=A0 0.452334] pnp: PnP ACPI: disabled<br>[=C2=A0=C2=
=A0=C2=A0 0.462170] thermal_sys: Registered thermal governor &#39;step_wise=
&#39;<br>[=C2=A0=C2=A0=C2=A0 0.462173] thermal_sys: Registered thermal gove=
rnor &#39;power_allocator&#39;<br>[=C2=A0=C2=A0=C2=A0 0.465472] NET: Regist=
ered protocol family 2<br>[=C2=A0=C2=A0=C2=A0 0.476511] tcp_listen_portaddr=
_hash hash table entries: 512 (order: 1, 8192 bytes, linear)<br>[=C2=A0=C2=
=A0=C2=A0 0.484540] TCP established hash table entries: 8192 (order: 4, 655=
36 bytes, linear)<br>[=C2=A0=C2=A0=C2=A0 0.492302] TCP bind hash table entr=
ies: 8192 (order: 5, 131072 bytes, linear)<br>[=C2=A0=C2=A0=C2=A0 0.499571]=
 TCP: Hash tables configured (established 8192 bind 8192)<br>[=C2=A0=C2=A0=
=C2=A0 0.505845] UDP hash table entries: 512 (order: 2, 16384 bytes, linear=
)<br>[=C2=A0=C2=A0=C2=A0 0.512401] UDP-Lite hash table entries: 512 (order:=
 2, 16384 bytes, linear)<br>[=C2=A0=C2=A0=C2=A0 0.519510] NET: Registered p=
rotocol family 1<br>[=C2=A0=C2=A0=C2=A0 0.524157] RPC: Registered named UNI=
X socket transport module.<br>[=C2=A0=C2=A0=C2=A0 0.529649] RPC: Registered=
 udp transport module.<br>[=C2=A0=C2=A0=C2=A0 0.534334] RPC: Registered tcp=
 transport module.<br>[=C2=A0=C2=A0=C2=A0 0.539023] RPC: Registered tcp NFS=
v4.1 backchannel transport module.<br>[=C2=A0=C2=A0=C2=A0 0.545810] PCI: CL=
S 0 bytes, default 64<br>[=C2=A0=C2=A0=C2=A0 0.549924] kvm [1]: HYP mode no=
t available<br>[=C2=A0=C2=A0=C2=A0 0.559322] Initialise system trusted keyr=
ings<br>[=C2=A0=C2=A0=C2=A0 0.561042] workingset: timestamp_bits=3D44 max_o=
rder=3D18 bucket_order=3D0<br>[=C2=A0=C2=A0=C2=A0 0.574077] squashfs: versi=
on 4.0 (2009/01/31) Phillip Lougher<br>[=C2=A0=C2=A0=C2=A0 0.577766] NFS: R=
egistering the id_resolver key type<br>[=C2=A0=C2=A0=C2=A0 0.582117] Key ty=
pe id_resolver registered<br>[=C2=A0=C2=A0=C2=A0 0.586255] Key type id_lega=
cy registered<br>[=C2=A0=C2=A0=C2=A0 0.590256] nfs4filelayout_init: NFSv4 F=
ile Layout Driver Registering...<br>[=C2=A0=C2=A0=C2=A0 0.596947] jffs2: ve=
rsion 2.2. (NAND) =C2=A9 2001-2006 Red Hat, Inc.<br>[=C2=A0=C2=A0=C2=A0 0.6=
03415] 9p: Installing v9fs 9p2000 file system support<br>[=C2=A0=C2=A0=C2=
=A0 0.623963] Key type asymmetric registered<br>[=C2=A0=C2=A0=C2=A0 0.62519=
7] Asymmetric key parser &#39;x509&#39; registered<br>[=C2=A0=C2=A0=C2=A0 0=
.630097] Block layer SCSI generic (bsg) driver version 0.4 loaded (major 24=
4)<br>[=C2=A0=C2=A0=C2=A0 0.637464] io scheduler mq-deadline registered<br>=
[=C2=A0=C2=A0=C2=A0 0.641963] io scheduler kyber registered<br>[=C2=A0=C2=
=A0=C2=A0 0.646985] pci-host-generic bfb00000.pci: host bridge /pci@bfb0000=
0 ranges:<br>[=C2=A0=C2=A0=C2=A0 0.653010] pci-host-generic bfb00000.pci:=
=C2=A0=C2=A0 MEM 0x10000000..0x1000ffff -&gt; 0x10000000<br>[=C2=A0=C2=A0=
=C2=A0 0.660844] pci-host-generic bfb00000.pci: ECAM at [mem 0xbfb00000-0xb=
fbfffff] for [bus 00]<br>[=C2=A0=C2=A0=C2=A0 0.669234] pci-host-generic bfb=
00000.pci: PCI host bridge to bus 0000:00<br>[=C2=A0=C2=A0=C2=A0 0.675904] =
pci_bus 0000:00: root bus resource [bus 00]<br>[=C2=A0=C2=A0=C2=A0 0.681117=
] pci_bus 0000:00: root bus resource [mem 0x10000000-0x1000ffff]<br>[=C2=A0=
=C2=A0=C2=A0 0.687999] pci 0000:00:00.0: [110a:4106] type 00 class 0xff0000=
<br>[=C2=A0=C2=A0=C2=A0 0.693983] pci 0000:00:00.0: reg 0x10: [mem 0x000000=
00-0x00000fff]<br>[=C2=A0=C2=A0=C2=A0 0.700441] pci 0000:00:01.0: [110a:410=
6] type 00 class 0xff0001<br>[=C2=A0=C2=A0=C2=A0 0.706215] pci 0000:00:01.0=
: reg 0x10: [mem 0x00000000-0x00000fff]<br>[=C2=A0=C2=A0=C2=A0 0.712846] pc=
i 0000:00:00.0: BAR 0: assigned [mem 0x10000000-0x10000fff]<br>[=C2=A0=C2=
=A0=C2=A0 0.719226] pci 0000:00:01.0: BAR 0: assigned [mem 0x10001000-0x100=
01fff]<br>[=C2=A0=C2=A0=C2=A0 0.730661] EINJ: ACPI disabled.<br>[=C2=A0=C2=
=A0=C2=A0 0.731846] Bus freq driver module loaded<br>[=C2=A0=C2=A0=C2=A0 0.=
738437] Serial: 8250/16550 driver, 4 ports, IRQ sharing enabled<br>[=C2=A0=
=C2=A0=C2=A0 0.743272] 30890000.serial: ttymxc1 at MMIO 0x30890000 (irq =3D=
 5, base_baud =3D 1562500) is a IMX<br>[=C2=A0=C2=A0=C2=A0 0.758802] loop: =
module loaded<br>[=C2=A0=C2=A0=C2=A0 0.760497] imx ahci driver is registere=
d.<br>[=C2=A0=C2=A0=C2=A0 0.764652] libphy: Fixed MDIO Bus: probed<br>[=C2=
=A0=C2=A0=C2=A0 0.768138] tun: Universal TUN/TAP device driver, 1.6<br>[=C2=
=A0=C2=A0=C2=A0 0.772584] thunder_xcv, ver 1.0<br>[=C2=A0=C2=A0=C2=A0 0.775=
525] thunder_bgx, ver 1.0<br>[=C2=A0=C2=A0=C2=A0 0.778759] nicpf, ver 1.0<b=
r>[=C2=A0=C2=A0=C2=A0 0.781574] Freescale FM module, FMD API version 21.1.0=
<br>[=C2=A0=C2=A0=C2=A0 0.786667] Freescale FM Ports module<br>[=C2=A0=C2=
=A0=C2=A0 0.790255] fsl_mac: fsl_mac: FSL FMan MAC API based driver<br>[=C2=
=A0=C2=A0=C2=A0 0.795852] fsl_dpa: FSL DPAA Ethernet driver<br>[=C2=A0=C2=
=A0=C2=A0 0.800190] fsl_advanced: FSL DPAA Advanced drivers:<br>[=C2=A0=C2=
=A0=C2=A0 0.805098] fsl_proxy: FSL DPAA Proxy initialization driver<br>[=C2=
=A0=C2=A0=C2=A0 0.810691] fsl_oh: FSL FMan Offline Parsing port driver<br>[=
=C2=A0=C2=A0=C2=A0 0.816330] hclge is initializing<br>[=C2=A0=C2=A0=C2=A0 0=
.819240] hns3: Hisilicon Ethernet Network Driver for Hip08 Family - version=
<br>[=C2=A0=C2=A0=C2=A0 0.826457] hns3: Copyright (c) 2017 Huawei Corporati=
on.<br>[=C2=A0=C2=A0=C2=A0 0.831800] e1000: Intel(R) PRO/1000 Network Drive=
r - version 7.3.21-k8-NAPI<br>[=C2=A0=C2=A0=C2=A0 0.838777] e1000: Copyrigh=
t (c) 1999-2006 Intel Corporation.<br>[=C2=A0=C2=A0=C2=A0 0.844545] e1000e:=
 Intel(R) PRO/1000 Network Driver - 3.2.6-k<br>[=C2=A0=C2=A0=C2=A0 0.850324=
] e1000e: Copyright(c) 1999 - 2015 Intel Corporation.<br>[=C2=A0=C2=A0=C2=
=A0 0.856268] igb: Intel(R) Gigabit Ethernet Network Driver - version 5.6.0=
-k<br>[=C2=A0=C2=A0=C2=A0 0.863169] igb: Copyright (c) 2007-2014 Intel Corp=
oration.<br>[=C2=A0=C2=A0=C2=A0 0.868770] igbvf: Intel(R) Gigabit Virtual F=
unction Network Driver - version 2.4.0-k<br>[=C2=A0=C2=A0=C2=A0 0.876539] i=
gbvf: Copyright (c) 2009 - 2012 Intel Corporation.<br>[=C2=A0=C2=A0=C2=A0 0=
.882511] sky2: driver version 1.30<br>[=C2=A0=C2=A0=C2=A0 0.886445] ivshmem=
-net 0000:00:01.0: enabling device (0000 -&gt; 0002)<br>[=C2=A0=C2=A0=C2=A0=
 0.892506] ivshmem-net 0000:00:01.0: TX memory at 0x00000000bfe80000, size =
0x000000000007f000<br>[=C2=A0=C2=A0=C2=A0 0.901024] ivshmem-net 0000:00:01.=
0: RX memory at 0x00000000bfe01000, size 0x000000000007f000<br>_ivshmem 000=
0:00:00.0: state_table at 0x00000000bfd00000, size 0x0000000000001000om6s 3=
] dy<br>[=C2=A0=C2=A0=C2=A0 0.924815] uio_ivshmem 0000:00:00.0: rw_section =
at 0x00000000bfd01000, size 0x0000000000009000<br>[=C2=A0=C2=A0=C2=A0 0.933=
489] uio_ivshmem 0000:00:00.0: input_sections at 0x00000000bfd0a000, size 0=
x0000000000006000<br>[=C2=A0=C2=A0=C2=A0 0.942511] uio_ivshmem 0000:00:00.0=
: output_section at 0x00000000bfd0e000, size 0x0000000000002000<br>[=C2=A0=
=C2=A0=C2=A0 0.951977] VFIO - User Level meta-driver version: 0.3<br>[=C2=
=A0=C2=A0=C2=A0 0.957373] ehci_hcd: USB 2.0 &#39;Enhanced&#39; Host Control=
ler (EHCI) Driver<br>[=C2=A0=C2=A0=C2=A0 0.963176] ehci-pci: EHCI PCI platf=
orm driver<br>[=C2=A0=C2=A0=C2=A0 0.967627] ehci-platform: EHCI generic pla=
tform driver<br>[=C2=A0=C2=A0=C2=A0 0.972839] ohci_hcd: USB 1.1 &#39;Open&#=
39; Host Controller (OHCI) Driver<br>[=C2=A0=C2=A0=C2=A0 0.978981] ohci-pci=
: OHCI PCI platform driver<br>[=C2=A0=C2=A0=C2=A0 0.983424] ohci-platform: =
OHCI generic platform driver<br>[=C2=A0=C2=A0=C2=A0 0.988740] usbcore: regi=
stered new interface driver usb-storage<br>[=C2=A0=C2=A0=C2=A0 0.994651] us=
bcore: registered new interface driver usbserial_generic<br>[=C2=A0=C2=A0=
=C2=A0 1.001115] usbserial: USB Serial support registered for generic<br>[=
=C2=A0=C2=A0=C2=A0 1.007108] usbcore: registered new interface driver ftdi_=
sio<br>[=C2=A0=C2=A0=C2=A0 1.012831] usbserial: USB Serial support register=
ed for FTDI USB Serial Device<br>[=C2=A0=C2=A0=C2=A0 1.020135] usbcore: reg=
istered new interface driver usb_serial_simple<br>[=C2=A0=C2=A0=C2=A0 1.026=
643] usbserial: USB Serial support registered for carelink<br>[=C2=A0=C2=A0=
=C2=A0 1.032709] usbserial: USB Serial support registered for zio<br>[=C2=
=A0=C2=A0=C2=A0 1.038351] usbserial: USB Serial support registered for funs=
oft<br>[=C2=A0=C2=A0=C2=A0 1.044350] usbserial: USB Serial support register=
ed for flashloader<br>[=C2=A0=C2=A0=C2=A0 1.050679] usbserial: USB Serial s=
upport registered for google<br>[=C2=A0=C2=A0=C2=A0 1.056583] usbserial: US=
B Serial support registered for libtransistor<br>[=C2=A0=C2=A0=C2=A0 1.0630=
90] usbserial: USB Serial support registered for vivopay<br>[=C2=A0=C2=A0=
=C2=A0 1.069080] usbserial: USB Serial support registered for moto_modem<br=
>[=C2=A0=C2=A0=C2=A0 1.075333] usbserial: USB Serial support registered for=
 motorola_tetra<br>[=C2=A0=C2=A0=C2=A0 1.081930] usbserial: USB Serial supp=
ort registered for novatel_gps<br>[=C2=A0=C2=A0=C2=A0 1.088278] usbserial: =
USB Serial support registered for hp4x<br>[=C2=A0=C2=A0=C2=A0 1.093993] usb=
serial: USB Serial support registered for suunto<br>[=C2=A0=C2=A0=C2=A0 1.0=
99901] usbserial: USB Serial support registered for siemens_mpi<br>[=C2=A0=
=C2=A0=C2=A0 1.107246] i2c /dev entries driver<br>[=C2=A0=C2=A0=C2=A0 1.110=
345] Bluetooth: HCI UART driver ver 2.3<br>[=C2=A0=C2=A0=C2=A0 1.114127] Bl=
uetooth: HCI UART protocol H4 registered<br>[=C2=A0=C2=A0=C2=A0 1.119245] B=
luetooth: HCI UART protocol BCSP registered<br>[=C2=A0=C2=A0=C2=A0 1.124556=
] Bluetooth: HCI UART protocol LL registered<br>[=C2=A0=C2=A0=C2=A0 1.12966=
0] Bluetooth: HCI UART protocol ATH3K registered<br>[=C2=A0=C2=A0=C2=A0 1.1=
35056] Bluetooth: HCI UART protocol Three-wire (H5) registered<br>[=C2=A0=
=C2=A0=C2=A0 1.141326] Bluetooth: HCI UART protocol Broadcom registered<br>=
[=C2=A0=C2=A0=C2=A0 1.146950] Bluetooth: HCI UART protocol QCA registered<b=
r>[=C2=A0=C2=A0=C2=A0 1.152285] imx-cpufreq-dt: probe of imx-cpufreq-dt fai=
led with error -2<br>[=C2=A0=C2=A0=C2=A0 1.159033] sdhci: Secure Digital Ho=
st Controller Interface driver<br>[=C2=A0=C2=A0=C2=A0 1.164990] sdhci: Copy=
right(c) Pierre Ossman<br>[=C2=A0=C2=A0=C2=A0 1.169392] Synopsys Designware=
 Multimedia Card Interface Driver<br>[=C2=A0=C2=A0=C2=A0 1.175449] sdhci-pl=
tfm: SDHCI platform and OF driver helper<br>[=C2=A0=C2=A0=C2=A0 1.181146] s=
dhci-esdhc-imx 30b40000.mmc: could not get pinctrl<br>[=C2=A0=C2=A0=C2=A0 1=
.218013] mmc2: SDHCI controller on 30b40000.mmc [30b40000.mmc] using ADMA<b=
r>[=C2=A0=C2=A0=C2=A0 1.222834] ledtrig-cpu: registered to indicate activit=
y on CPUs<br>[=C2=A0=C2=A0=C2=A0 1.229160] usbcore: registered new interfac=
e driver usbhid<br>[=C2=A0=C2=A0=C2=A0 1.233823] usbhid: USB HID core drive=
r<br>[=C2=A0=C2=A0=C2=A0 1.238352] No fsl,qman node<br>[=C2=A0=C2=A0=C2=A0 =
1.240462] Freescale USDPAA process driver<br>[=C2=A0=C2=A0=C2=A0 1.244627] =
fsl-usdpaa: no region found<br>[=C2=A0=C2=A0=C2=A0 1.248477] Freescale USDP=
AA process IRQ driver<br>[=C2=A0=C2=A0=C2=A0 1.257304] pktgen: Packet Gener=
ator for packet performance testing. Version: 2.75<br>[=C2=A0=C2=A0=C2=A0 1=
.262307] NET: Registered protocol family 26<br>[=C2=A0=C2=A0=C2=A0 1.267090=
] NET: Registered protocol family 10<br>[=C2=A0=C2=A0=C2=A0 1.271591] Segme=
nt Routing with IPv6<br>[=C2=A0=C2=A0=C2=A0 1.274573] NET: Registered proto=
col family 17<br>[=C2=A0=C2=A0=C2=A0 1.279040] Bluetooth: RFCOMM TTY layer =
initialized<br>[=C2=A0=C2=A0=C2=A0 1.283840] Bluetooth: RFCOMM socket layer=
 initialized<br>[=C2=A0=C2=A0=C2=A0 1.288955] Bluetooth: RFCOMM ver 1.11<br=
>[=C2=A0=C2=A0=C2=A0 1.292683] Bluetooth: BNEP (Ethernet Emulation) ver 1.3=
<br>[=C2=A0=C2=A0=C2=A0 1.297958] Bluetooth: BNEP filters: protocol multica=
st<br>[=C2=A0=C2=A0=C2=A0 1.303185] Bluetooth: BNEP socket layer initialize=
d<br>[=C2=A0=C2=A0=C2=A0 1.308126] Bluetooth: HIDP (Human Interface Emulati=
on) ver 1.2<br>[=C2=A0=C2=A0=C2=A0 1.314021] Bluetooth: HIDP socket layer i=
nitialized<br>[=C2=A0=C2=A0=C2=A0 1.319004] 8021q: 802.1Q VLAN Support v1.8=
<br>[=C2=A0=C2=A0=C2=A0 1.323167] lib80211: common routines for IEEE802.11 =
drivers<br>[=C2=A0=C2=A0=C2=A0 1.328915] 9pnet: Installing 9P2000 support<b=
r>[=C2=A0=C2=A0=C2=A0 1.333060] tsn generic netlink module v1 init...<br>[=
=C2=A0=C2=A0=C2=A0 1.337781] Key type dns_resolver registered<br>[=C2=A0=C2=
=A0=C2=A0 1.342482] registered taskstats version 1<br>[=C2=A0=C2=A0=C2=A0 1=
.346064] Loading compiled-in X.509 certificates<br>[=C2=A0=C2=A0=C2=A0 1.35=
2505] hctosys: unable to open rtc device (rtc0)<br>[=C2=A0=C2=A0=C2=A0 1.35=
5965] cfg80211: Loading compiled-in X.509 certificates for regulatory datab=
ase<br>[=C2=A0=C2=A0=C2=A0 1.365244] cfg80211: Loaded X.509 cert &#39;sfors=
hee: 00b28ddf47aef9cea7&#39;<br>[=C2=A0=C2=A0=C2=A0 1.370196] platform regu=
latory.0: Direct firmware load for regulatory.db failed with error -2<br>[=
=C2=A0=C2=A0=C2=A0 1.371872] clk: Not disabling unused clocks<br>[=C2=A0=C2=
=A0=C2=A0 1.378719] platform regulatory.0: Falling back to sysfs fallback f=
or: regulatory.db<br>[=C2=A0=C2=A0=C2=A0 1.382975] ALSA device list:<br>[=
=C2=A0=C2=A0=C2=A0 1.393625]=C2=A0=C2=A0 No soundcards found.<br>[=C2=A0=C2=
=A0=C2=A0 1.397057] Warning: unable to open an initial console.<br>[=C2=A0=
=C2=A0=C2=A0 1.402301] Waiting for root device /dev/mmcblk1p2...<br>[=C2=A0=
=C2=A0=C2=A0 1.417055] mmc2: new DDR MMC card at address 0001<br>[=C2=A0=C2=
=A0=C2=A0 1.419499] mmcblk2: mmc2:0001 DG4016 14.7 GiB<br>[=C2=A0=C2=A0=C2=
=A0 1.423711] mmcblk2boot0: mmc2:0001 DG4016 partition 1 4.00 MiB<br>[=C2=
=A0=C2=A0=C2=A0 1.429619] mmcblk2boot1: mmc2:0001 DG4016 partition 2 4.00 M=
iB<br>[=C2=A0=C2=A0=C2=A0 1.435431] mmcblk2rpmb: mmc2:0001 DG4016 partition=
 3 4.00 MiB, chardev (237:0)<br>[=C2=A0=C2=A0=C2=A0 1.452011]=C2=A0 mmcblk2=
: p1 p2<br>[=C2=A0=C2=A0 62.528001] cfg80211: failed to load regulatory.db<=
br></b><br></div></div>

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
om/d/msgid/jailhouse-dev/b36d3d7b-25ef-4ba4-bf63-77e511c2319eo%40googlegrou=
ps.com?utm_medium=3Demail&utm_source=3Dfooter">https://groups.google.com/d/=
msgid/jailhouse-dev/b36d3d7b-25ef-4ba4-bf63-77e511c2319eo%40googlegroups.co=
m</a>.<br />

------=_Part_1673_1826646733.1597214798889--

------=_Part_1672_1270494209.1597214798889--
