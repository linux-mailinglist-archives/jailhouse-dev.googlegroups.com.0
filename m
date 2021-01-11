Return-Path: <jailhouse-dev+bncBCJI7SMNV4NBBDXV6D7QKGQEDJ5FUGY@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-lj1-x239.google.com (mail-lj1-x239.google.com [IPv6:2a00:1450:4864:20::239])
	by mail.lfdr.de (Postfix) with ESMTPS id 282B02F11B3
	for <lists+jailhouse-dev@lfdr.de>; Mon, 11 Jan 2021 12:46:23 +0100 (CET)
Received: by mail-lj1-x239.google.com with SMTP id b4sf1295423lji.22
        for <lists+jailhouse-dev@lfdr.de>; Mon, 11 Jan 2021 03:46:23 -0800 (PST)
ARC-Seal: i=2; a=rsa-sha256; t=1610365582; cv=pass;
        d=google.com; s=arc-20160816;
        b=fUUwtmaOJSqrZ0b+abSo6N4tUmR62O+DxuUQhLnNWNcM9U8hL0IE/opURCSMK2Phbn
         ukEwhtsl7yiqJFS+w6dZPe1H0eIPRXeq94rHP1qD+AY/gWeUWB6m9svsBqNTE5UmoKD9
         4pbWFBoet64+WfcO3njKt/RefDaq1giuA2nP28sRAhHXQmX697abmaxUXHnLVr+CDvlj
         GI3s37QdP5WqsGUnvjxwViALw4CvKW1XJHmg04+HJygwmqgf2BLozyd46xmMFEySFubP
         Buhz27Xuh0k/GrlQZ/77mCKLfV8Sq2JPyG4o3xoAuUTijuCwAufPO+cbvCV7XGb1FGpe
         waQA==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:cc:to:subject:sender:dkim-signature;
        bh=lQ803sxSBx3mn5n/x1RZK6cgoxH4dhfO4dW0Wih+g1s=;
        b=sjNwtyASOGP11uFZTX5HH444wYu1y23R76Z8VAoagWw9ieNkab+jbLJ2gTW7wvnrgn
         83X2rjc3d2ka9gavbWcN1MxqvG4IUQVjevKBEbbSZV+pOUjKAoTa7d4uTb66aaO+QrKh
         2QAqFTS9iTiZ7DF/AD0FvSZ2ne9NZfPRneezumrB3Lrj0vH8toX9MMV3QS/jgDrygg8w
         ZZWs+bqyCoGI55fMUP2NsXgMxLt0iel3/WFgpkqIugzawGeWMcMhifKiog7VcVVyPk/x
         WtqL5FsQ5BNl+LchGfkORw+Jn7LXtSVtneKGou67ld/RvK2qePEDzjofhF06ZARqmZU/
         E3ew==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       spf=neutral (google.com: 192.35.17.14 is neither permitted nor denied by best guess record for domain of jan.kiszka@siemens.com) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=siemens.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding
         :x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=lQ803sxSBx3mn5n/x1RZK6cgoxH4dhfO4dW0Wih+g1s=;
        b=UfHo2XkvPmelf8MY+pMZ40Xd8iBuArThMO3+xq/PAOblFw0v5dl2bPV8rMcH8nyxBO
         LrqUDQ7pxVwl+YTAahkUNb9DS6BjcEWxSNIRwNlXsXsmIsweY47mVhCcYsNS0kuMVySb
         U0/yTOWhdbC6RFAEYT5uHk041FRURzF72mqFwcSWeK/F6UZjdSDnNhdgbRmUPuJ3fQwr
         nlPD291L5StZ8WppN6NNvhbgXQ75Fc1KW70g5AYQMPBMQBI0vZu8Eo+IaSWr7UPMG7N6
         OGlWbvRX0EtRmAgIJdQG3NoG7haFEOR3UE1bJi2AlJsnil9ixZo5C86jnMUxjsz3yG1+
         0L9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:subject:to:cc:references:from:message-id
         :date:user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :x-spam-checked-in-group:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=lQ803sxSBx3mn5n/x1RZK6cgoxH4dhfO4dW0Wih+g1s=;
        b=CqbFflYFQbmfodkLvEPGkEMYECw+x+9fZod/F3sLg64WuiyQ7CUh1OLU+diCGhkGr/
         Ol6VdMFrwxWWhjz3r+I+u2CxEXvF58kI0/Od42po5VbIEyy6bBU670WPNj1vVDNrqTB8
         GPEQAJgqn17WPXiyMT9BQq4zlB1SrT1InvUQW/UCCdhFxR/Mw/n/HHKxDWokReMc+DQr
         TMD12NPzOs8zJIe7qh1KfLWr5Civw/+lbeiuDU15k6vdmvz47sIy4OvumjrFJ1DuNEyy
         Sk6rNbym6u7Kjfd61eJj7m+cWz0hHdlltsMvzg7SAXQc8xXdVhHYM83ZwfEaPmnC658D
         RuWw==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AOAM5321MwQjsHmpwFnYaF+VNr5dpBHwERsRn4lVFm2/YJ5iG8jT6atA
	OvNI5wLCWWS5937QK+xHi2A=
