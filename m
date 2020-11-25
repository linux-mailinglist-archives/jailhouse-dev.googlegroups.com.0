Return-Path: <jailhouse-dev+bncBCJI7SMNV4NBBVUE7L6QKGQEQJI4QMY@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-wm1-x337.google.com (mail-wm1-x337.google.com [IPv6:2a00:1450:4864:20::337])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D7162C44B2
	for <lists+jailhouse-dev@lfdr.de>; Wed, 25 Nov 2020 17:12:07 +0100 (CET)
Received: by mail-wm1-x337.google.com with SMTP id o17sf945892wmd.9
        for <lists+jailhouse-dev@lfdr.de>; Wed, 25 Nov 2020 08:12:07 -0800 (PST)
ARC-Seal: i=2; a=rsa-sha256; t=1606320727; cv=pass;
        d=google.com; s=arc-20160816;
        b=vyWwUgrHJNxBk9zaA/O4J+lmBbzzJoOi5TR4ZxA5VFkZeoKGfRCoEXn7W6/vlVaOZk
         EQ3C0BFSweekCIjvBDLcmCyUpla200WStc2i9K6I1V1Vzp8NVP2Nwugrw9H89SnCvA4q
         6siGIjf86XAJvKW5l+0ry2U91WLyDwKzdU063V6cVgQWw7qq22aczWzISC/dE1WZEJaB
         F9OmicZpcTdaY6npPXDk+WTIGkuqZ5jU5rO3KzNuDCOmKGXsw3MxMoXUKqs0vtANic9M
         U+A9lhHshyI0EAN21f5So+O9plIFdLA3Nn0rvSQcOLHwU3nmMXPYbecWlPP2VuzIgMwc
         Rg9A==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:cc:to:subject:sender:dkim-signature;
        bh=5d3cS2muvlHJNAQrqWDqqHMk6FJKOOL7ZUt/aEmpfPw=;
        b=BbF/uTImu5RpE8Kgl6jpU3sSVWuWtMomvZj5/P/zXtKyGZuH6VZtLcx8BTLsbk35x/
         ggU/b8G0emGXRAQNV2U8qkKsH57ycl3TAwjr27P8KROyW45JiIzDwY4f+bmuBJr4TQ/b
         h14ChksQahWYZJKG3lsVYp+1TgNMoIx3rUR0eAf47yejw9v7FvsuhKWam4eT5wf7/dpQ
         1JRVM2CWAxTdIipbkavF9jwJL1lODrjcoBzBBKk+rt7gPk50XRXfSmdbKHLFl6/OfwZ9
         /1kiLx/CfN4K+qZSNatt9S9UhQaMODtau/uUVeQkGoeqoAPDiR4/+NhddUub/ZeQtigQ
         dV0w==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.2 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding
         :x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=5d3cS2muvlHJNAQrqWDqqHMk6FJKOOL7ZUt/aEmpfPw=;
        b=ehm7YJrUHZb6dxLYWvfkzWA8Ob9iY5Yo/wEFETp8AJIUIyA6UPMj5g6kj4BAMIaWpA
         TfBvMARy34XHJvCrm5aSdv23X9nR9+A+7t+5FBWKd+nPzXjNkBK6LMH71Af2Xq/QOSSZ
         cJ/olHWiXGiUaa5Os8H0k41yU7KVcBDPWJyFaSMQGZxPSwlujwDGXcu5sub334RdxMqA
         50rwhYV274c6Hhbd35bryyOtYvmWDFDgirL7BA0ZJ2CNWrVBIpP8cVcCrNEMimSFNRT+
         iweO32vKN8T8I8/TmRpTV9VuAmgXtoXvxCrlmlWmm7Lk1P0l/DfKefsA3Qjkz1UsWlOD
         E5nw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:subject:to:cc:references:from:message-id
         :date:user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :x-spam-checked-in-group:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=5d3cS2muvlHJNAQrqWDqqHMk6FJKOOL7ZUt/aEmpfPw=;
        b=YJQp3p73m++fvN/NXQxGUNf0nr5/jDRTFRCoZSk0lcNIG0cJIylYm18vdKIDaSkjzh
         77dYeyhHNnEDAf5cyM9e606gMeZrHbs3nIJ06Q65DJunjFfGeXUYry0BoZ82sqavg6FU
         FVSvF3y85Z+91q3bMBqtIn/pMCna3eee14VfHHzwItc3COvHcMdWShNqbLyuLLV5hPdB
         HY5m050n28szQV3MqJWzqizIbe9Op9iOAlz3bEE8PkihiU3Ec7cA9jprobv/Ig0uZMXM
         WvH/IeNC00pCWWQWlt3WdgleriotzoqCRxB/weYTVlEj+GEhA9+rrcA/0ewuKuQ+IGCK
         J9mQ==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AOAM532nqo8BpygPJkfnJhS2fjdsMqhcUMgeGnm5a4zUZDws5vtI6OlI
	AbXgEGJdiFKUBZACyzKJUZo=
