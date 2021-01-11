Return-Path: <jailhouse-dev+bncBCJI7SMNV4NBBA4A6D7QKGQEAFMOQAI@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-lj1-x238.google.com (mail-lj1-x238.google.com [IPv6:2a00:1450:4864:20::238])
	by mail.lfdr.de (Postfix) with ESMTPS id 984D92F0D43
	for <lists+jailhouse-dev@lfdr.de>; Mon, 11 Jan 2021 08:36:36 +0100 (CET)
Received: by mail-lj1-x238.google.com with SMTP id d27sf1015162ljo.12
        for <lists+jailhouse-dev@lfdr.de>; Sun, 10 Jan 2021 23:36:36 -0800 (PST)
ARC-Seal: i=2; a=rsa-sha256; t=1610350596; cv=pass;
        d=google.com; s=arc-20160816;
        b=FNc2gc3UbOFLT5j/8FS6Ncqac6foyK2NlcEIS73HHGNDxPPdeRuX9K8B6ZZ/mA6znl
         NSOhc0HRSp1ly2fKRoFO4aLs8/sm5v7XVt+PzWUnjI4bgejw19mcKKQbZGLG8VkYNkqD
         uCB5XXHmik9TMTjgJvZZAcp/RCchiQl/jkt5fgJ7NF4f/rOU3ZCb8J7eFwIRrQ1ywSMH
         h743K4vscrjoXSXPMI0S64qXGM9idg4QHa2lk6kM+xtpJQK2ouq8rmr39QCElMgDLu69
         V41hn2cwa4R/0hCftwq242Ck3g73p7CFr4EXgHNiPEbp8JFDJWJ3JqQy/IWmh/SFKGcJ
         EpOQ==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:references:cc:to:from:subject:sender:dkim-signature;
        bh=7cnf/sOq2W98cC0g0g1eAXgAnUu8HJFIAdxf7PQqdJ0=;
        b=dkJXF6h+PUox88r0tmaGrtpjKy7P9D57R26pLhqpN9BHilZbSe4oG5cCTWH+umaXhb
         6sbtSRALcMDrt0n6Ri7k0880v5Ndefx3JFdrWS7oOFf/rMy5r4XdwlOmIZF/9QAgRz6F
         VPleb5Vjg+IApEgD9hUT/XRlsHRp9vrv0pn3iI0St0vAaYuxQrxYBUWQuJR3rQv/cdn3
         AtgqEWxcZAD/jGuaS5kvVmjJNKjpHCa0fRe0cpfAwbQ0l1hUMtveptk4g1F4WfhI4gqR
         pUGVGOaaCXv5YfFN9Gm8+2IheAumRtkuBGatCJVvRBRcvMRi3Bvt1Z2Kvy6NCt0tkc1S
         L2BA==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 194.138.37.40 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:subject:from:to:cc:references:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding
         :x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=7cnf/sOq2W98cC0g0g1eAXgAnUu8HJFIAdxf7PQqdJ0=;
        b=r8+UhZg3r25edwDeV/5s/WTUpcE+UbFrNpzZov6CkVwYsx5pge65C568Wut4OxmE7m
         Y1+76oFwRrhUn2E96WTiMBldzhjlGvCAnnXY6lxa8WmlDAJnRnn9eWZiSPp6tB+KISXi
         btPZiYb7s19giT0miSuMV/OImsOCYU34HCrtB70wjwGdBNhueu7QHOT8BD2ntiRShkGE
         Z+MsNsUPSla3piE2FGqaixpo4PoyPurRS98w2zMS1WSGgySNTZgrK6nqGQS7zF5jroM4
         Z5FKxeXY12kdrNiS5EP2SKWvSm51ZxPFQVRE0EoJELqep/qgo0dzAQdu8GApS0gy/q67
         iTJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:subject:from:to:cc:references:message-id
         :date:user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :x-spam-checked-in-group:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=7cnf/sOq2W98cC0g0g1eAXgAnUu8HJFIAdxf7PQqdJ0=;
        b=cw1O18dF/8SVenBVjnX8LemGZpBkcTIaW/X4b9EOSMSSV0fonzIhOfc8CKC+m2YeEV
         uYhMiDZcqnHZdfxUgX8RXWGmVquWYTcWgiQ+G+9H39TRQzwI9vXJu6qNRKQ4LG1aKH5Y
         VGGyeYuDn2IjTxYJbVsnv/9JGUSqmFiQtPsRSYT44cHyoq/qh3osRkGhREBzVYeNmDg+
         oYJ41KEHfnK4inVc35Uv7jvmxIperHQA4oJTQRt0IapSKDsAk5yUPE3wesdwikQv1KsC
         jC9E33+IEOw0i9swBRwPM1MYKk0QeUyuhpmLqGX15XC91LmkDOKQc5NhoGOHy6KVUd5P
         CbLw==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AOAM530mOfbw9tnWuIFbqPD8KK/Z6gs4QaiE7CKH6EOw+2WdepOd9f9t
	eqaHy+xEgpo2CZXSCw8UzCM=
