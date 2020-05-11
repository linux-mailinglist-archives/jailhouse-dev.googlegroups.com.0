Return-Path: <jailhouse-dev+bncBDAPRTOWQ4KBBF724L2QKGQE5OHJXGI@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-oi1-x23d.google.com (mail-oi1-x23d.google.com [IPv6:2607:f8b0:4864:20::23d])
	by mail.lfdr.de (Postfix) with ESMTPS id E3E911CCFE3
	for <lists+jailhouse-dev@lfdr.de>; Mon, 11 May 2020 04:48:56 +0200 (CEST)
Received: by mail-oi1-x23d.google.com with SMTP id t124sf11264532oif.13
        for <lists+jailhouse-dev@lfdr.de>; Sun, 10 May 2020 19:48:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:date:from:to:message-id:in-reply-to:references:subject
         :mime-version:x-original-sender:precedence:mailing-list:list-id
         :list-post:list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=6YmxCT7V7xn3z3KgD7RrVPNmimcBuXFYV9NaQL7Cz5o=;
        b=tQlMyJWrHjiErPODguaoQB8/54hjz8+gwvHVt4qwuqVRD7mRoozt78AkBSrTvKslFx
         wBiKQ/k6JGDltf2qHqBjYzCUU8qGagLtITaFNA1eEHQ/nfRjqQ/VWVz3bMSSsaePPt7R
         PSWCRFO6UnUuWRKbdQLRoiB/rhEe1nR3YlRWcDN2t9e4dMrdrW3DhTvjmIF6pQjgB7M1
         OonFBSictLXXjagqNuuPPTW2iy0ndMhptLSAqUd26iF3/eA3Nji/KSf5Auh1sjpDA5QZ
         czsL5Nzy1W4kAh6B2kq+YhNhdnTQT4NNkWtr5WDb0gRECRZDsp8qQDkycTkxHt+FuzzO
         Ftkg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:message-id:in-reply-to:references:subject:mime-version
         :x-original-sender:precedence:mailing-list:list-id:list-post
         :list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=6YmxCT7V7xn3z3KgD7RrVPNmimcBuXFYV9NaQL7Cz5o=;
        b=Y5MWTJvjytlrOTT92Aoplx5+b/e+X7CpCSqoofZ51IHtS7ioAlOU7KnLwyc7/MfVDO
         5flsV1f4f/1jcdhNT6iEJx89lODPDD6NG5mf/StmxnxTCochRCdlWIA2kdrYuugm3i/K
         07PRXh87BZ4y4wmS00B73acYEq3l2o/7LZNoZ1VZ5Vc9syq8mb/gsd5ZPjOlq1eB4DWq
         50tWr9WgyQCfHy1nDqZEmRjbLu+61gDs9Rrc7VzicSac3Ze16/xsZj78Wk4lH118F+x/
         u65Oa0O6Zbanx+uJHiPAee5wL8YvtY++9Nd+wa+Y/M0NyL4oEDih3kFZxdVUnPOKv1Vk
         7zGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:date:from:to:message-id:in-reply-to
         :references:subject:mime-version:x-original-sender:precedence
         :mailing-list:list-id:x-spam-checked-in-group:list-post:list-help
         :list-archive:list-subscribe:list-unsubscribe;
        bh=6YmxCT7V7xn3z3KgD7RrVPNmimcBuXFYV9NaQL7Cz5o=;
        b=EXqBJcIO0TO15OO+NYkEiumh9ITcMXv9IwkR/nkyqCvtTUlhhj7yh+yy0KXeuGaFQK
         cmzCIY87OS4nSKhbt9BQgM0eKmqBfk/jyKHZ5/hkqflhvW4CDWdxJWxD73S2QCTnL1eX
         iO1TEpZ3lUAUhOUYnYKxCZqol1HGKhDivmNOb/LAIKjNLgJi3zG5h+mn8lP83nooUYeZ
         CrZr0d7I1Pc+2ydytnoHHmwt5sYaXhsxgAe8F1hm0rOznPxkbpdlfXZwXTuLqdBaesKp
         1R6l0VMjfs5XlkS4RINnVOK5kXYr0UeMxkX070vuW1w22duZU+6UzUUQtrHAtRaKAYrF
         gL9Q==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AGi0PubXgBAecG2Y8SK6uYdN35h19EIDRDZMNdLDi0RHIgMsS2Rje2Tr
	CX5KPd/ficgKE45fWLUm3yw=
X-Google-Smtp-Source: APiQypLPI8oF2SCWfa3lmvgeoVoRw9nnuy0q3z7aXhBv1VFjSQQS63f2Hy5jxzvA57wrfsBkfC80fA==
X-Received: by 2002:a4a:8c0e:: with SMTP id u14mr11765548ooj.72.1589165335520;
        Sun, 10 May 2020 19:48:55 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a05:6820:13c:: with SMTP id i28ls493497ood.6.gmail; Sun, 10
 May 2020 19:48:54 -0700 (PDT)
X-Received: by 2002:a4a:a305:: with SMTP id q5mr7386010ool.76.1589165334767;
        Sun, 10 May 2020 19:48:54 -0700 (PDT)
Date: Sun, 10 May 2020 19:48:53 -0700 (PDT)
From: zhengjun zhang <zhangzhengjunhust@gmail.com>
To: Jailhouse <jailhouse-dev@googlegroups.com>
Message-Id: <5d1a49d5-7ed6-4f62-b5b9-240c5f69c178@googlegroups.com>
In-Reply-To: <36ef5525-5dc8-1463-14a4-1ff6837c23e4@web.de>
References: <b54b7357-842b-47d2-8a0f-19084d90717d@googlegroups.com>
 <36ef5525-5dc8-1463-14a4-1ff6837c23e4@web.de>
Subject: Re: On the question of virtualization performance loss
MIME-Version: 1.0
Content-Type: multipart/mixed; 
	boundary="----=_Part_1383_1091944015.1589165334049"
X-Original-Sender: zhangzhengjunhust@gmail.com
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

------=_Part_1383_1091944015.1589165334049
Content-Type: multipart/alternative; 
	boundary="----=_Part_1384_1158526143.1589165334051"

------=_Part_1384_1158526143.1589165334051
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable


I used the same kernel and rootfs for root cell and non root cell when I =
=20
when I was testing. I used the imx8mq-veth.cell provided by jailhouse as=20
the root cell configuration file, and imx8mq-linux-demo.cell as the=20
non-root-cell configuration file.
=E5=9C=A8 2020=E5=B9=B45=E6=9C=8811=E6=97=A5=E6=98=9F=E6=9C=9F=E4=B8=80 UTC=
+8=E4=B8=8A=E5=8D=8812:54:46=EF=BC=8CJan Kiszka=E5=86=99=E9=81=93=EF=BC=9A
>
> On 10.05.20 17:26, zhengjun zhang wrote:=20
> >=20
> > Hi~=20
> > I recently tested the loss of virtualization performance in jailhouse o=
n=20
> > the i.MX 8MQuad, using the testing tools sysbench and super_pi.=20
> > I used the same Linux image (imx_4.14.98_2.0.0_ga) in the Root Cell and=
=20
> > inmate Cell=20
> > Here is the jailhouse startup information=20
> > Root $ cat /proc/cpuinfo=20
> > processor: 0=20
> > BogoMIPS: 16.66=20
> > Features: fp asimd evtstrm aes pmull sha1 sha2 crc32 cpuid=20
> > CPU implementer: 0x41=20
> > CPU architecture: 8=20
> > CPU variant: 0x0=20
> > CPU part: 0xd03=20
> > CPU revision: 4=20
> >=20
> > processor: 1=20
> > BogoMIPS: 16.66=20
> > Features: fp asimd evtstrm aes pmull sha1 sha2 crc32 cpuid=20
> > CPU implementer: 0x41=20
> > CPU architecture: 8=20
> > CPU variant: 0x0=20
> > CPU part: 0xd03=20
> > CPU revision: 4=20
> > Root $ cd ~/jailhouse=20
> > Root $ insmod jailhouse.ko=20
> > [  233.063524] jailhouse: loading out-of-tree module taints kernel.=20
> >=20
> > Root $ ./jailhouse enable configs/imx8mq-veth.cell=20
> >=20
> > Initializing Jailhouse hypervisor v0.10 (66-g2217029) on CPU 1=20
> > Code location: 0x0000ffffc0200800=20
> > Page pool usage after early setup: mem 39/994, remap 0/131072=20
> > Initializing processors:=20
> >   CPU 1... OK=20
> >   CPU 0... OK=20
> >   CPU 3... OK=20
> >   CPU 2... OK=20
> > Initializing unit: irqchip=20
> > Initializing unit: ARM SMMU=20
> > No SMMU=20
> > Initializing unit: PCI=20
> > Adding virtual PCI device 00:00.0 to cell "imx8mq"=20
> > iommu_config_commit imx8mq=20
> > Page pool usage after late setup: mem 72/994, remap 144/131072=20
> > Activating hypervisor=20
> > [  251.213460] OF: PCI: host bridge /pci@0 ranges:=20
> > [  251.218097] OF: PCI:   MEM 0xbfc00000..0xbfc01fff -> 0xbfc00000=20
> > [  251.224313] pci-host-generic bfb00000.pci: ECAM at [mem=20
> > 0xbfb00000-0xbfbfffff] for [bus 00]=20
> > [  251.233114] pci-host-generic bfb00000.pci: PCI host bridge to bus=20
> 0000:00=20
> > [  251.240052] pci_bus 0000:00: root bus resource [bus 00]=20
> > [  251.245533] pci_bus 0000:00: root bus resource [mem=20
> > 0xbfc00000-0xbfc01fff]=20
> > [  251.252942] pci 0000:00:00.0: BAR 0: assigned [mem=20
> > 0xbfc00000-0xbfc000ff 64bit]=20
> > [  251.260861] virtio-pci 0000:00:00.0: enabling device (0000 -> 0002)=
=20
> > [  251.269478] The Jailhouse is opening.=20
> > [  251.269864] IPv6: ADDRCONF(NETDEV_UP): eth1: link is not ready=20
> >=20
> > Root $ ./jailhouse cell linux configs/imx8mq-linux-demo.cell=20
> > /run/media/mmcblk1p1/Image -d=20
> > /run/media/mmcblk1p1/fsl-imx8mq-evk-inmate.dtb -c "clk_ignore_unused=20
> > console=3Dttymxc1,115200 earlycon=3Dec_imx6q,0x30860000,115200=20
> > root=3D/dev/mmcblk0p2 rootwait rw"=20
> > [  315.757129] CPU2: shutdown=20
> > [  315.759844] psci: CPU2 killed.=20
> > [  315.804134] CPU3: shutdown=20
> > [  315.806843] psci: CPU3 killed.=20
> > Adding virtual PCI device 00:00.0 to cell "linux-inmate-demo"=20
> > Shared memory connection established: "linux-inmate-demo" <--> "imx8mq"=
=20
> > iommu_config_commit linux-inmate-demo=20
> > Created cell "linux-inmate-demo"=20
> > Page pool usage after cell creation: mem 88/994, remap 144/131072=20
> > [  315.835959] Created Jailhouse cell "linux-inmate-demo"=20
> > Cell "linux-inmate-demo" can be loaded=20
> > Started cell "linux-inmate-demo"=20
> > [    0.000000] Booting Linux on physical CPU 0x2=20
> > [    0.000000] Linux version 4.14.98-05985-g1175b59 (root@Develop) (gcc=
=20
> > version 7.3.0 (GCC)) #1 SMP PREEMPT Mon Apr 20 11:57:19 CST 2020=20
> > [    0.000000] Boot CPU: AArch64 Processor [410fd034]=20
> > [    0.000000] Machine model: Freescale i.MX8MQ EVK=20
> > [    0.000000] earlycon: ec_imx6q0 at MMIO 0x0000000030860000 (options=
=20
> > '115200')=20
> > [    0.000000] bootconsole [ec_imx6q0] enabled=20
> > [    0.000000] efi: Getting EFI parameters from FDT:=20
> > [    0.000000] efi: UEFI not found.=20
> > [    0.000000] cma: Reserved 320 MiB at 0x00000000e8000000=20
> > [    0.000000] NUMA: No NUMA configuration found=20
> > [    0.000000] NUMA: Faking a node at [mem=20
> > 0x0000000000000000-0x00000000fdbfffff]=20
> > [    0.000000] NUMA: NODE_DATA [mem 0xfdbd7600-0xfdbd93ff]=20
> > [    0.000000] Zone ranges:=20
> > [    0.000000]   DMA      [mem 0x00000000c0000000-0x00000000fdbfffff]=
=20
> > [    0.000000]   Normal   empty=20
> > [    0.000000] Movable zone start for each node=20
> > [    0.000000] Early memory node ranges=20
> > [    0.000000]   node   0: [mem 0x00000000c0000000-0x00000000fdbfffff]=
=20
> > [    0.000000] Initmem setup node 0 [mem=20
> > 0x00000000c0000000-0x00000000fdbfffff]=20
> > processor: 2=20
> > BogoMIPS: 16.66=20
> > Features: fp asimd evtstrm aes pmull sha1 sha2 crc32 cpuid=20
> > CPU implementer: 0x41=20
> > CPU architecture: 8=20
> > CPU variant: 0x0=20
> > CPU part: 0xd03=20
> > CPU revision: 4=20
> >=20
> > processor: 3=20
> > BogoMIPS: 16.66=20
> > Features: fp asimd evtstrm aes pmull sha1 sha2 crc32 cpuid=20
> > CPU implementer: 0x41=20
> > CPU architecture: 8=20
> > CPU variant: 0x0=20
> > CPU part: 0xd03=20
> > CPU revision: 4=20
> >=20
> > I executed the same test case in bare-machine, root cell, and inmate=20
> cell.=20
> > The CPU test results of sysbench in the root cell were approximately 1%=
=20
> > lower than those of the bare machine, but the CPU test results of=20
> > sysbench  in the inmate cell were approximately 1/3 lower than those of=
=20
> > the bare machine.=20
> > The super_pi test results in the root cell were approximately 1% lower=
=20
> > than those in the bare-bones machine, but the super_pi test results in=
=20
> > the inmate cell were approximately 20% lower than those in the=20
> > bare-machine.=20
> > Jailhouse  is a partitioning hypervisor, why is there a significant=20
> > decrease in CPU performance in the inmate cell?=20
> > This result makes me very puzzled, hope to answer.=20
> > If you need any other info let me know.=20
> > I really appreciate any analysis.=20
>
> Jailhouse does not treat non-root cells differently from root cells /wrt=
=20
> performance. The reason must be in the configuration. Were you using the=
=20
> very same kernel in root-cell and non-root inmate? Maybe Peng can also=20
> point to areas that could explain performance differences.=20
>
> Jan=20
>

