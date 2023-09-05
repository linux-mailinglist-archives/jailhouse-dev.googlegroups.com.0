Return-Path: <jailhouse-dev+bncBCWY74EX3IPRBUGY3OTQMGQESZJXYXY@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-pl1-x63d.google.com (mail-pl1-x63d.google.com [IPv6:2607:f8b0:4864:20::63d])
	by mail.lfdr.de (Postfix) with ESMTPS id EEBEE79212C
	for <lists+jailhouse-dev@lfdr.de>; Tue,  5 Sep 2023 10:52:34 +0200 (CEST)
Received: by mail-pl1-x63d.google.com with SMTP id d9443c01a7336-1bf6e47b5efsf22078625ad.2
        for <lists+jailhouse-dev@lfdr.de>; Tue, 05 Sep 2023 01:52:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20230601; t=1693903953; x=1694508753; darn=lfdr.de;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:x-original-sender:mime-version
         :subject:references:in-reply-to:message-id:to:from:date:sender:from
         :to:cc:subject:date:message-id:reply-to;
        bh=DYi+CmQeMtOOUCS7uvmuY+1dLU0xGvOnEzeZVZngJfs=;
        b=il1yhYv+EWTFkOoRDBGiBtwZRpvDN2/m0s30O+Hfipr85eE520NnlvLofkTq+Ndf/1
         N/gLVp2Ef6eqktWKn11bIMgt1p+8KzDF0uO32AqrhNKkYdm3UFFDGL+VEUkeF0HSf6Lo
         JlBm0QF65hM9PUQyZM6HEfmQawyvBYT/4qFIb1jsJ2JUwyisZO4Z8wVZwF4r9Cz88UnW
         yO7Y6TOswgEStzRyBESeBZPoD4a+m1A7ur4sw4M+cinFRiCds+x0mb+6SLCNyfInJwZo
         OyNb+Syhir8ZTlHQCeJEvgXu7mQCKdBSbmP1AwsSQqz9RZEP00GQKt3OVtxq+LLC2aWs
         QlUg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1693903953; x=1694508753; darn=lfdr.de;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:x-original-sender:mime-version
         :subject:references:in-reply-to:message-id:to:from:date:from:to:cc
         :subject:date:message-id:reply-to;
        bh=DYi+CmQeMtOOUCS7uvmuY+1dLU0xGvOnEzeZVZngJfs=;
        b=Y4XZaO7LEn3k+hDUM3gZkkdR3LCD9XqfrMjuKik5Mw5q0Eicw1MlgXd67lzOuapFEP
         T5ITs42QC3rkzTVf0TJztdSiJJ/OpxpAtvEbQQ8a4xPKeZseXjc71fm+xrckVY9MjZ9d
         0qJ+IfQaaZk7f5iT84+uSFd4eDl7d3JfgK/wd3ro0Pe3Yk1JaMadygGTn0DTQQFInvLc
         i4/1oRV1gVgDAS6qZsL/pOkfn8ki8Mmru9l0o1Q+/Ni5J33XoCf/xjYtkmFwxlv6EiL4
         9IKtdMehoR9/XETfQ+eDrxw/K7rUhbPJk1IIoGzsYvQHwynDwm0fV9DjrBGg9fObeSqN
         18EA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1693903953; x=1694508753;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :x-spam-checked-in-group:list-id:mailing-list:precedence
         :x-original-sender:mime-version:subject:references:in-reply-to
         :message-id:to:from:date:x-beenthere:x-gm-message-state:sender:from
         :to:cc:subject:date:message-id:reply-to;
        bh=DYi+CmQeMtOOUCS7uvmuY+1dLU0xGvOnEzeZVZngJfs=;
        b=cq+n6RDtpiE3xh00f0uL7kZd7F0ZGAwbW3ewuJtKeDtfhtyQYL0zcSDDD7fyKhRJN7
         ze2Q9VgTayV+9nL1eFN+z+CSomyA2gB2FN6yfTOLf3pdou6GfO3e/RydaBEE2xRigb1H
         2SsNIOiVE7pgeNsC17usun28ZuNuKi5WmGcBGGPwx/BYsAuh+t71oKtSEiuXur3m4xVc
         nKQ9qGZBKZpESgawQmRrktz4mSJ8pCBYFL9dbypuEPTti/sh0lRzZlIq71lLyoQvHpSw
         WJL6hoFK4D++RIuF5+900YWCL3qqOi1xl4jaw3Lsdb9l/UxSuEdtHiexjo4OFGCypTAw
         +yhA==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AOJu0YxVOQFdcLGXm/cT/BzlDU7LmTzg/uGIdcS2bAo/ViVTiaNYk/t4
	zEEAtXuhbPPJdhLPcbLdcbo=