X-Google-Smtp-Source: ABdhPJxxbzZWHLPAFJLHwU7euN3B/HRIRc4oSi1JVAobOtqOivUT6hY9bEoROvM/zBn9i/lSp//XOg==
X-Received: by 2002:a2e:7607:: with SMTP id r7mr6455042ljc.168.1610350596164;
        Sun, 10 Jan 2021 23:36:36 -0800 (PST)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a05:651c:1a5:: with SMTP id c5ls2755589ljn.10.gmail; Sun, 10
 Jan 2021 23:36:35 -0800 (PST)
X-Received: by 2002:a05:651c:489:: with SMTP id s9mr6743463ljc.188.1610350594983;
        Sun, 10 Jan 2021 23:36:34 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1610350594; cv=none;
        d=google.com; s=arc-20160816;
        b=TZOvYex8kIA4RfwI9W5lRv+V0IZg26W4b8nMpDuItgwULSggl4eyhWw1P5lcuupdIg
         DG9QeXlWbF6kR97No8IkqaHgmZFi+NI6U7Vi15WKFzY1ACozb9EvkHl45D2i1T6xV0gf
         /2O3heHeVZFjLXJDj4V25sK7EShHkhvAgJZVzJsEKf4uMNIOLbMSJWG6jMGI7/NUG1Jk
         I+nMFGwnoHjTCYLS0kFMj4rGnAdAhmtkJpPftEx0Of5dbwqk7nXA3y5tVQvha2TjQB0b
         oWlYyqcSUYp7Z39LdBD/SAC4jmzbDtNs+v0qpZ+0PZJTcse+mRXjE1ERaSh1LBfMZWnQ
         tgLA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:references:cc:to:from:subject;
        bh=j+MYCTcp9tmUACDn8/gmqkxqyqjqZDqs71kzObjQzKE=;
        b=1JTCWuvPqLLyYNke2Im/qOk5K8TdIJX3wcGKrSCU7K/2tdrg9vE1Ej911jYWGvelY4
         NqA13N/wsbO7XLNqOLKaBdh+I5crdHC3fT59VSOXrTPAqhhbuUxHFWJQFr5Ogje7w9Gb
         8ejBPJddcr1ntcj9TaqicnmbHudA46NlReKto+Aoxz91gf4+iatIFUo+objhJ5iNpOaT
         rbaQUnsf6fUNgTVTTkrLnQVKsexeSdDkbbXSOg9RB96xcHn1twGBv3YDveDLLDVyLmBU
         S6SVBnK4CGDwfwkbmSDKXzOuA0AFjCbCjBRG5n4njO+xIEi8ZZxjfAqKUlQ0pYufhrMf
         HNTg==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 194.138.37.40 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
Received: from gecko.sbs.de (gecko.sbs.de. [194.138.37.40])
        by gmr-mx.google.com with ESMTPS id r26si676858lfe.8.2021.01.10.23.36.34
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Sun, 10 Jan 2021 23:36:34 -0800 (PST)
Received-SPF: pass (google.com: domain of jan.kiszka@siemens.com designates 194.138.37.40 as permitted sender) client-ip=194.138.37.40;
Received: from mail2.sbs.de (mail2.sbs.de [192.129.41.66])
	by gecko.sbs.de (8.15.2/8.15.2) with ESMTPS id 10B7aUfE000336
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 11 Jan 2021 08:36:30 +0100
Received: from [167.87.43.185] ([167.87.43.185])
	by mail2.sbs.de (8.15.2/8.15.2) with ESMTP id 10B7aTF6005581;
	Mon, 11 Jan 2021 08:36:29 +0100
