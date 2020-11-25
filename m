Return-Path: <jailhouse-dev+bncBCJI7SMNV4NBBKPO7D6QKGQEXKYEBYI@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-lf1-x137.google.com (mail-lf1-x137.google.com [IPv6:2a00:1450:4864:20::137])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C5852C3E70
	for <lists+jailhouse-dev@lfdr.de>; Wed, 25 Nov 2020 11:51:22 +0100 (CET)
Received: by mail-lf1-x137.google.com with SMTP id g186sf696973lfd.8
        for <lists+jailhouse-dev@lfdr.de>; Wed, 25 Nov 2020 02:51:22 -0800 (PST)
ARC-Seal: i=2; a=rsa-sha256; t=1606301481; cv=pass;
        d=google.com; s=arc-20160816;
        b=Jg36t7h1NC/k44m/95dCQzi4a5eoqjNaFtT04Vsprr1uyjm/1nxZzB6NtS118Av5iJ
         ssnRGQ6f2+lkHALw16io9SiWjux1yObj07sUqyli4BWGSZkXP3ns+TunKghxzmMuCr6I
         qErFmPGjyY/nip1h2hIL8/mPEShP6G/YvtCc6b4i94BB0FECeyTeO1B48zKuCFLZa2sC
         mtEyTLdW9w4Gt1pzOPdhGe9J4cRD3xr4jGyaPgxv4v0LS+34/QG4qO+be2eGcZTq4ZMH
         nERKoNT4MN2XFy2CQBvCZQoxrLhiIlB3D3uR6+Gv66qJxkZd1WY14NdumHStoWz9Jrpn
         sQiw==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:cc:to:subject:sender:dkim-signature;
        bh=zxIXhO6dI9zS/tQv6G7Hk8WsK5uHgNc8biRXoryw3qk=;
        b=do7NfrNPLA5dfM4RSP/38A/Vre7gCPZFwtWzlWz4wsFueSPx57qBOGo8XPTabkn31V
         +cAN8rjM3Ac+6Ui1V1yeK0V4IyxwfYQ1qvkf/DLwXfYM6rV2nREhEozB9rJf1k8O7Kas
         EyzQGItOOcDCO34lwmm5hZyDp4IuXtu2T+FFuEwf36HSmkQtaBA8iCrTrWNYryhR1vle
         +Y7Qbi8TVbGUcl/zBG5q6yVx6NJmSS6Ne0ToOg0W4oNIqmVAuXlgD0jDVZnj/3rDX5rG
         YZAkzfs/aKM8K2FCVmNeHo2ATDBd2oZZAO1fWGDF0APGhgadB/uogTRxpkcQE9T10b6C
         HIAA==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 194.138.37.39 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding
         :x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=zxIXhO6dI9zS/tQv6G7Hk8WsK5uHgNc8biRXoryw3qk=;
        b=WuO3Y6qSQy5VgyqYOS/CrlKm2UngauHAMhKXVC5fvmYwaYeDTYQWBDNvl0LPmqZzFI
         RnrxYwdGsJDJbVVf78gcKjnq+JaCg4vMuMzeiKegYHdhLV8tZEE9CPNJOPUF9iVis5VN
         //d5J0T4UFXElwEtOMn2SuHPe9IgmduYVMe7IBwmaVD6EXUwgMZoNqoDI8fDtJlwXrWr
         G/UfNk61J+V71P/9orAdfHEd9KiQ62oXhHQtJBYbW5MovLLI2GzJQ6otkgnoDEC67Uzv
         yPjyUCgJuBJZXkCV/7PHdlJWTdE4UKhU9UoquQpWDUOWrH4CsYww2F0PcKDivHs9nC4j
         01hw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:subject:to:cc:references:from:message-id
         :date:user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :x-spam-checked-in-group:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=zxIXhO6dI9zS/tQv6G7Hk8WsK5uHgNc8biRXoryw3qk=;
        b=Dv55mS0Otnb/GtePVAfqP54p78cvIjwW/z7Yx/MHx5SgpaVSZymLxFUV6aebGogVLZ
         sx2bQrNguQF9FzzA3uiunyEWqlU5Xw1Yep87QgmZB66rK5zrMNmgbgWpoTb13/B06ELw
         FFmDrRsMEeKktjdhgtpnu3Xjzt29OG6SKWW4Z0akzmtkMR+rLp7G6lw/GrErLuWrx1Qs
         crgc3fG/SVG+5AfKZsjPMQJmBdlo3K1ps1dnvpsIgqjAtfNNjpc/h+yFqsxw6YMpcwuc
         aDocbYTXjN5nZJkhyx6KbxKUvD4UW0uRAUXZpRV8bjN7vHML4llEHK1mHQPNoXTKGFsZ
         EC+g==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AOAM532ksAuaWgLGltXwhGtDyXRleCXE3fKCgKPQ06mfS5yQvU/zZzfx
	4XZZ5Gs6L0d5Xw/QnYQunbQ=
