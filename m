Return-Path: <jailhouse-dev+bncBCW2V5WNZMERBVH67H6QKGQETTZ55OI@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-lf1-x13f.google.com (mail-lf1-x13f.google.com [IPv6:2a00:1450:4864:20::13f])
	by mail.lfdr.de (Postfix) with ESMTPS id 54E822C4491
	for <lists+jailhouse-dev@lfdr.de>; Wed, 25 Nov 2020 16:59:17 +0100 (CET)
Received: by mail-lf1-x13f.google.com with SMTP id 190sf999303lff.4
        for <lists+jailhouse-dev@lfdr.de>; Wed, 25 Nov 2020 07:59:17 -0800 (PST)
ARC-Seal: i=2; a=rsa-sha256; t=1606319956; cv=pass;
        d=google.com; s=arc-20160816;
        b=wPvQ3qp5FZ+hJDSUig6SMiZB5+b0Be0iw2gGQMm2G+iRFpAiV5Q3OSkzMQJsQHSs0o
         57inpX6xyhrwsQhHMxV/2zEkR3ErAsypwJ9Cb7jIAsaIQ/OlWwbIag3MjBYb5UIB5lk7
         Yk81nm1GPKU8wr5WVn6+Q07yjZqRtwwYrjTSqdfLTH+YMAs8KNveDUKxwhFXDq9noUwd
         iY+2pV3TOVbEAuQo2zmrkKY+vqAY4fFEJk8PtT2c/EUfm7vZwqDMmVXcbV9R9XITPtYw
         PWjjkuohZqmceIEG5s+GtQ86oW7kTFYpXLtrXZbTHxH51wwmxqw09rqGgHm1sAEthm4k
         T6uA==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:content-language:in-reply-to
         :mime-version:user-agent:date:message-id:autocrypt:from:references
         :cc:to:subject:sender:dkim-signature;
        bh=v/lSuqZyccnMbbxo64REJ9X/ZufZWFVt0MkY2SY20I8=;
        b=odQV9gp00uBN0JvDhYmgHjuTrUHWst+2VwHuaLSgYQoSRqgXSgrnegtXlOexvavZN1
         5bsCic4bIgmYMwTEo7RzW/m69NsuAiV269/URfz9Q/Ha6ZTeNwkyfwCO03k4Jq0uQb8i
         p1CWGGErma/xCp8szLxx6NLTsfuFqFK50+T4eEplQLmcX0vq0TxQpH/2E+mN81yrfsCL
         n25Mg4977WXW3DnyVpBjr3zhWJwUdssQ76FuonGQH/abvn8s6Dx6ey8BvzcXy3+PJMFr
         fVwGzqTS3KGWzB+52h8oiLBCCn1CDr6go2GhlnlXWBtb+sqjs505b0Dg+DwhoCKGhv9V
         9doA==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass header.i=@tum.de header.s=postout header.b=d2etZuyc;
       spf=pass (google.com: domain of andrea.bastoni@tum.de designates 129.187.255.137 as permitted sender) smtp.mailfrom=andrea.bastoni@tum.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=tum.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:subject:to:cc:references:from:autocrypt:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=v/lSuqZyccnMbbxo64REJ9X/ZufZWFVt0MkY2SY20I8=;
        b=UGbum6F+fkVFYxPgrUwAUfPKea6zry1xUYknvGUMqNb8Zt5jpempKz3YqkvBQXR7Pl
         aMe6bv5M3jS8mLHjCmhDgldkzTeCw/t/dUgMPypGRHg8bnsBSIyP6szGC4z1wH7URT6B
         mKT7xAZvlnUXUQoXecw+av5yvwjojvAviPD5bY2uWK8yMywMmNtlT5L1T2qqIIuuh9Vg
         DUZWgjBziBT7RDxwk/NZ2rENwOnTdi80kisK9AoNueZe7OIrHl14gXv9xx8r5hiRjQqH
         VPnQH6NJe01LUBhEqySC6Q5o/ub8zV5XyMTG0fsSrE24lydK/jen6ijJg6OwOTuxvt1M
         XFOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:subject:to:cc:references:from:autocrypt
         :message-id:date:user-agent:mime-version:in-reply-to
         :content-language:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :x-spam-checked-in-group:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=v/lSuqZyccnMbbxo64REJ9X/ZufZWFVt0MkY2SY20I8=;
        b=W/F9KyEqAGigxnVKczXrqjdgIDFdYG4tI6ERv67XjrbTqI/szXwur/pQ+fgb79GIFF
         gA+FrPXqAGE4MH9x3HpBly4xOm5youqT4nLcbNT3ZZinPPJMvU7Sl15Py8hExI2NEww9
         YSNL3c1ZWVX9IwupOsfcwzZyjCmL5R53c0tQ4GBSuqJfbG0yabEHSUNj199oj1ZcHoV4
         XxEj9lg8HQcyXfiu7UUAB3FOz84KBtzo/9dorajbwB0m+ubHTafnCpoAKTJ4gbNSC+rs
         3xx9jSNV5F94BJ7kRalT27s2hoD9+vltwR78ygJHL7sUaYV1lNpgrY+6j5aNeexDqydK
         679Q==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AOAM532mkJq3VAHvEWQw3NsKeVX2r2BD0inwF7ma8Zd7ZDIc39JVBS7M
	OjK7cBmHKM5kyaP7uiYXTWg=