Subject: Re: [PATCH 00/14] Cache-coloring for Jailhouse
From: Jan Kiszka <jan.kiszka@siemens.com>
To: Andrea Bastoni <andrea.bastoni@tum.de>, jailhouse-dev@googlegroups.com
Cc: marco.solieri@unimore.it, rmancuso@bu.edu, lucmiccio@gmail.com
References: <20201123204613.252563-1-andrea.bastoni@tum.de>
 <49bddd30-ded4-3264-813c-940fc11e2354@siemens.com>
 <50b3ceff-d68d-b6c0-f335-8cec4fa67305@tum.de>
 <054fe4bd-e3ea-dfa5-c8aa-c3d2a2cad6fb@siemens.com>
 <6af26a83-8be5-0317-92c6-ffcdf636375a@tum.de>
 <085d4dfc-b4ca-a421-4f04-a04eb0d43e9c@siemens.com>
Message-ID: <6d17ea6d-8696-1fb3-6c67-93a1fc856b12@siemens.com>
Date: Mon, 11 Jan 2021 08:36:29 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
MIME-Version: 1.0
In-Reply-To: <085d4dfc-b4ca-a421-4f04-a04eb0d43e9c@siemens.com>
Content-Type: text/plain; charset="UTF-8"
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable
X-Original-Sender: jan.kiszka@siemens.com
X-Original-Authentication-Results: gmr-mx.google.com;       spf=pass
 (google.com: domain of jan.kiszka@siemens.com designates 194.138.37.40 as
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

On 25.11.20 17:12, Jan Kiszka wrote:
> On 25.11.20 16:59, Andrea Bastoni wrote:
>> On 25/11/2020 11:51, Jan Kiszka wrote:
>>> On 25.11.20 10:15, Andrea Bastoni wrote:
>>>> On 25/11/2020 07:07, Jan Kiszka wrote:
>>>>> On 23.11.20 21:45, Andrea Bastoni wrote:
>>>>>> Hello Jan, hi all,
>>>>>>
>>>>>> As discussed a couple of weeks ago, here an updated version of the "=
cache-coloring" for Jailhouse.
>>>>>>
>>>>>> A short recap on what's coloring (see Documentation/cache-coloring.m=
d):
>>>>>>> Cache coloring is a software technique that permits LLC partitionin=
g,
>>>>>>> therefore eliminating mutual core interference, and thus guaranteei=
ng more
>>>>>>> predictable performances for memory accesses.
>>>>>>
>>>>>> In this version of the patch, we've tried to keep the changes in the=
 hypervisor core minimal. Also, since coloring is something that should be =
transparent to inmates/VM (coloring belongs to the IPA/PA hypervisor transl=
ations), the Linux driver has been only minimally modified.
>>>>>>
>>>>>> Coloring API
>>>>>> ------------
>>>>>>
>>>>>> The patch adds a small architecture API layer that implements colori=
ng. The API is fully implemented only on arm64.  arm32 could be also a poss=
ible target for coloring, x86 already has CAT. Despite being implemented by=
 only one architecture, having a small common API layer integrates IMHO bet=
ter than other solutions in the main code (without adding conditionally com=
piled code).
>>>>>>
>>>>>> The API is:
>>>>>>     arch_color_map_memory_region()   // cell_create
>>>>>>         Color-maps the memory of the cell. Coloring requires multipl=
e passes to keep a contiguous VA, while "punching holes" in the PA accordin=
g to the allocated colors.
>>>>>>
>>>>>>     arch_color_unmap_memory_region() // cell_destroy
>>>>>>         The opposite of create: search and give back each piece of c=
olored PA.
>>>>>>
>>>>>>     arch_color_remap_to_root()       // cell_load
>>>>>>         Given that we don't want to modify the driver (i.e., we don'=
t want the driver to do non-contiguous color-ioremap) we let the root cell =
believe that the IPAs it is ioremapping are contiguous, but in reality the =
PA are non-contiguous (colored). This is currently done by using a very hig=
h VA (IPA) address as "base" for the load-remap-to-root-cell operation. Thi=
s value is configuration dependent and can be specified in the root cell to=
 avoid (unlikely) conflicts.
