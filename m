Return-Path: <jailhouse-dev+bncBCWJRXUWVQPBBD5NUKHAMGQEAFLVSZA@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-qk1-x738.google.com (mail-qk1-x738.google.com [IPv6:2607:f8b0:4864:20::738])
	by mail.lfdr.de (Postfix) with ESMTPS id 4FC3447F833
	for <lists+jailhouse-dev@lfdr.de>; Sun, 26 Dec 2021 17:21:37 +0100 (CET)
Received: by mail-qk1-x738.google.com with SMTP id br9-20020a05620a460900b0046ad784c791sf8468725qkb.4
        for <lists+jailhouse-dev@lfdr.de>; Sun, 26 Dec 2021 08:21:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20210112;
        h=sender:date:from:to:message-id:in-reply-to:references:subject
         :mime-version:x-original-sender:precedence:mailing-list:list-id
         :list-post:list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=3Luo63E+mcriwTMeX9ToLMtbUYaIg/xbnsQSQlYpNFk=;
        b=ZRsW3X/JraDWXZFcgg/WEfNICGN6kpDFMBQa03UXEwM7L89nyJFLT/iRUG8frMePS0
         HlHVoFmCeCnAZLJxH+l1XBFTQSFlQc9zGqnlWtrqcxiAmdJeGVsfyTbEOQ+dc41RVhbZ
         DL8xl50Xk3LTqtc28jHU1yC2SQSvcwaKjGE5250HUryOd5tR6ZVFed9nB0fhz/S21t6h
         UfQ+4oes0ubpILHFon00sKkLWQPYMnNhQPSiumr48Gk5PsNqj+ogKq1KRGB/+l1XhdVv
         LeO/d9yTPZ5kNeyYnDGgCZESEluFcwtGrCmw75C/S1AAuZxBcn0Qkea1RMAKZ0JzXFdh
         HtwQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=date:from:to:message-id:in-reply-to:references:subject:mime-version
         :x-original-sender:precedence:mailing-list:list-id:list-post
         :list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=3Luo63E+mcriwTMeX9ToLMtbUYaIg/xbnsQSQlYpNFk=;
        b=AKVYqE7jpDY+eF4Frzg/SsKYWLxIhfKhwDlDghw/FAidisj5Lb/S3c3sFVvGyy6DOZ
         K1teMJ0YyJifxZp5qIauzwOWAGH05x+eo4mKSBAs8eNzn5E2yaiaRva4Mq/FuKrZ3hy3
         7dxtx/UfUUOg/tiOezR0pUXEwZjzQqyPUax7XSxokTZH684UF6wda04glxY6sOUOYvzN
         MtNpUS/UuFkbZ58t0/mwfy0nFkMz82V7mPzSpJIQKV2XIAVxTm90BIFCqLL9IoIEenu9
         u2RqlDQpy5EfS8rvqdsmMcysFwVXPZghrDtPdMIvg4Htbq52Zfo5XKMMxKTSpyIX/7PA
         FM5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=sender:x-gm-message-state:date:from:to:message-id:in-reply-to
         :references:subject:mime-version:x-original-sender:precedence
         :mailing-list:list-id:x-spam-checked-in-group:list-post:list-help
         :list-archive:list-subscribe:list-unsubscribe;
        bh=3Luo63E+mcriwTMeX9ToLMtbUYaIg/xbnsQSQlYpNFk=;
        b=eqWGa0RPgOIGzEjOWku8pPCruSQM8S+0/7NpIc4cQ3RNHGOGmSzs6qS/rWsclQmLVi
         tKBZQqPobLtPv2Bj53ClutxiHLmt9RiAGk5ziVGf9lQoAdrUC0kIZJ1nzFvnGtiwxMbw
         aPnr2pifSz3dJ8uj/P+FXj6ATzcVRSIASBxXIkrDbS7dkCnxLp87joNgB2zzWew5Vhdq
         2bnUvk2i0mydIAMLIG+YcOxDISMABziy/j7so0JQpeTWIpGKoT4rhm/0qnCAuiMroYW2
         3JtdNDFa3Hwv9+vDjd4luOdjXhrzUeDvvMYfFhN0vC06f4qL49Y/2XfikHMti0NmgyhQ
         F26w==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AOAM5338wxecX/bpH7hv3N3+sNbdY6qBxEStL0bovkF0r5559QHDxP7U
	zaKqv3mDi2p6O1wra6vX87g=
X-Google-Smtp-Source: ABdhPJyO+ul5UWtreVADb4w/pvMlGOtfcubGC1F5FEBGDUOTQUfF6rRUapQZvb/DKSZVc4FsbBdcqg==
X-Received: by 2002:a05:622a:454:: with SMTP id o20mr11928543qtx.319.1640535695810;
        Sun, 26 Dec 2021 08:21:35 -0800 (PST)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a05:620a:40cc:: with SMTP id g12ls6798364qko.4.gmail; Sun,
 26 Dec 2021 08:21:35 -0800 (PST)
X-Received: by 2002:a05:620a:4305:: with SMTP id u5mr9666611qko.577.1640535694932;
        Sun, 26 Dec 2021 08:21:34 -0800 (PST)
Date: Sun, 26 Dec 2021 08:21:33 -0800 (PST)
From: jiajun huang <huangjiajun145041@gmail.com>
To: Jailhouse <jailhouse-dev@googlegroups.com>
Message-Id: <c7eaa08e-ae92-4c5c-a57c-7ddac379242cn@googlegroups.com>
In-Reply-To: <f76e76b332af3cef7a46e9048e96d6b50aa50fa0.camel@siemens.com>
References: <AQHX9zll1kEOxXgNtECZVvZtiJyBGKw+juAAgAAEf4CAAANwgA==>
 <AQHX9zll1kEOxXgNtECZVvZtiJyBGKw+juAA>
 <db157b8a-dadc-440b-9385-1278ef5d7097n@googlegroups.com>
 <64fa037aefed1d130bc0d3a49ccc3d09d5b504bc.camel@siemens.com>
 <2be13d89-1023-411b-ba9e-1d10044824e5n@googlegroups.com>
 <f76e76b332af3cef7a46e9048e96d6b50aa50fa0.camel@siemens.com>
Subject: Re: FATAL: Unhandled VM-Exit, reason 2
MIME-Version: 1.0
Content-Type: multipart/mixed; 
	boundary="----=_Part_22246_1599101656.1640535693925"
X-Original-Sender: huangjiajun145041@gmail.com
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

------=_Part_22246_1599101656.1640535693925
Content-Type: multipart/alternative; 
	boundary="----=_Part_22247_2123214903.1640535693925"

------=_Part_22247_2123214903.1640535693925
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Happy New Year=EF=BC=8C

I successfully created root cell and inmate cell on QEMU, and nuttx running=
=20
in the inmate cell. At the same time, I added the ivshmem-net device to the=
=20
root cell and the intimate cell, and loaded the NIC driver. Finally, I=20
configured ip 172.16.0.1 and 172.16.0.2 for the network card. But when I=20
execute ping 172.16.0.2 in the root cell, the error "From 172.16.0.1=20
icmp_seq=3D1 Destination Host Unreachable" appears. The attachment is the=
=20
driver I used in linux and nuttx respectively.The network driver uses the=
=20
virtio interface. I tried to log in the driver, but I found that the=20
control flow did not enter ndo_start_xmit().

ping
PING 172.16.0.2 (172.16.0.2) 56(84) bytes of data.
From 172.16.0.1 icmp_seq=3D1 Destination Host Unreachable
From 172.16.0.1 icmp_seq=3D2 Destination Host Unreachable
From 172.16.0.1 icmp_seq=3D3 Destination Host Unreachable

route -n
Kernel IP routing table
Destination Gateway Genmask Flags Metric Ref Use Iface
0.0.0.0 10.0.2.2 0.0.0.0 UG 100 0 0 enp0s2
10.0.2.0 0.0.0.0 255.255.255.0 U 100 0 0 enp0s2
169.254.0.0 0.0.0.0 255.255.0.0 U 1000 0 0 enp0s2
172.16.0.0 0.0.0.0 255.255.255.0 U 0 0 0 enp0s14

ifconfig
enp0s2 Link encap:Ethernet HWaddr 52:54:00:12:34:56
          inet addr:10.0.2.15 Bcast:10.0.2.255 Mask:255.255.255.0
          inet6 addr: fec0::8070:776d:7dfd:da1/64 Scope:Site
          inet6 addr: fec0::1493:dcc2:ea12:8774/64 Scope:Site
          inet6 addr: fec0::7c68:51e0:8aab:db34/64 Scope:Site
          inet6 addr: fe80::feb9:1534:861b:722f/64 Scope:Link
          UP BROADCAST RUNNING MULTICAST MTU:1500 Metric:1
          RX packets:675167977 errors:0 dropped:0 overruns:0 frame:0
          TX packets:248205 errors:0 dropped:0 overruns:0 carrier:0
          collisions:0 txqueuelen:1000
          RX bytes: 52687970572 (52.6 GB) TX bytes: 49989174072 (49.9 GB)
          Interrupt:22 Memory:feb80000-feba0000

enp0s14 Link encap:Ethernet HWaddr 3e:27:50:f3:c5:16
          inet addr:172.16.0.1 Bcast:172.16.0.255 Mask:255.255.255.0
          UP BROADCAST RUNNING MULTICAST MTU:16384 Metric:1
          RX packets:0 errors:0 dropped:0 overruns:0 frame:0
          TX packets:0 errors:0 dropped:0 overruns:0 carrier:0
          collisions:0 txqueuelen:1000
          RX bytes:0 (0.0 B) TX bytes:0 (0.0 B)

lo Link encap:Local Loopback
          inet addr:127.0.0.1 Mask:255.0.0.0
          inet6 addr: ::1/128 Scope:Host
          UP LOOPBACK RUNNING MTU:65536 Metric:1
          RX packets: 491565 errors:0 dropped:0 overruns:0 frame:0
          TX packets:491565 errors:0 dropped:0 overruns:0 carrier:0
          collisions:0 txqueuelen:1000
          RX bytes: 29522474 (29.5 MB) TX bytes: 29522474 (29.5 MB)

arp
? (172.16.0.2) at <incomplete> on enp0s14
? (10.0.2.3) at 52:55:0a:00:02:03 [ether] on enp0s2
? (10.0.2.2) at 52:55:0a:00:02:02 [ether] on enp0s2

jailhouse output
Initializing Jailhouse hypervisor v0.12 (5-g06ba27d-dirty) on CPU 2
Code location: 0xfffffffff0000050
Using x2APIC
Page pool usage after early setup: mem 108/32207, remap 0/131072
Initializing processors:
 CPU 2... (APIC ID 2) OK
 CPU 1... (APIC ID 1) OK
 CPU 3... (APIC ID 3) OK
 CPU 0... (APIC ID 0) OK
Initializing unit: VT-d
DMAR unit @0xfed90000/0x1000
Reserving 24 interrupt(s) for device ff:00.0 at index 0
Initializing unit: IOAPIC
Initializing unit: Cache Allocation Technology
Initializing unit: PCI
Adding virtual PCI device 00:0d.0 to cell "RootCell"
Adding virtual PCI device 00:0e.0 to cell "RootCell"
Adding PCI device 00:00.0 to cell "RootCell"
Adding PCI device 00:01.0 to cell "RootCell"
Adding PCI device 00:02.0 to cell "RootCell"
Reserving 5 interrupt(s) for device 00:02.0 at index 24
Adding PCI device 00:1b.0 to cell "RootCell"
Reserving 1 interrupt(s) for device 00:1b.0 at index 29
Adding PCI device 00:1f.0 to cell "RootCell"
Adding PCI device 00:1f.2 to cell "RootCell"
Reserving 1 interrupt(s) for device 00:1f.2 at index 30
Adding PCI device 00:1f.3 to cell "RootCell"
Page pool usage after late setup: mem 339/32207, remap 65542/131072
Activating hypervisor
Reserving 1 interrupt(s) for device 00:00.0 at index 31
Adding virtual PCI device 00:0d.0 to cell "nuttx"
Shared memory connection established, peer cells:
 "RootCell"
Adding virtual PCI device 00:0e.0 to cell "nuttx"
Shared memory connection established, peer cells:
 "RootCell"
Created cell "nuttx"
Page pool usage after cell creation: mem 871/32207, remap 65543/131072
Cell "nuttx" can be loaded
CPU 3 received SIPI, vector 100
Started cell "nuttx"

nuttx output
x86_rng_initialize: Initializing RNG
pci_enumerate: [00:0d.0] Found 110a:4106, class/reversion 00000200
pci_enumerate: [00:0d.0] Jailhouse Shadow process memory and pipe
shadow_probe: Shadow[0] mapped bar[0]: 0xf0000000
shadow_probe: Shadow[0] mapped bar[1]: 0xf0001000
pci_enable_device: 00:0d.0, CMD: 0 -> 6
shadow_probe: Shadow[0] shared memory base: 0xf0000000, size: 0x1000
shadow_probe: Shadow[0] State Table phy_addr: 0x176000000 virt_addr:=20
0xf0002000, size: 0x1000
shadow_probe: Shadow[0] R/W  region phy_addr: 0x1000 virt_addr: 0x1000,=20
size: 0x3ffff000
shadow_probe: Shadow[0] I    region phy_addr: 0x1b6001000 virt_addr:=20
0xf0003000, size: 0x3000
shadow_probe: Shadow[0] O    region phy_addr: 0x1b6005000 virt_addr:=20
0xf0007000, size: 0x3000
shadow_probe: Initialized Shadow[0]
pci_enumerate: [00:0e.0] Found 110a:4106, class/reversion 00000100
pci_enumerate: [00:0e.0] Jailhouse Ivshmem-net
ivshmnet_probe: Ivshmem-net[0] mapped bar[0]: 0xf000b000
ivshmnet_probe: Ivshmem-net[0] mapped bar[1]: 0xf000c000
pci_enable_device: 00:0e.0, CMD: 0 -> 6
ivshmnet_probe: Ivshmem-net[0] State Table phy_addr:0x1b6205000 virt_addr:=
=20
0xf000d000, size: 0x1000
ivshmnet_probe: Ivshmem-net[0] TX region phy_addr: 0x1b6285000 virt_addr:=
=20
0xf000e000, size: 0x7f000
ivshmnet_probe: Ivshmem-net[0] RX region phy_addr: 0x1b6206000 virt_addr:=
=20
0xf008d000, size: 0x7f000
ivshmnet_probe: Initialized Ivshmem-net[1]
shadow_state_change: Remote state: 0

cRTOS Daemon: Starting...

cRTOS Daemon: Initializing Network (eth0)...
set ip=20
set router=20
set mask=20
 ip  up
cRTOS: Initialized! port: 42

cRTOS: Waiting for client

=E5=9C=A82021=E5=B9=B412=E6=9C=8822=E6=97=A5=E6=98=9F=E6=9C=9F=E4=B8=89 UTC=
+8 22:46:01<Bezdeka, Florian> =E5=86=99=E9=81=93=EF=BC=9A

> On Wed, 2021-12-22 at 06:33 -0800, jiajun huang wrote:
> > Hi,
> > I will try as you suggest.
> > Currently I try to run this open source project
> > https://github.com/fixstars/cRTOS/blob/master/Installation.md. I used
> > to follow the guidelines of this project to successfully run
> > linux+nuttx on QEMU, but I found that the ivshmem-net device on qemu
> > does not seem to work. I suspect it is because the mmio area created
> > by jailhouse for ivshmem-net devices is not registered in QEMU. So I
> > decided to try to run this project on the server. I want to know if
> > the ivshmem device is supported by QEMU?
> >=20
>
> There are examples with ivshmem on qemu, if you get the memory mapping
> right it will work. Normally you can't re-use the same hypervisor
> configuration on real hardware. The IOAPIC/iommu setup is normally
> different.=20
>
> Root-Cell:
> https://github.com/siemens/jailhouse/blob/master/configs/x86/qemu-x86.c
>
> Inmate/Linux:
>
> https://github.com/siemens/jailhouse/blob/master/configs/x86/linux-x86-de=
mo.c
>
> >=20
> > =E5=9C=A82021=E5=B9=B412=E6=9C=8822=E6=97=A5=E6=98=9F=E6=9C=9F=E4=B8=89=
 UTC+8 22:17:37<Bezdeka, Florian> =E5=86=99=E9=81=93=EF=BC=9A
> > > On Wed, 2021-12-22 at 05:39 -0800, jiajun huang wrote:
> > > > Dear Jailhouse community=EF=BC=8C
> > > > This bug occurred when I tried to start nuttx on a none-root cell
> > > > on
> > > > the server. I added two ivshmem devices for nuttx. Below is my
> > > > configuration file. I am not sure if there is a problem with the
> > > > mmio
> > > > area in the configuration file. What is the communication area?
> > > > In
> > > > addition, if jailhouse runs in QEMU, can two virtual machines
> > > > communicate with each other through ivshmem-net?
> > > >=20
> > > > Below is my root-cell , nuttx configuration and log output from
> > > > the
> > > > port.
> > >=20
> > > Have you validated your cell configurations with the jailhouse
> > > config
> > > checker? I did not look into your configuration in detail, but
> > > nearly
> > > all of your inmate memory blocks are tagged with
> > > "JAILHOUSE_MEM_ROOTSHARED" which seems uncommon.
> > >=20
> > > I would start step by step. So start from a configuration where you
> > > know that both cells are booting up. Add virtual NICs afterwards
> > > and
> > > make sure that IRQs are delivered to ivshmem devices.
> > >=20
> > > Are you able to follow the boot log of your inmate? Hopefully you
> > > will
> > > see the reason for the VM exit there.
> > >=20
> > > HTH,
> > > Florian
> > >=20
> > > >=20
> > > > Best regards,
> > > >=20
> > > > Jiajun Huang
> > > >=20
> > >=20
>
>

--=20
You received this message because you are subscribed to the Google Groups "=
Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/=
jailhouse-dev/c7eaa08e-ae92-4c5c-a57c-7ddac379242cn%40googlegroups.com.

------=_Part_22247_2123214903.1640535693925
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Happy New Year=EF=BC=8C<div><br>I successfully created root cell and inmate=
 cell on QEMU, and nuttx running in the inmate cell. At the same time, I ad=
ded the ivshmem-net device to the root cell and the intimate cell, and load=
ed the NIC driver. Finally, I configured ip 172.16.0.1 and 172.16.0.2 for t=
he network card. But when I execute ping 172.16.0.2 in the root cell, the e=
rror "From 172.16.0.1 icmp_seq=3D1 Destination Host Unreachable" appears. T=
he attachment is the driver I used in linux and nuttx respectively.The netw=
ork driver uses the virtio interface.&nbsp;I tried to log in the driver, bu=
t I found that the control flow did not enter ndo_start_xmit().<br><br>ping=
<br>PING 172.16.0.2 (172.16.0.2) 56(84) bytes of data.<br>From 172.16.0.1 i=
cmp_seq=3D1 Destination Host Unreachable<br>From 172.16.0.1 icmp_seq=3D2 De=
stination Host Unreachable<br>From 172.16.0.1 icmp_seq=3D3 Destination Host=
 Unreachable<br><br>route -n<br>Kernel IP routing table<br>Destination Gate=
way Genmask Flags Metric Ref Use Iface<br>0.0.0.0 10.0.2.2 0.0.0.0 UG 100 0=
 0 enp0s2<br>10.0.2.0 0.0.0.0 255.255.255.0 U 100 0 0 enp0s2<br>169.254.0.0=
 0.0.0.0 255.255.0.0 U 1000 0 0 enp0s2<br>172.16.0.0 0.0.0.0 255.255.255.0 =
U 0 0 0 enp0s14<br><br>ifconfig<br>enp0s2 Link encap:Ethernet HWaddr 52:54:=
00:12:34:56<br>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; inet addr:10.0.2.15 Bcast=
:10.0.2.255 Mask:255.255.255.0<br>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; inet6 =
addr: fec0::8070:776d:7dfd:da1/64 Scope:Site<br>&nbsp; &nbsp; &nbsp; &nbsp;=
 &nbsp; inet6 addr: fec0::1493:dcc2:ea12:8774/64 Scope:Site<br>&nbsp; &nbsp=
