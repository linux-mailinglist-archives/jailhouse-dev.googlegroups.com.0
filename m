Return-Path: <jailhouse-dev+bncBCJI7SMNV4NBBIO23PYAKGQED7JYAKQ@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-ed1-x53c.google.com (mail-ed1-x53c.google.com [IPv6:2a00:1450:4864:20::53c])
	by mail.lfdr.de (Postfix) with ESMTPS id 735C0135520
	for <lists+jailhouse-dev@lfdr.de>; Thu,  9 Jan 2020 10:06:42 +0100 (CET)
Received: by mail-ed1-x53c.google.com with SMTP id g20sf3404333edt.18
        for <lists+jailhouse-dev@lfdr.de>; Thu, 09 Jan 2020 01:06:42 -0800 (PST)
ARC-Seal: i=2; a=rsa-sha256; t=1578560802; cv=pass;
        d=google.com; s=arc-20160816;
        b=KQmoFSqKvgNQboyuEO/gYJ/9b52ozgQujFdJWd0eBs7PWklicHdGvpf4Nr+KG4ybMM
         16QSh0MO9r/MpkW6kdnrT4rzeSp0PopXS5hTNdLJIP6culvTmdQrrUbZJZBLftYCdBnJ
         /ffJZpjC07gtSEdW98YuueWQDHTe6uLNKLjEsIjOAJY8A+aZjF/8ZfKIpD0MSrKhnWzx
         pM6XO/k98nW1TeFb72xJ9lR+8sPETfnvkIo8OWSIqKTGTr+4cctBUA2YD4w/VEGjBdw2
         H9YrpdDOsZnrbgMAcxr7NrD1fE88W0Q7yf5PQboGU71KUvEOjyHwr6ziU/7Rj3LBI97B
         IfdA==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject:sender:dkim-signature;
        bh=snIMWuZEKPjc46trHMRHZN4LXOEUbp7A8yr7V7tXC4w=;
        b=AMOP+ubL9fa8Rb7UlJkUcKR0QMlnz0RP6ycWm0sNWpzl1sXaNo3J6lfhj4ketMxdoS
         oZLVjRznp1BK9Fq+8OIAahIRufRQ3Xa8ww4C98bQ9ogdPL9rnQXPozMod06E62iwlLUO
         dNh+AXvE0pLTZgCuZBjL95t8j9Dta2NJ9m+Om7tRgnDAEB6pDhSh32Rq5dgHwJq6lJjm
         EVOdwSTw4/55qD4agQARrbNuKGPDeiO0Ou9rhZKxpYV+U6UNgj1pcrdJ80tkrdT5RdDM
         iDDyFF0Ml6rUCnS+NCrBWUIoxLVHGGuXmZPfYycNg49v38z7IDYWleB7oLc9fIBmG2I1
         YkOQ==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.2 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:subject:to:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding
         :x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=snIMWuZEKPjc46trHMRHZN4LXOEUbp7A8yr7V7tXC4w=;
        b=o+XNayCh3mLK0yAYXhKAJOhUqc4Hty/5HWR8u7nyoy6LcLXccRpPEBUqc3d+OLAtc1
         H1WtLKt0NAK1o3sfrxxWKs78o2gW/Llz6WAYOC/mFBChyxBtu9kr/ex1HxxfVTxwpejH
         C65MomgEl1I+jJM/gYonWSApothcCgMgzIFKYlSkcQY5S/rgS7JkAjW2y20m0WkjMQ3x
         g1KGAmZNRElLxGaZZ//nZlKX0x8MZC3yq6xeuQE69zyQvnZi+BuMFzh1FS5MiLciiKjc
         DKQuN6OT50FNpxAXzc4jf7CZCl+AmaVxf64tWTbrafR1Qmp4pQ58POgnCmJ8FeVyh20z
         JYrw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:subject:to:references:from:message-id
         :date:user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :x-spam-checked-in-group:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=snIMWuZEKPjc46trHMRHZN4LXOEUbp7A8yr7V7tXC4w=;
        b=jMXpA6YSKdtyX6WEhhq70tOqf6t5SaRPloDi+r5U8ZqeV2qDExJwLDlQNwvizGT8Dg
         euRQeoNXbzlgzqX1Vl8WjlwS2QFmY7yKsWi3iOzhTYbUJF0HOnrWiL1/FswiXenoh7Tv
         h3XL8gw3CDCEY5tzQn4JlDwsfCOQyxNotY/obgsO6WPAX+TLcLuoiVUt8T5FwUxPBXws
         NpS/EpuUG8pxiuIt/iYmN3eY3fyd0WKdAY62eiZtuMfPGq7HuuDyDWq1JQ6C81mWc/x7
         NIkBZgATkPYmU4H32S38wgXvcbxGflRzzJ7nuTfUgPgiuCBySajhKM3jC30j9xUq9sCr
         wwAg==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: APjAAAXEPxqDdTEUillEYAqGFgrbvJgGtq4EZsRCuqqKAPvytVBjT7A2
	PKuJ5Dprp90JePtEJaGo2gY=
X-Google-Smtp-Source: APXvYqwQvlSclbRU+VjfVe/l5bxN+vAXIKmPAy0uJR2uvRfSAbkBG3R+716WnT/5irH4u3DYPQmxmA==
X-Received: by 2002:a50:b905:: with SMTP id m5mr9766364ede.154.1578560801866;
        Thu, 09 Jan 2020 01:06:41 -0800 (PST)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a17:906:c82b:: with SMTP id dd11ls409849ejb.8.gmail; Thu, 09
 Jan 2020 01:06:41 -0800 (PST)
X-Received: by 2002:a17:906:2e46:: with SMTP id r6mr9367531eji.310.1578560801050;
        Thu, 09 Jan 2020 01:06:41 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1578560801; cv=none;
        d=google.com; s=arc-20160816;
        b=NvdGJLLtv3DIMzmgrbKu+4GcMMlqAde5HzF0QATzuCXNWyw14RfyifWqzeyo16K0Xy
         Z2oALnG/WZ/mR1qB0ekrRvU0eTrcqE15063M5cgembEqn/lnR8da3tJuGCSFzXfFVChP
         9qXDyxnzeN3500w5od6eoovMPOiO4f1ww/JO+N9QBimaRqPK+LbFC6UxI+YcW97NTmlq
         bE6gDqHLMVL8GITRO2ZAnM1ev22/UHvVPwMh14nVt3gyzt+gQ1nL5mkKgxGbmaDap9m6
         14DKYUUm+2wXeV8HxnWu4sxMLFd7S2PLba6QFj3F2kwUlXAgJZCaGkttCLo45WukmPqF
         3csw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:to:subject;
        bh=vE49K8SONLJTBF9splSytjnk0Es/mcmRN+476hgB5Gc=;
        b=NY15/AP6luBanbX/vtWl9+24KS0oKvXWTCxSU/6ZsEboZKlbuA7W+pPBYdbSt+LorY
         yKByQ3j47ZXdk6+BPX5LwJaxsu1seU82UAncBLsPOZYzmXJAiyWt8DTKFORgE/cjkvbV
         SRLex+cNy0jI+LWH1A66cO2i/cgNF+YUFwlOYqS2SkRM8bUWc/f9Alq8W12D1MWy2T2B
         atKAYXQ8qSAum0DnQd/LpT4DHt4v3qurw/OcsMyRu46yI3KmejkI/vT7TeGPaY69ovfP
         7bsHoPO/XWprL1eymB1ODpD7d0ElDTWnSt05AWmBEZ7txl4kjAZyXeM+Bza9ew8+gRYe
         6/0g==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.2 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