>>>>>>
>>>>>>     arch_color_unmap_from_root()     // cell_start
>>>>>>         Returns the mapping setup by the cell_load to the root cell.
>>>>>>
>>>>>> Two APIs are implemented only by arm64:
>>>>>>     arm_color_dcache_flush_memory_region()  // range flushing
>>>>>>         Also flushing should be done in a "colored way".
>>>>>>
>>>>>>     arm_color_init()                        // hook for the initiali=
zation of coloring
>>>>>>         Reads the parameters (size of the LLC way, base offset for t=
he load-remapping operation) needed by coloring. There's also some debuggin=
g code to autodetect the cache-geometry and determine the size of the way.
>>>>>>
>>>>>> Configuration
>>>>>> -------------
>>>>>>
>>>>>> From the configuration point of view, a colored memory region is a n=
ormal memory region with a color attached. The color is expressed directly =
in the memory region as color-bitmask and the flag JAILHOUSE_MEM_COLORED is=
 used to identify such a region. Contiguous bits in the bitmask identify a =
color (region) to be used for the memory region. The size of the mapping do=
esn't change due to coloring.
>>>>>>
>>>>>> For example, with 16 colors, a full way size is selected by 0xffff, =
while 1/4 of the way size is selected by 0x000f.
>>>>>>
>>>>>> (Note: we also experimented with a different version that defined se=
parate "normal" and "colored" memory regions. The approach presented in thi=
s version is more robust.)
>>>>>>
>>>>>> Main coloring "loop"
>>>>>> --------------------
>>>>>>
>>>>>> The coloring APIs basically boil down to a loop that appropriately s=
elects --according to the color-- the physical addresses where to perform a=
 selected operation. The selection is done efficiently with bit operations =
on the bitmask.
>>>>>>
>>>>>> An alternative approach is to hook coloring deep into the mapping fu=
nctionalities of the hypervisor. Basically, all low level mapping functions=
 support coloring, and the non-colored case becomes the "special case."
