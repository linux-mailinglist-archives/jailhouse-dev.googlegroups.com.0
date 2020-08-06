Return-Path: <jailhouse-dev+bncBCW4LL4WQ4PBBSFWVX4QKGQE3KAIIYA@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-pg1-x540.google.com (mail-pg1-x540.google.com [IPv6:2607:f8b0:4864:20::540])
	by mail.lfdr.de (Postfix) with ESMTPS id 2A07423D502
	for <lists+jailhouse-dev@lfdr.de>; Thu,  6 Aug 2020 03:22:18 +0200 (CEST)
Received: by mail-pg1-x540.google.com with SMTP id e4sf5639411pgv.7
        for <lists+jailhouse-dev@lfdr.de>; Wed, 05 Aug 2020 18:22:18 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1596676936; cv=pass;
        d=google.com; s=arc-20160816;
        b=VZqWbxtKEZUHeHBxoay7cUjWZcj/GBMuxvwt/3cmExUWiis714BxxMZO+cZTsXYkr1
         oFunCBS5qDBZ58XXrLF+ZR3uKICK2k+XTyOlqeUm6g9YhfPeyRYC5o4/FC2iO3LMJDhh
         EJ7t2AorIJYtO/kuh9W5o+OwE3DcjWDz8X/lQ5agAgPoSCujrAUOaPaoCeJf2yUTz+0H
         pGCxI+1AKJ41yHEu6L0GR4WVE3gav20RHXQKdmtj6drznMA8fNBcVfcNQueCOcV73rLn
         Sx7t1ZwzFg/OfGfsKb7Iu0BLmrwQFywZ0OcV9vE/QDaYtR4oeYqOKSPIfXXH75e/CQvE
         nCgA==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:sender:dkim-signature
         :dkim-signature;
        bh=qbzOsZ431t2IFDPmFE/3q1wePsZsVfBSg/Slev9JwDc=;
        b=GlSREZ+DF6BYhuXZIzzr1v2JVgRz7o0c503d/GMu5kdmHNbJFTLmAvLhFbr3fay+y+
         IId9p4/ixf4ZIMRTCRqXcBPE7usYwC4UjOLHGxBqKAGoU125opJ4M6KeZwzG2pKestIV
         69Tu7kjfEUyzPw8X5GJRY9G/zwUKiAfGj0GILeSfzS7TQ9Dw4VHBtDbLujRTbFvOclVR
         Mv2rR5nn/oc7UfSvRje4subR59NxwOiv6gTEqqUqoie0P0p4+F4i4211+IHk330XNiJq
         xJdRT/Rl74QfIkt5E7VUqYzQBva8a4xBLDMvIwT8RVZwbKlj4wzuqEEd8rvlHYzfokGN
         +uGQ==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20161025 header.b=pfgFooA0;
       spf=pass (google.com: domain of van.freenix@gmail.com designates 2607:f8b0:4864:20::c34 as permitted sender) smtp.mailfrom=van.freenix@gmail.com;
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:mime-version:references:in-reply-to:from:date:message-id
         :subject:to:cc:x-original-sender:x-original-authentication-results
         :precedence:mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=qbzOsZ431t2IFDPmFE/3q1wePsZsVfBSg/Slev9JwDc=;
        b=Hr0wiRABSyZikUkHoDyjHAoQdJsKRGVTgYAmp4QD0Zl1TvZdsBO+LTu4wlD9VjZ261
         nnQkM0gaEGWs02P8Tff8FfVaO1jL2METOWyhjUo1F3Z+iSzYy9laRl4aSBcpnBIvBNgw
         +7eFV4IcFD58dHMqOz2tP9ztYq9g0so/fgA+RobPRD6HF59UbkLp1817p3ntNGuYfaEB
         PlBSqg4n3enicbZWuUWLWtiO05kvoZJBfWQ7oxrPuAXuUMsExGoNX650APtpitbDCWXg
         z2MwJopBAN6/D7ZeNH3t+WGqqiKPMMWT9DmS0MgTnMO+FukMBWcRGRMw4C2VOdaT/gfF
         qYtQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=qbzOsZ431t2IFDPmFE/3q1wePsZsVfBSg/Slev9JwDc=;
        b=tm9uo54zxdxtMYq/viCgQZKJTeFtg9yNk7VX0cUPnn7BdrV1HC+lesYNPhjcbkMIRI
         /ZPqmWaOIJGojNPIwqIPMy9fe1ocszLlaoBhik9YX5KsRqE1XvNkY1VUUnaH/qJCZgz2
         9QTaQ+BQK8PHmUYA1gI3tNMTbcnz+11frD4Py4N2NjZoV9NhKKtJStllrGSSY8xFCG2J
         XIZDAdD1XzJ1+49TpDXcPVwlnYeCTNK324EZ7tcF92l4hIPnB++5UL03F7uIgHACegOB
         LNzhr46QtFBKRtGNrkDXpSbs13eKTlE6F6HBZPdNV+psNcqUcltDB8klDSxw6x1Pjpch
         TCug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:mime-version:references:in-reply-to:from
         :date:message-id:subject:to:cc:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :x-spam-checked-in-group:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=qbzOsZ431t2IFDPmFE/3q1wePsZsVfBSg/Slev9JwDc=;
        b=kSTEf5xi9SD0E9JInaqkBsu/0qugRnuts0jfESHgiBL11QL2ouQCVPb3RmpNV4VoAF
         4HwEVjb8NHA0y8e1ToNnCtvNr1IIifpWjt9cNwrc7lPnRO+qR7XDR5WEXQLNpSch8NnO
         dEmhOEi9cFlGzEK/HZqdubhYOkPhXm7VnkAnxoGcSfLHiK2xXGLszOoE4B74akixtU8P
         gKuJRzn4oqGCHlfs5MJIetIBBKiu62erPXTN/IFz1eeeN4EJCmxnsbPLtWD8jWKUFzEu
         qbIJ3yRc010DWo+Xfc0j3HgmVQ4eFL6naKlEYY6Q9x91AsllfgEBF9OInllGU848d6De
         qC8g==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AOAM533HP1nIwv6UMEv6mPn1NXd6Ptba3XJUj8fX82BDUSg90P/z0//9
	/AjChPmlkvysH6/PsKtZ02g=
X-Google-Smtp-Source: ABdhPJyoNe1EGiLCLWsKeGZIbnqrNeNJIDayc782hRMKrDazfJlFBwgPu92+n92ERuCrbhVdiLwmiw==
X-Received: by 2002:a63:5b07:: with SMTP id p7mr5157247pgb.250.1596676936550;
        Wed, 05 Aug 2020 18:22:16 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a62:524e:: with SMTP id g75ls1442301pfb.10.gmail; Wed, 05
 Aug 2020 18:22:15 -0700 (PDT)
X-Received: by 2002:a63:f84f:: with SMTP id v15mr3029261pgj.386.1596676935752;
        Wed, 05 Aug 2020 18:22:15 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1596676935; cv=none;
        d=google.com; s=arc-20160816;
        b=vS18c7XTuQIVSfQAMWmWTArLz0drhxjf0gdjrcBj1KBm4JWS2bP0EwBR9hln2opXTJ
         t4Y/zViWGIodscIZHWzx6Yr/HtDryoId/rGjU+J7f75PCgRmXHZa0LERXwB0tGYp1VFh
         IInQDJ721cz0MIKXKMNNh7OOMCupTtk47NDdYn6LLX0TUK8/vsJNvN6FUUmAnrFNaKbi
         WmwrqZvjKLGXNSilz6IxPPuX0FZWLkMNNXUSMwoAcHIZxCHq6P0vsYqmhD7Y5vlaTQpM
         ZBa7enVsi6s+rwAY1icUkIPPDnUPmOiHvcSX4K/VdTUS2qfM9WLZVrSW8o7vfG6DPueI
         J4sw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=Pdj7t33WCJ+RUmxGlpVw3Sf6fKn5CqCNzbQO4WoAK54=;
        b=SSYnhK3SvM8lstLBa5aeV2vrDC/MbZBdwpRgheQS7XACSazSSyo2MLqaVnR9ujc24Y
         K4U1rix8KlFx+1/eJiKDDdZ3hZRH8NvKBW2lawQXHrCfAX86FOC8ah0+06o/kEjlqmCb
         WGWz3tdH2UaQzuhlAJf0OfgXm42Szr5l3sOAa8Dkq/oNhQKA6TXELh7QeZvrA2UwQf66
         aKjXa6yM/qaLIGMbehgOREJT8V1zcxsM6z2VTlYnKC39KPa7h5qTdsRBjaljCq3XeTVr
         g26OwJw9AH8Zpxgsbs7UqpuJyZbKTZ8m+L/NmZ2bUepW2e6v54ZLUEvcMR6DN/F82REu
         V+Hg==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20161025 header.b=pfgFooA0;
       spf=pass (google.com: domain of van.freenix@gmail.com designates 2607:f8b0:4864:20::c34 as permitted sender) smtp.mailfrom=van.freenix@gmail.com;
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Received: from mail-oo1-xc34.google.com (mail-oo1-xc34.google.com. [2607:f8b0:4864:20::c34])
        by gmr-mx.google.com with ESMTPS id nl1si75550pjb.1.2020.08.05.18.22.15
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 05 Aug 2020 18:22:15 -0700 (PDT)
Received-SPF: pass (google.com: domain of van.freenix@gmail.com designates 2607:f8b0:4864:20::c34 as permitted sender) client-ip=2607:f8b0:4864:20::c34;
Received: by mail-oo1-xc34.google.com with SMTP id x1so7030122oox.6
        for <jailhouse-dev@googlegroups.com>; Wed, 05 Aug 2020 18:22:15 -0700 (PDT)
X-Received: by 2002:a4a:275e:: with SMTP id w30mr5588874oow.40.1596676934880;
 Wed, 05 Aug 2020 18:22:14 -0700 (PDT)
