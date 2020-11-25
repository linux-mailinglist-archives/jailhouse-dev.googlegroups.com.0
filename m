Return-Path: <jailhouse-dev+bncBCW2V5WNZMERBLOB7D6QKGQEZ3M4BMA@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-ed1-x539.google.com (mail-ed1-x539.google.com [IPv6:2a00:1450:4864:20::539])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A3DF2C3BC4
	for <lists+jailhouse-dev@lfdr.de>; Wed, 25 Nov 2020 10:15:26 +0100 (CET)
Received: by mail-ed1-x539.google.com with SMTP id bt2sf780509edb.12
        for <lists+jailhouse-dev@lfdr.de>; Wed, 25 Nov 2020 01:15:26 -0800 (PST)
ARC-Seal: i=2; a=rsa-sha256; t=1606295725; cv=pass;
        d=google.com; s=arc-20160816;
        b=qxkxAHbBw15UW9rnfDF9il1qON9FHCTgcHavVmxFniCn1h5vczNYjHnrse5lQOeOYB
         XyYx3xsfp3KzxU/2yUfO9WaeHVpDHqS44bjoB6EGr33bvJLHgsYjNUVFs5KLluKemP1f
         G7/a11iiERdsrwJ1+cwCkrh5UxunB3WB/x8cprhvkY5C1wwP0bmfr6a4Wgl7soMpnNW3
         CwscHw7TeTWRl0ujO/Zm3WnLIhEmpoe2UBb2DYOd/txEGebSyb4Z4YtueLte2k3vC+4+
         8LF6+LF/EyFpwIZdV7jj3CRNX985fxIeRX3AyHYgkz9/WUiKcnPgWcCmGUpC9w1mz4WE
         kylA==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:autocrypt:from:references:cc:to:subject:sender
         :dkim-signature;
        bh=F+9GydaI+5LMzzitCuoqsdTxdvujHAE5EibxGHGNuCU=;
        b=ZGhcaqFAtSrb+we4HmRdvPb8HAcbB2KvSo9G3rrP9AOvgzK/WS88r9r+fKti9hClqR
         8h2rU3utksfT2EWy5fOO0z5rQTRzKjeOaC7BohBurqGFGOZDmggl5jwM2O21k1dMHTkJ
         +8eB+Ah5bCZ6O5DYH18pkehY4QO6JS69wsGyPihE2C4N0xgpShQyPrUyD245DAwJIdx+
         tbBw71MkTm6hJjhmKBMO1cv8WduKjUEc+uA2SqNJ88nHjZRTHWk+8tRsmORtLT7VGBHE
         D0pfe3sxlh3yJBn1w0Nou9vmnrNwR5Bf8FiClH+p56GGn+Eph2aqsPg2cj55AEe+BPj0
         CW7g==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass header.i=@tum.de header.s=postout header.b=ITvWu8MN;
       spf=pass (google.com: domain of andrea.bastoni@tum.de designates 2001:4ca0:0:103::81bb:ff89 as permitted sender) smtp.mailfrom=andrea.bastoni@tum.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=tum.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:subject:to:cc:references:from:autocrypt:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :list-post:list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=F+9GydaI+5LMzzitCuoqsdTxdvujHAE5EibxGHGNuCU=;
        b=Z3Q7ZL3zcf6aMBxHkeCuoB5qYBwrYpz5WW6CaU9Ps/hE6nn/brAOdVL2J9Cz9O2EKF
         N9KNol6rgeMyBAbVZpTzB6gMGnFKI3QRJZZxcFWbSaXHrPxEF9UyWaKvi1ZfcEg+g/Tt
         wOxIULlxR75p/1F/Qa2C9ua5DDirx4AhAFmhC+YXdGFawaLwei6slQ5T/7pDhY+Wn53t
         k/GnmOdNQiJPJ/CaZvmOs2G9J95khtW1NpEbTu53DHrAiiVGlhcslSxeCldVyLdH9tiz
         2+n7XNeUKb4lrBKNFMhEMgmSWK2LRoUUNQOIGjEAd37UDYSNg+JSwWMKL4zuq3hdOWTH
         cImw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:subject:to:cc:references:from:autocrypt
         :message-id:date:user-agent:mime-version:in-reply-to
         :content-language:content-transfer-encoding:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :x-spam-checked-in-group:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=F+9GydaI+5LMzzitCuoqsdTxdvujHAE5EibxGHGNuCU=;
        b=eKaSm8KBL9n7A9i4rQAfjTtlmPLD+gdWTEXgOk4TXa/GD0/Kbm3EaXJIZkE2asL9fe
         DP6zqOiuXk336PzudLStaR6k1bgEoVPUlZr7FWeiDeU9Y7YvQ74D9ZxjhidUqIiGSf0a
         f77wAUe0LNijP8Z0cfxJWB17Pg5QWmFv7IpxI5D5PeKX7vcduTZcyWL+rKOYp/khPZz5
         i/oRydExk/8D2lGeUqyMmiBWE/JD/uSXml7s42oykPtdxeKEnF+wPuMLKXw3obHs0EyP
         0D3mkHwDs0iZpE1t+EWFPRmWx/NeB3H3fAauCMcCnRWgMmXyor32pZ+3fe3BDDEmQtpb
         kfHQ==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AOAM533nTo0RTFzoSthfYt4IkQ6oXE25FKath0jNbUNztSjc5WAmKj2o
	pVCNeA90AfSG5zQ2L1BbpRQ=
