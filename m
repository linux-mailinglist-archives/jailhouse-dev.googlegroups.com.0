Return-Path: <jailhouse-dev+bncBDAPRTOWQ4KBBCF24D2QKGQEM45ZN2Q@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-oi1-x23c.google.com (mail-oi1-x23c.google.com [IPv6:2607:f8b0:4864:20::23c])
	by mail.lfdr.de (Postfix) with ESMTPS id B98381CCBF1
	for <lists+jailhouse-dev@lfdr.de>; Sun, 10 May 2020 17:26:02 +0200 (CEST)
Received: by mail-oi1-x23c.google.com with SMTP id 17sf10372763oij.6
        for <lists+jailhouse-dev@lfdr.de>; Sun, 10 May 2020 08:26:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:date:from:to:message-id:subject:mime-version
         :x-original-sender:precedence:mailing-list:list-id:list-post
         :list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=jxdwknHvjsCWBq6ylOvm7MljL1InIMk6M19JtnA0pb4=;
        b=SsIlvd3ToFciF1I9E6AV06Uj11yNTpUFSzK5ecZ2i9gL+H1qnJbiw76yPU05xaZ5/R
         NwnmggSRfrBaJ440ePPlNUwfZnoNFz40Gh5ivHm82az70imSOXk3b4NMAqcY6gYkL2OK
         W2PZ8fKIJCqaLHp+KVbmBAvpNrRjBY3HoxZkE0/MX+e92eNNh+ziNzelv1ffPzOl9Bdr
         AxZS0vC66DReuqLb4CITdtHo6wFgqJ+cpFb5O1dSOKtu/onp89mW72CqcPp2HH7zmtX0
         9FA4xd0dt+xZfKgx1eQcEaUO4pgQ2m85OP/ggzkBnjQCu6XJcKfEPuGrywvEE4XE38j9
         QPcA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:message-id:subject:mime-version:x-original-sender
         :precedence:mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=jxdwknHvjsCWBq6ylOvm7MljL1InIMk6M19JtnA0pb4=;
        b=ojMzVrpLW+M22HAHWlfTl5xItdtY6aL8J41+fbdQLxGErZqV4Yr0HvCi6vfaCbHgBN
         QJFhXbTo7SgyU0Vd12Xlte8M2J8eAVUrhVx7WIRhpecf7Wx2HUFlwRovoaJx+wP57IA/
         PTtvjr0IpxV5zg7QJfAL9iHbVP36dLUgeMT4EU5LJD60kKbwIpc6sMUg0WmuGL+8Ngtk
         FB2Ci5bLWLL71FCrRU1qtxb+MYPNq2ZSMMu4I6JNx2Z62Uxv1Yc5ZxxyyqSx40DdUUq1
         zhCircCFbem5ChOqupLGj3yeXP4oTt9X3JXtiuHZ90lBLIA1xMz3dA1Dqne6Kw6qtrk7
         oVng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:date:from:to:message-id:subject
         :mime-version:x-original-sender:precedence:mailing-list:list-id
         :x-spam-checked-in-group:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=jxdwknHvjsCWBq6ylOvm7MljL1InIMk6M19JtnA0pb4=;
        b=UV02UpIoBJNMcrsS7sslFYbuDWtOE8+3ufKyCmJcTCxGmM0pnrR+WzDkaD6ZqXUvJC
         VIO7bscoTRkdKfH/P338AyrtzNgqYKduAY35Wqx9fgZU15nf9vvOqZGzZQASI1rLeeAQ
         jpkzM/zhjkbYfhwTKTruJ9KqBlAYaAqh+Urqi3ZOOC5YFnLNmu0vAilwMqgu7X8KGGBZ
         7bkQ8KmUTNpyouCFMA4EGjPJJErmrFygahMpoHkfvutEFkml05L3m0/SSvURX9nM6xNA
         AuyyA7QoTktMzvgDszf/SFeV6dhXQF2AmlX1mPjT3N1Je4Su4KoD2haqGYCNOze9T6pJ
         B7ow==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AGi0PuYmYY++IDCBDIU/R4xA19hQ98Rtxv5mpN5KREhQBEHzz8tMyKcF
	4XqPt/5EiX85MDWuUZmC+Gk=