X-Google-Smtp-Source: ABdhPJx+PKCW2kxhIe1LkOt5ecGo2JPXphNsHz8HGtvaeGfzn46Zx5k6Ovn8VGXkBJuKWqMCgUDYRg==
X-Received: by 2002:a19:c18e:: with SMTP id r136mr1072260lff.423.1606301481803;
        Wed, 25 Nov 2020 02:51:21 -0800 (PST)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a2e:99da:: with SMTP id l26ls340665ljj.10.gmail; Wed, 25 Nov
 2020 02:51:20 -0800 (PST)
X-Received: by 2002:a2e:b5a4:: with SMTP id f4mr1101260ljn.94.1606301480657;
        Wed, 25 Nov 2020 02:51:20 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1606301480; cv=none;
        d=google.com; s=arc-20160816;
        b=u0+ZBq9G4ZRBayNIeZS509SErfTspYRLOZyAqywu33PNrRbeyYaaE7hFKjBFlzMNfR
         G0YrxUHvtSS1AGXJ4EBSLJitxPEiLlsN+noY4ovCamcz9K7DItji2jDZt1OVW0nY2FD4
         VvcYHP56xb1cz2TSNG/S22y4+qP1g/LNJ89FtXxxcGMBuH3fvO30mWw9go4TKz/OBBgG
         l0+OjPMOBKgFpkmQ+zNSmMwwfS5JgM3ut1VZl4M+y+xS17j7ob9C1ZpsE+7/Vd4RXkM6
         Mc0Vpgo5h5P91FTBYCFfU6n7c3VgLBH3D0LosTXMsdchOWQcWr8OY2Y6IlQVuYfcc18h
         8bDA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:cc:to:subject;
        bh=ZAtj5SDilRcp5kxkzbDQfq/ne/zxDzV44Bt8pazopUs=;
        b=pedh1XWohiK8Ts61vL0qv9TuTWOgJb9Lf5KcqcZgPOnLtdkYoIoR9I6IlJ6SrVVwq7
         QHcNMF3v0Z2V9+7Rjllkc1m1ijijHPQzV4bRF8L7A7edZhLesRorhN7562PKVogx2tZn
         NhxuWFNSLuB4B0TVg8xxKpZ9W88blM3AQE+T3iPm/mIOZi9MQ25h6G2XgmOoEHFpQ3gU
         o5C7Hy7eQzET9GnhUv4F9LDc166wvmnT3YCCMpMM94ZS4GuE3tZJN6pYO1a8DVCP7J85
         lCSGgx/0sXLvUe9lojZEF7Oq3JRnAZyUtiAYetGY+rdFPq+pAUA72BxcQ9xSSuA6iKgG
         R7zw==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 194.138.37.39 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
Received: from lizzard.sbs.de (lizzard.sbs.de. [194.138.37.39])
        by gmr-mx.google.com with ESMTPS id b26si35121lfc.12.2020.11.25.02.51.20
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 25 Nov 2020 02:51:20 -0800 (PST)
Received-SPF: pass (google.com: domain of jan.kiszka@siemens.com designates 194.138.37.39 as permitted sender) client-ip=194.138.37.39;
Received: from mail2.sbs.de (mail2.sbs.de [192.129.41.66])
	by lizzard.sbs.de (8.15.2/8.15.2) with ESMTPS id 0APApGo0003104
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 25 Nov 2020 11:51:17 +0100
Received: from [167.87.38.29] ([167.87.38.29])
	by mail2.sbs.de (8.15.2/8.15.2) with ESMTP id 0APApG6Z010319;
	Wed, 25 Nov 2020 11:51:16 +0100