MIME-Version: 1.0
References: <11e37b92-3146-4194-877f-f79ab746d971o@googlegroups.com>
In-Reply-To: <11e37b92-3146-4194-877f-f79ab746d971o@googlegroups.com>
From: Peng Fan <van.freenix@gmail.com>
Date: Thu, 6 Aug 2020 09:22:03 +0800
Message-ID: <CAEfxd--LbKjCA55W-tNmL_4H2b+H3jsW6PKYAo5B2Y1Wx0o6GQ@mail.gmail.com>
Subject: Re: imx8 : linux-inmate-demo cell created & started. Does it maintain
 another rootfs for this 2nd linux & how we can run a binary in this 2nd linux?
To: Vipul Suneja <vsuneja63@gmail.com>
Cc: Jailhouse <jailhouse-dev@googlegroups.com>
Content-Type: multipart/alternative; boundary="0000000000008653ec05ac2b5111"
X-Original-Sender: Van.Freenix@gmail.com
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass
 header.i=@gmail.com header.s=20161025 header.b=pfgFooA0;       spf=pass
 (google.com: domain of van.freenix@gmail.com designates 2607:f8b0:4864:20::c34
 as permitted sender) smtp.mailfrom=van.freenix@gmail.com;       dmarc=pass
 (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
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

--0000000000008653ec05ac2b5111
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Vipul Suneja <vsuneja63@gmail.com> =E4=BA=8E2020=E5=B9=B48=E6=9C=885=E6=97=
=A5=E5=91=A8=E4=B8=89 =E4=B8=8B=E5=8D=884:48=E5=86=99=E9=81=93=EF=BC=9A

>
>      Target: imx8mq evk
>      bsp: 5.4.24
>
>      Created & started linux cell. Does it maintain separate rootfs? How
> to run a binary in this 2nd linux (in dedicated CPU)? I didn't found
> initrd.img, didn't include in the below given command.
>
> *     jailhouse cell linux
> /usr/share/jailhouse/cells/imx8mq-linux-demo.cell
> /run/media/mmcblk1p1/Image -d /run/media/mmcblk1p1/imx8mq-evk-inmate.dtb =
-c
> "clk_ignore_unused console=3Dttymxc0,115200
> earlycon=3Dec_imx6q,0x30860000,115200 root=3D/dev/mmcblk1p2 rootwait rw"*
>

Change the root to /dev/mmcblk2p2 according to your boot log. The 2nd linux
take the emmc on board as the rootfs storage media.
So you need first use uuu to burn the sdcard image to the emmc device on
board. And the 2nd linux will use the other uart as normal console,
it take the 1st linux uart as early console.

Regards,
Peng.

>
>
>     Below are logs:
>
>
>
>
>
>
>
>
>
>
>
>
>
>
>
>
>
>
>
>
>
>
>
>
>
>
>
>
>
>
>
>
>
>
>
>
>
>
>
>
>
>
>
>
>
>
>
>
>
>
>
>
>
>
>
>
>
>
>
>
>
>
>
>
>
>
>
>
>
>
>
>
>
>
>
>
>
>
>
>
>
>
>
>
>
>
>
>
>
>
>
>
>
>
>
>
>
>
>
>
>
>
>
>
>
>
>
>
>
>
>
>
>
>
>
>
>
>
>
>
>
>
>
>
>
>
>
>
>
>
>
>
>
>
>
>
>
>
>
>
>
>
>
>
>
>
>
>
>
>
>
>
>
>
>
>
>
>
>
>
>
>
>
>
>
>
>
>
>
>
>
>
>
>
>
>
>
>
>
>
>
>
>
>
>
>
>
>
>
>
>
>
>
>
>
>
>
>
>
>
>
>
>
>
>
>
>
>
>
>
>
>
>
>
>
>
>
>
>
>
>
>
>
>
>
>
>
>
>
>
>
>
>
>
>
>
>
>
>
>
>
>
>
>
>
>
>
>
>
>
>
>
>
>
>
>
>
>
>
>
>
>
>
>
>
>
>
>
>
>
>
>
>
>
>
>
>
>
>
>
>
>
>
>
>
>
>
>
>
>
>
>
>
>
>
>
> *Adding virtual PCI device 00:00.0 to cell "linux-inmate-demo"Shared
> memory connection established, peer cells: "imx8mq"Adding virtual PCI
> device 00:01.0 to cell "linux-inmate-demo"Shared memory connection
> established, peer cells: "imx8mq"Created cell "linux-inmate-demo"Page poo=
l
> usage after cell creation: mem 80/992, remap 144/131072[ 1021.954940]
> Created Jailhouse cell "linux-inmate-demo"Cell "linux-inmate-demo" can be
> loadedStarted cell "linux-inmate-demo"[    0.000000] Booting Linux on
> physical CPU 0x0000000002 [0x410fd034][    0.000000] Linux version
> 5.4.24-2.1.0+gbabac00 (oe-user@oe-host) (gcc version 9.2.0 (GCC)) #1 SMP
> PREEMPT Tue Jul 28 08:36:15 UTC 2020[    0.000000] Machine model: Freesca=
le
> i.MX8MQ EVK[    0.000000] earlycon: ec_imx6q0 at MMIO 0x0000000030860000
> (options '115200')[    0.000000] printk: bootconsole [ec_imx6q0]
> enabled[    0.000000] efi: Getting EFI parameters from FDT:[    0.000000]
> efi: UEFI not found.[    0.000000] cma: Reserved 320 MiB at
> 0x00000000e8000000[    0.000000] NUMA: No NUMA configuration found[
> 0.000000] NUMA: Faking a node at [mem
> 0x00000000c0000000-0x00000000fdbfffff][    0.000000] NUMA: NODE_DATA [mem
> 0xfda0d500-0xfda0efff][    0.000000] Zone ranges:[    0.000000]   DMA32
> [mem 0x00000000c0000000-0x00000000fdbfffff][    0.000000]   Normal
> empty[    0.000000] Movable zone start for each node[    0.000000] Early
> memory node ranges[    0.000000]   node   0: [mem
> 0x00000000c0000000-0x00000000fdbfffff][    0.000000] Initmem setup node 0
> [mem 0x00000000c0000000-0x00000000fdbfffff][    0.000000] psci: probing f=
or
> conduit method from DT.[    0.000000] psci: PSCIv1.1 detected in
> firmware.[    0.000000] psci: Using standard PSCI v0.2 function IDs[
> 0.000000] psci: MIGRATE_INFO_TYPE not supported.[    0.000000] psci: SMC
> Calling Convention v1.1[    0.000000] percpu: Embedded 24 pages/cpu s5890=
4
> r8192 d31208 u98304[    0.000000] Detected VIPT I-cache on CPU0[
> 0.000000] CPU features: detected: ARM erratum 845719[    0.000000] CPU
> features: detected: GIC system register CPU interface[    0.000000] Built=
 1
> zonelists, mobility grouping on.  Total pages: 248976[    0.000000] Polic=
y
> zone: DMA32[    0.000000] Kernel command line: clk_ignore_unused
> console=3Dttymxc0,115200 earlycon=3Dec_imx6q,0x30860000,115200
> root=3D/dev/mmcblk1p2 rootwait rw[    0.000000] Dentry cache hash table
> entries: 131072 (order: 8, 1048576 bytes, linear)[    0.000000] Inode-cac=
he
> hash table entries: 65536 (order: 7, 524288 bytes, linear)[    0.000000]
> mem auto-init: stack:off, heap alloc:off, heap free:off[    0.000000]
> Memory: 635512K/1011712K available (16444K kernel code, 1444K rwdata, 647=
2K
> rodata, 2944K init, 1017K bss, 48520K reserved, 327680K cma-reserved)[
> 0.000000] SLUB: HWalign=3D64, Order=3D0-3, MinObjects=3D0, CPUs=3D2, Node=
s=3D1[
> 0.000000] rcu: Preemptible hierarchical RCU implementation.[    0.000000]
> rcu:     RCU restricting CPUs from NR_CPUS=3D256 to nr_cpu_ids=3D2.[
> 0.000000]  Tasks RCU enabled.[    0.000000] rcu: RCU calculated value of
> scheduler-enlistment delay is 25 jiffies.[    0.000000] rcu: Adjusting
> geometry for rcu_fanout_leaf=3D16, nr_cpu_ids=3D2[    0.000000] NR_IRQS: =
64,
> nr_irqs: 64, preallocated irqs: 0[    0.000000] GICv3: 128 SPIs
> implemented[    0.000000] GICv3: 0 Extended SPIs implemented[    0.000000=
]
> GICv3: Distributor has no Range Selector support[    0.000000] GICv3: 16
> PPIs implemented[    0.000000] GICv3: no VLPI support, no direct LPI
> support[    0.000000] GICv3: CPU0: found redistributor 2 region
> 0:0x00000000388c0000[    0.000000] ITS: No ITS available, not enabling
> LPIs[    0.000000] random: get_random_bytes called from
> start_kernel+0x2b8/0x44c with crng_init=3D0[    0.000000] arch_timer: cp1=
5
> timer(s) running at 8.33MHz (virt).[    0.000000] clocksource:
> arch_sys_counter: mask: 0xffffffffffffff max_cycles: 0x1ec0311ec,
> max_idle_ns: 440795202152 ns[    0.000004] sched_clock: 56 bits at 8MHz,
> resolution 120ns, wraps every 2199023255541ns[    0.008121] Console: colo=
ur
> dummy device 80x25[    0.012473] Calibrating delay loop (skipped), value
> calculated using timer frequency.. 16.66 BogoMIPS (lpj=3D33333)[    0.022=
664]
> pid_max: default: 32768 minimum: 301[    0.027337] LSM: Security Framewor=
k
> initializing[    0.031915] Mount-cache hash table entries: 2048 (order: 2=
,
> 16384 bytes, linear)[    0.039248] Mountpoint-cache hash table entries:
> 2048 (order: 2, 16384 bytes, linear)[    0.071135] ASID allocator
> initialised with 32768 entries[    0.079137] rcu: Hierarchical SRCU
> implementation.[    0.087271] EFI services will not be available.[
> 0.095177] smp: Bringing up secondary CPUs ...[    0.127296] Detected VIPT
> I-cache on CPU1[    0.127333] GICv3: CPU1: found redistributor 3 region
> 0:0x00000000388e0000[    0.127374] CPU1: Booted secondary processor
> 0x0000000003 [0x410fd034][    0.127452] smp: Brought up 1 node, 2 CPUs[
> 0.146060] SMP: Total of 2 processors activated.[    0.150745] CPU feature=
s:
> detected: 32-bit EL0 Support[    0.155882] CPU features: detected: CRC32
> instructions[    0.171395] CPU: All CPU(s) started at EL1[    0.172643]
> alternatives: patching kernel code[    0.178327] devtmpfs: initialized[
> 0.182016] clocksource: jiffies: mask: 0xffffffff max_cycles: 0xffffffff,
> max_idle_ns: 7645041785100000 ns[    0.190093] futex hash table entries:
> 512 (order: 3, 32768 bytes, linear)[    0.205814] pinctrl core: initializ=
ed
> pinctrl subsystem[    0.208766] DMI not present or invalid.[    0.212295]
> NET: Registered protocol family 16[    0.226844] DMA: preallocated 256 Ki=
B
> pool for atomic allocations[    0.230091] audit: initializing netlink
> subsys (disabled)[    0.235625] audit: type=3D2000 audit(0.200:1):
> state=3Dinitialized audit_enabled=3D0 res=3D1[    0.243221] cpuidle: usin=
g
> governor menu[    0.247461] hw-breakpoint: found 6 breakpoint and 4
> watchpoint registers.[    0.254239] Serial: AMBA PL011 UART driver[
> 0.258022] imx mu driver is registered.[    0.261865] imx rpmsg driver is
> registered.[    0.283632] HugeTLB registered 1.00 GiB page size,
> pre-allocated 0 pages[    0.287485] HugeTLB registered 32.0 MiB page size=
,
> pre-allocated 0 pages[    0.294161] HugeTLB registered 2.00 MiB page size=
,
> pre-allocated 0 pages[    0.300846] HugeTLB registered 64.0 KiB page size=
,
> pre-allocated 0 pages[    0.309530] cryptd: max_cpu_qlen set to 1000[
> 0.317166] ACPI: Interpreter disabled.[    0.318509] iommu: Default domain
> type: Translated[    0.323154] vgaarb: loaded[    0.325989] SCSI subsyste=
m
> initialized[    0.329830] usbcore: registered new interface driver
> usbfs[    0.334947] usbcore: registered new interface driver hub[
> 0.340466] usbcore: registered new device driver usb[    0.345518] mc: Lin=
ux
> media interface: v0.10[    0.349507] videodev: Linux video capture
> interface: v2.00[    0.355017] pps_core: LinuxPPS API ver. 1 registered[
> 0.359900] pps_core: Software ver. 5.3.6 - Copyright 2005-2007 Rodolfo
> Giometti <giometti@linux.it <giometti@linux.it>>[    0.369034] PTP clock
> support registered[    0.372976] EDAC MC: Ver: 3.0.0[    0.376456] No BMa=
n
> portals available![    0.379991] QMan: Allocated lookup table at
> (____ptrval____), entry count 65537[    0.387121] No QMan portals
> available![    0.390844] No USDPAA memory, no 'fsl,usdpaa-mem' in
> device-tree[    0.397047] FPGA manager framework[    0.400255] Advanced
> Linux Sound Architecture Driver Initialized.[    0.406683] Bluetooth: Cor=
e
> ver 2.22[    0.409838] NET: Registered protocol family 31[    0.414246]
> Bluetooth: HCI device and connection manager initialized[    0.420580]
> Bluetooth: HCI socket layer initialized[    0.425440] Bluetooth: L2CAP
> socket layer initialized[    0.430494] Bluetooth: SCO socket layer
> initialized[    0.435863] clocksource: Switched to clocksource
> arch_sys_counter[    0.441553] VFS: Disk quotas dquot_6.6.0[    0.445367]
> VFS: Dquot-cache hash table entries: 512 (order 0, 4096 bytes)[
> 0.452334] pnp: PnP ACPI: disabled[    0.462170] thermal_sys: Registered
> thermal governor 'step_wise'[    0.462173] thermal_sys: Registered therma=
l
> governor 'power_allocator'[    0.465472] NET: Registered protocol family
> 2[    0.476511] tcp_listen_portaddr_hash hash table entries: 512 (order: =
1,
> 8192 bytes, linear)[    0.484540] TCP established hash table entries: 819=
2
> (order: 4, 65536 bytes, linear)[    0.492302] TCP bind hash table entries=
:
> 8192 (order: 5, 131072 bytes, linear)[    0.499571] TCP: Hash tables
> configured (established 8192 bind 8192)[    0.505845] UDP hash table
> entries: 512 (order: 2, 16384 bytes, linear)[    0.512401] UDP-Lite hash
> table entries: 512 (order: 2, 16384 bytes, linear)[    0.519510] NET:
> Registered protocol family 1[    0.524157] RPC: Registered named UNIX
> socket transport module.[    0.529649] RPC: Registered udp transport
> module.[    0.534334] RPC: Registered tcp transport module.[    0.539023]
> RPC: Registered tcp NFSv4.1 backchannel transport module.[    0.545810]
> PCI: CLS 0 bytes, default 64[    0.549924] kvm [1]: HYP mode not
> available[    0.559322] Initialise system trusted keyrings[    0.561042]
> workingset: timestamp_bits=3D44 max_order=3D18 bucket_order=3D0[    0.574=
077]
> squashfs: version 4.0 (2009/01/31) Phillip Lougher[    0.577766] NFS:
> Registering the id_resolver key type[    0.582117] Key type id_resolver
> registered[    0.586255] Key type id_legacy registered[    0.590256]
> nfs4filelayout_init: NFSv4 File Layout Driver Registering...[    0.596947=
]
> jffs2: version 2.2. (NAND) =C2=A9 2001-2006 Red Hat, Inc.[    0.603415] 9=
p:
> Installing v9fs 9p2000 file system support[    0.623963] Key type
> asymmetric registered[    0.625197] Asymmetric key parser 'x509'
> registered[    0.630097] Block layer SCSI generic (bsg) driver version 0.=
4
> loaded (major 244)[    0.637464] io scheduler mq-deadline registered[
> 0.641963] io scheduler kyber registered[    0.646985] pci-host-generic
> bfb00000.pci: host bridge /pci@bfb00000 ranges:[    0.653010]
> pci-host-generic bfb00000.pci:   MEM 0x10000000..0x1000ffff ->
> 0x10000000[    0.660844] pci-host-generic bfb00000.pci: ECAM at [mem
> 0xbfb00000-0xbfbfffff] for [bus 00][    0.669234] pci-host-generic
> bfb00000.pci: PCI host bridge to bus 0000:00[    0.675904] pci_bus 0000:0=
0:
> root bus resource [bus 00][    0.681117] pci_bus 0000:00: root bus resour=
ce
> [mem 0x10000000-0x1000ffff][    0.687999] pci 0000:00:00.0: [110a:4106]
> type 00 class 0xff0000[    0.693983] pci 0000:00:00.0: reg 0x10: [mem
> 0x00000000-0x00000fff][    0.700441] pci 0000:00:01.0: [110a:4106] type 0=
0
> class 0xff0001[    0.706215] pci 0000:00:01.0: reg 0x10: [mem
> 0x00000000-0x00000fff][    0.712846] pci 0000:00:00.0: BAR 0: assigned [m=
em
> 0x10000000-0x10000fff][    0.719226] pci 0000:00:01.0: BAR 0: assigned [m=
em
> 0x10001000-0x10001fff][    0.730661] EINJ: ACPI disabled.[    0.731846] B=
us
> freq driver module loaded[    0.738437] Serial: 8250/16550 driver, 4 port=
s,
> IRQ sharing enabled[    0.743272] 30890000.serial: ttymxc1 at MMIO
> 0x30890000 (irq =3D 5, base_baud =3D 1562500) is a IMX[    0.758802] loop=
:
> module loaded[    0.760497] imx ahci driver is registered.[    0.764652]
> libphy: Fixed MDIO Bus: probed[    0.768138] tun: Universal TUN/TAP devic=
e
> driver, 1.6[    0.772584] thunder_xcv, ver 1.0[    0.775525] thunder_bgx,
> ver 1.0[    0.778759] nicpf, ver 1.0[    0.781574] Freescale FM module, F=
MD
> API version 21.1.0[    0.786667] Freescale FM Ports module[    0.790255]
> fsl_mac: fsl_mac: FSL FMan MAC API based driver[    0.795852] fsl_dpa: FS=
L
> DPAA Ethernet driver[    0.800190] fsl_advanced: FSL DPAA Advanced
> drivers:[    0.805098] fsl_proxy: FSL DPAA Proxy initialization driver[
> 0.810691] fsl_oh: FSL FMan Offline Parsing port driver[    0.816330] hclg=
e
> is initializing[    0.819240] hns3: Hisilicon Ethernet Network Driver for
> Hip08 Family - version[    0.826457] hns3: Copyright (c) 2017 Huawei
> Corporation.[    0.831800] e1000: Intel(R) PRO/1000 Network Driver -
> version 7.3.21-k8-NAPI[    0.838777] e1000: Copyright (c) 1999-2006 Intel
> Corporation.[    0.844545] e1000e: Intel(R) PRO/1000 Network Driver -
> 3.2.6-k[    0.850324] e1000e: Copyright(c) 1999 - 2015 Intel
> Corporation.[    0.856268] igb: Intel(R) Gigabit Ethernet Network Driver =
-
> version 5.6.0-k[    0.863169] igb: Copyright (c) 2007-2014 Intel
> Corporation.[    0.868770] igbvf: Intel(R) Gigabit Virtual Function Netwo=
rk
> Driver - version 2.4.0-k[    0.876539] igbvf: Copyright (c) 2009 - 2012
> Intel Corporation.[    0.882511] sky2: driver version 1.30[    0.886445]
> ivshmem-net 0000:00:01.0: enabling device (0000 -> 0002)[    0.892506]
> ivshmem-net 0000:00:01.0: TX memory at 0x00000000bfe80000, size
> 0x000000000007f000[    0.901024] ivshmem-net 0000:00:01.0: RX memory at
> 0x00000000bfe01000, size 0x000000000007f000_ivshmem 0000:00:00.0:
> state_table at 0x00000000bfd00000, size 0x0000000000001000om6s 3] dy[
> 0.924815] uio_ivshmem 0000:00:00.0: rw_section at 0x00000000bfd01000, siz=
e
> 0x0000000000009000[    0.933489] uio_ivshmem 0000:00:00.0: input_sections
> at 0x00000000bfd0a000, size 0x0000000000006000[    0.942511] uio_ivshmem
> 0000:00:00.0: output_section at 0x00000000bfd0e000, size
> 0x0000000000002000[    0.951977] VFIO - User Level meta-driver version:
> 0.3[    0.957373] ehci_hcd: USB 2.0 'Enhanced' Host Controller (EHCI)
> Driver[    0.963176] ehci-pci: EHCI PCI platform driver[    0.967627]
> ehci-platform: EHCI generic platform driver[    0.972839] ohci_hcd: USB 1=
.1
> 'Open' Host Controller (OHCI) Driver[    0.978981] ohci-pci: OHCI PCI
> platform driver[    0.983424] ohci-platform: OHCI generic platform
> driver[    0.988740] usbcore: registered new interface driver
> usb-storage[    0.994651] usbcore: registered new interface driver
> usbserial_generic[    1.001115] usbserial: USB Serial support registered
> for generic[    1.007108] usbcore: registered new interface driver
> ftdi_sio[    1.012831] usbserial: USB Serial support registered for FTDI
> USB Serial Device[    1.020135] usbcore: registered new interface driver
> usb_serial_simple[    1.026643] usbserial: USB Serial support registered
> for carelink[    1.032709] usbserial: USB Serial support registered for
> zio[    1.038351] usbserial: USB Serial support registered for funsoft[
> 1.044350] usbserial: USB Serial support registered for flashloader[
> 1.050679] usbserial: USB Serial support registered for google[    1.05658=
3]
> usbserial: USB Serial support registered for libtransistor[    1.063090]
> usbserial: USB Serial support registered for vivopay[    1.069080]
> usbserial: USB Serial support registered for moto_modem[    1.075333]
> usbserial: USB Serial support registered for motorola_tetra[    1.081930]
> usbserial: USB Serial support registered for novatel_gps[    1.088278]
> usbserial: USB Serial support registered for hp4x[    1.093993] usbserial=
:
> USB Serial support registered for suunto[    1.099901] usbserial: USB
> Serial support registered for siemens_mpi[    1.107246] i2c /dev entries
> driver[    1.110345] Bluetooth: HCI UART driver ver 2.3[    1.114127]
> Bluetooth: HCI UART protocol H4 registered[    1.119245] Bluetooth: HCI
> UART protocol BCSP registered[    1.124556] Bluetooth: HCI UART protocol =
LL
> registered[    1.129660] Bluetooth: HCI UART protocol ATH3K registered[
> 1.135056] Bluetooth: HCI UART protocol Three-wire (H5) registered[
> 1.141326] Bluetooth: HCI UART protocol Broadcom registered[    1.146950]
> Bluetooth: HCI UART protocol QCA registered[    1.152285] imx-cpufreq-dt:
> probe of imx-cpufreq-dt failed with error -2[    1.159033] sdhci: Secure
> Digital Host Controller Interface driver[    1.164990] sdhci: Copyright(c=
)
> Pierre Ossman[    1.169392] Synopsys Designware Multimedia Card Interface
> Driver[    1.175449] sdhci-pltfm: SDHCI platform and OF driver helper[
> 1.181146] sdhci-esdhc-imx 30b40000.mmc: could not get pinctrl[    1.21801=
3]
> mmc2: SDHCI controller on 30b40000.mmc [30b40000.mmc] using ADMA[
> 1.222834] ledtrig-cpu: registered to indicate activity on CPUs[
> 1.229160] usbcore: registered new interface driver usbhid[    1.233823]
> usbhid: USB HID core driver[    1.238352] No fsl,qman node[    1.240462]
> Freescale USDPAA process driver[    1.244627] fsl-usdpaa: no region
> found[    1.248477] Freescale USDPAA process IRQ driver[    1.257304]
> pktgen: Packet Generator for packet performance testing. Version: 2.75[
> 1.262307] NET: Registered protocol family 26[    1.267090] NET: Registere=
d
> protocol family 10[    1.271591] Segment Routing with IPv6[    1.274573]
> NET: Registered protocol family 17[    1.279040] Bluetooth: RFCOMM TTY
> layer initialized[    1.283840] Bluetooth: RFCOMM socket layer
> initialized[    1.288955] Bluetooth: RFCOMM ver 1.11[    1.292683]
> Bluetooth: BNEP (Ethernet Emulation) ver 1.3[    1.297958] Bluetooth: BNE=
P
> filters: protocol multicast[    1.303185] Bluetooth: BNEP socket layer
> initialized[    1.308126] Bluetooth: HIDP (Human Interface Emulation) ver
> 1.2[    1.314021] Bluetooth: HIDP socket layer initialized[    1.319004]
> 8021q: 802.1Q VLAN Support v1.8[    1.323167] lib80211: common routines f=
or
> IEEE802.11 drivers[    1.328915] 9pnet: Installing 9P2000 support[
> 1.333060] tsn generic netlink module v1 init...[    1.337781] Key type
> dns_resolver registered[    1.342482] registered taskstats version 1[
> 1.346064] Loading compiled-in X.509 certificates[    1.352505] hctosys:
> unable to open rtc device (rtc0)[    1.355965] cfg80211: Loading
> compiled-in X.509 certificates for regulatory database[    1.365244]
> cfg80211: Loaded X.509 cert 'sforshee: 00b28ddf47aef9cea7'[    1.370196]
> platform regulatory.0: Direct firmware load for regulatory.db failed with
> error -2[    1.371872] clk: Not disabling unused clocks[    1.378719]
> platform regulatory.0: Falling back to sysfs fallback for:
> regulatory.db[    1.382975] ALSA device list:[    1.393625]   No soundcar=
ds
> found.[    1.397057] Warning: unable to open an initial console.[
> 1.402301] Waiting for root device /dev/mmcblk1p2...[    1.417055] mmc2: n=
ew
> DDR MMC card at address 0001[    1.419499] mmcblk2: mmc2:0001 DG4016 14.7
> GiB[    1.423711] mmcblk2boot0: mmc2:0001 DG4016 partition 1 4.00 MiB[
> 1.429619] mmcblk2boot1: mmc2:0001 DG4016 partition 2 4.00 MiB[    1.43543=
1]
> mmcblk2rpmb: mmc2:0001 DG4016 partition 3 4.00 MiB, chardev (237:0)[
> 1.452011]  mmcblk2: p1 p2[   62.528001] cfg80211: failed to load
> regulatory.db*
>
> --
> You received this message because you are subscribed to the Google Groups
> "Jailhouse" group.
> To unsubscribe from this group and stop receiving emails from it, send an
> email to jailhouse-dev+unsubscribe@googlegroups.com.
> To view this discussion on the web visit
> https://groups.google.com/d/msgid/jailhouse-dev/11e37b92-3146-4194-877f-f=
79ab746d971o%40googlegroups.com
> <https://groups.google.com/d/msgid/jailhouse-dev/11e37b92-3146-4194-877f-=
f79ab746d971o%40googlegroups.com?utm_medium=3Demail&utm_source=3Dfooter>
> .
>