X-Google-Smtp-Source: APiQypKyrok8bAq3mD8r/0xIbpxs6fbcoahHrFLOu1Qwz2JfhAtIsPSzRHt5LWwbQAzHCjAuWAEgow==
X-Received: by 2002:a9d:39a5:: with SMTP id y34mr9204277otb.69.1589124361114;
        Sun, 10 May 2020 08:26:01 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a9d:363:: with SMTP id 90ls1479169otv.6.gmail; Sun, 10 May
 2020 08:26:00 -0700 (PDT)
X-Received: by 2002:a05:6830:2386:: with SMTP id l6mr9902331ots.128.1589124360572;
        Sun, 10 May 2020 08:26:00 -0700 (PDT)
Date: Sun, 10 May 2020 08:26:00 -0700 (PDT)
From: zhengjun zhang <zhangzhengjunhust@gmail.com>
To: Jailhouse <jailhouse-dev@googlegroups.com>
Message-Id: <b54b7357-842b-47d2-8a0f-19084d90717d@googlegroups.com>
Subject: On the question of virtualization performance loss
MIME-Version: 1.0
Content-Type: multipart/mixed; 
	boundary="----=_Part_1154_1861179410.1589124360087"
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

------=_Part_1154_1861179410.1589124360087
Content-Type: multipart/alternative; 
	boundary="----=_Part_1155_2106856684.1589124360087"

------=_Part_1155_2106856684.1589124360087
Content-Type: text/plain; charset="UTF-8"


Hi~
I recently tested the loss of virtualization performance in jailhouse on 
the i.MX 8MQuad, using the testing tools sysbench and super_pi.
I used the same Linux image (imx_4.14.98_2.0.0_ga) in the Root Cell and 
inmate Cell
Here is the jailhouse startup information
Root $ cat /proc/cpuinfo 
processor : 0
BogoMIPS : 16.66
Features : fp asimd evtstrm aes pmull sha1 sha2 crc32 cpuid
CPU implementer : 0x41
CPU architecture: 8
CPU variant : 0x0
CPU part : 0xd03
CPU revision : 4

processor : 1
BogoMIPS : 16.66
Features : fp asimd evtstrm aes pmull sha1 sha2 crc32 cpuid
CPU implementer : 0x41
CPU architecture: 8
CPU variant : 0x0
CPU part : 0xd03
CPU revision : 4
Root $ cd ~/jailhouse
Root $ insmod jailhouse.ko
[  233.063524] jailhouse: loading out-of-tree module taints kernel.

Root $ ./jailhouse enable configs/imx8mq-veth.cell

Initializing Jailhouse hypervisor v0.10 (66-g2217029) on CPU 1
Code location: 0x0000ffffc0200800
Page pool usage after early setup: mem 39/994, remap 0/131072
Initializing processors:
 CPU 1... OK
 CPU 0... OK
 CPU 3... OK
 CPU 2... OK
Initializing unit: irqchip
Initializing unit: ARM SMMU
No SMMU
Initializing unit: PCI
Adding virtual PCI device 00:00.0 to cell "imx8mq"
iommu_config_commit imx8mq
Page pool usage after late setup: mem 72/994, remap 144/131072
Activating hypervisor
[  251.213460] OF: PCI: host bridge /pci@0 ranges:
[  251.218097] OF: PCI:   MEM 0xbfc00000..0xbfc01fff -> 0xbfc00000
[  251.224313] pci-host-generic bfb00000.pci: ECAM at [mem 
0xbfb00000-0xbfbfffff] for [bus 00]
[  251.233114] pci-host-generic bfb00000.pci: PCI host bridge to bus 0000:00
[  251.240052] pci_bus 0000:00: root bus resource [bus 00]
[  251.245533] pci_bus 0000:00: root bus resource [mem 
0xbfc00000-0xbfc01fff]
[  251.252942] pci 0000:00:00.0: BAR 0: assigned [mem 0xbfc00000-0xbfc000ff 
64bit]
[  251.260861] virtio-pci 0000:00:00.0: enabling device (0000 -> 0002)
[  251.269478] The Jailhouse is opening.
[  251.269864] IPv6: ADDRCONF(NETDEV_UP): eth1: link is not ready

