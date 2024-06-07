Return-Path: <jailhouse-dev+bncBCBNF7GQ6QBBBHMERKZQMGQEIPOXIOA@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-yb1-xb39.google.com (mail-yb1-xb39.google.com [IPv6:2607:f8b0:4864:20::b39])
	by mail.lfdr.de (Postfix) with ESMTPS id AA9158FFA40
	for <lists+jailhouse-dev@lfdr.de>; Fri,  7 Jun 2024 05:44:31 +0200 (CEST)
Received: by mail-yb1-xb39.google.com with SMTP id 3f1490d57ef6-df78fddad5dsf3220422276.2
        for <lists+jailhouse-dev@lfdr.de>; Thu, 06 Jun 2024 20:44:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20230601; t=1717731870; x=1718336670; darn=lfdr.de;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:x-original-sender:mime-version
         :subject:message-id:to:from:date:sender:from:to:cc:subject:date
         :message-id:reply-to;
        bh=dTibN5L+0KN3EB43/tfzIB8FkaxU0ViN4/712F/MI14=;
        b=lhmFT+qaS09W+ySag4xQjAlxKK5CKiIg92PlpQr4ZTbB/4tGmr19CTBU6UAPmWCJNd
         HQ8XUA+noeYFGvbqKF11zMbJRS0YQz77yMwaIOAqUPdLqMDldIUcGj1Z9hRABpI1AXvn
         bELG76CCWMJgvgq7Mi5B3jJBJ8AOVNEtOhuEigHHAtKceUOjgOFDaGV4Zpd4HkPYJiI8
         fS2MNQOmjt5KjNncdQQYvgrmgAQsPXMl6HreYjZU1Kp5ynIa1WODTYqEJZOLg3zXr/i/
         GsJg5awg7hYWRwtndrF6P83v+FgCBpxHwTYj4FyUuJGEAsr0f2w+E87aAYUMqVbqOyKz
         B3NA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1717731870; x=1718336670; darn=lfdr.de;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:x-original-sender:mime-version
         :subject:message-id:to:from:date:from:to:cc:subject:date:message-id
         :reply-to;
        bh=dTibN5L+0KN3EB43/tfzIB8FkaxU0ViN4/712F/MI14=;
        b=jSECaTBvtmOW0xv8Ob5vfnAXEtnQPe8ELcPusMEHJnCopqW4j6cv/g6/83agEcs53f
         faAEJ7ekdFAtgWM10UtaOKPCOWlhZReRLjLBx/6L3OImtmY/iS8IjoHfxr2bXmxxP6GI
         a24ArdpFGlod9DqnszCVUsZUb/uDKsDoQX6+RXJuo2290+o1HBscNFirPw4OFh2UZ7Ru
         WiLDZn5VCTQadJx06bpNyuojys8pHXxcbfd61D7FUk8NY1n+5AW0Kfk2fF/oie7rnskB
         a9o5jASMVedQtmLaO7PkDb84ZXsvnVMGFzZad+UCzckuu/KS9t1RK0Q3YKx+N1wWvqUz
         nQYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717731870; x=1718336670;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :x-spam-checked-in-group:list-id:mailing-list:precedence
         :x-original-sender:mime-version:subject:message-id:to:from:date
         :x-beenthere:x-gm-message-state:sender:from:to:cc:subject:date
         :message-id:reply-to;
        bh=dTibN5L+0KN3EB43/tfzIB8FkaxU0ViN4/712F/MI14=;
        b=QZ/1xg//M7vn9jyQnq87Ko/ZmBspYhxorxSKs2T6PzXVKOguGrIf0d7Udi1c3qUanU
         WaEskjlTswGrAsOBjIHt8/rgwpI5v6vndZ9QvDxyKYu9Gc5C/AP7wrrg+xru93SR4YhZ
         evgqAuSEixsVi2vQTeE14Yf11KzvguupbfOqFk6JBFcBzby4k5S86qic6q7/ScbA/IRK
         +YYZ8byVzVW9D+rD2S2x6BIPf5FfI6j6IH9qMv3oBo6NxApHHZBgLgzIb4VBECPz1g4+
         GJZQWVXFf9xHIhnMhQVfP787CkDnLLZg58jspBCsmqB+JZ1mtrJ3z6GOrkgDZ4bQtwJ8
         +JuQ==
Sender: jailhouse-dev@googlegroups.com
X-Forwarded-Encrypted: i=1; AJvYcCU9He3qC6kDM8zf9RewXNlBrH7nCS58p+CpR8Q/oOnGX6h/zuPJ63/QoqWc72rMCgttbQAnv588vv7gCNDfIRnWewQYhbhMYLhGZSk=
X-Gm-Message-State: AOJu0Yy+qAOjrKmJxCZntSSCOm/uS3uV/ewJf+PRyQKPofUUeQJq3Ob4
	OInei9Whi5ypPKfNQJlC7vJQr0a3n7DeJUoJv037y8yQQQ/RyLWx
X-Google-Smtp-Source: AGHT+IG8ta1uSwsngIJfdmXSklIPJHWDimlYBjkeQ8NWyjYZ8wlvBiOE7Kxv1z63fze/VD2yLAcUiw==
X-Received: by 2002:a05:6902:260d:b0:df4:e6db:d411 with SMTP id 3f1490d57ef6-dfaf65c5245mr1462910276.20.1717731870278;
        Thu, 06 Jun 2024 20:44:30 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a25:824a:0:b0:dfa:739b:d8fb with SMTP id 3f1490d57ef6-dfaf124d2cfls1090125276.0.-pod-prod-01-us;
 Thu, 06 Jun 2024 20:44:28 -0700 (PDT)
X-Received: by 2002:a81:4cd1:0:b0:61b:e689:7347 with SMTP id 00721157ae682-62cd55717e0mr2518397b3.2.1717731868485;
        Thu, 06 Jun 2024 20:44:28 -0700 (PDT)
Date: Thu, 6 Jun 2024 20:44:27 -0700 (PDT)
From: ze <xhzsddx@gmail.com>
To: Jailhouse <jailhouse-dev@googlegroups.com>
Message-Id: <c8eb0631-0d7b-49a8-8d01-6180cf5f732an@googlegroups.com>
Subject: Can't Boot linux in non-root-cell on x86 platform
MIME-Version: 1.0
Content-Type: multipart/mixed; 
	boundary="----=_Part_21515_166493007.1717731867389"
X-Original-Sender: xhzsddx@gmail.com
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

------=_Part_21515_166493007.1717731867389
Content-Type: multipart/alternative; 
	boundary="----=_Part_21516_565276039.1717731867389"

------=_Part_21516_565276039.1717731867389
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hello everyone:
I run jailhouse on my lenovo laptop,and I make bzImage and rootfs.cpio by=
=20
buildroot,when i use
sudo jailhouse enable jailhouse/configs/x86/lenovo.cell
sudo jailhouse cell linux jailhouse/configs/x86/lenovo-demo.cell=20
~/x86jailhouse/lenovo/bzImage -i ~/x86jailhouse/lenovo/rootfs.cpio -c "cons=
ole=3Djailhouse=20
earlycon=3Djailhouse 8250.nr_uarts=3D0 clk_ignore_unused ip=3D192.168.3.2=
=20
root=3D/dev/sdb1 rootfstype=3Dext4 fsck.repair=3Dyes loglevel=3D7 acpi=3Dfo=
rce -k 10"



to boot my non-root-cell linux it stuck in "Run /init as init process"
What wrong with my configuration=EF=BC=9F
I really need your help.

--=20
You received this message because you are subscribed to the Google Groups "=
Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/=
jailhouse-dev/c8eb0631-0d7b-49a8-8d01-6180cf5f732an%40googlegroups.com.

------=_Part_21516_565276039.1717731867389
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div>Hello everyone:</div>I run jailhouse on my lenovo laptop,and I make bz=
Image and rootfs.cpio by buildroot,when i use<br /><div style=3D"color: rgb=
(204, 204, 204); background-color: rgb(31, 31, 31); font-family: Consolas, =
&quot;Courier New&quot;, monospace; line-height: 19px; white-space: pre;"><=
div><span style=3D"color: rgb(220, 220, 170);">sudo</span> <span style=3D"c=
olor: rgb(206, 145, 120);">jailhouse</span> <span style=3D"color: rgb(206, =
145, 120);">enable</span> <span style=3D"color: rgb(206, 145, 120);">jailho=
use/configs/x86/lenovo.cell</span></div><div><span style=3D"color: rgb(220,=
 220, 170);">sudo</span> <span style=3D"color: rgb(206, 145, 120);">jailhou=
se</span> <span style=3D"color: rgb(206, 145, 120);">cell</span> <span styl=
e=3D"color: rgb(206, 145, 120);">linux</span> <span style=3D"color: rgb(206=
, 145, 120);">jailhouse/configs/x86/lenovo-demo.cell</span> <span style=3D"=
color: rgb(206, 145, 120);">~/x86jailhouse/lenovo/bzImage</span> <span styl=
e=3D"color: rgb(86, 156, 214);">-i</span> <span style=3D"color: rgb(206, 14=
5, 120);">~/x86jailhouse/lenovo/rootfs.cpio</span> <span style=3D"color: rg=
b(86, 156, 214);">-c</span> <span style=3D"color: rgb(206, 145, 120);">"con=
sole=3Djailhouse earlycon=3Djailhouse 8250.nr_uarts=3D0 clk_ignore_unused i=
p=3D192.168.3.2 root=3D/dev/sdb1 rootfstype=3Dext4 fsck.repair=3Dyes loglev=
el=3D7 acpi=3Dforce -k 10"</span></div><br /><br /></div><div><br /></div><=
div>to boot my non-root-cell linux it stuck in "Run /init as init process"<=
/div><div>What wrong with my=C2=A0configuration=EF=BC=9F</div><div>I really=
 need your help.</div>