X-Google-Smtp-Source: ABdhPJxDM2YaP+jaR6PJcMRMRXEioCO1uJ13RO5ylkQjjJUsuYKjKA98meyz21i59Yw0mAWMblGe4Q==
X-Received: by 2002:aa7:dbca:: with SMTP id v10mr2474204edt.219.1606295725795;
        Wed, 25 Nov 2020 01:15:25 -0800 (PST)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a17:906:5591:: with SMTP id y17ls770029ejp.5.gmail; Wed, 25
 Nov 2020 01:15:24 -0800 (PST)
X-Received: by 2002:a17:906:394:: with SMTP id b20mr2416132eja.143.1606295724738;
        Wed, 25 Nov 2020 01:15:24 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1606295724; cv=none;
        d=google.com; s=arc-20160816;
        b=Dtf7VnzA13bNorOmT3SPj6LjDVtwk/BZHHuGj9sWd7Ntvt9RYaxAs6LHEs1at/oDa5
         /A1NNRPVo5PY03OwhvPsnvy+DAbyR/ziWWjjX2YSVE0oqXx3cU6PUlpiPCK2F6/5Sbij
         xYWiFmVjk874CnA15TLWHDhzUjbI4rxHdCQQzG4CtvfzgsmjaRkg3iyp+a0LUXfdAblv
         eBfkZS5ibUlSIadpa+5QtdthVk9luKdTflqt94TekiOB0OykTI3trHEN4exSzM5imn2J
         KndVZ1pXW65U4dvgoBNCOpbm8gzUksnCSuxrwfZGEqnbffQ0Ixzwj2H3cK5N/RqC9cSE
         0OrQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:autocrypt:from:references:cc:to:subject
         :dkim-signature;
        bh=gIGQRu4+ovgUIaUHYS9aH2OPzJ4FKnPSKnNLtGeXGSI=;
        b=ZG2fDp0qSJ6U4G1JfPYKUdbdXAcxviLXKdVnj5RhhID1NCze+QMnzxik2jK/1fWrxN
         gR1/jY1rwF+5KQmrpaOADqWgoIJ5g5oB3YwpJ/LxRZ66gNAWANxtlL2t5w/ouekW32nC
         rruNcI/4vEgrNC42jpcnUcx6hWw1lAFcpXWhnHBbUyapQghFeJiEYrUj3+H0sFcZbG7r
         jeloLJOKyWghoT7shgt78J/dda/ZYYHVECgAgExyhFs0Oh0iAz/W5qxKbzPLXanBGGwK
         dEYfW3lFatpKfgAGiNzGkiiieh09E8hZv9nTkK8QHROfBkO61g7Pcy/Agt0i4QU6IOq4
         JIaQ==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       dkim=pass header.i=@tum.de header.s=postout header.b=ITvWu8MN;
       spf=pass (google.com: domain of andrea.bastoni@tum.de designates 2001:4ca0:0:103::81bb:ff89 as permitted sender) smtp.mailfrom=andrea.bastoni@tum.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=tum.de