Root $ ./jailhouse cell linux configs/imx8mq-linux-demo.cell 
/run/media/mmcblk1p1/Image -d 
/run/media/mmcblk1p1/fsl-imx8mq-evk-inmate.dtb -c "clk_ignore_unused 
console=ttymxc1,115200 earlycon=ec_imx6q,0x30860000,115200 
root=/dev/mmcblk0p2 rootwait rw"
[  315.757129] CPU2: shutdown
[  315.759844] psci: CPU2 killed.
[  315.804134] CPU3: shutdown
[  315.806843] psci: CPU3 killed.
Adding virtual PCI device 00:00.0 to cell "linux-inmate-demo"
Shared memory connection established: "linux-inmate-demo" <--> "imx8mq"
iommu_config_commit linux-inmate-demo
Created cell "linux-inmate-demo"
Page pool usage after cell creation: mem 88/994, remap 144/131072
[  315.835959] Created Jailhouse cell "linux-inmate-demo"
Cell "linux-inmate-demo" can be loaded
Started cell "linux-inmate-demo"
[    0.000000] Booting Linux on physical CPU 0x2
[    0.000000] Linux version 4.14.98-05985-g1175b59 (root@Develop) (gcc 
version 7.3.0 (GCC)) #1 SMP PREEMPT Mon Apr 20 11:57:19 CST 2020
[    0.000000] Boot CPU: AArch64 Processor [410fd034]
[    0.000000] Machine model: Freescale i.MX8MQ EVK
[    0.000000] earlycon: ec_imx6q0 at MMIO 0x0000000030860000 (options 
'115200')
[    0.000000] bootconsole [ec_imx6q0] enabled
[    0.000000] efi: Getting EFI parameters from FDT:
[    0.000000] efi: UEFI not found.
[    0.000000] cma: Reserved 320 MiB at 0x00000000e8000000
[    0.000000] NUMA: No NUMA configuration found
[    0.000000] NUMA: Faking a node at [mem 
0x0000000000000000-0x00000000fdbfffff]
[    0.000000] NUMA: NODE_DATA [mem 0xfdbd7600-0xfdbd93ff]
[    0.000000] Zone ranges:
[    0.000000]   DMA      [mem 0x00000000c0000000-0x00000000fdbfffff]
[    0.000000]   Normal   empty
[    0.000000] Movable zone start for each node
[    0.000000] Early memory node ranges
[    0.000000]   node   0: [mem 0x00000000c0000000-0x00000000fdbfffff]
[    0.000000] Initmem setup node 0 [mem 
0x00000000c0000000-0x00000000fdbfffff]
processor : 2
BogoMIPS : 16.66
Features : fp asimd evtstrm aes pmull sha1 sha2 crc32 cpuid
CPU implementer : 0x41
CPU architecture: 8
CPU variant : 0x0
CPU part : 0xd03
CPU revision : 4

processor : 3
BogoMIPS : 16.66
Features : fp asimd evtstrm aes pmull sha1 sha2 crc32 cpuid
CPU implementer : 0x41
CPU architecture: 8
CPU variant : 0x0
CPU part : 0xd03
CPU revision : 4

I executed the same test case in bare-machine, root cell, and inmate cell.
The CPU test results of sysbench in the root cell were approximately 1% 
lower than those of the bare machine, but the CPU test results of sysbench  
in the inmate cell were approximately 1/3 lower than those of the bare 
machine.
The super_pi test results in the root cell were approximately 1% lower than 
those in the bare-bones machine, but the super_pi test results in the 
inmate cell were approximately 20% lower than those in the  bare-machine.
Jailhouse  is a partitioning hypervisor, why is there a significant 
decrease in CPU performance in the inmate cell?
This result makes me very puzzled, hope to answer.
If you need any other info let me know.
I really appreciate any analysis.
Best regards,