Received: from thoth.sbs.de (thoth.sbs.de. [192.35.17.2])
        by gmr-mx.google.com with ESMTPS id x18si263684eds.2.2020.01.09.01.06.40
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 09 Jan 2020 01:06:41 -0800 (PST)
Received-SPF: pass (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.2 as permitted sender) client-ip=192.35.17.2;
Received: from mail1.sbs.de (mail1.sbs.de [192.129.41.35])
	by thoth.sbs.de (8.15.2/8.15.2) with ESMTPS id 00996dIS030945
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 9 Jan 2020 10:06:40 +0100
Received: from [167.87.50.164] ([167.87.50.164])
	by mail1.sbs.de (8.15.2/8.15.2) with ESMTP id 00996dAN014882;
	Thu, 9 Jan 2020 10:06:39 +0100
Subject: Re: ssh don't work on jailhouse-images and how to create two cell one
 with application and another with linux on jailhouse-image demo
To: Saroj Sapkota <samirroj2016@gmail.com>,
        Jailhouse <jailhouse-dev@googlegroups.com>
References: <b33c1868-f6be-4e7c-8b23-7d7bdf75f15e@googlegroups.com>
From: Jan Kiszka <jan.kiszka@siemens.com>
Message-ID: <3f685f85-d1ba-4619-6d0a-06b6b675c60f@siemens.com>
Date: Thu, 9 Jan 2020 10:06:32 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.2.1
MIME-Version: 1.0
In-Reply-To: <b33c1868-f6be-4e7c-8b23-7d7bdf75f15e@googlegroups.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable
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