; &nbsp; &nbsp; &nbsp; inet6 addr: fec0::7c68:51e0:8aab:db34/64 Scope:Site<=
br>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; inet6 addr: fe80::feb9:1534:861b:722f=
/64 Scope:Link<br>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; UP BROADCAST RUNNING M=
ULTICAST MTU:1500 Metric:1<br>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; RX packets=
:675167977 errors:0 dropped:0 overruns:0 frame:0<br>&nbsp; &nbsp; &nbsp; &n=
bsp; &nbsp; TX packets:248205 errors:0 dropped:0 overruns:0 carrier:0<br>&n=
bsp; &nbsp; &nbsp; &nbsp; &nbsp; collisions:0 txqueuelen:1000<br>&nbsp; &nb=
sp; &nbsp; &nbsp; &nbsp; RX bytes: 52687970572 (52.6 GB) TX bytes: 49989174=
072 (49.9 GB)<br>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; Interrupt:22 Memory:feb=
80000-feba0000<br><br>enp0s14 Link encap:Ethernet HWaddr 3e:27:50:f3:c5:16<=
br>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; inet addr:172.16.0.1 Bcast:172.16.0.2=
55 Mask:255.255.255.0<br>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; UP BROADCAST RU=
NNING MULTICAST MTU:16384 Metric:1<br>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; RX=
 packets:0 errors:0 dropped:0 overruns:0 frame:0<br>&nbsp; &nbsp; &nbsp; &n=
bsp; &nbsp; TX packets:0 errors:0 dropped:0 overruns:0 carrier:0<br>&nbsp; =
&nbsp; &nbsp; &nbsp; &nbsp; collisions:0 txqueuelen:1000<br>&nbsp; &nbsp; &=
nbsp; &nbsp; &nbsp; RX bytes:0 (0.0 B) TX bytes:0 (0.0 B)<br><br>lo Link en=
cap:Local Loopback<br>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; inet addr:127.0.0.=
1 Mask:255.0.0.0<br>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; inet6 addr: ::1/128 =
Scope:Host<br>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; UP LOOPBACK RUNNING MTU:65=
536 Metric:1<br>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; RX packets: 491565 error=
s:0 dropped:0 overruns:0 frame:0<br>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; TX p=
ackets:491565 errors:0 dropped:0 overruns:0 carrier:0<br>&nbsp; &nbsp; &nbs=
p; &nbsp; &nbsp; collisions:0 txqueuelen:1000<br>&nbsp; &nbsp; &nbsp; &nbsp=
; &nbsp; RX bytes: 29522474 (29.5 MB) TX bytes: 29522474 (29.5 MB)<br><br>a=
rp<br>? (172.16.0.2) at &lt;incomplete&gt; on enp0s14<br>? (10.0.2.3) at 52=
:55:0a:00:02:03 [ether] on enp0s2<br>? (10.0.2.2) at 52:55:0a:00:02:02 [eth=
er] on enp0s2<br><br>jailhouse output<br>Initializing Jailhouse hypervisor =
v0.12 (5-g06ba27d-dirty) on CPU 2<br>Code location: 0xfffffffff0000050<br>U=
sing x2APIC<br>Page pool usage after early setup: mem 108/32207, remap 0/13=
1072<br>Initializing processors:<br>&nbsp;CPU 2... (APIC ID 2) OK<br>&nbsp;=
CPU 1... (APIC ID 1) OK<br>&nbsp;CPU 3... (APIC ID 3) OK<br>&nbsp;CPU 0... =
(APIC ID 0) OK<br>Initializing unit: VT-d<br>DMAR unit @0xfed90000/0x1000<b=
r>Reserving 24 interrupt(s) for device ff:00.0 at index 0<br>Initializing u=
nit: IOAPIC<br>Initializing unit: Cache Allocation Technology<br>Initializi=
ng unit: PCI<br>Adding virtual PCI device 00:0d.0 to cell "RootCell"<br>Add=
ing virtual PCI device 00:0e.0 to cell "RootCell"<br>Adding PCI device 00:0=
0.0 to cell "RootCell"<br>Adding PCI device 00:01.0 to cell "RootCell"<br>A=
dding PCI device 00:02.0 to cell "RootCell"<br>Reserving 5 interrupt(s) for=
 device 00:02.0 at index 24<br>Adding PCI device 00:1b.0 to cell "RootCell"=
<br>Reserving 1 interrupt(s) for device 00:1b.0 at index 29<br>Adding PCI d=
evice 00:1f.0 to cell "RootCell"<br>Adding PCI device 00:1f.2 to cell "Root=
Cell"<br>Reserving 1 interrupt(s) for device 00:1f.2 at index 30<br>Adding =
PCI device 00:1f.3 to cell "RootCell"<br>Page pool usage after late setup: =
mem 339/32207, remap 65542/131072<br>Activating hypervisor<br>Reserving 1 i=
nterrupt(s) for device 00:00.0 at index 31<br>Adding virtual PCI device 00:=
0d.0 to cell "nuttx"<br>Shared memory connection established, peer cells:<b=
r>&nbsp;"RootCell"<br>Adding virtual PCI device 00:0e.0 to cell "nuttx"<br>=
Shared memory connection established, peer cells:<br>&nbsp;"RootCell"<br>Cr=
eated cell "nuttx"<br>Page pool usage after cell creation: mem 871/32207, r=
emap 65543/131072<br>Cell "nuttx" can be loaded<br>CPU 3 received SIPI, vec=
tor 100<br>Started cell "nuttx"<br></div><div><br></div><div>nuttx output</=
div><div>x86_rng_initialize: Initializing RNG<br>pci_enumerate: [00:0d.0] F=
ound 110a:4106, class/reversion 00000200<br>pci_enumerate: [00:0d.0] Jailho=
use Shadow process memory and pipe<br>shadow_probe: Shadow[0] mapped bar[0]=
: 0xf0000000<br>shadow_probe: Shadow[0] mapped bar[1]: 0xf0001000<br>pci_en=
able_device: 00:0d.0, CMD: 0 -&gt; 6<br>shadow_probe: Shadow[0] shared memo=
ry base: 0xf0000000, size: 0x1000<br>shadow_probe: Shadow[0] State Table ph=
y_addr: 0x176000000 virt_addr: 0xf0002000, size: 0x1000<br>shadow_probe: Sh=
adow[0] R/W &nbsp;region phy_addr: 0x1000 virt_addr: 0x1000, size: 0x3ffff0=
00<br>shadow_probe: Shadow[0] I &nbsp; &nbsp;region phy_addr: 0x1b6001000 v=
irt_addr: 0xf0003000, size: 0x3000<br>shadow_probe: Shadow[0] O &nbsp; &nbs=
p;region phy_addr: 0x1b6005000 virt_addr: 0xf0007000, size: 0x3000<br>shado=
w_probe: Initialized Shadow[0]<br>pci_enumerate: [00:0e.0] Found 110a:4106,=
 class/reversion 00000100<br>pci_enumerate: [00:0e.0] Jailhouse Ivshmem-net=
<br>ivshmnet_probe: Ivshmem-net[0] mapped bar[0]: 0xf000b000<br>ivshmnet_pr=
obe: Ivshmem-net[0] mapped bar[1]: 0xf000c000<br>pci_enable_device: 00:0e.0=
, CMD: 0 -&gt; 6<br>ivshmnet_probe: Ivshmem-net[0] State Table phy_addr:0x1=
b6205000 virt_addr: 0xf000d000, size: 0x1000<br>ivshmnet_probe: Ivshmem-net=
[0] TX region phy_addr: 0x1b6285000 virt_addr: 0xf000e000, size: 0x7f000<br=
>ivshmnet_probe: Ivshmem-net[0] RX region phy_addr: 0x1b6206000 virt_addr: =
0xf008d000, size: 0x7f000<br>ivshmnet_probe: Initialized Ivshmem-net[1]<br>=
shadow_state_change: Remote state: 0<br><br>cRTOS Daemon: Starting...<br><b=
r>cRTOS Daemon: Initializing Network (eth0)...<br>set ip <br>set router <br=
>set mask <br>&nbsp;ip &nbsp;up<br>cRTOS: Initialized! port: 42<br><br>cRTO=
S: Waiting for client<br><br></div><div class=3D"gmail_quote"><div dir=3D"a=
uto" class=3D"gmail_attr">=E5=9C=A82021=E5=B9=B412=E6=9C=8822=E6=97=A5=E6=
=98=9F=E6=9C=9F=E4=B8=89 UTC+8 22:46:01&lt;Bezdeka, Florian> =E5=86=99=E9=
=81=93=EF=BC=9A<br/></div><blockquote class=3D"gmail_quote" style=3D"margin=
: 0 0 0 0.8ex; border-left: 1px solid rgb(204, 204, 204); padding-left: 1ex=
;">On Wed, 2021-12-22 at 06:33 -0800, jiajun huang wrote:
<br>&gt; Hi,
<br>&gt; I will try as you suggest.
<br>&gt; Currently I try to run this open source project
<br>&gt; <a href=3D"https://github.com/fixstars/cRTOS/blob/master/Installat=
ion.md" target=3D"_blank" rel=3D"nofollow" data-saferedirecturl=3D"https://=
www.google.com/url?hl=3Dzh-CN&amp;q=3Dhttps://github.com/fixstars/cRTOS/blo=
b/master/Installation.md&amp;source=3Dgmail&amp;ust=3D1640620082688000&amp;=
usg=3DAFQjCNGuH0CZlNrqDzRK1HvPwKGWBqdjFQ">https://github.com/fixstars/cRTOS=
/blob/master/Installation.md</a>. I used
<br>&gt; to follow the guidelines of this project to successfully run
<br>&gt; linux+nuttx on QEMU, but I found that the ivshmem-net device on qe=
mu
<br>&gt; does not seem to work. I suspect it is because the mmio area creat=
ed
<br>&gt; by jailhouse for ivshmem-net devices is not registered in QEMU. So=
 I
<br>&gt; decided to try to run this project on the server. I want to know i=
f
<br>&gt; the ivshmem device is supported by QEMU?
<br>&gt;=20
<br>
<br>There are examples with ivshmem on qemu, if you get the memory mapping
<br>right it will work. Normally you can&#39;t re-use the same hypervisor
<br>configuration on real hardware. The IOAPIC/iommu setup is normally
<br>different.=20
<br>
<br>Root-Cell:
<br><a href=3D"https://github.com/siemens/jailhouse/blob/master/configs/x86=
/qemu-x86.c" target=3D"_blank" rel=3D"nofollow" data-saferedirecturl=3D"htt=
ps://www.google.com/url?hl=3Dzh-CN&amp;q=3Dhttps://github.com/siemens/jailh=
ouse/blob/master/configs/x86/qemu-x86.c&amp;source=3Dgmail&amp;ust=3D164062=
0082688000&amp;usg=3DAFQjCNEfhJoQJNxCAOHt3X8KwGuMmzk6wQ">https://github.com=
/siemens/jailhouse/blob/master/configs/x86/qemu-x86.c</a>
<br>
<br>Inmate/Linux:
<br><a href=3D"https://github.com/siemens/jailhouse/blob/master/configs/x86=
/linux-x86-demo.c" target=3D"_blank" rel=3D"nofollow" data-saferedirecturl=
=3D"https://www.google.com/url?hl=3Dzh-CN&amp;q=3Dhttps://github.com/siemen=
s/jailhouse/blob/master/configs/x86/linux-x86-demo.c&amp;source=3Dgmail&amp=
;ust=3D1640620082688000&amp;usg=3DAFQjCNG3ByNbtrKI7xxdDNUix7pBiq6M5Q">https=
://github.com/siemens/jailhouse/blob/master/configs/x86/linux-x86-demo.c</a=
>
<br>
<br>&gt;=20
<br>&gt; =E5=9C=A82021=E5=B9=B412=E6=9C=8822=E6=97=A5=E6=98=9F=E6=9C=9F=E4=
=B8=89 UTC+8 22:17:37&lt;Bezdeka, Florian&gt; =E5=86=99=E9=81=93=EF=BC=9A
<br>&gt; &gt; On Wed, 2021-12-22 at 05:39 -0800, jiajun huang wrote:
<br>&gt; &gt; &gt; Dear Jailhouse community=EF=BC=8C
<br>&gt; &gt; &gt; This bug occurred when I tried to start nuttx on a none-=
root cell
<br>&gt; &gt; &gt; on
<br>&gt; &gt; &gt; the server. I added two ivshmem devices for nuttx. Below=
 is my
<br>&gt; &gt; &gt; configuration file. I am not sure if there is a problem =
with the
<br>&gt; &gt; &gt; mmio
<br>&gt; &gt; &gt; area in the configuration file. What is the communicatio=
n area?
<br>&gt; &gt; &gt; In
<br>&gt; &gt; &gt; addition, if jailhouse runs in QEMU, can two virtual mac=
hines
<br>&gt; &gt; &gt; communicate with each other through ivshmem-net?
<br>&gt; &gt; &gt;=20
<br>&gt; &gt; &gt; Below is my root-cell , nuttx configuration and log outp=
ut from
<br>&gt; &gt; &gt; the
<br>&gt; &gt; &gt; port.
<br>&gt; &gt;=20
<br>&gt; &gt; Have you validated your cell configurations with the jailhous=
e
<br>&gt; &gt; config
<br>&gt; &gt; checker? I did not look into your configuration in detail, bu=
t
<br>&gt; &gt; nearly
<br>&gt; &gt; all of your inmate memory blocks are tagged with
<br>&gt; &gt; &quot;JAILHOUSE_MEM_ROOTSHARED&quot; which seems uncommon.
<br>&gt; &gt;=20
<br>&gt; &gt; I would start step by step. So start from a configuration whe=
re you
<br>&gt; &gt; know that both cells are booting up. Add virtual NICs afterwa=
rds
<br>&gt; &gt; and
<br>&gt; &gt; make sure that IRQs are delivered to ivshmem devices.
<br>&gt; &gt;=20
<br>&gt; &gt; Are you able to follow the boot log of your inmate? Hopefully=
 you
<br>&gt; &gt; will
<br>&gt; &gt; see the reason for the VM exit there.
<br>&gt; &gt;=20
<br>&gt; &gt; HTH,
<br>&gt; &gt; Florian
<br>&gt; &gt;=20
<br>&gt; &gt; &gt;=20
<br>&gt; &gt; &gt; Best regards,
<br>&gt; &gt; &gt;=20
<br>&gt; &gt; &gt; Jiajun Huang
<br>&gt; &gt; &gt;=20
<br>&gt; &gt;=20
<br>
<br></blockquote></div>

<p></p>

-- <br />
You received this message because you are subscribed to the Google Groups &=
quot;Jailhouse&quot; group.<br />
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to <a href=3D"mailto:jailhouse-dev+unsubscribe@googlegroups.com">jailh=
ouse-dev+unsubscribe@googlegroups.com</a>.<br />
To view this discussion on the web visit <a href=3D"https://groups.google.c=
om/d/msgid/jailhouse-dev/c7eaa08e-ae92-4c5c-a57c-7ddac379242cn%40googlegrou=
ps.com?utm_medium=3Demail&utm_source=3Dfooter">https://groups.google.com/d/=
msgid/jailhouse-dev/c7eaa08e-ae92-4c5c-a57c-7ddac379242cn%40googlegroups.co=
m</a>.<br />

------=_Part_22247_2123214903.1640535693925--

------=_Part_22246_1599101656.1640535693925
Content-Type: text/x-csrc; charset=UTF-8; name=linux-net-driver.c
Content-Transfer-Encoding: quoted-printable
Content-Disposition: attachment; filename=linux-net-driver.c
X-Attachment-Id: 184f2635-d33d-4a06-b011-574c15bf37f3
Content-ID: <184f2635-d33d-4a06-b011-574c15bf37f3>

/*
 * Copyright 2016 Mans Rullgard <mans@mansr.com>
 * Copyright (c) Siemens AG, 2016-2020
 *
 * This program is free software; you can redistribute it and/or modify
 * it under the terms of the GNU General Public License as published by
 * the Free Software Foundation; either version 2 of the License, or
 * (at your option) any later version.
 *
 * This program is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 * GNU General Public License for more details.
 *
 * You should have received a copy of the GNU General Public License
 * along with this program; if not, see <http://www.gnu.org/licenses/>.
 */

#include <linux/kernel.h>
#include <linux/module.h>
#include <linux/pci.h>
#include <linux/io.h>
#include <linux/bitops.h>
#include <linux/interrupt.h>
#include <linux/netdevice.h>
#include <linux/etherdevice.h>
#include <linux/rtnetlink.h>
#include <linux/virtio_ring.h>

#ifndef PCI_DEVICE_ID_IVSHMEM
#define PCI_DEVICE_ID_IVSHMEM      0x4106
#endif

#define IVSHM_PROTO_NET            0x0001

#include "ivshmem.h"

#define DRV_NAME "ivshmem-net"

#define IVSHM_NET_STATE_RESET=09=090
#define IVSHM_NET_STATE_INIT=09=091
#define IVSHM_NET_STATE_READY=09=092
#define IVSHM_NET_STATE_RUN=09=093

#define IVSHM_NET_FLAG_RUN=09=090

#define IVSHM_NET_MTU_DEF=09=0916384

#define IVSHM_NET_FRAME_SIZE(s) ALIGN(18 + (s), SMP_CACHE_BYTES)

#define IVSHM_NET_VQ_ALIGN 64

#define IVSHM_NET_SECTION_TX=09=090
#define IVSHM_NET_SECTION_RX=09=091

#define IVSHM_NET_MSIX_STATE=09=090
#define IVSHM_NET_MSIX_TX_RX=09=091

#define IVSHM_NET_NUM_VECTORS=09=092

//ivshm_net virtue=E9=98=9F=E5=88=97=E7=BB=93=E6=9E=84=E4=BD=93
struct ivshm_net_queue {
=09struct vring vr;
=09u32 free_head;
=09u32 num_free;
=09u32 num_added;
=09u16 last_avail_idx;
=09u16 last_used_idx;

=09void *data;
=09void *end;
=09u32 size;
=09u32 head;
=09u32 tail;
};

//ivshm =E7=8A=B6=E6=80=81=E4=BF=A1=E6=81=AF
struct ivshm_net_stats {
=09u32 tx_rx_interrupts;
=09u32 tx_packets;
=09u32 tx_notify;
=09u32 tx_pause;
=09u32 rx_packets;
=09u32 rx_notify;
=09u32 napi_poll;
=09u32 napi_complete;
=09u32 napi_poll_n[10];
};

//ivshm_net=E8=AE=BE=E5=A4=87=E7=BB=93=E6=9E=84  =E4=B8=A4=E4=B8=AAvirtue=
=E9=98=9F=E5=88=97 =E4=B8=A4=E4=B8=AAshmem=E5=8C=BA=E5=9F=9F
struct ivshm_net {
=09struct ivshm_net_queue rx;
=09struct ivshm_net_queue tx;

=09u32 vrsize;
=09u32 qlen;
=09u32 qsize;

=09struct napi_struct napi;

=09u32 state;
=09u32 last_peer_state;
=09u32 *state_table;

=09unsigned long flags;

=09struct workqueue_struct *state_wq;
=09struct work_struct state_work;

=09struct ivshm_net_stats stats;

=09struct ivshm_regs __iomem *ivshm_regs;
=09void *shm[2];
=09resource_size_t shmlen;
=09u32 peer_id;

=09u32 tx_rx_vector;

=09struct pci_dev *pdev;
};

static void *ivshm_net_desc_data(struct ivshm_net *in,
=09=09=09=09 struct ivshm_net_queue *q,
=09=09=09=09 unsigned int region,
=09=09=09=09 struct vring_desc *desc,
=09=09=09=09 u32 *len)
{
=09u64 offs =3D READ_ONCE(desc->addr);
=09u32 dlen =3D READ_ONCE(desc->len);
=09u16 flags =3D READ_ONCE(desc->flags);
=09void *data;

=09if (flags)
=09=09return NULL;

=09if (offs >=3D in->shmlen)
=09=09return NULL;

=09data =3D in->shm[region] + offs;

=09if (data < q->data || data >=3D q->end)
=09=09return NULL;

=09if (dlen > q->end - data)
=09=09return NULL;

=09*len =3D dlen;

=09return data;
}

static void ivshm_net_init_queue(struct ivshm_net *in,
=09=09=09=09 struct ivshm_net_queue *q,
=09=09=09=09 void *mem, unsigned int len)
{
=09memset(q, 0, sizeof(*q));

=09vring_init(&q->vr, len, mem, IVSHM_NET_VQ_ALIGN);
=09q->data =3D mem + in->vrsize;
=09q->end =3D q->data + in->qsize;
=09q->size =3D in->qsize;
}