X-Google-Smtp-Source: ABdhPJzJFdXQxDGM/eBNDM1lh0PJDnXJbOebY/jOqnQ0QA10psoL+5rRXMQ20rkRmHUTMgMhgFHI0g==
X-Received: by 2002:a2e:b4af:: with SMTP id q15mr6945649ljm.507.1610365582662;
        Mon, 11 Jan 2021 03:46:22 -0800 (PST)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a19:c1cd:: with SMTP id r196ls458200lff.1.gmail; Mon, 11 Jan
 2021 03:46:21 -0800 (PST)
X-Received: by 2002:ac2:5e87:: with SMTP id b7mr6725467lfq.190.1610365581468;
        Mon, 11 Jan 2021 03:46:21 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1610365581; cv=none;
        d=google.com; s=arc-20160816;
        b=xffAiAlU1cmH33hEGsBlJyaAUKyawxYLe6n8EoeZXKkJcHfIQOzccKzmtucW7N/KHm
         RijQooTwKFECUzQuxoxiKcK1sLcXSfj7XVuBEmOuFRQaa88o3UZDqGXFvKTwFP2jgvSt
         BpDdbSLGDLhVdV5zkJBzZobUnpxsTtFn7ZZun+eUHh4oXrUmgMk6gnfTuToAzVZMZtk2
         4xWfGijnkHvx/XbWbCJk4YAsnVOf+A5RMfK+Bo46Xojesk1qWJhlIYM2U1cDn+Ia8BiR
         maqF6M9WXjXs6p7qztQ3B8vVH9ffCbQ43DoD7e8/Zv8qU6ZgY0GFzza0rXkiCwzejhdv
         C7qw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:cc:to:subject;
        bh=U+E+ILWN5wYPnzr4T6FcTAZThWw8BUcILYWrLxeTvCw=;
        b=bbcvCCyVyxouJw6/kuLgxQVp80VpadCP4cB4WOwMsGKRjGS5LDq/e4/6pug2CkWlmJ
         naMq305J4naxxGHjlmuD/aZmZohweVFKU3a9m43CAYJdql7Bw7CsNVPSERBy/c3XNpzp
         N81/rcRvPOJtfquJYbKO7Rv42AziUJEFHV26CDbxYkjqkYcUTCkeAVW8KypyMQtIefP4
         wRJjT0/hUaOOqpHnhCD7Yg0IOd8eBAmaoPYMf4O04Nnl3bHHkjkD3Lh0AN8zeZeUgpZB
         7PUgr/vA/TaArE1S3yITevAhFc0pwNeCp7pBtFcgJ1adrAbmSWkRUhiu9vAIqs0ehoBn
         A0+A==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       spf=neutral (google.com: 192.35.17.14 is neither permitted nor denied by best guess record for domain of jan.kiszka@siemens.com) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=siemens.com
Received: from david.siemens.de (david.siemens.de. [192.35.17.14])
        by gmr-mx.google.com with ESMTPS id 7si717444lfp.13.2021.01.11.03.46.21
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 11 Jan 2021 03:46:21 -0800 (PST)
Received-SPF: neutral (google.com: 192.35.17.14 is neither permitted nor denied by best guess record for domain of jan.kiszka@siemens.com) client-ip=192.35.17.14;
Received: from mail2.sbs.de (mail2.sbs.de [192.129.41.66])
	by david.siemens.de (8.15.2/8.15.2) with ESMTPS id 10BBkEep007611
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 11 Jan 2021 12:46:17 +0100
Received: from [167.87.43.185] ([167.87.43.185])
	by mail2.sbs.de (8.15.2/8.15.2) with ESMTP id 10BBkD09012621;
	Mon, 11 Jan 2021 12:46:13 +0100
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
From: Jan Kiszka <jan.kiszka@siemens.com>
Message-ID: <9b88eab8-859b-d54b-ba2d-40395c5e1828@siemens.com>
Date: Mon, 11 Jan 2021 12:46:13 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
MIME-Version: 1.0
In-Reply-To: <65629141-28b5-4153-7547-cfb58b22baff@tum.de>
Content-Type: text/plain; charset="UTF-8"
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable
X-Original-Sender: jan.kiszka@siemens.com
X-Original-Authentication-Results: gmr-mx.google.com;       spf=neutral
 (google.com: 192.35.17.14 is neither permitted nor denied by best guess
 record for domain of jan.kiszka@siemens.com) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=siemens.com
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