X-Google-Smtp-Source: ABdhPJw9wIctySOpYUbbL1QEO5bqTNA1fV2ikaNJG+tNYNh1WE/2+r3C58ldcOs7bMPlcs6T1b0sXQ==
X-Received: by 2002:a5d:52c1:: with SMTP id r1mr5105256wrv.255.1606320727092;
        Wed, 25 Nov 2020 08:12:07 -0800 (PST)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a1c:2d14:: with SMTP id t20ls1543972wmt.3.canary-gmail; Wed,
 25 Nov 2020 08:12:05 -0800 (PST)
X-Received: by 2002:a1c:e305:: with SMTP id a5mr4683672wmh.45.1606320725821;
        Wed, 25 Nov 2020 08:12:05 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1606320725; cv=none;
        d=google.com; s=arc-20160816;
        b=dJpsQAlXGE0N8WzKohI7cqknjeAikVrFvSBu1vgpX59xMnX/ooem1pofSWLxmcRcPR
         oMhKEOyHt6TH3/5z4noczxRN7AXwtHW8f7DJCqueKwwsnAI4CjLLz8elgjg+Xf9N2wDx
         apwpv5LvmF9+2yzhyAIBfNjgmF45tZ8ibF36yG7bQ9gR6AqDoVrgYx6UcDJCSou6qoc6
         E5GY6XsK7V/WUUfDuEP95g1uEjgoSijJMdb/sY5DLF0Tf9R7CIkWxff6A3phvlDvYlHL
         o8g4aAoZ0Ntv9ZvO8qjDGboST6+5ieaN4OtJ0dZoIpMqRbihT3oM8vPkaITj4KDcQVUU
         lrQQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:cc:to:subject;
        bh=RUSMHAkjlCC5onKpnJX/yaAVMgxHbepdNOC82b5t1xQ=;
        b=snATwjmh5JbnAkSMMKVjj4xXtseCRx9HA2C2ZIshJkQLlJmb0RdkI1h951dJsbzHF4
         aAeVofXe3JTx7R7N7Es0u0zTDuaBkIq0lkmk/YOekb6hDGd4k/p+YV7OUC40Q+LD5nMs
         EKKR3VYn399eaavfGqSEkWnnRGYSID+2aYmcFjDXCFOFinfFj3JLXalYa7KTxsidGUie
         Xjl8K23AooxZx0YZ9m4GpN0JIZzY6UOydQUtXM43xh6lBWKmDdpCbcR5tkat/TNmHCzI
         tJRF2xMmN6U3TbYEZ2Cdka1JHa1Mk/R/vDmDI8uVTmt4IzpLe6lKqdr0tDLiTIICMxQJ
         fl3w==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.2 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
Received: from thoth.sbs.de (thoth.sbs.de. [192.35.17.2])
        by gmr-mx.google.com with ESMTPS id j199si60723wmj.0.2020.11.25.08.12.05
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 25 Nov 2020 08:12:05 -0800 (PST)
Received-SPF: pass (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.2 as permitted sender) client-ip=192.35.17.2;
Received: from mail2.sbs.de (mail2.sbs.de [192.129.41.66])
	by thoth.sbs.de (8.15.2/8.15.2) with ESMTPS id 0APGC2Jq011178
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 25 Nov 2020 17:12:02 +0100
Received: from [167.87.38.29] ([167.87.38.29])
	by mail2.sbs.de (8.15.2/8.15.2) with ESMTP id 0APGC1nh010917;
	Wed, 25 Nov 2020 17:12:01 +0100