=E5=9C=A8 2020=E5=B9=B45=E6=9C=8811=E6=97=A5=E6=98=9F=E6=9C=9F=E4=B8=80 UTC=
+8=E4=B8=8A=E5=8D=8812:54:46=EF=BC=8CJan Kiszka=E5=86=99=E9=81=93=EF=BC=9A
>
> On 10.05.20 17:26, zhengjun zhang wrote:=20
> >=20
> > Hi~=20
> > I recently tested the loss of virtualization performance in jailhouse o=
n=20
> > the i.MX 8MQuad, using the testing tools sysbench and super_pi.=20
> > I used the same Linux image (imx_4.14.98_2.0.0_ga) in the Root Cell and=
=20
> > inmate Cell=20
> > Here is the jailhouse startup information=20
> > Root $ cat /proc/cpuinfo=20
> > processor: 0=20
> > BogoMIPS: 16.66=20
> > Features: fp asimd evtstrm aes pmull sha1 sha2 crc32 cpuid=20
> > CPU implementer: 0x41=20
> > CPU architecture: 8=20
> > CPU variant: 0x0=20
> > CPU part: 0xd03=20
> > CPU revision: 4=20
> >=20
> > processor: 1=20
> > BogoMIPS: 16.66=20
> > Features: fp asimd evtstrm aes pmull sha1 sha2 crc32 cpuid=20
> > CPU implementer: 0x41=20
> > CPU architecture: 8=20
> > CPU variant: 0x0=20
> > CPU part: 0xd03=20
> > CPU revision: 4=20
> > Root $ cd ~/jailhouse=20
> > Root $ insmod jailhouse.ko=20
> > [  233.063524] jailhouse: loading out-of-tree module taints kernel.=20
> >=20
> > Root $ ./jailhouse enable configs/imx8mq-veth.cell=20
> >=20
> > Initializing Jailhouse hypervisor v0.10 (66-g2217029) on CPU 1=20
> > Code location: 0x0000ffffc0200800=20
> > Page pool usage after early setup: mem 39/994, remap 0/131072=20
> > Initializing processors:=20
> >   CPU 1... OK=20
> >   CPU 0... OK=20
> >   CPU 3... OK=20
> >   CPU 2... OK=20
> > Initializing unit: irqchip=20
> > Initializing unit: ARM SMMU=20
> > No SMMU=20
> > Initializing unit: PCI=20
> > Adding virtual PCI device 00:00.0 to cell "imx8mq"=20
> > iommu_config_commit imx8mq=20
> > Page pool usage after late setup: mem 72/994, remap 144/131072=20
> > Activating hypervisor=20
> > [  251.213460] OF: PCI: host bridge /pci@0 ranges:=20
> > [  251.218097] OF: PCI:   MEM 0xbfc00000..0xbfc01fff -> 0xbfc00000=20
> > [  251.224313] pci-host-generic bfb00000.pci: ECAM at [mem=20
> > 0xbfb00000-0xbfbfffff] for [bus 00]=20
> > [  251.233114] pci-host-generic bfb00000.pci: PCI host bridge to bus=20
> 0000:00=20
> > [  251.240052] pci_bus 0000:00: root bus resource [bus 00]=20
> > [  251.245533] pci_bus 0000:00: root bus resource [mem=20
> > 0xbfc00000-0xbfc01fff]=20
> > [  251.252942] pci 0000:00:00.0: BAR 0: assigned [mem=20
> > 0xbfc00000-0xbfc000ff 64bit]=20
> > [  251.260861] virtio-pci 0000:00:00.0: enabling device (0000 -> 0002)=
=20
> > [  251.269478] The Jailhouse is opening.=20
> > [  251.269864] IPv6: ADDRCONF(NETDEV_UP): eth1: link is not ready=20
> >=20
> > Root $ ./jailhouse cell linux configs/imx8mq-linux-demo.cell=20
> > /run/media/mmcblk1p1/Image -d=20
> > /run/media/mmcblk1p1/fsl-imx8mq-evk-inmate.dtb -c "clk_ignore_unused=20
> > console=3Dttymxc1,115200 earlycon=3Dec_imx6q,0x30860000,115200=20
> > root=3D/dev/mmcblk0p2 rootwait rw"=20
> > [  315.757129] CPU2: shutdown=20
> > [  315.759844] psci: CPU2 killed.=20
> > [  315.804134] CPU3: shutdown=20
> > [  315.806843] psci: CPU3 killed.=20
> > Adding virtual PCI device 00:00.0 to cell "linux-inmate-demo"=20
> > Shared memory connection established: "linux-inmate-demo" <--> "imx8mq"=
=20
> > iommu_config_commit linux-inmate-demo=20
> > Created cell "linux-inmate-demo"=20
> > Page pool usage after cell creation: mem 88/994, remap 144/131072=20
> > [  315.835959] Created Jailhouse cell "linux-inmate-demo"=20
> > Cell "linux-inmate-demo" can be loaded=20
> > Started cell "linux-inmate-demo"=20
> > [    0.000000] Booting Linux on physical CPU 0x2=20
> > [    0.000000] Linux version 4.14.98-05985-g1175b59 (root@Develop) (gcc=
=20
> > version 7.3.0 (GCC)) #1 SMP PREEMPT Mon Apr 20 11:57:19 CST 2020=20
> > [    0.000000] Boot CPU: AArch64 Processor [410fd034]=20
> > [    0.000000] Machine model: Freescale i.MX8MQ EVK=20
> > [    0.000000] earlycon: ec_imx6q0 at MMIO 0x0000000030860000 (options=
=20
> > '115200')=20
> > [    0.000000] bootconsole [ec_imx6q0] enabled=20
> > [    0.000000] efi: Getting EFI parameters from FDT:=20
> > [    0.000000] efi: UEFI not found.=20
> > [    0.000000] cma: Reserved 320 MiB at 0x00000000e8000000=20
> > [    0.000000] NUMA: No NUMA configuration found=20
> > [    0.000000] NUMA: Faking a node at [mem=20
> > 0x0000000000000000-0x00000000fdbfffff]=20
> > [    0.000000] NUMA: NODE_DATA [mem 0xfdbd7600-0xfdbd93ff]=20
> > [    0.000000] Zone ranges:=20
> > [    0.000000]   DMA      [mem 0x00000000c0000000-0x00000000fdbfffff]=
=20
> > [    0.000000]   Normal   empty=20
> > [    0.000000] Movable zone start for each node=20
> > [    0.000000] Early memory node ranges=20
> > [    0.000000]   node   0: [mem 0x00000000c0000000-0x00000000fdbfffff]=
=20
> > [    0.000000] Initmem setup node 0 [mem=20
> > 0x00000000c0000000-0x00000000fdbfffff]=20
> > processor: 2=20
> > BogoMIPS: 16.66=20
> > Features: fp asimd evtstrm aes pmull sha1 sha2 crc32 cpuid=20
> > CPU implementer: 0x41=20
> > CPU architecture: 8=20
> > CPU variant: 0x0=20
> > CPU part: 0xd03=20
> > CPU revision: 4=20
> >=20
> > processor: 3=20
> > BogoMIPS: 16.66=20
> > Features: fp asimd evtstrm aes pmull sha1 sha2 crc32 cpuid=20
> > CPU implementer: 0x41=20
> > CPU architecture: 8=20
> > CPU variant: 0x0=20
> > CPU part: 0xd03=20
> > CPU revision: 4=20
> >=20
> > I executed the same test case in bare-machine, root cell, and inmate=20
> cell.=20
> > The CPU test results of sysbench in the root cell were approximately 1%=
=20
> > lower than those of the bare machine, but the CPU test results of=20
> > sysbench  in the inmate cell were approximately 1/3 lower than those of=
=20
> > the bare machine.=20
> > The super_pi test results in the root cell were approximately 1% lower=
=20
> > than those in the bare-bones machine, but the super_pi test results in=
=20
> > the inmate cell were approximately 20% lower than those in the=20
> > bare-machine.=20
> > Jailhouse  is a partitioning hypervisor, why is there a significant=20
> > decrease in CPU performance in the inmate cell?=20
> > This result makes me very puzzled, hope to answer.=20
> > If you need any other info let me know.=20
> > I really appreciate any analysis.=20
>
> Jailhouse does not treat non-root cells differently from root cells /wrt=
=20
> performance. The reason must be in the configuration. Were you using the=
=20
> very same kernel in root-cell and non-root inmate? Maybe Peng can also=20
> point to areas that could explain performance differences.=20
>
> Jan=20
>