--

--=20
You received this message because you are subscribed to the Google Groups "=
Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/=
jailhouse-dev/CAEfxd--LbKjCA55W-tNmL_4H2b%2BH3jsW6PKYAo5B2Y1Wx0o6GQ%40mail.=
gmail.com.

--0000000000008653ec05ac2b5111
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">Vipul Suneja &lt;<a href=3D"mailto:vs=
uneja63@gmail.com">vsuneja63@gmail.com</a>&gt; =E4=BA=8E2020=E5=B9=B48=E6=
=9C=885=E6=97=A5=E5=91=A8=E4=B8=89 =E4=B8=8B=E5=8D=884:48=E5=86=99=E9=81=93=
=EF=BC=9A<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0p=
x 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex"><div d=
ir=3D"ltr"><div><br></div><div>=C2=A0=C2=A0=C2=A0=C2=A0 Target: imx8mq evk<=
/div><div>=C2=A0=C2=A0=C2=A0=C2=A0 bsp: 5.4.24</div><div>=C2=A0=C2=A0=C2=A0=
=C2=A0 <br></div><div>=C2=A0=C2=A0=C2=A0=C2=A0 Created &amp; started linux =
cell. Does it maintain separate rootfs? How to run a binary in this 2nd lin=
ux (in dedicated CPU)? I didn&#39;t found initrd.img, didn&#39;t include in=
 the below given command.</div><div>=C2=A0=C2=A0=C2=A0 <br></div><div><b>=