On 11.01.21 12:21, Andrea Bastoni wrote:
> Hi Jan,
>=20
> On 11/01/2021 08:36, Jan Kiszka wrote:
>> On 25.11.20 17:12, Jan Kiszka wrote:
>>> On 25.11.20 16:59, Andrea Bastoni wrote:
>>>> On 25/11/2020 11:51, Jan Kiszka wrote:
>>>>> On 25.11.20 10:15, Andrea Bastoni wrote:
>>>>>> On 25/11/2020 07:07, Jan Kiszka wrote:
>>>>>>> On 23.11.20 21:45, Andrea Bastoni wrote:
>>>>>>>> Hello Jan, hi all,
>>>>>>>>
>>>>>>>> As discussed a couple of weeks ago, here an updated version of the=
 "cache-coloring" for Jailhouse.
>>>>>>>>
>>>>>>>> A short recap on what's coloring (see Documentation/cache-coloring=
.md):
>>>>>>>>> Cache coloring is a software technique that permits LLC partition=
ing,
>>>>>>>>> therefore eliminating mutual core interference, and thus guarante=
eing more
>>>>>>>>> predictable performances for memory accesses.
>>>>>>>>
>>>>>>>> In this version of the patch, we've tried to keep the changes in t=
he hypervisor core minimal. Also, since coloring is something that should b=
e transparent to inmates/VM (coloring belongs to the IPA/PA hypervisor tran=
slations), the Linux driver has been only minimally modified.
>>>>>>>>
>>>>>>>> Coloring API
>>>>>>>> ------------
>>>>>>>>
>>>>>>>> The patch adds a small architecture API layer that implements colo=
ring. The API is fully implemented only on arm64.  arm32 could be also a po=
ssible target for coloring, x86 already has CAT. Despite being implemented =
by only one architecture, having a small common API layer integrates IMHO b=
etter than other solutions in the main code (without adding conditionally c=
ompiled code).
>>>>>>>>
>>>>>>>> The API is:
>>>>>>>>     arch_color_map_memory_region()   // cell_create
>>>>>>>>         Color-maps the memory of the cell. Coloring requires multi=
ple passes to keep a contiguous VA, while "punching holes" in the PA accord=
ing to the allocated colors.
>>>>>>>>
>>>>>>>>     arch_color_unmap_memory_region() // cell_destroy
>>>>>>>>         The opposite of create: search and give back each piece of=
 colored PA.
>>>>>>>>
>>>>>>>>     arch_color_remap_to_root()       // cell_load
>>>>>>>>         Given that we don't want to modify the driver (i.e., we do=
n't want the driver to do non-contiguous color-ioremap) we let the root cel=
l believe that the IPAs it is ioremapping are contiguous, but in reality th=
e PA are non-contiguous (colored). This is currently done by using a very h=
igh VA (IPA) address as "base" for the load-remap-to-root-cell operation. T=
his value is configuration dependent and can be specified in the root cell =
to avoid (unlikely) conflicts.
>>>>>>>>
>>>>>>>>     arch_color_unmap_from_root()     // cell_start
>>>>>>>>         Returns the mapping setup by the cell_load to the root cel=
l.
>>>>>>>>
>>>>>>>> Two APIs are implemented only by arm64:
>>>>>>>>     arm_color_dcache_flush_memory_region()  // range flushing
>>>>>>>>         Also flushing should be done in a "colored way".
>>>>>>>>
>>>>>>>>     arm_color_init()                        // hook for the initia=
lization of coloring
>>>>>>>>         Reads the parameters (size of the LLC way, base offset for=
 the load-remapping operation) needed by coloring. There's also some debugg=