Subject: Re: [PATCH 00/14] Cache-coloring for Jailhouse
To: Andrea Bastoni <andrea.bastoni@tum.de>, jailhouse-dev@googlegroups.com
Cc: marco.solieri@unimore.it, rmancuso@bu.edu, lucmiccio@gmail.com
References: <20201123204613.252563-1-andrea.bastoni@tum.de>
 <49bddd30-ded4-3264-813c-940fc11e2354@siemens.com>
 <50b3ceff-d68d-b6c0-f335-8cec4fa67305@tum.de>
 <054fe4bd-e3ea-dfa5-c8aa-c3d2a2cad6fb@siemens.com>
 <6af26a83-8be5-0317-92c6-ffcdf636375a@tum.de>
From: Jan Kiszka <jan.kiszka@siemens.com>
Message-ID: <085d4dfc-b4ca-a421-4f04-a04eb0d43e9c@siemens.com>
Date: Wed, 25 Nov 2020 17:12:01 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.0
MIME-Version: 1.0
In-Reply-To: <6af26a83-8be5-0317-92c6-ffcdf636375a@tum.de>
Content-Type: text/plain; charset="UTF-8"
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

On 25.11.20 16:59, Andrea Bastoni wrote:
> On 25/11/2020 11:51, Jan Kiszka wrote:
>> On 25.11.20 10:15, Andrea Bastoni wrote:
>>> On 25/11/2020 07:07, Jan Kiszka wrote:
>>>> On 23.11.20 21:45, Andrea Bastoni wrote:
>>>>> Hello Jan, hi all,
>>>>>
>>>>> As discussed a couple of weeks ago, here an updated version of the "c=
ache-coloring" for Jailhouse.
>>>>>
>>>>> A short recap on what's coloring (see Documentation/cache-coloring.md=
):
>>>>>> Cache coloring is a software technique that permits LLC partitioning=
,
>>>>>> therefore eliminating mutual core interference, and thus guaranteein=
g more
>>>>>> predictable performances for memory accesses.
>>>>>
>>>>> In this version of the patch, we've tried to keep the changes in the =
hypervisor core minimal. Also, since coloring is something that should be t=
ransparent to inmates/VM (coloring belongs to the IPA/PA hypervisor transla=
tions), the Linux driver has been only minimally modified.
>>>>>
>>>>> Coloring API
>>>>> ------------
>>>>>
>>>>> The patch adds a small architecture API layer that implements colorin=
g. The API is fully implemented only on arm64.  arm32 could be also a possi=
ble target for coloring, x86 already has CAT. Despite being implemented by =
only one architecture, having a small common API layer integrates IMHO bett=
er than other solutions in the main code (without adding conditionally comp=
iled code).
>>>>>
>>>>> The API is:
>>>>>     arch_color_map_memory_region()   // cell_create
>>>>>         Color-maps the memory of the cell. Coloring requires multiple=
 passes to keep a contiguous VA, while "punching holes" in the PA according=
 to the allocated colors.
>>>>>
>>>>>     arch_color_unmap_memory_region() // cell_destroy
>>>>>         The opposite of create: search and give back each piece of co=
lored PA.
>>>>>
>>>>>     arch_color_remap_to_root()       // cell_load
>>>>>         Given that we don't want to modify the driver (i.e., we don't=
 want the driver to do non-contiguous color-ioremap) we let the root cell b=
elieve that the IPAs it is ioremapping are contiguous, but in reality the P=
A are non-contiguous (colored). This is currently done by using a very high=
 VA (IPA) address as "base" for the load-remap-to-root-cell operation. This=
 value is configuration dependent and can be specified in the root cell to =