X-Google-Smtp-Source: ABdhPJz7gg8qJxXAbJUL/GEJjqRN30MbEgS95IkwRskdsypjtTJN7Ib7dJcy8OIuX0uhxVXwHULedQ==
X-Received: by 2002:ac2:550d:: with SMTP id j13mr1709861lfk.301.1606319956759;
        Wed, 25 Nov 2020 07:59:16 -0800 (PST)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a19:d0e:: with SMTP id 14ls1871115lfn.0.gmail; Wed, 25 Nov
 2020 07:59:15 -0800 (PST)
X-Received: by 2002:a19:7b06:: with SMTP id w6mr1574596lfc.260.1606319955419;
        Wed, 25 Nov 2020 07:59:15 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1606319955; cv=none;
        d=google.com; s=arc-20160816;
        b=Eg/P114YqbnpgylK5i4YJkIcAl0+zqXWM9uIEV1XM64FKPXnk7M9u+jD8iSxc91w7f
         kpiQUirV7MI3dSs+ECdJEqSLoEF+RgNcgHHkVN02jBdazbCz9ITZ4BSdvumO4h03WmsG
         T7lOIdMhatO+3EfeeIHBvlrTQDG76NWbzBJuN3oU/7xODgeH8L/JyzX2hE84V3+ABbRf
         HhyLCZbRiaWeTnjASOHzQkyBzkGHrvb696k/uc0SimnBvAagx4xNXTDqOKWOPiraeW3o
         6WfBBS7+kYVEEMnti++dOctAGCVsVgVlVIrXMU6vyLfy2CY4QVLZkplSmbpNreoPP0D0
         mMPQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-language:in-reply-to:mime-version:user-agent:date
         :message-id:autocrypt:from:references:cc:to:subject:dkim-signature;
        bh=CwI6YHKa3Deal0Wldv1vdd3O2MWyOVsADMUZzInTYgU=;
        b=L07zSRb7BIugzx6cCTEpqdoR1Y8ZWuqJG7lNtgvNUTd3UWjgGCQsNPI70jYoGAuypw
         uiE3WsYQRBDPLIJzCBwROx9yL8JYRGgq1VISEJzn+7lGa4VLRh3rQrr+kzj3WJK6qUIF
         UOTunl5Zqud7Pj7plr2J4mOQHw83l56GcvWues0Bi4iSI1xYXJGl/GXw9h172VWq8+Ry
         BFsghnWjo3+ftEqCZiKE82avI4edULXV7BO4SdZteC7kiAIsBwqUZRCAo8IhkNM7yYzs
         AKZc22BeV7vQFP4kwXZ1wH2cRX5QGaHW94nH4nu3dliPconpMUzRuAXRxD4VFiXdahQI
         c71A==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       dkim=pass header.i=@tum.de header.s=postout header.b=d2etZuyc;
       spf=pass (google.com: domain of andrea.bastoni@tum.de designates 129.187.255.137 as permitted sender) smtp.mailfrom=andrea.bastoni@tum.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=tum.de
