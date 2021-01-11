Return-Path: <jailhouse-dev+bncBCW2V5WNZMERBPPJ6D7QKGQEQPFW4PI@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-wr1-x43e.google.com (mail-wr1-x43e.google.com [IPv6:2a00:1450:4864:20::43e])
	by mail.lfdr.de (Postfix) with ESMTPS id 386062F1111
	for <lists+jailhouse-dev@lfdr.de>; Mon, 11 Jan 2021 12:21:34 +0100 (CET)
Received: by mail-wr1-x43e.google.com with SMTP id n11sf7662653wro.7
        for <lists+jailhouse-dev@lfdr.de>; Mon, 11 Jan 2021 03:21:34 -0800 (PST)
ARC-Seal: i=2; a=rsa-sha256; t=1610364094; cv=pass;
        d=google.com; s=arc-20160816;
        b=rLkmInl0V8nfm4kBKYG3Sr2iO/ni9e3zyc8uqoXfSaLvbk4nlA/3NR1E348Ed83a5S
         DdtWWlhIndkW0bEZYiKd3Q2kP+tbAMeBCxU11NBkImn4MQm49M7s7Fuw40uUzbSF2S3I
         AQr/U0IC+khH6hYiJuCfUikh0+sjA0Bele1fMiMpgztw7DkiCM58yMqDU9JSqxgrmyhV
         cPzC1uu8nECqGP/+rm+oZjOUEXRvr1oTmob9cHiI9mx/Owa+D4ecgbaNrzW5hoMkT4EH
         khuDk6HoDdVHMoccnjOGms+2cjaNHfCLIyL5VzTWrOBJvPUAYovCo/Zb0KdlkSRDgjKn
         zqKw==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:autocrypt:from:references:cc:to:subject:sender
         :dkim-signature;
        bh=BuS/mmyoERWlYe9aqxAD3Rhslhma2/Abrjw5ZglCepY=;
        b=RooLyhsQH+8ImqRdF9Rs5Zf1v5F7iz05kUI3OS+r0H1RxNuU11mT4oSMZ9D5RrPHzk
         bIZWbYRFnEnyo90UBAGNb0AwCPajXmvLDkTA1xbjixgA+Wt/xflkjJ4cARXbkyAlvuRJ
         BYH6PtH/luVXyOEcb/whXfT7vLHlsTpXdGe7Ys8021oF49IXo+5Hs+sj+Awq50jLq70c
         AoDOkXSwGpEHk3XHdoeotMUkJbg58Ezh2hHBXlPqD9yCjaUj2nD9rYQiTYHeIZjK03Ll
         r3p2dtNiiAOg3+uuQqejA75uouyVZ1xpgjnDb8DMXyndjGOVJdHFX9pXtB6dS7cXZAD9
         lNHA==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass header.i=@tum.de header.s=postout header.b=OdON8iO1;
       spf=pass (google.com: domain of andrea.bastoni@tum.de designates 2001:4ca0:0:103::81bb:ff8a as permitted sender) smtp.mailfrom=andrea.bastoni@tum.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=tum.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:subject:to:cc:references:from:autocrypt:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :list-post:list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=BuS/mmyoERWlYe9aqxAD3Rhslhma2/Abrjw5ZglCepY=;
        b=ZfkPu3XtkmJ4D6x1/wJ5GZexiqtrAuadsJYrpUrqj8OuA0G+ie+szjLbS/fgUbBW0J
         4/XoaywAiUZ1kD4M1C2fqYPVgnwYjDIvznNJ2PArbcVfaTZd+ierO4ANdyqzMDKHR3tA
         sRKVhCvx+R06SQpn6MCgmnjlkHUCQoAM13O6srw3bBJfAAj4oh7j0Saj5kLt0VW6H5Yo
         RUrHXUvXunDd9dtOu+bMKoNt8F37qRZ+0pfFwPV6QHPCbbue4mufQPpVvZBkCLEJPFZB
         dcue0kxlYVVQf9Y9kRFFym1b7s7/YrEJiqH0CwfHiEHpNSgILaNN1gndjXBy4GndwpNM
         L7Aw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:subject:to:cc:references:from:autocrypt
         :message-id:date:user-agent:mime-version:in-reply-to
         :content-language:content-transfer-encoding:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :x-spam-checked-in-group:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=BuS/mmyoERWlYe9aqxAD3Rhslhma2/Abrjw5ZglCepY=;
        b=ch1FV2VHVxijprwbBK1cLJ3pV/lLiJvqV13487QlwWQKRBI+0B5j8eSB89J7vaolsw
         KyGSBso1C1D9O6GCspMEYqY+e3lhDqfnp7JCWVD80eTUL7aKs6qCpor1YBaBxwPFqKk7
         /Zcrvnito6A1RO41ilRhxPpm3maEskevslKSOsLDL1JQXkYL4Mzt3WWoXeOxVi0HKUNz
         iy/P+2TdegR1qk/Q++0whCAFfmvv20vRQ2cYvdmX3MuvhYjPUvNjpXXJ6FKq3XRV62vj
         pObsKongdFuh6SF5yuKbytGFimYsyKgcoDqcXzu3oJKzuRlmC2K1POUp2KsruV97+FAh
         jUWA==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AOAM533CMzaBR0tPmxR9/KZny2GgDbJBcCoGy3EyTg3O5Gu4Y8xGbaiE
	ATN2B4mjsoIwELPJ4yeM5XA=