Subject: Re: [PATCH 00/14] Cache-coloring for Jailhouse
To: Andrea Bastoni <andrea.bastoni@tum.de>, jailhouse-dev@googlegroups.com
Cc: marco.solieri@unimore.it, rmancuso@bu.edu, lucmiccio@gmail.com
References: <20201123204613.252563-1-andrea.bastoni@tum.de>
 <49bddd30-ded4-3264-813c-940fc11e2354@siemens.com>
 <50b3ceff-d68d-b6c0-f335-8cec4fa67305@tum.de>
From: Jan Kiszka <jan.kiszka@siemens.com>
Message-ID: <054fe4bd-e3ea-dfa5-c8aa-c3d2a2cad6fb@siemens.com>
Date: Wed, 25 Nov 2020 11:51:16 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.0
MIME-Version: 1.0
In-Reply-To: <50b3ceff-d68d-b6c0-f335-8cec4fa67305@tum.de>
Content-Type: text/plain; charset="UTF-8"
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

On 25.11.20 10:15, Andrea Bastoni wrote:
> On 25/11/2020 07:07, Jan Kiszka wrote:
>> On 23.11.20 21:45, Andrea Bastoni wrote:
>>> Hello Jan, hi all,
>>>
>>> As discussed a couple of weeks ago, here an updated version of the "cac=
he-coloring" for Jailhouse.
>>>
>>> A short recap on what's coloring (see Documentation/cache-coloring.md):
>>>> Cache coloring is a software technique that permits LLC partitioning,
>>>> therefore eliminating mutual core interference, and thus guaranteeing =
more
>>>> predictable performances for memory accesses.
>>>
>>> In this version of the patch, we've tried to keep the changes in the hy=
pervisor core minimal. Also, since coloring is something that should be tra=
nsparent to inmates/VM (coloring belongs to the IPA/PA hypervisor translati=
ons), the Linux driver has been only minimally modified.
>>>
>>> Coloring API
>>> ------------
>>>
>>> The patch adds a small architecture API layer that implements coloring.=
 The API is fully implemented only on arm64.  arm32 could be also a possibl=
e target for coloring, x86 already has CAT. Despite being implemented by on=
ly one architecture, having a small common API layer integrates IMHO better=
 than other solutions in the main code (without adding conditionally compil=
ed code).
>>>
>>> The API is:
>>>     arch_color_map_memory_region()   // cell_create
>>>         Color-maps the memory of the cell. Coloring requires multiple p=
asses to keep a contiguous VA, while "punching holes" in the PA according t=
o the allocated colors.
>>>
>>>     arch_color_unmap_memory_region() // cell_destroy
>>>         The opposite of create: search and give back each piece of colo=
red PA.
>>>
>>>     arch_color_remap_to_root()       // cell_load
>>>         Given that we don't want to modify the driver (i.e., we don't w=
ant the driver to do non-contiguous color-ioremap) we let the root cell bel=
ieve that the IPAs it is ioremapping are contiguous, but in reality the PA =
are non-contiguous (colored). This is currently done by using a very high V=
A (IPA) address as "base" for the load-remap-to-root-cell operation. This v=
alue is configuration dependent and can be specified in the root cell to av=
oid (unlikely) conflicts.
>>>
>>>     arch_color_unmap_from_root()     // cell_start
>>>         Returns the mapping setup by the cell_load to the root cell.
>>>
>>> Two APIs are implemented only by arm64:
>>>     arm_color_dcache_flush_memory_region()  // range flushing
>>>         Also flushing should be done in a "colored way".
>>>
>>>     arm_color_init()                        // hook for the initializat=
ion of coloring
>>>         Reads the parameters (size of the LLC way, base offset for the =
load-remapping operation) needed by coloring. There's also some debugging c=
ode to autodetect the cache-geometry and determine the size of the way.
>>>
>>> Configuration
>>> -------------
>>>
>>> From the configuration point of view, a colored memory region is a norm=
al memory region with a color attached. The color is expressed directly in =
the memory region as color-bitmask and the flag JAILHOUSE_MEM_COLORED is us=
ed to identify such a region. Contiguous bits in the bitmask identify a col=
or (region) to be used for the memory region. The size of the mapping doesn=
't change due to coloring.
>>>
>>> For example, with 16 colors, a full way size is selected by 0xffff, whi=
le 1/4 of the way size is selected by 0x000f.
>>>
>>> (Note: we also experimented with a different version that defined separ=
ate "normal" and "colored" memory regions. The approach presented in this v=
ersion is more robust.)
>>>
>>> Main coloring "loop"
>>> --------------------
>>>
>>> The coloring APIs basically boil down to a loop that appropriately sele=
cts --according to the color-- the physical addresses where to perform a se=
lected operation. The selection is done efficiently with bit operations on =
the bitmask.
>>>
>>> An alternative approach is to hook coloring deep into the mapping funct=
ionalities of the hypervisor. Basically, all low level mapping functions su=
pport coloring, and the non-colored case becomes the "special case."
>>> This approach was not followed because to be implemented "cleanly", all=
 the architecture mapping APIs have to be extended to support coloring, but=
 only one-architecture then really implement it.