Received: from postout1.mail.lrz.de (postout1.mail.lrz.de. [2001:4ca0:0:103::81bb:ff89])
        by gmr-mx.google.com with ESMTPS id i3si17792edy.3.2020.11.25.01.15.24
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 25 Nov 2020 01:15:24 -0800 (PST)
Received-SPF: pass (google.com: domain of andrea.bastoni@tum.de designates 2001:4ca0:0:103::81bb:ff89 as permitted sender) client-ip=2001:4ca0:0:103::81bb:ff89;
Received: from lxmhs51.srv.lrz.de (localhost [127.0.0.1])
	by postout1.mail.lrz.de (Postfix) with ESMTP id 4CgwGN24GrzyW9;
	Wed, 25 Nov 2020 10:15:24 +0100 (CET)
X-Virus-Scanned: by amavisd-new at lrz.de in lxmhs51.srv.lrz.de
X-Spam-Flag: NO
X-Spam-Score: -2.873
X-Spam-Level: 
X-Spam-Status: No, score=-2.873 tagged_above=-999 required=5
	tests=[ALL_TRUSTED=-1, BAYES_00=-1.9, DMARC_ADKIM_RELAXED=0.001,
	DMARC_ASPF_RELAXED=0.001, DMARC_POLICY_NONE=0.001,
	LRZ_CT_PLAIN_UTF8=0.001, LRZ_DMARC_FAIL=0.001,
	LRZ_DMARC_FAIL_NONE=0.001, LRZ_DMARC_POLICY=0.001,
	LRZ_DMARC_TUM_FAIL=0.001, LRZ_DMARC_TUM_REJECT=3.5,
	LRZ_DMARC_TUM_REJECT_PO=-3.5, LRZ_ENVFROM_FROM_ALIGNED_STRICT=0.001,
	LRZ_ENVFROM_FROM_MATCH=0.001, LRZ_ENVFROM_TUM_S=0.001,
	LRZ_FROM_HAS_A=0.001, LRZ_FROM_HAS_AAAA=0.001,
	LRZ_FROM_HAS_MDOM=0.001, LRZ_FROM_HAS_MX=0.001,
	LRZ_FROM_HOSTED_DOMAIN=0.001, LRZ_FROM_NAME_IN_ADDR=0.001,
	LRZ_FROM_PHRASE=0.001, LRZ_FROM_PRE_SUR=0.001,
	LRZ_FROM_PRE_SUR_PHRASE=0.001, LRZ_FROM_TUM_S=0.001,
	LRZ_HAS_CLANG=0.001, LRZ_HAS_IN_REPLY_TO=0.001, LRZ_HAS_SPF=0.001,
	LRZ_MSGID_HL8_3HL4_HL12=0.001, LRZ_MSGID_MOZ=0.001, LRZ_UA_MOZ=0.001,
	LRZ_URL_PLAIN_SINGLE=0.001, NICE_REPLY_A=-0.001]
	autolearn=no autolearn_force=no
Received: from postout1.mail.lrz.de ([127.0.0.1])
	by lxmhs51.srv.lrz.de (lxmhs51.srv.lrz.de [127.0.0.1]) (amavisd-new, port 20024)
	with LMTP id Pu-in4pN_ayz; Wed, 25 Nov 2020 10:15:23 +0100 (CET)
Received: from [10.162.12.242] (unknown [10.162.12.242])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(Client did not present a certificate)
	by postout1.mail.lrz.de (Postfix) with ESMTPSA id 4CgwG61lcYzyWD;
	Wed, 25 Nov 2020 10:15:10 +0100 (CET)
Subject: Re: [PATCH 00/14] Cache-coloring for Jailhouse
To: Jan Kiszka <jan.kiszka@siemens.com>, jailhouse-dev@googlegroups.com
Cc: marco.solieri@unimore.it, rmancuso@bu.edu, lucmiccio@gmail.com
References: <20201123204613.252563-1-andrea.bastoni@tum.de>
 <49bddd30-ded4-3264-813c-940fc11e2354@siemens.com>