X-Google-Smtp-Source: ABdhPJyq5Mz9yaNMDbPBBI7Cf+BrHnZB9OF5blB2XjRwMXWf9dmbOc2oNpiNfIWsaXY7+XOh/UJUgw==
X-Received: by 2002:adf:db43:: with SMTP id f3mr16365356wrj.70.1610364093963;
        Mon, 11 Jan 2021 03:21:33 -0800 (PST)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a7b:cbd5:: with SMTP id n21ls8142091wmi.3.gmail; Mon, 11 Jan
 2021 03:21:33 -0800 (PST)
X-Received: by 2002:a1c:7e4e:: with SMTP id z75mr13886622wmc.40.1610364093142;
        Mon, 11 Jan 2021 03:21:33 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1610364093; cv=none;
        d=google.com; s=arc-20160816;
        b=fXg5OJ6F86p7otZBo4QJgeGs1MbYneoF5r5RZ7L3jpiRxNLctCW2iIT3PzQlMCK82e
         cMI1mOvavcsaQnAORjXV7masV1rkB6yO5gaVXLZ+FaUvCOYS1TzrEZ1A6D65nsQCQLo6
         0DqQI5U1sdLSe1weafQLRDYcVIZ4u9+t6TuPc6p4UNdqD212I39EfutEBsLWPUHm+ZTA
         EFnr368y5301nMXb3jeqZssaBJ4aZhU+3Zf95FyN5Eq8GGHh6zuGvHUWIdjOoAt6dko3
         nH+2MNU4ZGU1gnpi+0ptpd07fCelHLwY+sv9RjVt4Wht8oqWkJ+SMWejIs02olG+WCsA
         qCPQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:autocrypt:from:references:cc:to:subject
         :dkim-signature;
        bh=Qcf0AFAHK+yp5uTd+FRCunzRjIV+CefxzfiNCN8REvw=;
        b=NQeSwX/OlkqHGaAgCdBcqUjRzRIvkQ4sJIV4cyqD+FZxNaSBzSmetn039qbkb/ndGg
         UHQQXWr62L3tWMJtcC8MJbT7YgGX2tEpVZ9TjNw4fvswhhcPF0xlAQFky7EVhsve3BTe
         cNGuvcUZyS6td4iYvQ6XAQQ9hbvs+yiaSB9FLYHX8sdOPF+cUXN1Y+RYr2/pXDA7VvLO
         AQwnFubF8aHyhdr0eS+Gm2pt36vv54h96CR8erPB9l+HXianKy84+2YFTv5VDGlTCAwE
         7mN+ewcnDD9cQ71PSPcernVPP0RE8iceY/aSDIVb+WXhd2t1S53z+YgtTUvmPM59u6W/
         wL+A==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       dkim=pass header.i=@tum.de header.s=postout header.b=OdON8iO1;
       spf=pass (google.com: domain of andrea.bastoni@tum.de designates 2001:4ca0:0:103::81bb:ff8a as permitted sender) smtp.mailfrom=andrea.bastoni@tum.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=tum.de