static void ivshm_net_init_queues(struct net_device *ndev)
{
=09struct ivshm_net *in =3D netdev_priv(ndev);
=09void *tx;
=09void *rx;
=09int i;

=09tx =3D in->shm[IVSHM_NET_SECTION_TX];
=09rx =3D in->shm[IVSHM_NET_SECTION_RX];

=09memset(tx, 0, in->shmlen);

=09ivshm_net_init_queue(in, &in->tx, tx, in->qlen);
=09ivshm_net_init_queue(in, &in->rx, rx, in->qlen);

=09swap(in->rx.vr.used, in->tx.vr.used);

=09in->tx.num_free =3D in->tx.vr.num;

=09for (i =3D 0; i < in->tx.vr.num - 1; i++)
=09=09in->tx.vr.desc[i].next =3D i + 1;
}

static int ivshm_net_calc_qsize(struct net_device *ndev)
{
=09struct ivshm_net *in =3D netdev_priv(ndev);
=09unsigned int vrsize;
=09unsigned int qsize;
=09unsigned int qlen;

=09for (qlen =3D 4096; qlen > 32; qlen >>=3D 1) {
=09=09vrsize =3D vring_size(qlen, IVSHM_NET_VQ_ALIGN);
=09=09vrsize =3D ALIGN(vrsize, IVSHM_NET_VQ_ALIGN);
=09=09if (vrsize < in->shmlen / 8)
=09=09=09break;
=09}

=09if (vrsize > in->shmlen)
=09=09return -EINVAL;

=09qsize =3D in->shmlen - vrsize;

=09if (qsize < 4 * ETH_MIN_MTU)
=09=09return -EINVAL;

=09in->vrsize =3D vrsize;
=09in->qlen =3D qlen;
=09in->qsize =3D qsize;

=09return 0;
}

static void ivshm_net_notify_tx(struct ivshm_net *in, unsigned int num)
{
=09u16 evt, old, new;

=09virt_mb();

=09evt =3D READ_ONCE(vring_avail_event(&in->tx.vr));
=09old =3D in->tx.last_avail_idx - num;
=09new =3D in->tx.last_avail_idx;

=09if (vring_need_event(evt, new, old)) {
=09=09writel(in->tx_rx_vector | (in->peer_id << 16),
=09=09       &in->ivshm_regs->doorbell);
=09=09in->stats.tx_notify++;
=09}
}

static void ivshm_net_enable_rx_irq(struct ivshm_net *in)
{
=09vring_avail_event(&in->rx.vr) =3D in->rx.last_avail_idx;
=09virt_wmb();
}

static void ivshm_net_notify_rx(struct ivshm_net *in, unsigned int num)
{
=09u16 evt, old, new;

=09virt_mb();

=09evt =3D READ_ONCE(vring_used_event(&in->rx.vr));
=09old =3D in->rx.last_used_idx - num;
=09new =3D in->rx.last_used_idx;

=09if (vring_need_event(evt, new, old)) {
=09=09writel(in->tx_rx_vector | (in->peer_id << 16),
=09=09       &in->ivshm_regs->doorbell);
=09=09in->stats.rx_notify++;
=09}
}

static void ivshm_net_enable_tx_irq(struct ivshm_net *in)
{
=09vring_used_event(&in->tx.vr) =3D in->tx.last_used_idx;
=09virt_wmb();
}

static bool ivshm_net_rx_avail(struct ivshm_net *in)
{
=09virt_mb();
=09return READ_ONCE(in->rx.vr.avail->idx) !=3D in->rx.last_avail_idx;
}

static size_t ivshm_net_tx_space(struct ivshm_net *in)
{
=09struct ivshm_net_queue *tx =3D &in->tx;
=09u32 tail =3D tx->tail;
=09u32 head =3D tx->head;
=09u32 space;

=09if (head < tail)
=09=09space =3D tail - head;
=09else
=09=09space =3D max(tx->size - head, tail);

=09return space;
}

static bool ivshm_net_tx_ok(struct net_device *ndev)
{
=09struct ivshm_net *in =3D netdev_priv(ndev);

=09return in->tx.num_free >=3D 2 &&
=09=09ivshm_net_tx_space(in) >=3D 2 * IVSHM_NET_FRAME_SIZE(ndev->mtu);
}

static u32 ivshm_net_tx_advance(struct ivshm_net_queue *q, u32 *pos, u32 le=
n)
{
=09u32 p =3D *pos;

=09len =3D IVSHM_NET_FRAME_SIZE(len);

=09if (q->size - p < len)
=09=09p =3D 0;
=09*pos =3D p + len;

=09return p;
}

static bool ivshm_net_tx_clean(struct net_device *ndev)
{
=09struct ivshm_net *in =3D netdev_priv(ndev);
=09struct ivshm_net_queue *tx =3D &in->tx;
=09struct vring_used_elem *used;
=09struct vring *vr =3D &tx->vr;
=09struct vring_desc *desc;
=09struct vring_desc *fdesc;
=09u16 last =3D tx->last_used_idx;
=09unsigned int num;
=09bool tx_ok;
=09u32 fhead;

=09fdesc =3D NULL;
=09fhead =3D 0;
=09num =3D 0;

=09while (last !=3D virt_load_acquire(&vr->used->idx)) {
=09=09void *data;
=09=09u32 len;
=09=09u32 tail;

=09=09used =3D vr->used->ring + (last % vr->num);
=09=09if (used->id >=3D vr->num || used->len !=3D 1) {
=09=09=09netdev_err(ndev, "invalid tx used->id %d ->len %d\n",
=09=09=09=09   used->id, used->len);
=09=09=09break;
=09=09}

=09=09desc =3D &vr->desc[used->id];

=09=09data =3D ivshm_net_desc_data(in, &in->tx, IVSHM_NET_SECTION_TX,
=09=09=09=09=09   desc, &len);
=09=09if (!data) {
=09=09=09netdev_err(ndev, "bad tx descriptor, data =3D=3D NULL\n");
=09=09=09break;
=09=09}

=09=09tail =3D ivshm_net_tx_advance(tx, &tx->tail, len);
=09=09if (data !=3D tx->data + tail) {
=09=09=09netdev_err(ndev, "bad tx descriptor\n");
=09=09=09break;
=09=09}

=09=09if (!num)
=09=09=09fdesc =3D desc;
=09=09else
=09=09=09desc->next =3D fhead;

=09=09fhead =3D used->id;

=09=09tx->last_used_idx =3D ++last;
=09=09num++;
=09=09tx->num_free++;
=09=09BUG_ON(tx->num_free > vr->num);

=09=09tx_ok =3D ivshm_net_tx_ok(ndev);
=09=09if (!tx_ok)
=09=09=09ivshm_net_enable_tx_irq(in);
=09}

=09if (num) {
=09=09fdesc->next =3D tx->free_head;
=09=09tx->free_head =3D fhead;
=09} else {
=09=09tx_ok =3D ivshm_net_tx_ok(ndev);
=09}

=09return tx_ok;
}

static void ivshm_net_tx_poll(struct net_device *ndev)
{
=09struct netdev_queue *txq =3D netdev_get_tx_queue(ndev, 0);

=09if (!__netif_tx_trylock(txq))
=09=09return;

=09if (ivshm_net_tx_clean(ndev) && netif_queue_stopped(ndev))
=09=09netif_wake_queue(ndev);

=09__netif_tx_unlock(txq);
}

static struct vring_desc *ivshm_net_rx_desc(struct net_device *ndev)
{
=09struct ivshm_net *in =3D netdev_priv(ndev);
=09struct ivshm_net_queue *rx =3D &in->rx;
=09struct vring *vr =3D &rx->vr;
=09unsigned int avail;
=09u16 avail_idx;

=09avail_idx =3D virt_load_acquire(&vr->avail->idx);

=09if (avail_idx =3D=3D rx->last_avail_idx)
=09=09return NULL;

=09avail =3D vr->avail->ring[rx->last_avail_idx++ & (vr->num - 1)];
=09if (avail >=3D vr->num) {
=09=09netdev_err(ndev, "invalid rx avail %d\n", avail);
=09=09return NULL;
=09}

=09return &vr->desc[avail];
}

static void ivshm_net_rx_finish(struct ivshm_net *in, struct vring_desc *de=
sc)
{
=09struct ivshm_net_queue *rx =3D &in->rx;
=09struct vring *vr =3D &rx->vr;
=09unsigned int desc_id =3D desc - vr->desc;
=09unsigned int used;

=09used =3D rx->last_used_idx++ & (vr->num - 1);
=09vr->used->ring[used].id =3D desc_id;
=09vr->used->ring[used].len =3D 1;

=09virt_store_release(&vr->used->idx, rx->last_used_idx);
}

static int ivshm_net_poll(struct napi_struct *napi, int budget)
{
=09struct net_device *ndev =3D napi->dev;
=09struct ivshm_net *in =3D container_of(napi, struct ivshm_net, napi);
=09int received =3D 0;

=09in->stats.napi_poll++;

=09ivshm_net_tx_poll(ndev);

=09while (received < budget) {
=09=09struct vring_desc *desc;
=09=09struct sk_buff *skb;
=09=09void *data;
=09=09u32 len;

=09=09desc =3D ivshm_net_rx_desc(ndev);
=09=09if (!desc)
=09=09=09break;

=09=09data =3D ivshm_net_desc_data(in, &in->rx, IVSHM_NET_SECTION_RX,
=09=09=09=09=09   desc, &len);
=09=09if (!data) {
=09=09=09netdev_err(ndev, "bad rx descriptor\n");
=09=09=09break;
=09=09}

=09=09skb =3D napi_alloc_skb(napi, len);

=09=09if (skb) {
=09=09=09memcpy(skb_put(skb, len), data, len);
=09=09=09skb->protocol =3D eth_type_trans(skb, ndev);
=09=09=09napi_gro_receive(napi, skb);
=09=09}

=09=09ndev->stats.rx_packets++;
=09=09ndev->stats.rx_bytes +=3D len;

=09=09ivshm_net_rx_finish(in, desc);
=09=09received++;
=09}

=09if (received < budget) {
=09=09in->stats.napi_complete++;
=09=09napi_complete_done(napi, received);
=09=09ivshm_net_enable_rx_irq(in);
=09=09if (ivshm_net_rx_avail(in))
=09=09=09napi_schedule(napi);
=09}

=09if (received)
=09=09ivshm_net_notify_rx(in, received);

=09in->stats.rx_packets +=3D received;
=09in->stats.napi_poll_n[received ? 1 + min(ilog2(received), 8) : 0]++;

=09return received;
}

static netdev_tx_t ivshm_net_xmit(struct sk_buff *skb, struct net_device *n=
dev)
{
=09struct ivshm_net *in =3D netdev_priv(ndev);
=09struct ivshm_net_queue *tx =3D &in->tx;
=09bool xmit_more =3D netdev_xmit_more();
=09struct vring *vr =3D &tx->vr;
=09struct vring_desc *desc;
=09unsigned int desc_idx;
=09unsigned int avail;
=09u32 head;
=09void *buf;

=09if (!ivshm_net_tx_clean(ndev)) {
=09=09netif_stop_queue(ndev);

=09=09netdev_err(ndev, "BUG: tx ring full when queue awake!\n");
=09=09return NETDEV_TX_BUSY;
=09}

=09desc_idx =3D tx->free_head;
=09desc =3D &vr->desc[desc_idx];
=09tx->free_head =3D desc->next;
=09tx->num_free--;

=09head =3D ivshm_net_tx_advance(tx, &tx->head, skb->len);

=09if (!ivshm_net_tx_ok(ndev)) {
=09=09ivshm_net_enable_tx_irq(in);
=09=09netif_stop_queue(ndev);
=09=09xmit_more =3D false;
=09=09in->stats.tx_pause++;
=09}

=09buf =3D tx->data + head;
=09skb_copy_and_csum_dev(skb, buf);

=09desc->addr =3D buf - in->shm[IVSHM_NET_SECTION_TX];
=09desc->len =3D skb->len;
=09desc->flags =3D 0;

=09avail =3D tx->last_avail_idx++ & (vr->num - 1);
=09vr->avail->ring[avail] =3D desc_idx;
=09tx->num_added++;

=09virt_store_release(&vr->avail->idx, tx->last_avail_idx);

=09if (!xmit_more) {
=09=09ivshm_net_notify_tx(in, tx->num_added);
=09=09tx->num_added =3D 0;
=09}

=09in->stats.tx_packets++;
=09ndev->stats.tx_packets++;
=09ndev->stats.tx_bytes +=3D skb->len;

=09dev_consume_skb_any(skb);

=09return NETDEV_TX_OK;
}

static void ivshm_net_set_state(struct ivshm_net *in, u32 state)
{
=09virt_wmb();
=09WRITE_ONCE(in->state, state);
=09writel(state, &in->ivshm_regs->state);
}

static void ivshm_net_run(struct net_device *ndev)
{
=09struct ivshm_net *in =3D netdev_priv(ndev);

=09if (in->state < IVSHM_NET_STATE_READY)
=09=09return;

=09if (!netif_running(ndev))
=09=09return;

=09if (test_and_set_bit(IVSHM_NET_FLAG_RUN, &in->flags))
=09=09return;

=09netif_start_queue(ndev);
=09napi_enable(&in->napi);
=09napi_schedule(&in->napi);
=09ivshm_net_set_state(in, IVSHM_NET_STATE_RUN);
}

static void ivshm_net_do_stop(struct net_device *ndev)
{
=09struct ivshm_net *in =3D netdev_priv(ndev);

=09ivshm_net_set_state(in, IVSHM_NET_STATE_RESET);

=09if (!test_and_clear_bit(IVSHM_NET_FLAG_RUN, &in->flags))
=09=09return;

=09netif_stop_queue(ndev);
=09napi_disable(&in->napi);
}

static void ivshm_net_state_change(struct work_struct *work)
{
=09struct ivshm_net *in =3D container_of(work, struct ivshm_net, state_work=
);
=09struct net_device *ndev =3D in->napi.dev;
=09u32 peer_state =3D READ_ONCE(in->state_table[in->peer_id]);

=09switch (in->state) {
=09case IVSHM_NET_STATE_RESET:
=09=09/*
=09=09 * Wait for the remote to leave READY/RUN before transitioning
=09=09 * to INIT.
=09=09 */
=09=09if (peer_state < IVSHM_NET_STATE_READY)
=09=09=09ivshm_net_set_state(in, IVSHM_NET_STATE_INIT);
=09=09break;

=09case IVSHM_NET_STATE_INIT:
=09=09/*
=09=09 * Wait for the remote to leave RESET before performing the
=09=09 * initialization and moving to READY.
=09=09 */
=09=09if (peer_state > IVSHM_NET_STATE_RESET) {
=09=09=09ivshm_net_init_queues(ndev);
=09=09=09ivshm_net_set_state(in, IVSHM_NET_STATE_READY);

=09=09=09rtnl_lock();
=09=09=09call_netdevice_notifiers(NETDEV_CHANGEADDR, ndev);
=09=09=09rtnl_unlock();
=09=09}
=09=09break;

=09case IVSHM_NET_STATE_READY:
=09=09/*
=09=09 * Link is up and we are running once the remote is in READY or
=09=09 * RUN.
=09=09 */
=09=09if (peer_state >=3D IVSHM_NET_STATE_READY) {
=09=09=09netif_carrier_on(ndev);
=09=09=09ivshm_net_run(ndev);
=09=09=09break;
=09=09}
=09=09/* fall through */
=09case IVSHM_NET_STATE_RUN:
=09=09/*
=09=09 * If the remote goes to RESET, we need to follow immediately.
=09=09 */
=09=09if (peer_state =3D=3D IVSHM_NET_STATE_RESET) {
=09=09=09netif_carrier_off(ndev);
=09=09=09ivshm_net_do_stop(ndev);
=09=09}
=09=09break;
=09}

=09virt_wmb();
=09WRITE_ONCE(in->last_peer_state, peer_state);
}

static void ivshm_net_check_state(struct ivshm_net *in)
{
=09if (in->state_table[in->peer_id] !=3D in->last_peer_state ||
=09    !test_bit(IVSHM_NET_FLAG_RUN, &in->flags))
=09=09queue_work(in->state_wq, &in->state_work);
}

static irqreturn_t ivshm_net_int_state(int irq, void *data)
{
=09struct ivshm_net *in =3D data;

=09ivshm_net_check_state(in);

=09return IRQ_HANDLED;
}

static irqreturn_t ivshm_net_int_tx_rx(int irq, void *data)
{
=09struct ivshm_net *in =3D data;

=09in->stats.tx_rx_interrupts++;

=09napi_schedule_irqoff(&in->napi);

=09return IRQ_HANDLED;
}

static irqreturn_t ivshm_net_intx(int irq, void *data)
{
=09ivshm_net_int_state(irq, data);
=09ivshm_net_int_tx_rx(irq, data);

=09return IRQ_HANDLED;
}

static int ivshm_net_open(struct net_device *ndev)
{
=09netdev_reset_queue(ndev);
=09ndev->operstate =3D IF_OPER_UP;
=09ivshm_net_run(ndev);

=09return 0;
}

static int ivshm_net_stop(struct net_device *ndev)
{
=09ndev->operstate =3D IF_OPER_DOWN;
=09ivshm_net_do_stop(ndev);

=09return 0;
}

static int ivshm_net_change_mtu(struct net_device *ndev, int mtu)
{
=09if (netif_running(ndev)) {
=09=09netdev_err(ndev, "must be stopped to change its MTU\n");
=09=09return -EBUSY;
=09}

=09ndev->mtu =3D mtu;

=09return 0;
}

#ifdef CONFIG_NET_POLL_CONTROLLER
static void ivshm_net_poll_controller(struct net_device *ndev)
{
=09struct ivshm_net *in =3D netdev_priv(ndev);

=09napi_schedule(&in->napi);
}
#endif

static const struct net_device_ops ivshm_net_ops =3D {
=09.ndo_open=09=09=3D ivshm_net_open,
=09.ndo_stop=09=09=3D ivshm_net_stop,
=09.ndo_start_xmit=09=09=3D ivshm_net_xmit,
=09.ndo_change_mtu=09=09=3D ivshm_net_change_mtu,
=09.ndo_set_mac_address =09=3D eth_mac_addr,
=09.ndo_validate_addr=09=3D eth_validate_addr,
#ifdef CONFIG_NET_POLL_CONTROLLER
=09.ndo_poll_controller=09=3D ivshm_net_poll_controller,
#endif
};

static const char ivshm_net_stats[][ETH_GSTRING_LEN] =3D {
=09"tx_rx_interrupts",
=09"tx_packets",
=09"tx_notify",
=09"tx_pause",
=09"rx_packets",
=09"rx_notify",
=09"napi_poll",
=09"napi_complete",
=09"napi_poll_0",
=09"napi_poll_1",
=09"napi_poll_2",
=09"napi_poll_4",
=09"napi_poll_8",
=09"napi_poll_16",
=09"napi_poll_32",
=09"napi_poll_64",
=09"napi_poll_128",
=09"napi_poll_256",
};

#define NUM_STATS ARRAY_SIZE(ivshm_net_stats)

static int ivshm_net_get_sset_count(struct net_device *ndev, int sset)
{
=09if (sset =3D=3D ETH_SS_STATS)
=09=09return NUM_STATS;

=09return -EOPNOTSUPP;
}

static void ivshm_net_get_strings(struct net_device *ndev, u32 sset, u8 *bu=
f)
{
=09if (sset =3D=3D ETH_SS_STATS)
=09=09memcpy(buf, &ivshm_net_stats, sizeof(ivshm_net_stats));
}

static void ivshm_net_get_ethtool_stats(struct net_device *ndev,
=09=09=09=09=09struct ethtool_stats *estats, u64 *st)
{
=09struct ivshm_net *in =3D netdev_priv(ndev);
=09unsigned int n =3D 0;
=09unsigned int i;

=09st[n++] =3D in->stats.tx_rx_interrupts;
=09st[n++] =3D in->stats.tx_packets;
=09st[n++] =3D in->stats.tx_notify;
=09st[n++] =3D in->stats.tx_pause;
=09st[n++] =3D in->stats.rx_packets;
=09st[n++] =3D in->stats.rx_notify;
=09st[n++] =3D in->stats.napi_poll;
=09st[n++] =3D in->stats.napi_complete;

=09for (i =3D 0; i < ARRAY_SIZE(in->stats.napi_poll_n); i++)
=09=09st[n++] =3D in->stats.napi_poll_n[i];

=09memset(&in->stats, 0, sizeof(in->stats));
}

