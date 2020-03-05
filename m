Return-Path: <jailhouse-dev+bncBCJI7SMNV4NBBBVKQPZQKGQEKNOW57Y@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-wm1-x33e.google.com (mail-wm1-x33e.google.com [IPv6:2a00:1450:4864:20::33e])
	by mail.lfdr.de (Postfix) with ESMTPS id B0A6717A322
	for <lists+jailhouse-dev@lfdr.de>; Thu,  5 Mar 2020 11:31:34 +0100 (CET)
Received: by mail-wm1-x33e.google.com with SMTP id g26sf1393510wmk.6
        for <lists+jailhouse-dev@lfdr.de>; Thu, 05 Mar 2020 02:31:34 -0800 (PST)
ARC-Seal: i=2; a=rsa-sha256; t=1583404294; cv=pass;
        d=google.com; s=arc-20160816;
        b=ozvkGwvCKgFZQmqh2eW42p3WrxlViZHTQ04Oal5yQgUaLjCThb8J4Vf4RW0QIKXCOM
         jYxEdRBWQ3yT+wZYaKWHbwiHC8T1jl6KfKhb0rM14vYCJA4X74D5sQ2PnwfqHNKV2sgU
         tWCucYynLjfJW1gK6wEAXEU3Ap+FQWNOR/IrQaUEPM+X1HAz5waUyioCPY/nLWPnInwt
         B7FWzy1bi1rfVQ+DVQCxkOZxrX2KS7Rxpm4Ub0vEYqBVyrqzyT1Xh7Y5C/5ss4/JiPam
         ortqqFjucxYjOpIi2U2mNa0q368SEk05yGJT+xwhrex3yM2Gmh+svXb8gMmEP0hxmAOD
         Ho4g==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:content-language:in-reply-to
         :mime-version:user-agent:date:message-id:from:references:cc:to
         :subject:sender:dkim-signature;
        bh=6wxZnzZ9b0iZdV6zh+MKA/InbCrv7AnHBvOSlnVcKZ0=;
        b=f83KmmKGpXq45cKqhBliGqbZB7AYDJZBsyON+7soaW6X/y89vJ/2+4YhZKHACH2Vsn
         DlRqKpMTasNW73Qthbx6PcbfPM8CoIT7Kt2NCiGFDkQcj9aN0WJ0iBfRKxerP+ZmkK7f
         LUcxdR7eAENDMULSBerzjKPRAFv065J/sm0lY3HkSrVCqXeJcxFjGBm4B65uF5UfHVHi
         tI+9PTpKS6f74clR5tXsxCXBFRfx2SN2449IEoJRiW1PF7htbtrwYgB6EDW7CBIQ1CFw
         w/QKq6Iw27ALFYt+G/ibpTSgpVv7itenfiWTigGmVlzbIhyHPafyDL6OYShk7nxVyI18
         yfdg==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.2 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :list-post:list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=6wxZnzZ9b0iZdV6zh+MKA/InbCrv7AnHBvOSlnVcKZ0=;
        b=sb32zzTY1U/FnZbn6Y/DsNTQCGMr2ZctG7O8eTWMooBrLMpXnEZ2676041FtCApV1h
         tc78Y5JeUqVLY6m/YRRaF9RXnhhqsY/SjYViERnFaqFQmhVqMiReuq6VSO+ITii+XYj+
         vhpPnj38VaMR7B64G2rbLIipYg7GhXjrv+jFim8G1U1NYGkFtdiSPxLvu5b1e9ithj/0
         +Tb8Zlu+ZCWIh+3VS6SfXm0LInai70kp6L/6hEa2hUbHbKFrGcj+ElRQWyE5sDFZzdCZ
         eRKFGaLNAlbDoKSGTvVk7Ko68TZIgo+DdEahj9NTlrqDuvlSR0tIXL0Wjy8z02jhBSSn
         /UfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:subject:to:cc:references:from:message-id
         :date:user-agent:mime-version:in-reply-to:content-language
         :x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:x-spam-checked-in-group:list-post:list-help
         :list-archive:list-subscribe:list-unsubscribe;
        bh=6wxZnzZ9b0iZdV6zh+MKA/InbCrv7AnHBvOSlnVcKZ0=;
        b=ofaDswufaQCYtupNczgPl+uIWPi5AKAVbgpAExOKe7nj3Bl7QED9/K87nk9ClksSIe
         DaDNUHYWpRksqIOjfJ4W7kcTLFEiToVDdP9w6C3TlkD5DEev9l886peE56yfoE/t7/yY
         FBmzsNKPWUsqgqQBcJarFDnpYJLsS7BxDai/jthISe/j1nROFaZJ6iqmec/taGco5QUY
         gBumGF/6IFevdfeM3uB1ha3YSeNPMen4vzNEsDgWy13q8InoWbX0ZkmxUMmBC54gVa7j
         Ovas0PJRv46TOwA1I5jNeTBr0KuG21hbcf25HBaFR1LXitHAayCPgkSAqpHle5E8vPFZ
         I1CQ==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: ANhLgQ3iyPNKsMM2U4oJcAzrXTA4pIbMqBmZoht7HUQGICAq+jHlKnFi
	oHaKPPcsRfnKNFEHcaLekL0=