>>>
>>> Instead, the implemented approach to have an additional "coloring" API =
integrates more nicely. Additionally, coloring will be hopefully only a tra=
nsitory techniques (some years?) that could be eventually replaced by hardw=
are-based techniques (e.g., MPAM). When this happens, removing the addition=
al coloring API requires less rework than the other approach.
>>>
>>>
>>> Debugging Code
>>> --------------
>>>
>>> The patches also provide a "debugging-only" code that can be activated =
by defining CONFIG_DEBUG (it sounded more Jailhouse-oriented than NDEBUG). =
In debugging mode, the coloring provides an autodetection for arm64 cache g=
eometry.
>>> Additionally, I've added an assert() function that can be used at runti=
me in debugging only contexts (could be used independently from coloring).
>>>
>>>
>>> Feedback and comments welcome.
>>>
>>> Best,
>>> Andrea
>>>
>>> Andrea Bastoni (12):
>>>   arm-common: bitops: add most-significant-bit operation
>>>   hypervisor, driver, archs: add basic empty infrastructure for colorin=
g
>>>   hypervisor: arm64: add cache coloring implementation
>>>   hypervisor configuration: hook autodetection for coloring_way_size
>>>   configs: arm64: add example configuration for colored ZCU102 inmate
>>>   hypervisor: protect inclusion of control.h
>>>   hypervisor, driver: add platform information to configure coloring
>>>     params
>>>   configs: arm64: hook-in coloring parameters for ZCU102
>>>   hypervisor: provide runtime assert() helper for DEBUG only
>>>   hypervisor: provide implementation for __assert_fail() and group
>>>     panic-related functions
>>>   hypervisor: coloring: use assert instead of "BUG"
>>>   hypervisor: coloring: make cache autodetection debug-only
>>>
>>> Luca Miccio (2):
>>>   Documentation: add description and usage of cache coloring support
>>>   pyjailhouse: add support for colored regions
>>>
>>>  Documentation/cache-coloring.md               | 198 ++++++++++++++++++
>>>  configs/arm64/zynqmp-zcu102-inmate-demo-col.c |  75 +++++++
>>>  configs/arm64/zynqmp-zcu102.c                 |   6 +
>>>  driver/cell.c                                 |  10 +-
>>>  driver/cell.h                                 |   1 +
>>>  driver/main.c                                 |  12 ++
>>>  hypervisor/Makefile                           |   2 +-
>>>  hypervisor/arch/arm-common/control.c          |   1 +
>>>  .../arch/arm-common/include/asm/bitops.h      |  10 +
>>>  .../arch/arm-common/include/asm/dcaches.h     |   8 +
>>>  hypervisor/arch/arm-common/mmu_cell.c         |  52 +++--
>>>  hypervisor/arch/arm/control.c                 |   1 +
>>>  hypervisor/arch/arm/include/asm/coloring.h    |  59 ++++++
>>>  hypervisor/arch/arm/traps.c                   |   1 +
>>>  hypervisor/arch/arm64/Kbuild                  |   5 +
>>>  hypervisor/arch/arm64/cache_layout.c          | 148 +++++++++++++
>>>  hypervisor/arch/arm64/coloring.c              | 184 ++++++++++++++++
>>>  hypervisor/arch/arm64/control.c               |   1 +
>>>  .../arch/arm64/include/asm/cache_layout.h     |  21 ++
>>>  hypervisor/arch/arm64/include/asm/coloring.h  | 137 ++++++++++++
>>>  hypervisor/arch/arm64/setup.c                 |   3 +
>>>  hypervisor/arch/arm64/traps.c                 |   1 +
>>>  hypervisor/arch/x86/amd_iommu.c               |   1 +
>>>  hypervisor/arch/x86/control.c                 |   1 +
>>>  hypervisor/arch/x86/efifb.c                   |   1 +
>>>  hypervisor/arch/x86/include/asm/coloring.h    |  45 ++++
>>>  hypervisor/arch/x86/ioapic.c                  |   1 +
>>>  hypervisor/arch/x86/svm.c                     |   1 +
>>>  hypervisor/arch/x86/vmx.c                     |   1 +
>>>  hypervisor/control.c                          | 111 ++++------
>>>  hypervisor/include/jailhouse/assert.h         |  37 ++++
>>>  hypervisor/include/jailhouse/control.h        |  34 +--
>>>  hypervisor/include/jailhouse/panic.h          |  40 ++++
>>>  hypervisor/include/jailhouse/printk.h         |   4 +
>>>  hypervisor/panic.c                            |  86 ++++++++
>>>  hypervisor/pci.c                              |   1 +
>>>  hypervisor/printk.c                           |   1 +
>>>  hypervisor/uart.c                             |   1 +
>>>  include/jailhouse/cell-config.h               |  11 +
>>>  pyjailhouse/config_parser.py                  |   9 +-
>>>  40 files changed, 1201 insertions(+), 121 deletions(-)
>>>  create mode 100644 Documentation/cache-coloring.md
>>>  create mode 100644 configs/arm64/zynqmp-zcu102-inmate-demo-col.c
>>>  create mode 100644 hypervisor/arch/arm/include/asm/coloring.h
>>>  create mode 100644 hypervisor/arch/arm64/cache_layout.c
>>>  create mode 100644 hypervisor/arch/arm64/coloring.c
>>>  create mode 100644 hypervisor/arch/arm64/include/asm/cache_layout.h
>>>  create mode 100644 hypervisor/arch/arm64/include/asm/coloring.h
>>>  create mode 100644 hypervisor/arch/x86/include/asm/coloring.h
>>>  create mode 100644 hypervisor/include/jailhouse/assert.h
>>>  create mode 100644 hypervisor/include/jailhouse/panic.h
>>>  create mode 100644 hypervisor/panic.c
>>>
>>
>> Thanks for the update! I assume it's functional and can be used in
>> tests? Asking as there seems to be a lot of debug code and comments.
>=20
> Yes, it is functional and it can be used for testing. I assumed this wasn=
't the
> final version, and the debug code + commented out code are still there in=
 the