avoid (unlikely) conflicts.
>>>>>
>>>>>     arch_color_unmap_from_root()     // cell_start
>>>>>         Returns the mapping setup by the cell_load to the root cell.
>>>>>
>>>>> Two APIs are implemented only by arm64:
>>>>>     arm_color_dcache_flush_memory_region()  // range flushing
>>>>>         Also flushing should be done in a "colored way".
>>>>>
>>>>>     arm_color_init()                        // hook for the initializ=
ation of coloring
>>>>>         Reads the parameters (size of the LLC way, base offset for th=
e load-remapping operation) needed by coloring. There's also some debugging=
 code to autodetect the cache-geometry and determine the size of the way.
>>>>>
>>>>> Configuration
>>>>> -------------
>>>>>
>>>>> From the configuration point of view, a colored memory region is a no=
rmal memory region with a color attached. The color is expressed directly i=
n the memory region as color-bitmask and the flag JAILHOUSE_MEM_COLORED is =
used to identify such a region. Contiguous bits in the bitmask identify a c=
olor (region) to be used for the memory region. The size of the mapping doe=
sn't change due to coloring.
>>>>>
>>>>> For example, with 16 colors, a full way size is selected by 0xffff, w=
hile 1/4 of the way size is selected by 0x000f.
>>>>>
>>>>> (Note: we also experimented with a different version that defined sep=
arate "normal" and "colored" memory regions. The approach presented in this=
 version is more robust.)
>>>>>
>>>>> Main coloring "loop"
>>>>> --------------------
>>>>>
>>>>> The coloring APIs basically boil down to a loop that appropriately se=
lects --according to the color-- the physical addresses where to perform a =
selected operation. The selection is done efficiently with bit operations o=
n the bitmask.
>>>>>
>>>>> An alternative approach is to hook coloring deep into the mapping fun=
ctionalities of the hypervisor. Basically, all low level mapping functions =
support coloring, and the non-colored case becomes the "special case."
>>>>> This approach was not followed because to be implemented "cleanly", a=
ll the architecture mapping APIs have to be extended to support coloring, b=
ut only one-architecture then really implement it.
>>>>>
>>>>> Instead, the implemented approach to have an additional "coloring" AP=
I integrates more nicely. Additionally, coloring will be hopefully only a t=
ransitory techniques (some years?) that could be eventually replaced by har=
dware-based techniques (e.g., MPAM). When this happens, removing the additi=
onal coloring API requires less rework than the other approach.
>>>>>
>>>>>
>>>>> Debugging Code
>>>>> --------------
>>>>>
>>>>> The patches also provide a "debugging-only" code that can be activate=
d by defining CONFIG_DEBUG (it sounded more Jailhouse-oriented than NDEBUG)=
. In debugging mode, the coloring provides an autodetection for arm64 cache=
 geometry.
