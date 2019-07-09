Return-Path: <jailhouse-dev+bncBCCMB6PY3AEBBHFWSLUQKGQEPSQHSLA@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-oi1-x240.google.com (mail-oi1-x240.google.com [IPv6:2607:f8b0:4864:20::240])
	by mail.lfdr.de (Postfix) with ESMTPS id A5BDB63739
	for <lists+jailhouse-dev@lfdr.de>; Tue,  9 Jul 2019 15:48:14 +0200 (CEST)
Received: by mail-oi1-x240.google.com with SMTP id l5sf7649416oih.3
        for <lists+jailhouse-dev@lfdr.de>; Tue, 09 Jul 2019 06:48:14 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1562680093; cv=pass;
        d=google.com; s=arc-20160816;
        b=F41OKlDWv9d4d/0apsfwttMrxbwLJCQeZKStdBBUctaB5+611bYzSwdnF8IfpM8e2c
         WpwXNmfvKRncGhgAvrvjnxLgyDJtj1YfWdIrk58s+upj3/Uc8xfS75X0zTAtEir2l2w5
         5U16MhOA3swjrnB8OPY5EMFvq3pC+QG0ZExcNdUQCjlmlq+BFUtJxwpvaecBP+nzpq/Z
         AnrPhg+6vgvvOYZUPK42iZk15Qy2r3dzCmxgF8dp7jyvIP7FvHwc6AW8TZ5XNm4d7OzH
         pCi9xMwF4YrYTqhmcoh3jX0aChOQpeciHALuk+nIPqXMVkdK/lD3Rz2JS4y2O12ZZ0gC
         x8Jg==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:reply-to:mime-version:message-id
         :date:subject:cc:to:from:dkim-signature;
        bh=lw5ErCNDKSXw1A3ytqV3P94gwu2wxakPxQmUte7ZvDI=;
        b=uwwQ3seyH8C1RNtvH3EIbAJV6Rrm5nirZtnCYXdl8l9cwfrC6s7QViDn0CZ4x0qDyT
         AoF63LeAiBEKbEAnQmYG1vsc6GK/UTXl0sKsRshyGTSwhR27Sc5rzw4tzOYq8vj9ObfI
         jMZDPUZh5o3bx0uEww5hEiHtqbvPIe5CxhDlJJZAPXAvqUlaYFFOAQBtSf4GaOA3L34t
         wra7xMHnaH78W3pSBN0TjFP7oBxHrGSeCAqjiqMS0H8mMHJAAj45IYdcSgOtIfv7z+2G
         jdSa/5QqRy9NOFrpoFC9TznnmQHipsqMdQbJhxmidfj21wVwFmJ2KilZVNpvGWQMHhwU
         yrcA==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=KiMtEVHj;
       spf=pass (google.com: domain of p-yadav1@ti.com designates 198.47.23.249 as permitted sender) smtp.mailfrom=p-yadav1@ti.com;
       dmarc=pass (p=QUARANTINE sp=NONE dis=NONE) header.from=ti.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version:x-original-sender
         :x-original-authentication-results:reply-to:precedence:mailing-list
         :list-id:list-post:list-help:list-archive:list-subscribe
         :list-unsubscribe;
        bh=lw5ErCNDKSXw1A3ytqV3P94gwu2wxakPxQmUte7ZvDI=;
        b=UsEYQooAbcQ5WxBjDHB8UlK1UiOE9YsQMLRCWBQ+j7Yzv5drPYsW9F/yWR5W4Px8Gy
         H6Om2otByriIw7Bu63u1/azhS9Nh7yx2OZHH/AmXAg+QEPWcha2mXYPHwpUIfDKwbYi4
         RsfZfiH05v4twuBz9Jtk931HlNF1Mzc2V9pk4zuP0e5hjOWAlMK4LTN+K2g2hqLN96sm
         OmMWjazevLccaf2qqdoSLPrM9Q+wUtGff8L5uLXmRvaz5LiPyEhVtwfd9A7P2QXDtXSi
         Hse0LzK68ZbkV9Bc6zdYAzHDLYOgtz2BpoIf4iRCdWXpBAnfMYaMYzwoTa8S6yiN+oNR
         qGgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :x-original-sender:x-original-authentication-results:reply-to
         :precedence:mailing-list:list-id:x-spam-checked-in-group:list-post
         :list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=lw5ErCNDKSXw1A3ytqV3P94gwu2wxakPxQmUte7ZvDI=;
        b=tVcczk0BXfSL12g78CqdvHIc3gZqNHT1XgrTbMopcU3KTU6PlaZ60yhC6FvbNPZFGP
         s3mCtxcqGe5EvlEqJH2j7OQYvJQR6hLcXzBMuwryIU7d6IyXlg/hY762ALBUnrJ4HyGw
         KjGqMVMz/Buj8sLDOJPUj8ik6/VqiR81cHaRp6Xoc7pgQkTx9H4GETfF30RP6sD+WPV2
         FJJ+4ZSqmPK8UQVy+4R/bM3huTtYvV7G39HrRKrWy1fYKAdCJSHXyQRXVNvZeZNPaSsF
         Tg1kLM8c6xS1K4y3YavHVEKFBSOKVJQBMuzLhiXG7aziG40dBMBg486seSNReiIO4Yob
         RfXA==
