Return-Path: <jailhouse-dev+bncBCW2V5WNZMERBSV76D6QKGQEJ3ZELTI@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-wm1-x338.google.com (mail-wm1-x338.google.com [IPv6:2a00:1450:4864:20::338])
	by mail.lfdr.de (Postfix) with ESMTPS id A2C1F2C16B0
	for <lists+jailhouse-dev@lfdr.de>; Mon, 23 Nov 2020 21:47:06 +0100 (CET)
Received: by mail-wm1-x338.google.com with SMTP id y187sf195341wmy.3
        for <lists+jailhouse-dev@lfdr.de>; Mon, 23 Nov 2020 12:47:06 -0800 (PST)
ARC-Seal: i=2; a=rsa-sha256; t=1606164426; cv=pass;
        d=google.com; s=arc-20160816;
        b=01xuDaOFDhl42swfxyDKCWVXsZOr8g9U1Bhm3kNQ3ClS5KY9rsJADwmvAUokq83Xxl
         NxvC6PvZZm7bIVoGai0Tjsx7Oimk3nAaA1P3LA4T2JDYcZ4IXFXzYCpUsDwplghAASGS
         6G6uqsMHyOwiVS00fVwijM1W178kWraJPy3jFcf/qRXsegiaAlWFYReqsqXKmTJj3IYI
         QtHipWMX4nUQ/V/5lZUECn8uIhXLEku4Ik377aaiKU6jJJFTSWyaKIZEUcyRxZeD4onw
         qCj+0MtfyWHN52TLbK8Gn2zojmo9HtGi5qlGg+JznOFsKa61YxMWFre+4y/WtIip3ZKI
         i9dQ==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:content-transfer-encoding
         :mime-version:message-id:date:subject:cc:to:from:sender
         :dkim-signature;
        bh=bVL7RlrBnAroxkcRfxfQONh4i/tIcJgDWfiwgcipN1M=;
        b=xzeelMh8AiIETeX2m3kiIz3GQGNKPUbFaqDJGwrxtaGgKurN1MHv730p+YSmH6Ph5y
         z11aYgJ3TEVS9da1zTfPUu/abM1v2BN41KAuR+BQAlB2SqoITXUXrYwQywPmMWw9NsmJ
         hi1sS8YD7QKh0xoYeeqku4bGL+NKdE2o8AxZXwRWj3i7g3Gp8W5geqrrBuScEwvpPn6w
         VpWPzHHfgsXvYHbogEW0Nmh9/NnCNhvd7kEgeMDwPJMn4NTsnjvvGWzcT/zRt0IHkx7V
         wvKuUhYe952VLUdlPPgbJIWlOor3tujSRWef8IOmDooDOBytyDlICSGcJHwBDcus9R0t
         rnLA==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass header.i=@tum.de header.s=postout header.b=bz1kksxK;
       spf=pass (google.com: domain of andrea.bastoni@tum.de designates 2001:4ca0:0:103::81bb:ff8a as permitted sender) smtp.mailfrom=andrea.bastoni@tum.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=tum.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :list-post:list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=bVL7RlrBnAroxkcRfxfQONh4i/tIcJgDWfiwgcipN1M=;
        b=JSLzXKxLDoWcwBgV6z2CW0z1HXtvtB7DaYptwfGV/8Kef0jqQ6ByMnQnPfqwsnaLre
         s+InchhINTlXfXySOlTeL73QB2gPt0ozu50Mjw6pq54m7w4I0hyftiddGASdarLURayN
         5AfBG0+yvljxFGNIdKUkI/5u95hpVClP24suIUZPUIRUbZZLKRHh8fkO/bLzDCWNWiYJ
         DTHziPC79g3KgcVWMnyT7B8qDoNILUQebKK1geq/sD2XqWiBlu5hdFhg9++FJXEVP6ik
         KY9BxVA0kGwLtnF2QcerikMxgvwsIU4asKntbpTqHIIhfbAUFapt9nhicYgSjJ/+iXV6
         XEjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:from:to:cc:subject:date:message-id
         :mime-version:content-transfer-encoding:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :x-spam-checked-in-group:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=bVL7RlrBnAroxkcRfxfQONh4i/tIcJgDWfiwgcipN1M=;
        b=ex/LrIXt7EoNWn79520MM6sClFEE0kG0a5DpKt808nP4M0z0l1vWAMnFji2ehqP1vN
         QaG5EIQOVFC6ZwNMukl/bDs8v1Idq/eUv8EN0K7sU06mL43f57JsGWt+sA/w2aGDULtb
         3mmnlyEhmcxT4Bw6s12tkLSZqytLGxUMWr9N1dvP6OCYVNBdDpj3lxcmdZQpFynk0cf7
         Q6PXPLGO0R6GeH/jqkU5toePt9+6IMou6tG2lq50DrgiV7spIDVecuJoIG1jSul8ppdf
         9OudWi0yY8a5UQnwknMAL2itCa8rTqwjLG5gS6YUH/U8T5ceTOm+VabdNuT/00ezfWGt
         Lnmw==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AOAM531AZDgeQGaQ6ZkTx4iTdMOiTzcH3Sf02470tNVjRWM6Nx4n+/eK
	UspCu1HPv9luArwuAAtzQ/g=