=C2=A0=C2=A0=C2=A0=C2=A0 jailhouse cell linux /usr/share/jailhouse/cells/im=
x8mq-linux-demo.cell /run/media/mmcblk1p1/Image -d /run/media/mmcblk1p1/imx=
8mq-evk-inmate.dtb -c &quot;clk_ignore_unused console=3Dttymxc0,115200 earl=
ycon=3Dec_imx6q,0x30860000,115200 root=3D/dev/mmcblk1p2 rootwait rw&quot;</=
b></div></div></blockquote><div><br></div><div>Change the root to /dev/mmcb=
lk2p2 according to your boot log. The 2nd linux take the emmc on board as t=
he rootfs storage media.</div><div>So you need first use uuu to burn the sd=
card image to the emmc device on board. And the 2nd linux will use the othe=
r uart as normal console,</div><div>it take the 1st linux uart as early con=
sole.</div><div><br></div><div>Regards,</div><div>Peng.</div><blockquote cl=
ass=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid=
 rgb(204,204,204);padding-left:1ex"><div dir=3D"ltr"><div><br></div><div><b=
r></div><div>=C2=A0=C2=A0=C2=A0 Below are logs:</div><div><br></div><div>=
=C2=A0=C2=A0=C2=A0 <b>Adding virtual PCI device 00:00.0 to cell &quot;linux=
-inmate-demo&quot;<br>Shared memory connection established, peer cells:<br>=
=C2=A0&quot;imx8mq&quot;<br>Adding virtual PCI device 00:01.0 to cell &quot=
;linux-inmate-demo&quot;<br>Shared memory connection established, peer cell=
s:<br>=C2=A0&quot;imx8mq&quot;<br>Created cell &quot;linux-inmate-demo&quot=
;<br>Page pool usage after cell creation: mem 80/992, remap 144/131072<br>[=
 1021.954940] Created Jailhouse cell &quot;linux-inmate-demo&quot;<br>Cell =