From: Andrea Bastoni <andrea.bastoni@tum.de>
Autocrypt: addr=andrea.bastoni@tum.de; keydata=
 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
Message-ID: <50b3ceff-d68d-b6c0-f335-8cec4fa67305@tum.de>
Date: Wed, 25 Nov 2020 10:15:10 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.0
MIME-Version: 1.0
In-Reply-To: <49bddd30-ded4-3264-813c-940fc11e2354@siemens.com>
Content-Type: text/plain; charset="UTF-8"
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable
X-Original-Sender: andrea.bastoni@tum.de
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass
 header.i=@tum.de header.s=postout header.b=ITvWu8MN;       spf=pass
 (google.com: domain of andrea.bastoni@tum.de designates 2001:4ca0:0:103::81bb:ff89
 as permitted sender) smtp.mailfrom=andrea.bastoni@tum.de;       dmarc=pass
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

On 25/11/2020 07:07, Jan Kiszka wrote:
> On 23.11.20 21:45, Andrea Bastoni wrote:
>> Hello Jan, hi all,
>>
>> As discussed a couple of weeks ago, here an updated version of the "cach=
e-coloring" for Jailhouse.
>>
>> A short recap on what's coloring (see Documentation/cache-coloring.md):
>>> Cache coloring is a software technique that permits LLC partitioning,
>>> therefore eliminating mutual core interference, and thus guaranteeing m=
ore
>>> predictable performances for memory accesses.
>>
>> In this version of the patch, we've tried to keep the changes in the hyp=
ervisor core minimal. Also, since coloring is something that should be tran=
sparent to inmates/VM (coloring belongs to the IPA/PA hypervisor translatio=
ns), the Linux driver has been only minimally modified.
>>
>> Coloring API
>> ------------
>>
>> The patch adds a small architecture API layer that implements coloring. =
The API is fully implemented only on arm64.  arm32 could be also a possible=
 target for coloring, x86 already has CAT. Despite being implemented by onl=
y one architecture, having a small common API layer integrates IMHO better =
than other solutions in the main code (without adding conditionally compile=
d code).
>>
>> The API is:
>>     arch_color_map_memory_region()   // cell_create
>>         Color-maps the memory of the cell. Coloring requires multiple pa=
sses to keep a contiguous VA, while "punching holes" in the PA according to=
 the allocated colors.
>>
>>     arch_color_unmap_memory_region() // cell_destroy
>>         The opposite of create: search and give back each piece of color=
ed PA.
>>
>>     arch_color_remap_to_root()       // cell_load
>>         Given that we don't want to modify the driver (i.e., we don't wa=
nt the driver to do non-contiguous color-ioremap) we let the root cell beli=
eve that the IPAs it is ioremapping are contiguous, but in reality the PA a=
re non-contiguous (colored). This is currently done by using a very high VA=
 (IPA) address as "base" for the load-remap-to-root-cell operation. This va=