#define IVSHM_NET_REGS_LEN=09(3 * sizeof(u32) + 6 * sizeof(u16))

static int ivshm_net_get_regs_len(struct net_device *ndev)
{
=09return IVSHM_NET_REGS_LEN;
}

static void ivshm_net_get_regs(struct net_device *ndev,
=09=09=09       struct ethtool_regs *regs, void *p)
{
=09struct ivshm_net *in =3D netdev_priv(ndev);
=09u32 *reg32 =3D p;
=09u16 *reg16;

=09*reg32++ =3D in->state;
=09*reg32++ =3D in->last_peer_state;
=09*reg32++ =3D in->qlen;

=09reg16 =3D (u16 *)reg32;

=09*reg16++ =3D in->tx.vr.avail ? in->tx.vr.avail->idx : 0;
=09*reg16++ =3D in->tx.vr.used ? in->tx.vr.used->idx : 0;
=09*reg16++ =3D in->tx.vr.avail ? vring_avail_event(&in->tx.vr) : 0;

=09*reg16++ =3D in->rx.vr.avail ? in->rx.vr.avail->idx : 0;
=09*reg16++ =3D in->rx.vr.used ? in->rx.vr.used->idx : 0;
=09*reg16++ =3D in->rx.vr.avail ? vring_avail_event(&in->rx.vr) : 0;
}

static const struct ethtool_ops ivshm_net_ethtool_ops =3D {
=09.get_sset_count=09=09=3D ivshm_net_get_sset_count,
=09.get_strings=09=09=3D ivshm_net_get_strings,
=09.get_ethtool_stats=09=3D ivshm_net_get_ethtool_stats,
=09.get_regs_len=09=09=3D ivshm_net_get_regs_len,
=09.get_regs=09=09=3D ivshm_net_get_regs,
};

static u64 get_config_qword(struct pci_dev *pdev, unsigned int pos)
{
=09u32 lo, hi;

=09pci_read_config_dword(pdev, pos, &lo);
=09pci_read_config_dword(pdev, pos + 4, &hi);
=09return lo | ((u64)hi << 32);
}

static int ivshm_net_probe(struct pci_dev *pdev,
=09=09=09   const struct pci_device_id *pci_id)
{
=09phys_addr_t output_sections_addr, section_addr;
=09resource_size_t section_sz, output_section_sz;
=09void *state_table, *output_sections;
=09struct ivshm_regs __iomem *regs;
=09struct net_device *ndev;
=09struct ivshm_net *in;
=09unsigned int cap_pos;
=09char *device_name;
=09int vendor_cap;
=09u32 id, dword;
=09int ret;

  dev_info(&pdev->dev, "Probed IVSHMEMNET!\n");

=09ret =3D pcim_enable_device(pdev);
=09if (ret) {
=09=09dev_err(&pdev->dev, "pci_enable_device: %d\n", ret);
=09=09return ret;
=09}

=09ret =3D pcim_iomap_regions(pdev, BIT(0), DRV_NAME);
=09if (ret) {
=09=09dev_err(&pdev->dev, "pcim_iomap_regions: %d\n", ret);
=09=09return ret;
=09}

=09regs =3D pcim_iomap_table(pdev)[0];

=09id =3D readl(&regs->id);
=09if (id > 1) {
=09=09dev_err(&pdev->dev, "invalid ID %d\n", id);
=09=09return -EINVAL;
=09}
=09if (readl(&regs->max_peers) > 2) {
=09=09dev_err(&pdev->dev, "only 2 peers supported\n");
=09=09return -EINVAL;
=09}

=09vendor_cap =3D pci_find_capability(pdev, PCI_CAP_ID_VNDR);
=09if (vendor_cap < 0) {
=09=09dev_err(&pdev->dev, "missing vendor capability\n");
=09=09return -EINVAL;
=09}

=09if (pci_resource_len(pdev, 2) > 0) {
=09=09section_addr =3D pci_resource_start(pdev, 2);
=09} else {
=09=09cap_pos =3D vendor_cap + IVSHM_CFG_ADDRESS;
=09=09section_addr =3D get_config_qword(pdev, cap_pos);
=09}

=09cap_pos =3D vendor_cap + IVSHM_CFG_STATE_TAB_SZ;
=09pci_read_config_dword(pdev, cap_pos, &dword);
=09section_sz =3D dword;

=09if (!devm_request_mem_region(&pdev->dev, section_addr, section_sz,
=09=09=09=09     DRV_NAME))
=09=09return -EBUSY;

=09state_table =3D devm_memremap(&pdev->dev, section_addr, section_sz,
=09=09=09=09    MEMREMAP_WB);
=09if (!state_table)
=09=09return -ENOMEM;

=09output_sections_addr =3D section_addr + section_sz;

=09cap_pos =3D vendor_cap + IVSHM_CFG_RW_SECTION_SZ;
=09section_sz =3D get_config_qword(pdev, cap_pos);
=09if (section_sz > 0) {
=09=09dev_info(&pdev->dev, "R/W section detected - "
=09=09=09 "unused by this driver version\n");
=09=09output_sections_addr +=3D section_sz;
=09}

=09cap_pos =3D vendor_cap + IVSHM_CFG_OUTPUT_SECTION_SZ;
=09output_section_sz =3D get_config_qword(pdev, cap_pos);
=09if (output_section_sz =3D=3D 0) {
=09=09dev_err(&pdev->dev, "Missing input/output sections\n");
=09=09return -EINVAL;
=09}

=09if (!devm_request_mem_region(&pdev->dev, output_sections_addr,
=09=09=09=09     output_section_sz * 2, DRV_NAME))
=09=09return -EBUSY;

=09output_sections =3D devm_memremap(&pdev->dev, output_sections_addr,
=09=09=09=09=09output_section_sz * 2, MEMREMAP_WB);
=09if (!output_sections)
=09=09return -ENOMEM;

=09section_addr =3D output_sections_addr + output_section_sz * id;
=09dev_info(&pdev->dev, "TX memory at %pa, size %pa\n",
=09=09 &section_addr, &output_section_sz);
=09section_addr =3D output_sections_addr + output_section_sz * !id;
=09dev_info(&pdev->dev, "RX memory at %pa, size %pa\n",
=09=09 &section_addr, &output_section_sz);

=09device_name =3D devm_kasprintf(&pdev->dev, GFP_KERNEL, "%s[%s]", DRV_NAM=
E,
=09=09=09=09     dev_name(&pdev->dev));
=09if (!device_name)
=09=09return -ENOMEM;

=09ndev =3D alloc_etherdev(sizeof(*in));
=09if (!ndev)
=09=09return -ENOMEM;

=09pci_set_drvdata(pdev, ndev);
=09SET_NETDEV_DEV(ndev, &pdev->dev);

=09in =3D netdev_priv(ndev);
=09in->ivshm_regs =3D regs;
=09in->state_table =3D state_table;

=09in->shm[IVSHM_NET_SECTION_TX] =3D
=09=09output_sections + output_section_sz * id;
=09in->shm[IVSHM_NET_SECTION_RX] =3D
=09=09output_sections + output_section_sz * !id;

=09in->shmlen =3D output_section_sz;

=09in->peer_id =3D !id;
=09in->pdev =3D pdev;

=09ret =3D ivshm_net_calc_qsize(ndev);
=09if (ret)
=09=09goto err_free;

=09in->state_wq =3D alloc_ordered_workqueue(device_name, 0);
=09if (!in->state_wq)
=09=09goto err_free;

=09INIT_WORK(&in->state_work, ivshm_net_state_change);

=09eth_random_addr(ndev->dev_addr);
=09ndev->netdev_ops =3D &ivshm_net_ops;
=09ndev->ethtool_ops =3D &ivshm_net_ethtool_ops;
=09ndev->mtu =3D min_t(u32, IVSHM_NET_MTU_DEF, in->qsize / 16);
=09ndev->min_mtu =3D ETH_MIN_MTU;
=09ndev->max_mtu =3D min_t(u32, ETH_MAX_MTU, in->qsize / 4);
=09ndev->hw_features =3D NETIF_F_HW_CSUM | NETIF_F_SG;
=09ndev->features =3D ndev->hw_features;

=09netif_carrier_off(ndev);
=09netif_napi_add(ndev, &in->napi, ivshm_net_poll, NAPI_POLL_WEIGHT);

=09ret =3D register_netdev(ndev);
=09if (ret)
=09=09goto err_wq;

=09ret =3D pci_alloc_irq_vectors(pdev, 1, 2, PCI_IRQ_LEGACY | PCI_IRQ_MSIX)=
;
=09if (ret < 0)
=09=09goto err_alloc_irq;

=09if (pdev->msix_enabled) {
=09=09if (ret !=3D 2) {
=09=09=09ret =3D -EBUSY;
=09=09=09goto err_request_irq;
=09=09}

=09=09device_name =3D devm_kasprintf(&pdev->dev, GFP_KERNEL,
=09=09=09=09=09     "%s-state[%s]", DRV_NAME,
=09=09=09=09=09     dev_name(&pdev->dev));
=09=09if (!device_name) {
=09=09=09ret =3D -ENOMEM;
=09=09=09goto err_request_irq;
=09=09}

=09=09ret =3D request_irq(pci_irq_vector(pdev, IVSHM_NET_MSIX_STATE),
=09=09=09=09  ivshm_net_int_state, 0, device_name, in);
=09=09if (ret)
=09=09=09goto err_request_irq;

=09=09device_name =3D devm_kasprintf(&pdev->dev, GFP_KERNEL,
=09=09=09=09=09     "%s-tx-rx[%s]", DRV_NAME,
=09=09=09=09=09     dev_name(&pdev->dev));
=09=09if (!device_name) {
=09=09=09ret =3D -ENOMEM;
=09=09=09goto err_request_irq2;
=09=09}

=09=09ret =3D request_irq(pci_irq_vector(pdev, IVSHM_NET_MSIX_TX_RX),
=09=09=09=09  ivshm_net_int_tx_rx, 0, device_name, in);
=09=09if (ret)
=09=09=09goto err_request_irq2;

=09=09in->tx_rx_vector =3D IVSHM_NET_MSIX_TX_RX;
=09} else {
=09=09ret =3D request_irq(pci_irq_vector(pdev, 0), ivshm_net_intx, 0,
=09=09=09=09  device_name, in);
=09=09if (ret)
=09=09=09goto err_request_irq;

=09=09in->tx_rx_vector =3D 0;
=09}

=09pci_set_master(pdev);

=09pci_write_config_byte(pdev, vendor_cap + IVSHM_CFG_PRIV_CNTL, 0);
=09writel(IVSHM_INT_ENABLE, &in->ivshm_regs->int_control);

=09writel(IVSHM_NET_STATE_RESET, &in->ivshm_regs->state);
=09ivshm_net_check_state(in);

=09return 0;

err_request_irq2:
=09free_irq(pci_irq_vector(pdev, IVSHM_NET_MSIX_STATE), in);
err_request_irq:
=09pci_free_irq_vectors(pdev);
err_alloc_irq:
=09unregister_netdev(ndev);
err_wq:
=09destroy_workqueue(in->state_wq);
err_free:
=09free_netdev(ndev);

=09return ret;
}

static void ivshm_net_remove(struct pci_dev *pdev)
{
=09struct net_device *ndev =3D pci_get_drvdata(pdev);
=09struct ivshm_net *in =3D netdev_priv(ndev);

=09writel(IVSHM_NET_STATE_RESET, &in->ivshm_regs->state);
=09writel(0, &in->ivshm_regs->int_control);

=09if (pdev->msix_enabled) {
=09=09free_irq(pci_irq_vector(pdev, IVSHM_NET_MSIX_STATE), in);
=09=09free_irq(pci_irq_vector(pdev, IVSHM_NET_MSIX_TX_RX), in);
=09} else {
=09=09free_irq(pci_irq_vector(pdev, 0), in);
=09}
=09pci_free_irq_vectors(pdev);

=09unregister_netdev(ndev);
=09cancel_work_sync(&in->state_work);
=09destroy_workqueue(in->state_wq);
=09free_netdev(ndev);
}

static const struct pci_device_id ivshm_net_id_table[] =3D {
=09{ PCI_DEVICE(PCI_VENDOR_ID_SIEMENS, PCI_DEVICE_ID_IVSHMEM),
=09  (PCI_CLASS_OTHERS << 16) | IVSHM_PROTO_NET, 0xffffff },
=09{ 0 }
};
MODULE_DEVICE_TABLE(pci, ivshm_net_id_table);

static struct pci_driver ivshm_net_driver =3D {
=09.name=09=09=3D DRV_NAME,
=09.id_table=09=3D ivshm_net_id_table,
=09.probe=09=09=3D ivshm_net_probe,
=09.remove=09=09=3D ivshm_net_remove,
};
module_pci_driver(ivshm_net_driver);

MODULE_AUTHOR("Mans Rullgard <mans@mansr.com>");
MODULE_LICENSE("GPL");

------=_Part_22246_1599101656.1640535693925
Content-Type: text/x-csrc; charset=US-ASCII; name=sysconfig-3.c
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename=sysconfig-3.c
X-Attachment-Id: 84babfc7-e819-411f-b947-d8fcafdbd1c9
Content-ID: <84babfc7-e819-411f-b947-d8fcafdbd1c9>

/*
 * Jailhouse, a Linux-based partitioning hypervisor
 *
 * Copyright (c) Siemens AG, 2014-2017
 *
 * This work is licensed under the terms of the GNU GPL, version 2.  See
 * the COPYING file in the top-level directory.
 *
 * Alternatively, you can use or redistribute this file under the following
 * BSD license:
 *
 * Redistribution and use in source and binary forms, with or without
 * modification, are permitted provided that the following conditions
 * are met:
 *
 * 1. Redistributions of source code must retain the above copyright
 *    notice, this list of conditions and the following disclaimer.
 *
 * 2. Redistributions in binary form must reproduce the above copyright
 *    notice, this list of conditions and the following disclaimer in the
 *    documentation and/or other materials provided with the distribution.
 *
 * THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS"
 * AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE
 * IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE
 * ARE DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT HOLDER OR CONTRIBUTORS BE
 * LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR
 * CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF
 * SUBSTITUTE GOODS OR SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESS
 * INTERRUPTION) HOWEVER CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN
 * CONTRACT, STRICT LIABILITY, OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE)
 * ARISING IN ANY WAY OUT OF THE USE OF THIS SOFTWARE, EVEN IF ADVISED OF
 * THE POSSIBILITY OF SUCH DAMAGE.
 *
 * Configuration for QEMU Standard PC (Q35 + ICH9, 2009)
 * created with '/usr/local/libexec/jailhouse/jailhouse config create -c ttyS0 --mem-hv 128M --mem-inmates 1536M configs/x86/sysconfig.c'
 *
 * NOTE: This config expects the following to be appended to your kernel cmdline
 *       "memmap=0x68000000$0x16e000000"
 */

#include <jailhouse/types.h>
#include <jailhouse/cell-config.h>

