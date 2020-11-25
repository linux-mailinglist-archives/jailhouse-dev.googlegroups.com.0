Return-Path: <jailhouse-dev+bncBCJI7SMNV4NBBJXJ676QKGQELTPTS5I@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-wr1-x43b.google.com (mail-wr1-x43b.google.com [IPv6:2a00:1450:4864:20::43b])
	by mail.lfdr.de (Postfix) with ESMTPS id 229022C38EB
	for <lists+jailhouse-dev@lfdr.de>; Wed, 25 Nov 2020 07:07:35 +0100 (CET)
Received: by mail-wr1-x43b.google.com with SMTP id 91sf372937wrk.17
        for <lists+jailhouse-dev@lfdr.de>; Tue, 24 Nov 2020 22:07:35 -0800 (PST)
ARC-Seal: i=2; a=rsa-sha256; t=1606284454; cv=pass;
        d=google.com; s=arc-20160816;
        b=opb9QzGRDSyHAy9D8N2t4x3iD2n3Kms/ivApCqOaM/fxxnRgVzn03ElvrIgmVzqq5O
         DLP00j1XQ47LzDyBQLxJQy1tMoh0258q9YVEV2xY6xiEcdS5NLq78JstFGyDg1mjKeBx
         4LeItAzhOUdo89F87sQ2wc7J0qrjl8fBEcD0HIu6MPgJI/mbFxMz/v8M46/ZxZNywnO2
         qTBudfGvLbyoBJIJsPdJbpMHuqfIyQQc8LogCZ2BZMh+8PgBv9XECh+r7B98hsSrsaSK
         y/HcZyAYqEs92kybWvPKFi/RxRAVCERgCfw8nS4kCYJouP/D+N7Yl9a2cHHxeVI8HczX
         S5CQ==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:cc:to:subject:sender:dkim-signature;
        bh=1jUlfl5Fzq3H/CwHUAUq89BH7WWl7hc39OcVWeSx20Q=;
        b=chmRMyiDpRgEQxHn0D80IsLQclr0SfMebrU3UsaAyfat+82LZMtOody4pln2dAOZcc
         BXaS42ojgoz9RG/bra4wW7JzZa3DYOIa2Eypi6TlKD/VOU//yyTw/TQrEN5igvDGIoGf
         TAc4FaPoy+9ODWzTHiQOdxpwSuvwhcHPywcmsaIzwZ2BqZCp2T7Fp4TeYiw1ATIxBFQK
         WU/7EbiFdA5+CI5Xauh8yZXVOfQ+VYUFcOrDG9nqCVuOEfD9Ota6HXlEYXtXfh5h1af5
         cbvq/4/AUAmCGcbMA6fZMgVlp2cUKxG+7L3l8hZfjwfAZSl9FwQdJGR1PTlXUkYgJN26
         BgBA==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 194.138.37.40 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding
         :x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=1jUlfl5Fzq3H/CwHUAUq89BH7WWl7hc39OcVWeSx20Q=;
        b=BkOIipmoMzvxUpNVlDZBW1GruQZq7mSdgN78i3NznMIyv9+IReOkNOvwAZDnO3rvpZ
         vTCHWVOJGqo3syBxZAB3F5cETRSobBXHU3/e7HNY2gdqBRJ+QSNBMyyDZD+4/n3Md3pK
         Hz1EbsZWkb30XNPxGLWtW4jfTurQUuEqdzwWT2FG+w1Mbnjip8FUNPVKBVLPXV8SDlHt
         BNFvJ7HEdfXRPG/dDvvEQgp7mmGoYsaRScQx51J5YYnkDFs2+TLIaYvGNjnIat+TcAWZ
         N+UwLqjRmpnSjtJAnuuQYmH+tMzNK8Cf2aqS7hfXWKp/lDgEGJMX691mU/RbVwk6dfh6
         FZsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:subject:to:cc:references:from:message-id
         :date:user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :x-spam-checked-in-group:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=1jUlfl5Fzq3H/CwHUAUq89BH7WWl7hc39OcVWeSx20Q=;
        b=iZG0rHS/Sl8g278m2z9WILA7pEKXpt7o0dyeQgaAt/L2lv5VXzvOv4qTpvchYWvVLJ
         6kPI3IxV26L6elzqSHHwoLaUkRU0lQL0iyLHqpFXjP1MzwHnXks/Wezzi+yOjSXzVr47
         D+/MB6PRXUOc8lHr00VMHvMiLKLh2gXb6MgbPP6Qij6DGZT+kainmMvbqnSRIgMqMIZm
         xcXhjT3x50LoISBqzStNlHnJlwfDScuD/cK9+H0WSRbm0HjA7UMjZ6Yzllel5m2HhYuz
         FpnxonFoOMLiExyDN4WuIFAXTp6c+rTb+4o2WAkQBw1mmZRr6g8mVkLdZsoURF4IOyT5
         L0Cw==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AOAM532djMCiPwTmFR8ZhpnUsKEyKGmbmvdeBDUvXSeGgvsI1M8XQvmm
	pHis5Z1pxjcZpoFRwK+Kv3o=
