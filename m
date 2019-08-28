Return-Path: <jailhouse-dev+bncBCW3RFO4ZUCRBT7JTDVQKGQE7PQGG7I@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-ot1-x33e.google.com (mail-ot1-x33e.google.com [IPv6:2607:f8b0:4864:20::33e])
	by mail.lfdr.de (Postfix) with ESMTPS id 970059FC80
	for <lists+jailhouse-dev@lfdr.de>; Wed, 28 Aug 2019 10:01:21 +0200 (CEST)
Received: by mail-ot1-x33e.google.com with SMTP id x1sf913344oto.8
        for <lists+jailhouse-dev@lfdr.de>; Wed, 28 Aug 2019 01:01:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:date:from:to:message-id:subject:mime-version
         :x-original-sender:precedence:mailing-list:list-id:list-post
         :list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=24BUKKoG63DSJzc+HLNAyIeF0W/B61GP5/28saOGFt8=;
        b=SqGTVwKlKgBwiWRkSeoGcfFmVMKeZz2wBpOmlIvK3RcSINVKSs65KJDi1/wiZmpsaX
         b5ovrX0vEG7ZuML6sqN1QwYwy3zdC4g5lCM+6b7k40d96VUEi6lzuNqNPVxdWiJ6xqPz
         NHaa8GakWv5eSV/QyeCCI9WtXbIg6j3ECz1+ArRNMhRqRA4fUg8NOh61qZt7+YIV79gc
         tNOobuikbFGYXoSg1CFtIgSCyTkvQ/Hv1asArUI4wUt90o3+away7AKo9xmGug7esZje
         lQZ+eqCJ/vDlRVjYTHvd3y9twmFMEOo+1KaNECAO/xxWn7EgUjUeNEY82KijoSfo+UAq
         x//Q==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:message-id:subject:mime-version:x-original-sender
         :precedence:mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=24BUKKoG63DSJzc+HLNAyIeF0W/B61GP5/28saOGFt8=;
        b=b9dHd7H8+l0S+VbNNFVXnZ88mUn961u3LbEwc940+5TpP5XcbcTv92caFJX9Xbx6XN
         3RU2LD2EVHvgj+P0mVm0hdfI7A/vLEdW4NOe8f+/gKrj1JcXPomnrwHu7jBSCV31qxat
         xNDcVTFpESiXreb3s4ZBn0QT+BMui1uIir6eXKiFTm5pswVcrCDb16IcBpfnA37EQ4CE
         3xwO+F6zjfiX7+spkidjHxxtBsjyE9whfgP5muZpE9uAwEAQHVe4LMhFJZX0wtGzQ2DP
         TX9Kk7LPBkjDCHt+ubSKqtUUbNJFvS8D3kEnWnP/7igubDbg9rqQh7V8BuNf08QnCuj0
         oHDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:date:from:to:message-id:subject
         :mime-version:x-original-sender:precedence:mailing-list:list-id
         :x-spam-checked-in-group:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=24BUKKoG63DSJzc+HLNAyIeF0W/B61GP5/28saOGFt8=;
        b=ni5Kp/bzRBtjik+k45c19lG2mRaUnJc9fDnMC78LptOY7fx64zHMn36OUoaeBIw1jr
         y1w+HpSPz+KQDbqJvuc22swnT+y8j6EF1midw97jzzPHSPJRR4iHGSRGa6lm83b4ADFf
         bRIPF0UGIwRJWJzXd2VKda8LKwnIuiK9lSEHbsMCxXVA66fE/Ub13pExw79eWWSbZ0/x
         PHNIZyX4s97q4ezzwSSJZVbiMvjupGih/QEp39sviYYZaVLvvjLthCrE9m1SbK2YLooS
         SxT9qLfUC11T+0pVFxft+hlFouYUNQktV+W8B4MTkeVRtbfWgm1JWfDhJk2VonI0o5DW
         dizw==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: APjAAAWJm294OOCSiPZJj0RMjZ0/nN0Qec+QZaG579mEAWdWf+Ooswg0
	JFQLCOI+27FBs1ZXaRdcckM=
X-Google-Smtp-Source: APXvYqw33Nf7+lxzHAolqzshxa+qPavpCJMwtnJLjtlwgCwZVqeGLx9g4t0XAHsFemjz2wPp1SBnVw==
X-Received: by 2002:a9d:7dc4:: with SMTP id k4mr2205975otn.171.1566979280317;
        Wed, 28 Aug 2019 01:01:20 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a9d:36c:: with SMTP id 99ls259927otv.3.gmail; Wed, 28 Aug
 2019 01:01:19 -0700 (PDT)
X-Received: by 2002:a9d:604a:: with SMTP id v10mr2132224otj.274.1566979279442;
        Wed, 28 Aug 2019 01:01:19 -0700 (PDT)
Date: Wed, 28 Aug 2019 01:01:18 -0700 (PDT)
From: sebastiansaueressig@gmail.com
To: Jailhouse <jailhouse-dev@googlegroups.com>
Message-Id: <3335f4d5-d834-4103-a4fa-45b55164d430@googlegroups.com>
Subject: Unable to find IVSHMEM pci-device on root cell
MIME-Version: 1.0
Content-Type: multipart/mixed; 
	boundary="----=_Part_2655_1157426774.1566979278731"
X-Original-Sender: SebastianSaueressig@gmail.com
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

------=_Part_2655_1157426774.1566979278731
Content-Type: multipart/alternative; 
	boundary="----=_Part_2656_2054540285.1566979278734"

------=_Part_2656_2054540285.1566979278734
Content-Type: text/plain; charset="UTF-8"

Hallo,

I'm working to the topic *ivshmem* and still trying to connect the two 
cells.

My setup is as follows:

Root- and Inmate-Cell:

On both Linux tsn-inmate 5.3.0-rc5+ 
(http://git.kiszka.org/?p=linux.git;a=shortlog;h=refs/heads/queues/jailhouse-ivshmem2)
CONFIG_IVSHMEM_NET is enabled

jailhouse --version
Jailhouse management tool v0.11

Root-Cell:

After enabling Jailhouse root cell:

root@tsn:/home/jailhouse# cat /dev/jailhouse
<missed 188 bytes of console log>
zing processors:
 CPU 1... (APIC ID 2) OK
 CPU 0... (APIC ID 0) OK
 CPU 2... (APIC ID 4) OK
 CPU 3... (APIC ID 6) OK
Initializing unit: VT-d
DMAR unit @0xfed90000/0x1000
DMAR unit @0xfed91000/0x1000
Reserving 120 interrupt(s) for device f0:1f.0 at index 0
Initializing unit: IOAPIC
Initializing unit: Cache Allocation Technology
Initializing unit: PCI
Adding PCI device 00:00.0 to cell "RootCell"
Adding PCI device 00:02.0 to cell "RootCell"
Reserving 1 interrupt(s) for device 00:02.0 at index 120
Adding PCI device 00:08.0 to cell "RootCell"
Reserving 1 interrupt(s) for device 00:08.0 at index 121
Adding PCI device 00:14.0 to cell "RootCell"
Reserving 8 interrupt(s) for device 00:14.0 at index 122
Adding PCI device 00:14.2 to cell "RootCell"
Reserving 1 interrupt(s) for device 00:14.2 at index 130
Adding PCI device 00:17.0 to cell "RootCell"
Reserving 1 interrupt(s) for device 00:17.0 at index 131
Adding PCI device 00:1c.0 to cell "RootCell"
Reserving 1 interrupt(s) for device 00:1c.0 at index 132
Adding PCI device 00:1c.6 to cell "RootCell"
Reserving 1 interrupt(s) for device 00:1c.6 at index 133
Adding PCI device 00:1f.0 to cell "RootCell"
Adding PCI device 00:1f.2 to cell "RootCell"
Adding PCI device 00:1f.3 to cell "RootCell"
Reserving 1 interrupt(s) for device 00:1f.3 at index 134
Adding PCI device 00:1f.4 to cell "RootCell"
Adding PCI device 00:1f.6 to cell "RootCell"
Reserving 1 interrupt(s) for device 00:1f.6 at index 135
Adding virtual PCI device 03:00.0 to cell "RootCell"
Device 300 okay
Page pool usage after late setup: mem 347/974, remap 65545/131072
Activating hypervisor

Apparently the PCI device was added (03:00:00)
"Device 300 okay" - is a debug output from me

But I'm not be able to find it in the root cell.

- lspci
00:00.0 Host bridge: Intel Corporation Skylake Host Bridge/DRAM Registers (rev 
07)
00:02.0 VGA compatible controller: Intel Corporation HD Graphics 530 (rev 06
)
00:08.0 System peripheral: Intel Corporation Skylake Gaussian Mixture Model
00:14.0 USB controller: Intel Corporation Sunrise Point-H USB 3.0 xHCI 
Controller (rev 31)
00:14.2 Signal processing controller: Intel Corporation Sunrise Point-H 
Thermal subsystem (rev 31)
00:17.0 SATA controller: Intel Corporation Sunrise Point-H SATA Controller [AHCI 
mode] (rev 31)
00:1c.0 PCI bridge: Intel Corporation Sunrise Point-H PCI Express Root Port #1 
(rev f1)
00:1c.6 PCI bridge: Intel Corporation Sunrise Point-H PCI Express Root Port #7 
(rev f1)
00:1f.0 ISA bridge: Intel Corporation Sunrise Point-H LPC Controller (rev 31
)
00:1f.2 Memory controller: Intel Corporation Sunrise Point-H PMC (rev 31)
00:1f.3 Audio device: Intel Corporation Sunrise Point-H HD Audio (rev 31)
00:1f.4 SMBus: Intel Corporation Sunrise Point-H SMBus (rev 31)
00:1f.6 Ethernet controller: Intel Corporation Ethernet Connection (2) I219-LM 
(rev 31)
02:00.0 Ethernet controller: Intel Corporation I211 Gigabit Network 
Connection (rev ff)

03:00.0 missing...

When I activate the inmate cell:

root@tsn:/home/jailhouse# cat /dev/jailhouse

Adding PCI device 02:00.0 to cell "jail1-inmate"
Reserving 5 interrupt(s) for device 02:00.0 at index 136
Adding virtual PCI device 03:00.0 to cell "jail1-inmate"
Shared memory connection established: "jail1-inmate" <--> "RootCell"
Device 300 okay
Created cell "jail1-inmate"
Page pool usage after cell creation: mem 372/974, remap 65546/131072
Cell "jail1-inmate" can be loaded
CPU 2 received SIPI, vector 100
Started cell "jail1-inmate"


and I am able to find the PCI device on the inmate side.

02:00.0 Ethernet controller: Intel Corporation I211 Gigabit Network 
Connection (rev 03)
        Subsystem: Intel Corporation I211 Gigabit Network Connection
        Flags: bus master, fast devsel, latency 0, IRQ 11
        Memory at df000000 (32-bit, non-prefetchable) [size=128K]
        Memory at df020000 (32-bit, non-prefetchable) [size=16K]
        Capabilities: [40] Power Management version 3
        Capabilities: [50] MSI: Enable- Count=1/1 Maskable+ 64bit+
        Capabilities: [70] MSI-X: Enable+ Count=5 Masked-
        Capabilities: [a0] Express Endpoint, MSI 00
        Capabilities: [100] Advanced Error Reporting
        Capabilities: [1a0] Transaction Processing Hints
        Kernel driver in use: igb
lspci: Unable to load libkmod resources: error -12

03:00.0 Unassigned class [ff01]: Red Hat, Inc Inter-VM shared memory
        Subsystem: Red Hat, Inc Inter-VM shared memory
        Flags: fast devsel
        Memory at 100000000 (64-bit, non-prefetchable) [size=256]
        Memory at 100000100 (64-bit, non-prefetchable) [size=32]
        Capabilities: [50] MSI-X: Enable- Count=1 Masked-

My configurations can be found in the attachment.
Does anyone have any idea what's missing?

Many greetings . Thank you in advance.
Sebastian

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/3335f4d5-d834-4103-a4fa-45b55164d430%40googlegroups.com.

------=_Part_2656_2054540285.1566979278734
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Hallo,<br><br><div>I&#39;m working to the topic <i>ivshmem=
</i> and still trying to connect the two cells.</div><div><br></div>My setu=
p is as follows:<br><br>Root- and Inmate-Cell:<br><br><div style=3D"margin-=
left: 40px;">On both Linux tsn-inmate 5.3.0-rc5+ (http://git.kiszka.org/?p=
=3Dlinux.git;a=3Dshortlog;h=3Drefs/heads/queues/jailhouse-ivshmem2)<br></di=
v><div style=3D"margin-left: 40px;">CONFIG_IVSHMEM_NET is enabled</div><div=
 style=3D"margin-left: 40px;"><br></div><div><div style=3D"margin-left: 40p=
x;">jailhouse --version<br>Jailhouse management tool v0.11<br></div><br></d=
iv><div>Root-Cell:</div><div><br></div><div style=3D"margin-left: 40px;">Af=
ter enabling Jailhouse root cell:<br><br></div><div style=3D"margin-left: 4=
0px;"><div style=3D"background-color: rgb(250, 250, 250); border-color: rgb=
(187, 187, 187); border-style: solid; border-width: 1px; overflow-wrap: bre=
ak-word;" class=3D"prettyprint"><code class=3D"prettyprint"><div class=3D"s=
ubprettyprint"><span style=3D"color: #000;" class=3D"styled-by-prettify">ro=
ot@tsn</span><span style=3D"color: #660;" class=3D"styled-by-prettify">:</s=
pan><span style=3D"color: #080;" class=3D"styled-by-prettify">/home/</span>=
<span style=3D"color: #000;" class=3D"styled-by-prettify">jailhouse</span><=
span style=3D"color: #800;" class=3D"styled-by-prettify"># cat /dev/jailhou=
se</span><span style=3D"color: #000;" class=3D"styled-by-prettify"><br></sp=
an><span style=3D"color: #660;" class=3D"styled-by-prettify">&lt;</span><sp=
an style=3D"color: #000;" class=3D"styled-by-prettify">missed </span><span =
style=3D"color: #066;" class=3D"styled-by-prettify">188</span><span style=
=3D"color: #000;" class=3D"styled-by-prettify"> bytes of console log</span>=
<span style=3D"color: #660;" class=3D"styled-by-prettify">&gt;</span><span =
style=3D"color: #000;" class=3D"styled-by-prettify"><br>zing processors</sp=
an><span style=3D"color: #660;" class=3D"styled-by-prettify">:</span><span =
style=3D"color: #000;" class=3D"styled-by-prettify"><br>=C2=A0CPU </span><s=
pan style=3D"color: #066;" class=3D"styled-by-prettify">1.</span><span styl=
e=3D"color: #660;" class=3D"styled-by-prettify">..</span><span style=3D"col=
or: #000;" class=3D"styled-by-prettify"> </span><span style=3D"color: #660;=
" class=3D"styled-by-prettify">(</span><span style=3D"color: #000;" class=
=3D"styled-by-prettify">APIC ID </span><span style=3D"color: #066;" class=
=3D"styled-by-prettify">2</span><span style=3D"color: #660;" class=3D"style=
d-by-prettify">)</span><span style=3D"color: #000;" class=3D"styled-by-pret=
tify"> OK<br>=C2=A0CPU </span><span style=3D"color: #066;" class=3D"styled-=
by-prettify">0.</span><span style=3D"color: #660;" class=3D"styled-by-prett=
ify">..</span><span style=3D"color: #000;" class=3D"styled-by-prettify"> </=
span><span style=3D"color: #660;" class=3D"styled-by-prettify">(</span><spa=
n style=3D"color: #000;" class=3D"styled-by-prettify">APIC ID </span><span =
style=3D"color: #066;" class=3D"styled-by-prettify">0</span><span style=3D"=
color: #660;" class=3D"styled-by-prettify">)</span><span style=3D"color: #0=
00;" class=3D"styled-by-prettify"> OK<br>=C2=A0CPU </span><span style=3D"co=
lor: #066;" class=3D"styled-by-prettify">2.</span><span style=3D"color: #66=
0;" class=3D"styled-by-prettify">..</span><span style=3D"color: #000;" clas=
s=3D"styled-by-prettify"> </span><span style=3D"color: #660;" class=3D"styl=
ed-by-prettify">(</span><span style=3D"color: #000;" class=3D"styled-by-pre=
ttify">APIC ID </span><span style=3D"color: #066;" class=3D"styled-by-prett=
ify">4</span><span style=3D"color: #660;" class=3D"styled-by-prettify">)</s=
pan><span style=3D"color: #000;" class=3D"styled-by-prettify"> OK<br>=C2=A0=
CPU </span><span style=3D"color: #066;" class=3D"styled-by-prettify">3.</sp=
an><span style=3D"color: #660;" class=3D"styled-by-prettify">..</span><span=
 style=3D"color: #000;" class=3D"styled-by-prettify"> </span><span style=3D=
"color: #660;" class=3D"styled-by-prettify">(</span><span style=3D"color: #=
000;" class=3D"styled-by-prettify">APIC ID </span><span style=3D"color: #06=
6;" class=3D"styled-by-prettify">6</span><span style=3D"color: #660;" class=
=3D"styled-by-prettify">)</span><span style=3D"color: #000;" class=3D"style=
d-by-prettify"> OK<br></span><span style=3D"color: #606;" class=3D"styled-b=
y-prettify">Initializing</span><span style=3D"color: #000;" class=3D"styled=
-by-prettify"> unit</span><span style=3D"color: #660;" class=3D"styled-by-p=
rettify">:</span><span style=3D"color: #000;" class=3D"styled-by-prettify">=
 VT</span><span style=3D"color: #660;" class=3D"styled-by-prettify">-</span=
><span style=3D"color: #000;" class=3D"styled-by-prettify">d<br>DMAR unit <=
/span><span style=3D"color: #660;" class=3D"styled-by-prettify">@</span><sp=
an style=3D"color: #066;" class=3D"styled-by-prettify">0xfed90000</span><sp=
an style=3D"color: #660;" class=3D"styled-by-prettify">/</span><span style=
=3D"color: #066;" class=3D"styled-by-prettify">0x1000</span><span style=3D"=
color: #000;" class=3D"styled-by-prettify"><br>DMAR unit </span><span style=
=3D"color: #660;" class=3D"styled-by-prettify">@</span><span style=3D"color=
: #066;" class=3D"styled-by-prettify">0xfed91000</span><span style=3D"color=
: #660;" class=3D"styled-by-prettify">/</span><span style=3D"color: #066;" =
class=3D"styled-by-prettify">0x1000</span><span style=3D"color: #000;" clas=
s=3D"styled-by-prettify"><br></span><span style=3D"color: #606;" class=3D"s=
tyled-by-prettify">Reserving</span><span style=3D"color: #000;" class=3D"st=
yled-by-prettify"> </span><span style=3D"color: #066;" class=3D"styled-by-p=
rettify">120</span><span style=3D"color: #000;" class=3D"styled-by-prettify=
"> interrupt</span><span style=3D"color: #660;" class=3D"styled-by-prettify=
">(</span><span style=3D"color: #000;" class=3D"styled-by-prettify">s</span=
><span style=3D"color: #660;" class=3D"styled-by-prettify">)</span><span st=
yle=3D"color: #000;" class=3D"styled-by-prettify"> </span><span style=3D"co=
lor: #008;" class=3D"styled-by-prettify">for</span><span style=3D"color: #0=
00;" class=3D"styled-by-prettify"> device f0</span><span style=3D"color: #6=
60;" class=3D"styled-by-prettify">:</span><span style=3D"color: #066;" clas=
s=3D"styled-by-prettify">1f</span><span style=3D"color: #660;" class=3D"sty=
led-by-prettify">.</span><span style=3D"color: #066;" class=3D"styled-by-pr=
ettify">0</span><span style=3D"color: #000;" class=3D"styled-by-prettify"> =
at index </span><span style=3D"color: #066;" class=3D"styled-by-prettify">0=
</span><span style=3D"color: #000;" class=3D"styled-by-prettify"><br></span=
><span style=3D"color: #606;" class=3D"styled-by-prettify">Initializing</sp=
an><span style=3D"color: #000;" class=3D"styled-by-prettify"> unit</span><s=
pan style=3D"color: #660;" class=3D"styled-by-prettify">:</span><span style=
=3D"color: #000;" class=3D"styled-by-prettify"> IOAPIC<br></span><span styl=
e=3D"color: #606;" class=3D"styled-by-prettify">Initializing</span><span st=
yle=3D"color: #000;" class=3D"styled-by-prettify"> unit</span><span style=
=3D"color: #660;" class=3D"styled-by-prettify">:</span><span style=3D"color=
: #000;" class=3D"styled-by-prettify"> </span><span style=3D"color: #606;" =
class=3D"styled-by-prettify">Cache</span><span style=3D"color: #000;" class=
=3D"styled-by-prettify"> </span><span style=3D"color: #606;" class=3D"style=
d-by-prettify">Allocation</span><span style=3D"color: #000;" class=3D"style=
d-by-prettify"> </span><span style=3D"color: #606;" class=3D"styled-by-pret=
tify">Technology</span><span style=3D"color: #000;" class=3D"styled-by-pret=
tify"><br></span><span style=3D"color: #606;" class=3D"styled-by-prettify">=
Initializing</span><span style=3D"color: #000;" class=3D"styled-by-prettify=
"> unit</span><span style=3D"color: #660;" class=3D"styled-by-prettify">:</=
span><span style=3D"color: #000;" class=3D"styled-by-prettify"> PCI<br></sp=
an><span style=3D"color: #606;" class=3D"styled-by-prettify">Adding</span><=
span style=3D"color: #000;" class=3D"styled-by-prettify"> PCI device </span=
><span style=3D"color: #066;" class=3D"styled-by-prettify">00</span><span s=
tyle=3D"color: #660;" class=3D"styled-by-prettify">:</span><span style=3D"c=
olor: #066;" class=3D"styled-by-prettify">00.0</span><span style=3D"color: =
#000;" class=3D"styled-by-prettify"> to cell </span><span style=3D"color: #=
080;" class=3D"styled-by-prettify">&quot;RootCell&quot;</span><span style=
=3D"color: #000;" class=3D"styled-by-prettify"><br></span><span style=3D"co=
lor: #606;" class=3D"styled-by-prettify">Adding</span><span style=3D"color:=
 #000;" class=3D"styled-by-prettify"> PCI device </span><span style=3D"colo=