X-Google-Smtp-Source: AGHT+IEnwhtMthOVAPMwBauwhdtvfIgEeR/ju9USmdI+kOvBqPvLndVorfFonfvgBTAL5fNmA839Yg==
X-Received: by 2002:a17:902:dacb:b0:1b0:3637:384e with SMTP id q11-20020a170902dacb00b001b03637384emr11892853plx.25.1693903953146;
        Tue, 05 Sep 2023 01:52:33 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a17:902:64c8:b0:1b6:8c9d:5961 with SMTP id
 y8-20020a17090264c800b001b68c9d5961ls3278868pli.2.-pod-prod-09-us; Tue, 05
 Sep 2023 01:52:31 -0700 (PDT)
X-Received: by 2002:a17:902:d48e:b0:1bc:1189:16d with SMTP id c14-20020a170902d48e00b001bc1189016dmr4356208plg.3.1693903951506;
        Tue, 05 Sep 2023 01:52:31 -0700 (PDT)
Date: Tue, 5 Sep 2023 01:52:30 -0700 (PDT)
From: Zhan Zheng <zzlossdev@gmail.com>
To: Jailhouse <jailhouse-dev@googlegroups.com>
Message-Id: <a5a7147d-750d-4000-87f5-6ca0cc93fcb2n@googlegroups.com>
In-Reply-To: <ca381c51-0921-42cf-ad8f-2b6f6727ce6dn@googlegroups.com>
References: <ca381c51-0921-42cf-ad8f-2b6f6727ce6dn@googlegroups.com>
Subject: Re: when enter_hypervisor on rk3568, system reboot without oops
MIME-Version: 1.0
Content-Type: multipart/mixed; 
	boundary="----=_Part_29111_332849216.1693903950076"
X-Original-Sender: zzlossdev@gmail.com
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

------=_Part_29111_332849216.1693903950076
Content-Type: multipart/alternative; 
	boundary="----=_Part_29112_1162426926.1693903950076"

------=_Part_29112_1162426926.1693903950076
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

dmesg in `screen-exchange`

=E5=9C=A82023=E5=B9=B49=E6=9C=885=E6=97=A5=E6=98=9F=E6=9C=9F=E4=BA=8C UTC+8=
 16:00:57<Zhan Zheng> =E5=86=99=E9=81=93=EF=BC=9A

> hello, everyone. I'm porting jailhouse to rk3568 which running open=20
> harmony.=20
> jailhouse.ko, jailhouse.bin, jailhouse were ready, and i wrote a basic=20
> root cell to test it.
> but when i `jailhouse enable rk3568.cell`, the system reboot. can someone=
=20
> help me pls?
> thanks
>

--=20
You received this message because you are subscribed to the Google Groups "=
Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/=
jailhouse-dev/a5a7147d-750d-4000-87f5-6ca0cc93fcb2n%40googlegroups.com.

------=_Part_29112_1162426926.1693903950076
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

dmesg in `screen-exchange`<br /><br /><div class=3D"gmail_quote"><div dir=
=3D"auto" class=3D"gmail_attr">=E5=9C=A82023=E5=B9=B49=E6=9C=885=E6=97=A5=
=E6=98=9F=E6=9C=9F=E4=BA=8C UTC+8 16:00:57&lt;Zhan Zheng> =E5=86=99=E9=81=
=93=EF=BC=9A<br/></div><blockquote class=3D"gmail_quote" style=3D"margin: 0=
 0 0 0.8ex; border-left: 1px solid rgb(204, 204, 204); padding-left: 1ex;">=
hello, everyone. I&#39;m porting jailhouse to rk3568 which running open har=
mony.=C2=A0<div>jailhouse.ko, jailhouse.bin, jailhouse were ready, and i wr=
ote a basic root cell to test it.</div><div>but when i `jailhouse enable rk=
3568.cell`, the system reboot. can someone help me pls?</div><div>thanks</d=
iv></blockquote></div>

<p></p>

-- <br />
You received this message because you are subscribed to the Google Groups &=
quot;Jailhouse&quot; group.<br />
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to <a href=3D"mailto:jailhouse-dev+unsubscribe@googlegroups.com">jailh=
ouse-dev+unsubscribe@googlegroups.com</a>.<br />
To view this discussion on the web visit <a href=3D"https://groups.google.c=
om/d/msgid/jailhouse-dev/a5a7147d-750d-4000-87f5-6ca0cc93fcb2n%40googlegrou=
ps.com?utm_medium=3Demail&utm_source=3Dfooter">https://groups.google.com/d/=
msgid/jailhouse-dev/a5a7147d-750d-4000-87f5-6ca0cc93fcb2n%40googlegroups.co=
m</a>.<br />

------=_Part_29112_1162426926.1693903950076--