X-Google-Smtp-Source: ABdhPJxw4eTlAnkZi2pxK4oPF9FYjHHUljvLn6/6TB//TGNxoJq7JUjqCIW74hQz397DYEQZhNM+nQ==
X-Received: by 2002:a1c:c302:: with SMTP id t2mr1932376wmf.189.1606284454808;
        Tue, 24 Nov 2020 22:07:34 -0800 (PST)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:adf:e5c2:: with SMTP id a2ls1182799wrn.3.gmail; Tue, 24 Nov
 2020 22:07:33 -0800 (PST)
X-Received: by 2002:adf:bd86:: with SMTP id l6mr2134847wrh.205.1606284453791;
        Tue, 24 Nov 2020 22:07:33 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1606284453; cv=none;
        d=google.com; s=arc-20160816;
        b=sny8lhtBqh8R0JQpAdJ+hY7q03iKuNWm1FyctAeIBnbO+hwa/VaBBIDGrmcyAend88
         HYSEuEtDE5A7J4Y8mWrtoGvIG4VovQYtaSacp9xWYv5H6UQ4oswqY+3+VNPSkvwU2cKK
         6u5DhJVAfAP6L86ivDnLRxLijdrQXji6ZQ1HkDmXmUYdxDGnimIvE4xj/R79W7Cb2YVn
         XmzGCEIOaQr2lwp207Q6eLYCN8CvaFHB6/qh0ZXvscJUJz3qYhtGDjnUIDjh2Iv6Gdle
         dN29+aCL6EunXa5j7ANyaIt7JZ2Lc4f6SPlgdvdoDpf7N/boRpTawb9UmVrrV3xJz8Ru
         OdKA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:cc:to:subject;
        bh=cyyPW3Wqv33khyBBbjn2Cg1tKpJLKZTMHCf2PzimHRM=;
        b=K9g9cUmICI8CRKmtTIkA8HZZbJi94ouIY3+B8pCrZ/d1BqDyqhoSE5W/5XRUl1zj+O
         goORxRGHyRsaK8IskOqQtt7Kes0WwJqXyFmd3Ye71quyxjdGphZm0Fivtb5dXTnLs+zS
         /pSa2sHsQd0Tr0d7SPgVwfs+Df/OzkMEe69A9wg30ZVoXK+A0l5iltSz/a6a+T/A0ZgD
         N2oBbedv4QoWBjgkDZc+ssWbsARU3ewSmjaIUnWxpAZBcMnUSiO41i8Uq8ekpkBz3vEQ
         7dtO9cXJ9Gaw7oortKJ9/UETZsewKwDM+MVonPg4+fy3ZNKON2wwPd5SX5SlE6Sd7lC+
         I04w==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 194.138.37.40 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