&quot;linux-inmate-demo&quot; can be loaded<br>Started cell &quot;linux-inm=
ate-demo&quot;<br>[=C2=A0=C2=A0=C2=A0 0.000000] Booting Linux on physical C=
PU 0x0000000002 [0x410fd034]<br>[=C2=A0=C2=A0=C2=A0 0.000000] Linux version=
 5.4.24-2.1.0+gbabac00 (oe-user@oe-host) (gcc version 9.2.0 (GCC)) #1 SMP P=
REEMPT Tue Jul 28 08:36:15 UTC 2020<br>[=C2=A0=C2=A0=C2=A0 0.000000] Machin=
e model: Freescale i.MX8MQ EVK<br>[=C2=A0=C2=A0=C2=A0 0.000000] earlycon: e=
c_imx6q0 at MMIO 0x0000000030860000 (options &#39;115200&#39;)<br>[=C2=A0=
=C2=A0=C2=A0 0.000000] printk: bootconsole [ec_imx6q0] enabled<br>[=C2=A0=
=C2=A0=C2=A0 0.000000] efi: Getting EFI parameters from FDT:<br>[=C2=A0=C2=
=A0=C2=A0 0.000000] efi: UEFI not found.<br>[=C2=A0=C2=A0=C2=A0 0.000000] c=
ma: Reserved 320 MiB at 0x00000000e8000000<br>[=C2=A0=C2=A0=C2=A0 0.000000]=
 NUMA: No NUMA configuration found<br>[=C2=A0=C2=A0=C2=A0 0.000000] NUMA: F=
aking a node at [mem 0x00000000c0000000-0x00000000fdbfffff]<br>[=C2=A0=C2=
=A0=C2=A0 0.000000] NUMA: NODE_DATA [mem 0xfda0d500-0xfda0efff]<br>[=C2=A0=
=C2=A0=C2=A0 0.000000] Zone ranges:<br>[=C2=A0=C2=A0=C2=A0 0.000000]=C2=A0=
=C2=A0 DMA32=C2=A0=C2=A0=C2=A0 [mem 0x00000000c0000000-0x00000000fdbfffff]<=
br>[=C2=A0=C2=A0=C2=A0 0.000000]=C2=A0=C2=A0 Normal=C2=A0=C2=A0 empty<br>[=
=C2=A0=C2=A0=C2=A0 0.000000] Movable zone start for each node<br>[=C2=A0=C2=
=A0=C2=A0 0.000000] Early memory node ranges<br>[=C2=A0=C2=A0=C2=A0 0.00000=
0]=C2=A0=C2=A0 node=C2=A0=C2=A0 0: [mem 0x00000000c0000000-0x00000000fdbfff=
ff]<br>[=C2=A0=C2=A0=C2=A0 0.000000] Initmem setup node 0 [mem 0x00000000c0=
000000-0x00000000fdbfffff]<br>[=C2=A0=C2=A0=C2=A0 0.000000] psci: probing f=
or conduit method from DT.<br>[=C2=A0=C2=A0=C2=A0 0.000000] psci: PSCIv1.1 =
detected in firmware.<br>[=C2=A0=C2=A0=C2=A0 0.000000] psci: Using standard=
 PSCI v0.2 function IDs<br>[=C2=A0=C2=A0=C2=A0 0.000000] psci: MIGRATE_INFO=
_TYPE not supported.<br>[=C2=A0=C2=A0=C2=A0 0.000000] psci: SMC Calling Con=
vention v1.1<br>[=C2=A0=C2=A0=C2=A0 0.000000] percpu: Embedded 24 pages/cpu=
 s58904 r8192 d31208 u98304<br>[=C2=A0=C2=A0=C2=A0 0.000000] Detected VIPT =
I-cache on CPU0<br>[=C2=A0=C2=A0=C2=A0 0.000000] CPU features: detected: AR=
M erratum 845719<br>[=C2=A0=C2=A0=C2=A0 0.000000] CPU features: detected: G=
IC system register CPU interface<br>[=C2=A0=C2=A0=C2=A0 0.000000] Built 1 z=
onelists, mobility grouping on.=C2=A0 Total pages: 248976<br>[=C2=A0=C2=A0=
=C2=A0 0.000000] Policy zone: DMA32<br>[=C2=A0=C2=A0=C2=A0 0.000000] Kernel=
 command line: clk_ignore_unused console=3Dttymxc0,115200 earlycon=3Dec_imx=
6q,0x30860000,115200 root=3D/dev/mmcblk1p2 rootwait rw<br>[=C2=A0=C2=A0=C2=
=A0 0.000000] Dentry cache hash table entries: 131072 (order: 8, 1048576 by=
tes, linear)<br>[=C2=A0=C2=A0=C2=A0 0.000000] Inode-cache hash table entrie=
s: 65536 (order: 7, 524288 bytes, linear)<br>[=C2=A0=C2=A0=C2=A0 0.000000] =
mem auto-init: stack:off, heap alloc:off, heap free:off<br>[=C2=A0=C2=A0=C2=
=A0 0.000000] Memory: 635512K/1011712K available (16444K kernel code, 1444K=
 rwdata, 6472K rodata, 2944K init, 1017K bss, 48520K reserved, 327680K cma-=
reserved)<br>[=C2=A0=C2=A0=C2=A0 0.000000] SLUB: HWalign=3D64, Order=3D0-3,=
 MinObjects=3D0, CPUs=3D2, Nodes=3D1<br>[=C2=A0=C2=A0=C2=A0 0.000000] rcu: =
Preemptible hierarchical RCU implementation.<br>[=C2=A0=C2=A0=C2=A0 0.00000=
0] rcu:=C2=A0=C2=A0=C2=A0=C2=A0 RCU restricting CPUs from NR_CPUS=3D256 to =
nr_cpu_ids=3D2.<br>[=C2=A0=C2=A0=C2=A0 0.000000]=C2=A0 Tasks RCU enabled.<b=
r>[=C2=A0=C2=A0=C2=A0 0.000000] rcu: RCU calculated value of scheduler-enli=
stment delay is 25 jiffies.<br>[=C2=A0=C2=A0=C2=A0 0.000000] rcu: Adjusting=
 geometry for rcu_fanout_leaf=3D16, nr_cpu_ids=3D2<br>[=C2=A0=C2=A0=C2=A0 0=
.000000] NR_IRQS: 64, nr_irqs: 64, preallocated irqs: 0<br>[=C2=A0=C2=A0=C2=
=A0 0.000000] GICv3: 128 SPIs implemented<br>[=C2=A0=C2=A0=C2=A0 0.000000] =
GICv3: 0 Extended SPIs implemented<br>[=C2=A0=C2=A0=C2=A0 0.000000] GICv3: =
Distributor has no Range Selector support<br>[=C2=A0=C2=A0=C2=A0 0.000000] =
GICv3: 16 PPIs implemented<br>[=C2=A0=C2=A0=C2=A0 0.000000] GICv3: no VLPI =
support, no direct LPI support<br>[=C2=A0=C2=A0=C2=A0 0.000000] GICv3: CPU0=
: found redistributor 2 region 0:0x00000000388c0000<br>[=C2=A0=C2=A0=C2=A0 =
0.000000] ITS: No ITS available, not enabling LPIs<br>[=C2=A0=C2=A0=C2=A0 0=
.000000] random: get_random_bytes called from start_kernel+0x2b8/0x44c with=
 crng_init=3D0<br>[=C2=A0=C2=A0=C2=A0 0.000000] arch_timer: cp15 timer(s) r=
unning at 8.33MHz (virt).<br>[=C2=A0=C2=A0=C2=A0 0.000000] clocksource: arc=
h_sys_counter: mask: 0xffffffffffffff max_cycles: 0x1ec0311ec, max_idle_ns:=
 440795202152 ns<br>[=C2=A0=C2=A0=C2=A0 0.000004] sched_clock: 56 bits at 8=
MHz, resolution 120ns, wraps every 2199023255541ns<br>[=C2=A0=C2=A0=C2=A0 0=
.008121] Console: colour dummy device 80x25<br>[=C2=A0=C2=A0=C2=A0 0.012473=
] Calibrating delay loop (skipped), value calculated using timer frequency.=
. 16.66 BogoMIPS (lpj=3D33333)<br>[=C2=A0=C2=A0=C2=A0 0.022664] pid_max: de=
fault: 32768 minimum: 301<br>[=C2=A0=C2=A0=C2=A0 0.027337] LSM: Security Fr=
amework initializing<br>[=C2=A0=C2=A0=C2=A0 0.031915] Mount-cache hash tabl=
e entries: 2048 (order: 2, 16384 bytes, linear)<br>[=C2=A0=C2=A0=C2=A0 0.03=
9248] Mountpoint-cache hash table entries: 2048 (order: 2, 16384 bytes, lin=
ear)<br>[=C2=A0=C2=A0=C2=A0 0.071135] ASID allocator initialised with 32768=
 entries<br>[=C2=A0=C2=A0=C2=A0 0.079137] rcu: Hierarchical SRCU implementa=
