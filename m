Return-Path: <jailhouse-dev+bncBCJI7SMNV4NBBZVS673QKGQEI422AOQ@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-lf1-x13c.google.com (mail-lf1-x13c.google.com [IPv6:2a00:1450:4864:20::13c])
	by mail.lfdr.de (Postfix) with ESMTPS id A5AB82123C2
	for <lists+jailhouse-dev@lfdr.de>; Thu,  2 Jul 2020 14:56:07 +0200 (CEST)
Received: by mail-lf1-x13c.google.com with SMTP id j5sf17985498lfc.15
        for <lists+jailhouse-dev@lfdr.de>; Thu, 02 Jul 2020 05:56:07 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1593694567; cv=pass;
        d=google.com; s=arc-20160816;
        b=A8EC5spUgUy5sd3CrtG8zXUaXhc8cwbzDmgnp2F40rSYBatFOePLSaa9qx/HeRxKlq
         T0XO6Hs8QRpqmHzeUNUL62oMsWFgRzgJBaajoITczPZi2agNDw1vKDxqYWOlA34qgHzu
         MLUHpatPwQ7plD9UQCr6eutx9P+BQQv9v+uGeQ4lSd5pYwJFRJvVHxel+4Yk8jhJKaqE
         ZsG5+XNMhdONO+1+Havm/0SKN17HPabOF9VZxRQeZgNbgQd+IgKlD/yCtpAmI71ekP5e
         4eDlE7cbza6lyve1/7NFnR91ZaYvMQToUdvtB7f8lwxo6n9sblvlj/wgl5fHNST0fftH
         45bA==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject:sender:dkim-signature;
        bh=lYHu5EDt8Rr7yjx6inCz/yFnq3FO5isSds0gz9PJpjk=;
        b=yAlb62S3VFqcitdZH1Bx9fYI0wmYKJtDHQjDVeh9kfK9fvK5Ibv411C6CdSCM7opwi
         1ZEPGGcy/ksQq4hozXIrBfGr9DRlInvVOFtQZB+f0SHDqaStufO1uL4VWRXk9vuj3Q3G
         ROJOCUb9jyMxc9FTqpXueuaaIr0vyMd0FXHvRkF0Z+gAdTeE5v+zVPr7D/8KOoHiQKKt
         jNhipstnantCu2qc7D84k8uPj/772lVnZzaUZ7Br14JU2Uqqo88J7nXopp4bUdF1P6sr
         6eTNkaa1M4W1W9qDErsOr5ydP40eJLFOfvOJasSYSEwHPJQJGWzKm1o65Z2CRk3wcvfd
         Uw0g==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 194.138.37.39 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:subject:to:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding
         :x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=lYHu5EDt8Rr7yjx6inCz/yFnq3FO5isSds0gz9PJpjk=;
        b=AwzPpb8KsgeUz64lje5a1GESV3T7C7VXP24B03mWAqzKttyF4V+/UyyKgZZjVXG4qp
         NtlAzCxmOV+FtlklqM3rXpRQ+r1JKjFJtCQ71xgh7hrq0dgVoy2rDU9EwKIXQeXZ9DBX
         eYoriSKM4n4/AW7tmcDBuoYm9SAOBs/VU7goCZp5ExKgDNtQ1B4gBcPPCCaBxoUWEfL+
         fn/FR89YdbyFu2EC09T9Wa4veqcdj/VsXAaSF4aD38cEYd1BEQ3NN4NGvXkWeAYN44J1
         WPpex/wAxlYJc+6Ccbq/aU27W5R0MaG9Ow0WCkhuV8qDoneV8t28Ykpi2r6X+7w9v1Ka
         yuZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:subject:to:references:from:message-id
         :date:user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :x-spam-checked-in-group:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=lYHu5EDt8Rr7yjx6inCz/yFnq3FO5isSds0gz9PJpjk=;
        b=dydJkFcapFAJfWKqzhRHNX+E/HzPUxFHq0TRCU3RM7gczGao7+tQRN9dvib9oarLn5
         +nHVKqC4JiOWhEqD+lsXK1yBow78KEB5Zdkkxx+dDwwbaMns3l3X3f2xR4PasRiM6BWZ
         7bMf2E4HVm28flQWEr3sVnhhhvD8QN0rBivs+w/O6txU3VFrzsExduzWRzAdeI+EIPHU
         ONrUCTvUpH+Y8OCDiOzv6sHY9BBxpAkDmSMKNaNWQkG3PY9TondU8cjrUfCfMjtWo6Xi
         5nFLRKp+xep7ctIyaZOLXefMZBTySGyeP0EH8Yw7g8P2wVmMB498Qibwv+C8nR1/P3gu
         vm8Q==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AOAM533/NGMlaIM/gwYh5xvjX0IFnxgCcBQH+bd3o4aEE+hXiRYTlvjr
	zZiSNyiXtPYyKiyUZ1Wd6Bw=
