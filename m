Return-Path: <jailhouse-dev+bncBCJI7SMNV4NBBONX5D5QKGQEH2JVOHA@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-ej1-x63e.google.com (mail-ej1-x63e.google.com [IPv6:2a00:1450:4864:20::63e])
	by mail.lfdr.de (Postfix) with ESMTPS id BFE4C282CAA
	for <lists+jailhouse-dev@lfdr.de>; Sun,  4 Oct 2020 21:00:09 +0200 (CEST)
Received: by mail-ej1-x63e.google.com with SMTP id e13sf2394186ejk.1
        for <lists+jailhouse-dev@lfdr.de>; Sun, 04 Oct 2020 12:00:09 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1601838009; cv=pass;
        d=google.com; s=arc-20160816;
        b=HJerxI/ZVitSE7a/D+x3mYw0ibTkIQA6lhH+jIJwsLCd3Hru6NXmuaj/vAo/JVoj4Y
         JkN2d4cAWJPfoZVGbk0bFGJYwBE00ZK6B3kXmjG4lU6LMg7oflNnSREz6dCqQv8gi6Dw
         NPo7EinOFAG0VhJXxxPdsGqZ/JIWmUewhJpao3YgW58OmSp1332W2CydVNdXTFt/UED3
         1G807vJhi2oGIkYhXOC8VSe7Y7+PA2aGY0FEguDlLO6gfBh3VPI6JkX7i83drZW6AbsS
         vAi/9ng8L377rKpBtOTdQQchiOMh/1l/ObWwtSKI79hOZR45g3VOxbYVSlmNdPeLKAiI
         eY9w==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:mime-version:message-id:date
         :subject:cc:to:from:sender:dkim-signature;
        bh=RLTgpTfizJn5X+jWNU7ZxVMrqB5SpKM1DmuypqqgnE0=;
        b=OR/WDMtDso1i6vuYlmsAgKzh1GwWq8qIs7AmN28bXPkY+plDZwSmTyVznyBDWss23/
         1gyTnzDc2iz+e1b+DASI3zwH6cWdJnWMOkAilePCNzQPzTFMG+2P2iLxgUTptEnieXvp
         91T4rytX6hbS5mfcw5I1HAFIrA7bwTmU1W+3UzUj7xqcFfhaf15M4/c/Fg1WxZarR/JB
         czAlolwJU7N96ThIMlKlAdySV+C7ntkjuW2GcOGQ3ImaBNryaYNkKEoe0R2LW5chMx6x
         7Xhq1ZGGnCxGG5a8Rz7o10WQjn+Z/f9Zv1RKWUJ4ggmDYyvFY5dldCqMZpxvzJ1oN+aD
         Tz9Q==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.2 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:from:to:cc:subject:date:message-id:mime-version
         :x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=RLTgpTfizJn5X+jWNU7ZxVMrqB5SpKM1DmuypqqgnE0=;
        b=OnU1wOQ/Fjen5bODzWqkAiUv9gwxDA+yXzHrkTlyNKJONbnZSL3Jc6G2e2uDlNuvuB
         mMs2JJJFQVAa9IxIsDgoA008gwJ/nFWq0d9ZQAWk6ZV3n4Nz2fbZr/3/RwpmBTTALB+E
         hmipMzrzyirC9ZoAPgo4jalJ4ygHJ/BjmetxJeiEAvxvMLXGHPtOKhNbAyVhbsJVfgLg
         X8pjNd7X1juNWCLxgzf2lGfP9bGrCiDVRXO9lEZLXPPh2x/FvD2549g3hdKO5U0i/amD
         Mvvl3+QLqIOC9AEhGLwTnEf44kRB4wGfx0l1hseY7desjiTkIkcguU4qJ5w5cM9WrZza
         Vvzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:from:to:cc:subject:date:message-id
         :mime-version:x-original-sender:x-original-authentication-results
         :precedence:mailing-list:list-id:x-spam-checked-in-group:list-post
         :list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=RLTgpTfizJn5X+jWNU7ZxVMrqB5SpKM1DmuypqqgnE0=;
        b=dhIcrnI0IJ4AcI4ZBNsXxOvpSfYsZP6yqYnwum5UaEcheuRBhu/nHkxPDo5b6V0qag
         CiW2QOFhQoNltA2AhOFQ9bkcjnsAZnkqTZhQ0w52akqym7KVLkHNjgqzMY8BT/nc4ELZ
         4+Dt99NHyFFexQx0z3SqJUWjf44WpKAywegw+9uqvgm4/zau72GzaJ/zXuEa4kcmX3Vt
         d0GLAsz1oqa9G25yCqVolD7vHroTrVRR27PM1N9SOuBLaNhb8ivyb56ROZgiefw2NgmZ
         maIS7emDuW6+BOhxw0+B1yfvroO3vdiY2F2gSM6FK6tWftuZeVmQeh7FBAf0PTlxYhI6
         o1bg==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AOAM53021DFy3SJRkfp4Ees6O64jx2v+9qQydIEvEaOxE+TfVLwt1zwT
	gSebd/EJv5IR0XoHULfX8IU=
