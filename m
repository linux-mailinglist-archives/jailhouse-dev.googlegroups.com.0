Return-Path: <jailhouse-dev+bncBCCMB6PY3AEBBPOD7XUAKGQE5CDMZ2A@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-vk1-xa40.google.com (mail-vk1-xa40.google.com [IPv6:2607:f8b0:4864:20::a40])
	by mail.lfdr.de (Postfix) with ESMTPS id DA3506081A
	for <lists+jailhouse-dev@lfdr.de>; Fri,  5 Jul 2019 16:42:06 +0200 (CEST)
Received: by mail-vk1-xa40.google.com with SMTP id a185sf2507117vkb.0
        for <lists+jailhouse-dev@lfdr.de>; Fri, 05 Jul 2019 07:42:06 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1562337725; cv=pass;
        d=google.com; s=arc-20160816;
        b=VBLwiFPFEAgRVHZUcFO2T2j1I1vPMA8qlLBQpQC3V4dYNPkBZ7fzD73HnjvlOC8zHz
         E3V7mRNolNccotuxTKE3kV5OlAVO6KxEVgvkpLv3LlkXIYkkwxUDAT2rd+cwZXkPGvWL
         jvqOgHZEm1F7vjkB4zJx8+5ZTfojsrGnCxBMHct9cGXnCfyMUJ7oeAmMy3p3qirr64KI
         q0Vn399etKn7IIMOEJg15q4wMUeGN7e/4yr7jpiTPoQDqc55DamUVhtLsbZZo1gAgyGN
         VCGAc4Wr+6kNankddDqpHriEP8YXQb62LBNrW0rTWptokOVxEVLcJpsBLyUXs0p3L140
         d+Vw==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:reply-to:mime-version:message-id
         :date:subject:cc:to:from:dkim-signature;
        bh=yIO9TiwgLoK2FJtSA24WDqqYFkwK/MlJ+k8Squj8fE8=;
        b=y4qJH7molvTbymyH/41sxiuY0kVp22v1qFxwSk7NnXS75iv31aS3nlTVwTH4N3DkPy
         mVsNw84ulu+NUZ/RF4Z5dVJxv4bKRabXWq1LLCRk5/IIhw5NHPrbqNmFNfoU54nYHr9L
         PHs0OyTKrq74sqSsKmGhwdtS3uixGODupAh0BChZRYcPWt8NQcbMCy3hOzDK9Lkza5YN
         gJVUOlRC5IntNAbglIrGYD3FsdkjjieMiM1CfTqvFYZZm1cZ5rhzyuPZ92kWwRX/7oVn
         0GeNs9RbP2miCUVENRI20wRRRlt0FNVaNOnx3a0PK4soaWhvYPuH/aEBzC2aBMUzYF2K
         PVpA==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=Pzxl05Ns;
       spf=pass (google.com: domain of p-yadav1@ti.com designates 198.47.23.248 as permitted sender) smtp.mailfrom=p-yadav1@ti.com;
       dmarc=pass (p=QUARANTINE sp=NONE dis=NONE) header.from=ti.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version:x-original-sender
         :x-original-authentication-results:reply-to:precedence:mailing-list
         :list-id:list-post:list-help:list-archive:list-subscribe
         :list-unsubscribe;
        bh=yIO9TiwgLoK2FJtSA24WDqqYFkwK/MlJ+k8Squj8fE8=;
        b=DrS1MC2kNXE4E80XI6v8S82CQ03LBlbNbJv6qhz8PXSghpIuz8tvQMOqBi/LUxbgA7
         ginfIogV9Sc+GdV4NjWeyop+gJdcgRiD/cuQsyJrIKwEG3O8xmchV02R+Lt1WqKlR86/
         CBWTLSxT5UXItqs7eyUWCxCqyuqXqMQUu+cgfQUCWCiXSo7D98TbeI0DpGGOC43QRc4M
         yUuduN4LkKGY3GJpQl7hCiXKWu8oklqgW/mJ/HF9gN92GgTHeLObxwTq31YMB27wgF2o
         e/kRd3JNnNFItZZZ/hJz7gQaJnygR+LBtTExXG1kGzVIRpqEn5OKlogs+avPsg6KQLKm
         m04A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :x-original-sender:x-original-authentication-results:reply-to
         :precedence:mailing-list:list-id:x-spam-checked-in-group:list-post
         :list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=yIO9TiwgLoK2FJtSA24WDqqYFkwK/MlJ+k8Squj8fE8=;
        b=rBOYk/mcaXQeD0G76CbrIsykuFmTRAe0qnc9UkrzkAOMfNAVBLUtbfDxrTWkfyVnrE
         HD0Oo98F3xMk8c8+OVStCyTnFTc2IvwM0/QmGHTu2wRmS7q4Sq+sGbseh1iGmiabSlYW
         LV3rqBI4sVOd5AooaTvtT1bX7n2VOvgYInIoPOWE3qFXUb5ScAi45Ki5ZsTvuMlYJ/P2
         QyaEc0dwyLkNDx8SZKk9PjDErlE75b3z2qDgR1V1Eeh7ljRRImfALXa6YV4eMmUA80fP
         WGmFahbLbuLUXdUCUvm74KGMvo0wLAsvXz4vM/wzw8eg7nVRnmr0zqvAvgOXSEpZJzk/
         dS+A==