r: #066;" class=3D"styled-by-prettify">00</span><span style=3D"color: #660;=
" class=3D"styled-by-prettify">:</span><span style=3D"color: #066;" class=
=3D"styled-by-prettify">02.0</span><span style=3D"color: #000;" class=3D"st=
yled-by-prettify"> to cell </span><span style=3D"color: #080;" class=3D"sty=
led-by-prettify">&quot;RootCell&quot;</span><span style=3D"color: #000;" cl=
ass=3D"styled-by-prettify"><br></span><span style=3D"color: #606;" class=3D=
"styled-by-prettify">Reserving</span><span style=3D"color: #000;" class=3D"=
styled-by-prettify"> </span><span style=3D"color: #066;" class=3D"styled-by=
-prettify">1</span><span style=3D"color: #000;" class=3D"styled-by-prettify=
"> interrupt</span><span style=3D"color: #660;" class=3D"styled-by-prettify=
">(</span><span style=3D"color: #000;" class=3D"styled-by-prettify">s</span=
><span style=3D"color: #660;" class=3D"styled-by-prettify">)</span><span st=
yle=3D"color: #000;" class=3D"styled-by-prettify"> </span><span style=3D"co=
lor: #008;" class=3D"styled-by-prettify">for</span><span style=3D"color: #0=
00;" class=3D"styled-by-prettify"> device </span><span style=3D"color: #066=
;" class=3D"styled-by-prettify">00</span><span style=3D"color: #660;" class=
=3D"styled-by-prettify">:</span><span style=3D"color: #066;" class=3D"style=
d-by-prettify">02.0</span><span style=3D"color: #000;" class=3D"styled-by-p=
rettify"> at index </span><span style=3D"color: #066;" class=3D"styled-by-p=
rettify">120</span><span style=3D"color: #000;" class=3D"styled-by-prettify=
"><br></span><span style=3D"color: #606;" class=3D"styled-by-prettify">Addi=
ng</span><span style=3D"color: #000;" class=3D"styled-by-prettify"> PCI dev=
ice </span><span style=3D"color: #066;" class=3D"styled-by-prettify">00</sp=
an><span style=3D"color: #660;" class=3D"styled-by-prettify">:</span><span =
style=3D"color: #066;" class=3D"styled-by-prettify">08.0</span><span style=
=3D"color: #000;" class=3D"styled-by-prettify"> to cell </span><span style=
=3D"color: #080;" class=3D"styled-by-prettify">&quot;RootCell&quot;</span><=
span style=3D"color: #000;" class=3D"styled-by-prettify"><br></span><span s=
tyle=3D"color: #606;" class=3D"styled-by-prettify">Reserving</span><span st=
yle=3D"color: #000;" class=3D"styled-by-prettify"> </span><span style=3D"co=
lor: #066;" class=3D"styled-by-prettify">1</span><span style=3D"color: #000=
;" class=3D"styled-by-prettify"> interrupt</span><span style=3D"color: #660=
;" class=3D"styled-by-prettify">(</span><span style=3D"color: #000;" class=
=3D"styled-by-prettify">s</span><span style=3D"color: #660;" class=3D"style=
d-by-prettify">)</span><span style=3D"color: #000;" class=3D"styled-by-pret=
tify"> </span><span style=3D"color: #008;" class=3D"styled-by-prettify">for=
</span><span style=3D"color: #000;" class=3D"styled-by-prettify"> device </=
span><span style=3D"color: #066;" class=3D"styled-by-prettify">00</span><sp=
an style=3D"color: #660;" class=3D"styled-by-prettify">:</span><span style=
=3D"color: #066;" class=3D"styled-by-prettify">08.0</span><span style=3D"co=
lor: #000;" class=3D"styled-by-prettify"> at index </span><span style=3D"co=
lor: #066;" class=3D"styled-by-prettify">121</span><span style=3D"color: #0=
00;" class=3D"styled-by-prettify"><br></span><span style=3D"color: #606;" c=
lass=3D"styled-by-prettify">Adding</span><span style=3D"color: #000;" class=
=3D"styled-by-prettify"> PCI device </span><span style=3D"color: #066;" cla=
ss=3D"styled-by-prettify">00</span><span style=3D"color: #660;" class=3D"st=
yled-by-prettify">:</span><span style=3D"color: #066;" class=3D"styled-by-p=
rettify">14.0</span><span style=3D"color: #000;" class=3D"styled-by-prettif=
y"> to cell </span><span style=3D"color: #080;" class=3D"styled-by-prettify=
">&quot;RootCell&quot;</span><span style=3D"color: #000;" class=3D"styled-b=
y-prettify"><br></span><span style=3D"color: #606;" class=3D"styled-by-pret=
tify">Reserving</span><span style=3D"color: #000;" class=3D"styled-by-prett=
ify"> </span><span style=3D"color: #066;" class=3D"styled-by-prettify">8</s=
pan><span style=3D"color: #000;" class=3D"styled-by-prettify"> interrupt</s=
pan><span style=3D"color: #660;" class=3D"styled-by-prettify">(</span><span=
 style=3D"color: #000;" class=3D"styled-by-prettify">s</span><span style=3D=
"color: #660;" class=3D"styled-by-prettify">)</span><span style=3D"color: #=
000;" class=3D"styled-by-prettify"> </span><span style=3D"color: #008;" cla=
ss=3D"styled-by-prettify">for</span><span style=3D"color: #000;" class=3D"s=
tyled-by-prettify"> device </span><span style=3D"color: #066;" class=3D"sty=
led-by-prettify">00</span><span style=3D"color: #660;" class=3D"styled-by-p=
rettify">:</span><span style=3D"color: #066;" class=3D"styled-by-prettify">=
14.0</span><span style=3D"color: #000;" class=3D"styled-by-prettify"> at in=
dex </span><span style=3D"color: #066;" class=3D"styled-by-prettify">122</s=
pan><span style=3D"color: #000;" class=3D"styled-by-prettify"><br></span><s=
pan style=3D"color: #606;" class=3D"styled-by-prettify">Adding</span><span =
style=3D"color: #000;" class=3D"styled-by-prettify"> PCI device </span><spa=
n style=3D"color: #066;" class=3D"styled-by-prettify">00</span><span style=
=3D"color: #660;" class=3D"styled-by-prettify">:</span><span style=3D"color=
: #066;" class=3D"styled-by-prettify">14.2</span><span style=3D"color: #000=
;" class=3D"styled-by-prettify"> to cell </span><span style=3D"color: #080;=
" class=3D"styled-by-prettify">&quot;RootCell&quot;</span><span style=3D"co=
lor: #000;" class=3D"styled-by-prettify"><br></span><span style=3D"color: #=
606;" class=3D"styled-by-prettify">Reserving</span><span style=3D"color: #0=
00;" class=3D"styled-by-prettify"> </span><span style=3D"color: #066;" clas=
s=3D"styled-by-prettify">1</span><span style=3D"color: #000;" class=3D"styl=
ed-by-prettify"> interrupt</span><span style=3D"color: #660;" class=3D"styl=
ed-by-prettify">(</span><span style=3D"color: #000;" class=3D"styled-by-pre=
ttify">s</span><span style=3D"color: #660;" class=3D"styled-by-prettify">)<=
/span><span style=3D"color: #000;" class=3D"styled-by-prettify"> </span><sp=
an style=3D"color: #008;" class=3D"styled-by-prettify">for</span><span styl=
e=3D"color: #000;" class=3D"styled-by-prettify"> device </span><span style=
=3D"color: #066;" class=3D"styled-by-prettify">00</span><span style=3D"colo=
r: #660;" class=3D"styled-by-prettify">:</span><span style=3D"color: #066;"=
 class=3D"styled-by-prettify">14.2</span><span style=3D"color: #000;" class=
=3D"styled-by-prettify"> at index </span><span style=3D"color: #066;" class=
=3D"styled-by-prettify">130</span><span style=3D"color: #000;" class=3D"sty=
led-by-prettify"><br></span><span style=3D"color: #606;" class=3D"styled-by=
-prettify">Adding</span><span style=3D"color: #000;" class=3D"styled-by-pre=
ttify"> PCI device </span><span style=3D"color: #066;" class=3D"styled-by-p=
rettify">00</span><span style=3D"color: #660;" class=3D"styled-by-prettify"=
>:</span><span style=3D"color: #066;" class=3D"styled-by-prettify">17.0</sp=
an><span style=3D"color: #000;" class=3D"styled-by-prettify"> to cell </spa=
n><span style=3D"color: #080;" class=3D"styled-by-prettify">&quot;RootCell&=
quot;</span><span style=3D"color: #000;" class=3D"styled-by-prettify"><br><=
/span><span style=3D"color: #606;" class=3D"styled-by-prettify">Reserving</=
span><span style=3D"color: #000;" class=3D"styled-by-prettify"> </span><spa=
n style=3D"color: #066;" class=3D"styled-by-prettify">1</span><span style=
=3D"color: #000;" class=3D"styled-by-prettify"> interrupt</span><span style=
=3D"color: #660;" class=3D"styled-by-prettify">(</span><span style=3D"color=
: #000;" class=3D"styled-by-prettify">s</span><span style=3D"color: #660;" =
class=3D"styled-by-prettify">)</span><span style=3D"color: #000;" class=3D"=
styled-by-prettify"> </span><span style=3D"color: #008;" class=3D"styled-by=
-prettify">for</span><span style=3D"color: #000;" class=3D"styled-by-pretti=
fy"> device </span><span style=3D"color: #066;" class=3D"styled-by-prettify=
">00</span><span style=3D"color: #660;" class=3D"styled-by-prettify">:</spa=
n><span style=3D"color: #066;" class=3D"styled-by-prettify">17.0</span><spa=
n style=3D"color: #000;" class=3D"styled-by-prettify"> at index </span><spa=
n style=3D"color: #066;" class=3D"styled-by-prettify">131</span><span style=
=3D"color: #000;" class=3D"styled-by-prettify"><br></span><span style=3D"co=
lor: #606;" class=3D"styled-by-prettify">Adding</span><span style=3D"color:=
 #000;" class=3D"styled-by-prettify"> PCI device </span><span style=3D"colo=
r: #066;" class=3D"styled-by-prettify">00</span><span style=3D"color: #660;=
" class=3D"styled-by-prettify">:</span><span style=3D"color: #066;" class=
=3D"styled-by-prettify">1c</span><span style=3D"color: #660;" class=3D"styl=
ed-by-prettify">.</span><span style=3D"color: #066;" class=3D"styled-by-pre=
ttify">0</span><span style=3D"color: #000;" class=3D"styled-by-prettify"> t=
o cell </span><span style=3D"color: #080;" class=3D"styled-by-prettify">&qu=
ot;RootCell&quot;</span><span style=3D"color: #000;" class=3D"styled-by-pre=
ttify"><br></span><span style=3D"color: #606;" class=3D"styled-by-prettify"=
>Reserving</span><span style=3D"color: #000;" class=3D"styled-by-prettify">=
 </span><span style=3D"color: #066;" class=3D"styled-by-prettify">1</span><=