<p></p>

-- <br />
You received this message because you are subscribed to the Google Groups &=
quot;Jailhouse&quot; group.<br />
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to <a href=3D"mailto:jailhouse-dev+unsubscribe@googlegroups.com">jailh=
ouse-dev+unsubscribe@googlegroups.com</a>.<br />
To view this discussion on the web visit <a href=3D"https://groups.google.c=
om/d/msgid/jailhouse-dev/c8eb0631-0d7b-49a8-8d01-6180cf5f732an%40googlegrou=
ps.com?utm_medium=3Demail&utm_source=3Dfooter">https://groups.google.com/d/=
msgid/jailhouse-dev/c8eb0631-0d7b-49a8-8d01-6180cf5f732an%40googlegroups.co=
m</a>.<br />

------=_Part_21516_565276039.1717731867389--

------=_Part_21515_166493007.1717731867389
Content-Type: text/plain; charset=US-ASCII; name=jail.log
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename=jail.log
X-Attachment-Id: 2171e4a3-6ea8-4958-afc5-501829348682
Content-ID: <2171e4a3-6ea8-4958-afc5-501829348682>

r direct mapping
[    0.021884] RAMDISK: [mem 0x03c69000-0x05f4ffff]
[    0.022566] Zone ranges:
[    0.022776]   DMA      [mem 0x0000000000001000-0x0000000000ffffff]
[    0.023288]   DMA32    [mem 0x0000000001000000-0x00000000159fffff]
[    0.023798]   Normal   empty
[    0.024037] Movable zone start for each node
[    0.024388] Early memory node ranges
[    0.024682]   node   0: [mem 0x0000000000001000-0x000000000009ffff]
[    0.025200]   node   0: [mem 0x0000000000200000-0x00000000159fffff]
[    0.025717] Initmem setup node 0 [mem 0x0000000000001000-0x00000000159fffff]
[    0.026302] On node 0, zone DMA: 1 pages in unavailable ranges
[    0.026349] On node 0, zone DMA: 352 pages in unavailable ranges
[    0.027477] On node 0, zone DMA32: 9728 pages in unavailable ranges
[    0.027480] Setting APIC routing to physical x2apic.
[    0.029468] IOAPIC[0]: apic_id 0, version 32, address 0xfec00000, GSI 0-119
[    0.030044] TSC deadline timer available
[    0.030367] smpboot: Allowing 2 CPUs, 0 hotplug CPUs
[    0.030785] [mem 0x15a00000-0xffffffff] available for PCI devices
[    0.031287] Booting paravirtualized kernel on bare hardware
[    0.031746] clocksource: refined-jiffies: mask: 0xffffffff max_cycles: 0xffffffff, max_idle_ns: 7645519600211568 ns
[    0.056890] setup_percpu: NR_CPUS:96 nr_cpumask_bits:96 nr_cpu_ids:2 nr_node_ids:1
[    0.057707] percpu: Embedded 52 pages/cpu s173912 r8192 d30888 u1048576
[    0.058259] pcpu-alloc: s173912 r8192 d30888 u1048576 alloc=1*2097152
[    0.058792] pcpu-alloc: [0] 0 1 
[    0.059081] Built 1 zonelists, mobility grouping on.  Total pages: 86857
[    0.059636] Kernel command line: console=jailhouse earlycon=jailhouse 8250.nr_uarts=0 clk_ignore_unused ip=192.168.3.2 root=/dev/sdb1 rootfstype=ext4 fsck.repair=yes loglevel=7 acpi=on
[    0.061283] Dentry cache hash table entries: 65536 (order: 7, 524288 bytes, linear)
[    0.061936] Inode-cache hash table entries: 32768 (order: 6, 262144 bytes, linear)
[    0.062615] mem auto-init: stack:off, heap alloc:off, heap free:off
<missed 2378 bytes of console log>
pendent on hypervisor status
[    0.099062] Freeing SMP alternatives memory: 16K
[    0.099062] smpboot: Estimated ratio of average max frequency by base frequency (times 1024): 1269
[    0.099062] smpboot: CPU0: Intel(R) Core(TM) i5-7300HQ CPU @ 2.50GHz (family: 0x6, model: 0x9e, stepping: 0x9)
[    0.099062] Performance Events: PEBS fmt3+, Skylake events, 32-deep LBR, full-width counters, Intel PMU driver.
[    0.099062] ... version:                4
[    0.099062] ... bit width:              48
[    0.099062] ... generic registers:      8
[    0.099062] ... value mask:             0000ffffffffffff
[    0.099062] ... max period:             00007fffffffffff
[    0.099062] ... fixed-purpose events:   3
[    0.099068] ... event mask:             00000007000000ff
[    0.099755] rcu: Hierarchical SRCU implementation.
[    0.100726] smp: Bringing up secondary CPUs ...
[    0.101348] x86: Booting SMP configuration:
CPU 3 received SIPI, vector 9a
[    0.101693] .... node  #0, CPUs:      #1
[    0.102561] smp: Brought up 1 node, 2 CPUs
[    0.103080] smpboot: Max logical packages: 1
[    0.103432] smpboot: Total of 2 processors activated (9983.99 BogoMIPS)
[    0.104650] devtmpfs: initialized
[    0.104650] clocksource: jiffies: mask: 0xffffffff max_cycles: 0xffffffff, max_idle_ns: 7645041785100000 ns
[    0.104650] futex hash table entries: 512 (order: 3, 32768 bytes, linear)
[    0.107117] NET: Registered PF_NETLINK/PF_ROUTE protocol family
[    0.107779] audit: initializing netlink subsys (disabled)
[    0.108278] audit: type=2000 audit(0.012:1): state=initialized audit_enabled=0 res=1
[    0.108417] thermal_sys: Registered thermal governor 'step_wise'
[    0.108419] thermal_sys: Registered thermal governor 'user_space'
[    0.108462] cpuidle: using governor ladder
[    0.108462] cpuidle: using governor menu
[    0.108876] PCI: Using configuration type 1 for base access
[    0.111072] PCI: MMCONFIG for domain 0000 [bus 00-ff] at [mem 0xe0000000-0xefffffff] (base 0xe0000000)
[    0.115046] Kprobes globally optimized
[    0.183065] raid6: avx2x4   gen() 11635 MB/s
[    0.251068] raid6: avx2x4   xor()  8612 MB/s
[    0.319087] raid6: avx2x2   gen() 15904 MB/s
[    0.387065] raid6: avx2x2   xor()  8887 MB/s
[    0.455067] raid6: avx2x1   gen() 11830 MB/s
[    0.523065] raid6: avx2x1   xor()  6399 MB/s
[    0.591066] raid6: sse2x4   gen()  7180 MB/s
[    0.659065] raid6: sse2x4   xor()  4230 MB/s
[    0.727065] raid6: sse2x2   gen()  7323 MB/s
[    0.795067] raid6: sse2x2   xor()  4142 MB/s
[    0.863066] raid6: sse2x1   gen()  6229 MB/s
[    0.931094] raid6: sse2x1   xor()  3178 MB/s
[    0.931451] raid6: using algorithm avx2x2 gen() 15904 MB/s
[    0.931904] raid6: .... xor() 8887 MB/s, rmw enabled
[    0.932313] raid6: using avx2x2 recovery algorithm
[    0.932759] ACPI: Interpreter disabled.
[    0.933097] iommu: Default domain type: Translated 
[    0.933499] iommu: DMA domain TLB invalidation policy: lazy mode 
[    0.934025] vgaarb: loaded
[    0.934025] SCSI subsystem initialized
[    0.934025] libata version 3.00 loaded.
[    0.934025] usbcore: registered new interface driver usbfs
[    0.934025] usbcore: registered new interface driver hub
[    0.934025] usbcore: registered new device driver usb
[    0.934025] pps_core: LinuxPPS API ver. 1 registered
[    0.934025] pps_core: Software ver. 5.3.6 - Copyright 2005-2007 Rodolfo Giometti <giometti@linux.it>
[    0.935069] PTP clock support registered
[    0.935658] PCI: Probing PCI hardware
[    0.935961] PCI: root bus 00: using default resources
[    0.936379] PCI: Probing PCI hardware (bus 00)
[    0.936783] PCI host bridge to bus 0000:00
[    0.937122] pci_bus 0000:00: root bus resource [io  0x0000-0xffff]
[    0.937634] pci_bus 0000:00: root bus resource [mem 0x00000000-0x7fffffffff]
[    0.938217] pci_bus 0000:00: No busn resource found for root bus, will use [bus 00-ff]
[    0.939303] pci_bus 0000:00: busn_res: [bus 00-ff] end is updated to 00
[    1.031515] PCI: pci_cache_line_size set to 64 bytes
[    1.031933] e820: reserve RAM buffer [mem 0x00002000-0x0000ffff]
[    1.032431] e820: reserve RAM buffer [mem 0x15a00000-0x17ffffff]
[    1.035537] clocksource: Switched to clocksource tsc-early
<missed 38 bytes of console log>
6.6.0
[    1.067484] VFS: Dquot-cache hash table entries: 512 (order 0, 4096 bytes)
[    1.068092] pnp: PnP ACPI: disabled
[    1.075524] clocksource: acpi_pm: mask: 0xffffff max_cycles: 0xffffff, max_idle_ns: 2085701024 ns
[    1.076332] NET: Registered PF_INET protocol family
[    1.076780] IP idents hash table entries: 8192 (order: 4, 65536 bytes, linear)
[    1.077677] tcp_listen_portaddr_hash hash table entries: 256 (order: 0, 4096 bytes, linear)
[    1.078374] Table-perturb hash table entries: 65536 (order: 6, 262144 bytes, linear)
[    1.079015] TCP established hash table entries: 4096 (order: 3, 32768 bytes, linear)
[    1.079683] TCP bind hash table entries: 4096 (order: 4, 65536 bytes, linear)
[    1.080309] TCP: Hash tables configured (established 4096 bind 4096)
[    1.080855] UDP hash table entries: 256 (order: 1, 8192 bytes, linear)
[    1.081402] UDP-Lite hash table entries: 256 (order: 1, 8192 bytes, linear)
[    1.082035] NET: Registered PF_UNIX/PF_LOCAL protocol family
[    1.082690] RPC: Registered named UNIX socket transport module.
[    1.083189] RPC: Registered udp transport module.
[    1.083577] RPC: Registered tcp transport module.
[    1.083967] RPC: Registered tcp NFSv4.1 backchannel transport module.
[    1.084503] pci_bus 0000:00: resource 4 [io  0x0000-0xffff]
[    1.084966] pci_bus 0000:00: resource 5 [mem 0x00000000-0x7fffffffff]
[    1.085499] PCI: CLS 0 bytes, default 64
[    1.086014] RAPL PMU: API unit is 2^-32 Joules, 4 fixed counters, 655360 ms ovfl timer
[    1.086101] Trying to unpack rootfs image as initramfs...
[    1.086671] RAPL PMU: hw unit of domain pp0-core 2^-14 Joules
[    1.087609] RAPL PMU: hw unit of domain package 2^-14 Joules
[    1.088082] RAPL PMU: hw unit of domain dram 2^-14 Joules
[    1.088530] RAPL PMU: hw unit of domain pp1-gpu 2^-14 Joules
[    1.089008] clocksource: tsc: mask: 0xffffffffffffffff max_cycles: 0x23fa763a3d1, max_idle_ns: 440795313647 ns
[    1.095085] clocksource: Switched to clocksource tsc
[    1.132511] Freeing initrd memory: 35740K
<missed 676 bytes of console log>
<missed 3 bytes of console log>
<missed 1 bytes of console log>
1.435025] Block layer SCSI generic (bsg) driver version 0.4 loaded (major 251)
[    1.435644] io scheduler mq-deadline registered
[    1.436018] io scheduler kyber registered
[    1.454343] Linux agpgart interface v0.103
[    1.454708] AMD-Vi: AMD IOMMUv2 functionality not available on this system - This is not a bug.
[    1.458754] brd: module loaded
[    1.459416] usbcore: registered new interface driver asix
[    1.459874] usbcore: registered new interface driver ax88179_178a
[    1.460387] usbcore: registered new interface driver cdc_ether
[    1.460878] usbcore: registered new interface driver cdc_eem
[    1.461354] usbcore: registered new interface driver dm9601
[    1.461825] usbcore: registered new interface driver sr9700
[    1.462298] usbcore: registered new interface driver CoreChips
[    1.462794] usbcore: registered new interface driver smsc75xx
[    1.463292] usbcore: registered new interface driver smsc95xx
[    1.463778] usbcore: registered new interface driver gl620a
[    1.464247] usbcore: registered new interface driver net1080
[    1.464723] usbcore: registered new interface driver plusb
[    1.465186] usbcore: registered new interface driver rndis_host
[    1.465683] usbcore: registered new interface driver cdc_subset
[    1.466181] usbcore: registered new interface driver zaurus
[    1.466652] usbcore: registered new interface driver MOSCHIP usb-ethernet driver
[    1.467287] usbcore: registered new interface driver cdc_ncm
[    1.467764] usbcore: registered new interface driver huawei_cdc_ncm
[    1.468291] usbcore: registered new interface driver cdc_mbim
[    1.468775] usbcore: registered new interface driver r8153_ecm
[    1.469309] usbcore: registered new interface driver cdc_wdm
[    1.469792] usbcore: registered new interface driver usb-storage
[    1.470379] mousedev: PS/2 mouse device common for all mice
[    1.470901] intel_pstate: HWP enabled by BIOS
[    1.471271] intel_pstate: Intel P-state driver initializing
[    1.471856] intel_pstate: Disabling energy efficiency optimization
[    1.472365] intel_pstate: HWP enabled
[    1.472693] sdhci: Secure Digital Host Controller Interface driver
[    1.473201] sdhci: Copyright(c) Pierre Ossman
[    1.473640] printk: console [jailhouse0] enabled
[    1.474022] printk: bootconsole [jailhouse0] disabled
[    1.473640] printk: console [jailhouse0] enabled
[    1.474022] printk: bootconsole [jailhouse0] disabled
[    1.474585] 9pnet: Installing 9P2000 support
[    1.474602] Key type dns_resolver registered
[    1.474738] IPI shorthand broadcast: enabled
[    1.474759] sched_clock: Marking stable (1376202495, 95062918)->(1518403804, -47138391)
[    1.474863] printk: console [jailhouse0]: printing thread started
[    1.474898] registered taskstats version 1
[    1.474900] Loading compiled-in X.509 certificates
[    1.475213] Btrfs loaded, crc32c=crc32c-generic, zoned=no, fsverity=no
[   13.755116] clk: Not disabling unused clocks
[   13.755140] Warning: unable to open an initial console.
[   13.755657] Freeing unused kernel image (initmem) memory: 1300K
[   13.771096] Write protecting the kernel read-only data: 16384k
[   13.772326] Freeing unused kernel image (text/rodata gap) memory: 2036K
[   13.772936] Freeing unused kernel image (rodata/data gap) memory: 1240K
[   13.773012] rodata_test: all tests were successful
[   13.773020] Run /init as init process
[   28.879599] NET: Registered PF_INET6 protocol family
[   28.879983] Segment Routing with IPv6
[   28.879995] In-situ OAM (IOAM) with IPv6
[   28.931575] cfg80211: Loading compiled-in X.509 certificates for regulatory database
[   28.938745] cfg80211: Loaded X.509 cert 'sforshee: 00b28ddf47aef9cea7'

