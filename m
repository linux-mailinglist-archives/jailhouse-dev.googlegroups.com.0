Return-Path: <jailhouse-dev+bncBCJI7SMNV4NBBZMR6H7QKGQEXEGDWWI@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-lf1-x13c.google.com (mail-lf1-x13c.google.com [IPv6:2a00:1450:4864:20::13c])
	by mail.lfdr.de (Postfix) with ESMTPS id 89E792F128A
	for <lists+jailhouse-dev@lfdr.de>; Mon, 11 Jan 2021 13:47:34 +0100 (CET)
Received: by mail-lf1-x13c.google.com with SMTP id t194sf11436260lff.15
        for <lists+jailhouse-dev@lfdr.de>; Mon, 11 Jan 2021 04:47:34 -0800 (PST)
ARC-Seal: i=2; a=rsa-sha256; t=1610369254; cv=pass;
        d=google.com; s=arc-20160816;
        b=lh3vSgqqZ7Nrwq2tGyTmkX1ah5ll8oi5w7WYUVjjHQSEBTWz+uqOn/2iOmIS3FOMfP
         QIHsso77jQTcDouBfIuTVJrECry6uPx9QHB6Y/Khi1cJ+XzX768FLmwmWUzUYQ2lwrwf
         mbhY17FLO3+rTvQDRZYcZ8y6Yn53VbP5adiRvUAG16KraLySjTu/JtBzZY7evuTAsCMU
         coHRrXWtZd3ueaT2/1cHeDmWeZKP+eRCoHaMW8X6nfUk0weRSGpEuXxwDn1N6lkp936J
         Ktc2dfGVF6FxRN7zL061GeVH6URBWLvns5B54JK8XUJFg1Ycs3pHlpcIWQNuekLZLcV3
         3Atg==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:cc:to:subject:sender:dkim-signature;
        bh=7QG96OiRnr7Wn3O5dHGrD2HcgIyBZ2Q/XwSt9Cwb/kk=;
        b=HkGkeIJX4pjwPrlChe34TRrgNikeij5ZYIiEyeD+dQ/I8l3SuUZbqByoQ9m12j4NMa
         YaOD3w3AsRsEpDqA/oq4HPPPNV+ZPWzGjcm4jHjsQTbhxi/z7/MI/3qierjQ2mF7qdjf
         6fabSSW5D5bU8gTEm5xzHaXqwGK3MIDuMmxTeiO8t816Y406QnJJRBSy3fgN7zHG7sSp
         9kcL8Z/j6Z1VFNrCyBYgk/rcBWdijYHxQL/ycp2Y/1EkyX+kmU+Li1CiFXoCNbb0mMcx
         NCwIzlyluKV2DlWwBxnHveXZ5vg3OwuFr6lv5MjS78c6HZR258Pei+f4dBDB4Dp3bQ5z
         HBiA==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.14 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding
         :x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=7QG96OiRnr7Wn3O5dHGrD2HcgIyBZ2Q/XwSt9Cwb/kk=;
        b=tf9DD65ZnaG6IK3UjwDy/ExvspN6AjjR7PS7TsE79ynIT6gPFiMeSitt7jiu9g+9x5
         /+NAJN82RxjxvkHRj5QxG6B7yRP/C8jYbl2moJf+OYBALxmGUzfmRGYUT+BzQcMJNdQa
         /8raq3swVZuCRkf+jVNH8kLKs0mwH1f4+MSzyfBffctwVTXdSIySGK4RUAoTCKCgQHO8
         6TyBRD6QS1fU1NcS/+ajlAyaQXJCyusT1sQYrglcotLKW+csthbF0v+fePJMNwy/IlZn
         OIAObtsdSxoIWuBULqoiKx4qU6KeIgs7TDf1P6z4nEcDr9PNdTBtTzIMyhC4rHqzNPs3
         OOKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:subject:to:cc:references:from:message-id
         :date:user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :x-spam-checked-in-group:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=7QG96OiRnr7Wn3O5dHGrD2HcgIyBZ2Q/XwSt9Cwb/kk=;
        b=e1OE/VKcw851HDmvzRaBr3zH+KcwhxUUemBD/Tydb8sq0g8z2eVLOtOW6Fr5OKkAVZ
         drrPq09BwFnxqGQM41015DZHby87MzVnPPAtQGAGP03oscc7hIbR7TuHC2QzZRPzY052
         KUPXnCLheMnhpCOcSOfQVFXCsdc7SE2rCq9w7EXJzIIpcHZADWDM/t2dwl4P4Rfw2RYt
         X1KE3WLEqWnY6j6rO+WH9OhRDG38ZtDjTtE7ixvWi3dbyGopfPy+Z494SaTzmkjWbeLf
         pVN2tXiBGZIIHQH1z2xlbbW/NXe4wq8rwPTVE/6xxlb7v4JLUa54i+mym7qVIl44W3M/
         RBgw==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AOAM533gJ9SADlM0Pfae4MtetYg6gIc24xz2FY22EI1xvz2pmsitUMHz
	EAo6SnZ/+ymBRfhrouDqd4E=