Received: from gecko.sbs.de (gecko.sbs.de. [194.138.37.40])
        by gmr-mx.google.com with ESMTPS id y187si44167wmd.1.2020.11.24.22.07.33
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 24 Nov 2020 22:07:33 -0800 (PST)
Received-SPF: pass (google.com: domain of jan.kiszka@siemens.com designates 194.138.37.40 as permitted sender) client-ip=194.138.37.40;
Received: from mail2.sbs.de (mail2.sbs.de [192.129.41.66])
	by gecko.sbs.de (8.15.2/8.15.2) with ESMTPS id 0AP67SUp008251
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 25 Nov 2020 07:07:28 +0100
Received: from [167.87.38.29] ([167.87.38.29])
	by mail2.sbs.de (8.15.2/8.15.2) with ESMTP id 0AP67Sk0027512;
	Wed, 25 Nov 2020 07:07:28 +0100
Subject: Re: [PATCH 00/14] Cache-coloring for Jailhouse
To: Andrea Bastoni <andrea.bastoni@tum.de>, jailhouse-dev@googlegroups.com
Cc: marco.solieri@unimore.it, rmancuso@bu.edu, lucmiccio@gmail.com
References: <20201123204613.252563-1-andrea.bastoni@tum.de>
From: Jan Kiszka <jan.kiszka@siemens.com>
Message-ID: <49bddd30-ded4-3264-813c-940fc11e2354@siemens.com>
Date: Wed, 25 Nov 2020 07:07:28 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.0
MIME-Version: 1.0
In-Reply-To: <20201123204613.252563-1-andrea.bastoni@tum.de>
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

On 23.11.20 21:45, Andrea Bastoni wrote:
> Hello Jan, hi all,
>=20
> As discussed a couple of weeks ago, here an updated version of the "cache=
-coloring" for Jailhouse.
>=20
> A short recap on what's coloring (see Documentation/cache-coloring.md):
>> Cache coloring is a software technique that permits LLC partitioning,
>> therefore eliminating mutual core interference, and thus guaranteeing mo=
re
>> predictable performances for memory accesses.
>=20
> In this version of the patch, we've tried to keep the changes in the hype=
rvisor core minimal. Also, since coloring is something that should be trans=
parent to inmates/VM (coloring belongs to the IPA/PA hypervisor translation=
s), the Linux driver has been only minimally modified.
>=20
> Coloring API
> ------------
>=20
> The patch adds a small architecture API layer that implements coloring. T=
he API is fully implemented only on arm64.  arm32 could be also a possible =
target for coloring, x86 already has CAT. Despite being implemented by only=
 one architecture, having a small common API layer integrates IMHO better t=
han other solutions in the main code (without adding conditionally compiled=
 code).
>=20
> The API is:
>     arch_color_map_memory_region()   // cell_create
>         Color-maps the memory of the cell. Coloring requires multiple pas=
ses to keep a contiguous VA, while "punching holes" in the PA according to =
the allocated colors.
>=20
>     arch_color_unmap_memory_region() // cell_destroy
>         The opposite of create: search and give back each piece of colore=
d PA.
>=20
>     arch_color_remap_to_root()       // cell_load
>         Given that we don't want to modify the driver (i.e., we don't wan=
t the driver to do non-contiguous color-ioremap) we let the root cell belie=
ve that the IPAs it is ioremapping are contiguous, but in reality the PA ar=
e non-contiguous (colored). This is currently done by using a very high VA =
(IPA) address as "base" for the load-remap-to-root-cell operation. This val=
ue is configuration dependent and can be specified in the root cell to avoi=
d (unlikely) conflicts.
>=20
>     arch_color_unmap_from_root()     // cell_start
>         Returns the mapping setup by the cell_load to the root cell.
>=20
> Two APIs are implemented only by arm64:
>     arm_color_dcache_flush_memory_region()  // range flushing
>         Also flushing should be done in a "colored way".
>=20
>     arm_color_init()                        // hook for the initializatio=
n of coloring
>         Reads the parameters (size of the LLC way, base offset for the lo=
ad-remapping operation) needed by coloring. There's also some debugging cod=
e to autodetect the cache-geometry and determine the size of the way.
>=20
> Configuration
> -------------
>=20
> From the configuration point of view, a colored memory region is a normal=
 memory region with a color attached. The color is expressed directly in th=