Received: from postout2.mail.lrz.de (postout2.mail.lrz.de. [2001:4ca0:0:103::81bb:ff8a])
        by gmr-mx.google.com with ESMTPS id z188si1085164wmc.1.2021.01.11.03.21.33
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 11 Jan 2021 03:21:33 -0800 (PST)
Received-SPF: pass (google.com: domain of andrea.bastoni@tum.de designates 2001:4ca0:0:103::81bb:ff8a as permitted sender) client-ip=2001:4ca0:0:103::81bb:ff8a;
Received: from lxmhs52.srv.lrz.de (localhost [127.0.0.1])
	by postout2.mail.lrz.de (Postfix) with ESMTP id 4DDrrD6cKDz104y;
	Mon, 11 Jan 2021 12:21:32 +0100 (CET)
X-Virus-Scanned: by amavisd-new at lrz.de in lxmhs52.srv.lrz.de
X-Spam-Flag: NO
X-Spam-Score: -2.871
X-Spam-Level: 
X-Spam-Status: No, score=-2.871 tagged_above=-999 required=5
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
	LRZ_HAS_URL_HTTP=0.001, LRZ_MSGID_HL8_3HL4_HL12=0.001,
	LRZ_MSGID_MOZ=0.001, LRZ_UA_MOZ=0.001, LRZ_URL_HTTP_SINGLE=0.001,
	LRZ_URL_PLAIN_SINGLE=0.001, NICE_REPLY_A=-0.001]
	autolearn=no autolearn_force=no
Received: from postout2.mail.lrz.de ([127.0.0.1])
	by lxmhs52.srv.lrz.de (lxmhs52.srv.lrz.de [127.0.0.1]) (amavisd-new, port 20024)
	with LMTP id htHlxiuK-9U6; Mon, 11 Jan 2021 12:21:32 +0100 (CET)
Received: from [192.168.1.23] (ip5f5ac6e3.dynamic.kabel-deutschland.de [95.90.198.227])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(Client did not present a certificate)
	by postout2.mail.lrz.de (Postfix) with ESMTPSA id 4DDrrC6DCzzyY2;
	Mon, 11 Jan 2021 12:21:31 +0100 (CET)
Subject: Re: [PATCH 00/14] Cache-coloring for Jailhouse
To: Jan Kiszka <jan.kiszka@siemens.com>, jailhouse-dev@googlegroups.com
Cc: marco.solieri@unimore.it, rmancuso@bu.edu, lucmiccio@gmail.com
References: <20201123204613.252563-1-andrea.bastoni@tum.de>
 <49bddd30-ded4-3264-813c-940fc11e2354@siemens.com>
 <50b3ceff-d68d-b6c0-f335-8cec4fa67305@tum.de>
 <054fe4bd-e3ea-dfa5-c8aa-c3d2a2cad6fb@siemens.com>
 <6af26a83-8be5-0317-92c6-ffcdf636375a@tum.de>
 <085d4dfc-b4ca-a421-4f04-a04eb0d43e9c@siemens.com>
 <6d17ea6d-8696-1fb3-6c67-93a1fc856b12@siemens.com>
From: Andrea Bastoni <andrea.bastoni@tum.de>
Autocrypt: addr=andrea.bastoni@tum.de; keydata=
 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