X-Google-Smtp-Source: ABdhPJxh2fQVOxhBp7W3wfazKSTPOyo1rc+kMYFFLo47BAeEjUyUMqxfPJ3vo8o8YjPn1mtu7hA04A==
X-Received: by 2002:a5d:4408:: with SMTP id z8mr1668195wrq.204.1606164426421;
        Mon, 23 Nov 2020 12:47:06 -0800 (PST)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:adf:f70d:: with SMTP id r13ls9051218wrp.1.gmail; Mon, 23 Nov
 2020 12:47:05 -0800 (PST)
X-Received: by 2002:a5d:4e0a:: with SMTP id p10mr1590450wrt.358.1606164425513;
        Mon, 23 Nov 2020 12:47:05 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1606164425; cv=none;
        d=google.com; s=arc-20160816;
        b=zR2Autp1cBGCP3Gkes7ea+JI9ODnkWqOD9sqy/VCwQd+320ocZx3hh48JdiiL+Nno6
         RBoVm7zz1ukmkvETzmYaTMArgv1wXOnptMp4kOd0FJ0PWfGQNs8+2IH50qEp7hU7ovGA
         nGMHDZAzu0boE3tR9BQMHKEPBSSF4XfHQZOpQ+SZBQx857VK2xwWyIwdmtP0NTmBH8J6
         nUksMQWxlalQ4lXl8VSs5x7MYhzkcRX202STNdtaFjcYqhSJ2DCjlkrM3kPG1CZH8iOs
         Br8agzUrmzkpb5fsGClUF/bR7WSWCOG/xcywZHZA27dA88fqZE3akKBgYsw9y7Cy49JM
         uuXA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:dkim-signature;
        bh=A8zk51+DGCIVG94f2UmCNowTqnVZIwIY0MIUbwXw4uo=;
        b=cpOmZM5MksMIAKo2XZVJPXXsruQgMuVe19kWlC+PdUKc6S8WclLagJ6S6jKOnp7Uqj
         Hprc+99NHIORgKPDQWUd07lvScpOhtbYyI6AH1tV5X0io+tk7ki02977c6vdPa2Dnkwv
         WJfr4IdUj3H2vUNQFJlAVsVrqUsgSlnIwlWlRSZoqnxwLuB7rG/0owIZchFvmntLSO9U
         SHw4ItxtWN+yv/qYG9FhbrgqQVgRnsZf1n80h8GN39vAOAJhxeO0J0WydrhD2NtQ1Kyh
         WAc4YXK1nh4sUelftVNxiNBJ6YZzxjhuw6F+s7OVBg90Z9Q8xcn7GSmk0gxcx4uXgK5+
         8ROg==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       dkim=pass header.i=@tum.de header.s=postout header.b=bz1kksxK;
       spf=pass (google.com: domain of andrea.bastoni@tum.de designates 2001:4ca0:0:103::81bb:ff8a as permitted sender) smtp.mailfrom=andrea.bastoni@tum.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=tum.de