e memory region as color-bitmask and the flag JAILHOUSE_MEM_COLORED is used=
 to identify such a region. Contiguous bits in the bitmask identify a color=
 (region) to be used for the memory region. The size of the mapping doesn't=
 change due to coloring.
>=20
> For example, with 16 colors, a full way size is selected by 0xffff, while=
 1/4 of the way size is selected by 0x000f.
>=20
> (Note: we also experimented with a different version that defined separat=
e "normal" and "colored" memory regions. The approach presented in this ver=
sion is more robust.)
>=20
> Main coloring "loop"
> --------------------
>=20
> The coloring APIs basically boil down to a loop that appropriately select=
s --according to the color-- the physical addresses where to perform a sele=
cted operation. The selection is done efficiently with bit operations on th=
e bitmask.
>=20
> An alternative approach is to hook coloring deep into the mapping functio=
nalities of the hypervisor. Basically, all low level mapping functions supp=
ort coloring, and the non-colored case becomes the "special case."
> This approach was not followed because to be implemented "cleanly", all t=
he architecture mapping APIs have to be extended to support coloring, but o=
nly one-architecture then really implement it.
>=20
> Instead, the implemented approach to have an additional "coloring" API in=
tegrates more nicely. Additionally, coloring will be hopefully only a trans=
itory techniques (some years?) that could be eventually replaced by hardwar=
e-based techniques (e.g., MPAM). When this happens, removing the additional=
 coloring API requires less rework than the other approach.
>=20
>=20
> Debugging Code
> --------------
>=20
> The patches also provide a "debugging-only" code that can be activated by=
 defining CONFIG_DEBUG (it sounded more Jailhouse-oriented than NDEBUG). In=
 debugging mode, the coloring provides an autodetection for arm64 cache geo=
metry.
> Additionally, I've added an assert() function that can be used at runtime=
 in debugging only contexts (could be used independently from coloring).