Received: from postout1.mail.lrz.de (postout1.mail.lrz.de. [129.187.255.137])
        by gmr-mx.google.com with ESMTPS id h4si84087ljl.6.2020.11.25.07.59.15
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 25 Nov 2020 07:59:15 -0800 (PST)
Received-SPF: pass (google.com: domain of andrea.bastoni@tum.de designates 129.187.255.137 as permitted sender) client-ip=129.187.255.137;
Received: from lxmhs51.srv.lrz.de (localhost [127.0.0.1])
	by postout1.mail.lrz.de (Postfix) with ESMTP id 4Ch5DL68DgzyWT;
	Wed, 25 Nov 2020 16:59:14 +0100 (CET)
X-Virus-Scanned: by amavisd-new at lrz.de in lxmhs51.srv.lrz.de
X-Spam-Flag: NO
X-Spam-Score: -2.871
X-Spam-Level: 
X-Spam-Status: No, score=-2.871 tagged_above=-999 required=5
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
	LRZ_FROM_TUM_S=0.001, LRZ_HAS_BND=0.001, LRZ_HAS_CLANG=0.001,
	LRZ_HAS_IN_REPLY_TO=0.001, LRZ_HAS_SPF=0.001, LRZ_HAS_URL_HTTP=0.001,
	LRZ_MSGID_HL8_3HL4_HL12=0.001, LRZ_MSGID_MOZ=0.001, LRZ_UA_MOZ=0.001,
	LRZ_URL_HTTP_SINGLE=0.001, LRZ_URL_PLAIN_SINGLE=0.001,
	NICE_REPLY_A=-0.001] autolearn=no autolearn_force=no
Received: from postout1.mail.lrz.de ([127.0.0.1])
	by lxmhs51.srv.lrz.de (lxmhs51.srv.lrz.de [127.0.0.1]) (amavisd-new, port 20024)
	with LMTP id rcoOH8UZjBYL; Wed, 25 Nov 2020 16:59:14 +0100 (CET)
Received: from [10.162.12.242] (unknown [10.162.12.242])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(Client did not present a certificate)
	by postout1.mail.lrz.de (Postfix) with ESMTPSA id 4Ch5DK5JhczyTS;
	Wed, 25 Nov 2020 16:59:13 +0100 (CET)
Subject: Re: [PATCH 00/14] Cache-coloring for Jailhouse
To: Jan Kiszka <jan.kiszka@siemens.com>, jailhouse-dev@googlegroups.com
Cc: marco.solieri@unimore.it, rmancuso@bu.edu, lucmiccio@gmail.com
References: <20201123204613.252563-1-andrea.bastoni@tum.de>
 <49bddd30-ded4-3264-813c-940fc11e2354@siemens.com>
 <50b3ceff-d68d-b6c0-f335-8cec4fa67305@tum.de>
 <054fe4bd-e3ea-dfa5-c8aa-c3d2a2cad6fb@siemens.com>
From: Andrea Bastoni <andrea.bastoni@tum.de>
Autocrypt: addr=andrea.bastoni@tum.de; keydata=
 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
Message-ID: <6af26a83-8be5-0317-92c6-ffcdf636375a@tum.de>
Date: Wed, 25 Nov 2020 16:59:13 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.0
MIME-Version: 1.0
In-Reply-To: <054fe4bd-e3ea-dfa5-c8aa-c3d2a2cad6fb@siemens.com>
Content-Type: multipart/mixed;
 boundary="------------CD501F0D439DC7306A70A2E9"
Content-Language: en-US
X-Original-Sender: andrea.bastoni@tum.de
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass
 header.i=@tum.de header.s=postout header.b=d2etZuyc;       spf=pass
 (google.com: domain of andrea.bastoni@tum.de designates 129.187.255.137 as
 permitted sender) smtp.mailfrom=andrea.bastoni@tum.de;       dmarc=pass
 (p=NONE sp=NONE dis=NONE) header.from=tum.de
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