>>>>> Additionally, I've added an assert() function that can be used at run=
time in debugging only contexts (could be used independently from coloring)=
.
>>>>>
>>>>>
>>>>> Feedback and comments welcome.
>>>>>
>>>>> Best,
>>>>> Andrea
>>>>>
>>>>> Andrea Bastoni (12):
>>>>>   arm-common: bitops: add most-significant-bit operation
>>>>>   hypervisor, driver, archs: add basic empty infrastructure for color=
ing
>>>>>   hypervisor: arm64: add cache coloring implementation
>>>>>   hypervisor configuration: hook autodetection for coloring_way_size
>>>>>   configs: arm64: add example configuration for colored ZCU102 inmate
>>>>>   hypervisor: protect inclusion of control.h
>>>>>   hypervisor, driver: add platform information to configure coloring
>>>>>     params
>>>>>   configs: arm64: hook-in coloring parameters for ZCU102
>>>>>   hypervisor: provide runtime assert() helper for DEBUG only
>>>>>   hypervisor: provide implementation for __assert_fail() and group
>>>>>     panic-related functions
>>>>>   hypervisor: coloring: use assert instead of "BUG"
>>>>>   hypervisor: coloring: make cache autodetection debug-only
>>>>>
>>>>> Luca Miccio (2):
>>>>>   Documentation: add description and usage of cache coloring support
>>>>>   pyjailhouse: add support for colored regions
>>>>>
>>>>>  Documentation/cache-coloring.md               | 198 ++++++++++++++++=
++
>>>>>  configs/arm64/zynqmp-zcu102-inmate-demo-col.c |  75 +++++++
>>>>>  configs/arm64/zynqmp-zcu102.c                 |   6 +
>>>>>  driver/cell.c                                 |  10 +-
>>>>>  driver/cell.h                                 |   1 +
>>>>>  driver/main.c                                 |  12 ++
>>>>>  hypervisor/Makefile                           |   2 +-
>>>>>  hypervisor/arch/arm-common/control.c          |   1 +
>>>>>  .../arch/arm-common/include/asm/bitops.h      |  10 +
>>>>>  .../arch/arm-common/include/asm/dcaches.h     |   8 +
>>>>>  hypervisor/arch/arm-common/mmu_cell.c         |  52 +++--
>>>>>  hypervisor/arch/arm/control.c                 |   1 +
>>>>>  hypervisor/arch/arm/include/asm/coloring.h    |  59 ++++++
>>>>>  hypervisor/arch/arm/traps.c                   |   1 +
>>>>>  hypervisor/arch/arm64/Kbuild                  |   5 +
>>>>>  hypervisor/arch/arm64/cache_layout.c          | 148 +++++++++++++
>>>>>  hypervisor/arch/arm64/coloring.c              | 184 ++++++++++++++++
>>>>>  hypervisor/arch/arm64/control.c               |   1 +
>>>>>  .../arch/arm64/include/asm/cache_layout.h     |  21 ++
>>>>>  hypervisor/arch/arm64/include/asm/coloring.h  | 137 ++++++++++++
>>>>>  hypervisor/arch/arm64/setup.c                 |   3 +
>>>>>  hypervisor/arch/arm64/traps.c                 |   1 +
>>>>>  hypervisor/arch/x86/amd_iommu.c               |   1 +
>>>>>  hypervisor/arch/x86/control.c                 |   1 +
>>>>>  hypervisor/arch/x86/efifb.c                   |   1 +
>>>>>  hypervisor/arch/x86/include/asm/coloring.h    |  45 ++++
>>>>>  hypervisor/arch/x86/ioapic.c                  |   1 +
>>>>>  hypervisor/arch/x86/svm.c                     |   1 +
>>>>>  hypervisor/arch/x86/vmx.c                     |   1 +
>>>>>  hypervisor/control.c                          | 111 ++++------
>>>>>  hypervisor/include/jailhouse/assert.h         |  37 ++++
>>>>>  hypervisor/include/jailhouse/control.h        |  34 +--
>>>>>  hypervisor/include/jailhouse/panic.h          |  40 ++++
>>>>>  hypervisor/include/jailhouse/printk.h         |   4 +
>>>>>  hypervisor/panic.c                            |  86 ++++++++
>>>>>  hypervisor/pci.c                              |   1 +
>>>>>  hypervisor/printk.c                           |   1 +
>>>>>  hypervisor/uart.c                             |   1 +
>>>>>  include/jailhouse/cell-config.h               |  11 +
>>>>>  pyjailhouse/config_parser.py                  |   9 +-
>>>>>  40 files changed, 1201 insertions(+), 121 deletions(-)
>>>>>  create mode 100644 Documentation/cache-coloring.md
>>>>>  create mode 100644 configs/arm64/zynqmp-zcu102-inmate-demo-col.c
>>>>>  create mode 100644 hypervisor/arch/arm/include/asm/coloring.h
>>>>>  create mode 100644 hypervisor/arch/arm64/cache_layout.c
>>>>>  create mode 100644 hypervisor/arch/arm64/coloring.c
>>>>>  create mode 100644 hypervisor/arch/arm64/include/asm/cache_layout.h
>>>>>  create mode 100644 hypervisor/arch/arm64/include/asm/coloring.h
>>>>>  create mode 100644 hypervisor/arch/x86/include/asm/coloring.h
>>>>>  create mode 100644 hypervisor/include/jailhouse/assert.h
>>>>>  create mode 100644 hypervisor/include/jailhouse/panic.h
>>>>>  create mode 100644 hypervisor/panic.c
>>>>>
>>>>
>>>> Thanks for the update! I assume it's functional and can be used in
>>>> tests? Asking as there seems to be a lot of debug code and comments.
>>>
>>> Yes, it is functional and it can be used for testing. I assumed this wa=
sn't the
>>> final version, and the debug code + commented out code are still there =
in the
>>> places where it can be useful to take a look to understand how the mach=
inery is
>>> working.
>>>
>>> I'm also interested in your point of view regarding having a CONFIG_DEB=
UG option
>>> in Jailhouse. Basically a "debugging/development-enabled" version (with=
 assert()
>>> and extra verbose output), and a "production" one.
>>>
>>>> Scanning through it, I still find it very arm64-centric, rather than
>>>
>>> It is. As mentioned, I don't know if it is meaningful to have a x86 ver=
sion of
>>> the coloring, and for how long there will be the need to have coloring =
in
>>> software. So, the patches try to keep the changes in both hypervisor an=
d driver
>>> to a minimum.
>>
>> x86 might not be meaningful for modern CPUs with CAT, but it is another
>> test case. But I'm also thinking of RISC-V and what else might come alon=
g.
>=20
> Coloring in software on x86 might not be trivial. But yes, RISC-V could b=
e a
> test case, and maybe there will be some hardware support that can be expl=
oited
> there...
>=20
>>>> generically addressing the topic as I pointed out in previous reviews.
>>>> And keeping modifications of the driver minimal is not necessarily a
>>>> sign we are on the same page already.
>>>
>>> We've experimented also with a version that does "more" in the driver. =
I think
>>> that more changes in the driver only add complexity. In the end the hyp=
ervisor
>>> have to distinguish anyway between colored and non-colored mapping, and
>>> scattering the load logic between driver and hypervisor has more mainte=
nance
>>> effort than a single clean configuration parameter.
>>
>> You are possibly right, it's just hard for me to follow this as there is
>> no code or more concrete design to prove that argument.
>=20
> I've synched with Luca and Marco, and I've pushed here
>=20
> https://gitlab.com/bastoni/jailhouse/-/commits/wip/design/coloring-driver=
/
>=20
> some relevant commits that show how a possible driver-integrated solution=
 could