X-Google-Smtp-Source: ABdhPJzLYODV6nnAw6QavHQ3KoXqgPrizqt5NRy6uJC2Oq8H4i1NTxscDF5p5sFtwFW4tN5l1nDNow==
X-Received: by 2002:a2e:914d:: with SMTP id q13mr7135044ljg.205.1610369254063;
        Mon, 11 Jan 2021 04:47:34 -0800 (PST)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a2e:7806:: with SMTP id t6ls2916196ljc.8.gmail; Mon, 11 Jan
 2021 04:47:32 -0800 (PST)
X-Received: by 2002:a2e:9985:: with SMTP id w5mr7560282lji.122.1610369252879;
        Mon, 11 Jan 2021 04:47:32 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1610369252; cv=none;
        d=google.com; s=arc-20160816;
        b=QtSuwGLSj2TKP0Wl1ejo7Etd5DSa+MfBIgHdqL9X4AGdT/N5Guik4CGZaLw2UW732c
         KV6dHKC9bS826RF3liwEkQl1xCvLYTPLaAMUO5e9yY7J8ygYnlftsD7kcgSwwrVw2NUY
         oD/6o+Cc1wJ4MWMoLxm8X7TsF7aTy/LzmzH+7l447XzU5MLUoUSaQ3GbXxZuPQ87GDHE
         VvnmhrvQAAeOOnMUjU/QvFa0TnEde/4w9acYWHa/bb4kS+iTj9SzmA5FQG3SWTPqlxj1
         VEOY3XnsWAIHtEN2XszHpbK46iM3+Tt0O8vCZZVXovBjdaKeijHpRGE5/3m1W50AOjqC
         3TGA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:cc:to:subject;
        bh=mvT5qejktdqIDUlgw8/2vcq0WtgcDP8mt87ju2oqfrc=;
        b=cG4ou2Sjb3PjhMurooPZpvt2gawibqcjRaNd6s8p3an9nwtOKvd9+vcg8IOBgJqVBh
         ppFb8neiwrzmK/uVTj6ZANzqHFaHYtW/FyohJ8EHdbBnm/7FLGDcitrrQ98Repu9bUZN
         MRIs9y3vgtW7EeWrbfYXPE2aqmJN+N0MciRSw6ngJNt+/ZwzLw/UJK5pxZXSLt66zw19
         p9i1VbaDXpSVc0K1nl+lSZESudltTRtzkBTp6qhvKwX5H5B0MO9EPhPknyFBsLUa2GSu
         QLQVw2Lsw81Otq+G8Hc0v9yoDBFB59KB2OO4DOnRtXEaLwwBpEAvCGGN214U2KzBdah1
         +Iog==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.14 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
Received: from david.siemens.de (david.siemens.de. [192.35.17.14])
        by gmr-mx.google.com with ESMTPS id a136si599171lfd.5.2021.01.11.04.47.32
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 11 Jan 2021 04:47:32 -0800 (PST)
Received-SPF: pass (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.14 as permitted sender) client-ip=192.35.17.14;
Received: from mail2.sbs.de (mail2.sbs.de [192.129.41.66])
	by david.siemens.de (8.15.2/8.15.2) with ESMTPS id 10BClTHI017658
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 11 Jan 2021 13:47:29 +0100
Received: from [167.87.43.185] ([167.87.43.185])
	by mail2.sbs.de (8.15.2/8.15.2) with ESMTP id 10BClQxA023306;
	Mon, 11 Jan 2021 13:47:27 +0100