> places where it can be useful to take a look to understand how the machin=
ery is
> working.
>=20
> I'm also interested in your point of view regarding having a CONFIG_DEBUG=
 option
> in Jailhouse. Basically a "debugging/development-enabled" version (with a=
ssert()
> and extra verbose output), and a "production" one.
>=20
>> Scanning through it, I still find it very arm64-centric, rather than
>=20
> It is. As mentioned, I don't know if it is meaningful to have a x86 versi=
on of
> the coloring, and for how long there will be the need to have coloring in
> software. So, the patches try to keep the changes in both hypervisor and =
driver
> to a minimum.

x86 might not be meaningful for modern CPUs with CAT, but it is another
test case. But I'm also thinking of RISC-V and what else might come along.

>=20
>> generically addressing the topic as I pointed out in previous reviews.
>> And keeping modifications of the driver minimal is not necessarily a
>> sign we are on the same page already.
>=20
> We've experimented also with a version that does "more" in the driver. I =
think
> that more changes in the driver only add complexity. In the end the hyper=
visor
> have to distinguish anyway between colored and non-colored mapping, and
> scattering the load logic between driver and hypervisor has more maintena=
nce
> effort than a single clean configuration parameter.

You are possibly right, it's just hard for me to follow this as there is
no code or more concrete design to prove that argument.

>=20
>> For testing purposes, please also include a QEMU configuration change in
>> the future. Helps validating things and playing the functional changes.
>=20
> OK.
>=20
>> The patch series should further more be structured in way that a static,
>> config-defined way-size can be used before any arch-specific
>> auto-detection logic is added.
>=20
> Sure. As said, I assumed that discussion was needed, but I think it's bet=
ter to
> discuss with a draft of how the code will look like.
>=20

On the one hand, discussion can be less effort than coding if everyone
can follow the arguments and this leads to a common view. On the other
hand, code has the advantage of make an even stronger argument as
everyone can see the results and compare, and can even do that in the
future when that topic pops up again for some reason.

Jan

--=20
Siemens AG, T RDA IOT
Corporate Competence Center Embedded Linux

--=20
You received this message because you are subscribed to the Google Groups "=
Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/=
jailhouse-dev/054fe4bd-e3ea-dfa5-c8aa-c3d2a2cad6fb%40siemens.com.