span style=3D"color: #000;" class=3D"styled-by-prettify"> interrupt</span><=
span style=3D"color: #660;" class=3D"styled-by-prettify">(</span><span styl=
e=3D"color: #000;" class=3D"styled-by-prettify">s</span><span style=3D"colo=
r: #660;" class=3D"styled-by-prettify">)</span><span style=3D"color: #000;"=
 class=3D"styled-by-prettify"> </span><span style=3D"color: #008;" class=3D=
"styled-by-prettify">for</span><span style=3D"color: #000;" class=3D"styled=
-by-prettify"> device </span><span style=3D"color: #066;" class=3D"styled-b=
y-prettify">00</span><span style=3D"color: #660;" class=3D"styled-by-pretti=
fy">:</span><span style=3D"color: #066;" class=3D"styled-by-prettify">1c</s=
pan><span style=3D"color: #660;" class=3D"styled-by-prettify">.</span><span=
 style=3D"color: #066;" class=3D"styled-by-prettify">0</span><span style=3D=
"color: #000;" class=3D"styled-by-prettify"> at index </span><span style=3D=
"color: #066;" class=3D"styled-by-prettify">132</span><span style=3D"color:=
 #000;" class=3D"styled-by-prettify"><br></span><span style=3D"color: #606;=
" class=3D"styled-by-prettify">Adding</span><span style=3D"color: #000;" cl=
ass=3D"styled-by-prettify"> PCI device </span><span style=3D"color: #066;" =
class=3D"styled-by-prettify">00</span><span style=3D"color: #660;" class=3D=
"styled-by-prettify">:</span><span style=3D"color: #066;" class=3D"styled-b=
y-prettify">1c</span><span style=3D"color: #660;" class=3D"styled-by-pretti=
fy">.</span><span style=3D"color: #066;" class=3D"styled-by-prettify">6</sp=
an><span style=3D"color: #000;" class=3D"styled-by-prettify"> to cell </spa=
n><span style=3D"color: #080;" class=3D"styled-by-prettify">&quot;RootCell&=
quot;</span><span style=3D"color: #000;" class=3D"styled-by-prettify"><br><=
/span><span style=3D"color: #606;" class=3D"styled-by-prettify">Reserving</=
span><span style=3D"color: #000;" class=3D"styled-by-prettify"> </span><spa=
n style=3D"color: #066;" class=3D"styled-by-prettify">1</span><span style=
=3D"color: #000;" class=3D"styled-by-prettify"> interrupt</span><span style=
=3D"color: #660;" class=3D"styled-by-prettify">(</span><span style=3D"color=
: #000;" class=3D"styled-by-prettify">s</span><span style=3D"color: #660;" =
class=3D"styled-by-prettify">)</span><span style=3D"color: #000;" class=3D"=
styled-by-prettify"> </span><span style=3D"color: #008;" class=3D"styled-by=
-prettify">for</span><span style=3D"color: #000;" class=3D"styled-by-pretti=
fy"> device </span><span style=3D"color: #066;" class=3D"styled-by-prettify=
">00</span><span style=3D"color: #660;" class=3D"styled-by-prettify">:</spa=
n><span style=3D"color: #066;" class=3D"styled-by-prettify">1c</span><span =
style=3D"color: #660;" class=3D"styled-by-prettify">.</span><span style=3D"=
color: #066;" class=3D"styled-by-prettify">6</span><span style=3D"color: #0=
00;" class=3D"styled-by-prettify"> at index </span><span style=3D"color: #0=
66;" class=3D"styled-by-prettify">133</span><span style=3D"color: #000;" cl=
ass=3D"styled-by-prettify"><br></span><span style=3D"color: #606;" class=3D=
"styled-by-prettify">Adding</span><span style=3D"color: #000;" class=3D"sty=
led-by-prettify"> PCI device </span><span style=3D"color: #066;" class=3D"s=
tyled-by-prettify">00</span><span style=3D"color: #660;" class=3D"styled-by=
-prettify">:</span><span style=3D"color: #066;" class=3D"styled-by-prettify=
">1f</span><span style=3D"color: #660;" class=3D"styled-by-prettify">.</spa=
n><span style=3D"color: #066;" class=3D"styled-by-prettify">0</span><span s=
tyle=3D"color: #000;" class=3D"styled-by-prettify"> to cell </span><span st=
yle=3D"color: #080;" class=3D"styled-by-prettify">&quot;RootCell&quot;</spa=
n><span style=3D"color: #000;" class=3D"styled-by-prettify"><br></span><spa=
n style=3D"color: #606;" class=3D"styled-by-prettify">Adding</span><span st=
yle=3D"color: #000;" class=3D"styled-by-prettify"> PCI device </span><span =
style=3D"color: #066;" class=3D"styled-by-prettify">00</span><span style=3D=
"color: #660;" class=3D"styled-by-prettify">:</span><span style=3D"color: #=
066;" class=3D"styled-by-prettify">1f</span><span style=3D"color: #660;" cl=
ass=3D"styled-by-prettify">.</span><span style=3D"color: #066;" class=3D"st=
yled-by-prettify">2</span><span style=3D"color: #000;" class=3D"styled-by-p=
rettify"> to cell </span><span style=3D"color: #080;" class=3D"styled-by-pr=
ettify">&quot;RootCell&quot;</span><span style=3D"color: #000;" class=3D"st=
yled-by-prettify"><br></span><span style=3D"color: #606;" class=3D"styled-b=
y-prettify">Adding</span><span style=3D"color: #000;" class=3D"styled-by-pr=
ettify"> PCI device </span><span style=3D"color: #066;" class=3D"styled-by-=
prettify">00</span><span style=3D"color: #660;" class=3D"styled-by-prettify=
">:</span><span style=3D"color: #066;" class=3D"styled-by-prettify">1f</spa=
n><span style=3D"color: #660;" class=3D"styled-by-prettify">.</span><span s=
tyle=3D"color: #066;" class=3D"styled-by-prettify">3</span><span style=3D"c=
olor: #000;" class=3D"styled-by-prettify"> to cell </span><span style=3D"co=
lor: #080;" class=3D"styled-by-prettify">&quot;RootCell&quot;</span><span s=
tyle=3D"color: #000;" class=3D"styled-by-prettify"><br></span><span style=
=3D"color: #606;" class=3D"styled-by-prettify">Reserving</span><span style=
=3D"color: #000;" class=3D"styled-by-prettify"> </span><span style=3D"color=
: #066;" class=3D"styled-by-prettify">1</span><span style=3D"color: #000;" =
class=3D"styled-by-prettify"> interrupt</span><span style=3D"color: #660;" =
class=3D"styled-by-prettify">(</span><span style=3D"color: #000;" class=3D"=
styled-by-prettify">s</span><span style=3D"color: #660;" class=3D"styled-by=
-prettify">)</span><span style=3D"color: #000;" class=3D"styled-by-prettify=
"> </span><span style=3D"color: #008;" class=3D"styled-by-prettify">for</sp=
an><span style=3D"color: #000;" class=3D"styled-by-prettify"> device </span=
><span style=3D"color: #066;" class=3D"styled-by-prettify">00</span><span s=
tyle=3D"color: #660;" class=3D"styled-by-prettify">:</span><span style=3D"c=
olor: #066;" class=3D"styled-by-prettify">1f</span><span style=3D"color: #6=
60;" class=3D"styled-by-prettify">.</span><span style=3D"color: #066;" clas=
s=3D"styled-by-prettify">3</span><span style=3D"color: #000;" class=3D"styl=
ed-by-prettify"> at index </span><span style=3D"color: #066;" class=3D"styl=
ed-by-prettify">134</span><span style=3D"color: #000;" class=3D"styled-by-p=
rettify"><br></span><span style=3D"color: #606;" class=3D"styled-by-prettif=
y">Adding</span><span style=3D"color: #000;" class=3D"styled-by-prettify"> =
PCI device </span><span style=3D"color: #066;" class=3D"styled-by-prettify"=
>00</span><span style=3D"color: #660;" class=3D"styled-by-prettify">:</span=
><span style=3D"color: #066;" class=3D"styled-by-prettify">1f</span><span s=
tyle=3D"color: #660;" class=3D"styled-by-prettify">.</span><span style=3D"c=
olor: #066;" class=3D"styled-by-prettify">4</span><span style=3D"color: #00=
0;" class=3D"styled-by-prettify"> to cell </span><span style=3D"color: #080=
;" class=3D"styled-by-prettify">&quot;RootCell&quot;</span><span style=3D"c=
olor: #000;" class=3D"styled-by-prettify"><br></span><span style=3D"color: =
#606;" class=3D"styled-by-prettify">Adding</span><span style=3D"color: #000=
;" class=3D"styled-by-prettify"> PCI device </span><span style=3D"color: #0=
66;" class=3D"styled-by-prettify">00</span><span style=3D"color: #660;" cla=
ss=3D"styled-by-prettify">:</span><span style=3D"color: #066;" class=3D"sty=
led-by-prettify">1f</span><span style=3D"color: #660;" class=3D"styled-by-p=
rettify">.</span><span style=3D"color: #066;" class=3D"styled-by-prettify">=
6</span><span style=3D"color: #000;" class=3D"styled-by-prettify"> to cell =
</span><span style=3D"color: #080;" class=3D"styled-by-prettify">&quot;Root=
Cell&quot;</span><span style=3D"color: #000;" class=3D"styled-by-prettify">=
<br></span><span style=3D"color: #606;" class=3D"styled-by-prettify">Reserv=
ing</span><span style=3D"color: #000;" class=3D"styled-by-prettify"> </span=
><span style=3D"color: #066;" class=3D"styled-by-prettify">1</span><span st=
yle=3D"color: #000;" class=3D"styled-by-prettify"> interrupt</span><span st=
yle=3D"color: #660;" class=3D"styled-by-prettify">(</span><span style=3D"co=
lor: #000;" class=3D"styled-by-prettify">s</span><span style=3D"color: #660=
;" class=3D"styled-by-prettify">)</span><span style=3D"color: #000;" class=
=3D"styled-by-prettify"> </span><span style=3D"color: #008;" class=3D"style=
d-by-prettify">for</span><span style=3D"color: #000;" class=3D"styled-by-pr=
ettify"> device </span><span style=3D"color: #066;" class=3D"styled-by-pret=
tify">00</span><span style=3D"color: #660;" class=3D"styled-by-prettify">:<=
/span><span style=3D"color: #066;" class=3D"styled-by-prettify">1f</span><s=
pan style=3D"color: #660;" class=3D"styled-by-prettify">.</span><span style=
=3D"color: #066;" class=3D"styled-by-prettify">6</span><span style=3D"color=
: #000;" class=3D"styled-by-prettify"> at index </span><span style=3D"color=
: #066;" class=3D"styled-by-prettify">135</span><span style=3D"color: #000;=
" class=3D"styled-by-prettify"><br></span><span style=3D"color: #606;" clas=
s=3D"styled-by-prettify">Adding</span><span style=3D"color: #000;" class=3D=
"styled-by-prettify"> </span><span style=3D"color: #008;" class=3D"styled-b=
y-prettify">virtual</span><span style=3D"color: #000;" class=3D"styled-by-p=
rettify"> PCI device </span><span style=3D"color: #066;" class=3D"styled-by=
-prettify">03</span><span style=3D"color: #660;" class=3D"styled-by-prettif=
y">:</span><span style=3D"color: #066;" class=3D"styled-by-prettify">00.0</=
span><span style=3D"color: #000;" class=3D"styled-by-prettify"> to cell </s=
pan><span style=3D"color: #080;" class=3D"styled-by-prettify">&quot;RootCel=
l&quot;</span><span style=3D"color: #000;" class=3D"styled-by-prettify"><br=
></span><span style=3D"color: #606;" class=3D"styled-by-prettify">Device</s=
pan><span style=3D"color: #000;" class=3D"styled-by-prettify"> </span><span=
 style=3D"color: #066;" class=3D"styled-by-prettify">300</span><span style=
=3D"color: #000;" class=3D"styled-by-prettify"> okay<br></span><span style=
=3D"color: #606;" class=3D"styled-by-prettify">Page</span><span style=3D"co=
lor: #000;" class=3D"styled-by-prettify"> pool usage after late setup</span=
><span style=3D"color: #660;" class=3D"styled-by-prettify">:</span><span st=
yle=3D"color: #000;" class=3D"styled-by-prettify"> mem </span><span style=
=3D"color: #066;" class=3D"styled-by-prettify">347</span><span style=3D"col=
or: #660;" class=3D"styled-by-prettify">/</span><span style=3D"color: #066;=
" class=3D"styled-by-prettify">974</span><span style=3D"color: #660;" class=
=3D"styled-by-prettify">,</span><span style=3D"color: #000;" class=3D"style=
d-by-prettify"> remap </span><span style=3D"color: #066;" class=3D"styled-b=
y-prettify">65545</span><span style=3D"color: #660;" class=3D"styled-by-pre=
ttify">/</span><span style=3D"color: #066;" class=3D"styled-by-prettify">13=
1072</span><span style=3D"color: #000;" class=3D"styled-by-prettify"><br></=
span><span style=3D"color: #606;" class=3D"styled-by-prettify">Activating</=
span><span style=3D"color: #000;" class=3D"styled-by-prettify"> hypervisor<=
/span></div></code></div><br>Apparently the PCI device was added (03:00:00)=
</div><div style=3D"margin-left: 40px;">&quot;Device 300 okay&quot; - is a =
debug output from me</div><div style=3D"margin-left: 40px;"><br></div><div =
style=3D"margin-left: 40px;">But I&#39;m not be able to find it in the root=
 cell.<br></div><div><br></div><div style=3D"margin-left: 40px;"><div style=
=3D"background-color: rgb(250, 250, 250); border-color: rgb(187, 187, 187);=
 border-style: solid; border-width: 1px; overflow-wrap: break-word;" class=
=3D"prettyprint"><code class=3D"prettyprint"><div class=3D"subprettyprint">=
<span style=3D"color: #660;" class=3D"styled-by-prettify">-</span><span sty=
le=3D"color: #000;" class=3D"styled-by-prettify"> lspci<br></span><span sty=
le=3D"color: #066;" class=3D"styled-by-prettify">00</span><span style=3D"co=
lor: #660;" class=3D"styled-by-prettify">:</span><span style=3D"color: #066=
;" class=3D"styled-by-prettify">00.0</span><span style=3D"color: #000;" cla=
ss=3D"styled-by-prettify"> </span><span style=3D"color: #606;" class=3D"sty=
led-by-prettify">Host</span><span style=3D"color: #000;" class=3D"styled-by=
-prettify"> bridge</span><span style=3D"color: #660;" class=3D"styled-by-pr=
ettify">:</span><span style=3D"color: #000;" class=3D"styled-by-prettify"> =
</span><span style=3D"color: #606;" class=3D"styled-by-prettify">Intel</spa=
n><span style=3D"color: #000;" class=3D"styled-by-prettify"> </span><span s=
tyle=3D"color: #606;" class=3D"styled-by-prettify">Corporation</span><span =
style=3D"color: #000;" class=3D"styled-by-prettify"> </span><span style=3D"=
color: #606;" class=3D"styled-by-prettify">Skylake</span><span style=3D"col=
or: #000;" class=3D"styled-by-prettify"> </span><span style=3D"color: #606;=
" class=3D"styled-by-prettify">Host</span><span style=3D"color: #000;" clas=
s=3D"styled-by-prettify"> </span><span style=3D"color: #606;" class=3D"styl=
ed-by-prettify">Bridge</span><span style=3D"color: #660;" class=3D"styled-b=
y-prettify">/</span><span style=3D"color: #000;" class=3D"styled-by-prettif=
y">DRAM </span><span style=3D"color: #606;" class=3D"styled-by-prettify">Re=
gisters</span><span style=3D"color: #000;" class=3D"styled-by-prettify"> </=
span><span style=3D"color: #660;" class=3D"styled-by-prettify">(</span><spa=
n style=3D"color: #000;" class=3D"styled-by-prettify">rev </span><span styl=
e=3D"color: #066;" class=3D"styled-by-prettify">07</span><span style=3D"col=
or: #660;" class=3D"styled-by-prettify">)</span><span style=3D"color: #000;=
" class=3D"styled-by-prettify"><br></span><span style=3D"color: #066;" clas=
s=3D"styled-by-prettify">00</span><span style=3D"color: #660;" class=3D"sty=
led-by-prettify">:</span><span style=3D"color: #066;" class=3D"styled-by-pr=
ettify">02.0</span><span style=3D"color: #000;" class=3D"styled-by-prettify=
"> VGA compatible controller</span><span style=3D"color: #660;" class=3D"st=
yled-by-prettify">:</span><span style=3D"color: #000;" class=3D"styled-by-p=
rettify"> </span><span style=3D"color: #606;" class=3D"styled-by-prettify">=
Intel</span><span style=3D"color: #000;" class=3D"styled-by-prettify"> </sp=
an><span style=3D"color: #606;" class=3D"styled-by-prettify">Corporation</s=
pan><span style=3D"color: #000;" class=3D"styled-by-prettify"> HD </span><s=
pan style=3D"color: #606;" class=3D"styled-by-prettify">Graphics</span><spa=
n style=3D"color: #000;" class=3D"styled-by-prettify"> </span><span style=
=3D"color: #066;" class=3D"styled-by-prettify">530</span><span style=3D"col=
or: #000;" class=3D"styled-by-prettify"> </span><span style=3D"color: #660;=
" class=3D"styled-by-prettify">(</span><span style=3D"color: #000;" class=
=3D"styled-by-prettify">rev </span><span style=3D"color: #066;" class=3D"st=
yled-by-prettify">06</span><span style=3D"color: #660;" class=3D"styled-by-=
prettify">)</span><span style=3D"color: #000;" class=3D"styled-by-prettify"=
><br></span><span style=3D"color: #066;" class=3D"styled-by-prettify">00</s=
pan><span style=3D"color: #660;" class=3D"styled-by-prettify">:</span><span=
 style=3D"color: #066;" class=3D"styled-by-prettify">08.0</span><span style=
=3D"color: #000;" class=3D"styled-by-prettify"> </span><span style=3D"color=
: #606;" class=3D"styled-by-prettify">System</span><span style=3D"color: #0=
00;" class=3D"styled-by-prettify"> peripheral</span><span style=3D"color: #=
660;" class=3D"styled-by-prettify">:</span><span style=3D"color: #000;" cla=
ss=3D"styled-by-prettify"> </span><span style=3D"color: #606;" class=3D"sty=
led-by-prettify">Intel</span><span style=3D"color: #000;" class=3D"styled-b=
y-prettify"> </span><span style=3D"color: #606;" class=3D"styled-by-prettif=
y">Corporation</span><span style=3D"color: #000;" class=3D"styled-by-pretti=
fy"> </span><span style=3D"color: #606;" class=3D"styled-by-prettify">Skyla=
ke</span><span style=3D"color: #000;" class=3D"styled-by-prettify"> </span>=
<span style=3D"color: #606;" class=3D"styled-by-prettify">Gaussian</span><s=
pan style=3D"color: #000;" class=3D"styled-by-prettify"> </span><span style=
=3D"color: #606;" class=3D"styled-by-prettify">Mixture</span><span style=3D=
"color: #000;" class=3D"styled-by-prettify"> </span><span style=3D"color: #=
606;" class=3D"styled-by-prettify">Model</span><span style=3D"color: #000;"=
 class=3D"styled-by-prettify"><br></span><span style=3D"color: #066;" class=
=3D"styled-by-prettify">00</span><span style=3D"color: #660;" class=3D"styl=
ed-by-prettify">:</span><span style=3D"color: #066;" class=3D"styled-by-pre=
ttify">14.0</span><span style=3D"color: #000;" class=3D"styled-by-prettify"=
> USB controller</span><span style=3D"color: #660;" class=3D"styled-by-pret=
tify">:</span><span style=3D"color: #000;" class=3D"styled-by-prettify"> </=
span><span style=3D"color: #606;" class=3D"styled-by-prettify">Intel</span>=
<span style=3D"color: #000;" class=3D"styled-by-prettify"> </span><span sty=
le=3D"color: #606;" class=3D"styled-by-prettify">Corporation</span><span st=
yle=3D"color: #000;" class=3D"styled-by-prettify"> </span><span style=3D"co=
lor: #606;" class=3D"styled-by-prettify">Sunrise</span><span style=3D"color=
: #000;" class=3D"styled-by-prettify"> </span><span style=3D"color: #606;" =
class=3D"styled-by-prettify">Point</span><span style=3D"color: #660;" class=
=3D"styled-by-prettify">-</span><span style=3D"color: #000;" class=3D"style=
d-by-prettify">H USB </span><span style=3D"color: #066;" class=3D"styled-by=
-prettify">3.0</span><span style=3D"color: #000;" class=3D"styled-by-pretti=
fy"> xHCI </span><span style=3D"color: #606;" class=3D"styled-by-prettify">=
Controller</span><span style=3D"color: #000;" class=3D"styled-by-prettify">=
 </span><span style=3D"color: #660;" class=3D"styled-by-prettify">(</span><=
span style=3D"color: #000;" class=3D"styled-by-prettify">rev </span><span s=
tyle=3D"color: #066;" class=3D"styled-by-prettify">31</span><span style=3D"=
color: #660;" class=3D"styled-by-prettify">)</span><span style=3D"color: #0=
00;" class=3D"styled-by-prettify"><br></span><span style=3D"color: #066;" c=
lass=3D"styled-by-prettify">00</span><span style=3D"color: #660;" class=3D"=
styled-by-prettify">:</span><span style=3D"color: #066;" class=3D"styled-by=
-prettify">14.2</span><span style=3D"color: #000;" class=3D"styled-by-prett=
ify"> </span><span style=3D"color: #606;" class=3D"styled-by-prettify">Sign=
al</span><span style=3D"color: #000;" class=3D"styled-by-prettify"> process=
ing controller</span><span style=3D"color: #660;" class=3D"styled-by-pretti=
fy">:</span><span style=3D"color: #000;" class=3D"styled-by-prettify"> </sp=
an><span style=3D"color: #606;" class=3D"styled-by-prettify">Intel</span><s=
pan style=3D"color: #000;" class=3D"styled-by-prettify"> </span><span style=
=3D"color: #606;" class=3D"styled-by-prettify">Corporation</span><span styl=
e=3D"color: #000;" class=3D"styled-by-prettify"> </span><span style=3D"colo=
r: #606;" class=3D"styled-by-prettify">Sunrise</span><span style=3D"color: =
#000;" class=3D"styled-by-prettify"> </span><span style=3D"color: #606;" cl=
ass=3D"styled-by-prettify">Point</span><span style=3D"color: #660;" class=
=3D"styled-by-prettify">-</span><span style=3D"color: #000;" class=3D"style=
d-by-prettify">H </span><span style=3D"color: #606;" class=3D"styled-by-pre=
ttify">Thermal</span><span style=3D"color: #000;" class=3D"styled-by-pretti=
fy"> subsystem </span><span style=3D"color: #660;" class=3D"styled-by-prett=
ify">(</span><span style=3D"color: #000;" class=3D"styled-by-prettify">rev =
</span><span style=3D"color: #066;" class=3D"styled-by-prettify">31</span><=
span style=3D"color: #660;" class=3D"styled-by-prettify">)</span><span styl=
e=3D"color: #000;" class=3D"styled-by-prettify"><br></span><span style=3D"c=
olor: #066;" class=3D"styled-by-prettify">00</span><span style=3D"color: #6=
60;" class=3D"styled-by-prettify">:</span><span style=3D"color: #066;" clas=
s=3D"styled-by-prettify">17.0</span><span style=3D"color: #000;" class=3D"s=
tyled-by-prettify"> SATA controller</span><span style=3D"color: #660;" clas=
s=3D"styled-by-prettify">:</span><span style=3D"color: #000;" class=3D"styl=
ed-by-prettify"> </span><span style=3D"color: #606;" class=3D"styled-by-pre=
ttify">Intel</span><span style=3D"color: #000;" class=3D"styled-by-prettify=
"> </span><span style=3D"color: #606;" class=3D"styled-by-prettify">Corpora=
tion</span><span style=3D"color: #000;" class=3D"styled-by-prettify"> </spa=
n><span style=3D"color: #606;" class=3D"styled-by-prettify">Sunrise</span><=
span style=3D"color: #000;" class=3D"styled-by-prettify"> </span><span styl=
e=3D"color: #606;" class=3D"styled-by-prettify">Point</span><span style=3D"=
color: #660;" class=3D"styled-by-prettify">-</span><span style=3D"color: #0=
00;" class=3D"styled-by-prettify">H SATA </span><span style=3D"color: #606;=
" class=3D"styled-by-prettify">Controller</span><span style=3D"color: #000;=
" class=3D"styled-by-prettify"> </span><span style=3D"color: #660;" class=
=3D"styled-by-prettify">[</span><span style=3D"color: #000;" class=3D"style=
d-by-prettify">AHCI mode</span><span style=3D"color: #660;" class=3D"styled=
-by-prettify">]</span><span style=3D"color: #000;" class=3D"styled-by-prett=
ify"> </span><span style=3D"color: #660;" class=3D"styled-by-prettify">(</s=
pan><span style=3D"color: #000;" class=3D"styled-by-prettify">rev </span><s=
pan style=3D"color: #066;" class=3D"styled-by-prettify">31</span><span styl=
e=3D"color: #660;" class=3D"styled-by-prettify">)</span><span style=3D"colo=
r: #000;" class=3D"styled-by-prettify"><br></span><span style=3D"color: #06=
6;" class=3D"styled-by-prettify">00</span><span style=3D"color: #660;" clas=
s=3D"styled-by-prettify">:</span><span style=3D"color: #066;" class=3D"styl=
ed-by-prettify">1c</span><span style=3D"color: #660;" class=3D"styled-by-pr=
ettify">.</span><span style=3D"color: #066;" class=3D"styled-by-prettify">0=
</span><span style=3D"color: #000;" class=3D"styled-by-prettify"> PCI bridg=
e</span><span style=3D"color: #660;" class=3D"styled-by-prettify">:</span><=
span style=3D"color: #000;" class=3D"styled-by-prettify"> </span><span styl=
e=3D"color: #606;" class=3D"styled-by-prettify">Intel</span><span style=3D"=
color: #000;" class=3D"styled-by-prettify"> </span><span style=3D"color: #6=
06;" class=3D"styled-by-prettify">Corporation</span><span style=3D"color: #=
000;" class=3D"styled-by-prettify"> </span><span style=3D"color: #606;" cla=
ss=3D"styled-by-prettify">Sunrise</span><span style=3D"color: #000;" class=
=3D"styled-by-prettify"> </span><span style=3D"color: #606;" class=3D"style=
d-by-prettify">Point</span><span style=3D"color: #660;" class=3D"styled-by-=
prettify">-</span><span style=3D"color: #000;" class=3D"styled-by-prettify"=
>H PCI </span><span style=3D"color: #606;" class=3D"styled-by-prettify">Exp=
ress</span><span style=3D"color: #000;" class=3D"styled-by-prettify"> </spa=
n><span style=3D"color: #606;" class=3D"styled-by-prettify">Root</span><spa=
n style=3D"color: #000;" class=3D"styled-by-prettify"> </span><span style=
=3D"color: #606;" class=3D"styled-by-prettify">Port</span><span style=3D"co=
lor: #000;" class=3D"styled-by-prettify"> </span><span style=3D"color: #800=
;" class=3D"styled-by-prettify">#1 (rev f1)</span><span style=3D"color: #00=
0;" class=3D"styled-by-prettify"><br></span><span style=3D"color: #066;" cl=
ass=3D"styled-by-prettify">00</span><span style=3D"color: #660;" class=3D"s=
tyled-by-prettify">:</span><span style=3D"color: #066;" class=3D"styled-by-=
prettify">1c</span><span style=3D"color: #660;" class=3D"styled-by-prettify=
">.</span><span style=3D"color: #066;" class=3D"styled-by-prettify">6</span=
><span style=3D"color: #000;" class=3D"styled-by-prettify"> PCI bridge</spa=
n><span style=3D"color: #660;" class=3D"styled-by-prettify">:</span><span s=
tyle=3D"color: #000;" class=3D"styled-by-prettify"> </span><span style=3D"c=
olor: #606;" class=3D"styled-by-prettify">Intel</span><span style=3D"color:=
 #000;" class=3D"styled-by-prettify"> </span><span style=3D"color: #606;" c=
lass=3D"styled-by-prettify">Corporation</span><span style=3D"color: #000;" =
class=3D"styled-by-prettify"> </span><span style=3D"color: #606;" class=3D"=
styled-by-prettify">Sunrise</span><span style=3D"color: #000;" class=3D"sty=
led-by-prettify"> </span><span style=3D"color: #606;" class=3D"styled-by-pr=
ettify">Point</span><span style=3D"color: #660;" class=3D"styled-by-prettif=
y">-</span><span style=3D"color: #000;" class=3D"styled-by-prettify">H PCI =
</span><span style=3D"color: #606;" class=3D"styled-by-prettify">Express</s=
pan><span style=3D"color: #000;" class=3D"styled-by-prettify"> </span><span=
 style=3D"color: #606;" class=3D"styled-by-prettify">Root</span><span style=
=3D"color: #000;" class=3D"styled-by-prettify"> </span><span style=3D"color=
: #606;" class=3D"styled-by-prettify">Port</span><span style=3D"color: #000=
;" class=3D"styled-by-prettify"> </span><span style=3D"color: #800;" class=
=3D"styled-by-prettify">#7 (rev f1)</span><span style=3D"color: #000;" clas=
s=3D"styled-by-prettify"><br></span><span style=3D"color: #066;" class=3D"s=
tyled-by-prettify">00</span><span style=3D"color: #660;" class=3D"styled-by=
-prettify">:</span><span style=3D"color: #066;" class=3D"styled-by-prettify=
">1f</span><span style=3D"color: #660;" class=3D"styled-by-prettify">.</spa=
n><span style=3D"color: #066;" class=3D"styled-by-prettify">0</span><span s=
tyle=3D"color: #000;" class=3D"styled-by-prettify"> ISA bridge</span><span =
style=3D"color: #660;" class=3D"styled-by-prettify">:</span><span style=3D"=
color: #000;" class=3D"styled-by-prettify"> </span><span style=3D"color: #6=
06;" class=3D"styled-by-prettify">Intel</span><span style=3D"color: #000;" =
class=3D"styled-by-prettify"> </span><span style=3D"color: #606;" class=3D"=
styled-by-prettify">Corporation</span><span style=3D"color: #000;" class=3D=
"styled-by-prettify"> </span><span style=3D"color: #606;" class=3D"styled-b=
y-prettify">Sunrise</span><span style=3D"color: #000;" class=3D"styled-by-p=
rettify"> </span><span style=3D"color: #606;" class=3D"styled-by-prettify">=
Point</span><span style=3D"color: #660;" class=3D"styled-by-prettify">-</sp=
an><span style=3D"color: #000;" class=3D"styled-by-prettify">H LPC </span><=
span style=3D"color: #606;" class=3D"styled-by-prettify">Controller</span><=
span style=3D"color: #000;" class=3D"styled-by-prettify"> </span><span styl=
e=3D"color: #660;" class=3D"styled-by-prettify">(</span><span style=3D"colo=
r: #000;" class=3D"styled-by-prettify">rev </span><span style=3D"color: #06=
6;" class=3D"styled-by-prettify">31</span><span style=3D"color: #660;" clas=
s=3D"styled-by-prettify">)</span><span style=3D"color: #000;" class=3D"styl=
ed-by-prettify"><br></span><span style=3D"color: #066;" class=3D"styled-by-=
prettify">00</span><span style=3D"color: #660;" class=3D"styled-by-prettify=
">:</span><span style=3D"color: #066;" class=3D"styled-by-prettify">1f</spa=
n><span style=3D"color: #660;" class=3D"styled-by-prettify">.</span><span s=
tyle=3D"color: #066;" class=3D"styled-by-prettify">2</span><span style=3D"c=
olor: #000;" class=3D"styled-by-prettify"> </span><span style=3D"color: #60=
6;" class=3D"styled-by-prettify">Memory</span><span style=3D"color: #000;" =
class=3D"styled-by-prettify"> controller</span><span style=3D"color: #660;"=
 class=3D"styled-by-prettify">:</span><span style=3D"color: #000;" class=3D=
"styled-by-prettify"> </span><span style=3D"color: #606;" class=3D"styled-b=
y-prettify">Intel</span><span style=3D"color: #000;" class=3D"styled-by-pre=
ttify"> </span><span style=3D"color: #606;" class=3D"styled-by-prettify">Co=
rporation</span><span style=3D"color: #000;" class=3D"styled-by-prettify"> =
</span><span style=3D"color: #606;" class=3D"styled-by-prettify">Sunrise</s=
pan><span style=3D"color: #000;" class=3D"styled-by-prettify"> </span><span=
 style=3D"color: #606;" class=3D"styled-by-prettify">Point</span><span styl=
e=3D"color: #660;" class=3D"styled-by-prettify">-</span><span style=3D"colo=
r: #000;" class=3D"styled-by-prettify">H PMC </span><span style=3D"color: #=
660;" class=3D"styled-by-prettify">(</span><span style=3D"color: #000;" cla=
ss=3D"styled-by-prettify">rev </span><span style=3D"color: #066;" class=3D"=
styled-by-prettify">31</span><span style=3D"color: #660;" class=3D"styled-b=
y-prettify">)</span><span style=3D"color: #000;" class=3D"styled-by-prettif=
y"><br></span><span style=3D"color: #066;" class=3D"styled-by-prettify">00<=
/span><span style=3D"color: #660;" class=3D"styled-by-prettify">:</span><sp=
an style=3D"color: #066;" class=3D"styled-by-prettify">1f</span><span style=
=3D"color: #660;" class=3D"styled-by-prettify">.</span><span style=3D"color=
: #066;" class=3D"styled-by-prettify">3</span><span style=3D"color: #000;" =
class=3D"styled-by-prettify"> </span><span style=3D"color: #606;" class=3D"=
styled-by-prettify">Audio</span><span style=3D"color: #000;" class=3D"style=
d-by-prettify"> device</span><span style=3D"color: #660;" class=3D"styled-b=
y-prettify">:</span><span style=3D"color: #000;" class=3D"styled-by-prettif=
y"> </span><span style=3D"color: #606;" class=3D"styled-by-prettify">Intel<=
/span><span style=3D"color: #000;" class=3D"styled-by-prettify"> </span><sp=
an style=3D"color: #606;" class=3D"styled-by-prettify">Corporation</span><s=
pan style=3D"color: #000;" class=3D"styled-by-prettify"> </span><span style=
=3D"color: #606;" class=3D"styled-by-prettify">Sunrise</span><span style=3D=
"color: #000;" class=3D"styled-by-prettify"> </span><span style=3D"color: #=
606;" class=3D"styled-by-prettify">Point</span><span style=3D"color: #660;"=
 class=3D"styled-by-prettify">-</span><span style=3D"color: #000;" class=3D=
"styled-by-prettify">H HD </span><span style=3D"color: #606;" class=3D"styl=
ed-by-prettify">Audio</span><span style=3D"color: #000;" class=3D"styled-by=
-prettify"> </span><span style=3D"color: #660;" class=3D"styled-by-prettify=
">(</span><span style=3D"color: #000;" class=3D"styled-by-prettify">rev </s=
pan><span style=3D"color: #066;" class=3D"styled-by-prettify">31</span><spa=
n style=3D"color: #660;" class=3D"styled-by-prettify">)</span><span style=
=3D"color: #000;" class=3D"styled-by-prettify"><br></span><span style=3D"co=
lor: #066;" class=3D"styled-by-prettify">00</span><span style=3D"color: #66=
0;" class=3D"styled-by-prettify">:</span><span style=3D"color: #066;" class=
=3D"styled-by-prettify">1f</span><span style=3D"color: #660;" class=3D"styl=
ed-by-prettify">.</span><span style=3D"color: #066;" class=3D"styled-by-pre=
ttify">4</span><span style=3D"color: #000;" class=3D"styled-by-prettify"> <=
/span><span style=3D"color: #606;" class=3D"styled-by-prettify">SMBus</span=
><span style=3D"color: #660;" class=3D"styled-by-prettify">:</span><span st=
yle=3D"color: #000;" class=3D"styled-by-prettify"> </span><span style=3D"co=
lor: #606;" class=3D"styled-by-prettify">Intel</span><span style=3D"color: =
#000;" class=3D"styled-by-prettify"> </span><span style=3D"color: #606;" cl=
ass=3D"styled-by-prettify">Corporation</span><span style=3D"color: #000;" c=
lass=3D"styled-by-prettify"> </span><span style=3D"color: #606;" class=3D"s=
tyled-by-prettify">Sunrise</span><span style=3D"color: #000;" class=3D"styl=
ed-by-prettify"> </span><span style=3D"color: #606;" class=3D"styled-by-pre=
ttify">Point</span><span style=3D"color: #660;" class=3D"styled-by-prettify=
">-</span><span style=3D"color: #000;" class=3D"styled-by-prettify">H </spa=
n><span style=3D"color: #606;" class=3D"styled-by-prettify">SMBus</span><sp=
an style=3D"color: #000;" class=3D"styled-by-prettify"> </span><span style=
=3D"color: #660;" class=3D"styled-by-prettify">(</span><span style=3D"color=
: #000;" class=3D"styled-by-prettify">rev </span><span style=3D"color: #066=
;" class=3D"styled-by-prettify">31</span><span style=3D"color: #660;" class=
=3D"styled-by-prettify">)</span><span style=3D"color: #000;" class=3D"style=
d-by-prettify"><br></span><span style=3D"color: #066;" class=3D"styled-by-p=
rettify">00</span><span style=3D"color: #660;" class=3D"styled-by-prettify"=
>:</span><span style=3D"color: #066;" class=3D"styled-by-prettify">1f</span=
><span style=3D"color: #660;" class=3D"styled-by-prettify">.</span><span st=
yle=3D"color: #066;" class=3D"styled-by-prettify">6</span><span style=3D"co=
lor: #000;" class=3D"styled-by-prettify"> </span><span style=3D"color: #606=
;" class=3D"styled-by-prettify">Ethernet</span><span style=3D"color: #000;"=
 class=3D"styled-by-prettify"> controller</span><span style=3D"color: #660;=
" class=3D"styled-by-prettify">:</span><span style=3D"color: #000;" class=
=3D"styled-by-prettify"> </span><span style=3D"color: #606;" class=3D"style=
d-by-prettify">Intel</span><span style=3D"color: #000;" class=3D"styled-by-=
prettify"> </span><span style=3D"color: #606;" class=3D"styled-by-prettify"=
>Corporation</span><span style=3D"color: #000;" class=3D"styled-by-prettify=
"> </span><span style=3D"color: #606;" class=3D"styled-by-prettify">Etherne=
t</span><span style=3D"color: #000;" class=3D"styled-by-prettify"> </span><=
span style=3D"color: #606;" class=3D"styled-by-prettify">Connection</span><=
span style=3D"color: #000;" class=3D"styled-by-prettify"> </span><span styl=
e=3D"color: #660;" class=3D"styled-by-prettify">(</span><span style=3D"colo=
r: #066;" class=3D"styled-by-prettify">2</span><span style=3D"color: #660;"=
 class=3D"styled-by-prettify">)</span><span style=3D"color: #000;" class=3D=
"styled-by-prettify"> I219</span><span style=3D"color: #660;" class=3D"styl=
ed-by-prettify">-</span><span style=3D"color: #000;" class=3D"styled-by-pre=
ttify">LM </span><span style=3D"color: #660;" class=3D"styled-by-prettify">=
(</span><span style=3D"color: #000;" class=3D"styled-by-prettify">rev </spa=
n><span style=3D"color: #066;" class=3D"styled-by-prettify">31</span><span =
style=3D"color: #660;" class=3D"styled-by-prettify">)</span><span style=3D"=
color: #000;" class=3D"styled-by-prettify"><br></span><span style=3D"color:=
 #066;" class=3D"styled-by-prettify">02</span><span style=3D"color: #660;" =
class=3D"styled-by-prettify">:</span><span style=3D"color: #066;" class=3D"=
styled-by-prettify">00.0</span><span style=3D"color: #000;" class=3D"styled=
-by-prettify"> </span><span style=3D"color: #606;" class=3D"styled-by-prett=
ify">Ethernet</span><span style=3D"color: #000;" class=3D"styled-by-prettif=
y"> controller</span><span style=3D"color: #660;" class=3D"styled-by-pretti=
fy">:</span><span style=3D"color: #000;" class=3D"styled-by-prettify"> </sp=
an><span style=3D"color: #606;" class=3D"styled-by-prettify">Intel</span><s=
pan style=3D"color: #000;" class=3D"styled-by-prettify"> </span><span style=
=3D"color: #606;" class=3D"styled-by-prettify">Corporation</span><span styl=
e=3D"color: #000;" class=3D"styled-by-prettify"> I211 </span><span style=3D=
"color: #606;" class=3D"styled-by-prettify">Gigabit</span><span style=3D"co=
lor: #000;" class=3D"styled-by-prettify"> </span><span style=3D"color: #606=
;" class=3D"styled-by-prettify">Network</span><span style=3D"color: #000;" =
class=3D"styled-by-prettify"> </span><span style=3D"color: #606;" class=3D"=
styled-by-prettify">Connection</span><span style=3D"color: #000;" class=3D"=
styled-by-prettify"> </span><span style=3D"color: #660;" class=3D"styled-by=
-prettify">(</span><span style=3D"color: #000;" class=3D"styled-by-prettify=
">rev ff</span><span style=3D"color: #660;" class=3D"styled-by-prettify">)<=
/span></div></code></div><br>03:00.0 missing...</div><div style=3D"margin-l=
eft: 40px;"><br></div><div style=3D"margin-left: 40px;">When I activate the=
 inmate cell:</div><div style=3D"margin-left: 40px;"><br><code class=3D"pre=
ttyprint"><div class=3D"subprettyprint"><span style=3D"color: #000;" class=
=3D"styled-by-prettify">root@tsn</span><span style=3D"color: #660;" class=
=3D"styled-by-prettify">:</span><span style=3D"color: #080;" class=3D"style=
d-by-prettify">/home/</span><span style=3D"color: #000;" class=3D"styled-by=
-prettify">jailhouse</span><span style=3D"color: #800;" class=3D"styled-by-=
prettify"># cat /dev/jailhouse</span><span style=3D"color: #000;" class=3D"=
styled-by-prettify"><br></span></div></code><br><div style=3D"background-co=
lor: rgb(250, 250, 250); border-color: rgb(187, 187, 187); border-style: so=
lid; border-width: 1px; overflow-wrap: break-word;" class=3D"prettyprint"><=
code class=3D"prettyprint"><div class=3D"subprettyprint"><span style=3D"col=
or: #606;" class=3D"styled-by-prettify">Adding</span><span style=3D"color: =
#000;" class=3D"styled-by-prettify"> PCI device </span><span style=3D"color=
: #066;" class=3D"styled-by-prettify">02</span><span style=3D"color: #660;"=
 class=3D"styled-by-prettify">:</span><span style=3D"color: #066;" class=3D=
"styled-by-prettify">00.0</span><span style=3D"color: #000;" class=3D"style=
d-by-prettify"> to cell </span><span style=3D"color: #080;" class=3D"styled=
-by-prettify">&quot;jail1-inmate&quot;</span><span style=3D"color: #000;" c=
lass=3D"styled-by-prettify"><br></span><span style=3D"color: #606;" class=
=3D"styled-by-prettify">Reserving</span><span style=3D"color: #000;" class=
=3D"styled-by-prettify"> </span><span style=3D"color: #066;" class=3D"style=
d-by-prettify">5</span><span style=3D"color: #000;" class=3D"styled-by-pret=
tify"> interrupt</span><span style=3D"color: #660;" class=3D"styled-by-pret=
tify">(</span><span style=3D"color: #000;" class=3D"styled-by-prettify">s</=
span><span style=3D"color: #660;" class=3D"styled-by-prettify">)</span><spa=
n style=3D"color: #000;" class=3D"styled-by-prettify"> </span><span style=
=3D"color: #008;" class=3D"styled-by-prettify">for</span><span style=3D"col=
or: #000;" class=3D"styled-by-prettify"> device </span><span style=3D"color=
: #066;" class=3D"styled-by-prettify">02</span><span style=3D"color: #660;"=
 class=3D"styled-by-prettify">:</span><span style=3D"color: #066;" class=3D=
"styled-by-prettify">00.0</span><span style=3D"color: #000;" class=3D"style=
d-by-prettify"> at index </span><span style=3D"color: #066;" class=3D"style=
d-by-prettify">136</span><span style=3D"color: #000;" class=3D"styled-by-pr=
ettify"><br></span><span style=3D"color: #606;" class=3D"styled-by-prettify=
">Adding</span><span style=3D"color: #000;" class=3D"styled-by-prettify"> <=
/span><span style=3D"color: #008;" class=3D"styled-by-prettify">virtual</sp=
an><span style=3D"color: #000;" class=3D"styled-by-prettify"> PCI device </=
span><span style=3D"color: #066;" class=3D"styled-by-prettify">03</span><sp=
an style=3D"color: #660;" class=3D"styled-by-prettify">:</span><span style=
=3D"color: #066;" class=3D"styled-by-prettify">00.0</span><span style=3D"co=
lor: #000;" class=3D"styled-by-prettify"> to cell </span><span style=3D"col=
or: #080;" class=3D"styled-by-prettify">&quot;jail1-inmate&quot;</span><spa=
n style=3D"color: #000;" class=3D"styled-by-prettify"><br></span><span styl=
e=3D"color: #606;" class=3D"styled-by-prettify">Shared</span><span style=3D=
"color: #000;" class=3D"styled-by-prettify"> memory connection established<=
/span><span style=3D"color: #660;" class=3D"styled-by-prettify">:</span><sp=
an style=3D"color: #000;" class=3D"styled-by-prettify"> </span><span style=
=3D"color: #080;" class=3D"styled-by-prettify">&quot;jail1-inmate&quot;</sp=
an><span style=3D"color: #000;" class=3D"styled-by-prettify"> </span><span =
style=3D"color: #660;" class=3D"styled-by-prettify">&lt;--&gt;</span><span =
style=3D"color: #000;" class=3D"styled-by-prettify"> </span><span style=3D"=
color: #080;" class=3D"styled-by-prettify">&quot;RootCell&quot;</span><span=
 style=3D"color: #000;" class=3D"styled-by-prettify"><br></span><span style=
=3D"color: #606;" class=3D"styled-by-prettify">Device</span><span style=3D"=
color: #000;" class=3D"styled-by-prettify"> </span><span style=3D"color: #0=
66;" class=3D"styled-by-prettify">300</span><span style=3D"color: #000;" cl=
ass=3D"styled-by-prettify"> okay<br></span><span style=3D"color: #606;" cla=
ss=3D"styled-by-prettify">Created</span><span style=3D"color: #000;" class=
=3D"styled-by-prettify"> cell </span><span style=3D"color: #080;" class=3D"=
styled-by-prettify">&quot;jail1-inmate&quot;</span><span style=3D"color: #0=
00;" class=3D"styled-by-prettify"><br></span><span style=3D"color: #606;" c=
lass=3D"styled-by-prettify">Page</span><span style=3D"color: #000;" class=
=3D"styled-by-prettify"> pool usage after cell creation</span><span style=
=3D"color: #660;" class=3D"styled-by-prettify">:</span><span style=3D"color=
: #000;" class=3D"styled-by-prettify"> mem </span><span style=3D"color: #06=
6;" class=3D"styled-by-prettify">372</span><span style=3D"color: #660;" cla=
ss=3D"styled-by-prettify">/</span><span style=3D"color: #066;" class=3D"sty=
led-by-prettify">974</span><span style=3D"color: #660;" class=3D"styled-by-=
prettify">,</span><span style=3D"color: #000;" class=3D"styled-by-prettify"=
> remap </span><span style=3D"color: #066;" class=3D"styled-by-prettify">65=
546</span><span style=3D"color: #660;" class=3D"styled-by-prettify">/</span=
><span style=3D"color: #066;" class=3D"styled-by-prettify">131072</span><sp=
an style=3D"color: #000;" class=3D"styled-by-prettify"><br></span><span sty=
le=3D"color: #606;" class=3D"styled-by-prettify">Cell</span><span style=3D"=
color: #000;" class=3D"styled-by-prettify"> </span><span style=3D"color: #0=
80;" class=3D"styled-by-prettify">&quot;jail1-inmate&quot;</span><span styl=
e=3D"color: #000;" class=3D"styled-by-prettify"> can be loaded<br>CPU </spa=
n><span style=3D"color: #066;" class=3D"styled-by-prettify">2</span><span s=
tyle=3D"color: #000;" class=3D"styled-by-prettify"> received SIPI</span><sp=
an style=3D"color: #660;" class=3D"styled-by-prettify">,</span><span style=
=3D"color: #000;" class=3D"styled-by-prettify"> vector </span><span style=
=3D"color: #066;" class=3D"styled-by-prettify">100</span><span style=3D"col=
or: #000;" class=3D"styled-by-prettify"><br></span><span style=3D"color: #6=
06;" class=3D"styled-by-prettify">Started</span><span style=3D"color: #000;=
" class=3D"styled-by-prettify"> cell </span><span style=3D"color: #080;" cl=
ass=3D"styled-by-prettify">&quot;jail1-inmate&quot;</span><span style=3D"co=
lor: #000;" class=3D"styled-by-prettify"><br><br></span></div></code></div>=
<br>and I am able to find the PCI device on the inmate side.<br><br><div st=
yle=3D"background-color: rgb(250, 250, 250); border-color: rgb(187, 187, 18=
7); border-style: solid; border-width: 1px; overflow-wrap: break-word;" cla=
ss=3D"prettyprint"><code class=3D"prettyprint"><div class=3D"subprettyprint=
"><span style=3D"color: #066;" class=3D"styled-by-prettify">02</span><span =
style=3D"color: #660;" class=3D"styled-by-prettify">:</span><span style=3D"=
color: #066;" class=3D"styled-by-prettify">00.0</span><span style=3D"color:=
 #000;" class=3D"styled-by-prettify"> </span><span style=3D"color: #606;" c=
lass=3D"styled-by-prettify">Ethernet</span><span style=3D"color: #000;" cla=
ss=3D"styled-by-prettify"> controller</span><span style=3D"color: #660;" cl=
ass=3D"styled-by-prettify">:</span><span style=3D"color: #000;" class=3D"st=
yled-by-prettify"> </span><span style=3D"color: #606;" class=3D"styled-by-p=
rettify">Intel</span><span style=3D"color: #000;" class=3D"styled-by-pretti=
fy"> </span><span style=3D"color: #606;" class=3D"styled-by-prettify">Corpo=
ration</span><span style=3D"color: #000;" class=3D"styled-by-prettify"> I21=
1 </span><span style=3D"color: #606;" class=3D"styled-by-prettify">Gigabit<=
/span><span style=3D"color: #000;" class=3D"styled-by-prettify"> </span><sp=
an style=3D"color: #606;" class=3D"styled-by-prettify">Network</span><span =
style=3D"color: #000;" class=3D"styled-by-prettify"> </span><span style=3D"=
color: #606;" class=3D"styled-by-prettify">Connection</span><span style=3D"=
color: #000;" class=3D"styled-by-prettify"> </span><span style=3D"color: #6=
60;" class=3D"styled-by-prettify">(</span><span style=3D"color: #000;" clas=
s=3D"styled-by-prettify">rev </span><span style=3D"color: #066;" class=3D"s=
tyled-by-prettify">03</span><span style=3D"color: #660;" class=3D"styled-by=
-prettify">)</span><span style=3D"color: #000;" class=3D"styled-by-prettify=
"><br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 </span><span style=3D"color: #606;" class=
=3D"styled-by-prettify">Subsystem</span><span style=3D"color: #660;" class=
=3D"styled-by-prettify">:</span><span style=3D"color: #000;" class=3D"style=
d-by-prettify"> </span><span style=3D"color: #606;" class=3D"styled-by-pret=
tify">Intel</span><span style=3D"color: #000;" class=3D"styled-by-prettify"=
> </span><span style=3D"color: #606;" class=3D"styled-by-prettify">Corporat=
ion</span><span style=3D"color: #000;" class=3D"styled-by-prettify"> I211 <=
/span><span style=3D"color: #606;" class=3D"styled-by-prettify">Gigabit</sp=
an><span style=3D"color: #000;" class=3D"styled-by-prettify"> </span><span =
style=3D"color: #606;" class=3D"styled-by-prettify">Network</span><span sty=
le=3D"color: #000;" class=3D"styled-by-prettify"> </span><span style=3D"col=
or: #606;" class=3D"styled-by-prettify">Connection</span><span style=3D"col=
or: #000;" class=3D"styled-by-prettify"><br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 </s=
pan><span style=3D"color: #606;" class=3D"styled-by-prettify">Flags</span><=
span style=3D"color: #660;" class=3D"styled-by-prettify">:</span><span styl=
e=3D"color: #000;" class=3D"styled-by-prettify"> bus master</span><span sty=
le=3D"color: #660;" class=3D"styled-by-prettify">,</span><span style=3D"col=
or: #000;" class=3D"styled-by-prettify"> fast devsel</span><span style=3D"c=
olor: #660;" class=3D"styled-by-prettify">,</span><span style=3D"color: #00=
0;" class=3D"styled-by-prettify"> latency </span><span style=3D"color: #066=
;" class=3D"styled-by-prettify">0</span><span style=3D"color: #660;" class=
=3D"styled-by-prettify">,</span><span style=3D"color: #000;" class=3D"style=
d-by-prettify"> IRQ </span><span style=3D"color: #066;" class=3D"styled-by-=
prettify">11</span><span style=3D"color: #000;" class=3D"styled-by-prettify=
"><br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 </span><span style=3D"color: #606;" class=
=3D"styled-by-prettify">Memory</span><span style=3D"color: #000;" class=3D"=
styled-by-prettify"> at df000000 </span><span style=3D"color: #660;" class=
=3D"styled-by-prettify">(</span><span style=3D"color: #066;" class=3D"style=
d-by-prettify">32</span><span style=3D"color: #660;" class=3D"styled-by-pre=
ttify">-</span><span style=3D"color: #000;" class=3D"styled-by-prettify">bi=
t</span><span style=3D"color: #660;" class=3D"styled-by-prettify">,</span><=
span style=3D"color: #000;" class=3D"styled-by-prettify"> non</span><span s=
tyle=3D"color: #660;" class=3D"styled-by-prettify">-</span><span style=3D"c=
olor: #000;" class=3D"styled-by-prettify">prefetchable</span><span style=3D=
"color: #660;" class=3D"styled-by-prettify">)</span><span style=3D"color: #=
000;" class=3D"styled-by-prettify"> </span><span style=3D"color: #660;" cla=
ss=3D"styled-by-prettify">[</span><span style=3D"color: #000;" class=3D"sty=
led-by-prettify">size</span><span style=3D"color: #660;" class=3D"styled-by=
-prettify">=3D</span><span style=3D"color: #066;" class=3D"styled-by-pretti=
fy">128K</span><span style=3D"color: #660;" class=3D"styled-by-prettify">]<=
/span><span style=3D"color: #000;" class=3D"styled-by-prettify"><br>=C2=A0 =
=C2=A0 =C2=A0 =C2=A0 </span><span style=3D"color: #606;" class=3D"styled-by=
-prettify">Memory</span><span style=3D"color: #000;" class=3D"styled-by-pre=
ttify"> at df020000 </span><span style=3D"color: #660;" class=3D"styled-by-=
prettify">(</span><span style=3D"color: #066;" class=3D"styled-by-prettify"=
>32</span><span style=3D"color: #660;" class=3D"styled-by-prettify">-</span=
><span style=3D"color: #000;" class=3D"styled-by-prettify">bit</span><span =
style=3D"color: #660;" class=3D"styled-by-prettify">,</span><span style=3D"=
color: #000;" class=3D"styled-by-prettify"> non</span><span style=3D"color:=
 #660;" class=3D"styled-by-prettify">-</span><span style=3D"color: #000;" c=
lass=3D"styled-by-prettify">prefetchable</span><span style=3D"color: #660;"=
 class=3D"styled-by-prettify">)</span><span style=3D"color: #000;" class=3D=
"styled-by-prettify"> </span><span style=3D"color: #660;" class=3D"styled-b=
y-prettify">[</span><span style=3D"color: #000;" class=3D"styled-by-prettif=
y">size</span><span style=3D"color: #660;" class=3D"styled-by-prettify">=3D=
</span><span style=3D"color: #066;" class=3D"styled-by-prettify">16K</span>=
<span style=3D"color: #660;" class=3D"styled-by-prettify">]</span><span sty=
le=3D"color: #000;" class=3D"styled-by-prettify"><br>=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 </span><span style=3D"color: #606;" class=3D"styled-by-prettify">Cap=
abilities</span><span style=3D"color: #660;" class=3D"styled-by-prettify">:=
</span><span style=3D"color: #000;" class=3D"styled-by-prettify"> </span><s=
pan style=3D"color: #660;" class=3D"styled-by-prettify">[</span><span style=
=3D"color: #066;" class=3D"styled-by-prettify">40</span><span style=3D"colo=
r: #660;" class=3D"styled-by-prettify">]</span><span style=3D"color: #000;"=
 class=3D"styled-by-prettify"> </span><span style=3D"color: #606;" class=3D=
"styled-by-prettify">Power</span><span style=3D"color: #000;" class=3D"styl=
ed-by-prettify"> </span><span style=3D"color: #606;" class=3D"styled-by-pre=
ttify">Management</span><span style=3D"color: #000;" class=3D"styled-by-pre=
ttify"> version </span><span style=3D"color: #066;" class=3D"styled-by-pret=
tify">3</span><span style=3D"color: #000;" class=3D"styled-by-prettify"><br=
>=C2=A0 =C2=A0 =C2=A0 =C2=A0 </span><span style=3D"color: #606;" class=3D"s=
tyled-by-prettify">Capabilities</span><span style=3D"color: #660;" class=3D=
"styled-by-prettify">:</span><span style=3D"color: #000;" class=3D"styled-b=
y-prettify"> </span><span style=3D"color: #660;" class=3D"styled-by-prettif=
y">[</span><span style=3D"color: #066;" class=3D"styled-by-prettify">50</sp=
an><span style=3D"color: #660;" class=3D"styled-by-prettify">]</span><span =
style=3D"color: #000;" class=3D"styled-by-prettify"> MSI</span><span style=
=3D"color: #660;" class=3D"styled-by-prettify">:</span><span style=3D"color=
: #000;" class=3D"styled-by-prettify"> </span><span style=3D"color: #606;" =
class=3D"styled-by-prettify">Enable</span><span style=3D"color: #660;" clas=
s=3D"styled-by-prettify">-</span><span style=3D"color: #000;" class=3D"styl=
ed-by-prettify"> </span><span style=3D"color: #606;" class=3D"styled-by-pre=
ttify">Count</span><span style=3D"color: #660;" class=3D"styled-by-prettify=
">=3D</span><span style=3D"color: #066;" class=3D"styled-by-prettify">1</sp=
an><span style=3D"color: #660;" class=3D"styled-by-prettify">/</span><span =
style=3D"color: #066;" class=3D"styled-by-prettify">1</span><span style=3D"=
color: #000;" class=3D"styled-by-prettify"> </span><span style=3D"color: #6=
06;" class=3D"styled-by-prettify">Maskable</span><span style=3D"color: #660=
;" class=3D"styled-by-prettify">+</span><span style=3D"color: #000;" class=
=3D"styled-by-prettify"> </span><span style=3D"color: #066;" class=3D"style=
d-by-prettify">64bit</span><span style=3D"color: #660;" class=3D"styled-by-=
prettify">+</span><span style=3D"color: #000;" class=3D"styled-by-prettify"=
><br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 </span><span style=3D"color: #606;" class=
=3D"styled-by-prettify">Capabilities</span><span style=3D"color: #660;" cla=
ss=3D"styled-by-prettify">:</span><span style=3D"color: #000;" class=3D"sty=
led-by-prettify"> </span><span style=3D"color: #660;" class=3D"styled-by-pr=
ettify">[</span><span style=3D"color: #066;" class=3D"styled-by-prettify">7=
0</span><span style=3D"color: #660;" class=3D"styled-by-prettify">]</span><=
span style=3D"color: #000;" class=3D"styled-by-prettify"> MSI</span><span s=
tyle=3D"color: #660;" class=3D"styled-by-prettify">-</span><span style=3D"c=
olor: #000;" class=3D"styled-by-prettify">X</span><span style=3D"color: #66=
0;" class=3D"styled-by-prettify">:</span><span style=3D"color: #000;" class=
=3D"styled-by-prettify"> </span><span style=3D"color: #606;" class=3D"style=
d-by-prettify">Enable</span><span style=3D"color: #660;" class=3D"styled-by=
-prettify">+</span><span style=3D"color: #000;" class=3D"styled-by-prettify=
"> </span><span style=3D"color: #606;" class=3D"styled-by-prettify">Count</=
span><span style=3D"color: #660;" class=3D"styled-by-prettify">=3D</span><s=
pan style=3D"color: #066;" class=3D"styled-by-prettify">5</span><span style=
=3D"color: #000;" class=3D"styled-by-prettify"> </span><span style=3D"color=
: #606;" class=3D"styled-by-prettify">Masked</span><span style=3D"color: #6=
60;" class=3D"styled-by-prettify">-</span><span style=3D"color: #000;" clas=
s=3D"styled-by-prettify"><br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 </span><span style=
=3D"color: #606;" class=3D"styled-by-prettify">Capabilities</span><span sty=
le=3D"color: #660;" class=3D"styled-by-prettify">:</span><span style=3D"col=
or: #000;" class=3D"styled-by-prettify"> </span><span style=3D"color: #660;=
" class=3D"styled-by-prettify">[</span><span style=3D"color: #000;" class=
=3D"styled-by-prettify">a0</span><span style=3D"color: #660;" class=3D"styl=
ed-by-prettify">]</span><span style=3D"color: #000;" class=3D"styled-by-pre=
ttify"> </span><span style=3D"color: #606;" class=3D"styled-by-prettify">Ex=
press</span><span style=3D"color: #000;" class=3D"styled-by-prettify"> </sp=
an><span style=3D"color: #606;" class=3D"styled-by-prettify">Endpoint</span=
><span style=3D"color: #660;" class=3D"styled-by-prettify">,</span><span st=
yle=3D"color: #000;" class=3D"styled-by-prettify"> MSI </span><span style=
=3D"color: #066;" class=3D"styled-by-prettify">00</span><span style=3D"colo=
r: #000;" class=3D"styled-by-prettify"><br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 </sp=
an><span style=3D"color: #606;" class=3D"styled-by-prettify">Capabilities</=
span><span style=3D"color: #660;" class=3D"styled-by-prettify">:</span><spa=
n style=3D"color: #000;" class=3D"styled-by-prettify"> </span><span style=
=3D"color: #660;" class=3D"styled-by-prettify">[</span><span style=3D"color=
: #066;" class=3D"styled-by-prettify">100</span><span style=3D"color: #660;=
" class=3D"styled-by-prettify">]</span><span style=3D"color: #000;" class=
=3D"styled-by-prettify"> </span><span style=3D"color: #606;" class=3D"style=
d-by-prettify">Advanced</span><span style=3D"color: #000;" class=3D"styled-=
by-prettify"> </span><span style=3D"color: #606;" class=3D"styled-by-pretti=
fy">Error</span><span style=3D"color: #000;" class=3D"styled-by-prettify"> =
</span><span style=3D"color: #606;" class=3D"styled-by-prettify">Reporting<=
/span><span style=3D"color: #000;" class=3D"styled-by-prettify"><br>=C2=A0 =
=C2=A0 =C2=A0 =C2=A0 </span><span style=3D"color: #606;" class=3D"styled-by=
-prettify">Capabilities</span><span style=3D"color: #660;" class=3D"styled-=
by-prettify">:</span><span style=3D"color: #000;" class=3D"styled-by-pretti=
fy"> </span><span style=3D"color: #660;" class=3D"styled-by-prettify">[</sp=
an><span style=3D"color: #066;" class=3D"styled-by-prettify">1a0</span><spa=
n style=3D"color: #660;" class=3D"styled-by-prettify">]</span><span style=
=3D"color: #000;" class=3D"styled-by-prettify"> </span><span style=3D"color=
: #606;" class=3D"styled-by-prettify">Transaction</span><span style=3D"colo=
r: #000;" class=3D"styled-by-prettify"> </span><span style=3D"color: #606;"=
 class=3D"styled-by-prettify">Processing</span><span style=3D"color: #000;"=
 class=3D"styled-by-prettify"> </span><span style=3D"color: #606;" class=3D=