X-Gm-Message-State: APjAAAUa8V0TV812e2Gd350SXtT8b85JkoKfi/b7keO4TYXSkLWJo7lb
	hwe7dzO+zr6Vl6Ti7Rk/nqc=
X-Google-Smtp-Source: APXvYqxnFpZBjtNAC6vZbvjbB5G75rK0yUhiaK4sYIzXvTLDb1s2w5kz8R3JhfnC/c59u3N14V4x5w==
X-Received: by 2002:ab0:69c8:: with SMTP id u8mr2147055uaq.132.1562337725688;
        Fri, 05 Jul 2019 07:42:05 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:ab0:7282:: with SMTP id w2ls354322uao.9.gmail; Fri, 05 Jul
 2019 07:42:05 -0700 (PDT)
X-Received: by 2002:ab0:4744:: with SMTP id i4mr2440332uac.63.1562337725292;
        Fri, 05 Jul 2019 07:42:05 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1562337725; cv=none;
        d=google.com; s=arc-20160816;
        b=oOUOE0B/InjuNkkStbPmM3HpYhiATGQd4tbKSrPcG82J0jdiTgKnJaLYw7NM6BNP3H
         3ajA0+mGCieJCrhpsDWuwew6W3yw2wHapkQhRtxWn/WyV8q3dUXxZBTKXXKODW/flEsJ
         brXcZJ498rdwntRke9V2ArtYo+AcbgmGttBAVwqQiV9rptHRoer1p82P7V3kaH8LdLRj
         IlQFCiBwptEOLZHgrPp+M+60oownsBAbA/idyPE4BqY6KyUUm4M1lyey63DoVA5ADi0a
         f8ixmh4M1rbdXVyBT1+9VCBhxLcLfkbV4UvLXJmpIYXjF6ttVWiRCKg6xa6oLinsD7Js
         Xcyw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=mime-version:message-id:date:subject:cc:to:from:dkim-signature;
        bh=i6nGEZnFCB4v6QfaBHRj7e5nS+VXkzw3pu/aS4Z/pA4=;
        b=FOLrC3NC2y0KOV2SoK0XStfMNu95BSNy5mBB0arOkJrLaSBe5pLXQCn7YjZco5nD1J
         icMYMHldj1/k4d/JYuvZ7nAZjHdC9Twel0xcgM76gYTeIGNG2/NI5wvgW6ACN/mA/zcq
         VY/15ZfwhI0meGxR0t0J46dPgHcuwdnK5IqO7HgB+weSs8HCk6ewfgoX8M5gGFRLMmOA
         sk0Gje39BzljCSxqFGtTSZYsoKvWT6Y+BN+qY5rWd1gz+WIsA80HD3l6ib/uCzWaRpmR
         NwBlq84YwulMmrDdqUbhFVsvO9FSZV452D+rxjXtGKZ1gqe99faKyf80OTq0vak0IHYg
         oa0Q==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=Pzxl05Ns;
       spf=pass (google.com: domain of p-yadav1@ti.com designates 198.47.23.248 as permitted sender) smtp.mailfrom=p-yadav1@ti.com;
       dmarc=pass (p=QUARANTINE sp=NONE dis=NONE) header.from=ti.com
Received: from lelv0143.ext.ti.com (lelv0143.ext.ti.com. [198.47.23.248])
        by gmr-mx.google.com with ESMTPS id u189si103895vkb.2.2019.07.05.07.42.05
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 05 Jul 2019 07:42:05 -0700 (PDT)
Received-SPF: pass (google.com: domain of p-yadav1@ti.com designates 198.47.23.248 as permitted sender) client-ip=198.47.23.248;
Received: from lelv0266.itg.ti.com ([10.180.67.225])
	by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id x65Eg4rB078986;
	Fri, 5 Jul 2019 09:42:04 -0500