------=_Part_21515_166493007.1717731867389
Content-Type: text/plain; charset=US-ASCII; name=lenovo-demo.c
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename=lenovo-demo.c
X-Attachment-Id: 3d55940f-dfe5-4608-9952-2e03c404ba57
Content-ID: <3d55940f-dfe5-4608-9952-2e03c404ba57>

 
#include <jailhouse/types.h>
#include <jailhouse/cell-config.h>
 
struct {
	struct jailhouse_cell_desc cell;
	__u64 cpus[1];
	struct jailhouse_memory mem_regions[3];
	struct jailhouse_irqchip irqchips[1];
	struct jailhouse_pio pio_regions[4];
	// struct jailhouse_pci_device pci_devices[2];
} __attribute__((packed)) config = {
	.cell = {
		.signature = JAILHOUSE_CELL_DESC_SIGNATURE,
		.revision = JAILHOUSE_CONFIG_REVISION,
		.architecture = JAILHOUSE_X86,
		.name = "linux-lenovo",
		// .flags = JAILHOUSE_CELL_PASSIVE_COMMREG |
		// 	JAILHOUSE_CELL_VIRTUAL_CONSOLE_PERMITTED |
		// 	JAILHOUSE_SYS_VIRTUAL_DEBUG_CONSOLE , 
		// 	//  JAILHOUSE_CELL_VIRTUAL_CONSOLE_ACTIVE,
		.flags = JAILHOUSE_CELL_PASSIVE_COMMREG |
			 JAILHOUSE_CELL_VIRTUAL_CONSOLE_ACTIVE,
		.cpu_set_size = sizeof(config.cpus),
		.num_memory_regions = ARRAY_SIZE(config.mem_regions),
		.num_irqchips = ARRAY_SIZE(config.irqchips),
		.num_pio_regions = ARRAY_SIZE(config.pio_regions),
		// .num_pci_devices = ARRAY_SIZE(config.pci_devices),
	},
 
	.cpus = {
		0b1100,//1 CPU ,
	},
 
	.mem_regions = {
		// JAILHOUSE_SHMEM_NET_REGIONS(0x44000000, 1),
		/* low RAM */ {
			.phys_start = 0x3a600000,
			.virt_start = 0,
			.size = 0x00100000,
			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
				JAILHOUSE_MEM_EXECUTE | JAILHOUSE_MEM_DMA |
				JAILHOUSE_MEM_LOADABLE,
		},
		/* communication region */ {
			.virt_start = 0x00100000,
			// .size = 0x00001000,
			.size = 0x00100000,
			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE | 			      		
				JAILHOUSE_MEM_COMM_REGION | JAILHOUSE_MEM_DMA ,
		},
		/* high RAM */ {
			.phys_start = 0x3a800000,
			// .virt_start = 0x20000000,
			.virt_start = 0x00200000,
			.size = 0x15800000,
			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
				JAILHOUSE_MEM_EXECUTE | JAILHOUSE_MEM_DMA |
				JAILHOUSE_MEM_LOADABLE,
		},
	},
 
	.irqchips = {
		/* IOAPIC */ 
		{
			.address = 0xfec00000,
			.id = 0x1f0f8,
			.pin_bitmap = {
				(1 << 3) | (1 << 4) | (1 << 11) | (1 << 19), //0
				0,
				0,
				(1 << (127-96)), //0,
			},
		},
	},

	.pio_regions = {
		// /* Port I/O: 3000-30ff : 0000:04:00.0 */
		// PIO_RANGE(0x3000, 0x100),
		// PIO_RANGE(0x44,0x2),
		PIO_RANGE(0x4e, 0x1),
		PIO_RANGE(0x4f, 0x1),
		PIO_RANGE(0x2e, 0x1),
		PIO_RANGE(0x2f, 0x1),
		
		// PIO_RANGE(0x1800, 0xff),

	},

	// .pci_devices = {
	// 	// /* IVSHMEM: 00:05.0*/
	// 	// {
	// 	// 	.type = JAILHOUSE_PCI_TYPE_IVSHMEM,
	// 	// 	.domain = 0x0,
	// 	// 	.bdf = 0x28,
	// 	// 	.bar_mask = JAILHOUSE_IVSHMEM_BAR_MASK_MSIX,
	// 	// 	.num_msix_vectors = 2,
	// 	// 	.shmem_regions_start = 0,
	// 	// 	.shmem_dev_id = 1, 
	// 	// 	.shmem_peers = 2,
	// 	// 	.shmem_protocol = JAILHOUSE_SHMEM_PROTO_VETH,
	// 	// },
	// },
};