X-Google-Smtp-Source: ABdhPJxUiQmCnt+paQEAc81IVyrHMCYaY4W1PnxU7TbdNdtAytiOlpXmc3wD+kVRdB1WXLK6gMn0wQ==
X-Received: by 2002:a2e:8618:: with SMTP id a24mr16863315lji.302.1593694567132;
        Thu, 02 Jul 2020 05:56:07 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a2e:6e18:: with SMTP id j24ls1299604ljc.7.gmail; Thu, 02 Jul
 2020 05:56:06 -0700 (PDT)
X-Received: by 2002:a2e:8799:: with SMTP id n25mr9375725lji.416.1593694566280;
        Thu, 02 Jul 2020 05:56:06 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1593694566; cv=none;
        d=google.com; s=arc-20160816;
        b=TVfGVSQIOZYllCh3i7L7+auKvaWZMWKcPwziQ2tkys4s8u5PcaRcFu8QpsO1NqsXjk
         Rl9K3tiMMaABZ3KgiJRHv/9CNj0O35KHIhKpc3zlxIGYO/8uOvCj0ATZBId0rMJNyNu7
         oMXUtf/UTdsK8yzndUrbq9CxrZoYV98vwllT3P8fg8uLeuQsDudNP7/CJUSAk0rsCvw2
         JzT+aeJMmkyemvub0avJwA9NWnCYuBlkNBFevIE4YH98MV1k3v63/oFPxBKVculPRn7L
         N5hZDrUAzeiXJSgbRQ78zBSuGSAKHqqg+gPWj+qJoHRk9RhsRzOEOx2mEL46zpdxAU4f
         Jvlw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:to:subject;
        bh=D2v8VNeWnoOC75Hg2OD3uEFAeIdXOrrMzomvNNicBAM=;
        b=T94CuXh1tPqO8WMOA0mw3TofAxmcIZtm6r4TVmphWkHI7K0p/nEX1Y5e5ZZ4/sUW46
         fr6oAWP07RtxphJAnjNkEGCBFSAzfobOYYmiLSZwsmoC7437CGXCYumeuWhSC3ahYV56
         c0tnX4/bgRYxghVrZrCS3w0RWTgpRUB6sq6GjQBIEKD4iYZWBGOEzOtQ3VJNO6d+5WV/
         iv+PBgXMj+el0/rNRybx4S0SxhNSNIXLcVlblxuRE5f2eR5ZJm6g99IUYjLAhR0HtNiW
         yazadZXARdv6UbUUXgI+eApHDYVodKYW2gneo3EYf4O3BrjU3EfmlzmrSIApIjVffTUY
         5aqQ==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 194.138.37.39 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
Received: from lizzard.sbs.de (lizzard.sbs.de. [194.138.37.39])
        by gmr-mx.google.com with ESMTPS id i66si177390lji.4.2020.07.02.05.56.04
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 02 Jul 2020 05:56:05 -0700 (PDT)
Received-SPF: pass (google.com: domain of jan.kiszka@siemens.com designates 194.138.37.39 as permitted sender) client-ip=194.138.37.39;
Received: from mail2.sbs.de (mail2.sbs.de [192.129.41.66])
	by lizzard.sbs.de (8.15.2/8.15.2) with ESMTPS id 062Cu4Bs019795
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 2 Jul 2020 14:56:04 +0200
Received: from [167.87.6.55] ([167.87.6.55])
	by mail2.sbs.de (8.15.2/8.15.2) with ESMTP id 062Cu33t020759;
	Thu, 2 Jul 2020 14:56:04 +0200