This is a multi-part message in MIME format.
--------------CD501F0D439DC7306A70A2E9
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On 25/11/2020 11:51, Jan Kiszka wrote:
> On 25.11.20 10:15, Andrea Bastoni wrote:
>> On 25/11/2020 07:07, Jan Kiszka wrote:
>>> On 23.11.20 21:45, Andrea Bastoni wrote:
>>>> Hello Jan, hi all,
>>>>
>>>> As discussed a couple of weeks ago, here an updated version of the "ca=
che-coloring" for Jailhouse.
>>>>
>>>> A short recap on what's coloring (see Documentation/cache-coloring.md)=
:
>>>>> Cache coloring is a software technique that permits LLC partitioning,
>>>>> therefore eliminating mutual core interference, and thus guaranteeing=
 more
>>>>> predictable performances for memory accesses.
>>>>
>>>> In this version of the patch, we've tried to keep the changes in the h=
ypervisor core minimal. Also, since coloring is something that should be tr=
ansparent to inmates/VM (coloring belongs to the IPA/PA hypervisor translat=
ions), the Linux driver has been only minimally modified.
>>>>
>>>> Coloring API
>>>> ------------
>>>>
>>>> The patch adds a small architecture API layer that implements coloring=
. The API is fully implemented only on arm64.  arm32 could be also a possib=
le target for coloring, x86 already has CAT. Despite being implemented by o=
nly one architecture, having a small common API layer integrates IMHO bette=
r than other solutions in the main code (without adding conditionally compi=
led code).
>>>>
>>>> The API is:
>>>>     arch_color_map_memory_region()   // cell_create
>>>>         Color-maps the memory of the cell. Coloring requires multiple =
passes to keep a contiguous VA, while "punching holes" in the PA according =
to the allocated colors.
>>>>
>>>>     arch_color_unmap_memory_region() // cell_destroy
>>>>         The opposite of create: search and give back each piece of col=
ored PA.
>>>>
>>>>     arch_color_remap_to_root()       // cell_load
>>>>         Given that we don't want to modify the driver (i.e., we don't =
want the driver to do non-contiguous color-ioremap) we let the root cell be=
lieve that the IPAs it is ioremapping are contiguous, but in reality the PA=
 are non-contiguous (colored). This is currently done by using a very high =
VA (IPA) address as "base" for the load-remap-to-root-cell operation. This =
value is configuration dependent and can be specified in the root cell to a=
void (unlikely) conflicts.
>>>>
>>>>     arch_color_unmap_from_root()     // cell_start
>>>>         Returns the mapping setup by the cell_load to the root cell.
>>>>
>>>> Two APIs are implemented only by arm64:
>>>>     arm_color_dcache_flush_memory_region()  // range flushing
>>>>         Also flushing should be done in a "colored way".
>>>>
>>>>     arm_color_init()                        // hook for the initializa=
tion of coloring
>>>>         Reads the parameters (size of the LLC way, base offset for the=
 load-remapping operation) needed by coloring. There's also some debugging =
code to autodetect the cache-geometry and determine the size of the way.
>>>>
>>>> Configuration
>>>> -------------
>>>>
>>>> From the configuration point of view, a colored memory region is a nor=
mal memory region with a color attached. The color is expressed directly in=
 the memory region as color-bitmask and the flag JAILHOUSE_MEM_COLORED is u=
sed to identify such a region. Contiguous bits in the bitmask identify a co=
lor (region) to be used for the memory region. The size of the mapping does=
n't change due to coloring.
>>>>
>>>> For example, with 16 colors, a full way size is selected by 0xffff, wh=
ile 1/4 of the way size is selected by 0x000f.
>>>>
>>>> (Note: we also experimented with a different version that defined sepa=
rate "normal" and "colored" memory regions. The approach presented in this =
version is more robust.)
>>>>
>>>> Main coloring "loop"
>>>> --------------------
>>>>
>>>> The coloring APIs basically boil down to a loop that appropriately sel=
ects --according to the color-- the physical addresses where to perform a s=
elected operation. The selection is done efficiently with bit operations on=
 the bitmask.
>>>>
>>>> An alternative approach is to hook coloring deep into the mapping func=
tionalities of the hypervisor. Basically, all low level mapping functions s=
upport coloring, and the non-colored case becomes the "special case."
>>>> This approach was not followed because to be implemented "cleanly", al=
l the architecture mapping APIs have to be extended to support coloring, bu=
t only one-architecture then really implement it.
>>>>
>>>> Instead, the implemented approach to have an additional "coloring" API=
 integrates more nicely. Additionally, coloring will be hopefully only a tr=