Received: from postout2.mail.lrz.de (postout2.mail.lrz.de. [2001:4ca0:0:103::81bb:ff8a])
        by gmr-mx.google.com with ESMTPS id y187si32287wmd.1.2020.11.23.12.47.05
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 23 Nov 2020 12:47:05 -0800 (PST)
Received-SPF: pass (google.com: domain of andrea.bastoni@tum.de designates 2001:4ca0:0:103::81bb:ff8a as permitted sender) client-ip=2001:4ca0:0:103::81bb:ff8a;
Received: from lxmhs52.srv.lrz.de (localhost [127.0.0.1])
	by postout2.mail.lrz.de (Postfix) with ESMTP id 4CfzjP1vsZzyTj;
	Mon, 23 Nov 2020 21:47:05 +0100 (CET)
X-Virus-Scanned: by amavisd-new at lrz.de in lxmhs52.srv.lrz.de
X-Spam-Flag: NO
X-Spam-Score: -2.877
X-Spam-Level: 
X-Spam-Status: No, score=-2.877 tagged_above=-999 required=5
	tests=[ALL_TRUSTED=-1, BAYES_00=-1.9, DMARC_ADKIM_RELAXED=0.001,
	DMARC_ASPF_RELAXED=0.001, DMARC_POLICY_NONE=0.001,
	LRZ_DMARC_FAIL=0.001, LRZ_DMARC_FAIL_NONE=0.001,
	LRZ_DMARC_POLICY=0.001, LRZ_DMARC_TUM_FAIL=0.001,
	LRZ_DMARC_TUM_REJECT=3.5, LRZ_DMARC_TUM_REJECT_PO=-3.5,
	LRZ_ENVFROM_FROM_ALIGNED_STRICT=0.001, LRZ_ENVFROM_FROM_MATCH=0.001,
	LRZ_ENVFROM_TUM_S=0.001, LRZ_FROM_HAS_A=0.001,
	LRZ_FROM_HAS_AAAA=0.001, LRZ_FROM_HAS_MDOM=0.001,
	LRZ_FROM_HAS_MX=0.001, LRZ_FROM_HOSTED_DOMAIN=0.001,
	LRZ_FROM_NAME_IN_ADDR=0.001, LRZ_FROM_PHRASE=0.001,
	LRZ_FROM_PRE_SUR=0.001, LRZ_FROM_PRE_SUR_PHRASE=0.001,
	LRZ_FROM_TUM_S=0.001, LRZ_HAS_SPF=0.001, LRZ_TO_SHORT=0.001,
	LRZ_URL_PLAIN_SINGLE=0.001] autolearn=no autolearn_force=no
Received: from postout2.mail.lrz.de ([127.0.0.1])
	by lxmhs52.srv.lrz.de (lxmhs52.srv.lrz.de [127.0.0.1]) (amavisd-new, port 20024)
	with LMTP id wf4B_3V1c_25; Mon, 23 Nov 2020 21:47:04 +0100 (CET)
Received: from kabal.lan (ip5f5ac6d0.dynamic.kabel-deutschland.de [95.90.198.208])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(Client did not present a certificate)
	by postout2.mail.lrz.de (Postfix) with ESMTPSA id 4CfzjN2hmzzyTf;
	Mon, 23 Nov 2020 21:47:04 +0100 (CET)
From: Andrea Bastoni <andrea.bastoni@tum.de>
To: jailhouse-dev@googlegroups.com
Cc: jan.kiszka@siemens.com,
	marco.solieri@unimore.it,
	rmancuso@bu.edu,
	lucmiccio@gmail.com,
	Andrea Bastoni <andrea.bastoni@tum.de>
Subject: [PATCH 00/14] Cache-coloring for Jailhouse
Date: Mon, 23 Nov 2020 21:45:59 +0100
Message-Id: <20201123204613.252563-1-andrea.bastoni@tum.de>
X-Mailer: git-send-email 2.29.2
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Original-Sender: andrea.bastoni@tum.de
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass
 header.i=@tum.de header.s=postout header.b=bz1kksxK;       spf=pass
 (google.com: domain of andrea.bastoni@tum.de designates 2001:4ca0:0:103::81bb:ff8a
 as permitted sender) smtp.mailfrom=andrea.bastoni@tum.de;       dmarc=pass
 (p=NONE sp=NONE dis=NONE) header.from=tum.de
Content-Type: text/plain; charset="UTF-8"
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

Hello Jan, hi all,

As discussed a couple of weeks ago, here an updated version of the "cache-c=
oloring" for Jailhouse.