X-Google-Smtp-Source: ABdhPJzhFAGQOLfPiA+DABZYTWvpln7DB+5IyX7JZTiE/UXVWeHjV2yErbnA+wbX1WXEoefANmvxmg==
X-Received: by 2002:a17:906:2681:: with SMTP id t1mr12408546ejc.474.1601838009474;
        Sun, 04 Oct 2020 12:00:09 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a05:6402:160e:: with SMTP id f14ls2093460edv.2.gmail; Sun,
 04 Oct 2020 12:00:08 -0700 (PDT)
X-Received: by 2002:aa7:d7ce:: with SMTP id e14mr1673854eds.258.1601838008305;
        Sun, 04 Oct 2020 12:00:08 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1601838008; cv=none;
        d=google.com; s=arc-20160816;
        b=ojBhuPGXiL317sQehcf/YLoqVPysugUhXWE84hrneUt4uH8HowwoXU/9XC/909rPfU
         W+4O7fhJlLDoG4f3zA6HDyhIXMvaRBJXiIfrxDG3q1VaqEVHjSIA+nRKMPcExIpY+XBO
         GabUVnswSNYh2Hmsve4/VCFK62JVcqqQGoBItmUfh1jPqElWO0QUXehM+k/nYZIqgO1F
         dC7yqhmzhqBZPfNp8OCl3Nt66UaviXmcwnwv6NVZ97FR5HjQQrndqxwuMS4anYBlVQGN
         vgB4lGagigvCN9mHOL4brmA7z6gpfAVzEzTOPOEsWEOMHZOTCuB/udAfSNa6s/Tf9Kqf
         s+nQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from;
        bh=tbWvWqjptJpD9xyoeSyooI/0jdTjEJOQx+RWgx05/J4=;
        b=Vp6/sh995Wf5XpnRoajhvWN16pJ6tvTqowPJAebAHWgOhckcbXfRRsO9P8CSZEPb5M
         fvsbNg3cCTTH9NHLM0B30G1gCiAe4nuMNc61Ky7ax/MNa7Zm6qBq8CRajRBDdiunH+na
         urezCW7I4wOsbVuzhzb4DF5VtFa8tyxUbBDIepdIbabbb4wBHyzmfFLb6Hql5POt/Gc7
         ATxtAFq3wHsQMhZxi6iFF+0PwHcujdB4NSYsFYtX6hOTC9/UyW09Qg0tAjLjzxEmfsf9
         iB3Bkf3T7Y2xwQpnGHS8yuflkwrUWLkXQe2LOM6H+sPGSNLqyJ50PSHl23MW5Ixo3Gh9
         H3pw==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.2 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
Received: from thoth.sbs.de (thoth.sbs.de. [192.35.17.2])
        by gmr-mx.google.com with ESMTPS id dk15si271223edb.2.2020.10.04.12.00.08
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Sun, 04 Oct 2020 12:00:08 -0700 (PDT)
Received-SPF: pass (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.2 as permitted sender) client-ip=192.35.17.2;
Received: from mail2.sbs.de (mail2.sbs.de [192.129.41.66])
	by thoth.sbs.de (8.15.2/8.15.2) with ESMTPS id 094J0703020293
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Sun, 4 Oct 2020 21:00:07 +0200
Received: from md1f2u6c.ad001.siemens.net ([167.87.242.108])
	by mail2.sbs.de (8.15.2/8.15.2) with ESMTP id 094J060C017503;
	Sun, 4 Oct 2020 21:00:07 +0200