------=_Part_21515_166493007.1717731867389
Content-Type: text/plain; charset=US-ASCII; name=lenovo.c
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename=lenovo.c
X-Attachment-Id: 89e2ddc2-215e-4939-b5f3-fbbbe251910d
Content-ID: <89e2ddc2-215e-4939-b5f3-fbbbe251910d>

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
 * Configuration for LENOVO 80WW
 * created with '/usr/local/libexec/jailhouse/jailhouse config create lenovo.c'
 *
 * NOTE: This config expects the following to be appended to your kernel cmdline
 *       "memmap=0x1ec00000$0x3a000000"
 */

#include <jailhouse/types.h>
#include <jailhouse/cell-config.h>

struct {
	struct jailhouse_system header;
	__u64 cpus[1];
	struct jailhouse_memory mem_regions[55];
	struct jailhouse_irqchip irqchips[1];
	struct jailhouse_pio pio_regions[14];
	struct jailhouse_pci_device pci_devices[21];
	struct jailhouse_pci_capability pci_caps[93];
} __attribute__((packed)) config = {
	.header = {
		.signature = JAILHOUSE_SYSTEM_SIGNATURE,
		.revision = JAILHOUSE_CONFIG_REVISION,
		.flags = JAILHOUSE_SYS_VIRTUAL_DEBUG_CONSOLE,
		.hypervisor_memory = {
			.phys_start = 0x3a000000,
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
			.x86 = {
				.pm_timer_address = 0x1808,
				.vtd_interrupt_limit = 256,
			},
		},
		.root_cell = {
			.name = "Lenovo",
			.cpu_set_size = sizeof(config.cpus),
			.num_memory_regions = ARRAY_SIZE(config.mem_regions),
			.num_irqchips = ARRAY_SIZE(config.irqchips),
			.num_pio_regions = ARRAY_SIZE(config.pio_regions),
			.num_pci_devices = ARRAY_SIZE(config.pci_devices),
			.num_pci_caps = ARRAY_SIZE(config.pci_caps),
		},
	},

	.cpus = {
		0b1111,
	},

	.mem_regions = {
	
		/* MemRegion: 00000000-00057fff : System RAM */
		{
			.phys_start = 0x0,
			.virt_start = 0x0,
			.size = 0x58000,
			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
				JAILHOUSE_MEM_EXECUTE | JAILHOUSE_MEM_DMA,
		},
		/* MemRegion: 00059000-00087fff : System RAM */
		{
			.phys_start = 0x59000,
			.virt_start = 0x59000,
			.size = 0x2f000,
			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
				JAILHOUSE_MEM_EXECUTE | JAILHOUSE_MEM_DMA,
		},
		/* MemRegion: 000a0000-000bffff : PCI Bus 0000:00 */
		{
			.phys_start = 0xa0000,
			.virt_start = 0xa0000,
			.size = 0x20000,
			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE,
		},
		/* MemRegion: 000f0000-000fffff : System ROM */
		{
			.phys_start = 0xf0000,
			.virt_start = 0xf0000,
			.size = 0x10000,
			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE,
		},
		/* MemRegion: 00100000-39ffffff : System RAM */
		{
			.phys_start = 0x100000,
			.virt_start = 0x100000,
			.size = 0x39f00000,
			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
				JAILHOUSE_MEM_EXECUTE | JAILHOUSE_MEM_DMA,
		},
		/* MemRegion: 58c00000-62d3cfff : System RAM */
		{
			.phys_start = 0x58c00000,
			.virt_start = 0x58c00000,
			.size = 0xa13d000,
			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
				JAILHOUSE_MEM_EXECUTE | JAILHOUSE_MEM_DMA,
		},
		/* MemRegion: 62d3d000-62d3dfff : ACPI Non-volatile Storage */
		{
			.phys_start = 0x62d3d000,
			.virt_start = 0x62d3d000,
			.size = 0x1000,
			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE,
		},
		/* MemRegion: 62d3f000-7a48dfff : System RAM */
		{
			.phys_start = 0x62d3f000,
			.virt_start = 0x62d3f000,
			.size = 0x1774f000,
			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
				JAILHOUSE_MEM_EXECUTE | JAILHOUSE_MEM_DMA,
		},
		/* MemRegion: 7ae7e000-7ce7dfff : ACPI Non-volatile Storage */
		{
			.phys_start = 0x7ae7e000,
			.virt_start = 0x7ae7e000,
			.size = 0x2000000,
			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE,
		},
		/* MemRegion: 7ce7e000-7cefdfff : ACPI Tables */
		{
			.phys_start = 0x7ce7e000,
			.virt_start = 0x7ce7e000,
			.size = 0x80000,
			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE,
		},
		/* MemRegion: 7cefe000-7cefefff : System RAM */
		{
			.phys_start = 0x7cefe000,
			.virt_start = 0x7cefe000,
			.size = 0x1000,
			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
				JAILHOUSE_MEM_EXECUTE | JAILHOUSE_MEM_DMA,
		},
		/* MemRegion: 80000000-8001ffff : pnp 00:09 */
		{
			.phys_start = 0x80000000,
			.virt_start = 0x80000000,
			.size = 0x20000,
			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE,
		},
		/* MemRegion: 90000000-9fffffff : 0000:01:00.0 */
		{
			.phys_start = 0x90000000,
			.virt_start = 0x90000000,
			.size = 0x10000000,
			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE,
		},
		/* MemRegion: a0000000-a1ffffff : 0000:01:00.0 */
		{
			.phys_start = 0xa0000000,
			.virt_start = 0xa0000000,
			.size = 0x2000000,
			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE,
		},
		/* MemRegion: a2000000-a2ffffff : 0000:00:02.0 */
		{
			.phys_start = 0xa2000000,
			.virt_start = 0xa2000000,
			.size = 0x1000000,
			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE,
		},
		/* MemRegion: a3000000-a3ffffff : 0000:01:00.0 */
		{
			.phys_start = 0xa3000000,
			.virt_start = 0xa3000000,
			.size = 0x1000000,
			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE,
		},
		/* MemRegion: a4000000-a4002fff : 0000:05:00.0 */
		{
			.phys_start = 0xa4000000,
			.virt_start = 0xa4000000,
			.size = 0x3000,
			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE,
		},
		/* MemRegion: a4101000-a4103fff : 0000:04:00.0 */
		{
			.phys_start = 0xa4101000,
			.virt_start = 0xa4101000,
			.size = 0x3000,
			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE,
		},
		/* MemRegion: a4104000-a4104fff : r8169 */
		{
			.phys_start = 0xa4104000,
			.virt_start = 0xa4104000,
			.size = 0x1000,
			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE,
		},
		/* MemRegion: a4200000-a4201fff : iwlwifi */
		{
			.phys_start = 0xa4200000,
			.virt_start = 0xa4200000,
			.size = 0x2000,
			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE,
		},
		/* MemRegion: a4300000-a43007ff : 0000:02:00.0 */
		{
			.phys_start = 0xa4300000,
			.virt_start = 0xa4300000,
			.size = 0x1000,
			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE,
		},
		/* MemRegion: a4301000-a4301fff : mmc0 */
		{
			.phys_start = 0xa4301000,
			.virt_start = 0xa4301000,
			.size = 0x1000,
			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE,
		},
		/* MemRegion: a4400000-a440ffff : 0000:00:1f.3 */
		{
			.phys_start = 0xa4400000,
			.virt_start = 0xa4400000,
			.size = 0x10000,
			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE,
		},
		/* MemRegion: a4410000-a441ffff : xhci-hcd */
		{
			.phys_start = 0xa4410000,
			.virt_start = 0xa4410000,
			.size = 0x10000,
			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE,
		},
		/* MemRegion: a4420000-a4423fff : ICH HD audio */
		{
			.phys_start = 0xa4420000,
			.virt_start = 0xa4420000,
			.size = 0x4000,
			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE,
		},
		/* MemRegion: a4424000-a4427fff : 0000:00:1f.2 */
		{
			.phys_start = 0xa4424000,
			.virt_start = 0xa4424000,
			.size = 0x4000,
			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE,
		},
		/* MemRegion: a4428000-a4429fff : ahci */
		{
			.phys_start = 0xa4428000,
			.virt_start = 0xa4428000,
			.size = 0x2000,
			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE,
		},
		/* MemRegion: a442a000-a442afff : 0000:00:14.2 */
		{
			.phys_start = 0xa442a000,
			.virt_start = 0xa442a000,
			.size = 0x1000,
			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE,
		},
		/* MemRegion: a442b000-a442bfff : 0000:00:16.0 */
		{
			.phys_start = 0xa442b000,
			.virt_start = 0xa442b000,
			.size = 0x1000,
			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE,
		},
		/* MemRegion: a442c000-a442c7ff : ahci */
		{
			.phys_start = 0xa442c000,
			.virt_start = 0xa442c000,
			.size = 0x1000,
			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE,
		},
		/* MemRegion: a442d000-a442d0ff : 0000:00:1f.4 */
		{
			.phys_start = 0xa442d000,
			.virt_start = 0xa442d000,
			.size = 0x1000,
			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE,
		},
		/* MemRegion: a442e000-a442e0ff : ahci */
		{
			.phys_start = 0xa442e000,
			.virt_start = 0xa442e000,
			.size = 0x1000,
			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE,
		},
		/* MemRegion: b0000000-b07e8fff : efifb */
		{
			.phys_start = 0xb0000000,
			.virt_start = 0xb0000000,
			.size = 0x7e9000,
			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE,
		},
		/* MemRegion: fd000000-fdabffff : pnp 00:00 */
		{
			.phys_start = 0xfd000000,
			.virt_start = 0xfd000000,
			.size = 0xac0000,
			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE,
		},
		/* MemRegion: fdac0000-fdacffff : INT345D:00 */
		{
			.phys_start = 0xfdac0000,
			.virt_start = 0xfdac0000,
			.size = 0x10000,
			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE,
		},
		/* MemRegion: fdad0000-fdadffff : pnp 00:00 */
		{
			.phys_start = 0xfdad0000,
			.virt_start = 0xfdad0000,
			.size = 0x10000,
			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE,
		},
		/* MemRegion: fdae0000-fdaeffff : INT345D:00 */
		{
			.phys_start = 0xfdae0000,
			.virt_start = 0xfdae0000,
			.size = 0x10000,
			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE,
		},
		/* MemRegion: fdaf0000-fdafffff : INT345D:00 */
		{
			.phys_start = 0xfdaf0000,
			.virt_start = 0xfdaf0000,
			.size = 0x10000,
			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE,
		},
		/* MemRegion: fdc6000c-fdc6000f : iTCO_wdt */
		{
			.phys_start = 0xfdc6000c,
			.virt_start = 0xfdc6000c,
			.size = 0x1000,
			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE,
		},
		/* MemRegion: fe000000-fe01ffff : pnp 00:00 */
		{
			.phys_start = 0xfe000000,
			.virt_start = 0xfe000000,
			.size = 0x20000,
			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE,
		},
		/* MemRegion: fe036000-fe03bfff : pnp 00:00 */
		{
			.phys_start = 0xfe036000,
			.virt_start = 0xfe036000,
			.size = 0x6000,
			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE,
		},
		/* MemRegion: fe03d000-fe3fffff : pnp 00:00 */
		{
			.phys_start = 0xfe03d000,
			.virt_start = 0xfe03d000,
			.size = 0x3c3000,
			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE,
		},
		/* MemRegion: fe410000-fe7fffff : pnp 00:00 */
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
		/* MemRegion: fed10000-fed17fff : pnp 00:09 */
		{
			.phys_start = 0xfed10000,
			.virt_start = 0xfed10000,
			.size = 0x8000,
			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE,
		},
		/* MemRegion: fed18000-fed18fff : pnp 00:09 */
		{
			.phys_start = 0xfed18000,
			.virt_start = 0xfed18000,
			.size = 0x1000,
			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE,
		},
		/* MemRegion: fed19000-fed19fff : pnp 00:09 */
		{
			.phys_start = 0xfed19000,
			.virt_start = 0xfed19000,
			.size = 0x1000,
			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE,
		},
		/* MemRegion: fed20000-fed3ffff : pnp 00:09 */
		{
			.phys_start = 0xfed20000,
			.virt_start = 0xfed20000,
			.size = 0x20000,
			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE,
		},
		/* MemRegion: fed40000-fed40fff : MSFT0101:00 */
		{
			.phys_start = 0xfed40000,
			.virt_start = 0xfed40000,
			.size = 0x1000,
			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE,
		},
		/* MemRegion: 100000000-27fffffff : System RAM */
		{
			.phys_start = 0x100000000,
			.virt_start = 0x100000000,
			.size = 0x180000000,
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
		/* MemRegion: 7ad72000-7ad91fff : ACPI DMAR RMRR */
		/* PCI device: 00:14.0 */
		{
			.phys_start = 0x7ad72000,
			.virt_start = 0x7ad72000,
			.size = 0x20000,
			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
				JAILHOUSE_MEM_EXECUTE | JAILHOUSE_MEM_DMA,
		},
		/* MemRegion: 7d800000-7fffffff : ACPI DMAR RMRR */
		/* PCI device: 00:02.0 */
		{
			.phys_start = 0x7d800000,
			.virt_start = 0x7d800000,
			.size = 0x2800000,
			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
				JAILHOUSE_MEM_EXECUTE | JAILHOUSE_MEM_DMA,
		},
		/* MemRegion: 3a60 0000-58c0 0000 : JAILHOUSE Inmate Memory */
		{
			.phys_start = 0x3a600000,
			.virt_start = 0x3a600000,
			// .size = 0x4c00000,
            // .size=0x1e600000,
            .size=0x15a00000,

			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
                JAILHOUSE_MEM_EXECUTE | JAILHOUSE_MEM_DMA,
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

		PIO_RANGE(0x61, 0x1),
		/* Port I/O: 0062-0062 : EC data */
		/* PIO_RANGE(0x62, 0x1), */
		/* Port I/O: 0064-0064 : keyboard */
		PIO_RANGE(0x64, 0x1),
		/* Port I/O: 0066-0066 : EC cmd */
		/* PIO_RANGE(0x66, 0x1), */

		PIO_RANGE(0x70, 0x1),//
		PIO_RANGE(0x71, 0x1),//
		PIO_RANGE(0x1800, 0x2),//

		/* Port I/O: 0080-008f : dma page reg */
		/* PIO_RANGE(0x80, 0x10), */
		/* Port I/O: 00a0-00a1 : pic2 */
		/* PIO_RANGE(0xa0, 0x2), */
		/* Port I/O: 00c0-00df : dma2 */
		/* PIO_RANGE(0xc0, 0x20), */
		/* Port I/O: 00f0-00f0 : PNP0C04:00 */
		/* PIO_RANGE(0xf0, 0x1), */
		/* Port I/O: 0400-041f : iTCO_wdt */
		/* PIO_RANGE(0x400, 0x20), */
		/* Port I/O: 0680-069f : pnp 00:02 */
		/* PIO_RANGE(0x680, 0x20), */
		/* Port I/O: 0800-087f : pnp 00:03 */
		/* PIO_RANGE(0x800, 0x80), */
		/* Port I/O: 3000-30ff : 0000:04:00.0 */
		PIO_RANGE(0x3000, 0x100),
		/* Port I/O: 4000-407f : 0000:01:00.0 */
		PIO_RANGE(0x4000, 0x80),
		/* Port I/O: 5000-503f : 0000:00:02.0 */
		PIO_RANGE(0x5000, 0x40),
		/* Port I/O: 5040-505f : 0000:00:1f.4 */
		PIO_RANGE(0x5040, 0x20),
		/* Port I/O: 5060-507f : 0000:00:17.0 */
		PIO_RANGE(0x5060, 0x20),
		/* Port I/O: 5080-5087 : 0000:00:17.0 */
		PIO_RANGE(0x5080, 0x8),
		/* Port I/O: 5088-508b : 0000:00:17.0 */
		PIO_RANGE(0x5088, 0x4),
        
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
		/* PCIDevice: 00:01.0 */
		{
			.type = JAILHOUSE_PCI_TYPE_BRIDGE,
			.iommu = 1,
			.domain = 0x0,
			.bdf = 0x8,
			.bar_mask = {
				0x00000000, 0x00000000, 0x00000000,
				0x00000000, 0x00000000, 0x00000000,
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
			.caps_start = 8,
			.num_caps = 7,
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
			.caps_start = 15,
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
			.caps_start = 17,
			.num_caps = 2,
			.num_msi_vectors = 1,
			.msi_64bits = 0,
			.msi_maskable = 0,
			.num_msix_vectors = 0,
			.msix_region_size = 0x0,
			.msix_address = 0x0,
		},
		/* PCIDevice: 00:16.0 */
		{
			.type = JAILHOUSE_PCI_TYPE_DEVICE,
			.iommu = 1,
			.domain = 0x0,
			.bdf = 0xb0,
			.bar_mask = {
				0xfffff000, 0xffffffff, 0x00000000,
				0x00000000, 0x00000000, 0x00000000,
			},
			.caps_start = 19,
			.num_caps = 2,
			.num_msi_vectors = 1,
			.msi_64bits = 1,
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
			.caps_start = 21,
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
			.caps_start = 24,
			.num_caps = 8,
			.num_msi_vectors = 1,
			.msi_64bits = 0,
			.msi_maskable = 0,
			.num_msix_vectors = 0,
			.msix_region_size = 0x0,
			.msix_address = 0x0,
		},
		/* PCIDevice: 00:1c.2 */
		{
			.type = JAILHOUSE_PCI_TYPE_BRIDGE,
			.iommu = 1,
			.domain = 0x0,
			.bdf = 0xe2,
			.bar_mask = {
				0x00000000, 0x00000000, 0x00000000,
				0x00000000, 0x00000000, 0x00000000,
			},
			.caps_start = 32,
			.num_caps = 8,
			.num_msi_vectors = 1,
			.msi_64bits = 0,
			.msi_maskable = 0,
			.num_msix_vectors = 0,
			.msix_region_size = 0x0,
			.msix_address = 0x0,
		},
		/* PCIDevice: 00:1c.3 */
		{
			.type = JAILHOUSE_PCI_TYPE_BRIDGE,
			.iommu = 1,
			.domain = 0x0,
			.bdf = 0xe3,
			.bar_mask = {
				0x00000000, 0x00000000, 0x00000000,
				0x00000000, 0x00000000, 0x00000000,
			},
			.caps_start = 40,
			.num_caps = 7,
			.num_msi_vectors = 1,
			.msi_64bits = 0,
			.msi_maskable = 0,
			.num_msix_vectors = 0,
			.msix_region_size = 0x0,
			.msix_address = 0x0,
		},
		/* PCIDevice: 00:1d.0 */
		{
			.type = JAILHOUSE_PCI_TYPE_BRIDGE,
			.iommu = 1,
			.domain = 0x0,
			.bdf = 0xe8,
			.bar_mask = {
				0x00000000, 0x00000000, 0x00000000,
				0x00000000, 0x00000000, 0x00000000,
			},
			.caps_start = 24,
			.num_caps = 8,
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
			.caps_start = 47,
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
		/* PCIDevice: 01:00.0 */
		{
			.type = JAILHOUSE_PCI_TYPE_DEVICE,
			.iommu = 1,
			.domain = 0x0,
			.bdf = 0x100,
			.bar_mask = {
				0xff000000, 0xf0000000, 0xffffffff,
				0xfe000000, 0xffffffff, 0xffffff80,
			},
			.caps_start = 49,
			.num_caps = 10,
			.num_msi_vectors = 1,
			.msi_64bits = 1,
			.msi_maskable = 0,
			.num_msix_vectors = 0,
			.msix_region_size = 0x0,
			.msix_address = 0x0,
		},
		/* PCIDevice: 02:00.0 */
		{
			.type = JAILHOUSE_PCI_TYPE_DEVICE,
			.iommu = 1,
			.domain = 0x0,
			.bdf = 0x200,
			.bar_mask = {
				0xfffff000, 0xfffff800, 0x00000000,
				0x00000000, 0x00000000, 0x00000000,
			},
			.caps_start = 59,
			.num_caps = 7,
			.num_msi_vectors = 1,
			.msi_64bits = 1,
			.msi_maskable = 1,
			.num_msix_vectors = 0,
			.msix_region_size = 0x0,
			.msix_address = 0x0,
		},
		/* PCIDevice: 03:00.0 */
		{
			.type = JAILHOUSE_PCI_TYPE_DEVICE,
			.iommu = 1,
			.domain = 0x0,
			.bdf = 0x300,
			.bar_mask = {
				0xffffe000, 0xffffffff, 0x00000000,
				0x00000000, 0x00000000, 0x00000000,
			},
			.caps_start = 66,
			.num_caps = 7,
			.num_msi_vectors = 1,
			.msi_64bits = 1,
			.msi_maskable = 0,
			.num_msix_vectors = 0,
			.msix_region_size = 0x0,
			.msix_address = 0x0,
		},
		/* PCIDevice: 04:00.0 */
		{
			.type = JAILHOUSE_PCI_TYPE_DEVICE,
			.iommu = 1,
			.domain = 0x0,
			.bdf = 0x400,
			.bar_mask = {
				0xffffff00, 0x00000000, 0xfffff000,
				0xffffffff, 0xffffc000, 0xffffffff,
			},
			.caps_start = 73,
			.num_caps = 10,
			.num_msi_vectors = 1,
			.msi_64bits = 1,
			.msi_maskable = 0,
			.num_msix_vectors = 4,
			.msix_region_size = 0x1000,
			.msix_address = 0xa4100000,
		},
		/* PCIDevice: 05:00.0 */
		{
			.type = JAILHOUSE_PCI_TYPE_DEVICE,
			.iommu = 1,
			.domain = 0x0,
			.bdf = 0x500,
			.bar_mask = {
				0xffffc000, 0xffffffff, 0x00000000,
				0x00000000, 0x00000000, 0x00000000,
			},
			.caps_start = 83,
			.num_caps = 10,
			.num_msi_vectors = 32,
			.msi_64bits = 1,
			.msi_maskable = 0,
			.num_msix_vectors = 33,
			.msix_region_size = 0x1000,
			.msix_address = 0xa4003000,
		},

		// /* IVSHMEM: 00:10.0 */
		// {
		// 	.type = JAILHOUSE_PCI_TYPE_IVSHMEM,
		// 	.iommu = 1,
		// 	.domain = 0x0,
		// 	.bdf = 0x10 << 3,
		// 	.bar_mask = JAILHOUSE_IVSHMEM_BAR_MASK_MSIX,
		// 	.num_msix_vectors = 16,
		// 	.shmem_regions_start = 0,
		// 	.shmem_dev_id = 0,
		// 	.shmem_peers = 3,
		// 	.shmem_protocol = JAILHOUSE_SHMEM_PROTO_UNDEFINED,
		// },
		/* IVSHMEM: 00:11.0 */
		// {
		// 	.type = JAILHOUSE_PCI_TYPE_IVSHMEM,
		// 	.iommu = 1,
		// 	.domain = 0x0,
		// 	.bdf = 0x11 << 3,
		// 	.bar_mask = JAILHOUSE_IVSHMEM_BAR_MASK_MSIX,
		// 	.num_msix_vectors = 3,
		// 	.shmem_regions_start = 5,
		// 	.shmem_dev_id = 0,
		// 	.shmem_peers = 2,
		// 	.shmem_protocol = JAILHOUSE_SHMEM_PROTO_VETH,
		// },

	},

	.pci_caps = {
		/* PCIDevice: 00:00.0 */
		{
			.id = PCI_CAP_ID_VNDR,
			.start = 0xe0,
			.len = 0x2,
			.flags = 0,
		},
		/* PCIDevice: 00:01.0 */
		{
			.id = PCI_CAP_ID_SSVID,
			.start = 0x88,
			.len = 0x2,
			.flags = 0,
		},
		{
			.id = PCI_CAP_ID_PM,
			.start = 0x80,
			.len = 0x8,
			.flags = JAILHOUSE_PCICAPS_WRITE,
		},
		{
			.id = PCI_CAP_ID_MSI,
			.start = 0x90,
			.len = 0xa,
			.flags = JAILHOUSE_PCICAPS_WRITE,
		},
		{
			.id = PCI_CAP_ID_EXP,
			.start = 0xa0,
			.len = 0x3c,
			.flags = 0,
		},
		{
			.id = PCI_EXT_CAP_ID_VC | JAILHOUSE_PCI_EXT_CAP,
			.start = 0x100,
			.len = 0x10,
			.flags = 0,
		},
		{
			.id = PCI_EXT_CAP_ID_RCLD | JAILHOUSE_PCI_EXT_CAP,
			.start = 0x140,
			.len = 0x4,
			.flags = 0,
		},
		{
			.id = PCI_EXT_CAP_ID_SECPCI | JAILHOUSE_PCI_EXT_CAP,
			.start = 0xd94,
			.len = 0x10,
			.flags = 0,
		},
		/* PCIDevice: 00:02.0 */
		{
			.id = PCI_CAP_ID_VNDR,
			.start = 0x40,
			.len = 0x2,
			.flags = 0,
		},
		{
			.id = PCI_CAP_ID_EXP,
			.start = 0x70,
			.len = 0x3c,
			.flags = 0,
		},
		{
			.id = PCI_CAP_ID_MSI,
			.start = 0xac,
			.len = 0xa,
			.flags = JAILHOUSE_PCICAPS_WRITE,
		},
		{
			.id = PCI_CAP_ID_PM,
			.start = 0xd0,
			.len = 0x8,
			.flags = JAILHOUSE_PCICAPS_WRITE,
		},
		{
			.id = PCI_EXT_CAP_ID_PASID | JAILHOUSE_PCI_EXT_CAP,
			.start = 0x100,
			.len = 0x8,
			.flags = 0,
		},
		{
			.id = PCI_EXT_CAP_ID_ATS | JAILHOUSE_PCI_EXT_CAP,
			.start = 0x200,
			.len = 0x4,
			.flags = 0,
		},
		{
			.id = PCI_EXT_CAP_ID_PRI | JAILHOUSE_PCI_EXT_CAP,
			.start = 0x300,
			.len = 0x4,
			.flags = 0,
		},
		/* PCIDevice: 00:14.0 */
		{
			.id = PCI_CAP_ID_PM,
			.start = 0x70,
			.len = 0x8,
			.flags = JAILHOUSE_PCICAPS_WRITE,
		},
		{
			.id = PCI_CAP_ID_MSI,
			.start = 0x80,
			.len = 0xe,
			.flags = JAILHOUSE_PCICAPS_WRITE,
		},
		/* PCIDevice: 00:14.2 */
		{
			.id = PCI_CAP_ID_PM,
			.start = 0x50,
			.len = 0x8,
			.flags = JAILHOUSE_PCICAPS_WRITE,
		},
		{
			.id = PCI_CAP_ID_MSI,
			.start = 0x80,
			.len = 0xa,
			.flags = JAILHOUSE_PCICAPS_WRITE,
		},
		/* PCIDevice: 00:16.0 */
		{
			.id = PCI_CAP_ID_PM,
			.start = 0x50,
			.len = 0x8,
			.flags = JAILHOUSE_PCICAPS_WRITE,
		},
		{
			.id = PCI_CAP_ID_MSI,
			.start = 0x8c,
			.len = 0xe,
			.flags = JAILHOUSE_PCICAPS_WRITE,
		},
		/* PCIDevice: 00:17.0 */
		{
			.id = PCI_CAP_ID_MSI,
			.start = 0x80,
			.len = 0xa,
			.flags = JAILHOUSE_PCICAPS_WRITE,
		},
		{
			.id = PCI_CAP_ID_PM,
			.start = 0x70,
			.len = 0x8,
			.flags = JAILHOUSE_PCICAPS_WRITE,
		},
		{
			.id = PCI_CAP_ID_SATA,
			.start = 0xa8,
			.len = 0x2,
			.flags = 0,
		},
		/* PCIDevice: 00:1c.0 */
		/* PCIDevice: 00:1d.0 */
		{
			.id = PCI_CAP_ID_EXP,
			.start = 0x40,
			.len = 0x3c,
			.flags = 0,
		},
		{
			.id = PCI_CAP_ID_MSI,
			.start = 0x80,
			.len = 0xa,
			.flags = JAILHOUSE_PCICAPS_WRITE,
		},
		{
			.id = PCI_CAP_ID_SSVID,
			.start = 0x90,
			.len = 0x2,
			.flags = 0,
		},
		{
			.id = PCI_CAP_ID_PM,
			.start = 0xa0,
			.len = 0x8,
			.flags = JAILHOUSE_PCICAPS_WRITE,
		},
		{
			.id = PCI_EXT_CAP_ID_ERR | JAILHOUSE_PCI_EXT_CAP,
			.start = 0x100,
			.len = 0x40,
			.flags = 0,
		},
		{
			.id = PCI_EXT_CAP_ID_ACS | JAILHOUSE_PCI_EXT_CAP,
			.start = 0x140,
			.len = 0x8,
			.flags = 0,
		},
		{
			.id = PCI_EXT_CAP_ID_L1SS | JAILHOUSE_PCI_EXT_CAP,
			.start = 0x200,
			.len = 0x4,
			.flags = 0,
		},
		{
			.id = PCI_EXT_CAP_ID_SECPCI | JAILHOUSE_PCI_EXT_CAP,
			.start = 0x220,
			.len = 0x10,
			.flags = 0,
		},
		/* PCIDevice: 00:1c.2 */
		{
			.id = PCI_CAP_ID_EXP,
			.start = 0x40,
			.len = 0x3c,
			.flags = 0,
		},
		{
			.id = PCI_CAP_ID_MSI,
			.start = 0x80,
			.len = 0xa,
			.flags = JAILHOUSE_PCICAPS_WRITE,
		},
		{
			.id = PCI_CAP_ID_SSVID,
			.start = 0x90,
			.len = 0x2,
			.flags = 0,
		},
		{
			.id = PCI_CAP_ID_PM,
			.start = 0xa0,
			.len = 0x8,
			.flags = JAILHOUSE_PCICAPS_WRITE,
		},
		{
			.id = 0x0 | JAILHOUSE_PCI_EXT_CAP,
			.start = 0x100,
			.len = 0x4,
			.flags = 0,
		},
		{
			.id = PCI_EXT_CAP_ID_ACS | JAILHOUSE_PCI_EXT_CAP,
			.start = 0x140,
			.len = 0x8,
			.flags = 0,
		},
		{
			.id = PCI_EXT_CAP_ID_L1SS | JAILHOUSE_PCI_EXT_CAP,
			.start = 0x200,
			.len = 0x4,
			.flags = 0,
		},
		{
			.id = PCI_EXT_CAP_ID_SECPCI | JAILHOUSE_PCI_EXT_CAP,
			.start = 0x220,
			.len = 0x10,
			.flags = 0,
		},
		/* PCIDevice: 00:1c.3 */
		{
			.id = PCI_CAP_ID_EXP,
			.start = 0x40,
			.len = 0x3c,
			.flags = 0,
		},
		{
			.id = PCI_CAP_ID_MSI,
			.start = 0x80,
			.len = 0xa,
			.flags = JAILHOUSE_PCICAPS_WRITE,
		},
		{
			.id = PCI_CAP_ID_SSVID,
			.start = 0x90,
			.len = 0x2,
			.flags = 0,
		},
		{
			.id = PCI_CAP_ID_PM,
			.start = 0xa0,
			.len = 0x8,
			.flags = JAILHOUSE_PCICAPS_WRITE,
		},
		{
			.id = 0x0 | JAILHOUSE_PCI_EXT_CAP,
			.start = 0x100,
			.len = 0x4,
			.flags = 0,
		},
		{
			.id = PCI_EXT_CAP_ID_ACS | JAILHOUSE_PCI_EXT_CAP,
			.start = 0x140,
			.len = 0x8,
			.flags = 0,
		},
		{
			.id = PCI_EXT_CAP_ID_SECPCI | JAILHOUSE_PCI_EXT_CAP,
			.start = 0x220,
			.len = 0x10,
			.flags = 0,
		},
		/* PCIDevice: 00:1f.3 */
		{
			.id = PCI_CAP_ID_PM,
			.start = 0x50,
			.len = 0x8,
			.flags = JAILHOUSE_PCICAPS_WRITE,
		},
		{
			.id = PCI_CAP_ID_MSI,
			.start = 0x60,
			.len = 0xe,
			.flags = JAILHOUSE_PCICAPS_WRITE,
		},
		/* PCIDevice: 01:00.0 */
		{
			.id = PCI_CAP_ID_PM,
			.start = 0x60,
			.len = 0x8,
			.flags = JAILHOUSE_PCICAPS_WRITE,
		},
		{
			.id = PCI_CAP_ID_MSI,
			.start = 0x68,
			.len = 0xe,
			.flags = JAILHOUSE_PCICAPS_WRITE,
		},
		{
			.id = PCI_CAP_ID_EXP,
			.start = 0x78,
			.len = 0x3c,
			.flags = 0,
		},
		{
			.id = PCI_EXT_CAP_ID_VC | JAILHOUSE_PCI_EXT_CAP,
			.start = 0x100,
			.len = 0x10,
			.flags = 0,
		},
		{
			.id = PCI_EXT_CAP_ID_LTR | JAILHOUSE_PCI_EXT_CAP,
			.start = 0x250,
			.len = 0x8,
			.flags = 0,
		},
		{
			.id = PCI_EXT_CAP_ID_L1SS | JAILHOUSE_PCI_EXT_CAP,
			.start = 0x258,
			.len = 0x4,
			.flags = 0,
		},
		{
			.id = PCI_EXT_CAP_ID_PWR | JAILHOUSE_PCI_EXT_CAP,
			.start = 0x128,
			.len = 0x10,
			.flags = 0,
		},
		{
			.id = PCI_EXT_CAP_ID_ERR | JAILHOUSE_PCI_EXT_CAP,
			.start = 0x420,
			.len = 0x40,
			.flags = 0,
		},
		{
			.id = PCI_EXT_CAP_ID_VNDR | JAILHOUSE_PCI_EXT_CAP,
			.start = 0x600,
			.len = 0x28,
			.flags = 0,
		},
		{
			.id = PCI_EXT_CAP_ID_SECPCI | JAILHOUSE_PCI_EXT_CAP,
			.start = 0x900,
			.len = 0x10,
			.flags = 0,
		},
		/* PCIDevice: 02:00.0 */
		{
			.id = PCI_CAP_ID_PM,
			.start = 0x6c,
			.len = 0x8,
			.flags = JAILHOUSE_PCICAPS_WRITE,
		},
		{
			.id = PCI_CAP_ID_MSI,
			.start = 0x48,
			.len = 0x18,
			.flags = JAILHOUSE_PCICAPS_WRITE,
		},
		{
			.id = PCI_CAP_ID_EXP,
			.start = 0x80,
			.len = 0x3c,
			.flags = 0,
		},
		{
			.id = PCI_EXT_CAP_ID_VC | JAILHOUSE_PCI_EXT_CAP,
			.start = 0x100,
			.len = 0x10,
			.flags = 0,
		},
		{
			.id = PCI_EXT_CAP_ID_ERR | JAILHOUSE_PCI_EXT_CAP,
			.start = 0x200,
			.len = 0x40,
			.flags = 0,
		},
		{
			.id = PCI_EXT_CAP_ID_LTR | JAILHOUSE_PCI_EXT_CAP,
			.start = 0x230,
			.len = 0x8,
			.flags = 0,
		},
		{
			.id = PCI_EXT_CAP_ID_L1SS | JAILHOUSE_PCI_EXT_CAP,
			.start = 0x240,
			.len = 0x4,
			.flags = 0,
		},
		/* PCIDevice: 03:00.0 */
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
			.start = 0x40,
			.len = 0x3c,
			.flags = 0,
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
		{
			.id = PCI_EXT_CAP_ID_LTR | JAILHOUSE_PCI_EXT_CAP,
			.start = 0x14c,
			.len = 0x8,
			.flags = 0,
		},
		{
			.id = PCI_EXT_CAP_ID_L1SS | JAILHOUSE_PCI_EXT_CAP,
			.start = 0x154,
			.len = 0x4,
			.flags = 0,
		},
		/* PCIDevice: 04:00.0 */
		{
			.id = PCI_CAP_ID_PM,
			.start = 0x40,
			.len = 0x8,
			.flags = JAILHOUSE_PCICAPS_WRITE,
		},
		{
			.id = PCI_CAP_ID_MSI,
			.start = 0x50,
			.len = 0xe,
			.flags = JAILHOUSE_PCICAPS_WRITE,
		},
		{
			.id = PCI_CAP_ID_EXP,
			.start = 0x70,
			.len = 0x3c,
			.flags = 0,
		},
		{
			.id = PCI_CAP_ID_MSIX,
			.start = 0xb0,
			.len = 0xc,
			.flags = JAILHOUSE_PCICAPS_WRITE,
		},
		{
			.id = PCI_CAP_ID_VPD,
			.start = 0xd0,
			.len = 0x2,
			.flags = 0,
		},
		{
			.id = PCI_EXT_CAP_ID_ERR | JAILHOUSE_PCI_EXT_CAP,
			.start = 0x100,
			.len = 0x40,
			.flags = 0,
		},
		{
			.id = PCI_EXT_CAP_ID_VC | JAILHOUSE_PCI_EXT_CAP,
			.start = 0x140,
			.len = 0x10,
			.flags = 0,
		},
		{
			.id = PCI_EXT_CAP_ID_DSN | JAILHOUSE_PCI_EXT_CAP,
			.start = 0x160,
			.len = 0xc,
			.flags = 0,
		},
		{
			.id = PCI_EXT_CAP_ID_LTR | JAILHOUSE_PCI_EXT_CAP,
			.start = 0x170,
			.len = 0x8,
			.flags = 0,
		},
		{
			.id = PCI_EXT_CAP_ID_L1SS | JAILHOUSE_PCI_EXT_CAP,
			.start = 0x178,
			.len = 0x4,
			.flags = 0,
		},
		/* PCIDevice: 05:00.0 */
		{
			.id = PCI_CAP_ID_PM,
			.start = 0x40,
			.len = 0x8,
			.flags = JAILHOUSE_PCICAPS_WRITE,
		},
		{
			.id = PCI_CAP_ID_MSI,
			.start = 0x50,
			.len = 0xe,
			.flags = JAILHOUSE_PCICAPS_WRITE,
		},
		{
			.id = PCI_CAP_ID_EXP,
			.start = 0x70,
			.len = 0x3c,
			.flags = 0,
		},
		{
			.id = PCI_CAP_ID_MSIX,
			.start = 0xb0,
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
			.start = 0x148,
			.len = 0xc,
			.flags = 0,
		},
		{
			.id = PCI_EXT_CAP_ID_PWR | JAILHOUSE_PCI_EXT_CAP,
			.start = 0x158,
			.len = 0x10,
			.flags = 0,
		},
		{
			.id = PCI_EXT_CAP_ID_SECPCI | JAILHOUSE_PCI_EXT_CAP,
			.start = 0x168,
			.len = 0x10,
			.flags = 0,
		},
		{
			.id = PCI_EXT_CAP_ID_LTR | JAILHOUSE_PCI_EXT_CAP,
			.start = 0x188,
			.len = 0x8,
			.flags = 0,
		},
		{
			.id = PCI_EXT_CAP_ID_L1SS | JAILHOUSE_PCI_EXT_CAP,
			.start = 0x190,
			.len = 0x4,
			.flags = 0,
		},
	},
};

------=_Part_21515_166493007.1717731867389
Content-Type: text/plain; charset=US-ASCII; name=iomem.txt
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename=iomem.txt
X-Attachment-Id: e425b787-2792-4b2b-8e98-7aa0e8efda00
Content-ID: <e425b787-2792-4b2b-8e98-7aa0e8efda00>

00000000-00000fff : Reserved
00001000-00057fff : System RAM
00058000-00058fff : Reserved
00059000-00087fff : System RAM
00088000-000fffff : Reserved
  000a0000-000bffff : PCI Bus 0000:00
  000c0000-000cffff : Video ROM
  000d0000-000d0fff : Adapter ROM
  000f0000-000fffff : System ROM
00100000-39ffffff : System RAM
  03000000-03a02a87 : Kernel code
  03c00000-03ec9fff : Kernel rodata
  04000000-04208a3f : Kernel data
  045dc000-047fffff : Kernel bss
3a000000-58bfffff : Reserved
  3a000000-3a5fffff : Jailhouse hypervisor
58c00000-609a5017 : System RAM
609a5018-609b3057 : System RAM
609b3058-609b4017 : System RAM
609b4018-609c4057 : System RAM
609c4058-609c5017 : System RAM
609c5018-609ee057 : System RAM
609ee058-62d3cfff : System RAM
62d3d000-62d3dfff : ACPI Non-volatile Storage
62d3e000-62d3efff : Reserved
62d3f000-7a48dfff : System RAM
7a48e000-7ae7dfff : Reserved
7ae7e000-7ce7dfff : ACPI Non-volatile Storage
7ce7e000-7cefdfff : ACPI Tables
7cefe000-7cefefff : System RAM
7ceff000-7fffffff : Reserved
80000000-dfffffff : PCI Bus 0000:00
  80000000-8001ffff : pnp 00:09
  90000000-a1ffffff : PCI Bus 0000:01
    90000000-9fffffff : 0000:01:00.0
    a0000000-a1ffffff : 0000:01:00.0
  a2000000-a2ffffff : 0000:00:02.0
  a3000000-a3ffffff : PCI Bus 0000:01
    a3000000-a3ffffff : 0000:01:00.0
  a4000000-a40fffff : PCI Bus 0000:05
    a4000000-a4003fff : 0000:05:00.0
  a4100000-a41fffff : PCI Bus 0000:04
    a4100000-a4103fff : 0000:04:00.0
    a4104000-a4104fff : 0000:04:00.0
      a4104000-a4104fff : r8169
  a4200000-a42fffff : PCI Bus 0000:03
    a4200000-a4201fff : 0000:03:00.0
      a4200000-a4201fff : iwlwifi
  a4300000-a43fffff : PCI Bus 0000:02
    a4300000-a43007ff : 0000:02:00.0
    a4301000-a4301fff : 0000:02:00.0
      a4301000-a4301fff : mmc0
  a4400000-a440ffff : 0000:00:1f.3
  a4410000-a441ffff : 0000:00:14.0
    a4410000-a441ffff : xhci-hcd
  a4420000-a4423fff : 0000:00:1f.3
    a4420000-a4423fff : ICH HD audio
  a4424000-a4427fff : 0000:00:1f.2
  a4428000-a4429fff : 0000:00:17.0
    a4428000-a4429fff : ahci
  a442a000-a442afff : 0000:00:14.2
  a442b000-a442bfff : 0000:00:16.0
  a442c000-a442c7ff : 0000:00:17.0
    a442c000-a442c7ff : ahci
  a442d000-a442d0ff : 0000:00:1f.4
  a442e000-a442e0ff : 0000:00:17.0
    a442e000-a442e0ff : ahci
  b0000000-bfffffff : 0000:00:02.0
    b0000000-b07e8fff : efifb
e0000000-efffffff : PCI MMCONFIG 0000 [bus 00-ff]
  e0000000-efffffff : Reserved
    e0000000-efffffff : pnp 00:09
fd000000-fe7fffff : Reserved
  fd000000-fe7fffff : PCI Bus 0000:00
    fd000000-fdabffff : pnp 00:00
    fdac0000-fdacffff : INT345D:00
    fdad0000-fdadffff : pnp 00:00
    fdae0000-fdaeffff : INT345D:00
    fdaf0000-fdafffff : INT345D:00
    fdb00000-fdffffff : pnp 00:00
      fdc6000c-fdc6000f : iTCO_wdt
    fe000000-fe01ffff : pnp 00:00
    fe036000-fe03bfff : pnp 00:00
    fe03d000-fe3fffff : pnp 00:00
    fe410000-fe7fffff : pnp 00:00
fec00000-fec00fff : Reserved
  fec00000-fec003ff : IOAPIC 0
fed00000-fed00fff : Reserved
  fed00000-fed003ff : HPET 0
    fed00000-fed003ff : PNP0103:00
fed10000-fed19fff : Reserved
  fed10000-fed17fff : pnp 00:09
  fed18000-fed18fff : pnp 00:09
  fed19000-fed19fff : pnp 00:09
fed20000-fed3ffff : pnp 00:09
fed40000-fed40fff : MSFT0101:00
fed84000-fed84fff : Reserved
fed90000-fed90fff : dmar0
fed91000-fed91fff : dmar1
fee00000-fee00fff : Local APIC
  fee00000-fee00fff : Reserved
ff000000-ffffffff : INT0800:00
  ffa00000-ffffffff : Reserved
100000000-27effffff : System RAM
27f000000-27fffffff : RAM buffer

------=_Part_21515_166493007.1717731867389--