A short recap on what's coloring (see Documentation/cache-coloring.md):
> Cache coloring is a software technique that permits LLC partitioning,
> therefore eliminating mutual core interference, and thus guaranteeing mor=
e
> predictable performances for memory accesses.

In this version of the patch, we've tried to keep the changes in the hyperv=
isor core minimal. Also, since coloring is something that should be transpa=
rent to inmates/VM (coloring belongs to the IPA/PA hypervisor translations)=
, the Linux driver has been only minimally modified.

Coloring API
------------

The patch adds a small architecture API layer that implements coloring. The=
 API is fully implemented only on arm64.  arm32 could be also a possible ta=
rget for coloring, x86 already has CAT. Despite being implemented by only o=
ne architecture, having a small common API layer integrates IMHO better tha=
n other solutions in the main code (without adding conditionally compiled c=
ode).

The API is:
    arch_color_map_memory_region()   // cell_create
        Color-maps the memory of the cell. Coloring requires multiple passe=
s to keep a contiguous VA, while "punching holes" in the PA according to th=
e allocated colors.

    arch_color_unmap_memory_region() // cell_destroy
        The opposite of create: search and give back each piece of colored =
PA.

    arch_color_remap_to_root()       // cell_load
        Given that we don't want to modify the driver (i.e., we don't want =
the driver to do non-contiguous color-ioremap) we let the root cell believe=
 that the IPAs it is ioremapping are contiguous, but in reality the PA are =
non-contiguous (colored). This is currently done by using a very high VA (I=
PA) address as "base" for the load-remap-to-root-cell operation. This value=
 is configuration dependent and can be specified in the root cell to avoid =
(unlikely) conflicts.

    arch_color_unmap_from_root()     // cell_start
        Returns the mapping setup by the cell_load to the root cell.

Two APIs are implemented only by arm64:
    arm_color_dcache_flush_memory_region()  // range flushing
        Also flushing should be done in a "colored way".

    arm_color_init()                        // hook for the initialization =
of coloring
        Reads the parameters (size of the LLC way, base offset for the load=
-remapping operation) needed by coloring. There's also some debugging code =
to autodetect the cache-geometry and determine the size of the way.

Configuration
-------------

From the configuration point of view, a colored memory region is a normal m=
emory region with a color attached. The color is expressed directly in the =
memory region as color-bitmask and the flag JAILHOUSE_MEM_COLORED is used t=
o identify such a region. Contiguous bits in the bitmask identify a color (=
region) to be used for the memory region. The size of the mapping doesn't c=
hange due to coloring.

For example, with 16 colors, a full way size is selected by 0xffff, while 1=
/4 of the way size is selected by 0x000f.

(Note: we also experimented with a different version that defined separate =
"normal" and "colored" memory regions. The approach presented in this versi=
on is more robust.)

Main coloring "loop"
--------------------

The coloring APIs basically boil down to a loop that appropriately selects =
--according to the color-- the physical addresses where to perform a select=
ed operation. The selection is done efficiently with bit operations on the =
bitmask.

An alternative approach is to hook coloring deep into the mapping functiona=
lities of the hypervisor. Basically, all low level mapping functions suppor=
t coloring, and the non-colored case becomes the "special case."
This approach was not followed because to be implemented "cleanly", all the=
 architecture mapping APIs have to be extended to support coloring, but onl=
y one-architecture then really implement it.

Instead, the implemented approach to have an additional "coloring" API inte=
grates more nicely. Additionally, coloring will be hopefully only a transit=
ory techniques (some years?) that could be eventually replaced by hardware-=
based techniques (e.g., MPAM). When this happens, removing the additional c=
oloring API requires less rework than the other approach.


Debugging Code
--------------

The patches also provide a "debugging-only" code that can be activated by d=
efining CONFIG_DEBUG (it sounded more Jailhouse-oriented than NDEBUG). In d=
ebugging mode, the coloring provides an autodetection for arm64 cache geome=
try.
Additionally, I've added an assert() function that can be used at runtime i=
n debugging only contexts (could be used independently from coloring).


Feedback and comments welcome.

Best,
Andrea