ing code to autodetect the cache-geometry and determine the size of the way=
.
>>>>>>>>
>>>>>>>> Configuration
>>>>>>>> -------------
>>>>>>>>
>>>>>>>> From the configuration point of view, a colored memory region is a=
 normal memory region with a color attached. The color is expressed directl=
y in the memory region as color-bitmask and the flag JAILHOUSE_MEM_COLORED =
is used to identify such a region. Contiguous bits in the bitmask identify =
a color (region) to be used for the memory region. The size of the mapping =
doesn't change due to coloring.
>>>>>>>>
>>>>>>>> For example, with 16 colors, a full way size is selected by 0xffff=
, while 1/4 of the way size is selected by 0x000f.
>>>>>>>>
>>>>>>>> (Note: we also experimented with a different version that defined =
separate "normal" and "colored" memory regions. The approach presented in t=
his version is more robust.)
>>>>>>>>
>>>>>>>> Main coloring "loop"
>>>>>>>> --------------------
>>>>>>>>
>>>>>>>> The coloring APIs basically boil down to a loop that appropriately=
 selects --according to the color-- the physical addresses where to perform=
 a selected operation. The selection is done efficiently with bit operation=
s on the bitmask.
>>>>>>>>
>>>>>>>> An alternative approach is to hook coloring deep into the mapping =
functionalities of the hypervisor. Basically, all low level mapping functio=
ns support coloring, and the non-colored case becomes the "special case."
>>>>>>>> This approach was not followed because to be implemented "cleanly"=
, all the architecture mapping APIs have to be extended to support coloring=
, but only one-architecture then really implement it.
>>>>>>>>
>>>>>>>> Instead, the implemented approach to have an additional "coloring"=
 API integrates more nicely. Additionally, coloring will be hopefully only =