On 08.01.20 21:54, Saroj Sapkota wrote:
> All the requirement docker, qemu, kernel updated to latest as mentioned=
=20
> in read.md and the results are:
> sarojs@engee-e121-d08:/$ docker --version
> Docker version 19.03.4, build 9013bf583a
> sarojs@engee-e121-d08:/$ qemu-system-x86_64 --version
> QEMU emulator version 4.1.0
> Copyright (c) 2003-2019 Fabrice Bellard and the QEMU Project developers
> sarojs@engee-e121-d08:/$ uname -r
> 4.4.0-167-generic
> *after this I run build-images.sh and then finally start-qemu.sh*
> *and the results is:*
>=20
> sarojs@engee-e121-d08:~/Downloads/jailhouse-images$ ./start-qemu.sh arm64
> VNC server running on 127.0.0.1:5900
> [=C2=A0=C2=A0=C2=A0 0.000000] Booting Linux on physical CPU 0x0000000000 =
[0x411fd070]
> [=C2=A0=C2=A0=C2=A0 0.000000] Linux version 4.19.67 (builder@bc528e2a57f1=
) (gcc version=20
> 8.3.0 (Debian 8.3.0-2)) #1 SMP PREEMPT Tue Nov 5 18:52:36 UTC 2019
> [=C2=A0=C2=A0=C2=A0 0.000000] Machine model: linux,dummy-virt
> [=C2=A0=C2=A0=C2=A0 0.000000] Memory limited to 768MB
> [=C2=A0=C2=A0=C2=A0 0.000000] efi: Getting EFI parameters from FDT:
> [=C2=A0=C2=A0=C2=A0 0.000000] efi: UEFI not found.
> [=C2=A0=C2=A0=C2=A0 0.000000] cma: Reserved 16 MiB at 0x000000006f000000
> [=C2=A0=C2=A0=C2=A0 0.000000] NUMA: No NUMA configuration found
> [=C2=A0=C2=A0=C2=A0 0.000000] NUMA: Faking a node at [mem=20
> 0x0000000000000000-0x000000006fffffff]
> [=C2=A0=C2=A0=C2=A0 0.000000] NUMA: NODE_DATA [mem 0x6efe8480-0x6efe9c3f]
> [=C2=A0=C2=A0=C2=A0 0.000000] Zone ranges:
> [=C2=A0=C2=A0=C2=A0 0.000000]=C2=A0=C2=A0 DMA32=C2=A0=C2=A0=C2=A0 [mem 0x=
0000000040000000-0x000000006fffffff]
> [=C2=A0=C2=A0=C2=A0 0.000000]=C2=A0=C2=A0 Normal=C2=A0=C2=A0 empty
> [=C2=A0=C2=A0=C2=A0 0.000000] Movable zone start for each node
> [=C2=A0=C2=A0=C2=A0 0.000000] Early memory node ranges
> [=C2=A0=C2=A0=C2=A0 0.000000]=C2=A0=C2=A0 node=C2=A0=C2=A0 0: [mem 0x0000=
000040000000-0x000000006fffffff]
> [=C2=A0=C2=A0=C2=A0 0.000000] Initmem setup node 0 [mem=20
> 0x0000000040000000-0x000000006fffffff]
> [=C2=A0=C2=A0=C2=A0 0.000000] psci: probing for conduit method from DT.
> [=C2=A0=C2=A0=C2=A0 0.000000] psci: PSCIv0.2 detected in firmware.
> [=C2=A0=C2=A0=C2=A0 0.000000] psci: Using standard PSCI v0.2 function IDs
> [=C2=A0=C2=A0=C2=A0 0.000000] psci: Trusted OS migration not required
> [=C2=A0=C2=A0=C2=A0 0.000000] random: get_random_bytes called from=20
> start_kernel+0x94/0x400 with crng_init=3D0
> [=C2=A0=C2=A0=C2=A0 0.000000] percpu: Embedded 22 pages/cpu s53016 r8192 =
d28904 u90112
> [=C2=A0=C2=A0=C2=A0 0.000000] Detected PIPT I-cache on CPU0
> [=C2=A0=C2=A0=C2=A0 0.000000] CPU features: enabling workaround for ARM e=
rratum 832075
> [=C2=A0=C2=A0=C2=A0 0.000000] CPU features: enabling workaround for EL2 v=
ector hardening
> [=C2=A0=C2=A0=C2=A0 0.000000] CPU features: detected: Kernel page table i=
solation (KPTI)
> [=C2=A0=C2=A0=C2=A0 0.000000] Built 1 zonelists, mobility grouping on.=C2=
=A0 Total pages: 193536
> [=C2=A0=C2=A0=C2=A0 0.000000] Policy zone: DMA32
> [=C2=A0=C2=A0=C2=A0 0.000000] Kernel command line:=C2=A0 =C2=A0=C2=A0=C2=
=A0 =C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 root=3D/dev/vda mem=3D768M
> [=C2=A0=C2=A0=C2=A0 0.000000] Memory: 729472K/786432K available (10044K k=
ernel code,=20
> 1294K rwdata, 4312K rodata, 1152K init, 369K bss, 40576K reserved,=20
> 16384K cma-reserved)
> [=C2=A0=C2=A0=C2=A0 0.000000] SLUB: HWalign=3D64, Order=3D0-3, MinObjects=
=3D0, CPUs=3D16, Nodes=3D1
> [=C2=A0=C2=A0=C2=A0 0.000000] rcu: Preemptible hierarchical RCU implement=
ation.
> [=C2=A0=C2=A0=C2=A0 0.000000] rcu: =C2=A0=C2=A0=C2=A0 RCU restricting CPU=
s from NR_CPUS=3D64 to=20
> nr_cpu_ids=3D16.
> [=C2=A0=C2=A0=C2=A0 0.000000] =C2=A0=C2=A0=C2=A0 Tasks RCU enabled.
> [=C2=A0=C2=A0=C2=A0 0.000000] rcu: Adjusting geometry for rcu_fanout_leaf=
=3D16, nr_cpu_ids=3D16
> [=C2=A0=C2=A0=C2=A0 0.000000] NR_IRQS: 64, nr_irqs: 64, preallocated irqs=
: 0
> [=C2=A0=C2=A0=C2=A0 0.000000] GICv3: GIC: Using split EOI/Deactivate mode
> [=C2=A0=C2=A0=C2=A0 0.000000] GICv3: Distributor has no Range Selector su=
pport
> [=C2=A0=C2=A0=C2=A0 0.000000] GICv3: no VLPI support, no direct LPI suppo=
rt
> [=C2=A0=C2=A0=C2=A0 0.000000] GICv3: CPU0: found redistributor 0 region=
=20
> 0:0x00000000080a0000
> [=C2=A0=C2=A0=C2=A0 0.000000] arch_timer: cp15 timer(s) running at 62.50M=
Hz (phys).
> [=C2=A0=C2=A0=C2=A0 0.000000] clocksource: arch_sys_counter: mask: 0xffff=
ffffffffff=20
> max_cycles: 0x1cd42e208c, max_idle_ns: 881590405314 ns
> [=C2=A0=C2=A0=C2=A0 0.000167] sched_clock: 56 bits at 62MHz, resolution 1=
6ns, wraps=20
> every 4398046511096ns
> [=C2=A0=C2=A0=C2=A0 0.009196] Console: colour dummy device 80x25
> [=C2=A0=C2=A0=C2=A0 0.011540] console [tty0] enabled
> [=C2=A0=C2=A0=C2=A0 0.014855] Calibrating delay loop (skipped), value cal=
culated using=20
> timer frequency.. 125.00 BogoMIPS (lpj=3D250000)
> [=C2=A0=C2=A0=C2=A0 0.015058] pid_max: default: 32768 minimum: 301
> [=C2=A0=C2=A0=C2=A0 0.016528] Security Framework initialized
> [=C2=A0=C2=A0=C2=A0 0.018663] Dentry cache hash table entries: 131072 (or=
der: 8,=20
> 1048576 bytes)
> [=C2=A0=C2=A0=C2=A0 0.019461] Inode-cache hash table entries: 65536 (orde=
r: 7, 524288=20
> bytes)
> [=C2=A0=C2=A0=C2=A0 0.019731] Mount-cache hash table entries: 2048 (order=
: 2, 16384 bytes)
> [=C2=A0=C2=A0=C2=A0 0.019824] Mountpoint-cache hash table entries: 2048 (=
order: 2,=20
> 16384 bytes)
> [=C2=A0=C2=A0=C2=A0 0.082413] ASID allocator initialised with 32768 entri=
es
> [=C2=A0=C2=A0=C2=A0 0.090745] rcu: Hierarchical SRCU implementation.
> [=C2=A0=C2=A0=C2=A0 0.121397] EFI services will not be available.
> [=C2=A0=C2=A0=C2=A0 0.131213] smp: Bringing up secondary CPUs ...
> [=C2=A0=C2=A0=C2=A0 0.163456] Detected PIPT I-cache on CPU1
> [=C2=A0=C2=A0=C2=A0 0.165414] GICv3: CPU1: found redistributor 1 region=
=20
> 0:0x00000000080c0000
> [=C2=A0=C2=A0=C2=A0 0.165996] CPU1: Booted secondary processor 0x00000000=
01 [0x411fd070]
> [=C2=A0=C2=A0=C2=A0 0.209014] Detected PIPT I-cache on CPU2
> [=C2=A0=C2=A0=C2=A0 0.209110] GICv3: CPU2: found redistributor 2 region=
=20
> 0:0x00000000080e0000
> [=C2=A0=C2=A0=C2=A0 0.209225] CPU2: Booted secondary processor 0x00000000=
02 [0x411fd070]
> [=C2=A0=C2=A0=C2=A0 0.241807] Detected PIPT I-cache on CPU3
> [=C2=A0=C2=A0=C2=A0 0.241941] GICv3: CPU3: found redistributor 3 region=
=20
> 0:0x0000000008100000
> [=C2=A0=C2=A0=C2=A0 0.242103] CPU3: Booted secondary processor 0x00000000=
03 [0x411fd070]
> [=C2=A0=C2=A0=C2=A0 0.276834] Detected PIPT I-cache on CPU4
> [=C2=A0=C2=A0=C2=A0 0.277172] GICv3: CPU4: found redistributor 4 region=
=20
> 0:0x0000000008120000
> [=C2=A0=C2=A0=C2=A0 0.277537] CPU4: Booted secondary processor 0x00000000=
04 [0x411fd070]
> [=C2=A0=C2=A0=C2=A0 0.316327] Detected PIPT I-cache on CPU5
> [=C2=A0=C2=A0=C2=A0 0.316709] GICv3: CPU5: found redistributor 5 region=
=20
> 0:0x0000000008140000
> [=C2=A0=C2=A0=C2=A0 0.317101] CPU5: Booted secondary processor 0x00000000=
05 [0x411fd070]
> [=C2=A0=C2=A0=C2=A0 0.356252] Detected PIPT I-cache on CPU6
> [=C2=A0=C2=A0=C2=A0 0.356626] GICv3: CPU6: found redistributor 6 region=
=20
> 0:0x0000000008160000
> [=C2=A0=C2=A0=C2=A0 0.357149] CPU6: Booted secondary processor 0x00000000=
06 [0x411fd070]
> [=C2=A0=C2=A0=C2=A0 0.394943] Detected PIPT I-cache on CPU7
> [=C2=A0=C2=A0=C2=A0 0.395074] GICv3: CPU7: found redistributor 7 region=
=20
> 0:0x0000000008180000
> [=C2=A0=C2=A0=C2=A0 0.395224] CPU7: Booted secondary processor 0x00000000=
07 [0x411fd070]
> [=C2=A0=C2=A0=C2=A0 0.427866] Detected PIPT I-cache on CPU8
> [=C2=A0=C2=A0=C2=A0 0.428003] GICv3: CPU8: found redistributor 8 region=
=20
> 0:0x00000000081a0000
> [=C2=A0=C2=A0=C2=A0 0.428163] CPU8: Booted secondary processor 0x00000000=
08 [0x411fd070]
> [=C2=A0=C2=A0=C2=A0 0.483476] Detected PIPT I-cache on CPU9
> [=C2=A0=C2=A0=C2=A0 0.483774] GICv3: CPU9: found redistributor 9 region=
=20
> 0:0x00000000081c0000
> [=C2=A0=C2=A0=C2=A0 0.484125] CPU9: Booted secondary processor 0x00000000=
09 [0x411fd070]
> [=C2=A0=C2=A0=C2=A0 0.517943] Detected PIPT I-cache on CPU10
> [=C2=A0=C2=A0=C2=A0 0.518510] GICv3: CPU10: found redistributor a region=
=20
> 0:0x00000000081e0000
> [=C2=A0=C2=A0=C2=A0 0.519101] CPU10: Booted secondary processor 0x0000000=
00a [0x411fd070]
> [=C2=A0=C2=A0=C2=A0 0.556796] Detected PIPT I-cache on CPU11
> [=C2=A0=C2=A0=C2=A0 0.557390] GICv3: CPU11: found redistributor b region=
=20
> 0:0x0000000008200000
> [=C2=A0=C2=A0=C2=A0 0.557984] CPU11: Booted secondary processor 0x0000000=
00b [0x411fd070]
> [=C2=A0=C2=A0=C2=A0 0.594707] Detected PIPT I-cache on CPU12
> [=C2=A0=C2=A0=C2=A0 0.595031] GICv3: CPU12: found redistributor c region=
=20
> 0:0x0000000008220000
> [=C2=A0=C2=A0=C2=A0 0.595533] CPU12: Booted secondary processor 0x0000000=
00c [0x411fd070]
> [=C2=A0=C2=A0=C2=A0 0.628692] Detected PIPT I-cache on CPU13
> [=C2=A0=C2=A0=C2=A0 0.629111] GICv3: CPU13: found redistributor d region=
=20
> 0:0x0000000008240000
> [=C2=A0=C2=A0=C2=A0 0.629460] CPU13: Booted secondary processor 0x0000000=
00d [0x411fd070]
> [=C2=A0=C2=A0=C2=A0 0.662432] Detected PIPT I-cache on CPU14
> [=C2=A0=C2=A0=C2=A0 0.662815] GICv3: CPU14: found redistributor e region=
=20
> 0:0x0000000008260000
> [=C2=A0=C2=A0=C2=A0 0.663338] CPU14: Booted secondary processor 0x0000000=
00e [0x411fd070]
> [=C2=A0=C2=A0=C2=A0 0.701173] Detected PIPT I-cache on CPU15
> [=C2=A0=C2=A0=C2=A0 0.701480] GICv3: CPU15: found redistributor f region=
=20
> 0:0x0000000008280000
> [=C2=A0=C2=A0=C2=A0 0.701830] CPU15: Booted secondary processor 0x0000000=
00f [0x411fd070]
> [=C2=A0=C2=A0=C2=A0 0.703285] smp: Brought up 1 node, 16 CPUs
> [=C2=A0=C2=A0=C2=A0 0.709495] SMP: Total of 16 processors activated.
> [=C2=A0=C2=A0=C2=A0 0.709877] CPU features: detected: GIC system register=
 CPU interface