X-Google-Smtp-Source: ADFU+vs61CTC7/TfX2VER2ejbeolShjZw6aqACAghbbU/sbRYVUVZIw45oDPl6S4DSHe5RYu0E3/fw==
X-Received: by 2002:adf:ce8c:: with SMTP id r12mr9602859wrn.189.1583404294395;
        Thu, 05 Mar 2020 02:31:34 -0800 (PST)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a1c:a98b:: with SMTP id s133ls744781wme.3.gmail; Thu, 05 Mar
 2020 02:31:33 -0800 (PST)
X-Received: by 2002:a05:600c:21da:: with SMTP id x26mr9260164wmj.66.1583404293555;
        Thu, 05 Mar 2020 02:31:33 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1583404293; cv=none;
        d=google.com; s=arc-20160816;
        b=f7nGWlDYI8P0BAYstWsbLYkIr/NNShHXwpkyGjJvF1dX92jHcZgHM/8X2dT5q3vdZ0
         RyZy6Mf4RPdWmOm7ffoSl9HaFkKKZnjMq1YVsw6UIOg4V0aw6znRxuLfbi/oUDaqQ3+/
         YfTeQvoQrjWosh/sgBbNVXaEd0zhzYUohj20Zbr28qq0wbn8qNYgbO+YEfunNkRTpAfx
         p8QBfVoAUlPwAOyoiKkllw8nva1BDkGWSZC7StT/wHOZV+SuaJ1wUO1nurA94q4hniN6
         O0o/OZtSFK1V7VVJNeSD2YTYdvg+3fodd3HwMCI73FBP0Rylvu8DRkK7oaTaQUQhXsXm
         v5OQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:cc:to:subject;
        bh=2a9FMCCZbSu4Vc+8pLguSN3rclQBFR3qCT94jdvWqeo=;
        b=Jl4YeY6ritdQW9fRIdVohIx6a238tyX0AJraF8BOK7rAz9JeFGGTFg3lq0jeXs5AUc
         RJ97/tNCl5mNdroPliaORId2ioUICFDwXsYpSyC2bhzMugYxB0hp2pivbWrpHgXheUpA
         XcXn7zwEWoSd1o7vGKSha7NCiFFRwfWzx65LtCYXsKQjTjPkwXhdy9nv8akhu1S1y6Yx
         6wjrzHoPcNqA0ijTTYc7teUKV+tHoTLtGniLxn0NGVuv4suMSQH2oSIo8L0NX12KTdsp
         6z+MRKTweamSXEJ7e1nSwURoBgPGrgPZNNnDqJri6jMNFTq3U7TqyzEOd5e2UAnQqC2U
         R1uA==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.2 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
Received: from thoth.sbs.de (thoth.sbs.de. [192.35.17.2])
        by gmr-mx.google.com with ESMTPS id m2si345179wmi.3.2020.03.05.02.31.33
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 05 Mar 2020 02:31:33 -0800 (PST)
Received-SPF: pass (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.2 as permitted sender) client-ip=192.35.17.2;
Received: from mail1.sbs.de (mail1.sbs.de [192.129.41.35])
	by thoth.sbs.de (8.15.2/8.15.2) with ESMTPS id 025AVXCu015425
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 5 Mar 2020 11:31:33 +0100
Received: from [167.87.9.24] ([167.87.9.24])
	by mail1.sbs.de (8.15.2/8.15.2) with ESMTP id 025AVVRt014949;
	Thu, 5 Mar 2020 11:31:32 +0100