a transitory techniques (some years?) that could be eventually replaced by =
hardware-based techniques (e.g., MPAM). When this happens, removing the add=
itional coloring API requires less rework than the other approach.
>>>>>>>>
>>>>>>>>
>>>>>>>> Debugging Code
>>>>>>>> --------------
>>>>>>>>
>>>>>>>> The patches also provide a "debugging-only" code that can be activ=
ated by defining CONFIG_DEBUG (it sounded more Jailhouse-oriented than NDEB=
UG). In debugging mode, the coloring provides an autodetection for arm64 ca=
che geometry.
>>>>>>>> Additionally, I've added an assert() function that can be used at =
runtime in debugging only contexts (could be used independently from colori=
ng).
>>>>>>>>
>>>>>>>>
>>>>>>>> Feedback and comments welcome.
>>>>>>>>
>>>>>>>> Best,
>>>>>>>> Andrea
>>>>>>>>
>>>>>>>> Andrea Bastoni (12):
>>>>>>>>   arm-common: bitops: add most-significant-bit operation
>>>>>>>>   hypervisor, driver, archs: add basic empty infrastructure for co=
loring
>>>>>>>>   hypervisor: arm64: add cache coloring implementation
>>>>>>>>   hypervisor configuration: hook autodetection for coloring_way_si=
ze
>>>>>>>>   configs: arm64: add example configuration for colored ZCU102 inm=
ate
>>>>>>>>   hypervisor: protect inclusion of control.h
>>>>>>>>   hypervisor, driver: add platform information to configure colori=
ng
>>>>>>>>     params
>>>>>>>>   configs: arm64: hook-in coloring parameters for ZCU102
>>>>>>>>   hypervisor: provide runtime assert() helper for DEBUG only
>>>>>>>>   hypervisor: provide implementation for __assert_fail() and group
>>>>>>>>     panic-related functions
>>>>>>>>   hypervisor: coloring: use assert instead of "BUG"
>>>>>>>>   hypervisor: coloring: make cache autodetection debug-only
>>>>>>>>
>>>>>>>> Luca Miccio (2):
>>>>>>>>   Documentation: add description and usage of cache coloring suppo=
rt
>>>>>>>>   pyjailhouse: add support for colored regions
>>>>>>>>
>>>>>>>>  Documentation/cache-coloring.md               | 198 +++++++++++++=
+++++
>>>>>>>>  configs/arm64/zynqmp-zcu102-inmate-demo-col.c |  75 +++++++
>>>>>>>>  configs/arm64/zynqmp-zcu102.c                 |   6 +
>>>>>>>>  driver/cell.c                                 |  10 +-
>>>>>>>>  driver/cell.h                                 |   1 +
>>>>>>>>  driver/main.c                                 |  12 ++
>>>>>>>>  hypervisor/Makefile                           |   2 +-
>>>>>>>>  hypervisor/arch/arm-common/control.c          |   1 +
>>>>>>>>  .../arch/arm-common/include/asm/bitops.h      |  10 +
>>>>>>>>  .../arch/arm-common/include/asm/dcaches.h     |   8 +
>>>>>>>>  hypervisor/arch/arm-common/mmu_cell.c         |  52 +++--
>>>>>>>>  hypervisor/arch/arm/control.c                 |   1 +
>>>>>>>>  hypervisor/arch/arm/include/asm/coloring.h    |  59 ++++++
>>>>>>>>  hypervisor/arch/arm/traps.c                   |   1 +
>>>>>>>>  hypervisor/arch/arm64/Kbuild                  |   5 +
>>>>>>>>  hypervisor/arch/arm64/cache_layout.c          | 148 +++++++++++++
>>>>>>>>  hypervisor/arch/arm64/coloring.c              | 184 +++++++++++++=
+++
>>>>>>>>  hypervisor/arch/arm64/control.c               |   1 +
>>>>>>>>  .../arch/arm64/include/asm/cache_layout.h     |  21 ++
>>>>>>>>  hypervisor/arch/arm64/include/asm/coloring.h  | 137 ++++++++++++
>>>>>>>>  hypervisor/arch/arm64/setup.c                 |   3 +
>>>>>>>>  hypervisor/arch/arm64/traps.c                 |   1 +
>>>>>>>>  hypervisor/arch/x86/amd_iommu.c               |   1 +
>>>>>>>>  hypervisor/arch/x86/control.c                 |   1 +
>>>>>>>>  hypervisor/arch/x86/efifb.c                   |   1 +
>>>>>>>>  hypervisor/arch/x86/include/asm/coloring.h    |  45 ++++
>>>>>>>>  hypervisor/arch/x86/ioapic.c                  |   1 +
>>>>>>>>  hypervisor/arch/x86/svm.c                     |   1 +
>>>>>>>>  hypervisor/arch/x86/vmx.c                     |   1 +
>>>>>>>>  hypervisor/control.c                          | 111 ++++------
>>>>>>>>  hypervisor/include/jailhouse/assert.h         |  37 ++++
>>>>>>>>  hypervisor/include/jailhouse/control.h        |  34 +--
>>>>>>>>  hypervisor/include/jailhouse/panic.h          |  40 ++++
>>>>>>>>  hypervisor/include/jailhouse/printk.h         |   4 +
>>>>>>>>  hypervisor/panic.c                            |  86 ++++++++
>>>>>>>>  hypervisor/pci.c                              |   1 +
>>>>>>>>  hypervisor/printk.c                           |   1 +
>>>>>>>>  hypervisor/uart.c                             |   1 +
>>>>>>>>  include/jailhouse/cell-config.h               |  11 +
>>>>>>>>  pyjailhouse/config_parser.py                  |   9 +-
>>>>>>>>  40 files changed, 1201 insertions(+), 121 deletions(-)
>>>>>>>>  create mode 100644 Documentation/cache-coloring.md
>>>>>>>>  create mode 100644 configs/arm64/zynqmp-zcu102-inmate-demo-col.c
>>>>>>>>  create mode 100644 hypervisor/arch/arm/include/asm/coloring.h
>>>>>>>>  create mode 100644 hypervisor/arch/arm64/cache_layout.c
>>>>>>>>  create mode 100644 hypervisor/arch/arm64/coloring.c
>>>>>>>>  create mode 100644 hypervisor/arch/arm64/include/asm/cache_layout=
.h
>>>>>>>>  create mode 100644 hypervisor/arch/arm64/include/asm/coloring.h
>>>>>>>>  create mode 100644 hypervisor/arch/x86/include/asm/coloring.h
>>>>>>>>  create mode 100644 hypervisor/include/jailhouse/assert.h
>>>>>>>>  create mode 100644 hypervisor/include/jailhouse/panic.h
>>>>>>>>  create mode 100644 hypervisor/panic.c
>>>>>>>>
>>>>>>>
>>>>>>> Thanks for the update! I assume it's functional and can be used in
>>>>>>> tests? Asking as there seems to be a lot of debug code and comments=
.
>>>>>>
>>>>>> Yes, it is functional and it can be used for testing. I assumed this=
 wasn't the