=E5=9C=A8 2020=E5=B9=B45=E6=9C=8811=E6=97=A5=E6=98=9F=E6=9C=9F=E4=B8=80 UTC=
+8=E4=B8=8A=E5=8D=8812:54:46=EF=BC=8CJan Kiszka=E5=86=99=E9=81=93=EF=BC=9A
>
> On 10.05.20 17:26, zhengjun zhang wrote:=20
> >=20
> > Hi~=20
> > I recently tested the loss of virtualization performance in jailhouse o=
n=20
> > the i.MX 8MQuad, using the testing tools sysbench and super_pi.=20
> > I used the same Linux image (imx_4.14.98_2.0.0_ga) in the Root Cell and=
=20
> > inmate Cell=20
> > Here is the jailhouse startup information=20
> > Root $ cat /proc/cpuinfo=20
> > processor: 0=20
> > BogoMIPS: 16.66=20
> > Features: fp asimd evtstrm aes pmull sha1 sha2 crc32 cpuid=20
> > CPU implementer: 0x41=20
> > CPU architecture: 8=20
> > CPU variant: 0x0=20
> > CPU part: 0xd03=20
> > CPU revision: 4=20
> >=20
> > processor: 1=20
> > BogoMIPS: 16.66=20
> > Features: fp asimd evtstrm aes pmull sha1 sha2 crc32 cpuid=20
> > CPU implementer: 0x41=20
> > CPU architecture: 8=20
> > CPU variant: 0x0=20
> > CPU part: 0xd03=20
> > CPU revision: 4=20
> > Root $ cd ~/jailhouse=20
> > Root $ insmod jailhouse.ko=20
> > [  233.063524] jailhouse: loading out-of-tree module taints kernel.=20
> >=20
> > Root $ ./jailhouse enable configs/imx8mq-veth.cell=20
> >=20
> > Initializing Jailhouse hypervisor v0.10 (66-g2217029) on CPU 1=20
> > Code location: 0x0000ffffc0200800=20
> > Page pool usage after early setup: mem 39/994, remap 0/131072=20
> > Initializing processors:=20
> >   CPU 1... OK=20
> >   CPU 0... OK=20
> >   CPU 3... OK=20
> >   CPU 2... OK=20
> > Initializing unit: irqchip=20
> > Initializing unit: ARM SMMU=20
> > No SMMU=20
> > Initializing unit: PCI=20
> > Adding virtual PCI device 00:00.0 to cell "imx8mq"=20
> > iommu_config_commit imx8mq=20
> > Page pool usage after late setup: mem 72/994, remap 144/131072=20
> > Activating hypervisor=20
> > [  251.213460] OF: PCI: host bridge /pci@0 ranges:=20
> > [  251.218097] OF: PCI:   MEM 0xbfc00000..0xbfc01fff -> 0xbfc00000=20
> > [  251.224313] pci-host-generic bfb00000.pci: ECAM at [mem=20
> > 0xbfb00000-0xbfbfffff] for [bus 00]=20
> > [  251.233114] pci-host-generic bfb00000.pci: PCI host bridge to bus=20
> 0000:00=20
> > [  251.240052] pci_bus 0000:00: root bus resource [bus 00]=20
> > [  251.245533] pci_bus 0000:00: root bus resource [mem=20
> > 0xbfc00000-0xbfc01fff]=20
> > [  251.252942] pci 0000:00:00.0: BAR 0: assigned [mem=20
> > 0xbfc00000-0xbfc000ff 64bit]=20
> > [  251.260861] virtio-pci 0000:00:00.0: enabling device (0000 -> 0002)=
=20
> > [  251.269478] The Jailhouse is opening.=20
> > [  251.269864] IPv6: ADDRCONF(NETDEV_UP): eth1: link is not ready=20
> >=20
> > Root $ ./jailhouse cell linux configs/imx8mq-linux-demo.cell=20
> > /run/media/mmcblk1p1/Image -d=20
> > /run/media/mmcblk1p1/fsl-imx8mq-evk-inmate.dtb -c "clk_ignore_unused=20
> > console=3Dttymxc1,115200 earlycon=3Dec_imx6q,0x30860000,115200=20
> > root=3D/dev/mmcblk0p2 rootwait rw"=20
> > [  315.757129] CPU2: shutdown=20
> > [  315.759844] psci: CPU2 killed.=20
> > [  315.804134] CPU3: shutdown=20
> > [  315.806843] psci: CPU3 killed.=20
> > Adding virtual PCI device 00:00.0 to cell "linux-inmate-demo"=20
> > Shared memory connection established: "linux-inmate-demo" <--> "imx8mq"=
=20
> > iommu_config_commit linux-inmate-demo=20
> > Created cell "linux-inmate-demo"=20
> > Page pool usage after cell creation: mem 88/994, remap 144/131072=20
> > [  315.835959] Created Jailhouse cell "linux-inmate-demo"=20
> > Cell "linux-inmate-demo" can be loaded=20
> > Started cell "linux-inmate-demo"=20
> > [    0.000000] Booting Linux on physical CPU 0x2=20
> > [    0.000000] Linux version 4.14.98-05985-g1175b59 (root@Develop) (gcc=
=20
> > version 7.3.0 (GCC)) #1 SMP PREEMPT Mon Apr 20 11:57:19 CST 2020=20
> > [    0.000000] Boot CPU: AArch64 Processor [410fd034]=20
> > [    0.000000] Machine model: Freescale i.MX8MQ EVK=20
> > [    0.000000] earlycon: ec_imx6q0 at MMIO 0x0000000030860000 (options=
=20
> > '115200')=20
> > [    0.000000] bootconsole [ec_imx6q0] enabled=20
> > [    0.000000] efi: Getting EFI parameters from FDT:=20
> > [    0.000000] efi: UEFI not found.=20
> > [    0.000000] cma: Reserved 320 MiB at 0x00000000e8000000=20
> > [    0.000000] NUMA: No NUMA configuration found=20
> > [    0.000000] NUMA: Faking a node at [mem=20
> > 0x0000000000000000-0x00000000fdbfffff]=20
> > [    0.000000] NUMA: NODE_DATA [mem 0xfdbd7600-0xfdbd93ff]=20
> > [    0.000000] Zone ranges:=20
> > [    0.000000]   DMA      [mem 0x00000000c0000000-0x00000000fdbfffff]=
=20
> > [    0.000000]   Normal   empty=20
> > [    0.000000] Movable zone start for each node=20
> > [    0.000000] Early memory node ranges=20
> > [    0.000000]   node   0: [mem 0x00000000c0000000-0x00000000fdbfffff]=
=20
> > [    0.000000] Initmem setup node 0 [mem=20
> > 0x00000000c0000000-0x00000000fdbfffff]=20
> > processor: 2=20
> > BogoMIPS: 16.66=20
> > Features: fp asimd evtstrm aes pmull sha1 sha2 crc32 cpuid=20
> > CPU implementer: 0x41=20
> > CPU architecture: 8=20
> > CPU variant: 0x0=20
> > CPU part: 0xd03=20
> > CPU revision: 4=20
> >=20
> > processor: 3=20
> > BogoMIPS: 16.66=20
> > Features: fp asimd evtstrm aes pmull sha1 sha2 crc32 cpuid=20
> > CPU implementer: 0x41=20
> > CPU architecture: 8=20
> > CPU variant: 0x0=20
> > CPU part: 0xd03=20
> > CPU revision: 4=20
> >=20
> > I executed the same test case in bare-machine, root cell, and inmate=20
> cell.=20
> > The CPU test results of sysbench in the root cell were approximately 1%=
=20
> > lower than those of the bare machine, but the CPU test results of=20
> > sysbench  in the inmate cell were approximately 1/3 lower than those of=
=20
> > the bare machine.=20
> > The super_pi test results in the root cell were approximately 1% lower=
=20
> > than those in the bare-bones machine, but the super_pi test results in=
=20
> > the inmate cell were approximately 20% lower than those in the=20
> > bare-machine.=20
> > Jailhouse  is a partitioning hypervisor, why is there a significant=20
> > decrease in CPU performance in the inmate cell?=20
> > This result makes me very puzzled, hope to answer.=20
> > If you need any other info let me know.=20
> > I really appreciate any analysis.=20
>
> Jailhouse does not treat non-root cells differently from root cells /wrt=
=20
> performance. The reason must be in the configuration. Were you using the=
=20
> very same kernel in root-cell and non-root inmate? Maybe Peng can also=20
> point to areas that could explain performance differences.=20
>
> Jan=20
>