> [=C2=A0=C2=A0=C2=A0 0.710137] CPU features: detected: 32-bit EL0 Support
> [=C2=A0=C2=A0=C2=A0 0.932452] CPU: All CPU(s) started at EL2
> [=C2=A0=C2=A0=C2=A0 0.965064] alternatives: patching kernel code
> [=C2=A0=C2=A0=C2=A0 1.021311] devtmpfs: initialized
> [=C2=A0=C2=A0=C2=A0 1.038681] clocksource: jiffies: mask: 0xffffffff max_=
cycles:=20
> 0xffffffff, max_idle_ns: 7645041785100000 ns
> [=C2=A0=C2=A0=C2=A0 1.039229] futex hash table entries: 4096 (order: 6, 2=
62144 bytes)
> [=C2=A0=C2=A0=C2=A0 1.044588] pinctrl core: initialized pinctrl subsystem
> [=C2=A0=C2=A0=C2=A0 1.062703] DMI not present or invalid.
> [=C2=A0=C2=A0=C2=A0 1.069419] NET: Registered protocol family 16
> [=C2=A0=C2=A0=C2=A0 1.074197] audit: initializing netlink subsys (disable=
d)
> [=C2=A0=C2=A0=C2=A0 1.076449] audit: type=3D2000 audit(0.776:1): state=3D=
initialized=20
> audit_enabled=3D0 res=3D1
> [=C2=A0=C2=A0=C2=A0 1.084715] cpuidle: using governor menu
> [=C2=A0=C2=A0=C2=A0 1.086698] vdso: 2 pages (1 code @ (____ptrval____), 1=
 data @=20
> (____ptrval____))
> [=C2=A0=C2=A0=C2=A0 1.086870] hw-breakpoint: found 6 breakpoint and 4 wat=
chpoint registers.
> [=C2=A0=C2=A0=C2=A0 1.100600] DMA: preallocated 256 KiB pool for atomic a=
llocations
> [=C2=A0=C2=A0=C2=A0 1.105252] Serial: AMBA PL011 UART driver
> [=C2=A0=C2=A0=C2=A0 1.142651] 9000000.pl011: ttyAMA0 at MMIO 0x9000000 (i=
rq =3D 40,=20
> base_baud =3D 0) is a PL011 rev1
> [=C2=A0=C2=A0=C2=A0 1.165136] console [ttyAMA0] enabled
> [=C2=A0=C2=A0=C2=A0 1.370391] HugeTLB registered 2.00 MiB page size, pre-=
allocated 0 pages
> [=C2=A0=C2=A0=C2=A0 1.375592] cryptd: max_cpu_qlen set to 1000
> [=C2=A0=C2=A0=C2=A0 1.381172] ACPI: Interpreter disabled.
> [=C2=A0=C2=A0=C2=A0 1.386213] vgaarb: loaded
> [=C2=A0=C2=A0=C2=A0 1.388929] SCSI subsystem initialized
> [=C2=A0=C2=A0=C2=A0 1.394115] usbcore: registered new interface driver us=
bfs
> [=C2=A0=C2=A0=C2=A0 1.394984] usbcore: registered new interface driver hu=
b
> [=C2=A0=C2=A0=C2=A0 1.396038] usbcore: registered new device driver usb
> [=C2=A0=C2=A0=C2=A0 1.404071] pps_core: LinuxPPS API ver. 1 registered
> [=C2=A0=C2=A0=C2=A0 1.404564] pps_core: Software ver. 5.3.6 - Copyright 2=
005-2007=20
> Rodolfo Giometti <giometti@linux.it>
> [=C2=A0=C2=A0=C2=A0 1.405492] PTP clock support registered
> [=C2=A0=C2=A0=C2=A0 1.407076] EDAC MC: Ver: 3.0.0
> [=C2=A0=C2=A0=C2=A0 1.492705] clocksource: Switched to clocksource arch_s=
ys_counter
> [=C2=A0=C2=A0=C2=A0 1.509419] VFS: Disk quotas dquot_6.6.0
> [=C2=A0=C2=A0=C2=A0 1.509874] VFS: Dquot-cache hash table entries: 512 (o=
rder 0, 4096=20
> bytes)
> [=C2=A0=C2=A0=C2=A0 1.512450] pnp: PnP ACPI: disabled
> [=C2=A0=C2=A0=C2=A0 1.568294] NET: Registered protocol family 2
> [=C2=A0=C2=A0=C2=A0 1.584108] tcp_listen_portaddr_hash hash table entries=
: 512 (order:=20
> 1, 8192 bytes)
> [=C2=A0=C2=A0=C2=A0 1.584780] TCP established hash table entries: 8192 (o=
rder: 4, 65536=20
> bytes)
> [=C2=A0=C2=A0=C2=A0 1.585583] TCP bind hash table entries: 8192 (order: 5=
, 131072 bytes)
> [=C2=A0=C2=A0=C2=A0 1.586009] TCP: Hash tables configured (established 81=
92 bind 8192)
> [=C2=A0=C2=A0=C2=A0 1.588606] UDP hash table entries: 512 (order: 2, 1638=
4 bytes)
> [=C2=A0=C2=A0=C2=A0 1.589179] UDP-Lite hash table entries: 512 (order: 2,=
 16384 bytes)