Subject: Re: [PATCH 00/14] Cache-coloring for Jailhouse
To: Andrea Bastoni <andrea.bastoni@tum.de>, jailhouse-dev@googlegroups.com
Cc: marco.solieri@unimore.it, rmancuso@bu.edu, lucmiccio@gmail.com
References: <20201123204613.252563-1-andrea.bastoni@tum.de>
 <49bddd30-ded4-3264-813c-940fc11e2354@siemens.com>
 <50b3ceff-d68d-b6c0-f335-8cec4fa67305@tum.de>
 <054fe4bd-e3ea-dfa5-c8aa-c3d2a2cad6fb@siemens.com>
 <6af26a83-8be5-0317-92c6-ffcdf636375a@tum.de>
 <085d4dfc-b4ca-a421-4f04-a04eb0d43e9c@siemens.com>
 <6d17ea6d-8696-1fb3-6c67-93a1fc856b12@siemens.com>
 <65629141-28b5-4153-7547-cfb58b22baff@tum.de>
 <9b88eab8-859b-d54b-ba2d-40395c5e1828@siemens.com>
 <fc33efe0-deec-95cf-1fda-7f03dabac6fa@tum.de>
From: Jan Kiszka <jan.kiszka@siemens.com>
Message-ID: <f7777383-0a65-16c3-25d2-fbf38789f9de@siemens.com>
Date: Mon, 11 Jan 2021 13:47:26 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
MIME-Version: 1.0
In-Reply-To: <fc33efe0-deec-95cf-1fda-7f03dabac6fa@tum.de>
Content-Type: text/plain; charset="UTF-8"
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable
X-Original-Sender: jan.kiszka@siemens.com
X-Original-Authentication-Results: gmr-mx.google.com;       spf=pass
 (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.14 as
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

On 11.01.21 13:33, Andrea Bastoni wrote:
> On 11/01/2021 12:46, Jan Kiszka wrote:
>> On 11.01.21 12:21, Andrea Bastoni wrote:
>>> Hi Jan,
>>>
>>> On 11/01/2021 08:36, Jan Kiszka wrote:
>>>> On 25.11.20 17:12, Jan Kiszka wrote:
>>>>> On 25.11.20 16:59, Andrea Bastoni wrote:
>>>>>> On 25/11/2020 11:51, Jan Kiszka wrote:
>>>>>>> On 25.11.20 10:15, Andrea Bastoni wrote:
>>>>>>>> On 25/11/2020 07:07, Jan Kiszka wrote:
>>>>>>>>> On 23.11.20 21:45, Andrea Bastoni wrote:
>>>>>>>>>> Hello Jan, hi all,
>>>>>>>>>>
>>>>>>>>>> As discussed a couple of weeks ago, here an updated version of t=
he "cache-coloring" for Jailhouse.
>>>>>>>>>>
>>>>>>>>>> A short recap on what's coloring (see Documentation/cache-colori=
ng.md):
>>>>>>>>>>> Cache coloring is a software technique that permits LLC partiti=
oning,
>>>>>>>>>>> therefore eliminating mutual core interference, and thus guaran=
teeing more
>>>>>>>>>>> predictable performances for memory accesses.
>>>>>>>>>>
>>>>>>>>>> In this version of the patch, we've tried to keep the changes in=
 the hypervisor core minimal. Also, since coloring is something that should=
 be transparent to inmates/VM (coloring belongs to the IPA/PA hypervisor tr=
anslations), the Linux driver has been only minimally modified.
>>>>>>>>>>
>>>>>>>>>> Coloring API
>>>>>>>>>> ------------
>>>>>>>>>>
>>>>>>>>>> The patch adds a small architecture API layer that implements co=
loring. The API is fully implemented only on arm64.  arm32 could be also a =
possible target for coloring, x86 already has CAT. Despite being implemente=
d by only one architecture, having a small common API layer integrates IMHO=
 better than other solutions in the main code (without adding conditionally=
 compiled code).