ansitory techniques (some years?) that could be eventually replaced by hard=
ware-based techniques (e.g., MPAM). When this happens, removing the additio=
nal coloring API requires less rework than the other approach.
>>>>
>>>>
>>>> Debugging Code
>>>> --------------
>>>>
>>>> The patches also provide a "debugging-only" code that can be activated=
 by defining CONFIG_DEBUG (it sounded more Jailhouse-oriented than NDEBUG).=
 In debugging mode, the coloring provides an autodetection for arm64 cache =
geometry.
>>>> Additionally, I've added an assert() function that can be used at runt=
ime in debugging only contexts (could be used independently from coloring).
>>>>
>>>>
>>>> Feedback and comments welcome.
>>>>
>>>> Best,
>>>> Andrea
>>>>
>>>> Andrea Bastoni (12):
>>>>   arm-common: bitops: add most-significant-bit operation
>>>>   hypervisor, driver, archs: add basic empty infrastructure for colori=
ng
>>>>   hypervisor: arm64: add cache coloring implementation
>>>>   hypervisor configuration: hook autodetection for coloring_way_size
>>>>   configs: arm64: add example configuration for colored ZCU102 inmate
>>>>   hypervisor: protect inclusion of control.h
>>>>   hypervisor, driver: add platform information to configure coloring
>>>>     params
>>>>   configs: arm64: hook-in coloring parameters for ZCU102
>>>>   hypervisor: provide runtime assert() helper for DEBUG only
>>>>   hypervisor: provide implementation for __assert_fail() and group
>>>>     panic-related functions
>>>>   hypervisor: coloring: use assert instead of "BUG"
>>>>   hypervisor: coloring: make cache autodetection debug-only
>>>>
>>>> Luca Miccio (2):
>>>>   Documentation: add description and usage of cache coloring support
>>>>   pyjailhouse: add support for colored regions
>>>>
>>>>  Documentation/cache-coloring.md               | 198 +++++++++++++++++=
+
>>>>  configs/arm64/zynqmp-zcu102-inmate-demo-col.c |  75 +++++++
>>>>  configs/arm64/zynqmp-zcu102.c                 |   6 +
>>>>  driver/cell.c                                 |  10 +-
>>>>  driver/cell.h                                 |   1 +
>>>>  driver/main.c                                 |  12 ++
>>>>  hypervisor/Makefile                           |   2 +-
>>>>  hypervisor/arch/arm-common/control.c          |   1 +
>>>>  .../arch/arm-common/include/asm/bitops.h      |  10 +
>>>>  .../arch/arm-common/include/asm/dcaches.h     |   8 +
>>>>  hypervisor/arch/arm-common/mmu_cell.c         |  52 +++--
>>>>  hypervisor/arch/arm/control.c                 |   1 +
>>>>  hypervisor/arch/arm/include/asm/coloring.h    |  59 ++++++
>>>>  hypervisor/arch/arm/traps.c                   |   1 +
>>>>  hypervisor/arch/arm64/Kbuild                  |   5 +
>>>>  hypervisor/arch/arm64/cache_layout.c          | 148 +++++++++++++
>>>>  hypervisor/arch/arm64/coloring.c              | 184 ++++++++++++++++
>>>>  hypervisor/arch/arm64/control.c               |   1 +
>>>>  .../arch/arm64/include/asm/cache_layout.h     |  21 ++
>>>>  hypervisor/arch/arm64/include/asm/coloring.h  | 137 ++++++++++++
>>>>  hypervisor/arch/arm64/setup.c                 |   3 +
>>>>  hypervisor/arch/arm64/traps.c                 |   1 +
>>>>  hypervisor/arch/x86/amd_iommu.c               |   1 +
>>>>  hypervisor/arch/x86/control.c                 |   1 +
>>>>  hypervisor/arch/x86/efifb.c                   |   1 +
>>>>  hypervisor/arch/x86/include/asm/coloring.h    |  45 ++++
>>>>  hypervisor/arch/x86/ioapic.c                  |   1 +
>>>>  hypervisor/arch/x86/svm.c                     |   1 +
>>>>  hypervisor/arch/x86/vmx.c                     |   1 +
>>>>  hypervisor/control.c                          | 111 ++++------
>>>>  hypervisor/include/jailhouse/assert.h         |  37 ++++
>>>>  hypervisor/include/jailhouse/control.h        |  34 +--
>>>>  hypervisor/include/jailhouse/panic.h          |  40 ++++
>>>>  hypervisor/include/jailhouse/printk.h         |   4 +
>>>>  hypervisor/panic.c                            |  86 ++++++++
>>>>  hypervisor/pci.c                              |   1 +
>>>>  hypervisor/printk.c                           |   1 +
>>>>  hypervisor/uart.c                             |   1 +
>>>>  include/jailhouse/cell-config.h               |  11 +
>>>>  pyjailhouse/config_parser.py                  |   9 +-
>>>>  40 files changed, 1201 insertions(+), 121 deletions(-)
>>>>  create mode 100644 Documentation/cache-coloring.md
>>>>  create mode 100644 configs/arm64/zynqmp-zcu102-inmate-demo-col.c
>>>>  create mode 100644 hypervisor/arch/arm/include/asm/coloring.h
>>>>  create mode 100644 hypervisor/arch/arm64/cache_layout.c
>>>>  create mode 100644 hypervisor/arch/arm64/coloring.c
>>>>  create mode 100644 hypervisor/arch/arm64/include/asm/cache_layout.h
>>>>  create mode 100644 hypervisor/arch/arm64/include/asm/coloring.h
>>>>  create mode 100644 hypervisor/arch/x86/include/asm/coloring.h
>>>>  create mode 100644 hypervisor/include/jailhouse/assert.h
>>>>  create mode 100644 hypervisor/include/jailhouse/panic.h
>>>>  create mode 100644 hypervisor/panic.c
>>>>
>>>
>>> Thanks for the update! I assume it's functional and can be used in
>>> tests? Asking as there seems to be a lot of debug code and comments.
>>
>> Yes, it is functional and it can be used for testing. I assumed this was=
n't the
>> final version, and the debug code + commented out code are still there i=
n the
>> places where it can be useful to take a look to understand how the machi=
nery is
>> working.
>>
>> I'm also interested in your point of view regarding having a CONFIG_DEBU=
G option
>> in Jailhouse. Basically a "debugging/development-enabled" version (with =
assert()
>> and extra verbose output), and a "production" one.
>>
>>> Scanning through it, I still find it very arm64-centric, rather than
>>
>> It is. As mentioned, I don't know if it is meaningful to have a x86 vers=
ion of
>> the coloring, and for how long there will be the need to have coloring i=
n
>> software. So, the patches try to keep the changes in both hypervisor and=
 driver