> look like.
>=20
> Note that the "jailhouse_ioremap_col()" function in driver/main.c basical=
ly
> replicates the same coloring loop that should also be provided by the hyp=
ervisor
> to do colored-mapping and how the logic about the "next_colored()" should=
 be
> "moved-up" to be shared between HV and driver.

Need to look into that, so a blind shot: If it's mere replication of
logic, a common include with the core functionality can help to avoid
duplication. If it's more, this is a point.

>=20
> This non-clean separation, and the fact that the IPA/PA mapping should no=
t
> belong to the driver, but only to the HV are among the reasons why we mov=
ed to
> the solution presented in the patch series.

If code overall grows massively, it's valid to consolidate in the HV. If
it's just about having it somewhere, the driver is the better place.

>=20
>>>> For testing purposes, please also include a QEMU configuration change =
in
>>>> the future. Helps validating things and playing the functional changes=
.
>>>
>>> OK.
>=20
> Please see the attached patch.
>=20
> Best,
> Andrea
>=20
>>>> The patch series should further more be structured in way that a stati=
c,
>>>> config-defined way-size can be used before any arch-specific
>>>> auto-detection logic is added.
>>>
>>> Sure. As said, I assumed that discussion was needed, but I think it's b=
etter to
>>> discuss with a draft of how the code will look like.
>>>
>>
>> On the one hand, discussion can be less effort than coding if everyone
>> can follow the arguments and this leads to a common view. On the other
>> hand, code has the advantage of make an even stronger argument as
>> everyone can see the results and compare, and can even do that in the
>> future when that topic pops up again for some reason.
>>
>> Jan
>>

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
jailhouse-dev/085d4dfc-b4ca-a421-4f04-a04eb0d43e9c%40siemens.com.