>>>>>>>>>>
>>>>>>>>>> The API is:
>>>>>>>>>>     arch_color_map_memory_region()   // cell_create
>>>>>>>>>>         Color-maps the memory of the cell. Coloring requires mul=
tiple passes to keep a contiguous VA, while "punching holes" in the PA acco=
rding to the allocated colors.
>>>>>>>>>>
>>>>>>>>>>     arch_color_unmap_memory_region() // cell_destroy
>>>>>>>>>>         The opposite of create: search and give back each piece =
of colored PA.
>>>>>>>>>>
>>>>>>>>>>     arch_color_remap_to_root()       // cell_load
>>>>>>>>>>         Given that we don't want to modify the driver (i.e., we =
don't want the driver to do non-contiguous color-ioremap) we let the root c=
ell believe that the IPAs it is ioremapping are contiguous, but in reality =
the PA are non-contiguous (colored). This is currently done by using a very=
 high VA (IPA) address as "base" for the load-remap-to-root-cell operation.=
 This value is configuration dependent and can be specified in the root cel=
l to avoid (unlikely) conflicts.
>>>>>>>>>>
>>>>>>>>>>     arch_color_unmap_from_root()     // cell_start
>>>>>>>>>>         Returns the mapping setup by the cell_load to the root c=
ell.
>>>>>>>>>>
>>>>>>>>>> Two APIs are implemented only by arm64:
>>>>>>>>>>     arm_color_dcache_flush_memory_region()  // range flushing
>>>>>>>>>>         Also flushing should be done in a "colored way".
>>>>>>>>>>
>>>>>>>>>>     arm_color_init()                        // hook for the init=
ialization of coloring
>>>>>>>>>>         Reads the parameters (size of the LLC way, base offset f=
or the load-remapping operation) needed by coloring. There's also some debu=
gging code to autodetect the cache-geometry and determine the size of the w=
ay.
>>>>>>>>>>
>>>>>>>>>> Configuration
>>>>>>>>>> -------------
>>>>>>>>>>
>>>>>>>>>> From the configuration point of view, a colored memory region is=
 a normal memory region with a color attached. The color is expressed direc=
tly in the memory region as color-bitmask and the flag JAILHOUSE_MEM_COLORE=
D is used to identify such a region. Contiguous bits in the bitmask identif=
y a color (region) to be used for the memory region. The size of the mappin=
g doesn't change due to coloring.
>>>>>>>>>>
>>>>>>>>>> For example, with 16 colors, a full way size is selected by 0xff=
ff, while 1/4 of the way size is selected by 0x000f.
>>>>>>>>>>
>>>>>>>>>> (Note: we also experimented with a different version that define=
d separate "normal" and "colored" memory regions. The approach presented in=
 this version is more robust.)