> [=C2=A0=C2=A0=C2=A0 1.592560] NET: Registered protocol family 1
> [=C2=A0=C2=A0=C2=A0 1.598547] RPC: Registered named UNIX socket transport=
 module.
> [=C2=A0=C2=A0=C2=A0 1.598784] RPC: Registered udp transport module.
> [=C2=A0=C2=A0=C2=A0 1.598954] RPC: Registered tcp transport module.
> [=C2=A0=C2=A0=C2=A0 1.599110] RPC: Registered tcp NFSv4.1 backchannel tra=
nsport module.
> [=C2=A0=C2=A0=C2=A0 1.602869] Unpacking initramfs...
> [=C2=A0=C2=A0=C2=A0 1.847907] Freeing initrd memory: 4292K
> [=C2=A0=C2=A0=C2=A0 1.857706] hw perfevents: enabled with armv8_pmuv3 PMU=
 driver, 5=20
> counters available
> [=C2=A0=C2=A0=C2=A0 1.879734] Initialise system trusted keyrings
> [=C2=A0=C2=A0=C2=A0 1.883324] workingset: timestamp_bits=3D44 max_order=
=3D18 bucket_order=3D0
> [=C2=A0=C2=A0=C2=A0 1.912683] squashfs: version 4.0 (2009/01/31) Phillip =
Lougher
> [=C2=A0=C2=A0=C2=A0 1.918361] NFS: Registering the id_resolver key type
> [=C2=A0=C2=A0=C2=A0 1.918781] Key type id_resolver registered
> [=C2=A0=C2=A0=C2=A0 1.919012] Key type id_legacy registered
> [=C2=A0=C2=A0=C2=A0 1.919442] nfs4filelayout_init: NFSv4 File Layout Driv=
er Registering...
> [=C2=A0=C2=A0=C2=A0 1.921845] 9p: Installing v9fs 9p2000 file system supp=
ort
> [=C2=A0=C2=A0=C2=A0 1.942598] Key type asymmetric registered
> [=C2=A0=C2=A0=C2=A0 1.942860] Asymmetric key parser 'x509' registered
> [=C2=A0=C2=A0=C2=A0 1.943281] Block layer SCSI generic (bsg) driver versi=
on 0.4 loaded=20
> (major 246)
> [=C2=A0=C2=A0=C2=A0 1.944068] io scheduler noop registered
> [=C2=A0=C2=A0=C2=A0 1.944699] io scheduler cfq registered (default)
> [=C2=A0=C2=A0=C2=A0 1.945362] io scheduler mq-deadline registered
> [=C2=A0=C2=A0=C2=A0 1.945581] io scheduler kyber registered
> [=C2=A0=C2=A0=C2=A0 1.975723] pl061_gpio 9030000.pl061: PL061 GPIO chip=
=20
> @0x0000000009030000 registered
> [=C2=A0=C2=A0=C2=A0 1.985874] pci-host-generic 4010000000.pcie: host brid=
ge=20
> /pcie@10000000 ranges:
> [=C2=A0=C2=A0=C2=A0 1.986737] pci-host-generic 4010000000.pcie:=C2=A0=C2=
=A0=C2=A0 IO=20
> 0x3eff0000..0x3effffff -> 0x00000000
> [=C2=A0=C2=A0=C2=A0 1.987598] pci-host-generic 4010000000.pcie:=C2=A0=C2=
=A0 MEM=20
> 0x10000000..0x3efeffff -> 0x10000000
> [=C2=A0=C2=A0=C2=A0 1.987882] pci-host-generic 4010000000.pcie:=C2=A0=C2=
=A0 MEM=20
> 0x8000000000..0xffffffffff -> 0x8000000000
> [=C2=A0=C2=A0=C2=A0 1.989836] pci-host-generic 4010000000.pcie: ECAM at [=
mem=20
> 0x4010000000-0x401fffffff] for [bus 00-ff]
> [=C2=A0=C2=A0=C2=A0 1.992336] pci-host-generic 4010000000.pcie: PCI host =
bridge to bus=20
> 0000:00
> [=C2=A0=C2=A0=C2=A0 1.993286] pci_bus 0000:00: root bus resource [bus 00-=
ff]
> [=C2=A0=C2=A0=C2=A0 1.993814] pci_bus 0000:00: root bus resource [io=C2=
=A0 0x0000-0xffff]
> [=C2=A0=C2=A0=C2=A0 1.994028] pci_bus 0000:00: root bus resource [mem=20
> 0x10000000-0x3efeffff]
> [=C2=A0=C2=A0=C2=A0 1.994300] pci_bus 0000:00: root bus resource [mem=20
> 0x8000000000-0xffffffffff]
> [=C2=A0=C2=A0=C2=A0 2.088592] Serial: 8250/16550 driver, 4 ports, IRQ sha=
ring enabled
> [=C2=A0=C2=A0=C2=A0 2.095955] SuperH (H)SCI(F) driver initialized
> [=C2=A0=C2=A0=C2=A0 2.097903] msm_serial: driver initialized
> [=C2=A0=C2=A0=C2=A0 2.118236] cacheinfo: Unable to detect cache hierarchy=
 for CPU 0