ZhengjunZhang

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/b54b7357-842b-47d2-8a0f-19084d90717d%40googlegroups.com.

------=_Part_1155_2106856684.1589124360087
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div><br></div><div>Hi~</div><div>I recently tested the lo=
ss of virtualization performance in jailhouse on the i.MX 8MQuad, using the=
 testing tools sysbench and super_pi.</div><div>I used the same Linux image=
 (imx_4.14.98_2.0.0_ga) in the Root Cell and inmate Cell</div><div>Here is =
the jailhouse startup information</div><div>Root $ cat /proc/cpuinfo=C2=A0<=
/div><div>processor<span style=3D"white-space:pre">	</span>: 0</div><div>Bo=
goMIPS<span style=3D"white-space:pre">	</span>: 16.66</div><div>Features<sp=
an style=3D"white-space:pre">	</span>: fp asimd evtstrm aes pmull sha1 sha2=
 crc32 cpuid</div><div>CPU implementer<span style=3D"white-space:pre">	</sp=
an>: 0x41</div><div>CPU architecture: 8</div><div>CPU variant<span style=3D=
"white-space:pre">	</span>: 0x0</div><div>CPU part<span style=3D"white-spac=
e:pre">	</span>: 0xd03</div><div>CPU revision<span style=3D"white-space:pre=
">	</span>: 4</div><div><br></div><div>processor<span style=3D"white-space:=
pre">	</span>: 1</div><div>BogoMIPS<span style=3D"white-space:pre">	</span>=
: 16.66</div><div>Features<span style=3D"white-space:pre">	</span>: fp asim=
d evtstrm aes pmull sha1 sha2 crc32 cpuid</div><div>CPU implementer<span st=
yle=3D"white-space:pre">	</span>: 0x41</div><div>CPU architecture: 8</div><=
div>CPU variant<span style=3D"white-space:pre">	</span>: 0x0</div><div>CPU =
part<span style=3D"white-space:pre">	</span>: 0xd03</div><div>CPU revision<=
span style=3D"white-space:pre">	</span>: 4</div><div>Root $ cd ~/jailhouse<=
/div><div>Root $ insmod jailhouse.ko</div><div>[=C2=A0 233.063524] jailhous=
e: loading out-of-tree module taints kernel.</div><div><br></div><div>Root =
$ ./jailhouse enable configs/imx8mq-veth.cell</div><div><br></div><div>Init=
ializing Jailhouse hypervisor v0.10 (66-g2217029) on CPU 1</div><div>Code l=
ocation: 0x0000ffffc0200800</div><div>Page pool usage after early setup: me=
m 39/994, remap 0/131072</div><div>Initializing processors:</div><div>=C2=
=A0CPU 1... OK</div><div>=C2=A0CPU 0... OK</div><div>=C2=A0CPU 3... OK</div=
><div>=C2=A0CPU 2... OK</div><div>Initializing unit: irqchip</div><div>Init=
ializing unit: ARM SMMU</div><div>No SMMU</div><div>Initializing unit: PCI<=
/div><div>Adding virtual PCI device 00:00.0 to cell &quot;imx8mq&quot;</div=
><div>iommu_config_commit imx8mq</div><div>Page pool usage after late setup=
: mem 72/994, remap 144/131072</div><div>Activating hypervisor</div><div>[=
=C2=A0 251.213460] OF: PCI: host bridge /pci@0 ranges:</div><div>[=C2=A0 25=
1.218097] OF: PCI:=C2=A0 =C2=A0MEM 0xbfc00000..0xbfc01fff -&gt; 0xbfc00000<=
/div><div>[=C2=A0 251.224313] pci-host-generic bfb00000.pci: ECAM at [mem 0=
xbfb00000-0xbfbfffff] for [bus 00]</div><div>[=C2=A0 251.233114] pci-host-g=
eneric bfb00000.pci: PCI host bridge to bus 0000:00</div><div>[=C2=A0 251.2=
40052] pci_bus 0000:00: root bus resource [bus 00]</div><div>[=C2=A0 251.24=
5533] pci_bus 0000:00: root bus resource [mem 0xbfc00000-0xbfc01fff]</div><=
div>[=C2=A0 251.252942] pci 0000:00:00.0: BAR 0: assigned [mem 0xbfc00000-0=
xbfc000ff 64bit]</div><div>[=C2=A0 251.260861] virtio-pci 0000:00:00.0: ena=
bling device (0000 -&gt; 0002)</div><div>[=C2=A0 251.269478] The Jailhouse =
is opening.</div><div>[=C2=A0 251.269864] IPv6: ADDRCONF(NETDEV_UP): eth1: =
link is not ready</div><div><br></div><div>Root $ ./jailhouse cell linux co=
nfigs/imx8mq-linux-demo.cell /run/media/mmcblk1p1/Image -d /run/media/mmcbl=
k1p1/fsl-imx8mq-evk-inmate.dtb -c &quot;clk_ignore_unused console=3Dttymxc1=
,115200 earlycon=3Dec_imx6q,0x30860000,115200 root=3D/dev/mmcblk0p2 rootwai=
t rw&quot;</div><div>[=C2=A0 315.757129] CPU2: shutdown</div><div>[=C2=A0 3=
15.759844] psci: CPU2 killed.</div><div>[=C2=A0 315.804134] CPU3: shutdown<=
/div><div>[=C2=A0 315.806843] psci: CPU3 killed.</div><div>Adding virtual P=
CI device 00:00.0 to cell &quot;linux-inmate-demo&quot;</div><div>Shared me=
mory connection established: &quot;linux-inmate-demo&quot; &lt;--&gt; &quot=
;imx8mq&quot;</div><div>iommu_config_commit linux-inmate-demo</div><div>Cre=
ated cell &quot;linux-inmate-demo&quot;</div><div>Page pool usage after cel=
l creation: mem 88/994, remap 144/131072</div><div>[=C2=A0 315.835959] Crea=
ted Jailhouse cell &quot;linux-inmate-demo&quot;</div><div>Cell &quot;linux=
-inmate-demo&quot; can be loaded</div><div>Started cell &quot;linux-inmate-=
demo&quot;</div><div>[=C2=A0 =C2=A0 0.000000] Booting Linux on physical CPU=
 0x2</div><div>[=C2=A0 =C2=A0 0.000000] Linux version 4.14.98-05985-g1175b5=