tion.<br>[=C2=A0=C2=A0=C2=A0 0.087271] EFI services will not be available.<=
br>[=C2=A0=C2=A0=C2=A0 0.095177] smp: Bringing up secondary CPUs ...<br>[=
=C2=A0=C2=A0=C2=A0 0.127296] Detected VIPT I-cache on CPU1<br>[=C2=A0=C2=A0=
=C2=A0 0.127333] GICv3: CPU1: found redistributor 3 region 0:0x00000000388e=
0000<br>[=C2=A0=C2=A0=C2=A0 0.127374] CPU1: Booted secondary processor 0x00=
00000003 [0x410fd034]<br>[=C2=A0=C2=A0=C2=A0 0.127452] smp: Brought up 1 no=
de, 2 CPUs<br>[=C2=A0=C2=A0=C2=A0 0.146060] SMP: Total of 2 processors acti=
vated.<br>[=C2=A0=C2=A0=C2=A0 0.150745] CPU features: detected: 32-bit EL0 =
Support<br>[=C2=A0=C2=A0=C2=A0 0.155882] CPU features: detected: CRC32 inst=
ructions<br>[=C2=A0=C2=A0=C2=A0 0.171395] CPU: All CPU(s) started at EL1<br=
>[=C2=A0=C2=A0=C2=A0 0.172643] alternatives: patching kernel code<br>[=C2=
=A0=C2=A0=C2=A0 0.178327] devtmpfs: initialized<br>[=C2=A0=C2=A0=C2=A0 0.18=
2016] clocksource: jiffies: mask: 0xffffffff max_cycles: 0xffffffff, max_id=
le_ns: 7645041785100000 ns<br>[=C2=A0=C2=A0=C2=A0 0.190093] futex hash tabl=
e entries: 512 (order: 3, 32768 bytes, linear)<br>[=C2=A0=C2=A0=C2=A0 0.205=
814] pinctrl core: initialized pinctrl subsystem<br>[=C2=A0=C2=A0=C2=A0 0.2=
08766] DMI not present or invalid.<br>[=C2=A0=C2=A0=C2=A0 0.212295] NET: Re=
gistered protocol family 16<br>[=C2=A0=C2=A0=C2=A0 0.226844] DMA: prealloca=
ted 256 KiB pool for atomic allocations<br>[=C2=A0=C2=A0=C2=A0 0.230091] au=
dit: initializing netlink subsys (disabled)<br>[=C2=A0=C2=A0=C2=A0 0.235625=
] audit: type=3D2000 audit(0.200:1): state=3Dinitialized audit_enabled=3D0 =
res=3D1<br>[=C2=A0=C2=A0=C2=A0 0.243221] cpuidle: using governor menu<br>[=
=C2=A0=C2=A0=C2=A0 0.247461] hw-breakpoint: found 6 breakpoint and 4 watchp=
oint registers.<br>[=C2=A0=C2=A0=C2=A0 0.254239] Serial: AMBA PL011 UART dr=
iver<br>[=C2=A0=C2=A0=C2=A0 0.258022] imx mu driver is registered.<br>[=C2=
=A0=C2=A0=C2=A0 0.261865] imx rpmsg driver is registered.<br>[=C2=A0=C2=A0=
=C2=A0 0.283632] HugeTLB registered 1.00 GiB page size, pre-allocated 0 pag=
es<br>[=C2=A0=C2=A0=C2=A0 0.287485] HugeTLB registered 32.0 MiB page size, =
pre-allocated 0 pages<br>[=C2=A0=C2=A0=C2=A0 0.294161] HugeTLB registered 2=
.00 MiB page size, pre-allocated 0 pages<br>[=C2=A0=C2=A0=C2=A0 0.300846] H=
ugeTLB registered 64.0 KiB page size, pre-allocated 0 pages<br>[=C2=A0=C2=
=A0=C2=A0 0.309530] cryptd: max_cpu_qlen set to 1000<br>[=C2=A0=C2=A0=C2=A0=
 0.317166] ACPI: Interpreter disabled.<br>[=C2=A0=C2=A0=C2=A0 0.318509] iom=
mu: Default domain type: Translated<br>[=C2=A0=C2=A0=C2=A0 0.323154] vgaarb=
: loaded<br>[=C2=A0=C2=A0=C2=A0 0.325989] SCSI subsystem initialized<br>[=
=C2=A0=C2=A0=C2=A0 0.329830] usbcore: registered new interface driver usbfs=
<br>[=C2=A0=C2=A0=C2=A0 0.334947] usbcore: registered new interface driver =
hub<br>[=C2=A0=C2=A0=C2=A0 0.340466] usbcore: registered new device driver =
usb<br>[=C2=A0=C2=A0=C2=A0 0.345518] mc: Linux media interface: v0.10<br>[=
=C2=A0=C2=A0=C2=A0 0.349507] videodev: Linux video capture interface: v2.00=
<br>[=C2=A0=C2=A0=C2=A0 0.355017] pps_core: LinuxPPS API ver. 1 registered<=
br>[=C2=A0=C2=A0=C2=A0 0.359900] pps_core: Software ver. 5.3.6 - Copyright =
2005-2007 Rodolfo Giometti &lt;<a href=3D"mailto:giometti@linux.it" target=
=3D"_blank">giometti@linux.it</a>&gt;<br>[=C2=A0=C2=A0=C2=A0 0.369034] PTP =
clock support registered<br>[=C2=A0=C2=A0=C2=A0 0.372976] EDAC MC: Ver: 3.0=
.0<br>[=C2=A0=C2=A0=C2=A0 0.376456] No BMan portals available!<br>[=C2=A0=
=C2=A0=C2=A0 0.379991] QMan: Allocated lookup table at (____ptrval____), en=
try count 65537<br>[=C2=A0=C2=A0=C2=A0 0.387121] No QMan portals available!=
<br>[=C2=A0=C2=A0=C2=A0 0.390844] No USDPAA memory, no &#39;fsl,usdpaa-mem&=
#39; in device-tree<br>[=C2=A0=C2=A0=C2=A0 0.397047] FPGA manager framework=
<br>[=C2=A0=C2=A0=C2=A0 0.400255] Advanced Linux Sound Architecture Driver =
Initialized.<br>[=C2=A0=C2=A0=C2=A0 0.406683] Bluetooth: Core ver 2.22<br>[=
=C2=A0=C2=A0=C2=A0 0.409838] NET: Registered protocol family 31<br>[=C2=A0=
=C2=A0=C2=A0 0.414246] Bluetooth: HCI device and connection manager initial=
ized<br>[=C2=A0=C2=A0=C2=A0 0.420580] Bluetooth: HCI socket layer initializ=
ed<br>[=C2=A0=C2=A0=C2=A0 0.425440] Bluetooth: L2CAP socket layer initializ=
ed<br>[=C2=A0=C2=A0=C2=A0 0.430494] Bluetooth: SCO socket layer initialized=
<br>[=C2=A0=C2=A0=C2=A0 0.435863] clocksource: Switched to clocksource arch=
_sys_counter<br>[=C2=A0=C2=A0=C2=A0 0.441553] VFS: Disk quotas dquot_6.6.0<=
br>[=C2=A0=C2=A0=C2=A0 0.445367] VFS: Dquot-cache hash table entries: 512 (=
order 0, 4096 bytes)<br>[=C2=A0=C2=A0=C2=A0 0.452334] pnp: PnP ACPI: disabl=
ed<br>[=C2=A0=C2=A0=C2=A0 0.462170] thermal_sys: Registered thermal governo=
r &#39;step_wise&#39;<br>[=C2=A0=C2=A0=C2=A0 0.462173] thermal_sys: Registe=
red thermal governor &#39;power_allocator&#39;<br>[=C2=A0=C2=A0=C2=A0 0.465=
472] NET: Registered protocol family 2<br>[=C2=A0=C2=A0=C2=A0 0.476511] tcp=
_listen_portaddr_hash hash table entries: 512 (order: 1, 8192 bytes, linear=
)<br>[=C2=A0=C2=A0=C2=A0 0.484540] TCP established hash table entries: 8192=
 (order: 4, 65536 bytes, linear)<br>[=C2=A0=C2=A0=C2=A0 0.492302] TCP bind =
hash table entries: 8192 (order: 5, 131072 bytes, linear)<br>[=C2=A0=C2=A0=
=C2=A0 0.499571] TCP: Hash tables configured (established 8192 bind 8192)<b=
r>[=C2=A0=C2=A0=C2=A0 0.505845] UDP hash table entries: 512 (order: 2, 1638=
4 bytes, linear)<br>[=C2=A0=C2=A0=C2=A0 0.512401] UDP-Lite hash table entri=
es: 512 (order: 2, 16384 bytes, linear)<br>[=C2=A0=C2=A0=C2=A0 0.519510] NE=
T: Registered protocol family 1<br>[=C2=A0=C2=A0=C2=A0 0.524157] RPC: Regis=
tered named UNIX socket transport module.<br>[=C2=A0=C2=A0=C2=A0 0.529649] =
RPC: Registered udp transport module.<br>[=C2=A0=C2=A0=C2=A0 0.534334] RPC:=
 Registered tcp transport module.<br>[=C2=A0=C2=A0=C2=A0 0.539023] RPC: Reg=
istered tcp NFSv4.1 backchannel transport module.<br>[=C2=A0=C2=A0=C2=A0 0.=
545810] PCI: CLS 0 bytes, default 64<br>[=C2=A0=C2=A0=C2=A0 0.549924] kvm [=
1]: HYP mode not available<br>[=C2=A0=C2=A0=C2=A0 0.559322] Initialise syst=
em trusted keyrings<br>[=C2=A0=C2=A0=C2=A0 0.561042] workingset: timestamp_=
bits=3D44 max_order=3D18 bucket_order=3D0<br>[=C2=A0=C2=A0=C2=A0 0.574077] =
squashfs: version 4.0 (2009/01/31) Phillip Lougher<br>[=C2=A0=C2=A0=C2=A0 0=
.577766] NFS: Registering the id_resolver key type<br>[=C2=A0=C2=A0=C2=A0 0=
.582117] Key type id_resolver registered<br>[=C2=A0=C2=A0=C2=A0 0.586255] K=
ey type id_legacy registered<br>[=C2=A0=C2=A0=C2=A0 0.590256] nfs4filelayou=
t_init: NFSv4 File Layout Driver Registering...<br>[=C2=A0=C2=A0=C2=A0 0.59=
6947] jffs2: version 2.2. (NAND) =C2=A9 2001-2006 Red Hat, Inc.<br>[=C2=A0=
=C2=A0=C2=A0 0.603415] 9p: Installing v9fs 9p2000 file system support<br>[=
=C2=A0=C2=A0=C2=A0 0.623963] Key type asymmetric registered<br>[=C2=A0=C2=
=A0=C2=A0 0.625197] Asymmetric key parser &#39;x509&#39; registered<br>[=C2=
=A0=C2=A0=C2=A0 0.630097] Block layer SCSI generic (bsg) driver version 0.4=
 loaded (major 244)<br>[=C2=A0=C2=A0=C2=A0 0.637464] io scheduler mq-deadli=