struct {
	struct jailhouse_system header;
	__u64 cpus[1];
	struct jailhouse_memory mem_regions[24];
	struct jailhouse_irqchip irqchips[1];
	struct jailhouse_pio pio_regions[13];
	struct jailhouse_pci_device pci_devices[9];
	struct jailhouse_pci_capability pci_caps[9];
} __attribute__((packed)) config = {
	.header = {
		.signature = JAILHOUSE_SYSTEM_SIGNATURE,
		.revision = JAILHOUSE_CONFIG_REVISION,
		.flags = JAILHOUSE_SYS_VIRTUAL_DEBUG_CONSOLE,
		.hypervisor_memory = {
			.phys_start = 0x16e000000,
			.size = 0x8000000,
		},
		.debug_console = {
			.address = 0x3f8,
			.type = JAILHOUSE_CON_TYPE_8250,
			.flags = JAILHOUSE_CON_ACCESS_PIO |
				 JAILHOUSE_CON_REGDIST_1,
		},
		.platform_info = {
			.pci_mmconfig_base = 0xb0000000,
			.pci_mmconfig_end_bus = 0xff,
			.x86 = {
				.pm_timer_address = 0x608,
				.vtd_interrupt_limit = 128,
				.iommu_units = {
					{
						.type = JAILHOUSE_IOMMU_INTEL,
						.base = 0xfed90000,
						.size = 0x1000,
					},
				},
			},
		},
		.root_cell = {
			.name = "RootCell",
			.cpu_set_size = sizeof(config.cpus),
			.num_memory_regions = ARRAY_SIZE(config.mem_regions),
			.num_irqchips = ARRAY_SIZE(config.irqchips),
			.num_pio_regions = ARRAY_SIZE(config.pio_regions),
			.num_pci_devices = ARRAY_SIZE(config.pci_devices),
			.num_pci_caps = ARRAY_SIZE(config.pci_caps),
		},
	},

	.cpus = {
		0x000000000000000f,
	},

	.mem_regions = {
		/* MemRegion: 00000000-0009fbff : System RAM */
		{
			.phys_start = 0x0,
			.virt_start = 0x0,
			.size = 0xa0000,
			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
				JAILHOUSE_MEM_EXECUTE | JAILHOUSE_MEM_DMA,
		},
		/* MemRegion: 00100000-14ffffff : System RAM */
		{
			.phys_start = 0x100000,
			.virt_start = 0x100000,
			.size = 0x14f00000,
			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
				JAILHOUSE_MEM_EXECUTE | JAILHOUSE_MEM_DMA,
		},
		/* MemRegion: 15000000-16ffffff : Kernel */
		{
			.phys_start = 0x15000000,
			.virt_start = 0x15000000,
			.size = 0x2000000,
			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
				JAILHOUSE_MEM_EXECUTE | JAILHOUSE_MEM_DMA,
		},
		/* MemRegion: 17000000-7ffdefff : System RAM */
		{
			.phys_start = 0x17000000,
			.virt_start = 0x17000000,
			.size = 0x68fdf000,
			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
				JAILHOUSE_MEM_EXECUTE | JAILHOUSE_MEM_DMA,
		},
		/* MemRegion: fd000000-fdffffff : 0000:00:01.0 */
		{
			.phys_start = 0xfd000000,
			.virt_start = 0xfd000000,
			.size = 0x1000000,
			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE,
		},
		/* MemRegion: feb40000-feb7ffff : 0000:00:02.0 */
		{
			.phys_start = 0xfeb40000,
			.virt_start = 0xfeb40000,
			.size = 0x40000,
			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE,
		},
		/* MemRegion: feb80000-feb9ffff : e1000e */
		{
			.phys_start = 0xfeb80000,
			.virt_start = 0xfeb80000,
			.size = 0x20000,
			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE,
		},
		/* MemRegion: feba0000-febbffff : e1000e */
		{
			.phys_start = 0xfeba0000,
			.virt_start = 0xfeba0000,
			.size = 0x20000,
			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE,
		},
		/* MemRegion: febd1000-febd3fff : e1000e */
		{
			.phys_start = 0xfebd1000,
			.virt_start = 0xfebd1000,
			.size = 0x3000,
			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE,
		},
		/* MemRegion: febd4000-febd7fff : ICH HD audio */
		{
			.phys_start = 0xfebd4000,
			.virt_start = 0xfebd4000,
			.size = 0x4000,
			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE,
		},
		/* MemRegion: febd8000-febd8fff : 0000:00:01.0 */
		{
			.phys_start = 0xfebd8000,
			.virt_start = 0xfebd8000,
			.size = 0x1000,
			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE,
		},
		/* MemRegion: febd9000-febd9fff : ahci */
		{
			.phys_start = 0xfebd9000,
			.virt_start = 0xfebd9000,
			.size = 0x1000,
			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE,
		},
		/* MemRegion: fed00000-fed003ff : PNP0103:00 */
		{
			.phys_start = 0xfed00000,
			.virt_start = 0xfed00000,
			.size = 0x1000,
			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE,
		},
		/* MemRegion: 100000000-16dffffff : System RAM */
		{
			.phys_start = 0x100000000,
			.virt_start = 0x100000000,
			.size = 0x6e000000,
			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
				JAILHOUSE_MEM_EXECUTE | JAILHOUSE_MEM_DMA,
		},
		/* MemRegion: 1d6000000-27fffffff : System RAM */
		{
			.phys_start = 0x1d6000000,
			.virt_start = 0x1d6000000,
			.size = 0xaa000000,
			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
				JAILHOUSE_MEM_EXECUTE | JAILHOUSE_MEM_DMA,
		},
		/* MemRegion: 000c0000-000dffff : ROMs */
		{
			.phys_start = 0xc0000,
			.virt_start = 0xc0000,
			.size = 0x20000,
			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE,
		},
		/* MemRegion: 176000000-1d5ffffff : JAILHOUSE Inmate Memory */
		{
			.phys_start = 0x176000000,
			.virt_start = 0x176000000,
			.size = 0x1000,
			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_ROOTSHARED,
		},
		{
			.phys_start = 0x176001000,
			.virt_start = 0x176001000,
			.size =        0x40000000,
			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
        JAILHOUSE_MEM_EXECUTE | JAILHOUSE_MEM_ROOTSHARED,
		},
		{
			.phys_start = 0x1b6001000,
			.virt_start = 0x1b6001000,
			.size = 0x4000,
			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE | JAILHOUSE_MEM_ROOTSHARED,
		},
		{
			.phys_start = 0x1b6005000,
			.virt_start = 0x1b6005000,
			.size = 0x4000,
			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_ROOTSHARED,
		},
		JAILHOUSE_SHMEM_NET_REGIONS(0x1b6205000, 0),
	},

	.irqchips = {
		/* IOAPIC 0, GSI base 0 */
		{
			.address = 0xfec00000,
			.id = 0xff00,
			.pin_bitmap = {
				0xffffffff, 0xffffffff, 0xffffffff, 0xffffffff
			},
		},
	},

	.pio_regions = {
		/* Port I/O: 0000-001f : dma1 */
		/* PIO_RANGE(0x0, 0x20), */
		/* Port I/O: 0020-0021 : pic1 */
		/* PIO_RANGE(0x20, 0x2), */
		/* Port I/O: 0040-0043 : timer0 */
		PIO_RANGE(0x40, 0x4),
		/* Port I/O: 0050-0053 : timer1 */
		/* PIO_RANGE(0x50, 0x4), */
		/* Port I/O: 0060-0060 : keyboard */
		PIO_RANGE(0x60, 0x1),
		/* Port I/O: 0064-0064 : keyboard */
		PIO_RANGE(0x64, 0x1),
		/* Port I/O: 0070-0077 : rtc0 */
		PIO_RANGE(0x70, 0x8),
		/* Port I/O: 0080-008f : dma page reg */
		/* PIO_RANGE(0x80, 0x10), */
		/* Port I/O: 00a0-00a1 : pic2 */
		/* PIO_RANGE(0xa0, 0x2), */
		/* Port I/O: 00c0-00df : dma2 */
		/* PIO_RANGE(0xc0, 0x20), */
		/* Port I/O: 00f0-00ff : fpu */
		/* PIO_RANGE(0xf0, 0x10), */
		/* Port I/O: 02f8-02ff : serial */
		PIO_RANGE(0x2f8, 0x8),
		/* Port I/O: 0378-037a : parport0 */
		/* PIO_RANGE(0x378, 0x3), */
		/* Port I/O: 03c0-03df : vga+ */
		PIO_RANGE(0x3c0, 0x20),
		/* Port I/O: 03e8-03ef : serial */
		/* PIO_RANGE(0x3e8, 0x8), */
		/* Port I/O: 03f8-03ff : serial */
		PIO_RANGE(0x3f8, 0x8),
		/* Port I/O: 0510-051b : fw_cfg_io */
		/* PIO_RANGE(0x510, 0xc), */
		/* Port I/O: 0600-0603 : ACPI PM1a_EVT_BLK */
		/* PIO_RANGE(0x600, 0x4), */
		/* Port I/O: 0604-0605 : ACPI PM1a_CNT_BLK */
		/* PIO_RANGE(0x604, 0x2), */
		/* Port I/O: 0608-060b : ACPI PM_TMR */
		/* PIO_RANGE(0x608, 0x4), */
		/* Port I/O: 0620-062f : ACPI GPE0_BLK */
		/* PIO_RANGE(0x620, 0x10), */
		/* Port I/O: 0630-0633 : iTCO_wdt.1.auto */
		/* PIO_RANGE(0x630, 0x4), */
		/* Port I/O: 0660-067f : iTCO_wdt.1.auto */
		/* PIO_RANGE(0x660, 0x20), */
		/* Port I/O: 0700-073f : 0000:00:1f.3 */
		/* PIO_RANGE(0x700, 0x40), */
		/* Port I/O: c040-c05f : 0000:00:02.0 */
		PIO_RANGE(0xc040, 0x20),
		/* Port I/O: c060-c07f : 0000:00:1f.2 */
		PIO_RANGE(0xc060, 0x20),
		PIO_RANGE(0x3f0, 0x8), /* floppy */
		PIO_RANGE(0x402, 0x1), /* invalid but accessed by X */
		PIO_RANGE(0x5658, 0x4), /* vmport */
		PIO_RANGE(0xc000, 0xff), /* PCI devices */
	},

	.pci_devices = {
		{ /* IVSHMEM (demo) */
			.type = JAILHOUSE_PCI_TYPE_IVSHMEM,
			.domain = 0x0,
			.iommu = 0,
			.bdf = 0x0d << 3,
			.bar_mask = JAILHOUSE_IVSHMEM_BAR_MASK_MSIX,
			.num_msix_vectors = 16,
			.shmem_regions_start = 16,
			.shmem_dev_id = 0,
			.shmem_peers = 2,
			.shmem_protocol = 0x0002,
		},
		/* IVSHMEM-NET ,*/
		{ 
			.type = JAILHOUSE_PCI_TYPE_IVSHMEM,
			.domain = 0x0,
			.iommu = 0,
			.bdf = 0x0e << 3,
			.bar_mask = JAILHOUSE_IVSHMEM_BAR_MASK_MSIX,
			.num_msix_vectors = 2,
			.shmem_regions_start = 20,
			.shmem_dev_id = 0,
			.shmem_peers = 2,
			.shmem_protocol = JAILHOUSE_SHMEM_PROTO_VETH,
		},
		/* PCIDevice: 00:00.0 */
		{
			.type = JAILHOUSE_PCI_TYPE_DEVICE,
			.iommu = 0,
			.domain = 0x0,
			.bdf = 0x0,
			.bar_mask = {
				0x00000000, 0x00000000, 0x00000000,
				0x00000000, 0x00000000, 0x00000000,
			},
			.caps_start = 0,
			.num_caps = 0,
			.num_msi_vectors = 0,
			.msi_64bits = 0,
			.msi_maskable = 0,
			.num_msix_vectors = 0,
			.msix_region_size = 0x0,
			.msix_address = 0x0,
		},
		/* PCIDevice: 00:01.0 */
		{
			.type = JAILHOUSE_PCI_TYPE_DEVICE,
			.iommu = 0,
			.domain = 0x0,
			.bdf = 0x8,
			.bar_mask = {
				0xff000000, 0x00000000, 0xfffff000,
				0x00000000, 0x00000000, 0x00000000,
			},
			.caps_start = 0,
			.num_caps = 0,
			.num_msi_vectors = 0,
			.msi_64bits = 0,
			.msi_maskable = 0,
			.num_msix_vectors = 0,
			.msix_region_size = 0x0,
			.msix_address = 0x0,
		},
		/* PCIDevice: 00:02.0 */
		{
			.type = JAILHOUSE_PCI_TYPE_DEVICE,
			.iommu = 0,
			.domain = 0x0,
			.bdf = 0x10,
			.bar_mask = {
				0xfffe0000, 0xfffe0000, 0xffffffe0,
				0xffffc000, 0x00000000, 0x00000000,
			},
			.caps_start = 0,
			.num_caps = 6,
			.num_msi_vectors = 1,
			.msi_64bits = 1,
			.msi_maskable = 0,
			.num_msix_vectors = 5,
			.msix_region_size = 0x1000,
			.msix_address = 0xfebd0000,
		},
		/* PCIDevice: 00:1b.0 */
		{
			.type = JAILHOUSE_PCI_TYPE_DEVICE,
			.iommu = 0,
			.domain = 0x0,
			.bdf = 0xd8,
			.bar_mask = {
				0xffffc000, 0x00000000, 0x00000000,
				0x00000000, 0x00000000, 0x00000000,
			},
			.caps_start = 6,
			.num_caps = 1,
			.num_msi_vectors = 1,
			.msi_64bits = 1,
			.msi_maskable = 0,
			.num_msix_vectors = 0,
			.msix_region_size = 0x0,
			.msix_address = 0x0,
		},
		/* PCIDevice: 00:1f.0 */
		{
			.type = JAILHOUSE_PCI_TYPE_DEVICE,
			.iommu = 0,
			.domain = 0x0,
			.bdf = 0xf8,
			.bar_mask = {
				0x00000000, 0x00000000, 0x00000000,
				0x00000000, 0x00000000, 0x00000000,
			},
			.caps_start = 0,
			.num_caps = 0,
			.num_msi_vectors = 0,
			.msi_64bits = 0,
			.msi_maskable = 0,
			.num_msix_vectors = 0,
			.msix_region_size = 0x0,
			.msix_address = 0x0,
		},
		/* PCIDevice: 00:1f.2 */
		{
			.type = JAILHOUSE_PCI_TYPE_DEVICE,
			.iommu = 0,
			.domain = 0x0,
			.bdf = 0xfa,
			.bar_mask = {
				0x00000000, 0x00000000, 0x00000000,
				0x00000000, 0xffffffe0, 0xfffff000,
			},
			.caps_start = 7,
			.num_caps = 2,
			.num_msi_vectors = 1,
			.msi_64bits = 1,
			.msi_maskable = 0,
			.num_msix_vectors = 0,
			.msix_region_size = 0x0,
			.msix_address = 0x0,
		},
		/* PCIDevice: 00:1f.3 */
		{
			.type = JAILHOUSE_PCI_TYPE_DEVICE,
			.iommu = 0,
			.domain = 0x0,
			.bdf = 0xfb,
			.bar_mask = {
				0x00000000, 0x00000000, 0x00000000,
				0x00000000, 0xffffffc0, 0x00000000,
			},
			.caps_start = 0,
			.num_caps = 0,
			.num_msi_vectors = 0,
			.msi_64bits = 0,
			.msi_maskable = 0,
			.num_msix_vectors = 0,
			.msix_region_size = 0x0,
			.msix_address = 0x0,
		},
	},

	.pci_caps = {
		/* PCIDevice: 00:02.0 */
		{
			.id = PCI_CAP_ID_PM,
			.start = 0xc8,
			.len = 0x8,
			.flags = JAILHOUSE_PCICAPS_WRITE,
		},
		{
			.id = PCI_CAP_ID_MSI,
			.start = 0xd0,
			.len = 0xe,
			.flags = JAILHOUSE_PCICAPS_WRITE,
		},
		{
			.id = PCI_CAP_ID_EXP,
			.start = 0xe0,
			.len = 0x14,
			.flags = 0,
		},
		{
			.id = PCI_CAP_ID_MSIX,
			.start = 0xa0,
			.len = 0xc,
			.flags = JAILHOUSE_PCICAPS_WRITE,
		},
		{
			.id = PCI_EXT_CAP_ID_ERR | JAILHOUSE_PCI_EXT_CAP,
			.start = 0x100,
			.len = 0x40,
			.flags = 0,
		},
		{
			.id = PCI_EXT_CAP_ID_DSN | JAILHOUSE_PCI_EXT_CAP,
			.start = 0x140,
			.len = 0xc,
			.flags = 0,
		},
		/* PCIDevice: 00:1b.0 */
		{
			.id = PCI_CAP_ID_MSI,
			.start = 0x60,
			.len = 0xe,
			.flags = JAILHOUSE_PCICAPS_WRITE,
		},
		/* PCIDevice: 00:1f.2 */
		{
			.id = PCI_CAP_ID_MSI,
			.start = 0x80,
			.len = 0xe,
			.flags = JAILHOUSE_PCICAPS_WRITE,
		},
		{
			.id = PCI_CAP_ID_SATA,
			.start = 0xa8,
			.len = 0x2,
			.flags = 0,
		},
	},
};

------=_Part_22246_1599101656.1640535693925
Content-Type: text/x-csrc; charset=US-ASCII; name=nuttx-net-driver.c
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename=nuttx-net-driver.c
X-Attachment-Id: a2747aa0-66c7-445f-b738-b35ca17fe930
Content-ID: <a2747aa0-66c7-445f-b738-b35ca17fe930>

/*****************************************************************************
 * drivers/net/ivhsmem_net.c
 *
 * Copyright (C) 2020  Chung-Fan Yang @ Fixstars Corporation
 *                                      <chungfan.yang@fixstars.com>
 *
 * Derived from Jailhouse Linux Ivshmem-net driver
 * Copyright 2016 Mans Rullgard <mans@mansr.com>
 * Copyright (c) Siemens AG, 2016-2020
 *
 * This program is free software; you can redistribute it and/or
 * modify it under the terms of the GNU General Public License
 * as published by the Free Software Foundation; either version 2
 * of the License, or (at your option) any later version.

 * This program is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 * GNU General Public License for more details.

 * You should have received a copy of the GNU General Public License
 * along with this program; if not, write to the Free Software
 * Foundation, Inc.,
 * 51 Franklin Street, Fifth Floor, Boston, MA  02110-1301, USA.
 *
 *****************************************************************************/

/*****************************************************************************
 * Included Files
 *****************************************************************************/

#include <nuttx/config.h>
#include <nuttx/arch.h>

#include <stdio.h>
#include <stdint.h>
#include <string.h>
#include <math.h>
#include <unistd.h>
#include <errno.h>
#include <sched.h>
#include <debug.h>

#include <arch/io.h>
#include <nuttx/pci/pci.h>
#include <nuttx/virt/ivshmem.h>
#include <nuttx/virt/virtio_ring.h>

#include <arpa/inet.h>
#include <nuttx/net/netdev.h>
#include <nuttx/net/arp.h>
#include <nuttx/net/ivshmem_net.h>

#ifdef CONFIG_NET_PKT
#  include <nuttx/net/pkt.h>
#endif

/*****************************************************************************
 * Pre-processor Definitions
 *****************************************************************************/

#define bswap16 __builtin_bswap16
#define bswap32 __builtin_bswap32
#define bswap64 __builtin_bswap64

/* Work queue support is required. */

#if !defined(CONFIG_SCHED_WORKQUEUE)
#  error Work queue support is required!
#else

/* The low priority work queue is preferred.  If it is not enabled, LPWORK
 * will be the same as HPWORK.
 */

#  if defined(CONFIG_IVSHMNET_HPWORK)
#    define ETHWORK HPWORK
#  elif defined(CONFIG_IVSHMNET_LPWORK)
#    define ETHWORK LPWORK
#  else
#    error Neither high or Low priority workqueue is defined
#  endif
#endif

/* CONFIG_IVSHMEM_NET_NINTERFACES determines the number of physical interfaces
 * that will be supported.
 */

#ifndef CONFIG_IVSHMNET_NINTERFACES
# define CONFIG_IVSHMNET_NINTERFACES 1
#endif

/* TX poll delay = 1 seconds. CLK_TCK is the number of clock ticks per second */

#define IVSHMNET_WDDELAY   (1 * CLK_TCK)

/* TX timeout = 1 minute */

#define IVSHMNET_TXTIMEOUT (20ULL * CLK_TCK)

/* This is a helper pointer for accessing the contents of the Ethernet header */

#define BUF ((struct eth_hdr_s *)priv->sk_dev.d_buf)

#define IVSHMNET_STATE_RESET    0
#define IVSHMNET_STATE_INIT     1
#define IVSHMNET_STATE_READY    2
#define IVSHMNET_STATE_RUN      3

#define IVSHMNET_FLAG_RUN       0

#define IVSHMNET_MTU_MIN        68
#define IVSHMNET_MTU_DEFAULT    16384

#define IVSHMNET_ALIGN(addr, align) (((addr) + (align - 1)) & ~(align - 1))
#define SMP_CACHE_BYTES         64
#define IVSHMNET_FRAME_SIZE(s)  IVSHMNET_ALIGN(18 + (s), SMP_CACHE_BYTES)

#define IVSHMNET_VQ_ALIGN       64

#define IVSHMNET_SECTION_ST     0
#define IVSHMNET_SECTION_TX     1
#define IVSHMNET_SECTION_RX     2

#define IVSHMNET_MSIX_STATE     0
#define IVSHMNET_MSIX_TX_RX     1

#define IVSHMNET_NUM_VECTORS    2

/*****************************************************************************
 * Private Types
 *****************************************************************************/

typedef FAR struct file        file_t;

struct ivshmnet_queue {
  struct vring vr;
  uint32_t free_head;
  uint32_t num_free;
  uint32_t num_added;
  uint16_t last_avail_idx;
  uint16_t last_used_idx;

  void *data;
  void *end;
  uint32_t size;
  uint32_t head;
  uint32_t tail;
};

struct ivshmem_mem_region_s
{
  uintptr_t       paddress;
  uintptr_t       address;
  unsigned long   size;
  bool            readonly;
};

struct ivshmnet_driver_s
{
  FAR struct pci_dev_s dev;

  FAR volatile struct jh_ivshmem_regs_s *regs;
  void *msix_table;
  uint16_t peer_id;
  uint16_t vectors;

  FAR struct ivshmem_mem_region_s mem[3];

  struct ivshmnet_queue rx;
  struct ivshmnet_queue tx;

  uint32_t vrsize;
  uint32_t qlen;
  uint32_t qsize;

  uint32_t state;
  uint32_t last_peer_state;
  volatile uint32_t *state_table;

  unsigned long flags;

  struct net_driver_s sk_dev;  /* Interface understood by the network */
  bool sk_bifup;               /* true:ifup false:ifdown */
  WDOG_ID sk_txpoll;           /* TX poll timer */
  WDOG_ID sk_txtimeout;        /* TX timeout timer */
  struct work_s sk_pollwork;   /* For deferring poll work to the work queue */
  struct work_s sk_irqwork;
  struct work_s sk_statework;  /* For deferring interrupt work to the work queue */

  uint8_t pktbuf[MAX_NETDEV_PKTSIZE + CONFIG_NET_GUARDSIZE];
};

/*****************************************************************************
 * Private Data
 *****************************************************************************/

int g_ivshmnet_dev_count = 0;

struct ivshmnet_driver_s g_ivshmnet_devices[CONFIG_IVSHMNET_NINTERFACES];


/*****************************************************************************
 * Private Function Prototypes
 *****************************************************************************/

/* ivshm-net */

static void ivshmnet_state_change(void *in);
static void ivshmnet_set_state(struct ivshmnet_driver_s *in, uint32_t state);
static void ivshmnet_check_state(struct ivshmnet_driver_s *in);

/* Common TX logic */

static int  ivshmnet_transmit(FAR struct ivshmnet_driver_s *priv);
static int  ivshmnet_txpoll(FAR struct net_driver_s *dev);

/* Interrupt handling */

static void ivshmnet_reply(struct ivshmnet_driver_s *priv);
static void ivshmnet_receive(FAR struct ivshmnet_driver_s *priv);
static void ivshmnet_txdone(FAR struct ivshmnet_driver_s *priv);

static void ivshmnet_interrupt_work(FAR void *arg);
static int  ivshmnet_interrupt(int irq, FAR void *context, FAR void *arg);

/* Watchdog timer expirations */

static void ivshmnet_txtimeout_work(FAR void *arg);
static void ivshmnet_txtimeout_expiry(int argc, wdparm_t arg, ...);

static void ivshmnet_poll_work(FAR void *arg);
static void ivshmnet_poll_expiry(int argc, wdparm_t arg, ...);

/* NuttX callback functions */

static int  ivshmnet_ifup(FAR struct net_driver_s *dev);
static int  ivshmnet_ifdown(FAR struct net_driver_s *dev);

static void ivshmnet_txavail_work(FAR void *arg);
static int  ivshmnet_txavail(FAR struct net_driver_s *dev);

#if defined(CONFIG_NET_IGMP) || defined(CONFIG_NET_ICMPv6)
static int  ivshmnet_addmac(FAR struct net_driver_s *dev,
              FAR const uint8_t *mac);
#ifdef CONFIG_NET_IGMP
static int  ivshmnet_rmmac(FAR struct net_driver_s *dev,
              FAR const uint8_t *mac);