From: Jan Kiszka <jan.kiszka@siemens.com>
To: jailhouse-dev@googlegroups.com
Cc: Alice Guo <alice.guo@nxp.com>, Peng Fan <peng.fan@nxp.com>
Subject: [PATCH 00/45] arm64: Rework SMMUv2 support
Date: Sun,  4 Oct 2020 20:59:21 +0200
Message-Id: <cover.1601838005.git.jan.kiszka@siemens.com>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
X-Original-Sender: jan.kiszka@siemens.com
X-Original-Authentication-Results: gmr-mx.google.com;       spf=pass
 (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.2 as
 permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;       dmarc=pass
 (p=NONE sp=NONE dis=NONE) header.from=siemens.com
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

That wasn't the plan when I started, but the more I dug into the details
and started to understand the hardware, the more issues I found and the
more dead code fragments from the Linux usage became visible.

Highlights of the outcome:
 - Fix stall of SMMU due to unhandled stalled contexts (took me a while
   to understand that...)
 - Fix programming of CBn_TCR and TTBR
 - Fix TLB flush on cell exit
 - Fix bogus handling of Extended StreamID support
 - Do not pass-through unknown streams
 - Disable SMMU on shutdown
 - Reassign StreamIDs to the root cell
 - 225 insertions(+), 666 deletions(-)

The code works as expected on the Ultra96-v2 here, but due to all the
time that went into the rework, I had no chance to bring up my MX8QM so
far. I'm fairly optimistic that things are not broken there as well, but
if they are, bisecting should be rather simple with this series. So
please test and review.

Jan


CC: Alice Guo <alice.guo@nxp.com>
CC: Peng Fan <peng.fan@nxp.com>

Jan Kiszka (45):
  configs: arm64: Add SMMU configuration for Ultra96
  arm64: Introduce cpu_parange_encoded
  arm64: Simplify get_cpu_parange, add 52-bit case
  arm64: smmu: Deny transfers by default
  arm64: smmu: Drop test for non-zero base address
  arm64: smmu: Drop useless features initialization
  arm64: smmu: Clean up arm_smmu_find_sme parameters
  arm64: smmu: Refactor smmu device setup and usage
  arm64: smmu: Fold arm_smmu_free_sme into single caller
  arm64: smmu: Replace for_each_smmu_sid with for_each_stream_id
  arm64: smmu: Make sCR0 write-only
  arm64: smmu: Add shutdown handler
  arm64: smmu: Tune output
  arm64: smmu: Remove IRPTNDX traces
  arm64: smmu: Remove bogus Extended StreamID support fragments
  arm64: smmu: Drop unneeded includes
  arm64: smmu: Do not stall failing context transaction
  arm64: smmu: Move S2CR macro out of sysregs.h
  arm64: smmu: Refactor S2CR handling
  arm64: smmu: Simplify VMID and CBNDX allocation
  arm64: smmu: Drop write-only pgsize_bitmap
  arm64: smmu: Drop write-only va_size field
  arm64: smmu: Demand aarch64-4K paging, drop probing of unused formats
  arm64: smmu: Fix CBn_TCR initialization
  arm64: smmu: Drop coherency reporting
  arm64: smmu: Drop stream-match feature recording
  arm64: smmu: Drop 16-bit VMID feature
  arm64: smmu: Drop dead ARM_SMMU_OPT_SECURE_CFG_ACCESS
  arm64: smmu: Drop dead arm_smmu_test_smr_masks
  arm64: smmu: Fix TLB flush on cell exit
  arm64: smmu: Disable context bank only once on cell exit
  arm64: smmu: Introduce arm_smmu_disable_context_bank
  arm64: smmu: Refactor ID0 evaluation
  arm64: smmu: Refactor ID1 evaluation
  arm64: smmu: Refactor ID2 evaluation
  arm64: smmu: Check IAS and OAS against CPU parange
  arm64: smmu: Refactor ID7 evaluation
  arm64: smmu: Demand version 2
  arm64: smmu: Drop more unused fields from arm_smmu_device
  arm64: smmu: Catch VMID exhaustion
  arm64: smmu: Rename ARM_SMMU_CB_TTBCR, drop unused
    ARM_SMMU_CB_CONTEXTIDR
  arm64: smmu: Fix CNn_TTBR construction
  arm64: smmu: Stop caching context bank states
  arm64: smmu: Clean up arm_smmu_tlb_sync_global further
  arm64: smmu: Return StreamIDs on cell destruction to the root cell

 configs/arm64/ultra96.c                     |  15 +
 hypervisor/arch/arm64/include/asm/paging.h  |  21 +-
 hypervisor/arch/arm64/include/asm/sysregs.h |   7 -
 hypervisor/arch/arm64/paging.c              |  30 +-
 hypervisor/arch/arm64/smmu.c                | 830 +++++---------------
 5 files changed, 239 insertions(+), 664 deletions(-)

-- 
2.26.2

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/cover.1601838005.git.jan.kiszka%40siemens.com.