ne registered<br>[=C2=A0=C2=A0=C2=A0 0.641963] io scheduler kyber registere=
d<br>[=C2=A0=C2=A0=C2=A0 0.646985] pci-host-generic bfb00000.pci: host brid=
ge /pci@bfb00000 ranges:<br>[=C2=A0=C2=A0=C2=A0 0.653010] pci-host-generic =
bfb00000.pci:=C2=A0=C2=A0 MEM 0x10000000..0x1000ffff -&gt; 0x10000000<br>[=
=C2=A0=C2=A0=C2=A0 0.660844] pci-host-generic bfb00000.pci: ECAM at [mem 0x=
bfb00000-0xbfbfffff] for [bus 00]<br>[=C2=A0=C2=A0=C2=A0 0.669234] pci-host=
-generic bfb00000.pci: PCI host bridge to bus 0000:00<br>[=C2=A0=C2=A0=C2=
=A0 0.675904] pci_bus 0000:00: root bus resource [bus 00]<br>[=C2=A0=C2=A0=
=C2=A0 0.681117] pci_bus 0000:00: root bus resource [mem 0x10000000-0x1000f=
fff]<br>[=C2=A0=C2=A0=C2=A0 0.687999] pci 0000:00:00.0: [110a:4106] type 00=
 class 0xff0000<br>[=C2=A0=C2=A0=C2=A0 0.693983] pci 0000:00:00.0: reg 0x10=
: [mem 0x00000000-0x00000fff]<br>[=C2=A0=C2=A0=C2=A0 0.700441] pci 0000:00:=
01.0: [110a:4106] type 00 class 0xff0001<br>[=C2=A0=C2=A0=C2=A0 0.706215] p=
ci 0000:00:01.0: reg 0x10: [mem 0x00000000-0x00000fff]<br>[=C2=A0=C2=A0=C2=
=A0 0.712846] pci 0000:00:00.0: BAR 0: assigned [mem 0x10000000-0x10000fff]=
<br>[=C2=A0=C2=A0=C2=A0 0.719226] pci 0000:00:01.0: BAR 0: assigned [mem 0x=
10001000-0x10001fff]<br>[=C2=A0=C2=A0=C2=A0 0.730661] EINJ: ACPI disabled.<=
br>[=C2=A0=C2=A0=C2=A0 0.731846] Bus freq driver module loaded<br>[=C2=A0=
=C2=A0=C2=A0 0.738437] Serial: 8250/16550 driver, 4 ports, IRQ sharing enab=
led<br>[=C2=A0=C2=A0=C2=A0 0.743272] 30890000.serial: ttymxc1 at MMIO 0x308=
90000 (irq =3D 5, base_baud =3D 1562500) is a IMX<br>[=C2=A0=C2=A0=C2=A0 0.=
758802] loop: module loaded<br>[=C2=A0=C2=A0=C2=A0 0.760497] imx ahci drive=
r is registered.<br>[=C2=A0=C2=A0=C2=A0 0.764652] libphy: Fixed MDIO Bus: p=
robed<br>[=C2=A0=C2=A0=C2=A0 0.768138] tun: Universal TUN/TAP device driver=
, 1.6<br>[=C2=A0=C2=A0=C2=A0 0.772584] thunder_xcv, ver 1.0<br>[=C2=A0=C2=
=A0=C2=A0 0.775525] thunder_bgx, ver 1.0<br>[=C2=A0=C2=A0=C2=A0 0.778759] n=
icpf, ver 1.0<br>[=C2=A0=C2=A0=C2=A0 0.781574] Freescale FM module, FMD API=
 version 21.1.0<br>[=C2=A0=C2=A0=C2=A0 0.786667] Freescale FM Ports module<=
br>[=C2=A0=C2=A0=C2=A0 0.790255] fsl_mac: fsl_mac: FSL FMan MAC API based d=
river<br>[=C2=A0=C2=A0=C2=A0 0.795852] fsl_dpa: FSL DPAA Ethernet driver<br=
>[=C2=A0=C2=A0=C2=A0 0.800190] fsl_advanced: FSL DPAA Advanced drivers:<br>=
[=C2=A0=C2=A0=C2=A0 0.805098] fsl_proxy: FSL DPAA Proxy initialization driv=
er<br>[=C2=A0=C2=A0=C2=A0 0.810691] fsl_oh: FSL FMan Offline Parsing port d=
river<br>[=C2=A0=C2=A0=C2=A0 0.816330] hclge is initializing<br>[=C2=A0=C2=
=A0=C2=A0 0.819240] hns3: Hisilicon Ethernet Network Driver for Hip08 Famil=
y - version<br>[=C2=A0=C2=A0=C2=A0 0.826457] hns3: Copyright (c) 2017 Huawe=
i Corporation.<br>[=C2=A0=C2=A0=C2=A0 0.831800] e1000: Intel(R) PRO/1000 Ne=
twork Driver - version 7.3.21-k8-NAPI<br>[=C2=A0=C2=A0=C2=A0 0.838777] e100=
0: Copyright (c) 1999-2006 Intel Corporation.<br>[=C2=A0=C2=A0=C2=A0 0.8445=
45] e1000e: Intel(R) PRO/1000 Network Driver - 3.2.6-k<br>[=C2=A0=C2=A0=C2=
=A0 0.850324] e1000e: Copyright(c) 1999 - 2015 Intel Corporation.<br>[=C2=
=A0=C2=A0=C2=A0 0.856268] igb: Intel(R) Gigabit Ethernet Network Driver - v=
ersion 5.6.0-k<br>[=C2=A0=C2=A0=C2=A0 0.863169] igb: Copyright (c) 2007-201=
4 Intel Corporation.<br>[=C2=A0=C2=A0=C2=A0 0.868770] igbvf: Intel(R) Gigab=
it Virtual Function Network Driver - version 2.4.0-k<br>[=C2=A0=C2=A0=C2=A0=
 0.876539] igbvf: Copyright (c) 2009 - 2012 Intel Corporation.<br>[=C2=A0=
=C2=A0=C2=A0 0.882511] sky2: driver version 1.30<br>[=C2=A0=C2=A0=C2=A0 0.8=
86445] ivshmem-net 0000:00:01.0: enabling device (0000 -&gt; 0002)<br>[=C2=
=A0=C2=A0=C2=A0 0.892506] ivshmem-net 0000:00:01.0: TX memory at 0x00000000=
bfe80000, size 0x000000000007f000<br>[=C2=A0=C2=A0=C2=A0 0.901024] ivshmem-=
net 0000:00:01.0: RX memory at 0x00000000bfe01000, size 0x000000000007f000<=
br>_ivshmem 0000:00:00.0: state_table at 0x00000000bfd00000, size 0x0000000=
000001000om6s 3] dy<br>[=C2=A0=C2=A0=C2=A0 0.924815] uio_ivshmem 0000:00:00=
.0: rw_section at 0x00000000bfd01000, size 0x0000000000009000<br>[=C2=A0=C2=
=A0=C2=A0 0.933489] uio_ivshmem 0000:00:00.0: input_sections at 0x00000000b=
fd0a000, size 0x0000000000006000<br>[=C2=A0=C2=A0=C2=A0 0.942511] uio_ivshm=
em 0000:00:00.0: output_section at 0x00000000bfd0e000, size 0x0000000000002=
000<br>[=C2=A0=C2=A0=C2=A0 0.951977] VFIO - User Level meta-driver version:=
 0.3<br>[=C2=A0=C2=A0=C2=A0 0.957373] ehci_hcd: USB 2.0 &#39;Enhanced&#39; =
Host Controller (EHCI) Driver<br>[=C2=A0=C2=A0=C2=A0 0.963176] ehci-pci: EH=
CI PCI platform driver<br>[=C2=A0=C2=A0=C2=A0 0.967627] ehci-platform: EHCI=
 generic platform driver<br>[=C2=A0=C2=A0=C2=A0 0.972839] ohci_hcd: USB 1.1=
 &#39;Open&#39; Host Controller (OHCI) Driver<br>[=C2=A0=C2=A0=C2=A0 0.9789=