=E5=9C=A8 2020=E5=B9=B45=E6=9C=8811=E6=97=A5=E6=98=9F=E6=9C=9F=E4=B8=80 UTC=
+8=E4=B8=8A=E5=8D=8812:54:46=EF=BC=8CJan Kiszka=E5=86=99=E9=81=93=EF=BC=9A
>
> On 10.05.20 17:26, zhengjun zhang wrote:=20
> >=20
> > Hi~=20
> > I recently tested the loss of virtualization performance in jailhouse o=
n=20
> > the i.MX 8MQuad, using the testing tools sysbench and super_pi.=20
> > I used the same Linux image (imx_4.14.98_2.0.0_ga) in the Root Cell and=
=20
> > inmate Cell=20
> > Here is the jailhouse startup information=20
> > Root $ cat /proc/cpuinfo=20
> > processor: 0=20
> > BogoMIPS: 16.66=20
> > Features: fp asimd evtstrm aes pmull sha1 sha2 crc32 cpuid=20
> > CPU implementer: 0x41=20
> > CPU architecture: 8=20
> > CPU variant: 0x0=20
> > CPU part: 0xd03=20
> > CPU revision: 4=20
> >=20
> > processor: 1=20
> > BogoMIPS: 16.66=20
> > Features: fp asimd evtstrm aes pmull sha1 sha2 crc32 cpuid=20
> > CPU implementer: 0x41=20
> > CPU architecture: 8=20
> > CPU variant: 0x0=20
> > CPU part: 0xd03=20
> > CPU revision: 4=20
> > Root $ cd ~/jailhouse=20
> > Root $ insmod jailhouse.ko=20
> > [  233.063524] jailhouse: loading out-of-tree module taints kernel.=20
> >=20
> > Root $ ./jailhouse enable configs/imx8mq-veth.cell=20
> >=20
> > Initializing Jailhouse hypervisor v0.10 (66-g2217029) on CPU 1=20
> > Code location: 0x0000ffffc0200800=20
> > Page pool usage after early setup: mem 39/994, remap 0/131072=20
> > Initializing processors:=20
> >   CPU 1... OK=20
> >   CPU 0... OK=20
> >   CPU 3... OK=20
> >   CPU 2... OK=20
> > Initializing unit: irqchip=20
> > Initializing unit: ARM SMMU=20
> > No SMMU=20
> > Initializing unit: PCI=20
> > Adding virtual PCI device 00:00.0 to cell "imx8mq"=20
> > iommu_config_commit imx8mq=20
> > Page pool usage after late setup: mem 72/994, remap 144/131072=20
> > Activating hypervisor=20
> > [  251.213460] OF: PCI: host bridge /pci@0 ranges:=20
> > [  251.218097] OF: PCI:   MEM 0xbfc00000..0xbfc01fff -> 0xbfc00000=20
> > [  251.224313] pci-host-generic bfb00000.pci: ECAM at [mem=20
> > 0xbfb00000-0xbfbfffff] for [bus 00]=20
> > [  251.233114] pci-host-generic bfb00000.pci: PCI host bridge to bus=20
> 0000:00=20
> > [  251.240052] pci_bus 0000:00: root bus resource [bus 00]=20
> > [  251.245533] pci_bus 0000:00: root bus resource [mem=20
> > 0xbfc00000-0xbfc01fff]=20
> > [  251.252942] pci 0000:00:00.0: BAR 0: assigned [mem=20
> > 0xbfc00000-0xbfc000ff 64bit]=20
> > [  251.260861] virtio-pci 0000:00:00.0: enabling device (0000 -> 0002)=
=20
> > [  251.269478] The Jailhouse is opening.=20
> > [  251.269864] IPv6: ADDRCONF(NETDEV_UP): eth1: link is not ready=20
> >=20
> > Root $ ./jailhouse cell linux configs/imx8mq-linux-demo.cell=20
> > /run/media/mmcblk1p1/Image -d=20
> > /run/media/mmcblk1p1/fsl-imx8mq-evk-inmate.dtb -c "clk_ignore_unused=20
> > console=3Dttymxc1,115200 earlycon=3Dec_imx6q,0x30860000,115200=20
> > root=3D/dev/mmcblk0p2 rootwait rw"=20
> > [  315.757129] CPU2: shutdown=20
> > [  315.759844] psci: CPU2 killed.=20
> > [  315.804134] CPU3: shutdown=20
> > [  315.806843] psci: CPU3 killed.=20
> > Adding virtual PCI device 00:00.0 to cell "linux-inmate-demo"=20
> > Shared memory connection established: "linux-inmate-demo" <--> "imx8mq"=
=20
> > iommu_config_commit linux-inmate-demo=20
> > Created cell "linux-inmate-demo"=20
> > Page pool usage after cell creation: mem 88/994, remap 144/131072=20
> > [  315.835959] Created Jailhouse cell "linux-inmate-demo"=20
> > Cell "linux-inmate-demo" can be loaded=20
> > Started cell "linux-inmate-demo"=20
> > [    0.000000] Booting Linux on physical CPU 0x2=20
> > [    0.000000] Linux version 4.14.98-05985-g1175b59 (root@Develop) (gcc=
=20
> > version 7.3.0 (GCC)) #1 SMP PREEMPT Mon Apr 20 11:57:19 CST 2020=20
> > [    0.000000] Boot CPU: AArch64 Processor [410fd034]=20
> > [    0.000000] Machine model: Freescale i.MX8MQ EVK=20
> > [    0.000000] earlycon: ec_imx6q0 at MMIO 0x0000000030860000 (options=
=20
> > '115200')=20
> > [    0.000000] bootconsole [ec_imx6q0] enabled=20
> > [    0.000000] efi: Getting EFI parameters from FDT:=20
> > [    0.000000] efi: UEFI not found.=20
> > [    0.000000] cma: Reserved 320 MiB at 0x00000000e8000000=20
> > [    0.000000] NUMA: No NUMA configuration found=20
> > [    0.000000] NUMA: Faking a node at [mem=20
> > 0x0000000000000000-0x00000000fdbfffff]=20
> > [    0.000000] NUMA: NODE_DATA [mem 0xfdbd7600-0xfdbd93ff]=20
> > [    0.000000] Zone ranges:=20
> > [    0.000000]   DMA      [mem 0x00000000c0000000-0x00000000fdbfffff]=
=20
> > [    0.000000]   Normal   empty=20
> > [    0.000000] Movable zone start for each node=20
> > [    0.000000] Early memory node ranges=20
> > [    0.000000]   node   0: [mem 0x00000000c0000000-0x00000000fdbfffff]=
=20
> > [    0.000000] Initmem setup node 0 [mem=20
> > 0x00000000c0000000-0x00000000fdbfffff]=20
> > processor: 2=20
> > BogoMIPS: 16.66=20
> > Features: fp asimd evtstrm aes pmull sha1 sha2 crc32 cpuid=20
> > CPU implementer: 0x41=20
> > CPU architecture: 8=20
> > CPU variant: 0x0=20
> > CPU part: 0xd03=20
> > CPU revision: 4=20
> >=20
> > processor: 3=20
> > BogoMIPS: 16.66=20
> > Features: fp asimd evtstrm aes pmull sha1 sha2 crc32 cpuid=20
> > CPU implementer: 0x41=20
> > CPU architecture: 8=20
> > CPU variant: 0x0=20
> > CPU part: 0xd03=20
> > CPU revision: 4=20
> >=20
> > I executed the same test case in bare-machine, root cell, and inmate=20
> cell.=20
> > The CPU test results of sysbench in the root cell were approximately 1%=
=20
> > lower than those of the bare machine, but the CPU test results of=20
> > sysbench  in the inmate cell were approximately 1/3 lower than those of=
=20
> > the bare machine.=20
> > The super_pi test results in the root cell were approximately 1% lower=
=20
> > than those in the bare-bones machine, but the super_pi test results in=
=20
> > the inmate cell were approximately 20% lower than those in the=20
> > bare-machine.=20
> > Jailhouse  is a partitioning hypervisor, why is there a significant=20
> > decrease in CPU performance in the inmate cell?=20
> > This result makes me very puzzled, hope to answer.=20
> > If you need any other info let me know.=20
> > I really appreciate any analysis.=20
>
> Jailhouse does not treat non-root cells differently from root cells /wrt=
=20
> performance. The reason must be in the configuration. Were you using the=
=20
> very same kernel in root-cell and non-root inmate? Maybe Peng can also=20
> point to areas that could explain performance differences.=20
>
> Jan=20
>

--=20
You received this message because you are subscribed to the Google Groups "=
Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/=
jailhouse-dev/5d1a49d5-7ed6-4f62-b5b9-240c5f69c178%40googlegroups.com.

------=_Part_1384_1158526143.1589165334051
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><br>I used the same kernel and rootfs for root cell and no=
n root cell when I=C2=A0 when I was testing. I used the imx8mq-veth.cell pr=
ovided by jailhouse as the root cell configuration file, and imx8mq-linux-d=
emo.cell as the non-root-cell configuration file.<br>=E5=9C=A8 2020=E5=B9=
=B45=E6=9C=8811=E6=97=A5=E6=98=9F=E6=9C=9F=E4=B8=80 UTC+8=E4=B8=8A=E5=8D=88=
12:54:46=EF=BC=8CJan Kiszka=E5=86=99=E9=81=93=EF=BC=9A<blockquote class=3D"=
gmail_quote" style=3D"margin: 0;margin-left: 0.8ex;border-left: 1px #ccc so=
lid;padding-left: 1ex;">On 10.05.20 17:26, zhengjun zhang wrote:
<br>&gt;
<br>&gt; Hi~
<br>&gt; I recently tested the loss of virtualization performance in jailho=
use on
<br>&gt; the i.MX 8MQuad, using the testing tools sysbench and super_pi.
<br>&gt; I used the same Linux image (imx_4.14.98_2.0.0_ga) in the Root Cel=
l and
<br>&gt; inmate Cell
<br>&gt; Here is the jailhouse startup information
<br>&gt; Root $ cat /proc/cpuinfo
<br>&gt; processor: 0
<br>&gt; BogoMIPS: 16.66
<br>&gt; Features: fp asimd evtstrm aes pmull sha1 sha2 crc32 cpuid
<br>&gt; CPU implementer: 0x41
<br>&gt; CPU architecture: 8
<br>&gt; CPU variant: 0x0
<br>&gt; CPU part: 0xd03
<br>&gt; CPU revision: 4
<br>&gt;
<br>&gt; processor: 1
<br>&gt; BogoMIPS: 16.66
<br>&gt; Features: fp asimd evtstrm aes pmull sha1 sha2 crc32 cpuid
<br>&gt; CPU implementer: 0x41
<br>&gt; CPU architecture: 8
<br>&gt; CPU variant: 0x0
<br>&gt; CPU part: 0xd03
<br>&gt; CPU revision: 4
<br>&gt; Root $ cd ~/jailhouse
<br>&gt; Root $ insmod jailhouse.ko
<br>&gt; [=C2=A0 233.063524] jailhouse: loading out-of-tree module taints k=
ernel.
<br>&gt;
<br>&gt; Root $ ./jailhouse enable configs/imx8mq-veth.cell
<br>&gt;
<br>&gt; Initializing Jailhouse hypervisor v0.10 (66-g2217029) on CPU 1
<br>&gt; Code location: 0x0000ffffc0200800
<br>&gt; Page pool usage after early setup: mem 39/994, remap 0/131072
<br>&gt; Initializing processors:
<br>&gt; =C2=A0=C2=A0CPU 1... OK
<br>&gt; =C2=A0=C2=A0CPU 0... OK
<br>&gt; =C2=A0=C2=A0CPU 3... OK
<br>&gt; =C2=A0=C2=A0CPU 2... OK
<br>&gt; Initializing unit: irqchip
<br>&gt; Initializing unit: ARM SMMU
<br>&gt; No SMMU
<br>&gt; Initializing unit: PCI
<br>&gt; Adding virtual PCI device 00:00.0 to cell &quot;imx8mq&quot;
<br>&gt; iommu_config_commit imx8mq
<br>&gt; Page pool usage after late setup: mem 72/994, remap 144/131072
<br>&gt; Activating hypervisor
<br>&gt; [=C2=A0 251.213460] OF: PCI: host bridge /pci@0 ranges:
<br>&gt; [=C2=A0 251.218097] OF: PCI:=C2=A0 =C2=A0MEM 0xbfc00000..0xbfc01ff=
f -&gt; 0xbfc00000
<br>&gt; [=C2=A0 251.224313] pci-host-generic bfb00000.pci: ECAM at [mem
<br>&gt; 0xbfb00000-0xbfbfffff] for [bus 00]
<br>&gt; [=C2=A0 251.233114] pci-host-generic bfb00000.pci: PCI host bridge=
 to bus 0000:00