"styled-by-prettify">Hints</span><span style=3D"color: #000;" class=3D"styl=
ed-by-prettify"><br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 </span><span style=3D"color=
: #606;" class=3D"styled-by-prettify">Kernel</span><span style=3D"color: #0=
00;" class=3D"styled-by-prettify"> driver </span><span style=3D"color: #008=
;" class=3D"styled-by-prettify">in</span><span style=3D"color: #000;" class=
=3D"styled-by-prettify"> </span><span style=3D"color: #008;" class=3D"style=
d-by-prettify">use</span><span style=3D"color: #660;" class=3D"styled-by-pr=
ettify">:</span><span style=3D"color: #000;" class=3D"styled-by-prettify"> =
igb<br>lspci</span><span style=3D"color: #660;" class=3D"styled-by-prettify=
">:</span><span style=3D"color: #000;" class=3D"styled-by-prettify"> </span=
><span style=3D"color: #606;" class=3D"styled-by-prettify">Unable</span><sp=
an style=3D"color: #000;" class=3D"styled-by-prettify"> to load libkmod res=
ources</span><span style=3D"color: #660;" class=3D"styled-by-prettify">:</s=
pan><span style=3D"color: #000;" class=3D"styled-by-prettify"> error </span=
><span style=3D"color: #660;" class=3D"styled-by-prettify">-</span><span st=
yle=3D"color: #066;" class=3D"styled-by-prettify">12</span><span style=3D"c=
olor: #000;" class=3D"styled-by-prettify"><br><br></span><span style=3D"col=
or: #066;" class=3D"styled-by-prettify">03</span><span style=3D"color: #660=
;" class=3D"styled-by-prettify">:</span><span style=3D"color: #066;" class=
=3D"styled-by-prettify">00.0</span><span style=3D"color: #000;" class=3D"st=
yled-by-prettify"> </span><span style=3D"color: #606;" class=3D"styled-by-p=
rettify">Unassigned</span><span style=3D"color: #000;" class=3D"styled-by-p=
rettify"> </span><span style=3D"color: #008;" class=3D"styled-by-prettify">=
class</span><span style=3D"color: #000;" class=3D"styled-by-prettify"> </sp=
an><span style=3D"color: #660;" class=3D"styled-by-prettify">[</span><span =
style=3D"color: #000;" class=3D"styled-by-prettify">ff01</span><span style=
=3D"color: #660;" class=3D"styled-by-prettify">]:</span><span style=3D"colo=
r: #000;" class=3D"styled-by-prettify"> </span><span style=3D"color: #606;"=
 class=3D"styled-by-prettify">Red</span><span style=3D"color: #000;" class=