>> to a minimum.
>=20
> x86 might not be meaningful for modern CPUs with CAT, but it is another
> test case. But I'm also thinking of RISC-V and what else might come along=
.

Coloring in software on x86 might not be trivial. But yes, RISC-V could be =
a
test case, and maybe there will be some hardware support that can be exploi=
ted
there...

>>> generically addressing the topic as I pointed out in previous reviews.
>>> And keeping modifications of the driver minimal is not necessarily a
>>> sign we are on the same page already.
>>
>> We've experimented also with a version that does "more" in the driver. I=
 think
>> that more changes in the driver only add complexity. In the end the hype=
rvisor
>> have to distinguish anyway between colored and non-colored mapping, and
>> scattering the load logic between driver and hypervisor has more mainten=
ance
>> effort than a single clean configuration parameter.
>=20
> You are possibly right, it's just hard for me to follow this as there is
> no code or more concrete design to prove that argument.

I've synched with Luca and Marco, and I've pushed here

https://gitlab.com/bastoni/jailhouse/-/commits/wip/design/coloring-driver/

some relevant commits that show how a possible driver-integrated solution c=
ould
look like.

Note that the "jailhouse_ioremap_col()" function in driver/main.c basically
replicates the same coloring loop that should also be provided by the hyper=
visor
to do colored-mapping and how the logic about the "next_colored()" should b=
e
"moved-up" to be shared between HV and driver.

This non-clean separation, and the fact that the IPA/PA mapping should not
belong to the driver, but only to the HV are among the reasons why we moved=
 to