<br>&gt; [=C2=A0 251.240052] pci_bus 0000:00: root bus resource [bus 00]
<br>&gt; [=C2=A0 251.245533] pci_bus 0000:00: root bus resource [mem
<br>&gt; 0xbfc00000-0xbfc01fff]
<br>&gt; [=C2=A0 251.252942] pci 0000:00:00.0: BAR 0: assigned [mem
<br>&gt; 0xbfc00000-0xbfc000ff 64bit]
<br>&gt; [=C2=A0 251.260861] virtio-pci 0000:00:00.0: enabling device (0000=
 -&gt; 0002)
<br>&gt; [=C2=A0 251.269478] The Jailhouse is opening.
<br>&gt; [=C2=A0 251.269864] IPv6: ADDRCONF(NETDEV_UP): eth1: link is not r=
eady
<br>&gt;
<br>&gt; Root $ ./jailhouse cell linux configs/imx8mq-linux-demo.cell
<br>&gt; /run/media/mmcblk1p1/Image -d
<br>&gt; /run/media/mmcblk1p1/fsl-<wbr>imx8mq-evk-inmate.dtb -c &quot;clk_i=
gnore_unused
<br>&gt; console=3Dttymxc1,115200 earlycon=3Dec_imx6q,0x30860000,<wbr>11520=
0
<br>&gt; root=3D/dev/mmcblk0p2 rootwait rw&quot;
<br>&gt; [=C2=A0 315.757129] CPU2: shutdown
<br>&gt; [=C2=A0 315.759844] psci: CPU2 killed.
<br>&gt; [=C2=A0 315.804134] CPU3: shutdown
<br>&gt; [=C2=A0 315.806843] psci: CPU3 killed.
<br>&gt; Adding virtual PCI device 00:00.0 to cell &quot;linux-inmate-demo&=
quot;
<br>&gt; Shared memory connection established: &quot;linux-inmate-demo&quot=
; &lt;--&gt; &quot;imx8mq&quot;
<br>&gt; iommu_config_commit linux-inmate-demo
<br>&gt; Created cell &quot;linux-inmate-demo&quot;
<br>&gt; Page pool usage after cell creation: mem 88/994, remap 144/131072
<br>&gt; [=C2=A0 315.835959] Created Jailhouse cell &quot;linux-inmate-demo=
&quot;
<br>&gt; Cell &quot;linux-inmate-demo&quot; can be loaded
<br>&gt; Started cell &quot;linux-inmate-demo&quot;
<br>&gt; [=C2=A0 =C2=A0 0.000000] Booting Linux on physical CPU 0x2
<br>&gt; [=C2=A0 =C2=A0 0.000000] Linux version 4.14.98-05985-g1175b59 (roo=
t@Develop) (gcc
<br>&gt; version 7.3.0 (GCC)) #1 SMP PREEMPT Mon Apr 20 11:57:19 CST 2020
<br>&gt; [=C2=A0 =C2=A0 0.000000] Boot CPU: AArch64 Processor [410fd034]
<br>&gt; [=C2=A0 =C2=A0 0.000000] Machine model: Freescale i.MX8MQ EVK
<br>&gt; [=C2=A0 =C2=A0 0.000000] earlycon: ec_imx6q0 at MMIO 0x00000000308=
60000 (options
<br>&gt; &#39;115200&#39;)
<br>&gt; [=C2=A0 =C2=A0 0.000000] bootconsole [ec_imx6q0] enabled
<br>&gt; [=C2=A0 =C2=A0 0.000000] efi: Getting EFI parameters from FDT:
<br>&gt; [=C2=A0 =C2=A0 0.000000] efi: UEFI not found.
<br>&gt; [=C2=A0 =C2=A0 0.000000] cma: Reserved 320 MiB at 0x00000000e80000=
00
<br>&gt; [=C2=A0 =C2=A0 0.000000] NUMA: No NUMA configuration found
<br>&gt; [=C2=A0 =C2=A0 0.000000] NUMA: Faking a node at [mem
<br>&gt; 0x0000000000000000-<wbr>0x00000000fdbfffff]
<br>&gt; [=C2=A0 =C2=A0 0.000000] NUMA: NODE_DATA [mem 0xfdbd7600-0xfdbd93f=
f]
<br>&gt; [=C2=A0 =C2=A0 0.000000] Zone ranges:
<br>&gt; [=C2=A0 =C2=A0 0.000000]=C2=A0 =C2=A0DMA=C2=A0 =C2=A0 =C2=A0 [mem =
0x00000000c0000000-<wbr>0x00000000fdbfffff]
<br>&gt; [=C2=A0 =C2=A0 0.000000]=C2=A0 =C2=A0Normal=C2=A0 =C2=A0empty
<br>&gt; [=C2=A0 =C2=A0 0.000000] Movable zone start for each node
<br>&gt; [=C2=A0 =C2=A0 0.000000] Early memory node ranges
<br>&gt; [=C2=A0 =C2=A0 0.000000]=C2=A0 =C2=A0node=C2=A0 =C2=A00: [mem 0x00=
000000c0000000-<wbr>0x00000000fdbfffff]
<br>&gt; [=C2=A0 =C2=A0 0.000000] Initmem setup node 0 [mem
<br>&gt; 0x00000000c0000000-<wbr>0x00000000fdbfffff]
<br>&gt; processor: 2
<br>&gt; BogoMIPS: 16.66
<br>&gt; Features: fp asimd evtstrm aes pmull sha1 sha2 crc32 cpuid
<br>&gt; CPU implementer: 0x41
<br>&gt; CPU architecture: 8
<br>&gt; CPU variant: 0x0
<br>&gt; CPU part: 0xd03
<br>&gt; CPU revision: 4
<br>&gt;
<br>&gt; processor: 3
<br>&gt; BogoMIPS: 16.66
<br>&gt; Features: fp asimd evtstrm aes pmull sha1 sha2 crc32 cpuid
<br>&gt; CPU implementer: 0x41
<br>&gt; CPU architecture: 8
<br>&gt; CPU variant: 0x0
<br>&gt; CPU part: 0xd03
<br>&gt; CPU revision: 4
<br>&gt;
<br>&gt; I executed the same test case in bare-machine, root cell, and inma=
te cell.
<br>&gt; The CPU test results of sysbench in the root cell were approximate=
ly 1%
<br>&gt; lower than those of the bare machine, but the CPU test results of
<br>&gt; sysbench=C2=A0 in the inmate cell were approximately 1/3 lower tha=
n those of
<br>&gt; the bare machine.
<br>&gt; The super_pi test results in the root cell were approximately 1% l=
ower
<br>&gt; than those in the bare-bones machine, but the super_pi test result=
s in
<br>&gt; the inmate cell were approximately 20% lower than those in the
<br>&gt; bare-machine.
<br>&gt; Jailhouse=C2=A0 is a partitioning hypervisor, why is there a signi=
ficant
<br>&gt; decrease in CPU performance in the inmate cell?
<br>&gt; This result makes me very puzzled, hope to answer.
<br>&gt; If you need any other info let me know.
<br>&gt; I really appreciate any analysis.
<br>
<br>Jailhouse does not treat non-root cells differently from root cells /wr=
t
<br>performance. The reason must be in the configuration. Were you using th=
e
<br>very same kernel in root-cell and non-root inmate? Maybe Peng can also
<br>point to areas that could explain performance differences.
<br>
<br>Jan
<br></blockquote><br>=E5=9C=A8 2020=E5=B9=B45=E6=9C=8811=E6=97=A5=E6=98=9F=
=E6=9C=9F=E4=B8=80 UTC+8=E4=B8=8A=E5=8D=8812:54:46=EF=BC=8CJan Kiszka=E5=86=
=99=E9=81=93=EF=BC=9A<blockquote class=3D"gmail_quote" style=3D"margin: 0;m=
argin-left: 0.8ex;border-left: 1px #ccc solid;padding-left: 1ex;">On 10.05.=
20 17:26, zhengjun zhang wrote:
<br>&gt;
<br>&gt; Hi~
<br>&gt; I recently tested the loss of virtualization performance in jailho=
use on
<br>&gt; the i.MX 8MQuad, using the testing tools sysbench and super_pi.
<br>&gt; I used the same Linux image (imx_4.14.98_2.0.0_ga) in the Root Cel=
l and
<br>&gt; inmate Cell
<br>&gt; Here is the jailhouse startup information
<br>&gt; Root $ cat /proc/cpuinfo
<br>&gt; processor: 0
<br>&gt; BogoMIPS: 16.66
<br>&gt; Features: fp asimd evtstrm aes pmull sha1 sha2 crc32 cpuid
<br>&gt; CPU implementer: 0x41
<br>&gt; CPU architecture: 8
<br>&gt; CPU variant: 0x0
<br>&gt; CPU part: 0xd03
<br>&gt; CPU revision: 4
<br>&gt;
<br>&gt; processor: 1
<br>&gt; BogoMIPS: 16.66
<br>&gt; Features: fp asimd evtstrm aes pmull sha1 sha2 crc32 cpuid
<br>&gt; CPU implementer: 0x41
<br>&gt; CPU architecture: 8
<br>&gt; CPU variant: 0x0
<br>&gt; CPU part: 0xd03
<br>&gt; CPU revision: 4
<br>&gt; Root $ cd ~/jailhouse
<br>&gt; Root $ insmod jailhouse.ko
<br>&gt; [=C2=A0 233.063524] jailhouse: loading out-of-tree module taints k=
ernel.
<br>&gt;
<br>&gt; Root $ ./jailhouse enable configs/imx8mq-veth.cell
<br>&gt;
<br>&gt; Initializing Jailhouse hypervisor v0.10 (66-g2217029) on CPU 1
<br>&gt; Code location: 0x0000ffffc0200800
<br>&gt; Page pool usage after early setup: mem 39/994, remap 0/131072
<br>&gt; Initializing processors:
<br>&gt; =C2=A0=C2=A0CPU 1... OK
<br>&gt; =C2=A0=C2=A0CPU 0... OK
<br>&gt; =C2=A0=C2=A0CPU 3... OK
<br>&gt; =C2=A0=C2=A0CPU 2... OK
<br>&gt; Initializing unit: irqchip
<br>&gt; Initializing unit: ARM SMMU
<br>&gt; No SMMU
<br>&gt; Initializing unit: PCI
<br>&gt; Adding virtual PCI device 00:00.0 to cell &quot;imx8mq&quot;
<br>&gt; iommu_config_commit imx8mq
<br>&gt; Page pool usage after late setup: mem 72/994, remap 144/131072
<br>&gt; Activating hypervisor
<br>&gt; [=C2=A0 251.213460] OF: PCI: host bridge /pci@0 ranges:
<br>&gt; [=C2=A0 251.218097] OF: PCI:=C2=A0 =C2=A0MEM 0xbfc00000..0xbfc01ff=
f -&gt; 0xbfc00000
<br>&gt; [=C2=A0 251.224313] pci-host-generic bfb00000.pci: ECAM at [mem
<br>&gt; 0xbfb00000-0xbfbfffff] for [bus 00]
<br>&gt; [=C2=A0 251.233114] pci-host-generic bfb00000.pci: PCI host bridge=
 to bus 0000:00
<br>&gt; [=C2=A0 251.240052] pci_bus 0000:00: root bus resource [bus 00]
<br>&gt; [=C2=A0 251.245533] pci_bus 0000:00: root bus resource [mem
<br>&gt; 0xbfc00000-0xbfc01fff]
<br>&gt; [=C2=A0 251.252942] pci 0000:00:00.0: BAR 0: assigned [mem
<br>&gt; 0xbfc00000-0xbfc000ff 64bit]
<br>&gt; [=C2=A0 251.260861] virtio-pci 0000:00:00.0: enabling device (0000=
 -&gt; 0002)
<br>&gt; [=C2=A0 251.269478] The Jailhouse is opening.
<br>&gt; [=C2=A0 251.269864] IPv6: ADDRCONF(NETDEV_UP): eth1: link is not r=
eady
<br>&gt;
<br>&gt; Root $ ./jailhouse cell linux configs/imx8mq-linux-demo.cell
<br>&gt; /run/media/mmcblk1p1/Image -d
<br>&gt; /run/media/mmcblk1p1/fsl-<wbr>imx8mq-evk-inmate.dtb -c &quot;clk_i=
gnore_unused
<br>&gt; console=3Dttymxc1,115200 earlycon=3Dec_imx6q,0x30860000,<wbr>11520=
0
<br>&gt; root=3D/dev/mmcblk0p2 rootwait rw&quot;
<br>&gt; [=C2=A0 315.757129] CPU2: shutdown
<br>&gt; [=C2=A0 315.759844] psci: CPU2 killed.
<br>&gt; [=C2=A0 315.804134] CPU3: shutdown
<br>&gt; [=C2=A0 315.806843] psci: CPU3 killed.
<br>&gt; Adding virtual PCI device 00:00.0 to cell &quot;linux-inmate-demo&=
quot;
<br>&gt; Shared memory connection established: &quot;linux-inmate-demo&quot=
; &lt;--&gt; &quot;imx8mq&quot;
<br>&gt; iommu_config_commit linux-inmate-demo
<br>&gt; Created cell &quot;linux-inmate-demo&quot;
<br>&gt; Page pool usage after cell creation: mem 88/994, remap 144/131072
<br>&gt; [=C2=A0 315.835959] Created Jailhouse cell &quot;linux-inmate-demo=
&quot;
<br>&gt; Cell &quot;linux-inmate-demo&quot; can be loaded
<br>&gt; Started cell &quot;linux-inmate-demo&quot;
<br>&gt; [=C2=A0 =C2=A0 0.000000] Booting Linux on physical CPU 0x2
<br>&gt; [=C2=A0 =C2=A0 0.000000] Linux version 4.14.98-05985-g1175b59 (roo=
t@Develop) (gcc
<br>&gt; version 7.3.0 (GCC)) #1 SMP PREEMPT Mon Apr 20 11:57:19 CST 2020
<br>&gt; [=C2=A0 =C2=A0 0.000000] Boot CPU: AArch64 Processor [410fd034]
<br>&gt; [=C2=A0 =C2=A0 0.000000] Machine model: Freescale i.MX8MQ EVK
<br>&gt; [=C2=A0 =C2=A0 0.000000] earlycon: ec_imx6q0 at MMIO 0x00000000308=
60000 (options
<br>&gt; &#39;115200&#39;)
<br>&gt; [=C2=A0 =C2=A0 0.000000] bootconsole [ec_imx6q0] enabled
<br>&gt; [=C2=A0 =C2=A0 0.000000] efi: Getting EFI parameters from FDT:
<br>&gt; [=C2=A0 =C2=A0 0.000000] efi: UEFI not found.
<br>&gt; [=C2=A0 =C2=A0 0.000000] cma: Reserved 320 MiB at 0x00000000e80000=
00
<br>&gt; [=C2=A0 =C2=A0 0.000000] NUMA: No NUMA configuration found
<br>&gt; [=C2=A0 =C2=A0 0.000000] NUMA: Faking a node at [mem
<br>&gt; 0x0000000000000000-<wbr>0x00000000fdbfffff]
<br>&gt; [=C2=A0 =C2=A0 0.000000] NUMA: NODE_DATA [mem 0xfdbd7600-0xfdbd93f=
f]
<br>&gt; [=C2=A0 =C2=A0 0.000000] Zone ranges:
<br>&gt; [=C2=A0 =C2=A0 0.000000]=C2=A0 =C2=A0DMA=C2=A0 =C2=A0 =C2=A0 [mem =
0x00000000c0000000-<wbr>0x00000000fdbfffff]
<br>&gt; [=C2=A0 =C2=A0 0.000000]=C2=A0 =C2=A0Normal=C2=A0 =C2=A0empty
<br>&gt; [=C2=A0 =C2=A0 0.000000] Movable zone start for each node
<br>&gt; [=C2=A0 =C2=A0 0.000000] Early memory node ranges
<br>&gt; [=C2=A0 =C2=A0 0.000000]=C2=A0 =C2=A0node=C2=A0 =C2=A00: [mem 0x00=
000000c0000000-<wbr>0x00000000fdbfffff]
<br>&gt; [=C2=A0 =C2=A0 0.000000] Initmem setup node 0 [mem
<br>&gt; 0x00000000c0000000-<wbr>0x00000000fdbfffff]
<br>&gt; processor: 2
<br>&gt; BogoMIPS: 16.66
<br>&gt; Features: fp asimd evtstrm aes pmull sha1 sha2 crc32 cpuid
<br>&gt; CPU implementer: 0x41
<br>&gt; CPU architecture: 8
<br>&gt; CPU variant: 0x0
<br>&gt; CPU part: 0xd03
<br>&gt; CPU revision: 4
<br>&gt;
<br>&gt; processor: 3
<br>&gt; BogoMIPS: 16.66
<br>&gt; Features: fp asimd evtstrm aes pmull sha1 sha2 crc32 cpuid
<br>&gt; CPU implementer: 0x41
<br>&gt; CPU architecture: 8
<br>&gt; CPU variant: 0x0
<br>&gt; CPU part: 0xd03
<br>&gt; CPU revision: 4
<br>&gt;
<br>&gt; I executed the same test case in bare-machine, root cell, and inma=
te cell.
<br>&gt; The CPU test results of sysbench in the root cell were approximate=
ly 1%
<br>&gt; lower than those of the bare machine, but the CPU test results of
<br>&gt; sysbench=C2=A0 in the inmate cell were approximately 1/3 lower tha=
n those of
<br>&gt; the bare machine.
<br>&gt; The super_pi test results in the root cell were approximately 1% l=
ower
<br>&gt; than those in the bare-bones machine, but the super_pi test result=
s in
<br>&gt; the inmate cell were approximately 20% lower than those in the
<br>&gt; bare-machine.
<br>&gt; Jailhouse=C2=A0 is a partitioning hypervisor, why is there a signi=
ficant
<br>&gt; decrease in CPU performance in the inmate cell?
<br>&gt; This result makes me very puzzled, hope to answer.
<br>&gt; If you need any other info let me know.
<br>&gt; I really appreciate any analysis.
<br>
<br>Jailhouse does not treat non-root cells differently from root cells /wr=
t
<br>performance. The reason must be in the configuration. Were you using th=
e
<br>very same kernel in root-cell and non-root inmate? Maybe Peng can also
<br>point to areas that could explain performance differences.
<br>
<br>Jan
<br></blockquote><br>=E5=9C=A8 2020=E5=B9=B45=E6=9C=8811=E6=97=A5=E6=98=9F=
=E6=9C=9F=E4=B8=80 UTC+8=E4=B8=8A=E5=8D=8812:54:46=EF=BC=8CJan Kiszka=E5=86=
=99=E9=81=93=EF=BC=9A<blockquote class=3D"gmail_quote" style=3D"margin: 0;m=
argin-left: 0.8ex;border-left: 1px #ccc solid;padding-left: 1ex;">On 10.05.=
20 17:26, zhengjun zhang wrote:
<br>&gt;
<br>&gt; Hi~
<br>&gt; I recently tested the loss of virtualization performance in jailho=
use on
<br>&gt; the i.MX 8MQuad, using the testing tools sysbench and super_pi.
<br>&gt; I used the same Linux image (imx_4.14.98_2.0.0_ga) in the Root Cel=
l and
<br>&gt; inmate Cell
<br>&gt; Here is the jailhouse startup information
<br>&gt; Root $ cat /proc/cpuinfo
<br>&gt; processor: 0
<br>&gt; BogoMIPS: 16.66
<br>&gt; Features: fp asimd evtstrm aes pmull sha1 sha2 crc32 cpuid
<br>&gt; CPU implementer: 0x41
<br>&gt; CPU architecture: 8
<br>&gt; CPU variant: 0x0
<br>&gt; CPU part: 0xd03
<br>&gt; CPU revision: 4
<br>&gt;
<br>&gt; processor: 1
<br>&gt; BogoMIPS: 16.66
<br>&gt; Features: fp asimd evtstrm aes pmull sha1 sha2 crc32 cpuid
<br>&gt; CPU implementer: 0x41
<br>&gt; CPU architecture: 8
<br>&gt; CPU variant: 0x0
<br>&gt; CPU part: 0xd03
<br>&gt; CPU revision: 4
<br>&gt; Root $ cd ~/jailhouse
<br>&gt; Root $ insmod jailhouse.ko
<br>&gt; [=C2=A0 233.063524] jailhouse: loading out-of-tree module taints k=
ernel.
<br>&gt;
<br>&gt; Root $ ./jailhouse enable configs/imx8mq-veth.cell
<br>&gt;
<br>&gt; Initializing Jailhouse hypervisor v0.10 (66-g2217029) on CPU 1
<br>&gt; Code location: 0x0000ffffc0200800
<br>&gt; Page pool usage after early setup: mem 39/994, remap 0/131072
<br>&gt; Initializing processors:
<br>&gt; =C2=A0=C2=A0CPU 1... OK
<br>&gt; =C2=A0=C2=A0CPU 0... OK
<br>&gt; =C2=A0=C2=A0CPU 3... OK
<br>&gt; =C2=A0=C2=A0CPU 2... OK
<br>&gt; Initializing unit: irqchip
<br>&gt; Initializing unit: ARM SMMU
<br>&gt; No SMMU
<br>&gt; Initializing unit: PCI
<br>&gt; Adding virtual PCI device 00:00.0 to cell &quot;imx8mq&quot;
<br>&gt; iommu_config_commit imx8mq
<br>&gt; Page pool usage after late setup: mem 72/994, remap 144/131072
<br>&gt; Activating hypervisor
<br>&gt; [=C2=A0 251.213460] OF: PCI: host bridge /pci@0 ranges:
<br>&gt; [=C2=A0 251.218097] OF: PCI:=C2=A0 =C2=A0MEM 0xbfc00000..0xbfc01ff=
f -&gt; 0xbfc00000
<br>&gt; [=C2=A0 251.224313] pci-host-generic bfb00000.pci: ECAM at [mem
<br>&gt; 0xbfb00000-0xbfbfffff] for [bus 00]
<br>&gt; [=C2=A0 251.233114] pci-host-generic bfb00000.pci: PCI host bridge=
 to bus 0000:00
<br>&gt; [=C2=A0 251.240052] pci_bus 0000:00: root bus resource [bus 00]
<br>&gt; [=C2=A0 251.245533] pci_bus 0000:00: root bus resource [mem
<br>&gt; 0xbfc00000-0xbfc01fff]
<br>&gt; [=C2=A0 251.252942] pci 0000:00:00.0: BAR 0: assigned [mem
<br>&gt; 0xbfc00000-0xbfc000ff 64bit]
<br>&gt; [=C2=A0 251.260861] virtio-pci 0000:00:00.0: enabling device (0000=
 -&gt; 0002)
<br>&gt; [=C2=A0 251.269478] The Jailhouse is opening.
<br>&gt; [=C2=A0 251.269864] IPv6: ADDRCONF(NETDEV_UP): eth1: link is not r=
eady
<br>&gt;
<br>&gt; Root $ ./jailhouse cell linux configs/imx8mq-linux-demo.cell
<br>&gt; /run/media/mmcblk1p1/Image -d
<br>&gt; /run/media/mmcblk1p1/fsl-<wbr>imx8mq-evk-inmate.dtb -c &quot;clk_i=
gnore_unused
<br>&gt; console=3Dttymxc1,115200 earlycon=3Dec_imx6q,0x30860000,<wbr>11520=
0
<br>&gt; root=3D/dev/mmcblk0p2 rootwait rw&quot;
<br>&gt; [=C2=A0 315.757129] CPU2: shutdown
<br>&gt; [=C2=A0 315.759844] psci: CPU2 killed.
<br>&gt; [=C2=A0 315.804134] CPU3: shutdown
<br>&gt; [=C2=A0 315.806843] psci: CPU3 killed.
<br>&gt; Adding virtual PCI device 00:00.0 to cell &quot;linux-inmate-demo&=
quot;
<br>&gt; Shared memory connection established: &quot;linux-inmate-demo&quot=
; &lt;--&gt; &quot;imx8mq&quot;
<br>&gt; iommu_config_commit linux-inmate-demo
<br>&gt; Created cell &quot;linux-inmate-demo&quot;
<br>&gt; Page pool usage after cell creation: mem 88/994, remap 144/131072
<br>&gt; [=C2=A0 315.835959] Created Jailhouse cell &quot;linux-inmate-demo=
&quot;
<br>&gt; Cell &quot;linux-inmate-demo&quot; can be loaded
<br>&gt; Started cell &quot;linux-inmate-demo&quot;
<br>&gt; [=C2=A0 =C2=A0 0.000000] Booting Linux on physical CPU 0x2
<br>&gt; [=C2=A0 =C2=A0 0.000000] Linux version 4.14.98-05985-g1175b59 (roo=
t@Develop) (gcc
<br>&gt; version 7.3.0 (GCC)) #1 SMP PREEMPT Mon Apr 20 11:57:19 CST 2020
<br>&gt; [=C2=A0 =C2=A0 0.000000] Boot CPU: AArch64 Processor [410fd034]
<br>&gt; [=C2=A0 =C2=A0 0.000000] Machine model: Freescale i.MX8MQ EVK
<br>&gt; [=C2=A0 =C2=A0 0.000000] earlycon: ec_imx6q0 at MMIO 0x00000000308=
60000 (options
<br>&gt; &#39;115200&#39;)
<br>&gt; [=C2=A0 =C2=A0 0.000000] bootconsole [ec_imx6q0] enabled
<br>&gt; [=C2=A0 =C2=A0 0.000000] efi: Getting EFI parameters from FDT:
<br>&gt; [=C2=A0 =C2=A0 0.000000] efi: UEFI not found.
<br>&gt; [=C2=A0 =C2=A0 0.000000] cma: Reserved 320 MiB at 0x00000000e80000=
00
<br>&gt; [=C2=A0 =C2=A0 0.000000] NUMA: No NUMA configuration found
<br>&gt; [=C2=A0 =C2=A0 0.000000] NUMA: Faking a node at [mem
<br>&gt; 0x0000000000000000-<wbr>0x00000000fdbfffff]
<br>&gt; [=C2=A0 =C2=A0 0.000000] NUMA: NODE_DATA [mem 0xfdbd7600-0xfdbd93f=
f]
<br>&gt; [=C2=A0 =C2=A0 0.000000] Zone ranges:
<br>&gt; [=C2=A0 =C2=A0 0.000000]=C2=A0 =C2=A0DMA=C2=A0 =C2=A0 =C2=A0 [mem =
0x00000000c0000000-<wbr>0x00000000fdbfffff]
<br>&gt; [=C2=A0 =C2=A0 0.000000]=C2=A0 =C2=A0Normal=C2=A0 =C2=A0empty
<br>&gt; [=C2=A0 =C2=A0 0.000000] Movable zone start for each node
<br>&gt; [=C2=A0 =C2=A0 0.000000] Early memory node ranges
<br>&gt; [=C2=A0 =C2=A0 0.000000]=C2=A0 =C2=A0node=C2=A0 =C2=A00: [mem 0x00=
000000c0000000-<wbr>0x00000000fdbfffff]
<br>&gt; [=C2=A0 =C2=A0 0.000000] Initmem setup node 0 [mem
<br>&gt; 0x00000000c0000000-<wbr>0x00000000fdbfffff]
<br>&gt; processor: 2
<br>&gt; BogoMIPS: 16.66
<br>&gt; Features: fp asimd evtstrm aes pmull sha1 sha2 crc32 cpuid
<br>&gt; CPU implementer: 0x41
<br>&gt; CPU architecture: 8
<br>&gt; CPU variant: 0x0
<br>&gt; CPU part: 0xd03
<br>&gt; CPU revision: 4
<br>&gt;
<br>&gt; processor: 3
<br>&gt; BogoMIPS: 16.66
<br>&gt; Features: fp asimd evtstrm aes pmull sha1 sha2 crc32 cpuid
<br>&gt; CPU implementer: 0x41
<br>&gt; CPU architecture: 8
<br>&gt; CPU variant: 0x0
<br>&gt; CPU part: 0xd03
<br>&gt; CPU revision: 4
<br>&gt;
<br>&gt; I executed the same test case in bare-machine, root cell, and inma=
te cell.
<br>&gt; The CPU test results of sysbench in the root cell were approximate=
ly 1%
<br>&gt; lower than those of the bare machine, but the CPU test results of
<br>&gt; sysbench=C2=A0 in the inmate cell were approximately 1/3 lower tha=
n those of
<br>&gt; the bare machine.
<br>&gt; The super_pi test results in the root cell were approximately 1% l=
ower
<br>&gt; than those in the bare-bones machine, but the super_pi test result=
s in
<br>&gt; the inmate cell were approximately 20% lower than those in the
<br>&gt; bare-machine.
<br>&gt; Jailhouse=C2=A0 is a partitioning hypervisor, why is there a signi=
ficant
<br>&gt; decrease in CPU performance in the inmate cell?
<br>&gt; This result makes me very puzzled, hope to answer.
<br>&gt; If you need any other info let me know.
<br>&gt; I really appreciate any analysis.
<br>
<br>Jailhouse does not treat non-root cells differently from root cells /wr=
t
<br>performance. The reason must be in the configuration. Were you using th=
e
<br>very same kernel in root-cell and non-root inmate? Maybe Peng can also
<br>point to areas that could explain performance differences.
<br>
<br>Jan
<br></blockquote><br>=E5=9C=A8 2020=E5=B9=B45=E6=9C=8811=E6=97=A5=E6=98=9F=
=E6=9C=9F=E4=B8=80 UTC+8=E4=B8=8A=E5=8D=8812:54:46=EF=BC=8CJan Kiszka=E5=86=
=99=E9=81=93=EF=BC=9A<blockquote class=3D"gmail_quote" style=3D"margin: 0;m=
argin-left: 0.8ex;border-left: 1px #ccc solid;padding-left: 1ex;">On 10.05.=
20 17:26, zhengjun zhang wrote:
<br>&gt;
<br>&gt; Hi~
<br>&gt; I recently tested the loss of virtualization performance in jailho=
use on
<br>&gt; the i.MX 8MQuad, using the testing tools sysbench and super_pi.
<br>&gt; I used the same Linux image (imx_4.14.98_2.0.0_ga) in the Root Cel=
l and
<br>&gt; inmate Cell
<br>&gt; Here is the jailhouse startup information
<br>&gt; Root $ cat /proc/cpuinfo
<br>&gt; processor: 0
<br>&gt; BogoMIPS: 16.66
<br>&gt; Features: fp asimd evtstrm aes pmull sha1 sha2 crc32 cpuid
<br>&gt; CPU implementer: 0x41
<br>&gt; CPU architecture: 8
<br>&gt; CPU variant: 0x0
<br>&gt; CPU part: 0xd03
<br>&gt; CPU revision: 4
<br>&gt;
<br>&gt; processor: 1
<br>&gt; BogoMIPS: 16.66
<br>&gt; Features: fp asimd evtstrm aes pmull sha1 sha2 crc32 cpuid
<br>&gt; CPU implementer: 0x41
<br>&gt; CPU architecture: 8
<br>&gt; CPU variant: 0x0
<br>&gt; CPU part: 0xd03
<br>&gt; CPU revision: 4
<br>&gt; Root $ cd ~/jailhouse
<br>&gt; Root $ insmod jailhouse.ko
<br>&gt; [=C2=A0 233.063524] jailhouse: loading out-of-tree module taints k=
ernel.
<br>&gt;
<br>&gt; Root $ ./jailhouse enable configs/imx8mq-veth.cell
<br>&gt;
<br>&gt; Initializing Jailhouse hypervisor v0.10 (66-g2217029) on CPU 1
<br>&gt; Code location: 0x0000ffffc0200800
<br>&gt; Page pool usage after early setup: mem 39/994, remap 0/131072
<br>&gt; Initializing processors:
<br>&gt; =C2=A0=C2=A0CPU 1... OK
<br>&gt; =C2=A0=C2=A0CPU 0... OK
<br>&gt; =C2=A0=C2=A0CPU 3... OK
<br>&gt; =C2=A0=C2=A0CPU 2... OK
<br>&gt; Initializing unit: irqchip
<br>&gt; Initializing unit: ARM SMMU
<br>&gt; No SMMU
<br>&gt; Initializing unit: PCI
<br>&gt; Adding virtual PCI device 00:00.0 to cell &quot;imx8mq&quot;
<br>&gt; iommu_config_commit imx8mq
<br>&gt; Page pool usage after late setup: mem 72/994, remap 144/131072
<br>&gt; Activating hypervisor
<br>&gt; [=C2=A0 251.213460] OF: PCI: host bridge /pci@0 ranges:
<br>&gt; [=C2=A0 251.218097] OF: PCI:=C2=A0 =C2=A0MEM 0xbfc00000..0xbfc01ff=
f -&gt; 0xbfc00000
<br>&gt; [=C2=A0 251.224313] pci-host-generic bfb00000.pci: ECAM at [mem
<br>&gt; 0xbfb00000-0xbfbfffff] for [bus 00]
<br>&gt; [=C2=A0 251.233114] pci-host-generic bfb00000.pci: PCI host bridge=
 to bus 0000:00
<br>&gt; [=C2=A0 251.240052] pci_bus 0000:00: root bus resource [bus 00]
<br>&gt; [=C2=A0 251.245533] pci_bus 0000:00: root bus resource [mem
<br>&gt; 0xbfc00000-0xbfc01fff]
<br>&gt; [=C2=A0 251.252942] pci 0000:00:00.0: BAR 0: assigned [mem
<br>&gt; 0xbfc00000-0xbfc000ff 64bit]
<br>&gt; [=C2=A0 251.260861] virtio-pci 0000:00:00.0: enabling device (0000=
 -&gt; 0002)
<br>&gt; [=C2=A0 251.269478] The Jailhouse is opening.
<br>&gt; [=C2=A0 251.269864] IPv6: ADDRCONF(NETDEV_UP): eth1: link is not r=
eady
<br>&gt;
<br>&gt; Root $ ./jailhouse cell linux configs/imx8mq-linux-demo.cell
<br>&gt; /run/media/mmcblk1p1/Image -d
<br>&gt; /run/media/mmcblk1p1/fsl-<wbr>imx8mq-evk-inmate.dtb -c &quot;clk_i=
gnore_unused
<br>&gt; console=3Dttymxc1,115200 earlycon=3Dec_imx6q,0x30860000,<wbr>11520=
0
<br>&gt; root=3D/dev/mmcblk0p2 rootwait rw&quot;
<br>&gt; [=C2=A0 315.757129] CPU2: shutdown
<br>&gt; [=C2=A0 315.759844] psci: CPU2 killed.
<br>&gt; [=C2=A0 315.804134] CPU3: shutdown
<br>&gt; [=C2=A0 315.806843] psci: CPU3 killed.
<br>&gt; Adding virtual PCI device 00:00.0 to cell &quot;linux-inmate-demo&=
quot;
<br>&gt; Shared memory connection established: &quot;linux-inmate-demo&quot=
; &lt;--&gt; &quot;imx8mq&quot;
<br>&gt; iommu_config_commit linux-inmate-demo
<br>&gt; Created cell &quot;linux-inmate-demo&quot;
<br>&gt; Page pool usage after cell creation: mem 88/994, remap 144/131072
<br>&gt; [=C2=A0 315.835959] Created Jailhouse cell &quot;linux-inmate-demo=
&quot;
<br>&gt; Cell &quot;linux-inmate-demo&quot; can be loaded
<br>&gt; Started cell &quot;linux-inmate-demo&quot;
<br>&gt; [=C2=A0 =C2=A0 0.000000] Booting Linux on physical CPU 0x2
<br>&gt; [=C2=A0 =C2=A0 0.000000] Linux version 4.14.98-05985-g1175b59 (roo=
t@Develop) (gcc
<br>&gt; version 7.3.0 (GCC)) #1 SMP PREEMPT Mon Apr 20 11:57:19 CST 2020
<br>&gt; [=C2=A0 =C2=A0 0.000000] Boot CPU: AArch64 Processor [410fd034]
<br>&gt; [=C2=A0 =C2=A0 0.000000] Machine model: Freescale i.MX8MQ EVK
<br>&gt; [=C2=A0 =C2=A0 0.000000] earlycon: ec_imx6q0 at MMIO 0x00000000308=
60000 (options
<br>&gt; &#39;115200&#39;)
<br>&gt; [=C2=A0 =C2=A0 0.000000] bootconsole [ec_imx6q0] enabled
<br>&gt; [=C2=A0 =C2=A0 0.000000] efi: Getting EFI parameters from FDT:
<br>&gt; [=C2=A0 =C2=A0 0.000000] efi: UEFI not found.
<br>&gt; [=C2=A0 =C2=A0 0.000000] cma: Reserved 320 MiB at 0x00000000e80000=
00
<br>&gt; [=C2=A0 =C2=A0 0.000000] NUMA: No NUMA configuration found
<br>&gt; [=C2=A0 =C2=A0 0.000000] NUMA: Faking a node at [mem
<br>&gt; 0x0000000000000000-<wbr>0x00000000fdbfffff]
<br>&gt; [=C2=A0 =C2=A0 0.000000] NUMA: NODE_DATA [mem 0xfdbd7600-0xfdbd93f=
f]
<br>&gt; [=C2=A0 =C2=A0 0.000000] Zone ranges:
<br>&gt; [=C2=A0 =C2=A0 0.000000]=C2=A0 =C2=A0DMA=C2=A0 =C2=A0 =C2=A0 [mem =
0x00000000c0000000-<wbr>0x00000000fdbfffff]
<br>&gt; [=C2=A0 =C2=A0 0.000000]=C2=A0 =C2=A0Normal=C2=A0 =C2=A0empty
<br>&gt; [=C2=A0 =C2=A0 0.000000] Movable zone start for each node
<br>&gt; [=C2=A0 =C2=A0 0.000000] Early memory node ranges
<br>&gt; [=C2=A0 =C2=A0 0.000000]=C2=A0 =C2=A0node=C2=A0 =C2=A00: [mem 0x00=
000000c0000000-<wbr>0x00000000fdbfffff]
<br>&gt; [=C2=A0 =C2=A0 0.000000] Initmem setup node 0 [mem
<br>&gt; 0x00000000c0000000-<wbr>0x00000000fdbfffff]
<br>&gt; processor: 2
<br>&gt; BogoMIPS: 16.66
<br>&gt; Features: fp asimd evtstrm aes pmull sha1 sha2 crc32 cpuid
<br>&gt; CPU implementer: 0x41
<br>&gt; CPU architecture: 8
<br>&gt; CPU variant: 0x0
<br>&gt; CPU part: 0xd03
<br>&gt; CPU revision: 4
<br>&gt;
<br>&gt; processor: 3
<br>&gt; BogoMIPS: 16.66
<br>&gt; Features: fp asimd evtstrm aes pmull sha1 sha2 crc32 cpuid
<br>&gt; CPU implementer: 0x41
<br>&gt; CPU architecture: 8
<br>&gt; CPU variant: 0x0
<br>&gt; CPU part: 0xd03
<br>&gt; CPU revision: 4
<br>&gt;
<br>&gt; I executed the same test case in bare-machine, root cell, and inma=
te cell.
<br>&gt; The CPU test results of sysbench in the root cell were approximate=
ly 1%
<br>&gt; lower than those of the bare machine, but the CPU test results of
<br>&gt; sysbench=C2=A0 in the inmate cell were approximately 1/3 lower tha=
n those of
<br>&gt; the bare machine.
<br>&gt; The super_pi test results in the root cell were approximately 1% l=
ower
<br>&gt; than those in the bare-bones machine, but the super_pi test result=
s in
<br>&gt; the inmate cell were approximately 20% lower than those in the
<br>&gt; bare-machine.
<br>&gt; Jailhouse=C2=A0 is a partitioning hypervisor, why is there a signi=
ficant
<br>&gt; decrease in CPU performance in the inmate cell?
<br>&gt; This result makes me very puzzled, hope to answer.
<br>&gt; If you need any other info let me know.
<br>&gt; I really appreciate any analysis.
<br>
<br>Jailhouse does not treat non-root cells differently from root cells /wr=
t
<br>performance. The reason must be in the configuration. Were you using th=
e
<br>very same kernel in root-cell and non-root inmate? Maybe Peng can also
<br>point to areas that could explain performance differences.
<br>
<br>Jan
<br></blockquote></div>

<p></p>

-- <br />
You received this message because you are subscribed to the Google Groups &=
quot;Jailhouse&quot; group.<br />
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to <a href=3D"mailto:jailhouse-dev+unsubscribe@googlegroups.com">jailh=
ouse-dev+unsubscribe@googlegroups.com</a>.<br />
To view this discussion on the web visit <a href=3D"https://groups.google.c=
om/d/msgid/jailhouse-dev/5d1a49d5-7ed6-4f62-b5b9-240c5f69c178%40googlegroup=
s.com?utm_medium=3Demail&utm_source=3Dfooter">https://groups.google.com/d/m=
sgid/jailhouse-dev/5d1a49d5-7ed6-4f62-b5b9-240c5f69c178%40googlegroups.com<=
/a>.<br />

------=_Part_1384_1158526143.1589165334051--

------=_Part_1383_1091944015.1589165334049--