#endif
#ifdef CONFIG_NET_ICMPv6
static void ivshmnet_ipv6multicast(FAR struct ivshmnet_driver_s *priv);
#endif
#endif
#ifdef CONFIG_NETDEV_IOCTL
static int  ivshmnet_ioctl(FAR struct net_driver_s *dev, int cmd,
              unsigned long arg);
#endif

/****************************************************************************
 * Private Functions
 ****************************************************************************/

/*****************************************
 *  ivshmem-net vring support functions  *
 *****************************************/

static void *ivshmnet_desc_data(
        struct ivshmnet_driver_s *in, struct ivshmnet_queue *q,
        unsigned int region,  struct vring_desc *desc,
        uint32_t *len)
{
  uint64_t offs = READ_ONCE(desc->addr);
  uint32_t dlen = READ_ONCE(desc->len);
  uint16_t flags = READ_ONCE(desc->flags);
  void *data;

  if (flags)
      return NULL;

  if (offs >= in->mem[region].size)
      return NULL;

  data = (void *)(in->mem[region].address + offs);

  if (data < q->data || data >= q->end)
      return NULL;

  if (dlen > q->end - data)
      return NULL;

  *len = dlen;

  return data;
}

static void ivshmnet_init_queue(
        struct ivshmnet_driver_s *in, struct ivshmnet_queue *q,
        void *mem, unsigned int len)
{
  memset(q, 0, sizeof(*q));

  vring_init(&q->vr, len, mem, IVSHMNET_VQ_ALIGN);
  q->data = mem + in->vrsize;
  q->end = q->data + in->qsize;
  q->size = in->qsize;
}

static void ivshmnet_init_queues(struct ivshmnet_driver_s *in)
{
  void *tx;
  void *rx;
  int i;
  void* tmp;

  tx = (void *)in->mem[IVSHMNET_SECTION_TX].address;
  rx = (void *)in->mem[IVSHMNET_SECTION_RX].address;

  memset(tx, 0, in->mem[IVSHMNET_SECTION_TX].size);

  ivshmnet_init_queue(in, &in->tx, tx, in->qlen);
  ivshmnet_init_queue(in, &in->rx, rx, in->qlen);

  tmp = in->rx.vr.used;
  in->rx.vr.used = in->tx.vr.used;
  in->tx.vr.used = tmp;

  in->tx.num_free = in->tx.vr.num;

  for (i = 0; i < in->tx.vr.num - 1; i++)
      in->tx.vr.desc[i].next = i + 1;
}

static int ivshmnet_calc_qsize(struct ivshmnet_driver_s *in)
{
  unsigned int vrsize;
  unsigned int qsize;
  unsigned int qlen;

  for (qlen = 4096; qlen > 32; qlen >>= 1)
    {
      vrsize = vring_size(qlen, IVSHMNET_VQ_ALIGN);
      vrsize = IVSHMNET_ALIGN(vrsize, IVSHMNET_VQ_ALIGN);
      if (vrsize < (in->mem[IVSHMNET_SECTION_TX].size) / 8)
          break;
    }

  if (vrsize > in->mem[IVSHMNET_SECTION_TX].size)
      return -EINVAL;

  qsize = in->mem[IVSHMNET_SECTION_TX].size - vrsize;

  if (qsize < 4 * IVSHMNET_MTU_MIN)
      return -EINVAL;

  in->vrsize = vrsize;
  in->qlen = qlen;
  in->qsize = qsize;

  return 0;
}

/*****************************************
 *  ivshmem-net IRQ support functions  *
 *****************************************/

static void ivshmnet_notify_tx(struct ivshmnet_driver_s *in, unsigned int num)
{
  uint16_t evt, old, new;

  mb();

  evt = READ_ONCE(vring_avail_event(&in->tx.vr));
  old = in->tx.last_avail_idx - num;
  new = in->tx.last_avail_idx;

  if (vring_need_event(evt, new, old))
    {
      in->regs->doorbell =
        ((uint32_t)in->peer_id << 16) | IVSHMNET_MSIX_TX_RX;
    }
}

static void ivshmnet_enable_rx_irq(struct ivshmnet_driver_s *in)
{
  vring_avail_event(&in->rx.vr) = in->rx.last_avail_idx;
  wmb();
}

static void ivshmnet_notify_rx(struct ivshmnet_driver_s *in, unsigned int num)
{
  uint16_t evt, old, new;

  mb();

  evt = vring_used_event(&in->rx.vr);
  old = in->rx.last_used_idx - num;
  new = in->rx.last_used_idx;

  if (vring_need_event(evt, new, old))
    {
      in->regs->doorbell =
        ((uint32_t)in->peer_id << 16) | IVSHMNET_MSIX_TX_RX;
    }
}

static void ivshmnet_enable_tx_irq(struct ivshmnet_driver_s *in)
{
  vring_used_event(&in->tx.vr) = in->tx.last_used_idx;
  wmb();
}

/*************************************
 *  ivshmem-net vring syntax sugars  *
 *************************************/

static struct vring_desc *ivshmnet_rx_desc(struct ivshmnet_driver_s *in)
{
  struct ivshmnet_queue *rx = &in->rx;
  struct vring *vr = &rx->vr;
  unsigned int avail;
  uint16_t avail_idx;

  avail_idx = virt_load_acquire(&vr->avail->idx);

  if (avail_idx == rx->last_avail_idx)
      return NULL;

  avail = vr->avail->ring[rx->last_avail_idx++ & (vr->num - 1)];
  if (avail >= vr->num)
    {
      nerr("invalid rx avail %d\n", avail);
      return NULL;
    }

  return &vr->desc[avail];
}

static bool ivshmnet_rx_avail(struct ivshmnet_driver_s *in)
{
  mb();
  return READ_ONCE(in->rx.vr.avail->idx) != in->rx.last_avail_idx;
}

static void ivshmnet_rx_finish(struct ivshmnet_driver_s *in, struct vring_desc *desc)
{
  struct ivshmnet_queue *rx = &in->rx;
  struct vring *vr = &rx->vr;
  unsigned int desc_id = desc - vr->desc;
  unsigned int used;

  used = rx->last_used_idx++ & (vr->num - 1);
  vr->used->ring[used].id = desc_id;
  vr->used->ring[used].len = 1;

  virt_store_release(&vr->used->idx, rx->last_used_idx);
}

static size_t ivshmnet_tx_space(struct ivshmnet_driver_s *in)
{
  struct ivshmnet_queue *tx = &in->tx;
  uint32_t tail = tx->tail;
  uint32_t head = tx->head;
  uint32_t space;

  if (head < tail)
      space = tail - head;
  else
      space = (tx->size - head) > tail ? (tx->size - head) : tail;

  return space;
}

static bool ivshmnet_tx_ok(struct ivshmnet_driver_s *in, unsigned int mtu)
{
  return in->tx.num_free >= 2 &&
      ivshmnet_tx_space(in) >= 2 * IVSHMNET_FRAME_SIZE(mtu);
}

static uint32_t ivshmnet_tx_advance(struct ivshmnet_queue *q, uint32_t *pos, uint32_t len)
{
  uint32_t p = *pos;

  len = IVSHMNET_FRAME_SIZE(len);

  if (q->size - p < len)
      p = 0;
  *pos = p + len;

  return p;
}

static int ivshmnet_tx_clean(struct ivshmnet_driver_s *in)
{
  struct ivshmnet_queue *tx = &in->tx;
  struct vring *vr = &tx->vr;
  struct vring_desc *desc;
  struct vring_desc *fdesc;
  struct vring_used_elem *used;
  uint16_t last = tx->last_used_idx;
  uint32_t fhead;
  unsigned int num;
  bool tx_ok;

  fdesc = NULL;
  fhead = 0;
  num = 0;

  while (last != virt_load_acquire(&vr->used->idx))
    {
      void *data;
      uint32_t len;
      uint32_t tail;

      used = vr->used->ring + (last % vr->num);
      if (used->id >= vr->num || used->len != 1)
        {
          nerr("invalid tx used->id %d ->len %d\n",
                 used->id, used->len);
          break;
        }

      desc = &vr->desc[used->id];

      data = ivshmnet_desc_data(in, &in->tx, IVSHMNET_SECTION_TX,
                                desc, &len);
      if (!data)
        {
          nerr("bad tx descriptor, data == NULL\n");
          break;
        }

      tail = ivshmnet_tx_advance(tx, &tx->tail, len);
      if (data != tx->data + tail)
        {
          nerr("bad tx descriptor\n");
          break;
        }

      if (!num)
          fdesc = desc;
      else
          desc->next = fhead;

      fhead = used->id;

      tx->last_used_idx = ++last;
      num++;
      tx->num_free++;

      DEBUGASSERT(tx->num_free <= vr->num);

      tx_ok = ivshmnet_tx_ok(in, IVSHMNET_MTU_DEFAULT);
      if (!tx_ok)
          ivshmnet_enable_tx_irq(in);
  }

  if (num)
    {
      fdesc->next = tx->free_head;
      tx->free_head = fhead;
    }
  else
    {
      tx_ok = ivshmnet_tx_ok(in, IVSHMNET_MTU_DEFAULT);
    }

  return tx_ok;
}


static int ivshmnet_tx_frame(struct ivshmnet_driver_s *in, void* data, int len)
{
  struct ivshmnet_queue *tx = &in->tx;
  struct vring *vr = &tx->vr;
  struct vring_desc *desc;
  unsigned int desc_idx;
  unsigned int avail;
  uint32_t head;
  void *buf;

  unsigned int ret = ivshmnet_tx_clean(in);
  DEBUGASSERT(ret);

  desc_idx = tx->free_head;
  desc = &vr->desc[desc_idx];
  tx->free_head = desc->next;
  tx->num_free--;

  head = ivshmnet_tx_advance(tx, &tx->head, len);

  buf = tx->data + head;
  memcpy(buf, data, len);

  desc->addr = buf - (void *)in->mem[IVSHMNET_SECTION_TX].address;
  desc->len = len;
  desc->flags = 0;

  avail = tx->last_avail_idx++ & (vr->num - 1);
  vr->avail->ring[avail] = desc_idx;
  tx->num_added++;

  virt_store_release(&vr->avail->idx, tx->last_avail_idx);
  ivshmnet_notify_tx(in, tx->num_added);
  tx->num_added = 0;

  return 0;
}

/*****************************************
 *  ivshmem-net support functions  *
 *****************************************/

static void ivshmnet_run(struct ivshmnet_driver_s *in)
{
  irqstate_t flags;

  if (in->state < IVSHMNET_STATE_READY)
      return;

  /* test_and_set_bit */
  flags = enter_critical_section();
  if(in->flags & IVSHMNET_FLAG_RUN)
    {
      in->flags |= IVSHMNET_FLAG_RUN;
      leave_critical_section(flags);
      return;
    }

  in->flags |= IVSHMNET_FLAG_RUN;
  leave_critical_section(flags);

  ivshmnet_set_state(in, IVSHMNET_STATE_RUN);
  in->sk_bifup = true;

  return;
}

static void ivshmnet_do_stop(struct ivshmnet_driver_s *in)
{
  irqstate_t flags;

  in->sk_bifup = false;

  ivshmnet_set_state(in, IVSHMNET_STATE_RESET);

  /* test_and_clear_bit */
  flags = enter_critical_section();
  if(!(in->flags & IVSHMNET_FLAG_RUN))
    {
      in->flags &= ~IVSHMNET_FLAG_RUN;
      leave_critical_section(flags);
      return;
    }

  in->flags &= ~IVSHMNET_FLAG_RUN;
  leave_critical_section(flags);

  return;
}

/****************************************************************************
 * State Machine
 ****************************************************************************/

static void ivshmnet_state_change(void *arg)
{
  struct ivshmnet_driver_s *in = (struct ivshmnet_driver_s*)arg;
  uint32_t peer_state = READ_ONCE(in->state_table[in->peer_id]);

  ninfo("Remote state: %d\n", peer_state);

  switch (in->state)
    {
      case IVSHMNET_STATE_RESET:
          if (peer_state < IVSHMNET_STATE_READY)
              ivshmnet_set_state(in, IVSHMNET_STATE_INIT);
          break;

      case IVSHMNET_STATE_INIT:
          if (peer_state > IVSHMNET_STATE_RESET)
            {
              ivshmnet_init_queues(in);
              ivshmnet_set_state(in, IVSHMNET_STATE_READY);
            }
          break;

      case IVSHMNET_STATE_READY:
          if (peer_state >= IVSHMNET_STATE_READY)
            {
              ivshmnet_run(in);
              break;
            }
      case IVSHMNET_STATE_RUN:
          if (peer_state == IVSHMNET_STATE_RESET)
            {
              ivshmnet_do_stop(in);
            }
          break;
    }

  wmb();
  WRITE_ONCE(in->last_peer_state, peer_state);
}

static void ivshmnet_set_state(struct ivshmnet_driver_s *in, uint32_t state)
{
  wmb();
  WRITE_ONCE(in->state, state);
  WRITE_ONCE(in->regs->state, state);
}

static void ivshmnet_check_state(struct ivshmnet_driver_s *in)
{
  irqstate_t flags;

  flags = enter_critical_section();

  /* test_bit */
  if (in->state_table[in->peer_id] != in->last_peer_state ||
      !(IVSHMNET_FLAG_RUN & in->flags))
      work_queue(ETHWORK, &in->sk_statework, ivshmnet_state_change, in, 0);

  leave_critical_section(flags);
}

/****************************************************************************
 * State IRQ Handlers
 ****************************************************************************/

static int ivshmnet_state_handler(int irq, uint32_t *regs, void *arg)
{
  struct ivshmnet_driver_s *priv = arg;

  ivshmnet_check_state(priv);

  return 0;
}

#if 0
static void dump_ethernet_frame(void *data, int len){
    uint8_t* ptr8 = data;
    uint16_t* ptr16 = data;
    uint32_t* ptrip = (uint32_t*)(ptr8 + 14);
    uint16_t etype;

    ninfo("======= Dumping Ethernet Frame =======\n");
    ninfo("Dest MAC: %x:%x:%x:%x:%x:%x\n", ptr8[0], ptr8[1], ptr8[2], ptr8[3], ptr8[4], ptr8[5]);
    ninfo("Src  MAC: %x:%x:%x:%x:%x:%x\n", ptr8[6], ptr8[7], ptr8[8], ptr8[9], ptr8[10], ptr8[11]);
    etype = bswap16(ptr16[6]);
    ninfo("Ether Type: 0x%x\n", etype);
    if(etype == 0x806) // ARP
    {
      ninfo("------- Begin ARP Frame -------\n");
      ninfo("HW type: 0x%lx, Proto type: 0x%lx\n", bswap16((ptrip[0]) & 0xffff), bswap16((ptrip[0] >> 16) & 0xffff));
      ninfo("HW addr len: 0x%lx, Proto addr len: 0x%lx\n", (ptrip[1]) & 0xff, (ptrip[1] >> 8) & 0xff);
      ninfo("Operation: 0x%lx\n", bswap16((ptrip[1] >> 16) & 0xffff));
      ninfo("Sender hardware address: %x:%x:%x:%x:%x:%x\n",
              (ptrip[2]) & 0xff,
              (ptrip[2] >> 8) & 0xff,
              (ptrip[2] >> 16) & 0xff,
              (ptrip[2] >> 24) & 0xff,
              (ptrip[3]) & 0xff,
              (ptrip[3] >> 8) & 0xff
              );
      ninfo("Sender protocol address: %x:%x:%x:%x\n",
              (ptrip[3] >> 16) & 0xff,
              (ptrip[3] >> 24) & 0xff,
              (ptrip[4]) & 0xff,
              (ptrip[4] >> 8) & 0xff
              );
      ninfo("Target hardware address: %x:%x:%x:%x:%x:%x\n",
              (ptrip[4] >> 16) & 0xff,
              (ptrip[4] >> 24) & 0xff,
              (ptrip[5]) & 0xff,
              (ptrip[5] >> 8) & 0xff,
              (ptrip[5] >> 16) & 0xff,
              (ptrip[5] >> 24) & 0xff
              );
      ninfo("Target protocol address: %x:%x:%x:%x\n",
              (ptrip[6]) & 0xff,
              (ptrip[6] >> 8) & 0xff,
              (ptrip[6] >> 16) & 0xff,
              (ptrip[6] >> 24) & 0xff
              );
    }
    else if(etype == 0x800) //IPV4
    {
      ninfo("------- Begin IP Frame -------\n");
      ninfo("Version: %d, Hdr len: 0x%lx\n", (ptrip[0] >> 4) & 0xf, hdr_len);
      ninfo("Diff Service: 0x%lx\n", (ptrip[0] >> 8) & 0xff);
      ninfo("Total Length: 0x%lx\n", (ptrip[0] >> 16) & 0xffff);
      ninfo("Identification: 0x%lx\n", (ptrip[1]) & 0xffff);
      ninfo("Flags: 0x%lx, Frags: 0x%lx\n", (ptrip[1] >> 16) & 0x7, bswap16((ptrip[1] >> 16) & 0xffff) & 0x1fff);
      ninfo("TTL: %d, Protocol: 0x%lx\n", (ptrip[2]) & 0xff, (ptrip[2] >> 8) & 0xff);
      ninfo("Hdr checksum: 0x%lx\n", (ptrip[2] >> 16) & 0xffff);
      ninfo("Src  address: %d.%d.%d.%d\n", (ptrip[3]) & 0xff, (ptrip[3] >> 8) & 0xff, (ptrip[3] >> 16) & 0xff, (ptrip[3] >> 24) & 0xff);
      ninfo("Dest address: %d.%d.%d.%d\n", (ptrip[4]) & 0xff, (ptrip[4] >> 8) & 0xff, (ptrip[4] >> 16) & 0xff, (ptrip[4] >> 24) & 0xff);

      ninfo("Src  port: %d\n", bswap16(ptrip[hdr_len]) & 0xffff);
      ninfo("Dest port: %d\n", bswap16(ptrip[hdr_len] >> 16) & 0xffff);
    }

    return;
}
#else

#define dump_ethernet_frame(data, len)

#endif

/****************************************************************************
 * Name: ivshmnet_transmit
 *
 * Description:
 *   Start hardware transmission.  Called either from the txdone interrupt
 *   handling or from watchdog based polling.
 *
 * Input Parameters:
 *   priv - Reference to the driver state structure
 *
 * Returned Value:
 *   OK on success; a negated errno on failure
 *
 * Assumptions:
 *   The network is locked.
 *
 ****************************************************************************/

static int ivshmnet_transmit(FAR struct ivshmnet_driver_s *priv)
{
  /* Verify that the hardware is ready to send another packet.  If we get
   * here, then we are committed to sending a packet; Higher level logic
   * must have assured that there is no transmission in progress.
   */

  /* Increment statistics */

  NETDEV_TXPACKETS(priv->sk_dev);

  /* Send the packet: address=priv->sk_dev.d_buf, length=priv->sk_dev.d_len */
  ivshmnet_tx_clean(priv);

  ASSERT(ivshmnet_tx_ok(priv, IVSHMNET_MTU_DEFAULT));

  ivshmnet_tx_frame(priv, priv->sk_dev.d_buf, priv->sk_dev.d_len);

  /* Enable Tx interrupts */
  ivshmnet_enable_tx_irq(priv);

  /* Setup the TX timeout watchdog (perhaps restarting the timer) */
  (void)wd_start(priv->sk_txtimeout, IVSHMNET_TXTIMEOUT,
                 ivshmnet_txtimeout_expiry, 1, (wdparm_t)priv);
  return OK;
}

/****************************************************************************
 * Name: ivshmnet_txpoll
 *
 * Description:
 *   The transmitter is available, check if the network has any outgoing
 *   packets ready to send.  This is a callback from devif_poll().
 *   devif_poll() may be called:
 *
 *   1. When the preceding TX packet send is complete,
 *   2. When the preceding TX packet send timesout and the interface is reset
 *   3. During normal TX polling
 *
 * Input Parameters:
 *   dev - Reference to the NuttX driver state structure
 *
 * Returned Value:
 *   OK on success; a negated errno on failure
 *
 * Assumptions:
 *   The network is locked.
 *
 ****************************************************************************/