9 (root@Develop) (gcc version 7.3.0 (GCC)) #1 SMP PREEMPT Mon Apr 20 11:57:=
19 CST 2020</div><div>[=C2=A0 =C2=A0 0.000000] Boot CPU: AArch64 Processor =
[410fd034]</div><div>[=C2=A0 =C2=A0 0.000000] Machine model: Freescale i.MX=
8MQ EVK</div><div>[=C2=A0 =C2=A0 0.000000] earlycon: ec_imx6q0 at MMIO 0x00=
00000030860000 (options &#39;115200&#39;)</div><div>[=C2=A0 =C2=A0 0.000000=
] bootconsole [ec_imx6q0] enabled</div><div>[=C2=A0 =C2=A0 0.000000] efi: G=
etting EFI parameters from FDT:</div><div>[=C2=A0 =C2=A0 0.000000] efi: UEF=
I not found.</div><div>[=C2=A0 =C2=A0 0.000000] cma: Reserved 320 MiB at 0x=
00000000e8000000</div><div>[=C2=A0 =C2=A0 0.000000] NUMA: No NUMA configura=
tion found</div><div>[=C2=A0 =C2=A0 0.000000] NUMA: Faking a node at [mem 0=
x0000000000000000-0x00000000fdbfffff]</div><div>[=C2=A0 =C2=A0 0.000000] NU=
MA: NODE_DATA [mem 0xfdbd7600-0xfdbd93ff]</div><div>[=C2=A0 =C2=A0 0.000000=
] Zone ranges:</div><div>[=C2=A0 =C2=A0 0.000000]=C2=A0 =C2=A0DMA=C2=A0 =C2=
=A0 =C2=A0 [mem 0x00000000c0000000-0x00000000fdbfffff]</div><div>[=C2=A0 =
=C2=A0 0.000000]=C2=A0 =C2=A0Normal=C2=A0 =C2=A0empty</div><div>[=C2=A0 =C2=
=A0 0.000000] Movable zone start for each node</div><div>[=C2=A0 =C2=A0 0.0=
00000] Early memory node ranges</div><div>[=C2=A0 =C2=A0 0.000000]=C2=A0 =
=C2=A0node=C2=A0 =C2=A00: [mem 0x00000000c0000000-0x00000000fdbfffff]</div>=
<div>[=C2=A0 =C2=A0 0.000000] Initmem setup node 0 [mem 0x00000000c0000000-=
0x00000000fdbfffff]</div><div>processor<span style=3D"white-space:pre">	</s=
pan>: 2</div><div>BogoMIPS<span style=3D"white-space:pre">	</span>: 16.66</=
div><div>Features<span style=3D"white-space:pre">	</span>: fp asimd evtstrm=
 aes pmull sha1 sha2 crc32 cpuid</div><div>CPU implementer<span style=3D"wh=