>>>>>> final version, and the debug code + commented out code are still the=
re in the
>>>>>> places where it can be useful to take a look to understand how the m=
achinery is
>>>>>> working.
>>>>>>
>>>>>> I'm also interested in your point of view regarding having a CONFIG_=
DEBUG option
>>>>>> in Jailhouse. Basically a "debugging/development-enabled" version (w=
ith assert()
>>>>>> and extra verbose output), and a "production" one.
>>>>>>
>>>>>>> Scanning through it, I still find it very arm64-centric, rather tha=
n
>>>>>>
>>>>>> It is. As mentioned, I don't know if it is meaningful to have a x86 =
version of
>>>>>> the coloring, and for how long there will be the need to have colori=
ng in
>>>>>> software. So, the patches try to keep the changes in both hypervisor=
 and driver
>>>>>> to a minimum.
>>>>>
>>>>> x86 might not be meaningful for modern CPUs with CAT, but it is anoth=
er
>>>>> test case. But I'm also thinking of RISC-V and what else might come a=
long.
>>>>
>>>> Coloring in software on x86 might not be trivial. But yes, RISC-V coul=
d be a
>>>> test case, and maybe there will be some hardware support that can be e=
xploited
>>>> there...
>>>>
>>>>>>> generically addressing the topic as I pointed out in previous revie=
ws.
>>>>>>> And keeping modifications of the driver minimal is not necessarily =
a
>>>>>>> sign we are on the same page already.
>>>>>>
>>>>>> We've experimented also with a version that does "more" in the drive=
r. I think
>>>>>> that more changes in the driver only add complexity. In the end the =
hypervisor
>>>>>> have to distinguish anyway between colored and non-colored mapping, =
and
>>>>>> scattering the load logic between driver and hypervisor has more mai=
ntenance
>>>>>> effort than a single clean configuration parameter.
>>>>>
>>>>> You are possibly right, it's just hard for me to follow this as there=
 is
>>>>> no code or more concrete design to prove that argument.
>>>>
>>>> I've synched with Luca and Marco, and I've pushed here
>>>>
>>>> https://gitlab.com/bastoni/jailhouse/-/commits/wip/design/coloring-dri=
ver/
>>>>
>>>> some relevant commits that show how a possible driver-integrated solut=
ion could
>>>> look like.
>>>>
>>>> Note that the "jailhouse_ioremap_col()" function in driver/main.c basi=
cally
>>>> replicates the same coloring loop that should also be provided by the =
hypervisor
>>>> to do colored-mapping and how the logic about the "next_colored()" sho=
uld be
>>>> "moved-up" to be shared between HV and driver.
>>>
>>> Need to look into that, so a blind shot: If it's mere replication of
>>> logic, a common include with the core functionality can help to avoid
>>> duplication. If it's more, this is a point.
>>>
>>
>> Finally had the time to study: I don't see a major issue with the
>=20
> Thank you for checking this.
>=20
>> jailhouse_ioremap_col replicating the mapping logic the hypervisor does.
>> The core logic is in next_colored, and that is shared.
>> jailhouse_ioremap_col is a simple loop.
>>
>> However, jailhouse_ioremap_col should be enhanced to a generic
>> jailhouse_ioremap that maps also uncolored memory the same way. To my
>> understanding, next_colored already returns the next physical page in
>> the uncolored case.
>>
>>>>
>>>> This non-clean separation, and the fact that the IPA/PA mapping should=
 not
>>>> belong to the driver, but only to the HV are among the reasons why we =
moved to
>>>> the solution presented in the patch series.
>>>
>>> If code overall grows massively, it's valid to consolidate in the HV. I=
f
>>> it's just about having it somewhere, the driver is the better place.
>>>
>>
>> Would be interesting to see the diffstat of the hypervisor with your
>> driver coloring extension. The cache layout detection leaves to
>> hypervisor, and no new hypercall is added. Should be worth it.
>=20
> What do you mean here? In the version posted in the patches (the most upd=
ated
> version) there is no hypercall. Do you have in mind a cross-over between =
the two
> versions?
>=20
> What is the objective you would like to achieve from a design point of vi=
ew?
>=20

Right, there is no special call anymore. I meant the special handling of
colored regions for set-loadable, though. That can be avoided.

The hypervisor then just needs to apply generic coloring rules when
mapping regions into cells. And the root cell will request the loadable
region by adding the non-root cell's color to its respective region.

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
jailhouse-dev/9b88eab8-859b-d54b-ba2d-40395c5e1828%40siemens.com.