X-Gm-Message-State: APjAAAV5vDK1DYEM05qxQDj5QCUFFH3M/hgUhqXgJnnKS8LE9bBNf+4v
	XMG07xZ3nFUVMOxq7vBheJk=
X-Google-Smtp-Source: APXvYqz7PKZvLbZ7A3uyDerpDDPVQD4cd1b0NJ34K1TssFkYV5dZiPD3S4SL1uG7ZTHoszAyqDBPZA==
X-Received: by 2002:aca:5f46:: with SMTP id t67mr77320oib.42.1562680093246;
        Tue, 09 Jul 2019 06:48:13 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a9d:3ea:: with SMTP id f97ls606132otf.5.gmail; Tue, 09 Jul
 2019 06:48:12 -0700 (PDT)
X-Received: by 2002:a9d:6204:: with SMTP id g4mr19670678otj.40.1562680092507;
        Tue, 09 Jul 2019 06:48:12 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1562680092; cv=none;
        d=google.com; s=arc-20160816;
        b=PX/uOFG2WgKxkSS+ZAZV/obPhawhS6luoWf37Dp5OWXjD4afT7aaHXVQIIwTp4gz+r
         aNrx1XqMV2w0cEwfVZmX330l8OeGrO+nMIMFQ3lpjjmlyTiaZbPP4Z6Wc0PgEJ/98czA
         clUhT8qhgIkCRxuBbPKplR/m5ZwzqLe5lLJmL4TsJM2L0LO0TBQE9cnPmfjsGQgWWZfQ
         v33OJYMfZ19wvT+FnTP9Wmnl6h2Dt8IelCKAIviNMrtHtPK+G8ebHec2tHV5/nZt2U4K
         rTSALNoi5LqjLC0b3ZLejnhZ0Vlow/onCx+PVOolhYDNTXTTxnTWF9pUOgQx5RxdAYzr
         o/kw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=mime-version:message-id:date:subject:cc:to:from:dkim-signature;
        bh=xrP/49FNPRzLqsnUYXuuzkZV7pROV290G7vjH+Tq8q8=;
        b=dGwT23BDKj7gOCb8QS/8rjdeFCWs/DUzwgFuHW9Sv6rPxElhlRIgjkI4ReXT8bwlHv
         RIaRg6qZYJjFI5QvhqEsMycT7+zl6jHhXtAtHkJXMGFtj3slqIsPkTdG36CN6DuoDaT3
         YB32ULzgZgVuJ95IHPwPADJ3y1BH5q1Zn0ZU3jDMNTnXi9Y0CqO9L/we0utgpmgAqNY6
         KyRvb00WbI5tGixrtgPOK+WGdHt7B70WtkHG/WxX6nV7C45umktMHf27jK6aQvkIyoIK
         Bu0iff4bhSuJxF4wCsEhlAzZBb/OmunHdbY/RAbhY3ePacLdHhDDDTZCdm1TRjZU2gAf
         5GKg==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=KiMtEVHj;
       spf=pass (google.com: domain of p-yadav1@ti.com designates 198.47.23.249 as permitted sender) smtp.mailfrom=p-yadav1@ti.com;
       dmarc=pass (p=QUARANTINE sp=NONE dis=NONE) header.from=ti.com