Message-ID: <65629141-28b5-4153-7547-cfb58b22baff@tum.de>
Date: Mon, 11 Jan 2021 12:21:16 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.0
MIME-Version: 1.0
In-Reply-To: <6d17ea6d-8696-1fb3-6c67-93a1fc856b12@siemens.com>
Content-Type: text/plain; charset="UTF-8"
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable
X-Original-Sender: andrea.bastoni@tum.de
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass
 header.i=@tum.de header.s=postout header.b=OdON8iO1;       spf=pass
 (google.com: domain of andrea.bastoni@tum.de designates 2001:4ca0:0:103::81bb:ff8a
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

Hi Jan,

On 11/01/2021 08:36, Jan Kiszka wrote:
> On 25.11.20 17:12, Jan Kiszka wrote:
>> On 25.11.20 16:59, Andrea Bastoni wrote:
>>> On 25/11/2020 11:51, Jan Kiszka wrote:
>>>> On 25.11.20 10:15, Andrea Bastoni wrote:
>>>>> On 25/11/2020 07:07, Jan Kiszka wrote:
>>>>>> On 23.11.20 21:45, Andrea Bastoni wrote:
>>>>>>> Hello Jan, hi all,
>>>>>>>
>>>>>>> As discussed a couple of weeks ago, here an updated version of the =
"cache-coloring" for Jailhouse.
>>>>>>>
>>>>>>> A short recap on what's coloring (see Documentation/cache-coloring.=
md):
>>>>>>>> Cache coloring is a software technique that permits LLC partitioni=
ng,
>>>>>>>> therefore eliminating mutual core interference, and thus guarantee=
ing more
>>>>>>>> predictable performances for memory accesses.
>>>>>>>
>>>>>>> In this version of the patch, we've tried to keep the changes in th=
e hypervisor core minimal. Also, since coloring is something that should be=
 transparent to inmates/VM (coloring belongs to the IPA/PA hypervisor trans=
lations), the Linux driver has been only minimally modified.
>>>>>>>
>>>>>>> Coloring API
>>>>>>> ------------
>>>>>>>
>>>>>>> The patch adds a small architecture API layer that implements color=
ing. The API is fully implemented only on arm64.  arm32 could be also a pos=
sible target for coloring, x86 already has CAT. Despite being implemented b=
y only one architecture, having a small common API layer integrates IMHO be=
tter than other solutions in the main code (without adding conditionally co=
mpiled code).
>>>>>>>
>>>>>>> The API is:
>>>>>>>     arch_color_map_memory_region()   // cell_create
>>>>>>>         Color-maps the memory of the cell. Coloring requires multip=
le passes to keep a contiguous VA, while "punching holes" in the PA accordi=
ng to the allocated colors.
>>>>>>>
>>>>>>>     arch_color_unmap_memory_region() // cell_destroy
>>>>>>>         The opposite of create: search and give back each piece of =
colored PA.
>>>>>>>
>>>>>>>     arch_color_remap_to_root()       // cell_load
>>>>>>>         Given that we don't want to modify the driver (i.e., we don=
't want the driver to do non-contiguous color-ioremap) we let the root cell=
 believe that the IPAs it is ioremapping are contiguous, but in reality the=
 PA are non-contiguous (colored). This is currently done by using a very hi=
gh VA (IPA) address as "base" for the load-remap-to-root-cell operation. Th=
is value is configuration dependent and can be specified in the root cell t=
o avoid (unlikely) conflicts.
>>>>>>>
>>>>>>>     arch_color_unmap_from_root()     // cell_start
>>>>>>>         Returns the mapping setup by the cell_load to the root cell=
.
>>>>>>>
>>>>>>> Two APIs are implemented only by arm64:
>>>>>>>     arm_color_dcache_flush_memory_region()  // range flushing
>>>>>>>         Also flushing should be done in a "colored way".
>>>>>>>
>>>>>>>     arm_color_init()                        // hook for the initial=
ization of coloring
>>>>>>>         Reads the parameters (size of the LLC way, base offset for =
the load-remapping operation) needed by coloring. There's also some debuggi=
ng code to autodetect the cache-geometry and determine the size of the way.
>>>>>>>
>>>>>>> Configuration
>>>>>>> -------------
>>>>>>>
>>>>>>> From the configuration point of view, a colored memory region is a =
normal memory region with a color attached. The color is expressed directly=
 in the memory region as color-bitmask and the flag JAILHOUSE_MEM_COLORED i=
s used to identify such a region. Contiguous bits in the bitmask identify a=
 color (region) to be used for the memory region. The size of the mapping d=