the solution presented in the patch series.

>>> For testing purposes, please also include a QEMU configuration change i=
n
>>> the future. Helps validating things and playing the functional changes.
>>
>> OK.

Please see the attached patch.

Best,
Andrea

>>> The patch series should further more be structured in way that a static=
,
>>> config-defined way-size can be used before any arch-specific
>>> auto-detection logic is added.
>>
>> Sure. As said, I assumed that discussion was needed, but I think it's be=
tter to
>> discuss with a draft of how the code will look like.
>>
>=20
> On the one hand, discussion can be less effort than coding if everyone
> can follow the arguments and this leads to a common view. On the other
> hand, code has the advantage of make an even stronger argument as
> everyone can see the results and compare, and can even do that in the
> future when that topic pops up again for some reason.
>=20
> Jan
>=20

--=20
You received this message because you are subscribed to the Google Groups "=
Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/=
jailhouse-dev/6af26a83-8be5-0317-92c6-ffcdf636375a%40tum.de.

--------------CD501F0D439DC7306A70A2E9
Content-Type: text/x-diff; charset=UTF-8;
 name="0001-configs-arm64-add-coloring-example-for-qemu-arm64.patch"
Content-Transfer-Encoding: quoted-printable
Content-Disposition: attachment;
 filename*0="0001-configs-arm64-add-coloring-example-for-qemu-arm64.patch"

=46rom 2aa03d21d4f4fcb5086be809904c3a6c7af36c31 Mon Sep 17 00:00:00 2001
From: Andrea Bastoni <andrea.bastoni@tum.de>
Date: Wed, 25 Nov 2020 15:30:14 +0100
Subject: [PATCH 1/2] configs: arm64: add coloring example for qemu-arm64

---
 configs/arm64/qemu-arm64-inmate-demo-col.c | 134 +++++++++++++++++++++
 configs/arm64/qemu-arm64.c                 |   6 +
 2 files changed, 140 insertions(+)
 create mode 100644 configs/arm64/qemu-arm64-inmate-demo-col.c

