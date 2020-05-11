Return-Path: <jailhouse-dev+bncBDAPRTOWQ4KBBK744L2QKGQEQPRPO6A@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-oo1-xc3c.google.com (mail-oo1-xc3c.google.com [IPv6:2607:f8b0:4864:20::c3c])
	by mail.lfdr.de (Postfix) with ESMTPS id BAB831CCFE6
	for <lists+jailhouse-dev@lfdr.de>; Mon, 11 May 2020 04:53:32 +0200 (CEST)
Received: by mail-oo1-xc3c.google.com with SMTP id t23sf6019260oor.1
        for <lists+jailhouse-dev@lfdr.de>; Sun, 10 May 2020 19:53:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:date:from:to:message-id:in-reply-to:references:subject
         :mime-version:x-original-sender:precedence:mailing-list:list-id
         :list-post:list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=O14JfqLpSiWOlj/CFJA7iLbdo8jmMqJ8EkQxKQmL0+I=;
        b=SCFJ2Ce52GjZogmhVIQeQE2gg5oLfM80o8ZQJVltMp3vpFuzEqvfx4C3eoREYmaoio
         bLv4y2oHe23o95xIdzDLyBEhbGBBrMIxqmsDaMYhC9YIcckLL2b6ZJ9fxaI/6bmof4oZ
         islHWAklOgw0lxK567SboFEAaz5oXSL2gPR5PJIWSzMeMvPVHNbDlxwc3cPFaJdwVCjd
         iC3o+IqgBBgqmdv659mJjKDTY3cENG5GwqTAAMU8SC92xmGFsSZ6aHvCiv77YxNPE964
         FQO+IEowoXMaiZ4UArC6OqHPxTo9tRP7QmxppbOtGsHmdLpadRh2nkFVTEV0IZFlc5wq
         t1xg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:message-id:in-reply-to:references:subject:mime-version
         :x-original-sender:precedence:mailing-list:list-id:list-post
         :list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=O14JfqLpSiWOlj/CFJA7iLbdo8jmMqJ8EkQxKQmL0+I=;
        b=iELtRJ6mFhj7NGg/skCzT/6/csN4eSOMaDclUFPOgT9iFotp9ia3vlAmhl/0btFB5z
         Qi+xziSahsV1AuLPf6ierGbOpMTSMOxnjFe4gs83C5KePwsFzce9Yh8oaVJbDZ/zib9Q
         tMhm5QIwRiL4HkxPY7y897zDkNj4Bu3GlqT1EvYZ674JdUoil/PlE8Cw7m8xzpyPTQSJ
         8gkMAWXbpPl+SisybOtvlM64bfQ1lJcYYDTVLdpszC7E1q9GeZz54ey7GnUE3rivaP9N
         wBv12zdDyTIUYU0+9QqZ/3DVhJtgsMCCqYYtk6PnrhXbvEdB8BOUf97pYSK2itnGS4sn
         61YQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:date:from:to:message-id:in-reply-to
         :references:subject:mime-version:x-original-sender:precedence
         :mailing-list:list-id:x-spam-checked-in-group:list-post:list-help
         :list-archive:list-subscribe:list-unsubscribe;
        bh=O14JfqLpSiWOlj/CFJA7iLbdo8jmMqJ8EkQxKQmL0+I=;
        b=q5l02gU/Qd2oOBmHj/GEfi21as2wj2RaEK7SVKLoKo3nWoeP+j7ljdu/HE5GqTnqhz
         V2zqH0TDVl7IXsggpvYxdVErwuJXSQ+MgjGwisGtXoRUJJhsSLjUoe8N0dw27yXK9zh/
         HnRjfNg39cQJq3N5t+bADFp4mxddnT953wn30SKHbhFPrIcfOmsH4/b+SFlgIhkw2dqK
         OXeaI8tK/tKEffedAzY3NHn6NuFb2Vh3floFeeRuO7WxAVFneFY/kZYMlcPmetJFcbH0
         FNCLOdi7IDG0DhZSDd9gd+egUVg4ri0ZH3pST9bmqTLWuWU2+x1KWaygQT7Eh2qIQFFU
         kV2g==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AGi0PuYHt+mlgmMRu54VdRbRAIWmi30wIeat4vcfOfQCBY5PaGmMRJce
	qPItY/J7h2W+2CXgQmlYEkE=
X-Google-Smtp-Source: APiQypJDpdPkcpPRIiAFmdX4Ni89/zsGMDYCogZ2yo850DtHns9JAaULML+OxAdpge2CrGORJzov9A==
X-Received: by 2002:aca:dc57:: with SMTP id t84mr12565797oig.38.1589165611564;
        Sun, 10 May 2020 19:53:31 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a05:6830:1508:: with SMTP id k8ls1676294otp.10.gmail; Sun,
 10 May 2020 19:53:31 -0700 (PDT)
X-Received: by 2002:a05:6830:1150:: with SMTP id x16mr10152412otq.71.1589165611083;
        Sun, 10 May 2020 19:53:31 -0700 (PDT)
Date: Sun, 10 May 2020 19:53:30 -0700 (PDT)
From: zhengjun zhang <zhangzhengjunhust@gmail.com>
To: Jailhouse <jailhouse-dev@googlegroups.com>
Message-Id: <2428dc45-5f56-497d-8c70-b6cfd17cc17a@googlegroups.com>
In-Reply-To: <36ef5525-5dc8-1463-14a4-1ff6837c23e4@web.de>
References: <b54b7357-842b-47d2-8a0f-19084d90717d@googlegroups.com>
 <36ef5525-5dc8-1463-14a4-1ff6837c23e4@web.de>
Subject: Re: On the question of virtualization performance loss
MIME-Version: 1.0
Content-Type: multipart/mixed; 
	boundary="----=_Part_1254_1871053317.1589165610516"
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

------=_Part_1254_1871053317.1589165610516
Content-Type: multipart/alternative; 
	boundary="----=_Part_1255_1878982820.1589165610516"

------=_Part_1255_1878982820.1589165610516
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

I used the official configuration file provided by NXP without any=20
modification.

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
jailhouse-dev/2428dc45-5f56-497d-8c70-b6cfd17cc17a%40googlegroups.com.

------=_Part_1255_1878982820.1589165610516
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">I used the official configuration file provided by NXP wit=
hout any modification.<br><br>=E5=9C=A8 2020=E5=B9=B45=E6=9C=8811=E6=97=A5=
=E6=98=9F=E6=9C=9F=E4=B8=80 UTC+8=E4=B8=8A=E5=8D=8812:54:46=EF=BC=8CJan Kis=
zka=E5=86=99=E9=81=93=EF=BC=9A<blockquote class=3D"gmail_quote" style=3D"ma=
rgin: 0;margin-left: 0.8ex;border-left: 1px #ccc solid;padding-left: 1ex;">=
On 10.05.20 17:26, zhengjun zhang wrote:
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
om/d/msgid/jailhouse-dev/2428dc45-5f56-497d-8c70-b6cfd17cc17a%40googlegroup=
s.com?utm_medium=3Demail&utm_source=3Dfooter">https://groups.google.com/d/m=
sgid/jailhouse-dev/2428dc45-5f56-497d-8c70-b6cfd17cc17a%40googlegroups.com<=
/a>.<br />

------=_Part_1255_1878982820.1589165610516--

------=_Part_1254_1871053317.1589165610516--