>>>>>>>>>>
>>>>>>>>>> Main coloring "loop"
>>>>>>>>>> --------------------
>>>>>>>>>>
>>>>>>>>>> The coloring APIs basically boil down to a loop that appropriate=
ly selects --according to the color-- the physical addresses where to perfo=
rm a selected operation. The selection is done efficiently with bit operati=
ons on the bitmask.
>>>>>>>>>>
>>>>>>>>>> An alternative approach is to hook coloring deep into the mappin=
g functionalities of the hypervisor. Basically, all low level mapping funct=
ions support coloring, and the non-colored case becomes the "special case."
>>>>>>>>>> This approach was not followed because to be implemented "cleanl=
y", all the architecture mapping APIs have to be extended to support colori=
ng, but only one-architecture then really implement it.
>>>>>>>>>>
>>>>>>>>>> Instead, the implemented approach to have an additional "colorin=
g" API integrates more nicely. Additionally, coloring will be hopefully onl=
y a transitory techniques (some years?) that could be eventually replaced b=
y hardware-based techniques (e.g., MPAM). When this happens, removing the a=
dditional coloring API requires less rework than the other approach.
>>>>>>>>>>
>>>>>>>>>>
>>>>>>>>>> Debugging Code
>>>>>>>>>> --------------
>>>>>>>>>>
>>>>>>>>>> The patches also provide a "debugging-only" code that can be act=
ivated by defining CONFIG_DEBUG (it sounded more Jailhouse-oriented than ND=
EBUG). In debugging mode, the coloring provides an autodetection for arm64 =
cache geometry.
>>>>>>>>>> Additionally, I've added an assert() function that can be used a=
t runtime in debugging only contexts (could be used independently from colo=
ring).
>>>>>>>>>>
>>>>>>>>>>
>>>>>>>>>> Feedback and comments welcome.
>>>>>>>>>>
>>>>>>>>>> Best,
>>>>>>>>>> Andrea
>>>>>>>>>>
>>>>>>>>>> Andrea Bastoni (12):
>>>>>>>>>>   arm-common: bitops: add most-significant-bit operation
>>>>>>>>>>   hypervisor, driver, archs: add basic empty infrastructure for =
coloring
>>>>>>>>>>   hypervisor: arm64: add cache coloring implementation
>>>>>>>>>>   hypervisor configuration: hook autodetection for coloring_way_=
size
>>>>>>>>>>   configs: arm64: add example configuration for colored ZCU102 i=
nmate
>>>>>>>>>>   hypervisor: protect inclusion of control.h
>>>>>>>>>>   hypervisor, driver: add platform information to configure colo=
ring
>>>>>>>>>>     params
>>>>>>>>>>   configs: arm64: hook-in coloring parameters for ZCU102
>>>>>>>>>>   hypervisor: provide runtime assert() helper for DEBUG only
>>>>>>>>>>   hypervisor: provide implementation for __assert_fail() and gro=
up
>>>>>>>>>>     panic-related functions
>>>>>>>>>>   hypervisor: coloring: use assert instead of "BUG"
>>>>>>>>>>   hypervisor: coloring: make cache autodetection debug-only
>>>>>>>>>>
>>>>>>>>>> Luca Miccio (2):
>>>>>>>>>>   Documentation: add description and usage of cache coloring sup=
port
>>>>>>>>>>   pyjailhouse: add support for colored regions
>>>>>>>>>>
>>>>>>>>>>  Documentation/cache-coloring.md               | 198 +++++++++++=
+++++++
>>>>>>>>>>  configs/arm64/zynqmp-zcu102-inmate-demo-col.c |  75 +++++++
>>>>>>>>>>  configs/arm64/zynqmp-zcu102.c                 |   6 +
>>>>>>>>>>  driver/cell.c                                 |  10 +-
>>>>>>>>>>  driver/cell.h                                 |   1 +
>>>>>>>>>>  driver/main.c                                 |  12 ++
>>>>>>>>>>  hypervisor/Makefile                           |   2 +-
>>>>>>>>>>  hypervisor/arch/arm-common/control.c          |   1 +
>>>>>>>>>>  .../arch/arm-common/include/asm/bitops.h      |  10 +
>>>>>>>>>>  .../arch/arm-common/include/asm/dcaches.h     |   8 +
>>>>>>>>>>  hypervisor/arch/arm-common/mmu_cell.c         |  52 +++--
>>>>>>>>>>  hypervisor/arch/arm/control.c                 |   1 +
>>>>>>>>>>  hypervisor/arch/arm/include/asm/coloring.h    |  59 ++++++
>>>>>>>>>>  hypervisor/arch/arm/traps.c                   |   1 +
>>>>>>>>>>  hypervisor/arch/arm64/Kbuild                  |   5 +
>>>>>>>>>>  hypervisor/arch/arm64/cache_layout.c          | 148 +++++++++++=
++
>>>>>>>>>>  hypervisor/arch/arm64/coloring.c              | 184 +++++++++++=
+++++
>>>>>>>>>>  hypervisor/arch/arm64/control.c               |   1 +
>>>>>>>>>>  .../arch/arm64/include/asm/cache_layout.h     |  21 ++
>>>>>>>>>>  hypervisor/arch/arm64/include/asm/coloring.h  | 137 +++++++++++=
+
>>>>>>>>>>  hypervisor/arch/arm64/setup.c                 |   3 +
>>>>>>>>>>  hypervisor/arch/arm64/traps.c                 |   1 +
>>>>>>>>>>  hypervisor/arch/x86/amd_iommu.c               |   1 +
>>>>>>>>>>  hypervisor/arch/x86/control.c                 |   1 +
>>>>>>>>>>  hypervisor/arch/x86/efifb.c                   |   1 +
>>>>>>>>>>  hypervisor/arch/x86/include/asm/coloring.h    |  45 ++++
>>>>>>>>>>  hypervisor/arch/x86/ioapic.c                  |   1 +
>>>>>>>>>>  hypervisor/arch/x86/svm.c                     |   1 +
>>>>>>>>>>  hypervisor/arch/x86/vmx.c                     |   1 +
>>>>>>>>>>  hypervisor/control.c                          | 111 ++++------
>>>>>>>>>>  hypervisor/include/jailhouse/assert.h         |  37 ++++
>>>>>>>>>>  hypervisor/include/jailhouse/control.h        |  34 +--
>>>>>>>>>>  hypervisor/include/jailhouse/panic.h          |  40 ++++
>>>>>>>>>>  hypervisor/include/jailhouse/printk.h         |   4 +
>>>>>>>>>>  hypervisor/panic.c                            |  86 ++++++++
>>>>>>>>>>  hypervisor/pci.c                              |   1 +
>>>>>>>>>>  hypervisor/printk.c                           |   1 +
>>>>>>>>>>  hypervisor/uart.c                             |   1 +
>>>>>>>>>>  include/jailhouse/cell-config.h               |  11 +
>>>>>>>>>>  pyjailhouse/config_parser.py                  |   9 +-
>>>>>>>>>>  40 files changed, 1201 insertions(+), 121 deletions(-)
>>>>>>>>>>  create mode 100644 Documentation/cache-coloring.md
>>>>>>>>>>  create mode 100644 configs/arm64/zynqmp-zcu102-inmate-demo-col.=
c
>>>>>>>>>>  create mode 100644 hypervisor/arch/arm/include/asm/coloring.h
>>>>>>>>>>  create mode 100644 hypervisor/arch/arm64/cache_layout.c
>>>>>>>>>>  create mode 100644 hypervisor/arch/arm64/coloring.c
>>>>>>>>>>  create mode 100644 hypervisor/arch/arm64/include/asm/cache_layo=
ut.h
>>>>>>>>>>  create mode 100644 hypervisor/arch/arm64/include/asm/coloring.h
>>>>>>>>>>  create mode 100644 hypervisor/arch/x86/include/asm/coloring.h
>>>>>>>>>>  create mode 100644 hypervisor/include/jailhouse/assert.h
>>>>>>>>>>  create mode 100644 hypervisor/include/jailhouse/panic.h
>>>>>>>>>>  create mode 100644 hypervisor/panic.c
>>>>>>>>>>
>>>>>>>>>
>>>>>>>>> Thanks for the update! I assume it's functional and can be used i=
n
>>>>>>>>> tests? Asking as there seems to be a lot of debug code and commen=
ts.
>>>>>>>>
>>>>>>>> Yes, it is functional and it can be used for testing. I assumed th=
is wasn't the
>>>>>>>> final version, and the debug code + commented out code are still t=
here in the
>>>>>>>> places where it can be useful to take a look to understand how the=
 machinery is