lue is configuration dependent and can be specified in the root cell to avo=
id (unlikely) conflicts.
>>
>>     arch_color_unmap_from_root()     // cell_start
>>         Returns the mapping setup by the cell_load to the root cell.
>>
>> Two APIs are implemented only by arm64:
>>     arm_color_dcache_flush_memory_region()  // range flushing
>>         Also flushing should be done in a "colored way".
>>
>>     arm_color_init()                        // hook for the initializati=
on of coloring
>>         Reads the parameters (size of the LLC way, base offset for the l=
oad-remapping operation) needed by coloring. There's also some debugging co=
de to autodetect the cache-geometry and determine the size of the way.
>>
>> Configuration
>> -------------
>>
>> From the configuration point of view, a colored memory region is a norma=
l memory region with a color attached. The color is expressed directly in t=
he memory region as color-bitmask and the flag JAILHOUSE_MEM_COLORED is use=
d to identify such a region. Contiguous bits in the bitmask identify a colo=
r (region) to be used for the memory region. The size of the mapping doesn'=
t change due to coloring.
>>
>> For example, with 16 colors, a full way size is selected by 0xffff, whil=
e 1/4 of the way size is selected by 0x000f.
>>
>> (Note: we also experimented with a different version that defined separa=
te "normal" and "colored" memory regions. The approach presented in this ve=
rsion is more robust.)
>>
>> Main coloring "loop"
>> --------------------
>>
>> The coloring APIs basically boil down to a loop that appropriately selec=
ts --according to the color-- the physical addresses where to perform a sel=
ected operation. The selection is done efficiently with bit operations on t=
he bitmask.
>>
>> An alternative approach is to hook coloring deep into the mapping functi=
onalities of the hypervisor. Basically, all low level mapping functions sup=
port coloring, and the non-colored case becomes the "special case."
>> This approach was not followed because to be implemented "cleanly", all =
the architecture mapping APIs have to be extended to support coloring, but =
only one-architecture then really implement it.
>>
>> Instead, the implemented approach to have an additional "coloring" API i=
ntegrates more nicely. Additionally, coloring will be hopefully only a tran=
sitory techniques (some years?) that could be eventually replaced by hardwa=
re-based techniques (e.g., MPAM). When this happens, removing the additiona=
l coloring API requires less rework than the other approach.
>>
>>
>> Debugging Code
>> --------------
>>
>> The patches also provide a "debugging-only" code that can be activated b=
y defining CONFIG_DEBUG (it sounded more Jailhouse-oriented than NDEBUG). I=
n debugging mode, the coloring provides an autodetection for arm64 cache ge=
ometry.
>> Additionally, I've added an assert() function that can be used at runtim=
e in debugging only contexts (could be used independently from coloring).
>>
>>
>> Feedback and comments welcome.
>>
>> Best,
>> Andrea
>>
>> Andrea Bastoni (12):
>>   arm-common: bitops: add most-significant-bit operation
>>   hypervisor, driver, archs: add basic empty infrastructure for coloring
>>   hypervisor: arm64: add cache coloring implementation
>>   hypervisor configuration: hook autodetection for coloring_way_size
>>   configs: arm64: add example configuration for colored ZCU102 inmate
>>   hypervisor: protect inclusion of control.h
>>   hypervisor, driver: add platform information to configure coloring
>>     params
>>   configs: arm64: hook-in coloring parameters for ZCU102
>>   hypervisor: provide runtime assert() helper for DEBUG only
>>   hypervisor: provide implementation for __assert_fail() and group
>>     panic-related functions
>>   hypervisor: coloring: use assert instead of "BUG"
>>   hypervisor: coloring: make cache autodetection debug-only
>>
>> Luca Miccio (2):
>>   Documentation: add description and usage of cache coloring support
>>   pyjailhouse: add support for colored regions
>>
>>  Documentation/cache-coloring.md               | 198 ++++++++++++++++++
>>  configs/arm64/zynqmp-zcu102-inmate-demo-col.c |  75 +++++++
>>  configs/arm64/zynqmp-zcu102.c                 |   6 +
>>  driver/cell.c                                 |  10 +-
>>  driver/cell.h                                 |   1 +
>>  driver/main.c                                 |  12 ++
>>  hypervisor/Makefile                           |   2 +-
>>  hypervisor/arch/arm-common/control.c          |   1 +
>>  .../arch/arm-common/include/asm/bitops.h      |  10 +
>>  .../arch/arm-common/include/asm/dcaches.h     |   8 +
>>  hypervisor/arch/arm-common/mmu_cell.c         |  52 +++--
>>  hypervisor/arch/arm/control.c                 |   1 +
>>  hypervisor/arch/arm/include/asm/coloring.h    |  59 ++++++
>>  hypervisor/arch/arm/traps.c                   |   1 +
>>  hypervisor/arch/arm64/Kbuild                  |   5 +
>>  hypervisor/arch/arm64/cache_layout.c          | 148 +++++++++++++
>>  hypervisor/arch/arm64/coloring.c              | 184 ++++++++++++++++
>>  hypervisor/arch/arm64/control.c               |   1 +
>>  .../arch/arm64/include/asm/cache_layout.h     |  21 ++
>>  hypervisor/arch/arm64/include/asm/coloring.h  | 137 ++++++++++++
>>  hypervisor/arch/arm64/setup.c                 |   3 +
>>  hypervisor/arch/arm64/traps.c                 |   1 +
>>  hypervisor/arch/x86/amd_iommu.c               |   1 +
>>  hypervisor/arch/x86/control.c                 |   1 +
>>  hypervisor/arch/x86/efifb.c                   |   1 +
>>  hypervisor/arch/x86/include/asm/coloring.h    |  45 ++++
>>  hypervisor/arch/x86/ioapic.c                  |   1 +
>>  hypervisor/arch/x86/svm.c                     |   1 +
>>  hypervisor/arch/x86/vmx.c                     |   1 +
>>  hypervisor/control.c                          | 111 ++++------
>>  hypervisor/include/jailhouse/assert.h         |  37 ++++
>>  hypervisor/include/jailhouse/control.h        |  34 +--
>>  hypervisor/include/jailhouse/panic.h          |  40 ++++
>>  hypervisor/include/jailhouse/printk.h         |   4 +
>>  hypervisor/panic.c                            |  86 ++++++++
>>  hypervisor/pci.c                              |   1 +
>>  hypervisor/printk.c                           |   1 +
>>  hypervisor/uart.c                             |   1 +
>>  include/jailhouse/cell-config.h               |  11 +
>>  pyjailhouse/config_parser.py                  |   9 +-
>>  40 files changed, 1201 insertions(+), 121 deletions(-)
>>  create mode 100644 Documentation/cache-coloring.md
>>  create mode 100644 configs/arm64/zynqmp-zcu102-inmate-demo-col.c
>>  create mode 100644 hypervisor/arch/arm/include/asm/coloring.h
>>  create mode 100644 hypervisor/arch/arm64/cache_layout.c
>>  create mode 100644 hypervisor/arch/arm64/coloring.c
>>  create mode 100644 hypervisor/arch/arm64/include/asm/cache_layout.h
>>  create mode 100644 hypervisor/arch/arm64/include/asm/coloring.h
>>  create mode 100644 hypervisor/arch/x86/include/asm/coloring.h
>>  create mode 100644 hypervisor/include/jailhouse/assert.h
>>  create mode 100644 hypervisor/include/jailhouse/panic.h
>>  create mode 100644 hypervisor/panic.c
>>
>=20
> Thanks for the update! I assume it's functional and can be used in
> tests? Asking as there seems to be a lot of debug code and comments.