> [=C2=A0=C2=A0=C2=A0 2.168640] loop: module loaded
> [=C2=A0=C2=A0=C2=A0 2.193407] virtio_blk virtio1: [vda] 2694416 512-byte =
logical blocks=20
> (1.38 GB/1.28 GiB)
> [=C2=A0=C2=A0=C2=A0 2.240577] libphy: Fixed MDIO Bus: probed
> [=C2=A0=C2=A0=C2=A0 2.244779] tun: Universal TUN/TAP device driver, 1.6
> [=C2=A0=C2=A0=C2=A0 2.263829] e1000e: Intel(R) PRO/1000 Network Driver - =
3.2.6-k
> [=C2=A0=C2=A0=C2=A0 2.264102] e1000e: Copyright(c) 1999 - 2015 Intel Corp=
oration.
> [=C2=A0=C2=A0=C2=A0 2.264632] igb: Intel(R) Gigabit Ethernet Network Driv=
er - version=20
> 5.4.0-k
> [=C2=A0=C2=A0=C2=A0 2.265235] igb: Copyright (c) 2007-2014 Intel Corporat=
ion.
> [=C2=A0=C2=A0=C2=A0 2.265878] igbvf: Intel(R) Gigabit Virtual Function Ne=
twork Driver -=20
> version 2.4.0-k
> [=C2=A0=C2=A0=C2=A0 2.266286] igbvf: Copyright (c) 2009 - 2012 Intel Corp=
oration.
> [=C2=A0=C2=A0=C2=A0 2.268481] sky2: driver version 1.30
> [=C2=A0=C2=A0=C2=A0 2.271790] VFIO - User Level meta-driver version: 0.3
> [=C2=A0=C2=A0=C2=A0 2.279480] ehci_hcd: USB 2.0 'Enhanced' Host Controlle=
r (EHCI) Driver
> [=C2=A0=C2=A0=C2=A0 2.279971] ehci-pci: EHCI PCI platform driver
> [=C2=A0=C2=A0=C2=A0 2.280718] ehci-platform: EHCI generic platform driver
> [=C2=A0=C2=A0=C2=A0 2.281717] ehci-orion: EHCI orion driver
> [=C2=A0=C2=A0=C2=A0 2.282216] ehci-exynos: EHCI EXYNOS driver
> [=C2=A0=C2=A0=C2=A0 2.282661] ohci_hcd: USB 1.1 'Open' Host Controller (O=
HCI) Driver
> [=C2=A0=C2=A0=C2=A0 2.283018] ohci-pci: OHCI PCI platform driver
> [=C2=A0=C2=A0=C2=A0 2.283770] ohci-platform: OHCI generic platform driver
> [=C2=A0=C2=A0=C2=A0 2.284438] ohci-exynos: OHCI EXYNOS driver
> [=C2=A0=C2=A0=C2=A0 2.291438] usbcore: registered new interface driver us=
b-storage
> [=C2=A0=C2=A0=C2=A0 2.306327] rtc-pl031 9010000.pl031: rtc core: register=
ed pl031 as rtc0
> [=C2=A0=C2=A0=C2=A0 2.309554] i2c /dev entries driver
> [=C2=A0=C2=A0=C2=A0 2.323629] sdhci: Secure Digital Host Controller Inter=
face driver
> [=C2=A0=C2=A0=C2=A0 2.324065] sdhci: Copyright(c) Pierre Ossman
> [=C2=A0=C2=A0=C2=A0 2.326027] Synopsys Designware Multimedia Card Interfa=
ce Driver
> [=C2=A0=C2=A0=C2=A0 2.331478] sdhci-pltfm: SDHCI platform and OF driver h=
elper
> [=C2=A0=C2=A0=C2=A0 2.338411] ledtrig-cpu: registered to indicate activit=
y on CPUs
> [=C2=A0=C2=A0=C2=A0 2.344584] usbcore: registered new interface driver us=
bhid
> [=C2=A0=C2=A0=C2=A0 2.345111] usbhid: USB HID core driver
> [=C2=A0=C2=A0=C2=A0 2.361241] NET: Registered protocol family 10
> [=C2=A0=C2=A0=C2=A0 2.386925] Segment Routing with IPv6
> [=C2=A0=C2=A0=C2=A0 2.387956] NET: Registered protocol family 17
> [=C2=A0=C2=A0=C2=A0 2.390680] 9pnet: Installing 9P2000 support
> [=C2=A0=C2=A0=C2=A0 2.391618] Key type dns_resolver registered
> [=C2=A0=C2=A0=C2=A0 2.394251] registered taskstats version 1
> [=C2=A0=C2=A0=C2=A0 2.394446] Loading compiled-in X.509 certificates
> [=C2=A0=C2=A0=C2=A0 2.408606] input: gpio-keys as /devices/platform/gpio-=
keys/input/input0
> [=C2=A0=C2=A0=C2=A0 2.413248] rtc-pl031 9010000.pl031: setting system clo=
ck to=20
> 2020-01-08 20:39:44 UTC (1578515984)
> [=C2=A0=C2=A0=C2=A0 2.424182] uart-pl011 9000000.pl011: no DMA platform d=
ata
> [=C2=A0=C2=A0=C2=A0 2.668052] Freeing unused kernel memory: 1152K
> [=C2=A0=C2=A0=C2=A0 2.676760] Run /init as init process
> Loading, please wait...
> Starting version 241
> Begin: Loading essential drivers ... done.
> Begin: Running /scripts/init-premount ... done.
> Begin: Mounting root file system ... Begin: Running /scripts/local-top=20
> ... done.
> Begin: Running /scripts/local-premount ... done.
> Warning: fsck not present, so skipping root file system
> [=C2=A0=C2=A0=C2=A0 6.458709] EXT4-fs (vda): INFO: recovery required on r=
eadonly filesystem
> [=C2=A0=C2=A0=C2=A0 6.459146] EXT4-fs (vda): write access will be enabled=
 during recovery