>>>>>> This approach was not followed because to be implemented "cleanly", =
all the architecture mapping APIs have to be extended to support coloring, =
but only one-architecture then really implement it.
>>>>>>
>>>>>> Instead, the implemented approach to have an additional "coloring" A=
PI integrates more nicely. Additionally, coloring will be hopefully only a =
transitory techniques (some years?) that could be eventually replaced by ha=
rdware-based techniques (e.g., MPAM). When this happens, removing the addit=
ional coloring API requires less rework than the other approach.
>>>>>>
>>>>>>
>>>>>> Debugging Code
>>>>>> --------------
>>>>>>
>>>>>> The patches also provide a "debugging-only" code that can be activat=
ed by defining CONFIG_DEBUG (it sounded more Jailhouse-oriented than NDEBUG=
). In debugging mode, the coloring provides an autodetection for arm64 cach=
e geometry.
>>>>>> Additionally, I've added an assert() function that can be used at ru=
ntime in debugging only contexts (could be used independently from coloring=
).
>>>>>>
>>>>>>
>>>>>> Feedback and comments welcome.
>>>>>>
>>>>>> Best,
>>>>>> Andrea
>>>>>>
>>>>>> Andrea Bastoni (12):
>>>>>>   arm-common: bitops: add most-significant-bit operation
>>>>>>   hypervisor, driver, archs: add basic empty infrastructure for colo=
ring
>>>>>>   hypervisor: arm64: add cache coloring implementation
>>>>>>   hypervisor configuration: hook autodetection for coloring_way_size
>>>>>>   configs: arm64: add example configuration for colored ZCU102 inmat=
e
>>>>>>   hypervisor: protect inclusion of control.h
>>>>>>   hypervisor, driver: add platform information to configure coloring
>>>>>>     params
>>>>>>   configs: arm64: hook-in coloring parameters for ZCU102
>>>>>>   hypervisor: provide runtime assert() helper for DEBUG only
>>>>>>   hypervisor: provide implementation for __assert_fail() and group
>>>>>>     panic-related functions
>>>>>>   hypervisor: coloring: use assert instead of "BUG"
>>>>>>   hypervisor: coloring: make cache autodetection debug-only
>>>>>>
>>>>>> Luca Miccio (2):
>>>>>>   Documentation: add description and usage of cache coloring support
>>>>>>   pyjailhouse: add support for colored regions
>>>>>>
>>>>>>  Documentation/cache-coloring.md               | 198 +++++++++++++++=
+++
>>>>>>  configs/arm64/zynqmp-zcu102-inmate-demo-col.c |  75 +++++++
>>>>>>  configs/arm64/zynqmp-zcu102.c                 |   6 +
>>>>>>  driver/cell.c                                 |  10 +-
>>>>>>  driver/cell.h                                 |   1 +
>>>>>>  driver/main.c                                 |  12 ++
>>>>>>  hypervisor/Makefile                           |   2 +-
>>>>>>  hypervisor/arch/arm-common/control.c          |   1 +
>>>>>>  .../arch/arm-common/include/asm/bitops.h      |  10 +
>>>>>>  .../arch/arm-common/include/asm/dcaches.h     |   8 +
>>>>>>  hypervisor/arch/arm-common/mmu_cell.c         |  52 +++--
>>>>>>  hypervisor/arch/arm/control.c                 |   1 +
>>>>>>  hypervisor/arch/arm/include/asm/coloring.h    |  59 ++++++
>>>>>>  hypervisor/arch/arm/traps.c                   |   1 +
>>>>>>  hypervisor/arch/arm64/Kbuild                  |   5 +
>>>>>>  hypervisor/arch/arm64/cache_layout.c          | 148 +++++++++++++
>>>>>>  hypervisor/arch/arm64/coloring.c              | 184 +++++++++++++++=
+
>>>>>>  hypervisor/arch/arm64/control.c               |   1 +
>>>>>>  .../arch/arm64/include/asm/cache_layout.h     |  21 ++
>>>>>>  hypervisor/arch/arm64/include/asm/coloring.h  | 137 ++++++++++++
>>>>>>  hypervisor/arch/arm64/setup.c                 |   3 +
>>>>>>  hypervisor/arch/arm64/traps.c                 |   1 +
>>>>>>  hypervisor/arch/x86/amd_iommu.c               |   1 +
>>>>>>  hypervisor/arch/x86/control.c                 |   1 +
>>>>>>  hypervisor/arch/x86/efifb.c                   |   1 +
>>>>>>  hypervisor/arch/x86/include/asm/coloring.h    |  45 ++++
>>>>>>  hypervisor/arch/x86/ioapic.c                  |   1 +
>>>>>>  hypervisor/arch/x86/svm.c                     |   1 +
>>>>>>  hypervisor/arch/x86/vmx.c                     |   1 +
>>>>>>  hypervisor/control.c                          | 111 ++++------
>>>>>>  hypervisor/include/jailhouse/assert.h         |  37 ++++
>>>>>>  hypervisor/include/jailhouse/control.h        |  34 +--
>>>>>>  hypervisor/include/jailhouse/panic.h          |  40 ++++
>>>>>>  hypervisor/include/jailhouse/printk.h         |   4 +
>>>>>>  hypervisor/panic.c                            |  86 ++++++++
>>>>>>  hypervisor/pci.c                              |   1 +
>>>>>>  hypervisor/printk.c                           |   1 +
>>>>>>  hypervisor/uart.c                             |   1 +
>>>>>>  include/jailhouse/cell-config.h               |  11 +
>>>>>>  pyjailhouse/config_parser.py                  |   9 +-
>>>>>>  40 files changed, 1201 insertions(+), 121 deletions(-)
>>>>>>  create mode 100644 Documentation/cache-coloring.md
>>>>>>  create mode 100644 configs/arm64/zynqmp-zcu102-inmate-demo-col.c
>>>>>>  create mode 100644 hypervisor/arch/arm/include/asm/coloring.h
>>>>>>  create mode 100644 hypervisor/arch/arm64/cache_layout.c
>>>>>>  create mode 100644 hypervisor/arch/arm64/coloring.c
>>>>>>  create mode 100644 hypervisor/arch/arm64/include/asm/cache_layout.h
>>>>>>  create mode 100644 hypervisor/arch/arm64/include/asm/coloring.h
>>>>>>  create mode 100644 hypervisor/arch/x86/include/asm/coloring.h
>>>>>>  create mode 100644 hypervisor/include/jailhouse/assert.h
>>>>>>  create mode 100644 hypervisor/include/jailhouse/panic.h
>>>>>>  create mode 100644 hypervisor/panic.c
>>>>>>
>>>>>
>>>>> Thanks for the update! I assume it's functional and can be used in
>>>>> tests? Asking as there seems to be a lot of debug code and comments.
>>>>
>>>> Yes, it is functional and it can be used for testing. I assumed this w=
asn't the
>>>> final version, and the debug code + commented out code are still there=
 in the