diff --git a/configs/arm64/qemu-arm64-inmate-demo-col.c b/configs/arm64/q=
emu-arm64-inmate-demo-col.c
new file mode 100644
index 00000000..45bdf568
--- /dev/null
+++ b/configs/arm64/qemu-arm64-inmate-demo-col.c
@@ -0,0 +1,134 @@
+/*
+ * Jailhouse, a Linux-based partitioning hypervisor
+ *
+ * Configuration for demo inmate on QEMU arm64 virtual target
+ * 1 CPU, 64K RAM, 1 serial port
+ *
+ * Copyright (c) Siemens AG, 2017
+ *
+ * Authors:
+ *  Jan Kiszka <jan.kiszka@siemens.com>
+ *
+ * This work is licensed under the terms of the GNU GPL, version 2.  See=

+ * the COPYING file in the top-level directory.
+ */
+
+#include <jailhouse/types.h>
+#include <jailhouse/cell-config.h>
+
+struct {
+	struct jailhouse_cell_desc cell;
+	__u64 cpus[1];
+	struct jailhouse_memory mem_regions[8];
+	struct jailhouse_irqchip irqchips[1];
+	struct jailhouse_pci_device pci_devices[1];
+} __attribute__((packed)) config =3D {
+	.cell =3D {
+		.signature =3D JAILHOUSE_CELL_DESC_SIGNATURE,
+		.revision =3D JAILHOUSE_CONFIG_REVISION,
+		.name =3D "inmate-demo",
+		.flags =3D JAILHOUSE_CELL_PASSIVE_COMMREG,
+
+		.cpu_set_size =3D sizeof(config.cpus),
+		.num_memory_regions =3D ARRAY_SIZE(config.mem_regions),
+		.num_irqchips =3D ARRAY_SIZE(config.irqchips),
+		.num_pci_devices =3D ARRAY_SIZE(config.pci_devices),
+
+		.vpci_irq_base =3D 144-32,
+
+		.console =3D {
+			.address =3D 0x09000000,
+			.type =3D JAILHOUSE_CON_TYPE_PL011,
+			.flags =3D JAILHOUSE_CON_ACCESS_MMIO |
+				 JAILHOUSE_CON_REGDIST_4,
+		},
+	},
+
+	.cpus =3D {
+		0b0010,
+	},
+
+	.mem_regions =3D {
+		/* IVSHMEM shared memory regions (demo) */
+		{
+			.phys_start =3D 0x7faf0000,
+			.virt_start =3D 0x7faf0000,
+			.size =3D 0x1000,
+			.flags =3D JAILHOUSE_MEM_READ | JAILHOUSE_MEM_ROOTSHARED,
+		},
+		{
+			.phys_start =3D 0x7faf1000,
+			.virt_start =3D 0x7faf1000,
+			.size =3D 0x9000,
+			.flags =3D JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
+				JAILHOUSE_MEM_ROOTSHARED,
+		},
+		{
+			.phys_start =3D 0x7fafa000,
+			.virt_start =3D 0x7fafa000,
+			.size =3D 0x2000,
+			.flags =3D JAILHOUSE_MEM_READ | JAILHOUSE_MEM_ROOTSHARED,
+		},
+		{
+			.phys_start =3D 0x7fafc000,
+			.virt_start =3D 0x7fafc000,
+			.size =3D 0x2000,
+			.flags =3D JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
+				JAILHOUSE_MEM_ROOTSHARED,
+		},
+		{
+			.phys_start =3D 0x7fafe000,
+			.virt_start =3D 0x7fafe000,
+			.size =3D 0x2000,
+			.flags =3D JAILHOUSE_MEM_READ | JAILHOUSE_MEM_ROOTSHARED,
+		},
+		/* UART */ {
+			.phys_start =3D 0x09000000,
+			.virt_start =3D 0x09000000,
+			.size =3D 0x1000,
+			.flags =3D JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
+				JAILHOUSE_MEM_IO | JAILHOUSE_MEM_ROOTSHARED,
+		},
+		/* RAM */ {
+			.phys_start =3D 0x7fa00000,
+			.virt_start =3D 0,
+			.size =3D 0x00010000,
+			.flags =3D JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
+				JAILHOUSE_MEM_EXECUTE | JAILHOUSE_MEM_LOADABLE |
+				JAILHOUSE_MEM_COLORED,
+			.colors=3D0x000f,
+		},
+		/* communication region */ {
+			.virt_start =3D 0x80000000,
+			.size =3D 0x00001000,
+			.flags =3D JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
+				JAILHOUSE_MEM_COMM_REGION,
+		},
+	},
+
+	.irqchips =3D {
+		/* GIC */ {
+			.address =3D 0x08000000,
+			.pin_base =3D 32,
+			.pin_bitmap =3D {
+				0,
+				0,
+				0,
+				(1 << (144 - 128))
+			},
+		},
+	},
+
+	.pci_devices =3D {
+		{ /* IVSHMEM (demo) */
+			.type =3D JAILHOUSE_PCI_TYPE_IVSHMEM,
+			.domain =3D 1,
+			.bdf =3D 0 << 3,
+			.bar_mask =3D JAILHOUSE_IVSHMEM_BAR_MASK_INTX,
+			.shmem_regions_start =3D 0,
+			.shmem_dev_id =3D 1,
+			.shmem_peers =3D 3,
+			.shmem_protocol =3D JAILHOUSE_SHMEM_PROTO_UNDEFINED,
+		},
+	},
+};
diff --git a/configs/arm64/qemu-arm64.c b/configs/arm64/qemu-arm64.c
index 2e9fcde6..f064c1b0 100644
--- a/configs/arm64/qemu-arm64.c
+++ b/configs/arm64/qemu-arm64.c
@@ -44,6 +44,12 @@ struct {
 			.pci_mmconfig_end_bus =3D 0,
 			.pci_is_virtual =3D 1,
 			.pci_domain =3D 1,
+			.color =3D {
+				/* in debug mode, the way_size is autodetected
+				 * if it is not specified */
+				/* .way_size =3D 0x20000, */
+				.root_map_offset =3D 0x0C000000000,
+			},
 			.arm =3D {
 				.gic_version =3D 3,
 				.gicd_base =3D 0x08000000,
--=20
2.29.2


--------------CD501F0D439DC7306A70A2E9--