>>>>>>>> working.
>>>>>>>>
>>>>>>>> I'm also interested in your point of view regarding having a CONFI=
G_DEBUG option
>>>>>>>> in Jailhouse. Basically a "debugging/development-enabled" version =
(with assert()
>>>>>>>> and extra verbose output), and a "production" one.
>>>>>>>>
>>>>>>>>> Scanning through it, I still find it very arm64-centric, rather t=
han
>>>>>>>>
>>>>>>>> It is. As mentioned, I don't know if it is meaningful to have a x8=
6 version of
>>>>>>>> the coloring, and for how long there will be the need to have colo=
ring in
>>>>>>>> software. So, the patches try to keep the changes in both hypervis=
or and driver
>>>>>>>> to a minimum.
>>>>>>>
>>>>>>> x86 might not be meaningful for modern CPUs with CAT, but it is ano=
ther
>>>>>>> test case. But I'm also thinking of RISC-V and what else might come=
 along.
>>>>>>
>>>>>> Coloring in software on x86 might not be trivial. But yes, RISC-V co=
uld be a
>>>>>> test case, and maybe there will be some hardware support that can be=
 exploited
>>>>>> there...
>>>>>>
>>>>>>>>> generically addressing the topic as I pointed out in previous rev=
iews.
>>>>>>>>> And keeping modifications of the driver minimal is not necessaril=
y a
>>>>>>>>> sign we are on the same page already.
>>>>>>>>
>>>>>>>> We've experimented also with a version that does "more" in the dri=
ver. I think
>>>>>>>> that more changes in the driver only add complexity. In the end th=
e hypervisor
>>>>>>>> have to distinguish anyway between colored and non-colored mapping=
, and
>>>>>>>> scattering the load logic between driver and hypervisor has more m=
aintenance
>>>>>>>> effort than a single clean configuration parameter.
>>>>>>>
>>>>>>> You are possibly right, it's just hard for me to follow this as the=
re is
>>>>>>> no code or more concrete design to prove that argument.
>>>>>>
>>>>>> I've synched with Luca and Marco, and I've pushed here
>>>>>>
>>>>>> https://gitlab.com/bastoni/jailhouse/-/commits/wip/design/coloring-d=
river/
>>>>>>
>>>>>> some relevant commits that show how a possible driver-integrated sol=
ution could
>>>>>> look like.
>>>>>>
>>>>>> Note that the "jailhouse_ioremap_col()" function in driver/main.c ba=
sically
>>>>>> replicates the same coloring loop that should also be provided by th=
e hypervisor
>>>>>> to do colored-mapping and how the logic about the "next_colored()" s=
hould be
>>>>>> "moved-up" to be shared between HV and driver.
>>>>>
>>>>> Need to look into that, so a blind shot: If it's mere replication of
>>>>> logic, a common include with the core functionality can help to avoid
>>>>> duplication. If it's more, this is a point.
>>>>>
>>>>
>>>> Finally had the time to study: I don't see a major issue with the
>>>
>>> Thank you for checking this.
>>>
>>>> jailhouse_ioremap_col replicating the mapping logic the hypervisor doe=
s.
>>>> The core logic is in next_colored, and that is shared.
>>>> jailhouse_ioremap_col is a simple loop.
>>>>
>>>> However, jailhouse_ioremap_col should be enhanced to a generic
>>>> jailhouse_ioremap that maps also uncolored memory the same way. To my
>>>> understanding, next_colored already returns the next physical page in
>>>> the uncolored case.
>>>>
>>>>>>
>>>>>> This non-clean separation, and the fact that the IPA/PA mapping shou=
ld not
>>>>>> belong to the driver, but only to the HV are among the reasons why w=
e moved to
>>>>>> the solution presented in the patch series.
>>>>>
>>>>> If code overall grows massively, it's valid to consolidate in the HV.=
 If