------=_Part_29111_332849216.1693903950076
Content-Type: application/octet-stream; name=screen-exchange
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename=screen-exchange
X-Attachment-Id: c13b21ad-77a8-4463-9a3c-a5cb90df510e
Content-ID: <c13b21ad-77a8-4463-9a3c-a5cb90df510e>

Starting kernel ...

[    0.000000] Booting Linux on physical CPU 0x0000000000 [0x412fd050]
[    0.000000] Linux version 5.10.97 (zyz@zyz-MS-7D94) (OHOS (dev) clang version 12.0.1 (llvm-project 1971c85d809b8dd102ede1ec71208518a9b0f68e), LLD 12.0.1 (https://gitee.com/OpenHarmony/third_party_llvm-project 1971c85d809b8dd102ede1ec71208518a9b0f68e)) #1 SMP Tue Sep 5 15:26:28 CST 2023
[    0.000000] Machine model: rockchip,rk3568-toybrick-dev-linux-x0
[    0.000000] earlycon: uart8250 at MMIO32 0x00000000fe660000 (options '')
[    0.000000] printk: bootconsole [uart8250] enabled
[    0.000000] Memory limited to 1920MB
[    0.000000] Zone ranges:
[    0.000000]   DMA      [mem 0x0000000000200000-0x00000000791fffff]
[    0.000000]   DMA32    empty
[    0.000000]   Normal   empty
[    0.000000] Movable zone start for each node
[    0.000000] Early memory node ranges
[    0.000000]   node   0: [mem 0x0000000000200000-0x00000000083fffff]
[    0.000000]   node   0: [mem 0x0000000009400000-0x00000000791fffff]
[    0.000000] Initmem setup node 0 [mem 0x0000000000200000-0x00000000791fffff]
[    0.000000] On node 0, zone DMA: 512 pages in unavailable ranges
[    0.000000] cma: Reserved 16 MiB at 0x0000000075000000
[    0.000000] psci: probing for conduit method from DT.
[    0.000000] psci: PSCIv1.1 detected in firmware.
[    0.000000] psci: Using standard PSCI v0.2 function IDs
[    0.000000] psci: Trusted OS migration not required
[    0.000000] psci: SMC Calling Convention v1.2
[    0.000000] percpu: Embedded 30 pages/cpu s83880 r8192 d30808 u122880
[    0.000000] Detected VIPT I-cache on CPU0
[    0.000000] CPU features: detected: GIC system register CPU interface
[    0.000000] CPU features: detected: Virtualization Host Extensions
[    0.000000] CPU features: detected: ARM errata 1165522, 1319367, or 1530923
[    0.000000] alternatives: patching kernel code
[    0.000000] Built 1 zonelists, mobility grouping on.  Total pages: 483776
[    0.000000] Kernel command line: earlycon=uart8250,mmio32,0xfe660000 root=PARTUUID=614e0000-0000 rw rootwait rootfstype=ext4 mem=0x78000000 console=ttyFIQ0 hardware=rk3568 default_boot_device=fe310000.sdhci bootslots=2 ohos.required_mount.system=/dev/block/platform/fe310000.sdhci/by-name/system@/usr@ext4@ro,barrier=1@wait,required ohos.required_mount.vendor=/dev/block/platform/fe310000.sdhci/by-name/vendor@/vendor@ext4@ro,barrier=1@wait,required ohos.required_mount.misc=/dev/block/platform/fe310000.sdhci/by-name/misc@none@none@none@wait,required
[    0.000000] Dentry cache hash table entries: 262144 (order: 9, 2097152 bytes, linear)
[    0.000000] Inode-cache hash table entries: 131072 (order: 8, 1048576 bytes, linear)
[    0.000000] mem auto-init: stack:all(zero), heap alloc:on, heap free:off
[    0.000000] Memory: 1875328K/1966080K available (17854K kernel code, 3334K rwdata, 5684K rodata, 1600K init, 910K bss, 74368K reserved, 16384K cma-reserved)
[    0.000000] SLUB: HWalign=64, Order=0-3, MinObjects=0, CPUs=4, Nodes=1
[    0.000000] ftrace: allocating 59216 entries in 232 pages
[    0.000000] ftrace: allocated 232 pages with 4 groups
[    0.000000] rcu: Hierarchical RCU implementation.
[    0.000000] rcu:     RCU event tracing is enabled.
[    0.000000] rcu:     RCU restricting CPUs from NR_CPUS=8 to nr_cpu_ids=4.
[    0.000000]  Rude variant of Tasks RCU enabled.
[    0.000000] rcu: RCU calculated value of scheduler-enlistment delay is 30 jiffies.
[    0.000000] rcu: Adjusting geometry for rcu_fanout_leaf=16, nr_cpu_ids=4
[    0.000000] NR_IRQS: 64, nr_irqs: 64, preallocated irqs: 0
[    0.000000] GICv3: GIC: Using split EOI/Deactivate mode
[    0.000000] GICv3: 320 SPIs implemented
[    0.000000] GICv3: 0 Extended SPIs implemented
[    0.000000] GICv3: Distributor has no Range Selector support
[    0.000000] GICv3: 16 PPIs implemented
[    0.000000] GICv3: CPU0: found redistributor 0 region 0:0x00000000fd460000
[    0.000000] ITS [mem 0xfd440000-0xfd45ffff]
[    0.000000] ITS@0x00000000fd440000: allocated 8192 Devices @3e0000 (indirect, esz 8, psz 64K, shr 0)
[    0.000000] ITS@0x00000000fd440000: allocated 32768 Interrupt Collections @3f0000 (flat, esz 2, psz 64K, shr 0)
[    0.000000] ITS: using cache flushing for cmd queue
[    0.000000] GICv3: using LPI property table @0x0000000002800000
[    0.000000] GIC: using cache flushing for LPI property table
[    0.000000] GICv3: CPU0: using allocated LPI pending table @0x0000000002810000
[    0.000000] random: get_random_bytes called from start_kernel+0x228/0x4e4 with crng_init=0
[    0.000000] arch_timer: cp15 timer(s) running at 24.00MHz (phys).
[    0.000000] clocksource: arch_sys_counter: mask: 0xffffffffffffff max_cycles: 0x588fe9dc0, max_idle_ns: 440795202592 ns
[    0.000004] sched_clock: 56 bits at 24MHz, resolution 41ns, wraps every 4398046511097ns
[    0.001565] Console: colour dummy device 80x25
[    0.002003] Calibrating delay loop (skipped), value calculated using timer frequency.. 48.00 BogoMIPS (lpj=80000)
[    0.002948] pid_max: default: 32768 minimum: 301
[    0.003462] LSM: Security Framework initializing
[    0.003918] SELinux:  Initializing.
[    0.004331] Mount-cache hash table entries: 4096 (order: 3, 32768 bytes, linear)
[    0.005039] Mountpoint-cache hash table entries: 4096 (order: 3, 32768 bytes, linear)
[    0.007397] rcu: Hierarchical SRCU implementation.
[    0.008604] Platform MSI: interrupt-controller@fd440000 domain created
[    0.009562] PCI/MSI: /interrupt-controller@fd400000/interrupt-controller@fd440000 domain created
[    0.010909] smp: Bringing up secondary CPUs ...
I/TC: Secondary CPU 1 initializing
I/TC: Secondary CPU 1 switching to normal world boot
I/TC: Secondary CPU 2 initializing
I/TC: Secondary CPU 2 switching to normal world boot
I/TC: Secondary CPU 3 initializing
I/TC: Secondary CPU 3 switching to normal world boot
[    0.012669] Detected VIPT I-cache on CPU1
[    0.012700] GICv3: CPU1: found redistributor 100 region 0:0x00000000fd480000
[    0.012720] GICv3: CPU1: using allocated LPI pending table @0x0000000002820000
[    0.012772] CPU1: Booted secondary processor 0x0000000100 [0x412fd050]
[    0.014178] Detected VIPT I-cache on CPU2
[    0.014205] GICv3: CPU2: found redistributor 200 region 0:0x00000000fd4a0000
[    0.014221] GICv3: CPU2: using allocated LPI pending table @0x0000000002830000
[    0.014264] CPU2: Booted secondary processor 0x0000000200 [0x412fd050]
[    0.015648] Detected VIPT I-cache on CPU3
[    0.015673] GICv3: CPU3: found redistributor 300 region 0:0x00000000fd4c0000
[    0.015690] GICv3: CPU3: using allocated LPI pending table @0x0000000002840000
[    0.015730] CPU3: Booted secondary processor 0x0000000300 [0x412fd050]
[    0.015874] smp: Brought up 1 node, 4 CPUs
[    0.023078] SMP: Total of 4 processors activated.
[    0.023513] CPU features: detected: Privileged Access Never
[    0.024024] CPU features: detected: User Access Override
[    0.024513] CPU features: detected: 32-bit EL0 Support
[    0.024985] CPU features: detected: Common not Private translations
[    0.025582] CPU features: detected: RAS Extension Support
[    0.026079] CPU features: detected: Data cache clean to the PoU not required for I/D coherence
[    0.026867] CPU features: detected: CRC32 instructions
[    0.027339] CPU features: detected: Speculative Store Bypassing Safe (SSBS)
[    0.028060] CPU: All CPU(s) started at EL2
[
------=_Part_29111_332849216.1693903950076--