> [=C2=A0=C2=A0=C2=A0 6.562511] EXT4-fs (vda): recovery complete
> [=C2=A0=C2=A0=C2=A0 6.586139] EXT4-fs (vda): mounted filesystem with orde=
red data mode.=20
> Opts: (null)
> done.
> Begin: Running /scripts/local-bottom ... done.
> Begin: Running /scripts/init-bottom ... done.
> [=C2=A0=C2=A0=C2=A0 6.984092] random: fast init done
> [=C2=A0=C2=A0=C2=A0 7.625962] systemd[1]: systemd 241 running in system m=
ode. (+PAM=20
> +AUDIT +SELINUX +IMA +APPARMOR +SMACK +SYSVINIT +UTMP +LIBCRYPTSETUP=20
> +GCRYPT +GNUTLS +ACL +XZ +LZ4 +SECCOMP +BLKID +ELFUTILS +KMOD -IDN2 +IDN=
=20
> -PCRE2 default-hierarchy=3Dhybrid)
> [=C2=A0=C2=A0=C2=A0 7.630537] systemd[1]: Detected virtualization qemu.
> [=C2=A0=C2=A0=C2=A0 7.631210] systemd[1]: Detected architecture arm64.
>=20
> Welcome to Debian GNU/Linux 10 (buster)!
>=20
> [=C2=A0=C2=A0=C2=A0 7.699983] systemd[1]: Set hostname to <demo>.
> [=C2=A0=C2=A0=C2=A0 7.751547] systemd[1]: Failed to bump fs.file-max, ign=
oring: Invalid=20
> argument
> [=C2=A0=C2=A0=C2=A0 9.000192] systemd[1]: File=20
> /lib/systemd/system/systemd-journald.service:12 configures an IP=20
> firewall (IPAddressDeny=3Dany), but the local system does not support=20
> BPF/cgroup based firewalling.
> [=C2=A0=C2=A0=C2=A0 9.001046] systemd[1]: Proceeding WITHOUT firewalling =
in effect!=20
> (This warning is only shown for the first loaded unit using IP firewallin=
g.)
> [=C2=A0=C2=A0=C2=A0 9.705779] random: systemd: uninitialized urandom read=
 (16 bytes read)
> [=C2=A0=C2=A0=C2=A0 9.749841] random: systemd: uninitialized urandom read=
 (16 bytes read)
> [=C2=A0=C2=A0=C2=A0 9.762078] systemd[1]: Listening on Journal Socket.
> [=C2=A0 OK=C2=A0 ] Listening on Journal Socket.
> [=C2=A0=C2=A0=C2=A0 9.767359] random: systemd: uninitialized urandom read=
 (16 bytes read)