Yes, it is functional and it can be used for testing. I assumed this wasn't=
 the
final version, and the debug code + commented out code are still there in t=
he
places where it can be useful to take a look to understand how the machiner=
y is
working.

I'm also interested in your point of view regarding having a CONFIG_DEBUG o=
ption
in Jailhouse. Basically a "debugging/development-enabled" version (with ass=
ert()
and extra verbose output), and a "production" one.

> Scanning through it, I still find it very arm64-centric, rather than

It is. As mentioned, I don't know if it is meaningful to have a x86 version=
 of
the coloring, and for how long there will be the need to have coloring in
software. So, the patches try to keep the changes in both hypervisor and dr=
iver
to a minimum.

> generically addressing the topic as I pointed out in previous reviews.
> And keeping modifications of the driver minimal is not necessarily a
> sign we are on the same page already.

We've experimented also with a version that does "more" in the driver. I th=
ink
that more changes in the driver only add complexity. In the end the hypervi=
sor
have to distinguish anyway between colored and non-colored mapping, and
scattering the load logic between driver and hypervisor has more maintenanc=
e
effort than a single clean configuration parameter.

> For testing purposes, please also include a QEMU configuration change in
> the future. Helps validating things and playing the functional changes.

OK.

> The patch series should further more be structured in way that a static,
> config-defined way-size can be used before any arch-specific
> auto-detection logic is added.

Sure. As said, I assumed that discussion was needed, but I think it's bette=
r to
discuss with a draft of how the code will look like.

Best,
Andrea

--=20
Technische Universit=C3=A4t M=C3=BCnchen
Lehrstuhl f=C3=BCr Cyber-Physical Systems in Production Engineering

--=20
You received this message because you are subscribed to the Google Groups "=
Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/=
jailhouse-dev/50b3ceff-d68d-b6c0-f335-8cec4fa67305%40tum.de.