Subject: Re: Need help to run Linux in non-root cell
To: Moritz Walker <moritzwalker@live.com>,
        "jailhouse-dev@googlegroups.com" <jailhouse-dev@googlegroups.com>
References: <AM0PR07MB54269B1C7307A5B79790C05FB26D0@AM0PR07MB5426.eurprd07.prod.outlook.com>
From: Jan Kiszka <jan.kiszka@siemens.com>
Message-ID: <8ab1063f-b7f6-3a1e-9d48-6e99e6104a3a@siemens.com>
Date: Thu, 2 Jul 2020 14:56:03 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.9.0
MIME-Version: 1.0
In-Reply-To: <AM0PR07MB54269B1C7307A5B79790C05FB26D0@AM0PR07MB5426.eurprd07.prod.outlook.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable
X-Original-Sender: jan.kiszka@siemens.com
X-Original-Authentication-Results: gmr-mx.google.com;       spf=pass
 (google.com: domain of jan.kiszka@siemens.com designates 194.138.37.39 as
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

On 02.07.20 14:04, Moritz Walker wrote:
> Hello,
>=20
> I need help to run Linux (queues/jailhouse branch) in a non-root cell on=
=20
> AMD. Root-cell and apic-demo both work fine.
> To run the root-cell i run the /jailhouse enable=20
> configs/x86/rootcell.cell/=C2=A0comman, which produces the following outp=
ut:
>=20
>=20
> Initializing Jailhouse hypervisor v0.12 (59-g4ce7658d-dirty) on CPU 1
> Code location: 0xfffffffff0000050
> Using xAPIC
> Page pool usage after early setup: mem 75/979, remap 1/131072
> Initializing processors:
>  =C2=A0CPU 1... (APIC ID 1) OK
> [...]
>  =C2=A0CPU 7... (APIC ID 5) OK
> Initializing unit: AMD IOMMU
> AMD IOMMU @0xfeb80000/0x80000
> Initializing unit: IOAPIC
> Initializing unit: PCI
> [...]
> Adding PCI device 31:00.0 to cell "RootCell"
> Page pool usage after late setup: mem 286/979, remap 16520/131072
> Activating hypervisor
>=20
>=20
> After that i use the command /jailhouse cell linux=20
> configs/x86/linux-x86-cell.cell ../linux/arch/x86/boot/bzImage -c=20
> "console=3DttyS0,9600"/
> to start the non-root linux cell. This writes the following output via UA=
RT:
>=20
>=20
> Adding virtual PCI device 00:0c.0 to cell "linux-x86-demo"
> Adding virtual PCI device 00:0d.0 to cell "linux-x86-demo"
> Adding virtual PCI device 00:0e.0 to cell "linux-x86-demo"
> Adding virtual PCI device 00:0f.0 to cell "linux-x86-demo"
> Created cell "linux-x86-demo"
> Page pool usage after cell creation: mem 343/979, remap 16520/131072
> IOMMU 0: Event Log overflow occurred, some events were lost!
> Cell "linux-x86-demo" can be loaded
> Started cell "linux-x86-demo"
> CPU 6 received SIPI, vector 100
> CPU 7 received SIPI, vector 100
> [ =C2=A0 =C2=A00.000000] Linux version 5.7.0-rc7+ (walker@wubuntu) (gcc v=
ersion=20
> 9.2.1 20191008 (Ubuntu 9.2.1-9ubuntu2), GNU ld (GNU Binutils for Ubuntu)=
=20
> 2.33) #2 SMP Wed Jul 1 12:28:55 CEST 2020
> [ =C2=A0 =C2=A00.000000] Command line: console=3DttyS0,9600
> [ =C2=A0 =C2=A00.000000] KERNEL supported cpus:
> [ =C2=A0 =C2=A00.000000] =C2=A0 Intel GenuineIntel
> [ =C2=A0 =C2=A00.000000] =C2=A0 AMD AuthenticAMD
> [ =C2=A0 =C2=A00.000000] =C2=A0 Hygon HygonGenuine
> [ =C2=A0 =C2=A00.000000] =C2=A0 Centaur CentaurHauls
> [ =C2=A0 =C2=A00.000000] =C2=A0 zhaoxin =C2=A0 Shanghai
> [ =C2=A0 =C2=A00.000000] x86/fpu: Supporting XSAVE feature 0x001: 'x87 fl=
oating=20
> point registers'
> [ =C2=A0 =C2=A00.000000] x86/fpu: Supporting XSAVE feature 0x002: 'SSE re=
gisters'
> [ =C2=A0 =C2=A00.000000] x86/fpu: Supporting XSAVE feature 0x004: 'AVX re=
gisters'
> [ =C2=A0 =C2=A00.000000] x86/fpu: xstate_offset[2]: =C2=A0576, xstate_siz=
es[2]: =C2=A0256
> [ =C2=A0 =C2=A00.000000] x86/fpu: Enabled xstate features 0x7, context si=
ze is 832=20
> bytes, using 'compacted' format.
> [ =C2=A0 =C2=A00.000000] BIOS-provided physical RAM map:
> [ =C2=A0 =C2=A00.000000] BIOS-e820: [mem 0x0000000000000000-0x00000000000=
fffff] usable
> [ =C2=A0 =C2=A00.000000] BIOS-e820: [mem 0x0000000000100000-0x00000000001=
00fff]=20
> reserved
> [ =C2=A0 =C2=A00.000000] BIOS-e820: [mem 0x0000000000200000-0x00000000048=
fffff] usable
> [ =C2=A0 =C2=A00.000000] NX (Execute Disable) protection: active
> [ =C2=A0 =C2=A00.000000] extended physical RAM map:
> [ =C2=A0 =C2=A00.000000] reserve setup_data: [mem=20
> 0x0000000000000000-0x0000000000001fff] usable
> [ =C2=A0 =C2=A00.000000] reserve setup_data: [mem=20
> 0x0000000000002000-0x000000000000212b] usable
> [ =C2=A0 =C2=A00.000000] reserve setup_data: [mem=20
> 0x000000000000212c-0x00000000000fffff] usable
> [ =C2=A0 =C2=A00.000000] reserve setup_data: [mem=20
> 0x0000000000100000-0x0000000000100fff] reserved
> [ =C2=A0 =C2=A00.000000] reserve setup_data: [mem=20
> 0x0000000000200000-0x00000000048fffff] usable
> [ =C2=A0 =C2=A00.000000] DMI not present or invalid.
> [ =C2=A0 =C2=A00.000000] Hypervisor detected: Jailhouse
> [ =C2=A0 =C2=A00.000000] tsc: Detected 3599.999 MHz processor
> [ =C2=A0 =C2=A00.000016] last_pfn =3D 0x4900 max_arch_pfn =3D 0x400000000
> [ =C2=A0 =C2=A00.000863] x86/PAT: Configuration [0-7]: WB =C2=A0WC =C2=A0=
UC- UC =C2=A0WB =C2=A0WP =C2=A0UC- WT
> [ =C2=A0 =C2=A00.001075] total RAM covered: 3583M
> [ =C2=A0 =C2=A00.001273] Found optimal setting for mtrr clean up
> [ =C2=A0 =C2=A00.001275] =C2=A0gran_size: 64K chunk_size: 64M num_reg: 4 =
=C2=A0 lose cover=20
> RAM: 0G
> [ =C2=A0 =C2=A00.007671] check: Scanning 1 areas for low memory corruptio=
n
> [ =C2=A0 =C2=A00.007677] Using GB pages for direct mapping
> [ =C2=A0 =C2=A00.007943] No NUMA configuration found
> [ =C2=A0 =C2=A00.007944] Faking a node at [mem 0x0000000000000000-0x00000=
000048fffff]
> [ =C2=A0 =C2=A00.007954] NODE_DATA(0) allocated [mem 0x048d5000-0x048ffff=
f]
> [ =C2=A0 =C2=A00.008371] Zone ranges:
> [ =C2=A0 =C2=A00.008372] =C2=A0 DMA =C2=A0 =C2=A0 =C2=A0[mem 0x0000000000=
001000-0x0000000000ffffff]
> [ =C2=A0 =C2=A00.008374] =C2=A0 DMA32 =C2=A0 =C2=A0[mem 0x000000000100000=
0-0x00000000048fffff]
> [ =C2=A0 =C2=A00.008375] =C2=A0 Normal =C2=A0 empty
> [ =C2=A0 =C2=A00.008376] =C2=A0 Device =C2=A0 empty
> [ =C2=A0 =C2=A00.008377] Movable zone start for each node
> [ =C2=A0 =C2=A00.008381] Early memory node ranges
> [ =C2=A0 =C2=A00.008383] =C2=A0 node =C2=A0 0: [mem 0x0000000000001000-0x=
000000000009ffff]
> [ =C2=A0 =C2=A00.008384] =C2=A0 node =C2=A0 0: [mem 0x0000000000200000-0x=
00000000048fffff]
> [ =C2=A0 =C2=A00.008546] Zeroed struct page in unavailable ranges: 14433 =
pages
> [ =C2=A0 =C2=A00.008547] Initmem setup node 0 [mem=20
> 0x0000000000001000-0x00000000048fffff]
> [ =C2=A0 =C2=A00.008887] SFI: Simple Firmware Interface v0.81=20
> http://simplefirmware.org
> [ =C2=A0 =C2=A00.008957] IOAPIC[0]: apic_id 0, version 33, address 0xfec0=
0000, GSI=20
> 0-23
> [ =C2=A0 =C2=A00.008959] smpboot: Allowing 2 CPUs, 0 hotplug CPUs
> [ =C2=A0 =C2=A00.008968] PM: hibernation: Registered nosave memory: [mem=
=20
> 0x00000000-0x00000fff]
> [ =C2=A0 =C2=A00.008969] PM: hibernation: Registered nosave memory: [mem=
=20
> 0x00002000-0x00002fff]
> [ =C2=A0 =C2=A00.008971] PM: hibernation: Registered nosave memory: [mem=
=20
> 0x000a0000-0x000fffff]
> [ =C2=A0 =C2=A00.008972] PM: hibernation: Registered nosave memory: [mem=
=20
> 0x00100000-0x00100fff]
> [ =C2=A0 =C2=A00.008973] PM: hibernation: Registered nosave memory: [mem=
=20
> 0x00101000-0x001fffff]
> [ =C2=A0 =C2=A00.008975] [mem 0x04900000-0xffffffff] available for PCI de=
vices
> [ =C2=A0 =C2=A00.008976] Booting paravirtualized kernel on bare hardware
> [ =C2=A0 =C2=A00.008980] clocksource: refined-jiffies: mask: 0xffffffff=
=20
> max_cycles: 0xffffffff, max_idle_ns: 1910969940391419 ns
> [ =C2=A0 =C2=A00.008985] setup_percpu: NR_CPUS:8192 nr_cpumask_bits:2 nr_=
cpu_ids:2=20
> nr_node_ids:1
> [ =C2=A0 =C2=A00.009399] percpu: Embedded 56 pages/cpu s192512 r8192 d286=
72 u1048576
> [ =C2=A0 =C2=A00.009426] Built 1 zonelists, mobility grouping on. =C2=A0T=
otal pages: 18026
> [ =C2=A0 =C2=A00.009427] Policy zone: DMA32
> [ =C2=A0 =C2=A00.009428] Kernel command line: console=3DttyS0,9600
> [ =C2=A0 =C2=A00.009468] Dentry cache hash table entries: 16384 (order: 5=
, 131072=20
> bytes, linear)
> [ =C2=A0 =C2=A00.009478] Inode-cache hash table entries: 8192 (order: 4, =
65536=20
> bytes, linear)
> [ =C2=A0 =C2=A00.009498] mem auto-init: stack:off, heap alloc:on, heap fr=
ee:off
> [ =C2=A0 =C2=A00.009620] Memory: 37524K/73340K available (14339K kernel c=
ode,=20
> 2386K rwdata, 5020K rodata, 2480K init, 5240K bss, 35816K reserved, 0K
> [ =C2=A0 =C2=A00.009629] random: get_random_u64 called from=20
> __kmem_cache_create+0x42/0x540 with crng_init=3D0
> [ =C2=A0 =C2=A00.009763] SLUB: HWalign=3D64, Order=3D0-3, MinObjects=3D0,=
 CPUs=3D2, Nodes=3D1
> [ =C2=A0 =C2=A00.009779] ftrace: allocating 43599 entries in 171 pages
> [ =C2=A0 =C2=A00.028212] ftrace: allocated 171 pages with 5 groups
> [ =C2=A0 =C2=A00.028311] rcu: Hierarchical RCU implementation.
> [ =C2=A0 =C2=A00.028312] rcu: RCU restricting CPUs from NR_CPUS=3D8192 to=
 nr_cpu_ids=3D2.
> [ =C2=A0 =C2=A00.028314] Tasks RCU enabled.
> [ =C2=A0 =C2=A00.028315] rcu: RCU calculated value of scheduler-enlistmen=
t delay=20
> is 100 jiffies.
> [ =C2=A0 =C2=A00.028316] rcu: Adjusting geometry for rcu_fanout_leaf=3D16=
, nr_cpu_ids=3D2
> [ =C2=A0 =C2=A00.031885] NR_IRQS: 524544, nr_irqs: 424, preallocated irqs=
: 0
> [ =C2=A0 =C2=A00.032007] random: crng done (trusting CPU's manufacturer)
> [ =C2=A0 =C2=A00.032029] Console: colour dummy device 80x25
> [ =C2=A0 =C2=A00.032031] Enabling UART0 (port 0x3f8)
> [ =C2=A0 =C2=A05.771306] printk: console [ttyS0] enabled
> [ =C2=A0 =C2=A05.820808] APIC: Switch to symmetric I/O mode setup
> [ =C2=A0 =C2=A05.879554] Switched APIC routing to physical flat.
> FATAL: Setting invalid LVT delivery mode (reg 35, value 00000700)
> FATAL: Unhandled APIC access, offset 848, is_write: 1

Smells like a regression in that branch for non-root Linux. Is that=20
562b04e51bb5e2f04bf175383080333237067c63? Can you share you kernel config?

> RIP: 0xffffffffab671f72 RSP: 0xffffffffacc03e40 FLAGS: 246
> RAX: 0xffffffffab671f70 RBX: 0x0000000000000180 RCX: 0x0000000000000000
> RDX: 0x0000000000000000 RSI: 0x0000000000000700 RDI: 0x0000000000000350
> CS: 10 BASE: 0x0000000000000000 AR-BYTES: 29b EFER.LMA 1
> CR0: 0x0000000080050033 CR3: 0x000000000260a000 CR4: 0x00000000000406b0
> EFER: 0x0000000000001d01
> Parking CPU 6 (Cell: "linux-x86-demo")
>=20
>=20
> Furthermore, if i try to attach an initrd.image
> (generated according to=20
> http://www.aclevername.com/articles/linux-xilinx-tutorial/minimalist-init=
ramfs.html)=20
> to the
> command via -i, the following error occurs:
>=20
>=20
> File "/usr/local/libexec/jailhouse/jailhouse-cell-linux", line 744, in=20
> <module>
> cell.load(args.initrd.read(), arch.ramdisk_adress())
> IOError: [Errno 22] Invalid argument
>=20

Possibly too large. Check if the one from jailhouse-images works (it's=20
small). Also check if that kernel works for you (older baseline).

>=20
> Now my question are:
>=20
>  1.  =C2=A0How to configure the non-root linux cell correctly?
>  2.  =C2=A0How to boot up a minimal initrd?
>  3.  =C2=A0How to compleletey boot a minimal linux distribution?
>=20
> Please kindly find the attached configuration files (.config,=20
> rootcell.c, linux-x86-cell.c).
> Any help would be highly appreciated.
>

First reference point is always=20
https://github.com/siemens/jailhouse-images, and then we can look for=20
the delta that breaks things.

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
jailhouse-dev/8ab1063f-b7f6-3a1e-9d48-6e99e6104a3a%40siemens.com.