Subject: Re: [PATCH 0/2] boot jailhouse before root cell linux
To: peng.fan@nxp.com, jailhouse-dev@googlegroups.com
Cc: alice.guo@nxp.com, Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>
References: <20200305093950.848-1-peng.fan@nxp.com>
From: Jan Kiszka <jan.kiszka@siemens.com>
Message-ID: <a4bd0ce8-988c-c294-1d22-7809236baed5@siemens.com>
Date: Thu, 5 Mar 2020 11:31:31 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <20200305093950.848-1-peng.fan@nxp.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Language: en-US
X-Original-Sender: jan.kiszka@siemens.com
X-Original-Authentication-Results: gmr-mx.google.com;       spf=pass
 (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.2 as
 permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;       dmarc=pass
 (p=NONE sp=NONE dis=NONE) header.from=siemens.com
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

On 05.03.20 10:39, peng.fan@nxp.com wrote:
> From: Peng Fan <peng.fan@nxp.com>
> 
> This patchset tested on i.MX8MN arm64 with quad A53 cores
> 
> Patch 1 is to align jailhouse_system. Since the loader not have
> MMU enabled, unaligned access will cause abort.
> 
> Patch 2 is not that well orgnized. It does GICv3 initialization,
> SMP boot up. Then kick inmate cell and root cell.
> Some code are hardcoding for now.
> 
> The boot log as below, you could see root linux and gic demo both running:
> root cell not able to manage inmate cell for now. But I think it
> could be supported. intercell communication not aded currently.
> 
>  From test log, linux root cell boot will cause large latency for gic-demo
> jitter.
> 
> It maybe good to use cache color on ARMv8, but still have issues
> for root cell DMA without SMMU.
> 
> ## Loading kernel from FIT Image at 60000000 ...
>     Using 'config@1' configuration
>     Trying 'kernel' kernel subimage
>       Description:  linux
>       Type:         Kernel Image
>       Compression:  uncompressed
>       Data Start:   0x60000650
>       Data Size:    6072 Bytes = 5.9 KiB
>       Architecture: AArch64
>       OS:           Linux
>       Load Address: 0x40000000
>       Entry Point:  0x40000000
>     Verifying Hash Integrity ... OK
> ## Loading fdt from FIT Image at 60000000 ...
>     Using 'config@1' configuration
>     Trying 'fdt' fdt subimage
>       Description:  fdt
>       Type:         Flat Device Tree
>       Compression:  uncompressed
>       Data Start:   0x61a90f90
>       Data Size:    39890 Bytes = 39 KiB
>       Architecture: AArch64
>       Load Address: 0x43000000
>     Verifying Hash Integrity ... OK
>     Loading fdt from 0x61a90f90 to 0x43000000
>     Booting using the fdt blob at 0x43000000
> ## Loading loadables from FIT Image at 60000000 ...
>     Trying 'hypervisor' loadables subimage
>       Description:  Jailhouse hypervisor
>       Type:         Standalone Program
>       Compression:  uncompressed
>       Data Start:   0x60001e08
>       Data Size:    104456 Bytes = 102 KiB
>       Architecture: AArch64
>       Load Address: 0x40200000
>       Entry Point:  unavailable
>     Verifying Hash Integrity ... OK
>     Loading loadables from 0x60001e08 to 0x40200000
> ## Loading loadables from FIT Image at 60000000 ...
>     Trying 'cell@0' loadables subimage
>       Description:  i.MX8MN cell
>       Type:         Standalone Program
>       Compression:  uncompressed
>       Data Start:   0x6001b610
>       Data Size:    1218 Bytes = 1.2 KiB
>       Architecture: AArch64
>       Load Address: 0x40300000
>       Entry Point:  unavailable
>     Verifying Hash Integrity ... OK
>     Loading loadables from 0x6001b610 to 0x40300000
> ## Loading loadables from FIT Image at 60000000 ...
>     Trying 'inmate@0' loadables subimage
>       Description:  ROOT CELL image
>       Type:         Standalone Program
>       Compression:  uncompressed
>       Data Start:   0x6001bad4
>       Data Size:    27720192 Bytes = 26.4 MiB
>       Architecture: AArch64
>       Load Address: 0x40480000
>       Entry Point:  unavailable
>     Verifying Hash Integrity ... OK
>     Loading loadables from 0x6001bad4 to 0x40480000
> ## Loading loadables from FIT Image at 60000000 ...
>     Trying 'cell@1' loadables subimage
>       Description:  i.MX8MN GIC-CELL
>       Type:         Standalone Program
>       Compression:  uncompressed
>       Data Start:   0x61a8b4d4
>       Data Size:    236 Bytes = 236 Bytes
>       Architecture: AArch64
>       Load Address: 0x40310000
>       Entry Point:  unavailable
>     Verifying Hash Integrity ... OK
>     Loading loadables from 0x61a8b4d4 to 0x40310000
> ## Loading loadables from FIT Image at 60000000 ...
>     Trying 'inmate@1' loadables subimage
>       Description:  i.MX8MN GIC-DEMO
>       Type:         Standalone Program
>       Compression:  uncompressed
>       Data Start:   0x61a8b5c0
>       Data Size:    22992 Bytes = 22.5 KiB
>       Architecture: AArch64
>       Load Address: 0xb3c00000
>       Entry Point:  unavailable
>     Verifying Hash Integrity ... OK
>     Loading loadables from 0x61a8b5c0 to 0xb3c00000
>     Loading Kernel Image ... OK
>     Using Device Tree in place at 0000000043000000, end 000000004300cbd1
> 
> Starting kernel ...
> 
> 
> Initializing Jailhouse hypervisor v0.12 (20-g40c6fd8f) on CPU 1
> Code location: 0x0000ffffc0200800
> Page pool usage after early setup: mem 39/993, remap 0/131072
> Initializing processors:
>   CPU 1... OK
>   CPU 0... OK
>   CPU 3... OK
>   CPU 2... OK
> Initializing unit: irqchip
> Initializing unit: ARM SMMU v3
> Initializing unit: PVU IOMMU
> Initializing unit: PCI
> Adding virtual PCI device 00:00.0 to cell "imx8mm"
> Adding virtual PCI device 00:01.0 to cell "imx8mm"
> Page pool usage after late setup: mem 60/993, remap 144/131072
> Activating hypervisor
> Created cell "gic-demo"
> Page pool usage after cell creation: mem 72/993, remap 144/131072
> Cell "gic-demo" can be loaded
> Started cell "gic-demo"
> Initializing the GIC...
> Initializing the timer...
> [    0.000000] Booting Linux on physical CPU 0x0000000000 [0x410fd034]
> [    0.000000] Linux version 5.4.3-00028-g643910d36b96-dirty (Freenix@linux-ljuv) (gcc version 9.2.0 (GCC)) #105 SMP PREEMPT Wed Mar 4 15:21:58 CST 2020
> [    0.000000] Machine model: NXP i.MX8MNano DDR4 EVK board
> [    0.000000] earlycon: ec_imx6q0 at MMIO 0x0000000030890000 (options '115200')
> [    0.000000] printk: bootconsole [ec_imx6q0] enabled
> [    0.000000] efi: Getting EFI parameters from FDT:
> [    0.000000] efi: UEFI not found.
> [    0.000000] Reserved memory: created CMA memory pool at 0x000000006a000000, size 640 MiB
> [    0.000000] OF: reserved mem: initialized node linux,cma, compatible id shared-dma-pool
> Timer fired, jitter:   2999 ns, min:   2999 ns, max:   2999 ns
> [    0.000000] NUMA: No NUMA configuration found
> [    0.000000] NUMA: Faking a node at [mem 0x0000000040000000-0x00000000bdffffff]
> [    0.000000] NUMA: NODE_DATA [mem 0xbdd04500-0xbdd05fff]
> [    0.000000] Zone ranges:
> [    0.000000]   DMA32    [mem 0x0000000040000000-0x00000000bdffffff]
> [    0.000000]   Normal   empty
> [    0.000000] Movable zone start for each node
> [    0.000000] Early memory node ranges
> [    0.000000]   node   0: [mem 0x0000000040000000-0x0000000093bfffff]
> [    0.000000]   node   0: [mem 0x00000000b8000000-0x00000000bb6fffff]
> [    0.000000]   node   0: [mem 0x00000000bbc00000-0x00000000bdffffff]
> [    0.000000] Zeroed struct page in unavailable ranges: 256 pages
> [    0.000000] Initmem setup node 0 [mem 0x0000000040000000-0x00000000bdffffff]
> Timer fired, jitter:   1624 ns, min:   1624 ns, max:   2999 ns
> [    0.000000] psci: probing for conduit method from DT.
> [    0.000000] psci: PSCIv1.1 detected in firmware.
> [    0.000000] psci: Using standard PSCI v0.2 function IDs
> [    0.000000] psci: MIGRATE_INFO_TYPE not supported.
> [    0.000000] psci: SMC Calling Convention v1.1
> [    0.000000] percpu: Embedded 24 pages/cpu s58904 r8192 d31208 u98304
> [    0.000000] Detected VIPT I-cache on CPU0
> [    0.000000] CPU features: detected: ARM erratum 845719
> [    0.000000] CPU features: detected: GIC system register CPU interface
> [    0.000000] Built 1 zonelists, mobility grouping on.  Total pages: 360612
> [    0.000000] Policy zone: DMA32
> [    0.000000] Kernel command line: console=ttymxc1,115200 earlycon=ec_imx6q,0x30890000,115200 root=/dev/mmcblk1p2 rootwait rw
> [    0.000000] Dentry cache hash table entries: 262144 (order: 9, 2097152 bytes, linear)
> [    0.000000] Inode-cache hash table entries: 131072 (order: 8, 1048576 bytes, linear)
> [    0.000000] mem auto-init: stack:off, heap alloc:off, heap free:off
> Timer fired, jitter:   7999 ns, min:   1624 ns, max:   7999 ns
> [    0.000000] Memory: 742552K/1465344K available (16316K kernel code, 1342K rwdata, 6380K rodata, 2944K init, 1015K bss, 67432K reserved, 655360K cma-reserved)
> [    0.000000] SLUB: HWalign=64, Order=0-3, MinObjects=0, CPUs=4, Nodes=1
> [    0.000000] rcu: Preemptible hierarchical RCU implementation.
> [    0.000000] rcu:     RCU restricting CPUs from NR_CPUS=256 to nr_cpu_ids=4.
> [    0.000000]  Tasks RCU enabled.
> [    0.000000] rcu: RCU calculated value of scheduler-enlistment delay is 25 jiffies.
> [    0.000000] rcu: Adjusting geometry for rcu_fanout_leaf=16, nr_cpu_ids=4
> [    0.000000] NR_IRQS: 64, nr_irqs: 64, preallocated irqs: 0
> [    0.000000] GICv3: 128 SPIs implemented
> [    0.000000] GICv3: 0 Extended SPIs implemented
> [    0.000000] GICv3: Distributor has no Range Selector support
> [    0.000000] GICv3: 16 PPIs implemented
> [    0.000000] GICv3: no VLPI support, no direct LPI support
> [    0.000000] GICv3: CPU0: found redistributor 0 region 0:0x0000000038880000
> [    0.000000] ITS: No ITS available, not enabling LPIs
> [    0.000000] random: get_random_bytes called from start_kernel+0x2b8/0x44c with crng_init=0
> [    0.000000] arch_timer: cp15 timer(s) running at 8.00MHz (virt).
> [    0.000000] clocksource: arch_sys_counter: mask: 0xffffffffffffff max_cycles: 0x1d854df40, max_idle_ns: 440795202120 ns
> [    0.000004] sched_clock: 56 bits at 8MHz, resolution 125ns, wraps every 2199023255500ns
> [    0.008448] Console: colour dummy device 80x25
> [    0.012571] Calibrating delay loop (skipped), value calculated using timer frequency.. 16.00 BogoMIPS (lpj=32000)
> [    0.022844] pid_max: default: 32768 minimum: 301
> [    0.027546] LSM: Security Framework initializing
> [    0.032169] Mount-cache hash table entries: 4096 (order: 3, 32768 bytes, linear)
> [    0.039565] Mountpoint-cache hash table entries: 4096 (order: 3, 32768 bytes, linear)
> Timer fired, jitter:   2374 ns, min:   1624 ns, max:   7999 ns
> [    0.071508] ASID allocator initialised with 32768 entries
> [    0.079504] rcu: Hierarchical SRCU implementation.
> [    0.088337] EFI services will not be available.
> [    0.095538] smp: Bringing up secondary CPUs ...
> Timer fired, jitter:    749 ns, min:    749 ns, max:   7999 ns
> [    0.127643] Detected VIPT I-cache on CPU1
> [    0.127671] GICv3: CPU1: found redistributor 1 region 0:0x00000000388a0000
> [    0.127700] CPU1: Booted secondary processor 0x0000000001 [0x410fd034]
> [    0.159684] Detected VIPT I-cache on CPU2
> [    0.159700] GICv3: CPU2: found redistributor 2 region 0:0x00000000388c0000
> [    0.159717] CPU2: Booted secondary processor 0x0000000002 [0x410fd034]
> [    0.191721] psci: failed to boot CPU3 (-1)
> [    0.227974] CPU3: failed to boot: -1
> [    0.231609] smp: Brought up 1 node, 3 CPUs
> [    0.235680] SMP: Total of 3 processors activated.
> [    0.240396] CPU features: detected: 32-bit EL0 Support
> [    0.245568] CPU features: detected: CRC32 instructions
> [    0.259436] CPU: All CPU(s) started at EL1
> [    0.260692] alternatives: patching kernel code
> [    0.266398] devtmpfs: initialized
> Timer fired, jitter:    749 ns, min: [    0.274443] clocksource: jiffies: mask: 0xffffffff max_cycles: 0xffffffff, max_idle_ns: 7645041785100000 ns
> [    0.281523] futex hash table entries: 1024 (order: 4, 65536 bytes, linear)
> 
> 
> Peng Fan (2):
>    cell-config: reserve an entry to align jailhouse_system
>    support booting jailhouse before root cell linux
> 
>   Kbuild                                          |   2 +-
>   hypervisor/arch/arm-common/include/asm/gic.h    |   3 +
>   hypervisor/arch/arm-common/include/asm/gic_v3.h |  18 ++
>   include/jailhouse/cell-config.h                 |   1 +
>   loader/Makefile                                 |  49 ++++
>   loader/configs.h                                |  30 +++
>   loader/fit.its                                  |  85 ++++++
>   loader/gic-v3.c                                 | 154 +++++++++++
>   loader/head.S                                   | 327 ++++++++++++++++++++++++
>   loader/inmate.c                                 |  63 +++++
>   loader/lib.c                                    |  56 ++++
>   loader/loader.h                                 |  15 ++
>   loader/loader.lds.S                             |  66 +++++
>   loader/main.c                                   | 194 ++++++++++++++
>   loader/mmio.h                                   |  21 ++
>   loader/psci.h                                   | 119 +++++++++
>   16 files changed, 1202 insertions(+), 1 deletion(-)
>   create mode 100644 loader/Makefile
>   create mode 100644 loader/configs.h
>   create mode 100644 loader/fit.its
>   create mode 100644 loader/gic-v3.c
>   create mode 100644 loader/head.S
>   create mode 100644 loader/inmate.c
>   create mode 100644 loader/lib.c
>   create mode 100644 loader/loader.h
>   create mode 100644 loader/loader.lds.S
>   create mode 100644 loader/main.c
>   create mode 100644 loader/mmio.h
>   create mode 100644 loader/psci.h
> 

Nice work! Will try to play with it on other (GICv3) targets.

There is a bit code duplication in the loader. I wonder if we couldn't 
reuse the inmate library for that as well. Inmates can already run 
without Jailhouse, Ralf once enabled that.

Regarding cache coloring: Now that we start Jailhouse before Linux, the 
plan would be to present a sliced (according to colors) memory map to 
Linux via the device tree, just like it was done for the non-root cells 
in the original coloring series. Still, we do want SMMU for all targets 
eventually...

Jan

-- 
Siemens AG, Corporate Technology, CT RDA IOT SES-DE
Corporate Competence Center Embedded Linux

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/a4bd0ce8-988c-c294-1d22-7809236baed5%40siemens.com.