> [=C2=A0=C2=A0=C2=A0 9.770462] systemd[1]: Listening on initctl Compatibil=
ity Named Pipe.
> [=C2=A0 OK=C2=A0 ] Listening on initctl Compatibility Named Pipe.
> [=C2=A0=C2=A0=C2=A0 9.834070] systemd[1]: Starting Remount Root and Kerne=
l File Systems...
>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 Starting Remount Root a=
nd Kernel File Systems...
> [=C2=A0 OK=C2=A0 ] Started Forward Password R=E2=80=A6uests to Wall Direc=
tory Watch.
>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 Mounting Huge Pages Fil=
e System...
> [=C2=A0 OK=C2=A0 ] Created slice system-serial\x2dgetty.slice.
> [=C2=A0 OK=C2=A0 ] Started Dispatch Password =E2=80=A6ts to Console Direc=
tory Watch.
> [=C2=A0 OK=C2=A0 ] Reached target Local Encrypted Volumes.
>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 Starting Load Kernel Mo=
dules...
> [=C2=A0 OK=C2=A0 ] Created slice system-getty.slice.
> [=C2=A0 OK=C2=A0 ] Reached target Paths.
> [=C2=A0 OK=C2=A0 ] Listening on udev Kernel Socket.
> [=C2=A0 OK=C2=A0 ] Reached target Remote File Systems.
> [=C2=A0 OK=C2=A0 ] Listening on Journal Audit Socket.
> [=C2=A0 OK=C2=A0 ] Reached target Swap.
> [=C2=A0 OK=C2=A0 ] Created slice User and Session Slice.
> [=C2=A0 OK=C2=A0 ] Reached target Slices.
>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 Mounting Kernel Debug F=
ile System...
> [=C2=A0 OK=C2=A0 ] Listening on Journal Socket (/dev/log).
>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 Starting Journal Servic=
e...
> [=C2=A0 OK=C2=A0 ] Listening on udev Control Socket.
>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 Starting udev Coldplug =
all Devices...
> [=C2=A0=C2=A0 10.496248] EXT4-fs (vda): re-mounted. Opts: (null)
>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 Mounting POSIX Message =
Queue File System...
> [=C2=A0=C2=A0 10.671466] jailhouse: loading out-of-tree module taints ker=
nel.
> [=C2=A0 OK=C2=A0 ] Mounted Huge Pages File System.
> [=C2=A0 OK=C2=A0 ] Started Remount Root and Kernel File Systems.
> [=C2=A0 OK=C2=A0 ] Started Load Kernel Modules.
> [=C2=A0 OK=C2=A0 ] Mounted Kernel Debug File System.
> [=C2=A0 OK=C2=A0 ] Mounted POSIX Message Queue File System.
>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 Mounting Kernel Configu=
ration File System...
>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 Starting Apply Kernel V=
ariables...
>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 Starting Load/Save Rand=
om Seed...
>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 Starting Create System =
Users...
> [=C2=A0 OK=C2=A0 ] Mounted Kernel Configuration File System.
> [=C2=A0 OK=C2=A0 ] Started Apply Kernel Variables.
> [=C2=A0 OK=C2=A0 ] Started Load/Save Random Seed.
> [=C2=A0 OK=C2=A0 ] Started Create System Users.
> [=C2=A0 OK=C2=A0 ] Started Journal Service.
>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 Starting Flush Journal =
to Persistent Storage...
>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 Starting Create Static =
Device Nodes in /dev...
> [=C2=A0 OK=C2=A0 ] Started Flush Journal to Persistent Storage.
> [=C2=A0 OK=C2=A0 ] Started Create Static Device Nodes in /dev.
>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 Starting udev Kernel De=
vice Manager...
> [=C2=A0 OK=C2=A0 ] Reached target Local File Systems (Pre).
> [=C2=A0 OK=C2=A0 ] Reached target Local File Systems.
>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 Starting Create Volatil=
e Files and Directories...
> [=C2=A0 OK=C2=A0 ] Started udev Kernel Device Manager.
> [=C2=A0 OK=C2=A0 ] Started Create Volatile Files and Directories.
>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 Starting Network Time S=
ynchronization...
>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 Starting Update UTMP ab=
out System Boot/Shutdown...
> [=C2=A0 OK=C2=A0 ] Started Update UTMP about System Boot/Shutdown.
> [=C2=A0 OK=C2=A0 ] Started Network Time Synchronization.
> [=C2=A0 OK=C2=A0 ] Reached target System Time Synchronized.
> [=C2=A0 OK=C2=A0 ] Found device /dev/ttyAMA0.
> [=C2=A0 OK=C2=A0 ] Started udev Coldplug all Devices.
> [=C2=A0 OK=C2=A0 ] Found device /dev/hvc0.
> [=C2=A0 OK=C2=A0 ] Started ifup for eth0.
> [=C2=A0 OK=C2=A0 ] Reached target System Initialization.
> [=C2=A0 OK=C2=A0 ] Listening on D-Bus System Message Bus Socket.
> [=C2=A0 OK=C2=A0 ] Reached target Sockets.
> [=C2=A0 OK=C2=A0 ] Started Daily man-db regeneration.
> [=C2=A0 OK=C2=A0 ] Started Daily apt download activities.
> [=C2=A0 OK=C2=A0 ] Started Daily Cleanup of Temporary Directories.
> [=C2=A0 OK=C2=A0 ] Reached target Basic System.
>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 Starting Login Service.=
..
> [=C2=A0 OK=C2=A0 ] Started D-Bus System Message Bus.
>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 Starting WPA supplicant=
...
> [=C2=A0 OK=C2=A0 ] Started Daily apt upgrade and clean activities.
> [=C2=A0 OK=C2=A0 ] Reached target Timers.
>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 Starting Helper to sync=
hronize boot up for ifupdown...
>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 Starting Daily man-db r=
egeneration...
> [=C2=A0 OK=C2=A0 ] Started Helper to synchronize boot up for ifupdown.
> [=C2=A0 OK=C2=A0 ] Started Login Service.
> [=C2=A0 OK=C2=A0 ] Started WPA supplicant.
>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 Starting Raise network =
interfaces...
> [=C2=A0 OK=C2=A0 ] Started Raise network interfaces.
> [=C2=A0 OK=C2=A0 ] Reached target Network.
>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 Starting Daily apt down=
load activities...
>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 Starting OpenBSD Secure=
 Shell server...
>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 Starting Permit User Se=
ssions...
> [=C2=A0 OK=C2=A0 ] Started Permit User Sessions.
> [=C2=A0 OK=C2=A0 ] Started Serial Getty on ttyAMA0.
> [=C2=A0 OK=C2=A0 ] Started Serial Getty on hvc0.
> [=C2=A0 OK=C2=A0 ] Started Getty on tty1.
> [=C2=A0 OK=C2=A0 ] Reached target Login Prompts.
> [=C2=A0 OK=C2=A0 ] Started Daily man-db regeneration.
>=20
> Jailhouse Demo Image (login: root/root)
> demo login: sarojs@engee-e121-d08:/$ docker --version
> Password:
> Login timed out after 60 seconds.
>=20
> Jailhouse Demo Image (login: root/root)
> demo login:
> *After I login i get the following:*
> Linux demo 4.19.67 #1 SMP PREEMPT Tue Nov 5 18:52:36 UTC 2019 aarch64
>=20
> For trying out Jailhouse, the following commands have been placed into th=
e
> shell history:
>  =C2=A0# jailhouse enable /etc/jailhouse/qemu-arm64.cell
>  =C2=A0# jailhouse console
>  =C2=A0# jailhouse cell create /etc/jailhouse/qemu-arm64-gic-demo.cell
>  =C2=A0# jailhouse cell load gic-demo /usr/libexec/jailhouse/demos/gic-de=
mo.bin
>  =C2=A0# jailhouse cell start gic-demo
>  =C2=A0# jailhouse cell stats gic-demo
>  =C2=A0# jailhouse cell destroy gic-demo
>  =C2=A0# jailhouse cell linux /etc/jailhouse/qemu-arm64-linux-demo.cell \
>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 /boot/vm=
linuz* \
>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 -d /etc/=
jailhouse/dts/inmate-qemu-arm64.dtb \
>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 -i /usr/=
libexec/jailhouse/demos/rootfs.cpio \
>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 -c "cons=
ole=3DttyAMA0 ip=3D192.168.19.2"
>  =C2=A0# ssh 192.168.19.2
>  =C2=A0# jailhouse disable
>=20
> The programs included with the Debian GNU/Linux system are free software;
> the exact distribution terms for each program are described in the
> individual files in /usr/share/doc/*/copyright.
>=20
> Debian GNU/Linux comes with ABSOLUTELY NO WARRANTY, to the extent
> permitted by applicable law.
> *Then I open new terminal and try to ssh but it shows time out, why I=20
> cannot ssh the address given. Due to this failure I was unable to=20
> control one console terminal from the other and create two cells=20
> gic-demo and linux demo. How can I create two cell so that I can run=20
> application in One and Linux in another? please help me with this. I'm=20
> trying for nearly one month but I was unable to do this.*

Which of the commands above did you run, besides ssh?

Jan

--=20
Siemens AG, Corporate Technology, CT RDA IOT SES-DE
Corporate Competence Center Embedded Linux

--=20
You received this message because you are subscribed to the Google Groups "=
Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/=
jailhouse-dev/3f685f85-d1ba-4619-6d0a-06b6b675c60f%40siemens.com.