Andrea Bastoni (12):
  arm-common: bitops: add most-significant-bit operation
  hypervisor, driver, archs: add basic empty infrastructure for coloring
  hypervisor: arm64: add cache coloring implementation
  hypervisor configuration: hook autodetection for coloring_way_size
  configs: arm64: add example configuration for colored ZCU102 inmate
  hypervisor: protect inclusion of control.h
  hypervisor, driver: add platform information to configure coloring
    params
  configs: arm64: hook-in coloring parameters for ZCU102
  hypervisor: provide runtime assert() helper for DEBUG only
  hypervisor: provide implementation for __assert_fail() and group
    panic-related functions
  hypervisor: coloring: use assert instead of "BUG"
  hypervisor: coloring: make cache autodetection debug-only

Luca Miccio (2):
  Documentation: add description and usage of cache coloring support
  pyjailhouse: add support for colored regions

 Documentation/cache-coloring.md               | 198 ++++++++++++++++++
 configs/arm64/zynqmp-zcu102-inmate-demo-col.c |  75 +++++++
 configs/arm64/zynqmp-zcu102.c                 |   6 +
 driver/cell.c                                 |  10 +-
 driver/cell.h                                 |   1 +
 driver/main.c                                 |  12 ++
 hypervisor/Makefile                           |   2 +-
 hypervisor/arch/arm-common/control.c          |   1 +
 .../arch/arm-common/include/asm/bitops.h      |  10 +
 .../arch/arm-common/include/asm/dcaches.h     |   8 +
 hypervisor/arch/arm-common/mmu_cell.c         |  52 +++--
 hypervisor/arch/arm/control.c                 |   1 +
 hypervisor/arch/arm/include/asm/coloring.h    |  59 ++++++
 hypervisor/arch/arm/traps.c                   |   1 +
 hypervisor/arch/arm64/Kbuild                  |   5 +
 hypervisor/arch/arm64/cache_layout.c          | 148 +++++++++++++
 hypervisor/arch/arm64/coloring.c              | 184 ++++++++++++++++
 hypervisor/arch/arm64/control.c               |   1 +
 .../arch/arm64/include/asm/cache_layout.h     |  21 ++
 hypervisor/arch/arm64/include/asm/coloring.h  | 137 ++++++++++++
 hypervisor/arch/arm64/setup.c                 |   3 +
 hypervisor/arch/arm64/traps.c                 |   1 +
 hypervisor/arch/x86/amd_iommu.c               |   1 +
 hypervisor/arch/x86/control.c                 |   1 +
 hypervisor/arch/x86/efifb.c                   |   1 +
 hypervisor/arch/x86/include/asm/coloring.h    |  45 ++++
 hypervisor/arch/x86/ioapic.c                  |   1 +
 hypervisor/arch/x86/svm.c                     |   1 +
 hypervisor/arch/x86/vmx.c                     |   1 +
 hypervisor/control.c                          | 111 ++++------
 hypervisor/include/jailhouse/assert.h         |  37 ++++
 hypervisor/include/jailhouse/control.h        |  34 +--
 hypervisor/include/jailhouse/panic.h          |  40 ++++
 hypervisor/include/jailhouse/printk.h         |   4 +
 hypervisor/panic.c                            |  86 ++++++++
 hypervisor/pci.c                              |   1 +
 hypervisor/printk.c                           |   1 +
 hypervisor/uart.c                             |   1 +
 include/jailhouse/cell-config.h               |  11 +
 pyjailhouse/config_parser.py                  |   9 +-
 40 files changed, 1201 insertions(+), 121 deletions(-)
 create mode 100644 Documentation/cache-coloring.md
 create mode 100644 configs/arm64/zynqmp-zcu102-inmate-demo-col.c
 create mode 100644 hypervisor/arch/arm/include/asm/coloring.h
 create mode 100644 hypervisor/arch/arm64/cache_layout.c
 create mode 100644 hypervisor/arch/arm64/coloring.c
 create mode 100644 hypervisor/arch/arm64/include/asm/cache_layout.h
 create mode 100644 hypervisor/arch/arm64/include/asm/coloring.h
 create mode 100644 hypervisor/arch/x86/include/asm/coloring.h
 create mode 100644 hypervisor/include/jailhouse/assert.h
 create mode 100644 hypervisor/include/jailhouse/panic.h
 create mode 100644 hypervisor/panic.c

--=20
2.29.2

--=20
You received this message because you are subscribed to the Google Groups "=
Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/=
jailhouse-dev/20201123204613.252563-1-andrea.bastoni%40tum.de.