>=20
>=20
> Feedback and comments welcome.
>=20
> Best,
> Andrea
>=20
> Andrea Bastoni (12):
>   arm-common: bitops: add most-significant-bit operation
>   hypervisor, driver, archs: add basic empty infrastructure for coloring
>   hypervisor: arm64: add cache coloring implementation
>   hypervisor configuration: hook autodetection for coloring_way_size
>   configs: arm64: add example configuration for colored ZCU102 inmate
>   hypervisor: protect inclusion of control.h
>   hypervisor, driver: add platform information to configure coloring
>     params
>   configs: arm64: hook-in coloring parameters for ZCU102
>   hypervisor: provide runtime assert() helper for DEBUG only
>   hypervisor: provide implementation for __assert_fail() and group
>     panic-related functions
>   hypervisor: coloring: use assert instead of "BUG"
>   hypervisor: coloring: make cache autodetection debug-only
>=20
> Luca Miccio (2):
>   Documentation: add description and usage of cache coloring support
>   pyjailhouse: add support for colored regions
>=20
>  Documentation/cache-coloring.md               | 198 ++++++++++++++++++
>  configs/arm64/zynqmp-zcu102-inmate-demo-col.c |  75 +++++++
>  configs/arm64/zynqmp-zcu102.c                 |   6 +
>  driver/cell.c                                 |  10 +-
>  driver/cell.h                                 |   1 +
>  driver/main.c                                 |  12 ++
>  hypervisor/Makefile                           |   2 +-
>  hypervisor/arch/arm-common/control.c          |   1 +
>  .../arch/arm-common/include/asm/bitops.h      |  10 +
>  .../arch/arm-common/include/asm/dcaches.h     |   8 +
>  hypervisor/arch/arm-common/mmu_cell.c         |  52 +++--
>  hypervisor/arch/arm/control.c                 |   1 +
>  hypervisor/arch/arm/include/asm/coloring.h    |  59 ++++++
>  hypervisor/arch/arm/traps.c                   |   1 +
>  hypervisor/arch/arm64/Kbuild                  |   5 +
>  hypervisor/arch/arm64/cache_layout.c          | 148 +++++++++++++
>  hypervisor/arch/arm64/coloring.c              | 184 ++++++++++++++++
>  hypervisor/arch/arm64/control.c               |   1 +
>  .../arch/arm64/include/asm/cache_layout.h     |  21 ++
>  hypervisor/arch/arm64/include/asm/coloring.h  | 137 ++++++++++++
>  hypervisor/arch/arm64/setup.c                 |   3 +
>  hypervisor/arch/arm64/traps.c                 |   1 +
>  hypervisor/arch/x86/amd_iommu.c               |   1 +
>  hypervisor/arch/x86/control.c                 |   1 +
>  hypervisor/arch/x86/efifb.c                   |   1 +
>  hypervisor/arch/x86/include/asm/coloring.h    |  45 ++++
>  hypervisor/arch/x86/ioapic.c                  |   1 +
>  hypervisor/arch/x86/svm.c                     |   1 +
>  hypervisor/arch/x86/vmx.c                     |   1 +
>  hypervisor/control.c                          | 111 ++++------
>  hypervisor/include/jailhouse/assert.h         |  37 ++++
>  hypervisor/include/jailhouse/control.h        |  34 +--
>  hypervisor/include/jailhouse/panic.h          |  40 ++++
>  hypervisor/include/jailhouse/printk.h         |   4 +
>  hypervisor/panic.c                            |  86 ++++++++
>  hypervisor/pci.c                              |   1 +
>  hypervisor/printk.c                           |   1 +
>  hypervisor/uart.c                             |   1 +
>  include/jailhouse/cell-config.h               |  11 +
>  pyjailhouse/config_parser.py                  |   9 +-
>  40 files changed, 1201 insertions(+), 121 deletions(-)
>  create mode 100644 Documentation/cache-coloring.md
>  create mode 100644 configs/arm64/zynqmp-zcu102-inmate-demo-col.c
>  create mode 100644 hypervisor/arch/arm/include/asm/coloring.h
>  create mode 100644 hypervisor/arch/arm64/cache_layout.c
>  create mode 100644 hypervisor/arch/arm64/coloring.c
>  create mode 100644 hypervisor/arch/arm64/include/asm/cache_layout.h
>  create mode 100644 hypervisor/arch/arm64/include/asm/coloring.h
>  create mode 100644 hypervisor/arch/x86/include/asm/coloring.h
>  create mode 100644 hypervisor/include/jailhouse/assert.h
>  create mode 100644 hypervisor/include/jailhouse/panic.h
>  create mode 100644 hypervisor/panic.c
>=20

Thanks for the update! I assume it's functional and can be used in
tests? Asking as there seems to be a lot of debug code and comments.

Scanning through it, I still find it very arm64-centric, rather than
generically addressing the topic as I pointed out in previous reviews.
And keeping modifications of the driver minimal is not necessarily a
sign we are on the same page already.

For testing purposes, please also include a QEMU configuration change in
the future. Helps validating things and playing the functional changes.

The patch series should further more be structured in way that a static,
config-defined way-size can be used before any arch-specific
auto-detection logic is added.

Thanks,
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
jailhouse-dev/49bddd30-ded4-3264-813c-940fc11e2354%40siemens.com.