Received: from lelv0142.ext.ti.com (lelv0142.ext.ti.com. [198.47.23.249])
        by gmr-mx.google.com with ESMTPS id u26si1214804otj.3.2019.07.09.06.48.12
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 09 Jul 2019 06:48:12 -0700 (PDT)
Received-SPF: pass (google.com: domain of p-yadav1@ti.com designates 198.47.23.249 as permitted sender) client-ip=198.47.23.249;
Received: from lelv0265.itg.ti.com ([10.180.67.224])
	by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id x69DmCjU066828;
	Tue, 9 Jul 2019 08:48:12 -0500
Received: from DLEE111.ent.ti.com (dlee111.ent.ti.com [157.170.170.22])
	by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id x69DmCeB026017
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Tue, 9 Jul 2019 08:48:12 -0500
Received: from DLEE107.ent.ti.com (157.170.170.37) by DLEE111.ent.ti.com
 (157.170.170.22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5; Tue, 9 Jul
 2019 08:48:11 -0500
Received: from lelv0326.itg.ti.com (10.180.67.84) by DLEE107.ent.ti.com
 (157.170.170.37) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5 via
 Frontend Transport; Tue, 9 Jul 2019 08:48:11 -0500
Received: from pratyush-laptop.india.ti.com (ileax41-snat.itg.ti.com [10.172.224.153])
	by lelv0326.itg.ti.com (8.15.2/8.15.2) with ESMTP id x69Dm9Ox107982;
	Tue, 9 Jul 2019 08:48:09 -0500
From: "'Pratyush Yadav' via Jailhouse" <jailhouse-dev@googlegroups.com>
To: <jailhouse-dev@googlegroups.com>, Jan Kiszka <jan.kiszka@siemens.com>
CC: Lokesh Vutla <lokeshvutla@ti.com>, Sekhar Nori <nsekhar@ti.com>,
        William
 Mills <wmills@ti.com>, Nikhil Devshatwar <nikhil.nd@ti.com>,
        Pratyush Yadav
	<p-yadav1@ti.com>
Subject: [PATCH v3 0/6] arm64: iommu: Add support for SMMUv3 stage 1 and 2 translations
Date: Tue, 9 Jul 2019 19:18:30 +0530
Message-ID: <20190709134836.10485-1-p-yadav1@ti.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
X-Original-Sender: p-yadav1@ti.com
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass
 header.i=@ti.com header.s=ti-com-17Q1 header.b=KiMtEVHj;       spf=pass
 (google.com: domain of p-yadav1@ti.com designates 198.47.23.249 as permitted
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

v3:
- Address comments from Jean. Details in patch 5.
- Rename CONFIG_SMMUV3 to CONFIG_SMMUV3_STAGE1.
- Some minor fixes mentioned in 5th patch.

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
 hypervisor/arch/arm64/smmu-v3.c               | 2086 +++++++++++++++++
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
 20 files changed, 2239 insertions(+), 13 deletions(-)
 create mode 100644 hypervisor/arch/arm-common/include/asm/iommu.h
 create mode 100644 hypervisor/arch/arm-common/iommu.c
 create mode 100644 hypervisor/arch/arm64/smmu-v3.c

-- 
2.17.1

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/20190709134836.10485-1-p-yadav1%40ti.com.
For more options, visit https://groups.google.com/d/optout.