static int ivshmnet_txpoll(FAR struct net_driver_s *dev)
{
  FAR struct ivshmnet_driver_s *priv = (FAR struct ivshmnet_driver_s *)dev->d_private;

  /* If the polling resulted in data that should be sent out on the network,
   * the field d_len is set to a value > 0.
   */

  if (priv->sk_dev.d_len > 0)
    {
      /* Look up the destination MAC address and add it to the Ethernet
       * header.
       */

#ifdef CONFIG_NET_IPv4
#ifdef CONFIG_NET_IPv6
      if (IFF_IS_IPv4(priv->sk_dev.d_flags))
#endif
        {
          arp_out(&priv->sk_dev);
        }
#endif /* CONFIG_NET_IPv4 */

#ifdef CONFIG_NET_IPv6
#ifdef CONFIG_NET_IPv4
      else
#endif
        {
          neighbor_out(&priv->sk_dev);
        }
#endif /* CONFIG_NET_IPv6 */

      /* Send the packet */

      ivshmnet_transmit(priv);

      /* Check if there is room in the device to hold another packet. If not,
       * return a non-zero value to terminate the poll.
       */
    }

  /* If zero is returned, the polling will continue until all connections have
   * been examined.
   */

  return 0;
}

/****************************************************************************
 * Name: ivshmnet_reply
 *
 * Description:
 *   After a packet has been received and dispatched to the network, it
 *   may return return with an outgoing packet.  This function checks for
 *   that case and performs the transmission if necessary.
 *
 * Input Parameters:
 *   priv - Reference to the driver state structure
 *
 * Returned Value:
 *   None
 *
 * Assumptions:
 *   The network is locked.
 *
 ****************************************************************************/

static void ivshmnet_reply(struct ivshmnet_driver_s *priv)
{
  /* If the packet dispatch resulted in data that should be sent out on the
   * network, the field d_len will set to a value > 0.
   */

  if (priv->sk_dev.d_len > 0)
    {
      /* Update the Ethernet header with the correct MAC address */

#ifdef CONFIG_NET_IPv4
#ifdef CONFIG_NET_IPv6
      /* Check for an outgoing IPv4 packet */

      if (IFF_IS_IPv4(priv->sk_dev.d_flags))
#endif
        {
          arp_out(&priv->sk_dev);
        }
#endif

#ifdef CONFIG_NET_IPv6
#ifdef CONFIG_NET_IPv4
      /* Otherwise, it must be an outgoing IPv6 packet */

      else
#endif
        {
          neighbor_out(&ivshmnet->sk_dev);
        }
#endif

      /* And send the packet */

      ivshmnet_transmit(priv);
    }
}

/****************************************************************************
 * Name: ivshmnet_receive
 *
 * Description:
 *   An interrupt was received indicating the availability of a new RX packet
 *
 * Input Parameters:
 *   priv - Reference to the driver state structure
 *
 * Returned Value:
 *   None
 *
 * Assumptions:
 *   The network is locked.
 *
 ****************************************************************************/

static void ivshmnet_receive(FAR struct ivshmnet_driver_s *priv)
{
  int received = 0;

  do
    {
      struct vring_desc *desc;
      void *data;
      uint32_t len;

      /* Check for errors and update statistics */
      ninfo("processing receive\n");

      desc = ivshmnet_rx_desc(priv); /* get next avail rx descriptor from avail ring */
      if (!desc)
        break;

      data = ivshmnet_desc_data(priv, &priv->rx, IVSHMNET_SECTION_RX,
                   desc, &len); /* Unpack descriptor and get the physical address in SHMEM and fill in len */
      if (!data) {
        nerr("bad rx descriptor\n");
        break;
      }

      dump_ethernet_frame(data, len);

      /* Check if the packet is a valid size for the network buffer
       * configuration.
       */

      /* Copy the data data from the hardware to priv->sk_dev.d_buf.  Set
       * amount of data in priv->sk_dev.d_len
       */
      memcpy(priv->sk_dev.d_buf, data, len);
      priv->sk_dev.d_len = len;

      ivshmnet_rx_finish(priv, desc); /* Release the read descriptor in to the used ring */

#ifdef CONFIG_NET_PKT
      /* When packet sockets are enabled, feed the frame into the packet tap */

       pkt_input(&priv->sk_dev);
#endif

#ifdef CONFIG_NET_IPv4
      /* Check for an IPv4 packet */

      if (BUF->type == HTONS(ETHTYPE_IP))
        {
          ninfo("IPv4 frame\n");
          NETDEV_RXIPV4(&priv->sk_dev);

          /* Handle ARP on input, then dispatch IPv4 packet to the network
           * layer.
           */

          arp_ipin(&priv->sk_dev);
          ipv4_input(&priv->sk_dev);

          /* Check for a reply to the IPv4 packet */

          ivshmnet_reply(priv);
        }
      else
#endif
#ifdef CONFIG_NET_IPv6
      /* Check for an IPv6 packet */

      if (BUF->type == HTONS(ETHTYPE_IP6))
        {
          ninfo("Iv6 frame\n");
          NETDEV_RXIPV6(&priv->sk_dev);

          /* Dispatch IPv6 packet to the network layer */

          ipv6_input(&priv->sk_dev);

          /* Check for a reply to the IPv6 packet */

          ivshmnet_reply(priv);
        }
      else
#endif
#ifdef CONFIG_NET_ARP
      /* Check for an ARP packet */

      if (BUF->type == htons(ETHTYPE_ARP))
        {
          /* Dispatch ARP packet to the network layer */

          arp_arpin(&priv->sk_dev);
          NETDEV_RXARP(&priv->sk_dev);

          /* If the above function invocation resulted in data that should be
           * sent out on the network, the field  d_len will set to a value > 0.
           */

          if (priv->sk_dev.d_len > 0)
            {
              ivshmnet_transmit(priv);
            }
        }
      else
#endif
        {
          NETDEV_RXDROPPED(&priv->sk_dev);
        }
      received++;
    }
  while (true); /* Whether are there more packets to be processed is checked above */

  ivshmnet_enable_rx_irq(priv); /* enable the irq by writing the last avail index to the end of the ring */
  if (ivshmnet_rx_avail(priv)) /* More stuff to read?, which is very unlikely*/
    work_queue(ETHWORK, &priv->sk_irqwork, ivshmnet_interrupt_work, priv, 0); /* schedule the work again */

  if (received)
    ivshmnet_notify_rx(priv, received); /* We had did some work, notify we had rx the data by triggering door bell*/
}

/****************************************************************************
 * Name: ivshmnet_txdone
 *
 * Description:
 *   An interrupt was received indicating that the last TX packet(s) is done
 *
 * Input Parameters:
 *   priv - Reference to the driver state structure
 *
 * Returned Value:
 *   None
 *
 * Assumptions:
 *   The network is locked.
 *
 ****************************************************************************/

static void ivshmnet_txdone(FAR struct ivshmnet_driver_s *priv)
{
  /* Check for errors and update statistics */

  NETDEV_TXDONE(priv->sk_dev);

  /* Check if there are pending transmissions */

  /* If no further transmissions are pending, then cancel the TX timeout and
   * disable further Tx interrupts.
   */

  wd_cancel(priv->sk_txtimeout);

  /* And disable further TX interrupts. */

  /* In any event, poll the network for new TX data */

  (void)devif_poll(&priv->sk_dev, ivshmnet_txpoll);
}

/****************************************************************************
 * Name: ivshmnet_interrupt_work
 *
 * Description:
 *   Perform interrupt related work from the worker thread
 *
 * Input Parameters:
 *   arg - The argument passed when work_queue() was called.
 *
 * Returned Value:
 *   OK on success
 *
 * Assumptions:
 *   Runs on a worker thread.
 *
 ****************************************************************************/

static void ivshmnet_interrupt_work(FAR void *arg)
{
  FAR struct ivshmnet_driver_s *priv = (FAR struct ivshmnet_driver_s *)arg;

  /* Lock the network and serialize driver operations if necessary.
   * NOTE: Serialization is only required in the case where the driver work
   * is performed on an LP worker thread and where more than one LP worker
   * thread has been configured.
   */

  ninfo("processing int\n");

  net_lock();

  /* Process pending Ethernet interrupts */

  /* Get and clear interrupt status bits */

  /*ivshmnet_tx_clean(priv);*/

  /* Handle interrupts according to status bit settings */

  /* Check if we received an incoming packet, if so, call ivshmnet_receive() */
  if(ivshmnet_rx_avail(priv))
    {

      ivshmnet_receive(priv);
    }
  else
    {
      /* Check if a packet transmission just completed.  If so, call ivshmnet_txdone.
       * This may disable further Tx interrupts if there are no pending
       * transmissions.
       */

      /* XXX: Assuming single interrupt only represent TX or RX might not be a good idea */

      ivshmnet_txdone(priv);
    }

  net_unlock();

  /* Re-enable Ethernet interrupts */

  /*up_enable_irq(CONFIG_IVSHMEM_NET_IRQ);*/
}

/****************************************************************************
 * Name: ivshmnet_interrupt
 *
 * Description:
 *   Hardware interrupt handler
 *
 * Input Parameters:
 *   irq     - Number of the IRQ that generated the interrupt
 *   context - Interrupt register state save info (architecture-specific)
 *
 * Returned Value:
 *   OK on success
 *
 * Assumptions:
 *   Runs in the context of a the Ethernet interrupt handler.  Local
 *   interrupts are disabled by the interrupt logic.
 *
 ****************************************************************************/

static int ivshmnet_interrupt(int irq, FAR void *context, FAR void *arg)
{
  FAR struct ivshmnet_driver_s *priv = (FAR struct ivshmnet_driver_s *)arg;

  DEBUGASSERT(priv != NULL);

  /* Disable further Ethernet interrupts.  Because Ethernet interrupts are
   * also disabled if the TX timeout event occurs, there can be no race
   * condition here.
   */

  /*up_disable_irq(CONFIG_IVSHMEM_NET_IRQ);*/

  /* TODO: Determine if a TX transfer just completed */

    {
      /* If a TX transfer just completed, then cancel the TX timeout so
       * there will be no race condition between any subsequent timeout
       * expiration and the deferred interrupt processing.
       */

       /*wd_cancel(priv->sk_txtimeout);*/
    }

  /* Schedule to perform the interrupt processing on the worker thread. */

  work_queue(ETHWORK, &priv->sk_irqwork, ivshmnet_interrupt_work, priv, 0);
  return OK;
}

/****************************************************************************
 * Name: ivshmnet_txtimeout_work
 *
 * Description:
 *   Perform TX timeout related work from the worker thread
 *
 * Input Parameters:
 *   arg - The argument passed when work_queue() as called.
 *
 * Returned Value:
 *   OK on success
 *
 ****************************************************************************/

static void ivshmnet_txtimeout_work(FAR void *arg)
{
  FAR struct ivshmnet_driver_s *priv = (FAR struct ivshmnet_driver_s *)arg;

  /* Lock the network and serialize driver operations if necessary.
   * NOTE: Serialization is only required in the case where the driver work
   * is performed on an LP worker thread and where more than one LP worker
   * thread has been configured.
   */

  net_lock();

  /* Increment statistics and dump debug info */

  NETDEV_TXTIMEOUTS(priv->sk_dev);

  /* Then reset the hardware */

  /* Then poll the network for new XMIT data */

  (void)devif_poll(&priv->sk_dev, ivshmnet_txpoll);
  net_unlock();
}

/****************************************************************************
 * Name: ivshmnet_txtimeout_expiry
 *
 * Description:
 *   Our TX watchdog timed out.  Called from the timer interrupt handler.
 *   The last TX never completed.  Reset the hardware and start again.
 *
 * Input Parameters:
 *   argc - The number of available arguments
 *   arg  - The first argument
 *
 * Returned Value:
 *   None
 *
 * Assumptions:
 *   Runs in the context of a the timer interrupt handler.  Local
 *   interrupts are disabled by the interrupt logic.
 *
 ****************************************************************************/

static void ivshmnet_txtimeout_expiry(int argc, wdparm_t arg, ...)
{
  FAR struct ivshmnet_driver_s *priv = (FAR struct ivshmnet_driver_s *)arg;

  /* Disable further Ethernet interrupts.  This will prevent some race
   * conditions with interrupt work.  There is still a potential race
   * condition with interrupt work that is already queued and in progress.
   */

  /*up_disable_irq(CONFIG_IVSHMEM_NET_IRQ);*/

  /* Schedule to perform the TX timeout processing on the worker thread. */

  work_queue(ETHWORK, &priv->sk_irqwork, ivshmnet_txtimeout_work, priv, 0);
}

/****************************************************************************
 * Name: ivshmnet_poll_work
 *
 * Description:
 *   Perform periodic polling from the worker thread
 *
 * Input Parameters:
 *   arg - The argument passed when work_queue() as called.
 *
 * Returned Value:
 *   OK on success
 *
 * Assumptions:
 *   Run on a work queue thread.
 *
 ****************************************************************************/

static void ivshmnet_poll_work(FAR void *arg)
{
  FAR struct ivshmnet_driver_s *priv = (FAR struct ivshmnet_driver_s *)arg;

  /* Lock the network and serialize driver operations if necessary.
   * NOTE: Serialization is only required in the case where the driver work
   * is performed on an LP worker thread and where more than one LP worker
   * thread has been configured.
   */

  net_lock();

  /* Perform the poll */

  /* Check if there is room in the send another TX packet.  We cannot perform
   * the TX poll if he are unable to accept another packet for transmission.
   */

  /* If so, update TCP timing states and poll the network for new XMIT data.
   * Hmmm.. might be bug here.  Does this mean if there is a transmit in
   * progress, we will missing TCP time state updates?
   */

  (void)devif_timer(&priv->sk_dev, IVSHMNET_WDDELAY, ivshmnet_txpoll);

  /* Setup the watchdog poll timer again */

  (void)wd_start(priv->sk_txpoll, IVSHMNET_WDDELAY, ivshmnet_poll_expiry, 1,
                 (wdparm_t)priv);
  net_unlock();
}

/****************************************************************************
 * Name: ivshmnet_poll_expiry
 *
 * Description:
 *   Periodic timer handler.  Called from the timer interrupt handler.
 *
 * Input Parameters:
 *   argc - The number of available arguments
 *   arg  - The first argument
 *
 * Returned Value:
 *   None
 *
 * Assumptions:
 *   Runs in the context of a the timer interrupt handler.  Local
 *   interrupts are disabled by the interrupt logic.
 *
 ****************************************************************************/

static void ivshmnet_poll_expiry(int argc, wdparm_t arg, ...)
{
  FAR struct ivshmnet_driver_s *priv = (FAR struct ivshmnet_driver_s *)arg;

  /* Schedule to perform the interrupt processing on the worker thread. */

  work_queue(ETHWORK, &priv->sk_pollwork, ivshmnet_poll_work, priv, 0);
}

/****************************************************************************
 * Name: ivshmnet_ifup
 *
 * Description:
 *   NuttX Callback: Bring up the Ethernet interface when an IP address is
 *   provided
 *
 * Input Parameters:
 *   dev - Reference to the NuttX driver state structure
 *
 * Returned Value:
 *   None
 *
 * Assumptions:
 *   The network is locked.
 *
 ****************************************************************************/

static int ivshmnet_ifup(FAR struct net_driver_s *dev)
{
  FAR struct ivshmnet_driver_s *priv = (FAR struct ivshmnet_driver_s *)dev->d_private;

#ifdef CONFIG_NET_IPv4
  ninfo("Bringing up: %d.%d.%d.%d\n",
        dev->d_ipaddr & 0xff, (dev->d_ipaddr >> 8) & 0xff,
        (dev->d_ipaddr >> 16) & 0xff, dev->d_ipaddr >> 24);
#endif
#ifdef CONFIG_NET_IPv6
  ninfo("Bringing up: %04x:%04x:%04x:%04x:%04x:%04x:%04x:%04x\n",
        dev->d_ipv6addr[0], dev->d_ipv6addr[1], dev->d_ipv6addr[2],
        dev->d_ipv6addr[3], dev->d_ipv6addr[4], dev->d_ipv6addr[5],
        dev->d_ipv6addr[6], dev->d_ipv6addr[7]);
#endif

  priv->regs->int_control = JH_IVSHMEM_INT_EN;
  priv->regs->state = IVSHMNET_STATE_RESET;
  priv->state = IVSHMNET_STATE_RESET;
  ivshmnet_check_state(priv);

  /* Instantiate the MAC address from priv->sk_dev.d_mac.ether.ether_addr_octet */

#ifdef CONFIG_NET_ICMPv6
  /* Set up IPv6 multicast address filtering */

  ivshmnet_ipv6multicast(priv);
#endif

  /* Set and activate a timer process */

  (void)wd_start(priv->sk_txpoll, IVSHMNET_WDDELAY, ivshmnet_poll_expiry, 1,
                 (wdparm_t)priv);

  /* Enable the Ethernet interrupt */

  return OK;
}

/****************************************************************************
 * Name: ivshmnet_ifdown
 *
 * Description:
 *   NuttX Callback: Stop the interface.
 *
 * Input Parameters:
 *   dev - Reference to the NuttX driver state structure
 *
 * Returned Value:
 *   None
 *
 * Assumptions:
 *   The network is locked.
 *
 ****************************************************************************/

static int ivshmnet_ifdown(FAR struct net_driver_s *dev)
{
  FAR struct ivshmnet_driver_s *priv = (FAR struct ivshmnet_driver_s *)dev->d_private;
  irqstate_t flags;

  /* Disable the Ethernet interrupt */

  flags = enter_critical_section();

  priv->regs->int_control &= ~JH_IVSHMEM_INT_EN;
  priv->regs->state = IVSHMNET_STATE_RESET;

  /* Cancel the TX poll timer and TX timeout timers */

  wd_cancel(priv->sk_txpoll);
  wd_cancel(priv->sk_txtimeout);

  /* Put the EMAC in its reset, non-operational state.  This should be
   * a known configuration that will guarantee the ivshmnet_ifup() always
   * successfully brings the interface back up.
   */

  /* Mark the device "down" */

  priv->sk_bifup = false;
  leave_critical_section(flags);
  return OK;
}

/****************************************************************************
 * Name: ivshmnet_txavail_work
 *
 * Description:
 *   Perform an out-of-cycle poll on the worker thread.
 *
 * Input Parameters:
 *   arg - Reference to the NuttX driver state structure (cast to void*)
 *
 * Returned Value:
 *   None
 *
 * Assumptions:
 *   Runs on a work queue thread.
 *
 ****************************************************************************/

static void ivshmnet_txavail_work(FAR void *arg)
{
  FAR struct ivshmnet_driver_s *priv = (FAR struct ivshmnet_driver_s *)arg;

  /* Lock the network and serialize driver operations if necessary.
   * NOTE: Serialization is only required in the case where the driver work
   * is performed on an LP worker thread and where more than one LP worker
   * thread has been configured.
   */

  net_lock();

  /* Ignore the notification if the interface is not yet up */

  if (priv->sk_bifup)
    {
      /* Check if there is room in the hardware to hold another outgoing packet. */

      /* If so, then poll the network for new XMIT data */

      (void)devif_poll(&priv->sk_dev, ivshmnet_txpoll);
    }

  net_unlock();
}

/****************************************************************************
 * Name: ivshmnet_txavail
 *
 * Description:
 *   Driver callback invoked when new TX data is available.  This is a
 *   stimulus perform an out-of-cycle poll and, thereby, reduce the TX
 *   latency.
 *
 * Input Parameters:
 *   dev - Reference to the NuttX driver state structure
 *
 * Returned Value:
 *   None
 *
 * Assumptions:
 *   The network is locked.
 *
 ****************************************************************************/

static int ivshmnet_txavail(FAR struct net_driver_s *dev)
{
  FAR struct ivshmnet_driver_s *priv = (FAR struct ivshmnet_driver_s *)dev->d_private;

  /* Is our single work structure available?  It may not be if there are
   * pending interrupt actions and we will have to ignore the Tx
   * availability action.
   */

  if (work_available(&priv->sk_pollwork))
    {
      /* Schedule to serialize the poll on the worker thread. */

      work_queue(ETHWORK, &priv->sk_pollwork, ivshmnet_txavail_work, priv, 0);
    }

  return OK;
}

/****************************************************************************
 * Name: ivshmnet_addmac
 *
 * Description:
 *   NuttX Callback: Add the specified MAC address to the hardware multicast
 *   address filtering
 *
 * Input Parameters:
 *   dev  - Reference to the NuttX driver state structure
 *   mac  - The MAC address to be added
 *
 * Returned Value:
 *   Zero (OK) on success; a negated errno value on failure.
 *
 ****************************************************************************/