>>>>> it's just about having it somewhere, the driver is the better place.
>>>>>
>>>>
>>>> Would be interesting to see the diffstat of the hypervisor with your
>>>> driver coloring extension. The cache layout detection leaves to
>>>> hypervisor, and no new hypercall is added. Should be worth it.
>>>
>>> What do you mean here? In the version posted in the patches (the most u=
pdated
>>> version) there is no hypercall. Do you have in mind a cross-over betwee=
n the two
>>> versions?
>>>
>>> What is the objective you would like to achieve from a design point of =
view?
>>>
>>
>> Right, there is no special call anymore. I meant the special handling of
>> colored regions for set-loadable, though. That can be avoided.
>=20
> The cost of avoiding it, is to make Linux running in the root-cell aware =
that a
> mapping is colored, and have something similar to the loops in "color_cel=
l_op()"
> also in the ioremap_colored() in Linux.
>=20
> (In the wip/design/coloring-driver version, this loop complexity is hidde=
n in
> next_colored() + next_color(), but the basic complexity is the same.)
>=20
> To me, coloring should just effect the IPA - PA translation, and except f=
or the
> configuration dependent offset, the coloring can be kept transparent for =
Linux.

Let's argue over diffstats. We already have one for the transparent
option, and you have the driver bits for opaque option. Please try to
plug in the hypervisor, and then we can see. My understanding is that
this should be predominately about removing logic from the hypervisor,
thus not to lengthy to implement.

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
jailhouse-dev/f7777383-0a65-16c3-25d2-fbf38789f9de%40siemens.com.