oesn't change due to coloring.
>>>>>>>
>>>>>>> For example, with 16 colors, a full way size is selected by 0xffff,=
 while 1/4 of the way size is selected by 0x000f.
>>>>>>>
>>>>>>> (Note: we also experimented with a different version that defined s=
eparate "normal" and "colored" memory regions. The approach presented in th=
is version is more robust.)
>>>>>>>
>>>>>>> Main coloring "loop"
>>>>>>> --------------------
>>>>>>>
>>>>>>> The coloring APIs basically boil down to a loop that appropriately =
selects --according to the color-- the physical addresses where to perform =
a selected operation. The selection is done efficiently with bit operations=
 on the bitmask.
>>>>>>>
>>>>>>> An alternative approach is to hook coloring deep into the mapping f=
unctionalities of the hypervisor. Basically, all low level mapping function=
s support coloring, and the non-colored case becomes the "special case."
>>>>>>> This approach was not followed because to be implemented "cleanly",=
 all the architecture mapping APIs have to be extended to support coloring,=
 but only one-architecture then really implement it.
>>>>>>>
>>>>>>> Instead, the implemented approach to have an additional "coloring" =
API integrates more nicely. Additionally, coloring will be hopefully only a=
 transitory techniques (some years?) that could be eventually replaced by h=