=3D"styled-by-prettify"> </span><span style=3D"color: #606;" class=3D"style=
d-by-prettify">Hat</span><span style=3D"color: #660;" class=3D"styled-by-pr=
ettify">,</span><span style=3D"color: #000;" class=3D"styled-by-prettify"> =
</span><span style=3D"color: #606;" class=3D"styled-by-prettify">Inc</span>=
<span style=3D"color: #000;" class=3D"styled-by-prettify"> </span><span sty=
le=3D"color: #606;" class=3D"styled-by-prettify">Inter</span><span style=3D=
"color: #660;" class=3D"styled-by-prettify">-</span><span style=3D"color: #=
000;" class=3D"styled-by-prettify">VM shared memory<br>=C2=A0 =C2=A0 =C2=A0=
 =C2=A0 </span><span style=3D"color: #606;" class=3D"styled-by-prettify">Su=
bsystem</span><span style=3D"color: #660;" class=3D"styled-by-prettify">:</=
span><span style=3D"color: #000;" class=3D"styled-by-prettify"> </span><spa=
n style=3D"color: #606;" class=3D"styled-by-prettify">Red</span><span style=
=3D"color: #000;" class=3D"styled-by-prettify"> </span><span style=3D"color=
: #606;" class=3D"styled-by-prettify">Hat</span><span style=3D"color: #660;=
" class=3D"styled-by-prettify">,</span><span style=3D"color: #000;" class=
=3D"styled-by-prettify"> </span><span style=3D"color: #606;" class=3D"style=
d-by-prettify">Inc</span><span style=3D"color: #000;" class=3D"styled-by-pr=
ettify"> </span><span style=3D"color: #606;" class=3D"styled-by-prettify">I=
nter</span><span style=3D"color: #660;" class=3D"styled-by-prettify">-</spa=
n><span style=3D"color: #000;" class=3D"styled-by-prettify">VM shared memor=
y<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 </span><span style=3D"color: #606;" class=
=3D"styled-by-prettify">Flags</span><span style=3D"color: #660;" class=3D"s=
tyled-by-prettify">:</span><span style=3D"color: #000;" class=3D"styled-by-=
prettify"> fast devsel<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 </span><span style=3D=
"color: #606;" class=3D"styled-by-prettify">Memory</span><span style=3D"col=
or: #000;" class=3D"styled-by-prettify"> at </span><span style=3D"color: #0=
66;" class=3D"styled-by-prettify">100000000</span><span style=3D"color: #00=
0;" class=3D"styled-by-prettify"> </span><span style=3D"color: #660;" class=
=3D"styled-by-prettify">(</span><span style=3D"color: #066;" class=3D"style=
d-by-prettify">64</span><span style=3D"color: #660;" class=3D"styled-by-pre=
ttify">-</span><span style=3D"color: #000;" class=3D"styled-by-prettify">bi=
t</span><span style=3D"color: #660;" class=3D"styled-by-prettify">,</span><=
span style=3D"color: #000;" class=3D"styled-by-prettify"> non</span><span s=
tyle=3D"color: #660;" class=3D"styled-by-prettify">-</span><span style=3D"c=
olor: #000;" class=3D"styled-by-prettify">prefetchable</span><span style=3D=
"color: #660;" class=3D"styled-by-prettify">)</span><span style=3D"color: #=
000;" class=3D"styled-by-prettify"> </span><span style=3D"color: #660;" cla=
ss=3D"styled-by-prettify">[</span><span style=3D"color: #000;" class=3D"sty=
led-by-prettify">size</span><span style=3D"color: #660;" class=3D"styled-by=
-prettify">=3D</span><span style=3D"color: #066;" class=3D"styled-by-pretti=
fy">256</span><span style=3D"color: #660;" class=3D"styled-by-prettify">]</=
span><span style=3D"color: #000;" class=3D"styled-by-prettify"><br>=C2=A0 =
=C2=A0 =C2=A0 =C2=A0 </span><span style=3D"color: #606;" class=3D"styled-by=
-prettify">Memory</span><span style=3D"color: #000;" class=3D"styled-by-pre=
ttify"> at </span><span style=3D"color: #066;" class=3D"styled-by-prettify"=
>100000100</span><span style=3D"color: #000;" class=3D"styled-by-prettify">=
 </span><span style=3D"color: #660;" class=3D"styled-by-prettify">(</span><=
span style=3D"color: #066;" class=3D"styled-by-prettify">64</span><span sty=
le=3D"color: #660;" class=3D"styled-by-prettify">-</span><span style=3D"col=
or: #000;" class=3D"styled-by-prettify">bit</span><span style=3D"color: #66=
0;" class=3D"styled-by-prettify">,</span><span style=3D"color: #000;" class=
=3D"styled-by-prettify"> non</span><span style=3D"color: #660;" class=3D"st=
yled-by-prettify">-</span><span style=3D"color: #000;" class=3D"styled-by-p=
rettify">prefetchable</span><span style=3D"color: #660;" class=3D"styled-by=
-prettify">)</span><span style=3D"color: #000;" class=3D"styled-by-prettify=
"> </span><span style=3D"color: #660;" class=3D"styled-by-prettify">[</span=
><span style=3D"color: #000;" class=3D"styled-by-prettify">size</span><span=
 style=3D"color: #660;" class=3D"styled-by-prettify">=3D</span><span style=
=3D"color: #066;" class=3D"styled-by-prettify">32</span><span style=3D"colo=
r: #660;" class=3D"styled-by-prettify">]</span><span style=3D"color: #000;"=
 class=3D"styled-by-prettify"><br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 </span><span =
style=3D"color: #606;" class=3D"styled-by-prettify">Capabilities</span><spa=
n style=3D"color: #660;" class=3D"styled-by-prettify">:</span><span style=
=3D"color: #000;" class=3D"styled-by-prettify"> </span><span style=3D"color=
: #660;" class=3D"styled-by-prettify">[</span><span style=3D"color: #066;" =
class=3D"styled-by-prettify">50</span><span style=3D"color: #660;" class=3D=
"styled-by-prettify">]</span><span style=3D"color: #000;" class=3D"styled-b=
y-prettify"> MSI</span><span style=3D"color: #660;" class=3D"styled-by-pret=
tify">-</span><span style=3D"color: #000;" class=3D"styled-by-prettify">X</=
span><span style=3D"color: #660;" class=3D"styled-by-prettify">:</span><spa=
n style=3D"color: #000;" class=3D"styled-by-prettify"> </span><span style=
=3D"color: #606;" class=3D"styled-by-prettify">Enable</span><span style=3D"=
color: #660;" class=3D"styled-by-prettify">-</span><span style=3D"color: #0=
00;" class=3D"styled-by-prettify"> </span><span style=3D"color: #606;" clas=
s=3D"styled-by-prettify">Count</span><span style=3D"color: #660;" class=3D"=
styled-by-prettify">=3D</span><span style=3D"color: #066;" class=3D"styled-=
by-prettify">1</span><span style=3D"color: #000;" class=3D"styled-by-pretti=
fy"> </span><span style=3D"color: #606;" class=3D"styled-by-prettify">Maske=
d</span><span style=3D"color: #660;" class=3D"styled-by-prettify">-</span><=
/div></code></div><br>My configurations can be found in the attachment.</di=
v><div style=3D"margin-left: 40px;">Does anyone have any idea what&#39;s mi=
ssing?</div><div style=3D"margin-left: 40px;"><br></div><div style=3D"margi=
n-left: 40px;">Many greetings . Thank you in advance.</div><div style=3D"ma=
rgin-left: 40px;">Sebastian<br></div></div>

<p></p>

-- <br />
You received this message because you are subscribed to the Google Groups &=
quot;Jailhouse&quot; group.<br />
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to <a href=3D"mailto:jailhouse-dev+unsubscribe@googlegroups.com">jailh=
ouse-dev+unsubscribe@googlegroups.com</a>.<br />
To view this discussion on the web visit <a href=3D"https://groups.google.c=
om/d/msgid/jailhouse-dev/3335f4d5-d834-4103-a4fa-45b55164d430%40googlegroup=
s.com?utm_medium=3Demail&utm_source=3Dfooter">https://groups.google.com/d/m=
sgid/jailhouse-dev/3335f4d5-d834-4103-a4fa-45b55164d430%40googlegroups.com<=
/a>.<br />

------=_Part_2656_2054540285.1566979278734--

------=_Part_2655_1157426774.1566979278731
Content-Type: text/x-csrc; charset=US-ASCII; name=tsn-inmate.c
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename=tsn-inmate.c
X-Attachment-Id: a87f0165-0931-422f-bebc-02054b8749fe
Content-ID: <a87f0165-0931-422f-bebc-02054b8749fe>

/*
 * Jailhouse, a Linux-based partitioning hypervisor
 *
 * Configuration for linux inmate, 1 CPU, ~60 MB RAM, 1 serial port
 *
 * Copyright (c) Siemens AG, 2013-2015
 *
 * Authors:
 *  Jan Kiszka <jan.kiszka@siemens.com>
 *
 * This work is licensed under the terms of the GNU GPL, version 2.  See
 * the COPYING file in the top-level directory.
 */

#include <jailhouse/types.h>
#include <jailhouse/cell-config.h>

struct {
	struct jailhouse_cell_desc cell;
	__u64 cpus[1];
	struct jailhouse_memory mem_regions[6]; // davor 5
	struct jailhouse_cache cache_regions[1];
	struct jailhouse_irqchip irqchips[1];
  	//__u8 pio_bitmap[0x2000];
	struct jailhouse_pio pio_regions[2];
	struct jailhouse_pci_device pci_devices[2];
	struct jailhouse_pci_capability pci_caps[8];

} __attribute__((packed)) config = {
	.cell = {
		.signature = JAILHOUSE_CELL_DESC_SIGNATURE,
		.revision = JAILHOUSE_CONFIG_REVISION,
		.name = "jail1-inmate",
		.flags = JAILHOUSE_CELL_PASSIVE_COMMREG |
			 JAILHOUSE_CELL_VIRTUAL_CONSOLE_PERMITTED,

		.cpu_set_size = sizeof(config.cpus),
		.num_memory_regions = ARRAY_SIZE(config.mem_regions),
		.num_cache_regions = ARRAY_SIZE(config.cache_regions),
		.num_irqchips = ARRAY_SIZE(config.irqchips),
		//.pio_bitmap_size = ARRAY_SIZE(config.pio_bitmap),
		.num_pio_regions = ARRAY_SIZE(config.pio_regions),
		.num_pci_devices = ARRAY_SIZE(config.pci_devices),
		.num_pci_caps = ARRAY_SIZE(config.pci_caps),
	},

	.cpus = {
		0x4,
	},

	.mem_regions = {
		/* low RAM */ {
			.phys_start = 0x100700000,
			.virt_start = 0,
			.size = 0x00100000,
			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
				JAILHOUSE_MEM_EXECUTE | JAILHOUSE_MEM_DMA |
				JAILHOUSE_MEM_LOADABLE,
		},
		/* communication region */ 
		{
                        .virt_start = 0x00100000,
                        .size = 0x00001000,
                        .flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
                                JAILHOUSE_MEM_COMM_REGION,
                },

		/* high RAM */ {
			.phys_start = 0x100800000,
			.virt_start = 0x00200000,
			.size = 0xf900000,
			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
				JAILHOUSE_MEM_EXECUTE | JAILHOUSE_MEM_DMA |
				JAILHOUSE_MEM_LOADABLE,
		},
		/* MemRegion: df000000-df01ffff : igb */
		{
			.phys_start = 0xdf000000,
			.virt_start = 0xdf000000,
			.size = 0x20000,
			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE,
		},
		/* MemRegion: df021000-df023fff : igb */
		{
			.phys_start = 0xdf021000,
			.virt_start = 0xdf021000,
			.size = 0x3000,
			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE,
		},

		/* IVSHMEM shared memory region */
		{
			.phys_start = 0x100600000,
			.virt_start = 0x100600000,
			.size = 0x100000,
			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
				JAILHOUSE_MEM_ROOTSHARED,
		},
	},

	.cache_regions = {
		{
			.start = 0,
			.size = 2,
			.type = JAILHOUSE_CACHE_L3,
		},
	},

	.irqchips = {
		/* IOAPIC 2, GSI base 0 */
		{
			.address = 0xfec00000,
			.id = 0x1f0f8,
			.pin_bitmap = {
				(1 << 4),
			},
		},
	},

	/*
	.pio_bitmap = {
		[     0/8 ...   0x6f/8]	= -1,
		[  0x70/8 ...   0x7f/8] = -1, /* RTC 	  
		[  0x80/8 ...  0x10f/8] = -1,
		[ 0x110/8 ...  0x11f/8]	=  0,
		[ 0x120/8 ...  0x2ef/8] = -1, /* serial 3 
		[ 0x2f0/8 ...  0x2f7/8] = -1,
		[ 0x2f8/8 ...  0x2ff/8] = -1, /* serial 1 
		[ 0x300/8 ...  0x3e7/8] = -1,
		[ 0x3e8/8 ...  0x3ef/8] = -1, /* serial 2 
		[ 0x3f0/8 ...  0x3f7/8] = -1,
		[ 0x3f8/8 ...  0x3ff/8] =  0, /* serial 0 
		[ 0x400/8 ... 0xffff/8] = -1, 
	}, */

	.pio_regions = {
		PIO_RANGE(0x110, 8),
		PIO_RANGE(0x3f8, 8),
	
	},




	.pci_devices = {
		// PCIDevice: 02:00.0
		{
			.type = JAILHOUSE_PCI_TYPE_DEVICE,
			.iommu = 1,
			.domain = 0x0,
			.bdf = 0x200,
			.bar_mask = {
				0xfffe0000, 0x00000000, 0x00000000,
				0xffffc000, 0x00000000, 0x00000000,
			},
			.caps_start = 0,
			.num_caps = 8,
			.num_msi_vectors = 1,
			.msi_64bits = 1,
			.msi_maskable = 1,
			.num_msix_vectors = 5,
			.msix_region_size = 0x1000,
			.msix_address = 0xdf020000,
		},
		/* Shared Devices */
		{
			.type = JAILHOUSE_PCI_TYPE_IVSHMEM,
			.domain = 0x0,
			.bdf = 0x300,
			.bar_mask = {
				0xffffff00, 0xffffffff, 0x00000000,
				0x00000000, 0xffffffe0, 0xffffffff,
			},
			.shmem_region = 5,
			.num_msix_vectors = 1,
			.shmem_protocol = JAILHOUSE_SHMEM_PROTO_VETH,
		},
	},
	.pci_caps = {
		// PCIDevice: 02:00.0 
		{
			.id = PCI_CAP_ID_PM,
			.start = 0x40,
			.len = 8,
			.flags = JAILHOUSE_PCICAPS_WRITE,
		},
		{
			.id = PCI_CAP_ID_MSI,
			.start = 0x50,
			.len = 24,
			.flags = JAILHOUSE_PCICAPS_WRITE,
		},
		{
			.id = PCI_CAP_ID_MSIX,
			.start = 0x70,
			.len = 12,
			.flags = JAILHOUSE_PCICAPS_WRITE,
		},
		{
			.id = PCI_CAP_ID_EXP,
			.start = 0xa0,
			.len = 60,
			.flags = JAILHOUSE_PCICAPS_WRITE,
		},
		{
			.id = PCI_EXT_CAP_ID_ERR | JAILHOUSE_PCI_EXT_CAP,
			.start = 0x100,
			.len = 4,
			.flags = JAILHOUSE_PCICAPS_WRITE,
		},
		{
			.id = JAILHOUSE_PCI_EXT_CAP,
			.start = 0x104,
			.len = 4,
			.flags = JAILHOUSE_PCICAPS_WRITE,
		},
 		{
			.id = JAILHOUSE_PCI_EXT_CAP,
			.start = 0x110,
			.len = 4,
			.flags = JAILHOUSE_PCICAPS_WRITE,
		},
		{
			.id = PCI_EXT_CAP_ID_TPH | JAILHOUSE_PCI_EXT_CAP,
			.start = 0x1a0,
			.len = 4,
			.flags = 0,
		},
	},

};


------=_Part_2655_1157426774.1566979278731
Content-Type: text/x-csrc; charset=US-ASCII; name=tsn.c
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename=tsn.c
X-Attachment-Id: fe7e8183-2b56-4b04-a839-d3b182ca2354
Content-ID: <fe7e8183-2b56-4b04-a839-d3b182ca2354>

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
 * Configuration for
 * created with '/usr/local/libexec/jailhouse/jailhouse config create --mem-inmates 256M tsn.c'
 *
 * NOTE: This config expects the following to be appended to your kernel cmdline
 *       "memmap=0x70000000$0x100000000"
 */

#include <jailhouse/types.h>
#include <jailhouse/cell-config.h>

struct {
	struct jailhouse_system header;
	__u64 cpus[1];
	struct jailhouse_memory mem_regions[44];
	struct jailhouse_irqchip irqchips[1];
	
	//__u8 pio_bitmap[0x2000];
	struct jailhouse_pio pio_regions[6];
	
	struct jailhouse_pci_device pci_devices[14];
	struct jailhouse_pci_capability pci_caps[35];
} __attribute__((packed)) config = {
	.header = {
		.signature = JAILHOUSE_SYSTEM_SIGNATURE,
		.revision = JAILHOUSE_CONFIG_REVISION,
		.flags = JAILHOUSE_SYS_VIRTUAL_DEBUG_CONSOLE,
		.hypervisor_memory = {
			.phys_start = 0x100000000,
			.size = 0x600000,
		},
		.debug_console = {
			.address = 0x3f8,
			.type = JAILHOUSE_CON_TYPE_8250,
			.flags = JAILHOUSE_CON_ACCESS_PIO |
				 JAILHOUSE_CON_REGDIST_1,
		},
		.platform_info = {
			.pci_mmconfig_base = 0xe0000000,
			.pci_mmconfig_end_bus = 0xff,
			.x86 = {
				.pm_timer_address = 0x1808,
				.vtd_interrupt_limit = 256,
				.iommu_units = {
					{
						.type = JAILHOUSE_IOMMU_INTEL,
						.base = 0xfed90000,
						.size = 0x1000,
					},
					{
						.type = JAILHOUSE_IOMMU_INTEL,
						.base = 0xfed91000,
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
			//.pio_bitmap_size = ARRAY_SIZE(config.pio_bitmap),
			.num_pio_regions = ARRAY_SIZE(config.pio_regions),
			.num_pci_devices = ARRAY_SIZE(config.pci_devices),
			.num_pci_caps = ARRAY_SIZE(config.pci_caps),
		},
	},

	.cpus = {
		0x000000000000000f,
	},

	.mem_regions = {
		/* MemRegion: 00000000-0009dbff : System RAM */
		{
			.phys_start = 0x0,
			.virt_start = 0x0,
			.size = 0x9e000,
			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
				JAILHOUSE_MEM_EXECUTE | JAILHOUSE_MEM_DMA,
		},
		/* MemRegion: 00100000-103fffff : System RAM */
		{
			.phys_start = 0x100000,
			.virt_start = 0x100000,
			.size = 0x10300000,
			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
				JAILHOUSE_MEM_EXECUTE | JAILHOUSE_MEM_DMA,
		},
		/* MemRegion: 10400000-11ffffff : Kernel */
		{
			.phys_start = 0x10400000,
			.virt_start = 0x10400000,
			.size = 0x1c00000,
			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
				JAILHOUSE_MEM_EXECUTE | JAILHOUSE_MEM_DMA,
		},
		/* MemRegion: 12000000-87d9dfff : System RAM */
		{
			.phys_start = 0x12000000,
			.virt_start = 0x12000000,
			.size = 0x75d9e000,
			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
				JAILHOUSE_MEM_EXECUTE | JAILHOUSE_MEM_DMA,
		},
		/* MemRegion: 87d9e000-87d9efff : ACPI Non-volatile Storage */
		{
			.phys_start = 0x87d9e000,
			.virt_start = 0x87d9e000,
			.size = 0x1000,
			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE,
		},
		/* MemRegion: 87dc9000-8c4f7fff : System RAM */
		{
			.phys_start = 0x87dc9000,
			.virt_start = 0x87dc9000,
			.size = 0x472f000,
			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
				JAILHOUSE_MEM_EXECUTE | JAILHOUSE_MEM_DMA,
		},
		/* MemRegion: 8c56e000-8c5a2fff : ACPI Tables */
		{
			.phys_start = 0x8c56e000,
			.virt_start = 0x8c56e000,
			.size = 0x35000,
			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE,
		},
		/* MemRegion: 8c5a3000-8ce95fff : ACPI Non-volatile Storage */
		{
			.phys_start = 0x8c5a3000,
			.virt_start = 0x8c5a3000,
			.size = 0x8f3000,
			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE,
		},
		/* MemRegion: 8d2ff000-8d2fffff : System RAM */
		{
			.phys_start = 0x8d2ff000,
			.virt_start = 0x8d2ff000,
			.size = 0x1000,
			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
				JAILHOUSE_MEM_EXECUTE | JAILHOUSE_MEM_DMA,
		},
		/* MemRegion: 8d400000-8dffffff : RAM buffer [10] */
		{
			.phys_start = 0x8d400000,
			.virt_start = 0x8d400000,
			.size = 0xc00000,
			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
				JAILHOUSE_MEM_EXECUTE | JAILHOUSE_MEM_DMA,
		},
		/* MemRegion: c0000000-cfffffff : 0000:00:02.0 */
		{
			.phys_start = 0xc0000000,
			.virt_start = 0xc0000000,
			.size = 0x10000000,
			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE,
		},
		/* MemRegion: de000000-deffffff : 0000:00:02.0 */
		{
			.phys_start = 0xde000000,
			.virt_start = 0xde000000,
			.size = 0x1000000,
			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE,
		},
#if 0
		/* MemRegion: df000000-df01ffff : igb */
		{
			.phys_start = 0xdf000000,
			.virt_start = 0xdf000000,
			.size = 0x20000,
			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE,
		},
		/* MemRegion: df021000-df023fff : igb */
		{
			.phys_start = 0xdf021000,
			.virt_start = 0xdf021000,
			.size = 0x3000,
			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE,
		},
#endif
		/* MemRegion: df100000-df11ffff : e1000e */
		{
			.phys_start = 0xdf100000,
			.virt_start = 0xdf100000,
			.size = 0x20000,
			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE,
		},
		/* MemRegion: df120000-df12ffff : ICH HD audio */
		{
			.phys_start = 0xdf120000,
			.virt_start = 0xdf120000,
			.size = 0x10000,
			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE,
		},
		/* MemRegion: df130000-df13ffff : xhci-hcd */
		{
			.phys_start = 0xdf130000,
			.virt_start = 0xdf130000,
			.size = 0x10000,
			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE,
		},
		/* MemRegion: df140000-df143fff : ICH HD audio */
		{
			.phys_start = 0xdf140000,
			.virt_start = 0xdf140000,
			.size = 0x4000,
			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE,
		},
		/* MemRegion: df144000-df147fff : 0000:00:1f.2 */
		{
			.phys_start = 0xdf144000,
			.virt_start = 0xdf144000,
			.size = 0x4000,
			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE,
		},
		/* MemRegion: df148000-df149fff : ahci */
		{
			.phys_start = 0xdf148000,
			.virt_start = 0xdf148000,
			.size = 0x2000,
			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE,
		},
		/* MemRegion: df14a000-df14a0ff : 0000:00:1f.4 */
		{
			.phys_start = 0xdf14a000,
			.virt_start = 0xdf14a000,
			.size = 0x1000,
			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE,
		},
		/* MemRegion: df14b000-df14b7ff : ahci [20]*/
		{
			.phys_start = 0xdf14b000,
			.virt_start = 0xdf14b000,
			.size = 0x1000,
			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE,
		},
		/* MemRegion: df14c000-df14c0ff : ahci */
		{
			.phys_start = 0xdf14c000,
			.virt_start = 0xdf14c000,
			.size = 0x1000,
			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE,
		},
		/* MemRegion: df14d000-df14dfff : 0000:00:14.2 */
		{
			.phys_start = 0xdf14d000,
			.virt_start = 0xdf14d000,
			.size = 0x1000,
			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE,
		},
		/* MemRegion: df14e000-df14efff : 0000:00:08.0 */
		{
			.phys_start = 0xdf14e000,
			.virt_start = 0xdf14e000,
			.size = 0x1000,
			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE,
		},
		/* MemRegion: dffe0000-dfffffff : pnp 00:0a */
		{
			.phys_start = 0xdffe0000,
			.virt_start = 0xdffe0000,
			.size = 0x20000,
			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE,
		},
		/* MemRegion: fd000000-fdabffff : pnp 00:0b */
		{
			.phys_start = 0xfd000000,
			.virt_start = 0xfd000000,
			.size = 0xac0000,
			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE,
		},
		/* MemRegion: fdac0000-fdacffff : pnp 00:0d */
		{
			.phys_start = 0xfdac0000,
			.virt_start = 0xfdac0000,
			.size = 0x10000,
			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE,
		},
		/* MemRegion: fdad0000-fdadffff : pnp 00:0b */
		{
			.phys_start = 0xfdad0000,
			.virt_start = 0xfdad0000,
			.size = 0x10000,
			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE,
		},
		/* MemRegion: fdae0000-fdaeffff : pnp 00:0d */
		{
			.phys_start = 0xfdae0000,
			.virt_start = 0xfdae0000,
			.size = 0x10000,
			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE,
		},
		/* MemRegion: fdaf0000-fdafffff : pnp 00:0d */
		{
			.phys_start = 0xfdaf0000,
			.virt_start = 0xfdaf0000,
			.size = 0x10000,
			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE,
		},
		/* MemRegion: fdc6000c-fdc6000f : iTCO_wdt [30] */
		{
			.phys_start = 0xfdc6000c,
			.virt_start = 0xfdc6000c,
			.size = 0x1000,
			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE,
		},
		/* MemRegion: fe036000-fe03bfff : pnp 00:0b */
		{
			.phys_start = 0xfe036000,
			.virt_start = 0xfe036000,
			.size = 0x6000,
			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE,
		},
		/* MemRegion: fe03d000-fe3fffff : pnp 00:0b */
		{
			.phys_start = 0xfe03d000,
			.virt_start = 0xfe03d000,
			.size = 0x3c3000,
			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE,
		},
		/* MemRegion: fe410000-fe7fffff : pnp 00:0b */
		{
			.phys_start = 0xfe410000,
			.virt_start = 0xfe410000,
			.size = 0x3f0000,
			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE,
		},
		/* MemRegion: fed00000-fed003ff : PNP0103:00 */
		{
			.phys_start = 0xfed00000,
			.virt_start = 0xfed00000,
			.size = 0x1000,
			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE,
		},
		/* MemRegion: fed10000-fed17fff : pnp 00:0a */
		{
			.phys_start = 0xfed10000,
			.virt_start = 0xfed10000,
			.size = 0x8000,
			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE,
		},
		/* MemRegion: fed18000-fed18fff : pnp 00:0a */
		{
			.phys_start = 0xfed18000,
			.virt_start = 0xfed18000,
			.size = 0x1000,
			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE,
		},
		/* MemRegion: fed19000-fed19fff : pnp 00:0a */
		{
			.phys_start = 0xfed19000,
			.virt_start = 0xfed19000,
			.size = 0x1000,
			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE,
		},
		/* MemRegion: fed20000-fed3ffff : pnp 00:0a */
		{
			.phys_start = 0xfed20000,
			.virt_start = 0xfed20000,
			.size = 0x20000,
			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE,
		},
		/* MemRegion: fed45000-fed8ffff : pnp 00:0a */
		{
			.phys_start = 0xfed45000,
			.virt_start = 0xfed45000,
			.size = 0x4b000,
			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE,
		},
		/* MemRegion: 000c0000-000dffff : ROMs [40] */
		{
			.phys_start = 0xc0000,
			.virt_start = 0xc0000,
			.size = 0x20000,
			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE,
		},
		/* MemRegion: 8c51a000-8c539fff : ACPI DMAR RMRR */
		/* PCI device: 00:14.0 */
		{
			.phys_start = 0x8c51a000,
			.virt_start = 0x8c51a000,
			.size = 0x20000,
			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
				JAILHOUSE_MEM_EXECUTE | JAILHOUSE_MEM_DMA,
		},
		/* MemRegion: 8d800000-8fffffff : ACPI DMAR RMRR */
		/* PCI device: 00:02.0 */
		{
			.phys_start = 0x8d800000,
			.virt_start = 0x8d800000,
			.size = 0x2800000,
			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
				JAILHOUSE_MEM_EXECUTE | JAILHOUSE_MEM_DMA,
		},

		/* IVSHMEM shared memory region 43*/
		{
			.phys_start = 0x100600000,
			.virt_start = 0x100600000,
			.size = 0x100000,
			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE ,
		},
		/* MemRegion: 100700000-1105fffff : JAILHOUSE Inmate Memory 44*/
		{
			.phys_start = 0x100700000,
			.virt_start = 0x100700000,
			.size = 0x4b00000,
			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE,
		},
	},

	.irqchips = {
		/* IOAPIC 2, GSI base 0 */
		{
			.address = 0xfec00000,
			.id = 0x1f0f8,
			.pin_bitmap = {
				0xffffffff, 0xffffffff, 0xffffffff, 0xffffffff
			},
		},
	},
	/*
	.pio_bitmap = {
		[     0/8 ...   0x3f/8] = -1,
		[  0x40/8 ...   0x47/8] = 0xf0,  /* PIT 
		[  0x48/8 ...   0x5f/8] = -1,
		[  0x60/8 ...   0x67/8] = 0xec,  /* HACK: NMI status/control
		[  0x68/8 ...   0x6f/8] = -1,
		[  0x70/8 ...   0x77/8] = 0xfc,  /* RTC 
		[  0x78/8 ...  0x2e7/8] = -1,
		[ 0x2e8/8 ...  0x2ef/8] = -1,	 /* ttyS3 
		[ 0x2f0/8 ...  0x2f7/8] = -1,
		[ 0x2f8/8 ...  0x2ff/8] = -1, 	 /* ttyS1
		[ 0x300/8 ...  0x3af/8] = -1,
		[ 0x3b0/8 ...  0x3df/8] = 0x00,  /* VGA 
		[ 0x3e0/8 ...  0x3e7/8] = -1,
		[ 0x3e8/8 ...  0x3ef/8] = -1,	 /* ttyS2 
		[ 0x3f0/8 ...  0x3f7/8] = -1,
		[ 0x3f8/8 ...  0x3ff/8] = -1,	 /* ttyS0 
		[ 0x400/8 ...  0xcff/8] = -1,
		[ 0xd00/8 ... 0xffff/8] =  0, 	 
	},
	*/

	.pio_regions = {
			PIO_RANGE(0x40, 4), /* PIT */
			PIO_RANGE(0x60, 2), /* HACK: NMI status/control */
			PIO_RANGE(0x64, 1), /* I8042 */
			PIO_RANGE(0x70, 2), /* RTC */
			PIO_RANGE(0x3b0, 0x30), /* VGA */
			PIO_RANGE(0xd00, 0xf300), /* HACK: PCI bus */
		},
	




	.pci_devices = {
		/* PCIDevice: 00:00.0 */
		{
			.type = JAILHOUSE_PCI_TYPE_DEVICE,
			.iommu = 1,
			.domain = 0x0,
			.bdf = 0x0,
			.bar_mask = {
				0x00000000, 0x00000000, 0x00000000,
				0x00000000, 0x00000000, 0x00000000,
			},
			.caps_start = 0,
			.num_caps = 1,
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
				0xff000000, 0xffffffff, 0xf0000000,
				0xffffffff, 0xffffffc0, 0x00000000,
			},
			.caps_start = 1,
			.num_caps = 7,
			.num_msi_vectors = 1,
			.msi_64bits = 0,
			.msi_maskable = 0,
			.num_msix_vectors = 0,
			.msix_region_size = 0x0,
			.msix_address = 0x0,
		},
		/* PCIDevice: 00:08.0 */
		{
			.type = JAILHOUSE_PCI_TYPE_DEVICE,
			.iommu = 1,
			.domain = 0x0,
			.bdf = 0x40,
			.bar_mask = {
				0xfffff000, 0xffffffff, 0x00000000,
				0x00000000, 0x00000000, 0x00000000,
			},
			.caps_start = 8,
			.num_caps = 3,
			.num_msi_vectors = 1,
			.msi_64bits = 0,
			.msi_maskable = 0,
			.num_msix_vectors = 0,
			.msix_region_size = 0x0,
			.msix_address = 0x0,
		},
		/* PCIDevice: 00:14.0 */
		{
			.type = JAILHOUSE_PCI_TYPE_DEVICE,
			.iommu = 1,
			.domain = 0x0,
			.bdf = 0xa0,
			.bar_mask = {
				0xffff0000, 0xffffffff, 0x00000000,
				0x00000000, 0x00000000, 0x00000000,
			},
			.caps_start = 11,
			.num_caps = 2,
			.num_msi_vectors = 8,
			.msi_64bits = 1,
			.msi_maskable = 0,
			.num_msix_vectors = 0,
			.msix_region_size = 0x0,
			.msix_address = 0x0,
		},
		/* PCIDevice: 00:14.2 */
		{
			.type = JAILHOUSE_PCI_TYPE_DEVICE,
			.iommu = 1,
			.domain = 0x0,
			.bdf = 0xa2,
			.bar_mask = {
				0xfffff000, 0xffffffff, 0x00000000,
				0x00000000, 0x00000000, 0x00000000,
			},
			.caps_start = 13,
			.num_caps = 2,
			.num_msi_vectors = 1,
			.msi_64bits = 0,
			.msi_maskable = 0,
			.num_msix_vectors = 0,
			.msix_region_size = 0x0,
			.msix_address = 0x0,
		},
		/* PCIDevice: 00:17.0 */
		{
			.type = JAILHOUSE_PCI_TYPE_DEVICE,
			.iommu = 1,
			.domain = 0x0,
			.bdf = 0xb8,
			.bar_mask = {
				0xffffe000, 0xffffff00, 0xfffffff8,
				0xfffffffc, 0xffffffe0, 0xfffff800,
			},
			.caps_start = 15,
			.num_caps = 3,
			.num_msi_vectors = 1,
			.msi_64bits = 0,
			.msi_maskable = 0,
			.num_msix_vectors = 0,
			.msix_region_size = 0x0,
			.msix_address = 0x0,
		},
		/* PCIDevice: 00:1c.0 */
		{
			.type = JAILHOUSE_PCI_TYPE_BRIDGE,
			.iommu = 1,
			.domain = 0x0,
			.bdf = 0xe0,
			.bar_mask = {
				0x00000000, 0x00000000, 0x00000000,
				0x00000000, 0x00000000, 0x00000000,
			},
			.caps_start = 18,
			.num_caps = 5,
			.num_msi_vectors = 1,
			.msi_64bits = 0,
			.msi_maskable = 0,
			.num_msix_vectors = 0,
			.msix_region_size = 0x0,
		},

		/* PCIDevice: 00:1c.6 */
		{
			.type = JAILHOUSE_PCI_TYPE_BRIDGE,
			.iommu = 1,
			.domain = 0x0,
			.bdf = 0xe6,
			.bar_mask = {
				0x00000000, 0x00000000, 0x00000000,
				0x00000000, 0x00000000, 0x00000000,
			},
			.caps_start = 23,
			.num_caps = 7,
			.num_msi_vectors = 1,
			.msi_64bits = 0,
			.msi_maskable = 0,
			.num_msix_vectors = 0,
			.msix_region_size = 0x0,
			.msix_address = 0x0,
		},
		/* PCIDevice: 00:1f.0 */
		{
			.type = JAILHOUSE_PCI_TYPE_DEVICE,
			.iommu = 1,
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
			.iommu = 1,
			.domain = 0x0,
			.bdf = 0xfa,
			.bar_mask = {
				0xffffc000, 0x00000000, 0x00000000,
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
		/* PCIDevice: 00:1f.3 */
		{
			.type = JAILHOUSE_PCI_TYPE_DEVICE,
			.iommu = 1,
			.domain = 0x0,
			.bdf = 0xfb,
			.bar_mask = {
				0xffffc000, 0xffffffff, 0x00000000,
				0x00000000, 0xffff0000, 0xffffffff,
			},
			.caps_start = 30,
			.num_caps = 2,
			.num_msi_vectors = 1,
			.msi_64bits = 1,
			.msi_maskable = 0,
			.num_msix_vectors = 0,
			.msix_region_size = 0x0,
			.msix_address = 0x0,
		},
		/* PCIDevice: 00:1f.4 */
		{
			.type = JAILHOUSE_PCI_TYPE_DEVICE,
			.iommu = 1,
			.domain = 0x0,
			.bdf = 0xfc,
			.bar_mask = {
				0xffffff00, 0xffffffff, 0x00000000,
				0x00000000, 0xffffffe0, 0x00000000,
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
		/* PCIDevice: 00:1f.6 */
		{
			.type = JAILHOUSE_PCI_TYPE_DEVICE,
			.iommu = 1,
			.domain = 0x0,
			.bdf = 0xfe,
			.bar_mask = {
				0xfffe0000, 0x00000000, 0x00000000,
				0x00000000, 0x00000000, 0x00000000,
			},
			.caps_start = 32,
			.num_caps = 3,
			.num_msi_vectors = 1,
			.msi_64bits = 1,
			.msi_maskable = 0,
			.num_msix_vectors = 0,
			.msix_region_size = 0x0,
			.msix_address = 0x0,
		},
		/* Shared Devices */
		{
			.type = JAILHOUSE_PCI_TYPE_IVSHMEM,
			.iommu = 1,
			.domain = 0x0000,
			.bdf = 0x300,
			.bar_mask = {
				0xffffff00, 0xffffffff, 0x00000000,
				0x00000000, 0xffffffe0, 0xffffffff,
			},
			.num_msix_vectors = 1,
			.shmem_region = 42, // Index starts with 0
			.shmem_protocol = JAILHOUSE_SHMEM_PROTO_VETH, //should sym ETERHNE
		},

		/*

		// PCIDevice: 02:00.0
		{
			.type = JAILHOUSE_PCI_TYPE_DEVICE,
			.iommu = 1,
			.domain = 0x0,
			.bdf = 0x200,
			.bar_mask = {
				0xfffe0000, 0x00000000, 0x00000000,
				0xffffc000, 0x00000000, 0x00000000,
			},
			.caps_start = 35,
			.num_caps = 6,
			.num_msi_vectors = 1,
			.msi_64bits = 1,
			.msi_maskable = 1,
			.num_msix_vectors = 5,
			.msix_region_size = 0x1000,
			.msix_address = 0xdf020000,
		},

		*/

	},

	.pci_caps = {
		/* PCIDevice: 00:00.0 */
		{
			.id = PCI_CAP_ID_VNDR,
			.start = 0xe0,
			.len = 2,
			.flags = 0,
		},
		// PCIDevice: 00:02.0 
		{
			.id = PCI_CAP_ID_VNDR,
			.start = 0x40,
			.len = 2,
			.flags = 0,
		},
		{
			.id = PCI_CAP_ID_EXP,
			.start = 0x70,
			.len = 60,
			.flags = 0,
		},
		{
			.id = PCI_CAP_ID_MSI,
			.start = 0xac,
			.len = 10,
			.flags = JAILHOUSE_PCICAPS_WRITE,
		},
		{
			.id = PCI_CAP_ID_PM,
			.start = 0xd0,
			.len = 8,
			.flags = JAILHOUSE_PCICAPS_WRITE,
		},
		{
			.id = PCI_EXT_CAP_ID_PASID | JAILHOUSE_PCI_EXT_CAP,
			.start = 0x100,
			.len = 4,
			.flags = 0,
		},
		{
			.id = PCI_EXT_CAP_ID_ATS | JAILHOUSE_PCI_EXT_CAP,
			.start = 0x200,
			.len = 4,
			.flags = 0,
		},
		{
			.id = PCI_EXT_CAP_ID_PRI | JAILHOUSE_PCI_EXT_CAP,
			.start = 0x300,
			.len = 4,
			.flags = 0,
		},
		/* PCIDevice: 00:08.0 */
		{
			.id = PCI_CAP_ID_MSI,
			.start = 0x90,
			.len = 10,
			.flags = JAILHOUSE_PCICAPS_WRITE,
		},
		{
			.id = PCI_CAP_ID_PM,
			.start = 0xdc,
			.len = 8,
			.flags = JAILHOUSE_PCICAPS_WRITE,
		},
		{
			.id = PCI_CAP_ID_AF,
			.start = 0xf0,
			.len = 2,
			.flags = 0,
		},
		/* PCIDevice: 00:14.0 */
		{
			.id = PCI_CAP_ID_PM,
			.start = 0x70,
			.len = 8,
			.flags = JAILHOUSE_PCICAPS_WRITE,
		},
		{
			.id = PCI_CAP_ID_MSI,
			.start = 0x80,
			.len = 14,
			.flags = JAILHOUSE_PCICAPS_WRITE,
		},
		/* PCIDevice: 00:14.2 */
		{
			.id = PCI_CAP_ID_PM,
			.start = 0x50,
			.len = 8,
			.flags = JAILHOUSE_PCICAPS_WRITE,
		},
		{
			.id = PCI_CAP_ID_MSI,
			.start = 0x80,
			.len = 10,
			.flags = JAILHOUSE_PCICAPS_WRITE,
		},
		/* PCIDevice: 00:17.0 */
		{
			.id = PCI_CAP_ID_MSI,
			.start = 0x80,
			.len = 10,
			.flags = JAILHOUSE_PCICAPS_WRITE,
		},
		{
			.id = PCI_CAP_ID_PM,
			.start = 0x70,
			.len = 8,
			.flags = JAILHOUSE_PCICAPS_WRITE,
		},
		{
			.id = PCI_CAP_ID_SATA,
			.start = 0xa8,
			.len = 2,
			.flags = 0,
		},
		/* PCIDevice: 00:1c.0 */
		{
			.id = PCI_CAP_ID_EXP,
			.start = 0x40,
			.len = 60,
			.flags = 0,
		},
		{
			.id = PCI_CAP_ID_MSI,
			.start = 0x80,
			.len = 10,
			.flags = JAILHOUSE_PCICAPS_WRITE,
		},
		{
			.id = PCI_CAP_ID_SSVID,
			.start = 0x90,
			.len = 2,
			.flags = 0,
		},
		{
			.id = PCI_CAP_ID_PM,
			.start = 0xa0,
			.len = 8,
			.flags = JAILHOUSE_PCICAPS_WRITE,
		},
		{
			.id = 0x0 | JAILHOUSE_PCI_EXT_CAP,
			.start = 0x100,
			.len = 4,
			.flags = 0,
		},
		/* PCIDevice: 00:1c.6 */
		{
			.id = PCI_CAP_ID_EXP,
			.start = 0x40,
			.len = 60,
			.flags = 0,
		},
		{
			.id = PCI_CAP_ID_MSI,
			.start = 0x80,
			.len = 10,
			.flags = JAILHOUSE_PCICAPS_WRITE,
		},
		{
			.id = PCI_CAP_ID_SSVID,
			.start = 0x90,
			.len = 2,
			.flags = 0,
		},
		{
			.id = PCI_CAP_ID_PM,
			.start = 0xa0,
			.len = 8,
			.flags = JAILHOUSE_PCICAPS_WRITE,
		},
		{
			.id = PCI_EXT_CAP_ID_ERR | JAILHOUSE_PCI_EXT_CAP,
			.start = 0x100,
			.len = 4,
			.flags = 0,
		},
		{
			.id = PCI_EXT_CAP_ID_ACS | JAILHOUSE_PCI_EXT_CAP,
			.start = 0x140,
			.len = 4,
			.flags = 0,
		},
		{
			.id = PCI_EXT_CAP_ID_SECPCI | JAILHOUSE_PCI_EXT_CAP,
			.start = 0x220,
			.len = 4,
			.flags = 0,
		},
		/* PCIDevice: 00:1f.3 */
		{
			.id = PCI_CAP_ID_PM,
			.start = 0x50,
			.len = 8,
			.flags = JAILHOUSE_PCICAPS_WRITE,
		},
		{
			.id = PCI_CAP_ID_MSI,
			.start = 0x60,
			.len = 14,
			.flags = JAILHOUSE_PCICAPS_WRITE,
		},
		/* PCIDevice: 00:1f.6 */
		{
			.id = PCI_CAP_ID_PM,
			.start = 0xc8,
			.len = 8,
			.flags = JAILHOUSE_PCICAPS_WRITE,
		},
		{
			.id = PCI_CAP_ID_MSI,
			.start = 0xd0,
			.len = 14,
			.flags = JAILHOUSE_PCICAPS_WRITE,
		},
		{
			.id = PCI_CAP_ID_AF,
			.start = 0xe0,
			.len = 2,
			.flags = 0,
		},
		/*
		// PCIDevice: 02:00.0 
		{
			.id = PCI_CAP_ID_PM,
			.start = 0x40,
			.len = 8,
			.flags = JAILHOUSE_PCICAPS_WRITE,
		},
		{
			.id = PCI_CAP_ID_MSI,
			.start = 0x50,
			.len = 24,
			.flags = JAILHOUSE_PCICAPS_WRITE,
		},
		{
			.id = PCI_CAP_ID_MSIX,
			.start = 0x70,
			.len = 12,
			.flags = JAILHOUSE_PCICAPS_WRITE,
		},
		{
			.id = PCI_CAP_ID_EXP,
			.start = 0xa0,
			.len = 60,
			.flags = 0,
		},
		{
			.id = PCI_EXT_CAP_ID_ERR | JAILHOUSE_PCI_EXT_CAP,
			.start = 0x100,
			.len = 4,
			.flags = 0,
		},
		{
			.id = PCI_EXT_CAP_ID_TPH | JAILHOUSE_PCI_EXT_CAP,
			.start = 0x1a0,
			.len = 4,
			.flags = 0,
		},
		*/
	},
};

------=_Part_2655_1157426774.1566979278731--