Received: from DLEE104.ent.ti.com (dlee104.ent.ti.com [157.170.170.34])
	by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id x65Eg4rF107332
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Fri, 5 Jul 2019 09:42:04 -0500
Received: from DLEE104.ent.ti.com (157.170.170.34) by DLEE104.ent.ti.com
 (157.170.170.34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5; Fri, 5 Jul
 2019 09:42:04 -0500
Received: from lelv0326.itg.ti.com (10.180.67.84) by DLEE104.ent.ti.com
 (157.170.170.34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5 via
 Frontend Transport; Fri, 5 Jul 2019 09:42:04 -0500
Received: from pratyush-laptop.india.ti.com (ileax41-snat.itg.ti.com [10.172.224.153])
	by lelv0326.itg.ti.com (8.15.2/8.15.2) with ESMTP id x65Eg1nx067904;
	Fri, 5 Jul 2019 09:42:02 -0500
From: "'Pratyush Yadav' via Jailhouse" <jailhouse-dev@googlegroups.com>
To: <jailhouse-dev@googlegroups.com>, Jan Kiszka <jan.kiszka@siemens.com>
CC: Lokesh Vutla <lokeshvutla@ti.com>, Sekhar Nori <nsekhar@ti.com>,
        William
 Mills <wmills@ti.com>, Nikhil Devshatwar <nikhil.nd@ti.com>,
        Pratyush Yadav
	<p-yadav1@ti.com>
Subject: [PATCH v2 0/6] arm64: iommu: Add support for SMMUv3 stage 1 and 2
Date: Fri, 5 Jul 2019 20:12:19 +0530
Message-ID: <20190705144225.7126-1-p-yadav1@ti.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
X-Original-Sender: p-yadav1@ti.com
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass
 header.i=@ti.com header.s=ti-com-17Q1 header.b=Pzxl05Ns;       spf=pass
 (google.com: domain of p-yadav1@ti.com designates 198.47.23.248 as permitted
 sender) smtp.mailfrom=p-yadav1@ti.com;       dmarc=pass (p=QUARANTINE sp=NONE
 dis=NONE) header.from=ti.com
X-Original-From: Pratyush Yadav <p-yadav1@ti.com>
Reply-To: Pratyush Yadav <p-yadav1@ti.com>
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

Hi,

This series adds support for SMMUv3. Stream IDs have been added to the
cell config and they need to be specified in the config before a cell
can use a stream.

The SMMU driver exposes an emulated SMMU to the guests cells by trapping
access to the MMIO registers. This is not emulation in the sense that we
fully emulate the device top to bottom. The emulation is used to provide an
interface to the SMMU that the hypervisor can control to make sure the
inmates are not doing anything they should not. The actual translations
are done by hardware.

The IOMMU definition has been generalised. The AMD and Intel IOMMU
drivers have been updated to use this definition. I am not very familiar
with these drivers, so please do take a look to make sure the changes
are correct and don't create any unwanted problems.

Limitations are mentioned in the 5th patch and work left in the 6th
patch.

v2:
Address comments from Jan:
- Re-add iommu_count_units().
- Remove the union from jailhouse_iommu.
- Update the config generator and template.
- Return errors in AMD and VT-D drivers when we encounter an IOMMU of
  different type.
- Make stream_ids a resizeable array.
- Drop patch "core: Move unit initialization after memory
  initialization"
- Split the SMMU driver in two parts.
- Wrap all stage 1 emulation in a compile-time switch.

Lokesh Vutla (1):
  arm64: iommu: smmu-v3: Add support for smmu v3 configuration from
    config files

Nikhil Devshatwar (3):
  iommu: x86: Generalize iommu definition
  arm-common: Introduce iommu functionality
  core: Add stream id list in the cell config

Pratyush Yadav (2):
  arm64: iommu: smmu-v3: Add data structure initialization and stage 2
    for SMMUv3
  arm64: iommu: smmu-v3: Add support for stage 1 translations

 configs/x86/f2a88xm-hd3.c                     |    1 +
 configs/x86/qemu-x86.c                        |    1 +
 hypervisor/arch/arm-common/Kbuild             |    2 +-
 hypervisor/arch/arm-common/control.c          |    6 +
 hypervisor/arch/arm-common/include/asm/cell.h |    4 +
 .../arch/arm-common/include/asm/iommu.h       |   35 +
 hypervisor/arch/arm-common/iommu.c            |   40 +
 hypervisor/arch/arm-common/mmu_cell.c         |   25 +
 hypervisor/arch/arm64/Kbuild                  |    2 +-
 hypervisor/arch/arm64/smmu-v3.c               | 2028 +++++++++++++++++
 hypervisor/arch/x86/amd_iommu.c               |    9 +-
 hypervisor/arch/x86/vtd.c                     |    2 +
 hypervisor/include/jailhouse/control.h        |    1 +
 hypervisor/include/jailhouse/entry.h          |    1 +
 hypervisor/setup.c                            |    2 +-
 include/jailhouse/cell-config.h               |   25 +-
 pyjailhouse/sysfs_parser.py                   |    2 +
 tools/jailhouse-cell-linux                    |    5 +-
 tools/jailhouse-hardware-check                |    2 +-
 tools/root-cell-config.c.tmpl                 |    1 +
 20 files changed, 2181 insertions(+), 13 deletions(-)
 create mode 100644 hypervisor/arch/arm-common/include/asm/iommu.h
 create mode 100644 hypervisor/arch/arm-common/iommu.c
 create mode 100644 hypervisor/arch/arm64/smmu-v3.c

-- 
2.17.1

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/20190705144225.7126-1-p-yadav1%40ti.com.
For more options, visit https://groups.google.com/d/optout.