ardware-based techniques (e.g., MPAM). When this happens, removing the addi=
tional coloring API requires less rework than the other approach.
>>>>>>>
>>>>>>>
>>>>>>> Debugging Code
>>>>>>> --------------
>>>>>>>
>>>>>>> The patches also provide a "debugging-only" code that can be activa=
ted by defining CONFIG_DEBUG (it sounded more Jailhouse-oriented than NDEBU=
G). In debugging mode, the coloring provides an autodetection for arm64 cac=
he geometry.
>>>>>>> Additionally, I've added an assert() function that can be used at r=
untime in debugging only contexts (could be used independently from colorin=
g).
>>>>>>>
>>>>>>>
>>>>>>> Feedback and comments welcome.
>>>>>>>
>>>>>>> Best,
>>>>>>> Andrea
>>>>>>>
>>>>>>> Andrea Bastoni (12):
>>>>>>>   arm-common: bitops: add most-significant-bit operation
>>>>>>>   hypervisor, driver, archs: add basic empty infrastructure for col=
oring
>>>>>>>   hypervisor: arm64: add cache coloring implementation
>>>>>>>   hypervisor configuration: hook autodetection for coloring_way_siz=
e
>>>>>>>   configs: arm64: add example configuration for colored ZCU102 inma=
te
>>>>>>>   hypervisor: protect inclusion of control.h
>>>>>>>   hypervisor, driver: add platform information to configure colorin=
g
>>>>>>>     params
>>>>>>>   configs: arm64: hook-in coloring parameters for ZCU102
>>>>>>>   hypervisor: provide runtime assert() helper for DEBUG only
>>>>>>>   hypervisor: provide implementation for __assert_fail() and group
>>>>>>>     panic-related functions
>>>>>>>   hypervisor: coloring: use assert instead of "BUG"
>>>>>>>   hypervisor: coloring: make cache autodetection debug-only
>>>>>>>
>>>>>>> Luca Miccio (2):
>>>>>>>   Documentation: add description and usage of cache coloring suppor=
t
>>>>>>>   pyjailhouse: add support for colored regions
>>>>>>>
>>>>>>>  Documentation/cache-coloring.md               | 198 ++++++++++++++=
++++
>>>>>>>  configs/arm64/zynqmp-zcu102-inmate-demo-col.c |  75 +++++++
>>>>>>>  configs/arm64/zynqmp-zcu102.c                 |   6 +
>>>>>>>  driver/cell.c                                 |  10 +-
>>>>>>>  driver/cell.h                                 |   1 +
>>>>>>>  driver/main.c                                 |  12 ++
>>>>>>>  hypervisor/Makefile                           |   2 +-
>>>>>>>  hypervisor/arch/arm-common/control.c          |   1 +
>>>>>>>  .../arch/arm-common/include/asm/bitops.h      |  10 +
>>>>>>>  .../arch/arm-common/include/asm/dcaches.h     |   8 +
>>>>>>>  hypervisor/arch/arm-common/mmu_cell.c         |  52 +++--
>>>>>>>  hypervisor/arch/arm/control.c                 |   1 +
>>>>>>>  hypervisor/arch/arm/include/asm/coloring.h    |  59 ++++++
>>>>>>>  hypervisor/arch/arm/traps.c                   |   1 +
>>>>>>>  hypervisor/arch/arm64/Kbuild                  |   5 +
>>>>>>>  hypervisor/arch/arm64/cache_layout.c          | 148 +++++++++++++
>>>>>>>  hypervisor/arch/arm64/coloring.c              | 184 ++++++++++++++=
++
>>>>>>>  hypervisor/arch/arm64/control.c               |   1 +
>>>>>>>  .../arch/arm64/include/asm/cache_layout.h     |  21 ++
>>>>>>>  hypervisor/arch/arm64/include/asm/coloring.h  | 137 ++++++++++++
>>>>>>>  hypervisor/arch/arm64/setup.c                 |   3 +
>>>>>>>  hypervisor/arch/arm64/traps.c                 |   1 +
>>>>>>>  hypervisor/arch/x86/amd_iommu.c               |   1 +
>>>>>>>  hypervisor/arch/x86/control.c                 |   1 +
>>>>>>>  hypervisor/arch/x86/efifb.c                   |   1 +
>>>>>>>  hypervisor/arch/x86/include/asm/coloring.h    |  45 ++++
>>>>>>>  hypervisor/arch/x86/ioapic.c                  |   1 +
>>>>>>>  hypervisor/arch/x86/svm.c                     |   1 +
>>>>>>>  hypervisor/arch/x86/vmx.c                     |   1 +
>>>>>>>  hypervisor/control.c                          | 111 ++++------
>>>>>>>  hypervisor/include/jailhouse/assert.h         |  37 ++++
>>>>>>>  hypervisor/include/jailhouse/control.h        |  34 +--
>>>>>>>  hypervisor/include/jailhouse/panic.h          |  40 ++++
>>>>>>>  hypervisor/include/jailhouse/printk.h         |   4 +
>>>>>>>  hypervisor/panic.c                            |  86 ++++++++
>>>>>>>  hypervisor/pci.c                              |   1 +
>>>>>>>  hypervisor/printk.c                           |   1 +
>>>>>>>  hypervisor/uart.c                             |   1 +
>>>>>>>  include/jailhouse/cell-config.h               |  11 +
>>>>>>>  pyjailhouse/config_parser.py                  |   9 +-
>>>>>>>  40 files changed, 1201 insertions(+), 121 deletions(-)
>>>>>>>  create mode 100644 Documentation/cache-coloring.md
>>>>>>>  create mode 100644 configs/arm64/zynqmp-zcu102-inmate-demo-col.c
>>>>>>>  create mode 100644 hypervisor/arch/arm/include/asm/coloring.h
>>>>>>>  create mode 100644 hypervisor/arch/arm64/cache_layout.c
>>>>>>>  create mode 100644 hypervisor/arch/arm64/coloring.c
>>>>>>>  create mode 100644 hypervisor/arch/arm64/include/asm/cache_layout.=
h
>>>>>>>  create mode 100644 hypervisor/arch/arm64/include/asm/coloring.h
>>>>>>>  create mode 100644 hypervisor/arch/x86/include/asm/coloring.h
>>>>>>>  create mode 100644 hypervisor/include/jailhouse/assert.h
>>>>>>>  create mode 100644 hypervisor/include/jailhouse/panic.h
>>>>>>>  create mode 100644 hypervisor/panic.c
>>>>>>>
>>>>>>
>>>>>> Thanks for the update! I assume it's functional and can be used in
>>>>>> tests? Asking as there seems to be a lot of debug code and comments.
>>>>>
>>>>> Yes, it is functional and it can be used for testing. I assumed this =
wasn't the
>>>>> final version, and the debug code + commented out code are still ther=
e in the
>>>>> places where it can be useful to take a look to understand how the ma=
chinery is
>>>>> working.
>>>>>
>>>>> I'm also interested in your point of view regarding having a CONFIG_D=
EBUG option
>>>>> in Jailhouse. Basically a "debugging/development-enabled" version (wi=
th assert()
>>>>> and extra verbose output), and a "production" one.
>>>>>
>>>>>> Scanning through it, I still find it very arm64-centric, rather than
>>>>>
>>>>> It is. As mentioned, I don't know if it is meaningful to have a x86 v=
ersion of
>>>>> the coloring, and for how long there will be the need to have colorin=
g in
>>>>> software. So, the patches try to keep the changes in both hypervisor =
and driver
>>>>> to a minimum.
>>>>
>>>> x86 might not be meaningful for modern CPUs with CAT, but it is anothe=
r
>>>> test case. But I'm also thinking of RISC-V and what else might come al=
ong.
>>>
>>> Coloring in software on x86 might not be trivial. But yes, RISC-V could=
 be a