#if defined(CONFIG_NET_IGMP) || defined(CONFIG_NET_ICMPv6)
static int ivshmnet_addmac(FAR struct net_driver_s *dev, FAR const uint8_t *mac)
{
  FAR struct ivshmnet_driver_s *priv = (FAR struct ivshmnet_driver_s *)dev->d_private;

  /* Add the MAC address to the hardware multicast routing table */

  return OK;
}
#endif

/****************************************************************************
 * Name: ivshmnet_rmmac
 *
 * Description:
 *   NuttX Callback: Remove the specified MAC address from the hardware multicast
 *   address filtering
 *
 * Input Parameters:
 *   dev  - Reference to the NuttX driver state structure
 *   mac  - The MAC address to be removed
 *
 * Returned Value:
 *   Zero (OK) on success; a negated errno value on failure.
 *
 ****************************************************************************/

#ifdef CONFIG_NET_IGMP
static int ivshmnet_rmmac(FAR struct net_driver_s *dev, FAR const uint8_t *mac)
{
  FAR struct ivshmnet_driver_s *priv = (FAR struct ivshmnet_driver_s *)dev->d_private;

  /* Add the MAC address to the hardware multicast routing table */

  return OK;
}
#endif

/****************************************************************************
 * Name: ivshmnet_ipv6multicast
 *
 * Description:
 *   Configure the IPv6 multicast MAC address.
 *
 * Input Parameters:
 *   priv - A reference to the private driver state structure
 *
 * Returned Value:
 *   Zero (OK) on success; a negated errno value on failure.
 *
 ****************************************************************************/

#ifdef CONFIG_NET_ICMPv6
static void ivshmnet_ipv6multicast(FAR struct ivshmnet_driver_s *priv)
{
  FAR struct net_driver_s *dev;
  uint16_t tmp16;
  uint8_t mac[6];

  /* For ICMPv6, we need to add the IPv6 multicast address
   *
   * For IPv6 multicast addresses, the Ethernet MAC is derived by
   * the four low-order octets OR'ed with the MAC 33:33:00:00:00:00,
   * so for example the IPv6 address FF02:DEAD:BEEF::1:3 would map
   * to the Ethernet MAC address 33:33:00:01:00:03.
   *
   * NOTES:  This appears correct for the ICMPv6 Router Solicitation
   * Message, but the ICMPv6 Neighbor Solicitation message seems to
   * use 33:33:ff:01:00:03.
   */

  mac[0] = 0x33;
  mac[1] = 0x33;

  dev    = &priv->dev;
  tmp16  = dev->d_ipv6addr[6];
  mac[2] = 0xff;
  mac[3] = tmp16 >> 8;

  tmp16  = dev->d_ipv6addr[7];
  mac[4] = tmp16 & 0xff;
  mac[5] = tmp16 >> 8;

  ninfo("IPv6 Multicast: %02x:%02x:%02x:%02x:%02x:%02x\n",
        mac[0], mac[1], mac[2], mac[3], mac[4], mac[5]);

  (void)ivshmnet_addmac(dev, mac);

#ifdef CONFIG_NET_ICMPv6_AUTOCONF
  /* Add the IPv6 all link-local nodes Ethernet address.  This is the
   * address that we expect to receive ICMPv6 Router Advertisement
   * packets.
   */

  (void)ivshmnet_addmac(dev, g_ipv6_ethallnodes.ether_addr_octet);

#endif /* CONFIG_NET_ICMPv6_AUTOCONF */

#ifdef CONFIG_NET_ICMPv6_ROUTER
  /* Add the IPv6 all link-local routers Ethernet address.  This is the
   * address that we expect to receive ICMPv6 Router Solicitation
   * packets.
   */

  (void)ivshmnet_addmac(dev, g_ipv6_ethallrouters.ether_addr_octet);

#endif /* CONFIG_NET_ICMPv6_ROUTER */
}
#endif /* CONFIG_NET_ICMPv6 */

/****************************************************************************
 * Name: ivshmnet_ioctl
 *
 * Description:
 *   Handle network IOCTL commands directed to this device.
 *
 * Input Parameters:
 *   dev - Reference to the NuttX driver state structure
 *   cmd - The IOCTL command
 *   arg - The argument for the IOCTL command
 *
 * Returned Value:
 *   OK on success; Negated errno on failure.
 *
 * Assumptions:
 *   The network is locked.
 *
 ****************************************************************************/

#ifdef CONFIG_NETDEV_IOCTL
static int ivshmnet_ioctl(FAR struct net_driver_s *dev, int cmd,
                      unsigned long arg)
{
  FAR struct ivshmnet_driver_s *priv = (FAR struct ivshmnet_driver_s *)dev->d_private;
  int ret;

  /* Decode and dispatch the driver-specific IOCTL command */

  switch (cmd)
    {
      /* Add cases here to support the IOCTL commands */

      default:
        nerr("ERROR: Unrecognized IOCTL command: %d\n", command);
        return -ENOTTY;  /* Special return value for this case */
    }

  return OK;
}
#endif

/****************************************************************************
 * Public Functions
 ****************************************************************************/

/****************************************************************************
 * Name: ivshmnet_probe
 *
 * Description:
 *   Initialize the Ethernet controller and driver
 *
 * Input Parameters:
 *   intf - In the case where there are multiple EMACs, this value
 *          identifies which EMAC is to be initialized.
 *
 * Returned Value:
 *   OK on success; Negated errno on failure.
 *
 * Assumptions:
 *   Called early in initialization before multi-tasking is initiated.
 *
 ****************************************************************************/

int ivshmnet_probe(FAR struct pci_bus_s *bus,
                   FAR struct pci_dev_type_s *type, uint16_t bdf)
{
  int vndr_cap;
  int msix_cap;
  uint8_t vndr_length;
  uint32_t io_section_size;
  uintptr_t rw_section_addr;
  uintptr_t io_section_addr;
  struct ivshmem_mem_region_s *mem;
  struct ivshmnet_driver_s *dev = g_ivshmnet_devices + g_ivshmnet_dev_count;

  if (g_ivshmnet_dev_count >= CONFIG_IVSHMNET_NINTERFACES)
    {
      pcierr("Probed too many ivshmem-net devices!\n");
    }

  memset(dev, 0, sizeof(struct ivshmnet_driver_s));

  dev->dev.bus = bus;
  dev->dev.type = type;
  dev->dev.bdf = bdf;

  if (pci_find_cap(&dev->dev, PCI_CAP_MSIX) < 0)
    {
      pcierr("Device is not MSIX capable\n");
      return -EINVAL;
    }

  dev->regs = pci_map_bar(&dev->dev, 0);
  dev->msix_table = pci_map_bar(&dev->dev, 1);

  pciinfo("Ivshmem-net[%d] mapped bar[0]: %p\n",
          g_ivshmnet_dev_count, dev->regs);

  pciinfo("Ivshmem-net[%d] mapped bar[1]: %p\n",
          g_ivshmnet_dev_count, dev->msix_table);

  if (!dev->regs || !dev->msix_table)
    {
      pcierr("Failed to map ivshmem-net bars!\n");
      return -EBUSY;
    }

  pci_enable_device(&dev->dev);

  if (dev->regs->max_peers != 2)
      return -EINVAL;

  dev->peer_id = !dev->regs->id;

  mem = &dev->mem[0];

  vndr_cap = pci_find_cap(&dev->dev, PCI_CAP_VNDR);

  if (vndr_cap < 0)
    {
      pcierr("Ivshmem[%d] missing vendor capability\n", g_ivshmnet_dev_count);
      return -ENODEV;
    }

  vndr_length =
    pci_cfg_read(&dev->dev, vndr_cap + JH_IVSHMEM_VND_LENGTH, 1);

  if (vndr_length == JH_IVSHMEM_VND_LENGTH_NO_ADDR)
    {
      mem->paddress = pci_get_bar64(&dev->dev, 2);
    }
  else
    {
      mem->paddress =
        ((uintptr_t)pci_cfg_read(&dev->dev,
          vndr_cap + JH_IVSHMEM_VND_ADDR + 4, 4) << 32);
      mem->paddress |=
        ((uintptr_t)pci_cfg_read(&dev->dev,
          vndr_cap + JH_IVSHMEM_VND_ADDR, 4));
    }

  mem->size =
        (pci_cfg_read(&dev->dev, vndr_cap + JH_IVSHMEM_VND_ST_SIZE, 4));
  mem->readonly = true;

  mem->address = (uintptr_t)pci_ioremap(&dev->dev, mem->paddress, mem->size);
  if (!mem->address)
      return -EBUSY;

  dev->state_table = (volatile uint32_t *)mem->address;

  pciinfo("Ivshmem-net[%d] State Table phy_addr:"
          "0x%lx virt_addr: 0x%lx, size: 0x%lx\n",
          g_ivshmnet_dev_count, mem->paddress, mem->address, mem->size);

  mem++;

  rw_section_addr = (mem - 1)->paddress + (mem - 1)->size;

  io_section_addr = rw_section_addr +
    (pci_cfg_read(&dev->dev, vndr_cap + JH_IVSHMEM_VND_RW_SIZE, 4));

  io_section_size =
        (pci_cfg_read(&dev->dev, vndr_cap + JH_IVSHMEM_VND_IO_SIZE, 4));

  if (!io_section_size)
    {
      pcierr("Ivshmem-net[%d] I/O region does not exist");
    }

  mem->paddress = io_section_addr + (!dev->peer_id) * io_section_size;
  mem->size = io_section_size;
  mem->readonly = false;

  mem->address =
    (uintptr_t)pci_ioremap(&dev->dev, mem->paddress, mem->size);
  if (!mem->address)
    {
      pciinfo("TX region mapping failed");
      return -EBUSY;
    }

  pciinfo("Ivshmem-net[%d] TX region phy_addr: " \
          "0x%lx virt_addr: 0x%lx, size: 0x%lx\n",
           g_ivshmnet_dev_count, mem->paddress, mem->address, mem->size);

  memset((void *)mem->address, 0, mem->size);

  mem++;

  mem->paddress = io_section_addr + (!!dev->peer_id) * io_section_size;
  mem->size = io_section_size;
  mem->readonly = true;

  mem->address =
    (uintptr_t)pci_ioremap(&dev->dev, mem->paddress, mem->size);
  if (!mem->address)
      return -EBUSY;

  pciinfo("Ivshmem-net[%d] RX region phy_addr: " \
          "0x%lx virt_addr: 0x%lx, size: 0x%lx\n",
           g_ivshmnet_dev_count, mem->paddress, mem->address, mem->size);

  pci_cfg_write(&dev->dev, vndr_cap + JH_IVSHMEM_VND_PCTL, 0, 1);

  msix_cap = pci_find_cap(&dev->dev, PCI_CAP_MSIX);

  dev->vectors =
    (pci_cfg_read(&dev->dev, msix_cap + PCI_MSIX_MCR, 2) & \
     PCI_MSIX_MCR_TBL_MASK) + 1;

  if(dev->vectors != IVSHMNET_NUM_VECTORS)
    {
      pcierr("Ivshmem-net[%d] Number of vector must be 2\n");
      return -EBUSY;
    }

  (void)irq_attach(CONFIG_IVSHMNET_BASE_IRQ + g_ivshmnet_dev_count * 2,
                   (xcpt_t)ivshmnet_state_handler, dev);
  (void)irq_attach(CONFIG_IVSHMNET_BASE_IRQ + g_ivshmnet_dev_count * 2 + 1,
                   (xcpt_t)ivshmnet_interrupt, dev);

  pci_msix_register(&dev->dev,
      CONFIG_IVSHMNET_BASE_IRQ + g_ivshmnet_dev_count * 2, 0);
  pci_msix_register(&dev->dev,
      CONFIG_IVSHMNET_BASE_IRQ + g_ivshmnet_dev_count * 2 + 1, 1);

  if (ivshmnet_calc_qsize(dev))
      return -EINVAL;

  /* fill in the rest of the structure */
  dev->sk_dev.d_buf     = dev->pktbuf;       /* Single packet buffer */
  dev->sk_dev.d_ifup    = ivshmnet_ifup;     /* I/F up (new IP address) callback */
  dev->sk_dev.d_ifdown  = ivshmnet_ifdown;   /* I/F down callback */
  dev->sk_dev.d_txavail = ivshmnet_txavail;  /* New TX data callback */
#ifdef CONFIG_NET_IGMP
  dev->sk_dev.d_addmac  = ivshmnet_addmac;   /* Add multicast MAC address */
  dev->sk_dev.d_rmmac   = ivshmnet_rmmac;    /* Remove multicast MAC address */
#endif
#ifdef CONFIG_NETDEV_IOCTL
  dev->sk_dev.d_ioctl   = ivshmnet_ioctl;    /* Handle network IOCTL commands */
#endif
  dev->sk_dev.d_private = (void *)dev;       /* Used to recover private state from dev */

  /* Create a watchdog for timing polling for and timing of transmissions */

  dev->sk_txpoll        = wd_create();       /* Create periodic poll timer */
  dev->sk_txtimeout     = wd_create();       /* Create TX timeout timer */

  DEBUGASSERT(dev->sk_txpoll != NULL && dev->sk_txtimeout != NULL);

  /* Put the interface in the down state.  This usually amounts to resetting
   * the device and/or calling ivshmnet_ifdown().
   */

  dev->sk_bifup = false;

  /* Register the device with the OS so that socket IOCTLs can be performed */

  (void)netdev_register(&dev->sk_dev, NET_LL_ETHERNET);

  g_ivshmnet_dev_count++;
  pciinfo("Initialized Ivshmem-net[%d]\n", g_ivshmnet_dev_count);

  return OK;
}

/*****************************************************************************
 * Public Data
 *****************************************************************************/

struct pci_dev_type_s pci_ivshmnet =
{
    .vendor = JH_IVSHMEM_VENDORID,
    .device = JH_IVSHMEM_DEVICEID,
    .class_rev = JH_IVSHMEM_PROTOCOL_NET,
    .name = "Jailhouse Ivshmem-net",
    .probe = ivshmnet_probe
};

------=_Part_22246_1599101656.1640535693925
Content-Type: text/x-csrc; charset=US-ASCII; name=nuttx-3.c
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename=nuttx-3.c
X-Attachment-Id: db1e608e-144a-4a8d-86f1-26a956c88af8
Content-ID: <db1e608e-144a-4a8d-86f1-26a956c88af8>

/*
 * Jailhouse, a Linux-based partitioning hypervisor
 *
 * Copyright (c) Siemens AG, 2014-2017
 *
 * Hand crafted configuration for Nuttx in cRTOS
 *
 * Copyright (c) ChungFan Yang @ Fixstars corporation, 2020
 *    <chungfan.yang@fixstars.com>
 *
 * Redistribution and use in source and binary forms, with or without
 * modification, are permitted provided that the following conditions
 * are met:
 *
 * 1. Redistributions of source code must retain the above copyright
 *    notice, this list of conditions and the following disclaimer.
 *
 * 2. Redistributions in binary form must reproduce the above copyright
 *    notice, this list of conditions and the following disclaimer in the
 *    documentation and/or other materials provided with the distribution.
 *
 * THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS"
 * AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE
 * IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE
 * ARE DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT HOLDER OR CONTRIBUTORS BE
 * LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR
 * CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF
 * SUBSTITUTE GOODS OR SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESS
 * INTERRUPTION) HOWEVER CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN
 * CONTRACT, STRICT LIABILITY, OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE)
 * ARISING IN ANY WAY OUT OF THE USE OF THIS SOFTWARE, EVEN IF ADVISED OF
 * THE POSSIBILITY OF SUCH DAMAGE.
 *
 */

#include <jailhouse/types.h>
#include <jailhouse/cell-config.h>

struct {
	struct jailhouse_cell_desc cell;
	__u64 cpus[1];
	struct jailhouse_memory mem_regions[9];
	struct jailhouse_irqchip irqchips[1];
	struct jailhouse_pio pio_regions[5];
	struct jailhouse_cache cache_regions[1];
	struct jailhouse_pci_device pci_devices[2];
	struct jailhouse_pci_capability pci_caps[0];

} __attribute__((packed)) config = {
	.cell = {
		.signature = JAILHOUSE_CELL_DESC_SIGNATURE,
		.revision = JAILHOUSE_CONFIG_REVISION,
		.name = "nuttx",
    .flags = JAILHOUSE_CELL_PASSIVE_COMMREG,
		.cpu_set_size = sizeof(config.cpus),
		.num_memory_regions = ARRAY_SIZE(config.mem_regions),
		.num_irqchips = ARRAY_SIZE(config.irqchips),
		.num_cache_regions = ARRAY_SIZE(config.cache_regions),
		.num_pio_regions = ARRAY_SIZE(config.pio_regions),
		.num_pci_devices = ARRAY_SIZE(config.pci_devices),
    		.num_pci_caps = ARRAY_SIZE(config.pci_caps),
		.console = {
			.type = JAILHOUSE_CON_TYPE_8250,
			.flags = JAILHOUSE_CON_ACCESS_PIO,
			.address = 0x3e8,
		},
	},

	.cpus = {
		0x8,
	},

	.mem_regions = {
		/* cRTOS Shadow memory */
		{
			.phys_start = 0x176000000,
			.virt_start = 0x176000000,
			.size = 0x1000,
			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_ROOTSHARED,
		},
		{
			.phys_start = 0x176001000,
			.virt_start = 0,
			.size = 0x40000000,
			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
        JAILHOUSE_MEM_EXECUTE | JAILHOUSE_MEM_LOADABLE |
        JAILHOUSE_MEM_ROOTSHARED,
		},
		{
			.phys_start = 0x1b6001000,
			.virt_start = 0x1b6001000,
			.size = 0x4000,
			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_ROOTSHARED,
		},
		{
			.phys_start = 0x1b6005000,
			.virt_start = 0x1b6005000,
			.size = 0x4000,
			.flags = JAILHOUSE_MEM_READ| JAILHOUSE_MEM_WRITE | JAILHOUSE_MEM_ROOTSHARED,
		},
		/* communication region */ {
			//.virt_start = 0x80000000,
			.virt_start = 0x1b6010000,
			.size       = 0x00001000,
			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
				JAILHOUSE_MEM_COMM_REGION,
		},
		JAILHOUSE_SHMEM_NET_REGIONS(0x1b6205000, 1),
	},
	.cache_regions = {
		{
			.start = 0,
			.size = 2,
			.type = JAILHOUSE_CACHE_L3,
		},
	},

	.irqchips = {
		/* IOAPIC 0, GSI base 0 */
		{
			.address = 0xfec00000,
			.id = 0xff00,
			.pin_bitmap = {
				0x000001
			},
		},
	},

	.pio_regions = {
		/* Port I/O: 0020-0021 : pic1 */
    		PIO_RANGE(0x20, 0x2),
		/* Port I/O: 00a0-00a1 : pic2 */
    		PIO_RANGE(0xa0, 0x2),
		/* Port I/O: 03f8-03ff : serial */
		PIO_RANGE(0x3f8, 0x8),
		/* Port I/O: 03e8-03ef : serial */
		PIO_RANGE(0x3e8, 0x8), 
		PIO_RANGE(0x2f8, 8), /* serial 2 */
		//PIO_RANGE(0xe010, 8), /* OXPCIe952 serial */
	},
	.pci_devices = {
		{ /* Shadow */
			.type = JAILHOUSE_PCI_TYPE_IVSHMEM,
			.domain = 0x0,
			.iommu = 0,
			.bdf = 0x0d << 3,
			.bar_mask = JAILHOUSE_IVSHMEM_BAR_MASK_MSIX,
			.num_msix_vectors = 16,
			.shmem_regions_start = 0,
			.shmem_dev_id = 1,
			.shmem_peers = 2,
			.shmem_protocol = 0x0002,
		},
		 /*IVSHMEM-NET */
		{ 
			.type = JAILHOUSE_PCI_TYPE_IVSHMEM,
			.domain = 0x0,
			.iommu = 0,
			.bdf = 0x0e << 3,
			.bar_mask = JAILHOUSE_IVSHMEM_BAR_MASK_MSIX,
			.num_msix_vectors = 2,
			.shmem_regions_start = 5,
			.shmem_dev_id = 1,
			.shmem_peers = 2,
			.shmem_protocol = JAILHOUSE_SHMEM_PROTO_VETH,
		},
	},

	.pci_caps = {
		
    },
};

------=_Part_22246_1599101656.1640535693925--