>>>> places where it can be useful to take a look to understand how the mac=
hinery is
>>>> working.
>>>>
>>>> I'm also interested in your point of view regarding having a CONFIG_DE=
BUG option
>>>> in Jailhouse. Basically a "debugging/development-enabled" version (wit=
h assert()
>>>> and extra verbose output), and a "production" one.
>>>>
>>>>> Scanning through it, I still find it very arm64-centric, rather than
>>>>
>>>> It is. As mentioned, I don't know if it is meaningful to have a x86 ve=
rsion of
>>>> the coloring, and for how long there will be the need to have coloring=
 in
>>>> software. So, the patches try to keep the changes in both hypervisor a=
nd driver
>>>> to a minimum.
>>>
>>> x86 might not be meaningful for modern CPUs with CAT, but it is another
>>> test case. But I'm also thinking of RISC-V and what else might come alo=
ng.
>>
>> Coloring in software on x86 might not be trivial. But yes, RISC-V could =
be a
>> test case, and maybe there will be some hardware support that can be exp=
loited
>> there...
>>
>>>>> generically addressing the topic as I pointed out in previous reviews=
.
>>>>> And keeping modifications of the driver minimal is not necessarily a
>>>>> sign we are on the same page already.
>>>>
>>>> We've experimented also with a version that does "more" in the driver.=
 I think
>>>> that more changes in the driver only add complexity. In the end the hy=
pervisor
>>>> have to distinguish anyway between colored and non-colored mapping, an=
d
>>>> scattering the load logic between driver and hypervisor has more maint=
enance
>>>> effort than a single clean configuration parameter.
>>>
>>> You are possibly right, it's just hard for me to follow this as there i=
s
>>> no code or more concrete design to prove that argument.
>>
>> I've synched with Luca and Marco, and I've pushed here
>>
>> https://gitlab.com/bastoni/jailhouse/-/commits/wip/design/coloring-drive=
r/
>>
>> some relevant commits that show how a possible driver-integrated solutio=
n could
>> look like.
>>
>> Note that the "jailhouse_ioremap_col()" function in driver/main.c basica=
lly
>> replicates the same coloring loop that should also be provided by the hy=
pervisor
>> to do colored-mapping and how the logic about the "next_colored()" shoul=
d be
>> "moved-up" to be shared between HV and driver.
>=20
> Need to look into that, so a blind shot: If it's mere replication of
> logic, a common include with the core functionality can help to avoid
> duplication. If it's more, this is a point.
>=20

Finally had the time to study: I don't see a major issue with the
jailhouse_ioremap_col replicating the mapping logic the hypervisor does.
The core logic is in next_colored, and that is shared.
jailhouse_ioremap_col is a simple loop.

However, jailhouse_ioremap_col should be enhanced to a generic
jailhouse_ioremap that maps also uncolored memory the same way. To my
understanding, next_colored already returns the next physical page in
the uncolored case.

>>
>> This non-clean separation, and the fact that the IPA/PA mapping should n=
ot
>> belong to the driver, but only to the HV are among the reasons why we mo=
ved to
>> the solution presented in the patch series.
>=20
> If code overall grows massively, it's valid to consolidate in the HV. If
> it's just about having it somewhere, the driver is the better place.
>=20

Would be interesting to see the diffstat of the hypervisor with your
driver coloring extension. The cache layout detection leaves to
hypervisor, and no new hypercall is added. Should be worth it.

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
jailhouse-dev/6d17ea6d-8696-1fb3-6c67-93a1fc856b12%40siemens.com.