81] ohci-pci: OHCI PCI platform driver<br>[=C2=A0=C2=A0=C2=A0 0.983424] ohc=
i-platform: OHCI generic platform driver<br>[=C2=A0=C2=A0=C2=A0 0.988740] u=
sbcore: registered new interface driver usb-storage<br>[=C2=A0=C2=A0=C2=A0 =
0.994651] usbcore: registered new interface driver usbserial_generic<br>[=
=C2=A0=C2=A0=C2=A0 1.001115] usbserial: USB Serial support registered for g=
eneric<br>[=C2=A0=C2=A0=C2=A0 1.007108] usbcore: registered new interface d=
river ftdi_sio<br>[=C2=A0=C2=A0=C2=A0 1.012831] usbserial: USB Serial suppo=
rt registered for FTDI USB Serial Device<br>[=C2=A0=C2=A0=C2=A0 1.020135] u=
sbcore: registered new interface driver usb_serial_simple<br>[=C2=A0=C2=A0=
=C2=A0 1.026643] usbserial: USB Serial support registered for carelink<br>[=
=C2=A0=C2=A0=C2=A0 1.032709] usbserial: USB Serial support registered for z=
io<br>[=C2=A0=C2=A0=C2=A0 1.038351] usbserial: USB Serial support registere=
d for funsoft<br>[=C2=A0=C2=A0=C2=A0 1.044350] usbserial: USB Serial suppor=
t registered for flashloader<br>[=C2=A0=C2=A0=C2=A0 1.050679] usbserial: US=
B Serial support registered for google<br>[=C2=A0=C2=A0=C2=A0 1.056583] usb=
serial: USB Serial support registered for libtransistor<br>[=C2=A0=C2=A0=C2=
=A0 1.063090] usbserial: USB Serial support registered for vivopay<br>[=C2=
=A0=C2=A0=C2=A0 1.069080] usbserial: USB Serial support registered for moto=
_modem<br>[=C2=A0=C2=A0=C2=A0 1.075333] usbserial: USB Serial support regis=
tered for motorola_tetra<br>[=C2=A0=C2=A0=C2=A0 1.081930] usbserial: USB Se=
rial support registered for novatel_gps<br>[=C2=A0=C2=A0=C2=A0 1.088278] us=
bserial: USB Serial support registered for hp4x<br>[=C2=A0=C2=A0=C2=A0 1.09=
3993] usbserial: USB Serial support registered for suunto<br>[=C2=A0=C2=A0=
=C2=A0 1.099901] usbserial: USB Serial support registered for siemens_mpi<b=
r>[=C2=A0=C2=A0=C2=A0 1.107246] i2c /dev entries driver<br>[=C2=A0=C2=A0=C2=
=A0 1.110345] Bluetooth: HCI UART driver ver 2.3<br>[=C2=A0=C2=A0=C2=A0 1.1=
14127] Bluetooth: HCI UART protocol H4 registered<br>[=C2=A0=C2=A0=C2=A0 1.=
119245] Bluetooth: HCI UART protocol BCSP registered<br>[=C2=A0=C2=A0=C2=A0=
 1.124556] Bluetooth: HCI UART protocol LL registered<br>[=C2=A0=C2=A0=C2=
=A0 1.129660] Bluetooth: HCI UART protocol ATH3K registered<br>[=C2=A0=C2=
=A0=C2=A0 1.135056] Bluetooth: HCI UART protocol Three-wire (H5) registered=
<br>[=C2=A0=C2=A0=C2=A0 1.141326] Bluetooth: HCI UART protocol Broadcom reg=
istered<br>[=C2=A0=C2=A0=C2=A0 1.146950] Bluetooth: HCI UART protocol QCA r=
egistered<br>[=C2=A0=C2=A0=C2=A0 1.152285] imx-cpufreq-dt: probe of imx-cpu=
freq-dt failed with error -2<br>[=C2=A0=C2=A0=C2=A0 1.159033] sdhci: Secure=
 Digital Host Controller Interface driver<br>[=C2=A0=C2=A0=C2=A0 1.164990] =
sdhci: Copyright(c) Pierre Ossman<br>[=C2=A0=C2=A0=C2=A0 1.169392] Synopsys=
 Designware Multimedia Card Interface Driver<br>[=C2=A0=C2=A0=C2=A0 1.17544=
9] sdhci-pltfm: SDHCI platform and OF driver helper<br>[=C2=A0=C2=A0=C2=A0 =
1.181146] sdhci-esdhc-imx 30b40000.mmc: could not get pinctrl<br>[=C2=A0=C2=
=A0=C2=A0 1.218013] mmc2: SDHCI controller on 30b40000.mmc [30b40000.mmc] u=
sing ADMA<br>[=C2=A0=C2=A0=C2=A0 1.222834] ledtrig-cpu: registered to indic=
ate activity on CPUs<br>[=C2=A0=C2=A0=C2=A0 1.229160] usbcore: registered n=
ew interface driver usbhid<br>[=C2=A0=C2=A0=C2=A0 1.233823] usbhid: USB HID=
 core driver<br>[=C2=A0=C2=A0=C2=A0 1.238352] No fsl,qman node<br>[=C2=A0=
=C2=A0=C2=A0 1.240462] Freescale USDPAA process driver<br>[=C2=A0=C2=A0=C2=
=A0 1.244627] fsl-usdpaa: no region found<br>[=C2=A0=C2=A0=C2=A0 1.248477] =
Freescale USDPAA process IRQ driver<br>[=C2=A0=C2=A0=C2=A0 1.257304] pktgen=
: Packet Generator for packet performance testing. Version: 2.75<br>[=C2=A0=
=C2=A0=C2=A0 1.262307] NET: Registered protocol family 26<br>[=C2=A0=C2=A0=
=C2=A0 1.267090] NET: Registered protocol family 10<br>[=C2=A0=C2=A0=C2=A0 =
1.271591] Segment Routing with IPv6<br>[=C2=A0=C2=A0=C2=A0 1.274573] NET: R=
egistered protocol family 17<br>[=C2=A0=C2=A0=C2=A0 1.279040] Bluetooth: RF=
COMM TTY layer initialized<br>[=C2=A0=C2=A0=C2=A0 1.283840] Bluetooth: RFCO=
MM socket layer initialized<br>[=C2=A0=C2=A0=C2=A0 1.288955] Bluetooth: RFC=
OMM ver 1.11<br>[=C2=A0=C2=A0=C2=A0 1.292683] Bluetooth: BNEP (Ethernet Emu=
lation) ver 1.3<br>[=C2=A0=C2=A0=C2=A0 1.297958] Bluetooth: BNEP filters: p=
rotocol multicast<br>[=C2=A0=C2=A0=C2=A0 1.303185] Bluetooth: BNEP socket l=
ayer initialized<br>[=C2=A0=C2=A0=C2=A0 1.308126] Bluetooth: HIDP (Human In=
terface Emulation) ver 1.2<br>[=C2=A0=C2=A0=C2=A0 1.314021] Bluetooth: HIDP=
 socket layer initialized<br>[=C2=A0=C2=A0=C2=A0 1.319004] 8021q: 802.1Q VL=
AN Support v1.8<br>[=C2=A0=C2=A0=C2=A0 1.323167] lib80211: common routines =
for IEEE802.11 drivers<br>[=C2=A0=C2=A0=C2=A0 1.328915] 9pnet: Installing 9=
P2000 support<br>[=C2=A0=C2=A0=C2=A0 1.333060] tsn generic netlink module v=
1 init...<br>[=C2=A0=C2=A0=C2=A0 1.337781] Key type dns_resolver registered=
<br>[=C2=A0=C2=A0=C2=A0 1.342482] registered taskstats version 1<br>[=C2=A0=
=C2=A0=C2=A0 1.346064] Loading compiled-in X.509 certificates<br>[=C2=A0=C2=
=A0=C2=A0 1.352505] hctosys: unable to open rtc device (rtc0)<br>[=C2=A0=C2=
=A0=C2=A0 1.355965] cfg80211: Loading compiled-in X.509 certificates for re=
gulatory database<br>[=C2=A0=C2=A0=C2=A0 1.365244] cfg80211: Loaded X.509 c=
ert &#39;sforshee: 00b28ddf47aef9cea7&#39;<br>[=C2=A0=C2=A0=C2=A0 1.370196]=
 platform regulatory.0: Direct firmware load for regulatory.db failed with =
error -2<br>[=C2=A0=C2=A0=C2=A0 1.371872] clk: Not disabling unused clocks<=
br>[=C2=A0=C2=A0=C2=A0 1.378719] platform regulatory.0: Falling back to sys=
fs fallback for: regulatory.db<br>[=C2=A0=C2=A0=C2=A0 1.382975] ALSA device=
 list:<br>[=C2=A0=C2=A0=C2=A0 1.393625]=C2=A0=C2=A0 No soundcards found.<br=
>[=C2=A0=C2=A0=C2=A0 1.397057] Warning: unable to open an initial console.<=
br>[=C2=A0=C2=A0=C2=A0 1.402301] Waiting for root device /dev/mmcblk1p2...<=
br>[=C2=A0=C2=A0=C2=A0 1.417055] mmc2: new DDR MMC card at address 0001<br>=
[=C2=A0=C2=A0=C2=A0 1.419499] mmcblk2: mmc2:0001 DG4016 14.7 GiB<br>[=C2=A0=
=C2=A0=C2=A0 1.423711] mmcblk2boot0: mmc2:0001 DG4016 partition 1 4.00 MiB<=
br>[=C2=A0=C2=A0=C2=A0 1.429619] mmcblk2boot1: mmc2:0001 DG4016 partition 2=
 4.00 MiB<br>[=C2=A0=C2=A0=C2=A0 1.435431] mmcblk2rpmb: mmc2:0001 DG4016 pa=
rtition 3 4.00 MiB, chardev (237:0)<br>[=C2=A0=C2=A0=C2=A0 1.452011]=C2=A0 =
mmcblk2: p1 p2<br>[=C2=A0=C2=A0 62.528001] cfg80211: failed to load regulat=
ory.db<br></b><br></div></div>

<p></p>

-- <br>
You received this message because you are subscribed to the Google Groups &=
quot;Jailhouse&quot; group.<br>
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to <a href=3D"mailto:jailhouse-dev+unsubscribe@googlegroups.com" targe=
t=3D"_blank">jailhouse-dev+unsubscribe@googlegroups.com</a>.<br>
To view this discussion on the web visit <a href=3D"https://groups.google.c=
om/d/msgid/jailhouse-dev/11e37b92-3146-4194-877f-f79ab746d971o%40googlegrou=
ps.com?utm_medium=3Demail&amp;utm_source=3Dfooter" target=3D"_blank">https:=
//groups.google.com/d/msgid/jailhouse-dev/11e37b92-3146-4194-877f-f79ab746d=
971o%40googlegroups.com</a>.<br>
</blockquote></div><br clear=3D"all"><div><br></div>-- <br><div dir=3D"ltr"=
 class=3D"gmail_signature"><div dir=3D"ltr"><br></div></div></div>

<p></p>

-- <br />
You received this message because you are subscribed to the Google Groups &=
quot;Jailhouse&quot; group.<br />
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to <a href=3D"mailto:jailhouse-dev+unsubscribe@googlegroups.com">jailh=
ouse-dev+unsubscribe@googlegroups.com</a>.<br />
To view this discussion on the web visit <a href=3D"https://groups.google.c=
om/d/msgid/jailhouse-dev/CAEfxd--LbKjCA55W-tNmL_4H2b%2BH3jsW6PKYAo5B2Y1Wx0o=
6GQ%40mail.gmail.com?utm_medium=3Demail&utm_source=3Dfooter">https://groups=
.google.com/d/msgid/jailhouse-dev/CAEfxd--LbKjCA55W-tNmL_4H2b%2BH3jsW6PKYAo=
5B2Y1Wx0o6GQ%40mail.gmail.com</a>.<br />

--0000000000008653ec05ac2b5111--