>>> test case, and maybe there will be some hardware support that can be ex=
ploited
>>> there...
>>>
>>>>>> generically addressing the topic as I pointed out in previous review=
s.
>>>>>> And keeping modifications of the driver minimal is not necessarily a
>>>>>> sign we are on the same page already.
>>>>>
>>>>> We've experimented also with a version that does "more" in the driver=
. I think
>>>>> that more changes in the driver only add complexity. In the end the h=
ypervisor
>>>>> have to distinguish anyway between colored and non-colored mapping, a=
nd
>>>>> scattering the load logic between driver and hypervisor has more main=
tenance
>>>>> effort than a single clean configuration parameter.
>>>>
>>>> You are possibly right, it's just hard for me to follow this as there =
is
>>>> no code or more concrete design to prove that argument.
>>>
>>> I've synched with Luca and Marco, and I've pushed here
>>>
>>> https://gitlab.com/bastoni/jailhouse/-/commits/wip/design/coloring-driv=
er/
>>>
>>> some relevant commits that show how a possible driver-integrated soluti=
on could
>>> look like.
>>>
>>> Note that the "jailhouse_ioremap_col()" function in driver/main.c basic=
ally
>>> replicates the same coloring loop that should also be provided by the h=
ypervisor
>>> to do colored-mapping and how the logic about the "next_colored()" shou=
ld be
>>> "moved-up" to be shared between HV and driver.
>>
>> Need to look into that, so a blind shot: If it's mere replication of
>> logic, a common include with the core functionality can help to avoid
>> duplication. If it's more, this is a point.
>>
>=20
> Finally had the time to study: I don't see a major issue with the

Thank you for checking this.

> jailhouse_ioremap_col replicating the mapping logic the hypervisor does.
> The core logic is in next_colored, and that is shared.
> jailhouse_ioremap_col is a simple loop.
>=20
> However, jailhouse_ioremap_col should be enhanced to a generic
> jailhouse_ioremap that maps also uncolored memory the same way. To my
> understanding, next_colored already returns the next physical page in
> the uncolored case.
>=20
>>>
>>> This non-clean separation, and the fact that the IPA/PA mapping should =
not
>>> belong to the driver, but only to the HV are among the reasons why we m=
oved to
>>> the solution presented in the patch series.
>>
>> If code overall grows massively, it's valid to consolidate in the HV. If
>> it's just about having it somewhere, the driver is the better place.
>>
>=20
> Would be interesting to see the diffstat of the hypervisor with your
> driver coloring extension. The cache layout detection leaves to
> hypervisor, and no new hypercall is added. Should be worth it.

What do you mean here? In the version posted in the patches (the most updat=
ed
version) there is no hypercall. Do you have in mind a cross-over between th=
e two
versions?

What is the objective you would like to achieve from a design point of view=
?

--=20
Thanks,
Andrea Bastoni

--=20
You received this message because you are subscribed to the Google Groups "=
Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/=
jailhouse-dev/65629141-28b5-4153-7547-cfb58b22baff%40tum.de.