ite-space:pre">	</span>: 0x41</div><div>CPU architecture: 8</div><div>CPU v=
ariant<span style=3D"white-space:pre">	</span>: 0x0</div><div>CPU part<span=
 style=3D"white-space:pre">	</span>: 0xd03</div><div>CPU revision<span styl=
e=3D"white-space:pre">	</span>: 4</div><div><br></div><div>processor<span s=
tyle=3D"white-space:pre">	</span>: 3</div><div>BogoMIPS<span style=3D"white=
-space:pre">	</span>: 16.66</div><div>Features<span style=3D"white-space:pr=
e">	</span>: fp asimd evtstrm aes pmull sha1 sha2 crc32 cpuid</div><div>CPU=
 implementer<span style=3D"white-space:pre">	</span>: 0x41</div><div>CPU ar=
chitecture: 8</div><div>CPU variant<span style=3D"white-space:pre">	</span>=
: 0x0</div><div>CPU part<span style=3D"white-space:pre">	</span>: 0xd03</di=
v><div>CPU revision<span style=3D"white-space:pre">	</span>: 4</div><div><b=
r></div><div>I executed the same test case in bare-machine, root cell, and =
inmate cell.</div><div>The CPU test results of sysbench in the root cell we=
re approximately 1% lower than those of the bare machine, but the CPU test =
results of sysbench=C2=A0 in the inmate cell were approximately 1/3 lower t=
han those of the bare machine.</div><div>The super_pi test results in the r=
oot cell were approximately 1% lower than those in the bare-bones machine, =
but the super_pi test results in the inmate cell were approximately 20% low=
er than those in the=C2=A0 bare-machine.</div><div>Jailhouse=C2=A0 is a par=
titioning hypervisor, why is there a significant decrease in CPU performanc=
e in the inmate cell?</div><div>This result makes me very puzzled, hope to =
answer.</div><div>If you need any other info let me know.</div><div>I reall=
y appreciate any analysis.</div><div>Best regards,</div><div><br></div><div=
>ZhengjunZhang</div></div>

<p></p>

-- <br />
You received this message because you are subscribed to the Google Groups &=
quot;Jailhouse&quot; group.<br />
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to <a href=3D"mailto:jailhouse-dev+unsubscribe@googlegroups.com">jailh=
ouse-dev+unsubscribe@googlegroups.com</a>.<br />
To view this discussion on the web visit <a href=3D"https://groups.google.c=
om/d/msgid/jailhouse-dev/b54b7357-842b-47d2-8a0f-19084d90717d%40googlegroup=
s.com?utm_medium=3Demail&utm_source=3Dfooter">https://groups.google.com/d/m=
sgid/jailhouse-dev/b54b7357-842b-47d2-8a0f-19084d90717d%40googlegroups.com<=
/a>.<br />

------=_Part_1155_2106856684.1589124360087--

------=_Part_1154_1861179410.1589124360087--
